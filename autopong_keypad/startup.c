/*
 * 	startup.c
 *
 */
#define PORT_BASE_D 0x40020C00
#define PORT_BASE_E 0x40021000
		/* Definiera word-adresser för initiering*/
#define PORT_MODER_D	((volatile unsigned int*)PORT_BASE_D)
#define PORT_OTYPER_D	((volatile unsigned short*)PORT_BASE_D+0x04)
#define PORT_PUPDR_D	((volatile unsigned int*)PORT_BASE_D+0x0C)
#define PORT_D_IDR_HIGH 	((volatile unsigned char*) PORT_BASE_D+0x11)
#define PORT_D_ODR_HIGH ((volatile unsigned char*)PORT_BASE_D+0x15)


#define PORT_MODER 		((volatile unsigned int*)PORT_BASE_E)
#define PORT_OTYPER 	((volatile unsigned short*) PORT_BASE_E+0x04)
#define PORT_OSPEEDR    ((volatile unsigned int*) PORT_BASE_E+0x08)
#define PORT_PUPDR  	((volatile unsigned int*) PORT_BASE_E+0x0C)
		/*Definiera byte-adresser för data och styrregister*/
#define PORT_IDR_LOW 	((volatile unsigned char*) PORT_BASE_E+0x10)
#define PORT_IDR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x11)
#define PORT_ODR_LOW  	((volatile unsigned char*) PORT_BASE_E+0x14)
#define PORT_ODR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x15)
		/*Definiera lämpliga definitioner för de olika bitarna i styrregistret*/
#define B_RST 	0x20
#define B_CS2 	0x10	
#define B_CS1 	0x08
#define B_E 	0x40	
#define B_RW 	0x02		
#define B_RS 	0x01				
		/*LCD-BUSY-bitens address och andra LCD relaterade saker*/
#define LCD_BUSY		0x80
#define LCD_OFF 		0x3E
#define LCD_ON			0x3F
#define LCD_DISP_START	0xC0
#define LCD_SET_ADD		0x40
#define LCD_SET_PAGE	0xB8
		/*STK DELAY*/
#define STK_CTRL ((volatile unsigned int*)(0xE000E010))
#define STK_LOAD ((volatile unsigned int*)(0xE000E014))
#define STK_VAL  ((volatile unsigned int*)(0xE000E018))
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void ){
__asm volatile(
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
typedef struct tPoint{
	unsigned char x;
	unsigned char y;
}POINT;
#define MAX_POINTS 20
typedef struct tGeometry{
	int numPoints;
	int sizeX;
	int sizeY;
	POINT px[ MAX_POINTS ];
} GEOMETRY, *PGEOMETRY;
GEOMETRY ball_geometry = {
	12,	//numpoints
	4,4, //size x and size y
	{{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}}
};
typedef struct tObj{
	PGEOMETRY geo;
	int dirx, diry;
	int posx, posy;
	void (* draw ) (struct tObj *);
	void (* clear ) (struct tObj *);
	void (* move ) (struct tObj *);
	void (* set_speed ) (struct tObj *, int, int);
}OBJECT, *POBJECT;


void graphic_ctrl_bit_set(uint8_t x){
	*PORT_ODR_LOW |= x;
	*PORT_ODR_LOW &= ~(1UL << 2);

}
void graphic_ctrl_bit_clear(uint8_t x){
	*PORT_ODR_LOW &= ~((1UL << 2) | x);

}
void select_controller(uint8_t controller){
	switch(controller){
	case 0:
		graphic_ctrl_bit_clear(B_CS1 | B_CS2);
		break;
	case B_CS1:
		graphic_ctrl_bit_set(B_CS1);
		graphic_ctrl_bit_clear(B_CS2);
		break;
	case B_CS2:
		graphic_ctrl_bit_set(B_CS2);
		graphic_ctrl_bit_clear(B_CS1);
		break;
	case B_CS1 | B_CS2:
		graphic_ctrl_bit_set(B_CS1 | B_CS2);
		break;
	}
		
	
}
void graphic_wait_ready(void){
	uint8_t c;
	graphic_ctrl_bit_clear(B_E);
	*PORT_MODER = 0x00005555;
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_set(B_RW);
	delay_500ns();
	while(1){
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		c = *PORT_IDR_HIGH & LCD_BUSY;
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();
		if( c == 0)
			break;
		
	}
	graphic_ctrl_bit_set(B_E);
	*PORT_MODER = 0x55555555;
}
uint8_t graphic_read(uint8_t controller ){
	uint8_t RV;
	graphic_ctrl_bit_clear( B_E );
	*PORT_MODER = 0x00005555;
	
	graphic_ctrl_bit_set( B_RS | B_RW);
	
	select_controller( controller );
	delay_500ns();
	
	graphic_ctrl_bit_set( B_E );
	delay_500ns();
	
	RV = *PORT_IDR_HIGH;
	graphic_ctrl_bit_clear( B_E );
	
	*PORT_MODER = 0x55555555;
	if( controller & B_CS1 ){
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if( controller & B_CS2 ){
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	return RV;
}
uint8_t graphic_read_data(unsigned char controller){
	graphic_read(controller);
	return graphic_read(controller);
	
}
void graphic_write(uint8_t value, uint8_t controller){
	*PORT_ODR_HIGH = value;
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	graphic_ctrl_bit_clear(B_E);
	
	if( controller & B_CS1 ){
		select_controller( B_CS1 );
		graphic_wait_ready();
	}
	if( controller & B_CS2 ){
		select_controller( B_CS2 );
		graphic_wait_ready();
	}
	*PORT_ODR_HIGH = 0x0;
	graphic_ctrl_bit_set(B_E);
	select_controller(0);
}
void graphic_write_command(uint8_t command, uint8_t controller){
	graphic_ctrl_bit_clear( B_E );
	select_controller( controller );
	graphic_ctrl_bit_clear( B_RS | B_RW );
	graphic_write( command, controller );
}
void graphic_write_data( uint8_t data, uint8_t controller ){
	graphic_ctrl_bit_clear( B_E );
	select_controller( controller );
	graphic_ctrl_bit_set( B_RS );
	graphic_ctrl_bit_clear( B_RW );
	graphic_write( data, controller );
}
void graphic_clear_screen(void){
	for( int i = 0; i < 7; i++){											//KAN SKAPA PROBLEM DÅ I ALDRiG ÄR 7, SAMMA MED K
		graphic_write_command( LCD_SET_PAGE | i, B_CS1 | B_CS2 );
		graphic_write_command( LCD_SET_ADD	| 0, B_CS1 | B_CS2 );
		for(int k = 0; k < 63; k++){
			graphic_write_data( 0, B_CS1 | B_CS2 );
		}
	}
}
void pixel(unsigned x, unsigned y, unsigned set){
	uint8_t mask, c, controller;
	int index;
	
	if(x < 1 || y < 1 || x > 128 || y > 64)
		return;
	index = (y-1)/8;
	switch((y-1)%8){
		case 0: mask = 1; break;
		case 1:	mask = 2; break;
		case 2: mask = 4; break;
		case 3: mask = 8; break;
		case 4: mask = 0x10; break;
		case 5: mask = 0x20; break;
		case 6: mask = 0x40; break;
		case 7: mask = 0x80; break;
	}
	if(set == 0)
		mask = ~mask;
	if(x > 64){
		controller = B_CS2;
		x = x-65;
	}else{ 
		controller = B_CS1;
		x = x-1;	
	}
	graphic_write_command(LCD_SET_ADD | x, controller);
	graphic_write_command(LCD_SET_PAGE | index, controller);
	c = graphic_read_data(controller);
	graphic_write_command(LCD_SET_ADD | x, controller);
	if(set == 1){
		mask = mask | c;
	}else{
		mask = mask & c;
	}
	graphic_write_data(mask, controller);
}
void set_object_speed(POBJECT object, int speedx, int speedy){
	object->dirx = speedx;
	object->diry = speedy;
}
void draw_object(POBJECT object){
	for(int i = 0; i < object->geo->numPoints; i++){
			pixel( object->geo->px[i].x+object->posx, object->geo->px[i].y+object->posy,1 );
	}
}
void clear_object(POBJECT object){
	for(int i = 0; i < object->geo->numPoints; i++){
			pixel( object->geo->px[i].x+object->posx, object->geo->px[i].y+object->posy,0 );
	}
}
void move_object(POBJECT object){
	clear_object(object);
	object->posx = object->dirx + object->posx;
	object->posy = object->diry + object->posy;
	
	if( object->posx < 1)
		object->dirx = ~( object->dirx );
	if( object->posx > 128 || object->geo->sizeX > 128 )
		object->dirx = ~( object->dirx );
	if( object->posy < 1)
		object->diry = ~( object->diry );
	if( object->posy > 64 || object->geo->sizeY > 64 )
		object->diry = ~( object->diry );
	draw_object(object);
}
static OBJECT ball = {
	&ball_geometry,
	0,0,
	1,1,
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};
//----------------------------------------------------KEYPAD-RELATED

void activateRow(int row){
 
    switch(row){
        case 1: *PORT_D_ODR_HIGH = 0x10; break;
        case 2: *PORT_D_ODR_HIGH = 0x20; break;
        case 3: *PORT_D_ODR_HIGH = 0x40; break;
        case 4: *PORT_D_ODR_HIGH = 0x80; break;
        case 0: *PORT_D_ODR_HIGH = 0x00; break;
    }
}
int readColumn(void){
    unsigned char c;
    c = *PORT_D_IDR_HIGH;
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
//---------------------------------------------------------------------
void graphic_initialize(void){
	graphic_ctrl_bit_set(B_E);
	delay_micro(10);
	
	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E );
	delay_milli(30);
	
	graphic_ctrl_bit_set(B_RST);
	delay_milli(100);
	graphic_write_command(LCD_OFF,			B_CS1 | B_CS2);
	graphic_write_command(LCD_ON,			B_CS1 | B_CS2);
	graphic_write_command(LCD_DISP_START, 	B_CS1 | B_CS2);
	graphic_write_command(LCD_SET_ADD,		B_CS1 | B_CS2);
	graphic_write_command(LCD_SET_PAGE,		B_CS1 | B_CS2);
	select_controller(0);
}
void init_app(void){
	*PORT_MODER 	=0x55555555;
	*PORT_OTYPER 	=0x0000;
    *PORT_OSPEEDR   =0x55555555;
	*PORT_MODER_D  = 0x55005555;
    *PORT_OTYPER_D = 0x0F;
    *PORT_PUPDR_D  = 0x00AA;
}

int main(int argc, char **argv){
	char c;
	POBJECT p = &ball;
	init_app();
	graphic_initialize();
	//graphic_clear_screen();
	
	while(1){
		p->move(p);
		//delay_milli(40);
		c = keyb();
		switch(c){
			case 6: p->set_speed( p, 20, 0 ); break;
			case 4: p->set_speed( p,-20, 0 ); break;
			case 2: p->set_speed( p, 0,-20 ); break;
			case 8: p->set_speed( p, 0, 20 ); break;
		}
	}
	return 0;
	
}

