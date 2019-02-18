/*
 * 	startup.c
 *
 */
 #include <stdio.h>
 #define GPIO_D_BASE 0x40020C00
 #define GPIO_D_MODER ((volatile unsigned short*)    			GPIO_D_BASE)
 #define GPIO_D_OTYPER_HIGH ((volatile unsigned char*)   	GPIO_D_BASE+0x05)
 #define GPIO_D_PUPDR_HIGH ((volatile unsigned short*)     	GPIO_D_BASE+0x0E)
 #define GPIO_D_IDR_HIGH ((volatile unsigned char*)     	GPIO_D_BASE+0x11)
 #define GPIO_D_ODR_HIGH ((volatile unsigned char*)     	GPIO_D_BASE+0x15)
 #define GPIO_D_ODR_LOW ((volatile unsigned char*)     		GPIO_D_BASE+0x14)
 

 
 

 
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

   *GPIO_D_MODER  = 0x5500;
   *GPIO_D_OTYPER_HIGH = 0x0F;
   *GPIO_D_PUPDR_HIGH  = 0x00AA;

}
void activateRow(int row){
	*GPIO_D_ODR_HIGH = 0x0;
	if(row == 1){
		*GPIO_D_ODR_HIGH = 0x10;
	}
	if(row == 2){
		*GPIO_D_ODR_HIGH = 0x20;
	}
	if(row == 3){
		*GPIO_D_ODR_HIGH = 0x40;
	}
	if(row == 4){
		*GPIO_D_ODR_HIGH = 0x80;
	}

}
unsigned char readColumn(){
	if(*GPIO_D_IDR_HIGH == 0x01){
		return 0x1;
	}
	if(*GPIO_D_IDR_HIGH == 0x02){
		return 0x2;
	}
	if(*GPIO_D_IDR_HIGH == 0x04){
		return 0x4;
	}
	if(*GPIO_D_IDR_HIGH == 0x08){
		return 0x8;
	}
}

    
unsigned char keyb(void){
	char column;
	for(int i = 1; i <= 4; i++){
			activateRow(i);
			column = readColumn();
			if(column != 0){
				if(column == 0x01 && i == 1){ //1
					return 0x06;

				}
				if(column == 0x02 && i == 1){ //2
					return 0x5B;

				}
				if(column == 0x04 && i == 1){ //3
					return 0x4F;
					
				}
				if(column == 0x08 && i == 1){ //A
					return 0x77;


	
				}
				if(column == 0x01 && i == 2){ //4
					return 0x66;

				}
				if(column == 0x02 && i == 2){ //5
					return 0x6D;
	
				}
				if(column == 0x04 && i == 2){ //6
					return 0x7D;
	
				}
				if(column == 0x08 && i == 2){ //B
					return 0x5B;
	
	
	
				}
				if(column == 0x01 && i == 3){ //7
					return 0x07;
	
				}
				if(column == 0x02 && i == 3){ //8
					return 0x7F;
	
				}
				if(column == 0x04 && i == 3){ //9
					return 0x6F;
	
				}
				if(column == 0x08 && i == 3){ //C
					return 0x39;
	
	
	
				}
				if(column == 0x01 && i == 4){ //Stjärna
					return 0x76;
	
				}
				if(column == 0x02 && i == 4){ //0
					return 0x3F;
	
				}
				if(column == 0x04 && i == 4){ //Fyrkant
					return 0x8;
	
				}
				if(column == 0x08 && i == 4){ // D
					return 0x5D;
	
				}
				else return 0xFF;
			}
	}
	
}
void out7seg(unsigned char c){
	*GPIO_D_ODR_LOW = c;

	
}
    
void main(void){
    app_init();
    
    while(1){
		*GPIO_D_ODR_LOW = 0x3B;
        out7seg(keyb());
    }
    
}