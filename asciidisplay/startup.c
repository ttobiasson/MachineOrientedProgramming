/*
 * 	startup.c
 *
 */
 
#define PORT_BASE_E 0x40021000
		/* Definiera word-adresser för initiering*/
#define PORT_MODER 		((volatile unsigned int*)PORT_BASE_E)
#define PORT_MODER_LH 	((volatile unsigned char*)PORT_BASE_E+0x01)
#define PORT_OTYPER 	((volatile unsigned int*) PORT_BASE_E+0x04)
#define PORT_OSPEEDR    ((volatile unsigned int*) PORT_BASE_E+0x08)
#define PORT_PUPDR  	((volatile unsigned int*) PORT_BASE_E+0x0C)
		/*Definiera byte-adresser för data och styrregister*/
#define PORT_IDR_LOW 	((volatile unsigned char*) PORT_BASE_E+0x10)
#define PORT_IDR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x10)
#define PORT_ODR_LOW  	((volatile unsigned char*) PORT_BASE_E+0x14)
#define PORT_ODR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x15)
		/*Definiera lämpliga definitioner för de olika bitarna i styrregistret*/
#define B_E 		0x40	/*ENABLE SIGNAL*/
#define B_SELECT 	0x04	/*SELECT ASCII-DISPLAY*/
#define B_RW 		0x02		/* 0 = writem, 1 = read*/
#define B_RS 		0x01		/* 0 = control, 1 =data*/
		/*STK DELAY*/
#define STK_CTRL ((volatile unsigned int*)(0xE000E010))
#define STK_LOAD ((volatile unsigned int*)(0xE000E014))
#define STK_VAL  ((volatile unsigned int*)(0xE000E018))
 
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

void init_app(void){
	*PORT_MODER 	=0x55555555;
	*PORT_OTYPER 	=0x00000000;
    *PORT_OSPEEDR   =0x55555555;
}
void delay_250ns(void){
    *STK_CTRL = 0;
    *STK_LOAD = ((168/4)-1);
    *STK_VAL  = 0;
    *STK_CTRL = 5;
    while( (*STK_CTRL & 0x10000)== 0){}
    *STK_CTRL = 0;
}
void delay_micro(unsigned int us){
    while(us--){
        delay_250ns();
        delay_250ns();
        delay_250ns();
        delay_250ns();
    }
}
void delay_milli(unsigned int ms){
    while(ms--){
        delay_micro(10);
    }
    
}
void ascii_ctrl_bit_set( unsigned char x){
    *PORT_ODR_LOW |= (B_SELECT | x);
}

void ascii_ctrl_bit_clear(unsigned char x){
    *PORT_ODR_LOW &= (B_SELECT | ~x);
}
void ascii_write_controller( unsigned char command ){
	delay_250ns();
    ascii_ctrl_bit_set( B_E );		// Synchronization signal =1
    *PORT_ODR_HIGH = command;		// Ger kommandot till porten
	delay_250ns();
    ascii_ctrl_bit_clear( B_E );	// Stänger av synchronization.
    delay_250ns();
}
unsigned char ascii_read_controller( void ){
	unsigned char RV;
	ascii_ctrl_bit_set( B_E );
	delay_250ns();
	delay_250ns();
	RV = *PORT_IDR_HIGH;
	ascii_ctrl_bit_clear( B_E );
	return RV;
}
void ascii_write_cmd ( unsigned char command){
    ascii_ctrl_bit_clear(B_RS);
    ascii_ctrl_bit_clear(B_RW);
    ascii_write_controller(command);
}
void ascii_write_data (unsigned char data){
    ascii_ctrl_bit_clear(B_RW);
    ascii_ctrl_bit_set(B_RS);
    ascii_write_controller(data);
}
unsigned char ascii_read_status(){
	unsigned char RV;
	*PORT_MODER_LH = 0x00;   		//GÖR OM PORTAR 8-15 TILL INGÅNGAR
	ascii_ctrl_bit_clear( B_RS );  	//NOLLSTÄLL READ/ SET
	ascii_ctrl_bit_set( B_RW );   	// ETT STÄLL READ/WRITE
	RV = ascii_read_controller();
	*PORT_MODER_LH = 0x55;    		//GÖR OM PORTEN TILL UTGÅNGAR
	return RV;
}
unsigned char ascii_read_data(void){
    unsigned char RV;
    *PORT_MODER_LH = 0x00;
    ascii_ctrl_bit_set(B_RS);
    ascii_ctrl_bit_set(B_RW);
    RV = ascii_read_controller();
    *PORT_MODER_LH = 0x55;
	return RV;
}
void ascii_command(unsigned char command){
	while ((ascii_read_status() & 0x80) == 0x80) {}
	delay_micro(8);
	ascii_write_cmd(command);
	delay_milli(2);
}
void ascii_write_char(unsigned char c){
	while ((ascii_read_status() & 0x80) == 0x80) {}
	delay_micro(8);
	ascii_write_data(c);
	delay_micro(43);
}
void ascii_gotoxy(int x, int y){
	unsigned char adress = x-1;
	if (y == 2)
		adress += 0x40;
	ascii_write_cmd(0x80 | adress);
}
void ascii_init(void){
    ascii_command(0x38);	//Function set
	ascii_command(0x0E);	//Display control
	ascii_command(0x01);	//Clear Display
	ascii_command(0x06);	//Entry mode set
}
int main(void){
	char *s;
	char test1[] = "Alfanumerisk ";
	char test2[] = "Display - test";
	  
	init_app();
	ascii_init();
	ascii_gotoxy(1,1);
	s = test1;
	
	while(*s)
		ascii_write_char(*s++);
	ascii_gotoxy(1,2);
	s = test2;
	
	while(*s)
		ascii_write_char(*s++);
	return 0;
}