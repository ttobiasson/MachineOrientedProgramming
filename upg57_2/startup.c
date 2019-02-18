/*
 * 	startup.c
 *
 */
 
 #define PORT_BASE_E 0x40021000
			/* Definiera word-adresser för initiering*/
 #define portModer ((volatile unsigned int*)PORT_BASE_E)
 #define portOtyper ((volatile unsigned int*) PORT_BASE_E+0x04)
 #define Ospeedr    ((volatile unsigned int*) PORT_BASE_E+0x08)
 #define portPupdr  ((volatile unsigned int*) PORT_BASE_E+0x0C)
			/*Definiera byte-adresser för data och styrregister*/
 #define portIdrLow ((volatile unsigned char*) PORT_BASE_E+0x10)
 #define portIdrHigh ((volatile unsigned char*) PORT_BASE_E+0x10)
 #define portOdrLow  ((volatile unsigned char*) PORT_BASE_E+0x14)
 #define portOdrHigh ((volatile unsigned char*) PORT_BASE_E+0x15)
			/*Definiera lämpliga definitioner för de olika bitarna i styrregistret*/
 #define B_E 0x40  		/*ENABLE SIGNAL*/
 #define B_SELECT 4 	/*SELECT ASCII-DISPLAY*/
 #define B_RW 2    	 	/* 0 = writem, 1 = read*/
 #define B_RS 1     	/* 0 = control, 1 =data*/
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

void init_app(){
    *portModer = 0x55555555;
    *portOtyper =0x00000000;
    *Ospeedr    =0x55555555;
}
void ascii_init(void){
    ascii_write_cmd(0x38);
    ascii_write_cmd(0x0E);
    ascii_clear_cmd(0x01);
    ascii_write_cmd(0x06);

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
    while(us > 0){
        delay_250ns();
        delay_250ns();
        delay_250ns();
        delay_250ns();
        us--;
    }
}
void delay_milli(unsigned int ms){

    while(ms--){
        delay_micro(10);
    }
    
}
void ascii_ctrl_bit_set( unsigned char x){
    *portOdrLow |= (B_SELECT | x);
}
void ascii_ctrl_bit_clear(unsigned char x){
    *portOdrLow &= (B_SELECT | ~x);
}
void ascii_write_controller( unsigned char c ){
	delay_250ns();
    ascii_ctrl_bit_set( *B_E );   // Synchronization signal =1
    *portOdrHigh = c;            // Ger kommandot till porten
    delay_250ns();
    ascii_ctrl_bit_clear( *B_E ); // Stänger av synchronizatoin.
    delay_250ns();
}
unsigned char ascii_read_controller( void ){
    unsigned char c;
    ascii_ctrl_bit_set( *B_E );
    delay_250ns();
    delay_250ns();
    c = *portIdrHigh;
    ascii_ctrl_bit_clear( *B_E );
    return c;   
}
void ascii_write_cmd ( unsigned char command){
    ascii_ctrl_bit_clear(*B_RS);
    ascii_ctrl_bit_clear(*B_RW);
    ascii_write_controller(command);
}
void ascii_write_data (unsigned char data){
    ascii_ctrl_bit_clear(*B_RW);
    ascii_ctrl_bit_set(*B_RS);
    ascii_write_controller(data);
}
unsigned char ascii_read_status(){
    unsigned char c;
    *portModer = 0x00000000;   //GÖR OM PORTEN TILL INGÅNGAR
    ascii_ctrl_bit_set(*B_RW );   // ETT STÄLL READ/WRITE
    ascii_ctrl_bit_clear(*B_RS );  //NOLLSTÄLL READ/ SET
    c = ascii_read_controller( );
    *portModer = 0x55555555;    //GÖR OM PORTEN TILL UTGÅNGAR
return c;
}
void ascii_read_data(void){
    unsigned char c;
    *portModer = 0x00000000;
    ascii_ctrl_bit_set(*B_RS);
    ascii_ctrl_bit_set(*B_RW);
    c = ascii_read_controller();
    *portModer = 0x55555555;
    return c;
}
void ascii_clear_cmd(unsigned char cmd){
    while((ascii_read_status() & 0x80) == 0x80){
        delay_micro(8);
        ascii_write_cmd(cmd);
        delay_milli(2);
    }
}
void ascii_gotoxy( unsigned int x, unsigned int y) {
    unsigned char address = x-1;
    if(y != 1){
        address +=0x40 | (x-1);
} 
    ascii_write_cmd( 0x80 | address);
    delay_micro(45);
}

void ascii_write_char( unsigned char c){
    while((ascii_read_status() & 0x80) == 0x80){
        delay_micro(8);
        ascii_write_data(c);
    }
    
}
void main(void){
    char *s;
    char test1[] = "Alfanumerisk";
    char test2[] = "Display - test";
    
    init_app();
    ascii_init();
    ascii_gotoxy(1,1);
    s = test1;
	
    while (*s){
        ascii_write_char(*s++);
    }
    ascii_gotoxy(1,2);
    s = test2;
	
    while(*s){
        ascii_write_char(*s++);
    }
}