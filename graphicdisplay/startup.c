/*
 * 	startup.c
 *
 */
#define PORT_BASE_E 0x40021000
		/* Definiera word-adresser för initiering*/
#define PORT_MODER 		((volatile unsigned int*)PORT_BASE_E)
#define PORT_MODER_LOW	((volatile unsigned short*)PORT_BASE_E)
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
#define B_RST 	0x20
#define B_CS2 	0x10	
#define B_CS1 	0x08
#define B_E 	0x40	
#define B_RW 	0x02		
#define B_RS 	0x01				
		/*STK DELAY*/
#define STK_CTRL ((volatile unsigned int*)(0xE000E010))
#define STK_LOAD ((volatile unsigned int*)(0xE000E014))
#define STK_VAL  ((volatile unsigned int*)(0xE000E018))
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}
void delay_250ns(void){
    *STK_CTRL = 0;
    *STK_LOAD = ((168/4)-1);
    *STK_VAL  = 0;
    *STK_CTRL = 5;
    while( (*STK_CTRL & 0x10000)== 0){}
    *STK_CTRL = 0;
}
void delay_500ns(void){
	delay_250ns();
	delay_250ns();
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
typedef unsigned char uint8_t;

void graphic_ctrl_bit_set(uint8_t x){
	*PORT_ODR_LOW |= x;
	*PORT_ODR_LOW &= ~(1UL << 2);

}
void graphic_ctrl_bit_clear(uint8_t x){
	*PORT_ODR_LOW &= ~x;
	*PORT_ODR_LOW &= ~(1UL << 2);


}
void select_controller(uint8_t controller){
	switch(controller){
	case 0:
		graphic_ctrl_bit_clear(B_CS1);
		graphic_ctrl_bit_clear(B_CS2);
		break;
	case B_CS1:
		graphic_ctrl_bit_set(B_CS1);
		graphic_ctrl_bit_clear(B_CS2);
		break;
	case B_CS2:
		graphic_ctrl_bit_clear(B_CS1);
		graphic_ctrl_bit_set(B_CS2);
		break;
	case B_CS1 && B_CS2:
		graphic_ctrl_bit_set(B_CS1);
		graphic_ctrl_bit_set(B_CS2);
		break;
	}
		
	
}
void graphic_wait_ready(void){
	graphic_ctrl_bit_clear(B_E);
	*PORT_MODER_LOW = 0x0055;
	graphic_ctrl_bit_set();
	graphic_ctrl_bit_set();
}

int main(void){
	return 0;
	
}

