/*
 * 	startup.c
 *
 */
 #include <stdio.h>
 #define GPIO_D_BASE 0x40020C00
 #define GPIO_D_MODER ((volatile unsigned int*)    GPIO_D_BASE)
 #define GPIO_D_OTYPER_HIGH ((volatile unsigned char*)   GPIO_D_BASE+0x05)
 #define GPIO_D_PUPDR_HIGH ((volatile unsigned short*)     GPIO_D_BASE+0x0E)
 #define GPIO_D_IDR_HIGH ((volatile unsigned char*)     GPIO_D_BASE+0x11)
 #define GPIO_D_ODR_HIGH ((volatile unsigned char*)     GPIO_D_BASE+0x15)
 #define GPIO_D_ODR_LOW ((volatile unsigned char*)     GPIO_D_BASE+0x14)
 
 

 
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

void app_init(void){
   *GPIO_D_MODER  = 0x55005555;
   *GPIO_D_OTYPER_HIGH = 0x0F;
   *GPIO_D_PUPDR_HIGH  = 0x00AA;

}
void activateRow(int row){
 
    switch(row){
        case 1: *GPIO_D_ODR_HIGH = 0x10; break;
        case 2: *GPIO_D_ODR_HIGH = 0x20; break;
        case 3: *GPIO_D_ODR_HIGH = 0x40; break;
        case 4: *GPIO_D_ODR_HIGH = 0x80; break;
        case 0: *GPIO_D_ODR_HIGH = 0x00; break;
    }
}

int readColumn(void){
    unsigned char c;
    c = *GPIO_D_IDR_HIGH;
    if( c & 0x8) return 4;
    if( c & 0x4) return 3;
    if( c & 0x2) return 2;
    if( c & 0x1) return 1;
    return 0;
        
}

    
unsigned char keyb(void){
	unsigned char key[]= {1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
    int row, col;
    for(row = 1; row <=4; row++){
        activateRow(row);
        if((col = readColumn()))
        {
            activateRow(0);
            return key[4*(row-1)+(col-1)];
        }
    }
    activateRow(0);
	return 0xFF;
}
void out7seg(unsigned char c){
        switch(c){
            case 0: *GPIO_D_ODR_LOW = 0x3F; break;
            case 1: *GPIO_D_ODR_LOW = 0x06; break; 
            case 2: *GPIO_D_ODR_LOW = 0x5B; break;
            case 3: *GPIO_D_ODR_LOW = 0x4F; break;
            case 4: *GPIO_D_ODR_LOW = 0x66; break;
            case 5: *GPIO_D_ODR_LOW = 0x6D; break;
            case 6: *GPIO_D_ODR_LOW = 0x7D; break;
            case 7: *GPIO_D_ODR_LOW = 0x07; break;
            case 8: *GPIO_D_ODR_LOW = 0x7F; break;
            case 9: *GPIO_D_ODR_LOW = 0x6F; break;
            case 0xA: *GPIO_D_ODR_LOW = 0x77; break;
            case 0xB: *GPIO_D_ODR_LOW = 0x7C; break;
            case 0xC: *GPIO_D_ODR_LOW = 0x39; break;
            case 0xD: *GPIO_D_ODR_LOW = 0x5E; break;
            case 0xE: *GPIO_D_ODR_LOW = 0xF9; break;
            case 0xF: *GPIO_D_ODR_LOW = 0xF1; break;
            default: *GPIO_D_ODR_LOW = 0xFF;
        }
}
    
int main(void){
    app_init();
    
    while(1){
        out7seg(keyb());
    }
	return 0;
    
}