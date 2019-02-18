/*
 * 	startup.c
 *
 */
 



 
 
 
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

#define GPIO_E_BASE 0x40021000
#define GPIO_E_MODER ((volatile unsigned int*)    GPIO_E_BASE)
#define GPIO_E_OTYPER_LOW ((volatile unsigned char*)   GPIO_E_BASE+0x04)
#define GPIO_ODR_LOW ((volatile unsigned char*) GPIO_E_BASE+0x14)
#define STK_CTRL (*(volatile unsigned int*)(0xE000E010))
#define STK_LOAD (*(volatile unsigned int*)(0xE000E014))
#define STK_VAL  (*(volatile unsigned int*)(0xE000E018))



void delay_250ns(void){
    STK_CTRL = 0;
    STK_LOAD = ((168/4)-1);
    STK_VAL  = 0;
    STK_CTRL = 5;
    while( (STK_CTRL & 0x10000)== 0){}
    STK_CTRL = 0;
}

void delay_micro(unsigned int us){
    while(us--){
        delay_250ns();
        delay_250ns();
        delay_250ns();
        delay_250ns();
    }
}

// delay_milli(): 1ms = 1000us
void delay_milli(unsigned int ms){
    while(ms--){
        delay_micro(10);
    }
    
}



void init_app(){
    *GPIO_E_MODER = 0x00005555;
   
}


void main(void)
{
    init_app();
    while(1){
        *GPIO_ODR_LOW = 0x0;
        delay_milli(5);
        *GPIO_ODR_LOW = 0xFF;
        delay_milli(5);
    }
}

