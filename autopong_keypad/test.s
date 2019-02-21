   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB0:
  25              		.file 1 "/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c"
   1:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** /*
   2:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****  * 	startup.c
   3:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****  *
   4:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****  */
   5:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_BASE_D 0x40020C00
   6:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_BASE_E 0x40021000
   7:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		/* Definiera word-adresser för initiering*/
   8:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_MODER_D	((volatile unsigned int*)PORT_BASE_D)
   9:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_OTYPER_D	((volatile unsigned short*)PORT_BASE_D+0x04)
  10:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_PUPDR_D	((volatile unsigned int*)PORT_BASE_D+0x0C)
  11:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_D_IDR_HIGH 	((volatile unsigned char*) PORT_BASE_D+0x11)
  12:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_D_ODR_HIGH ((volatile unsigned char*)PORT_BASE_D+0x15)
  13:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 
  14:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 
  15:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_MODER 		((volatile unsigned int*)PORT_BASE_E)
  16:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_OTYPER 	((volatile unsigned short*) PORT_BASE_E+0x04)
  17:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_OSPEEDR    ((volatile unsigned int*) PORT_BASE_E+0x08)
  18:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_PUPDR  	((volatile unsigned int*) PORT_BASE_E+0x0C)
  19:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		/*Definiera byte-adresser för data och styrregister*/
  20:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_IDR_LOW 	((volatile unsigned char*) PORT_BASE_E+0x10)
  21:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_IDR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x11)
  22:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_ODR_LOW  	((volatile unsigned char*) PORT_BASE_E+0x14)
  23:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define PORT_ODR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x15)
  24:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		/*Definiera lämpliga definitioner för de olika bitarna i styrregistret*/
  25:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define B_RST 	0x20
  26:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define B_CS2 	0x10	
  27:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define B_CS1 	0x08
  28:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define B_E 	0x40	
  29:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define B_RW 	0x02		
  30:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define B_RS 	0x01				
  31:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		/*LCD-BUSY-bitens address och andra LCD relaterade saker*/
  32:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define LCD_BUSY		0x80
  33:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define LCD_OFF 		0x3E
  34:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define LCD_ON			0x3F
  35:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define LCD_DISP_START	0xC0
  36:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define LCD_SET_ADD		0x40
  37:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define LCD_SET_PAGE	0xB8
  38:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		/*STK DELAY*/
  39:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define STK_CTRL ((volatile unsigned int*)(0xE000E010))
  40:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define STK_LOAD ((volatile unsigned int*)(0xE000E014))
  41:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define STK_VAL  ((volatile unsigned int*)(0xE000E018))
  42:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  43:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 
  44:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void startup ( void ){
  26              		.loc 1 44 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  45:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** __asm volatile(
  31              		.loc 1 45 0
  32              		.syntax divided
  33              	@ 45 "/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  46:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  47:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	" MOV SP,R0\n"
  48:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	" BL main\n"				/* call main */
  49:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	".L1: B .L1\n"				/* never return */
  50:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	) ;
  51:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
  40              		.loc 1 51 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	delay_250ns
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	delay_250ns:
  56              	.LFB1:
  52:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void delay_250ns(void){
  57              		.loc 1 52 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  53:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     *STK_CTRL = 0;
  67              		.loc 1 53 0
  68 0004 0C4B     		ldr	r3, .L4
  69 0006 0022     		movs	r2, #0
  70 0008 1A60     		str	r2, [r3]
  54:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     *STK_LOAD = ((168/4)-1);
  71              		.loc 1 54 0
  72 000a 0C4B     		ldr	r3, .L4+4
  73 000c 2922     		movs	r2, #41
  74 000e 1A60     		str	r2, [r3]
  55:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     *STK_VAL  = 0;
  75              		.loc 1 55 0
  76 0010 0B4B     		ldr	r3, .L4+8
  77 0012 0022     		movs	r2, #0
  78 0014 1A60     		str	r2, [r3]
  56:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     *STK_CTRL = 5;
  79              		.loc 1 56 0
  80 0016 084B     		ldr	r3, .L4
  81 0018 0522     		movs	r2, #5
  82 001a 1A60     		str	r2, [r3]
  57:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     while( (*STK_CTRL & 0x10000)== 0){}
  83              		.loc 1 57 0
  84 001c C046     		nop
  85              	.L3:
  86              		.loc 1 57 0 is_stmt 0 discriminator 1
  87 001e 064B     		ldr	r3, .L4
  88 0020 1A68     		ldr	r2, [r3]
  89 0022 8023     		movs	r3, #128
  90 0024 5B02     		lsls	r3, r3, #9
  91 0026 1340     		ands	r3, r2
  92 0028 F9D0     		beq	.L3
  58:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     *STK_CTRL = 0;
  93              		.loc 1 58 0 is_stmt 1
  94 002a 034B     		ldr	r3, .L4
  95 002c 0022     		movs	r2, #0
  96 002e 1A60     		str	r2, [r3]
  59:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
  97              		.loc 1 59 0
  98 0030 C046     		nop
  99 0032 BD46     		mov	sp, r7
 100              		@ sp needed
 101 0034 80BD     		pop	{r7, pc}
 102              	.L5:
 103 0036 C046     		.align	2
 104              	.L4:
 105 0038 10E000E0 		.word	-536813552
 106 003c 14E000E0 		.word	-536813548
 107 0040 18E000E0 		.word	-536813544
 108              		.cfi_endproc
 109              	.LFE1:
 111              		.align	1
 112              		.global	delay_500ns
 113              		.syntax unified
 114              		.code	16
 115              		.thumb_func
 116              		.fpu softvfp
 118              	delay_500ns:
 119              	.LFB2:
  60:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void delay_500ns(void){
 120              		.loc 1 60 0
 121              		.cfi_startproc
 122              		@ args = 0, pretend = 0, frame = 0
 123              		@ frame_needed = 1, uses_anonymous_args = 0
 124 0044 80B5     		push	{r7, lr}
 125              		.cfi_def_cfa_offset 8
 126              		.cfi_offset 7, -8
 127              		.cfi_offset 14, -4
 128 0046 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
  61:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	delay_250ns();
 130              		.loc 1 61 0
 131 0048 FFF7FEFF 		bl	delay_250ns
  62:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	delay_250ns();
 132              		.loc 1 62 0
 133 004c FFF7FEFF 		bl	delay_250ns
  63:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 134              		.loc 1 63 0
 135 0050 C046     		nop
 136 0052 BD46     		mov	sp, r7
 137              		@ sp needed
 138 0054 80BD     		pop	{r7, pc}
 139              		.cfi_endproc
 140              	.LFE2:
 142              		.align	1
 143              		.global	delay_micro
 144              		.syntax unified
 145              		.code	16
 146              		.thumb_func
 147              		.fpu softvfp
 149              	delay_micro:
 150              	.LFB3:
  64:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void delay_micro(unsigned int us){
 151              		.loc 1 64 0
 152              		.cfi_startproc
 153              		@ args = 0, pretend = 0, frame = 8
 154              		@ frame_needed = 1, uses_anonymous_args = 0
 155 0056 80B5     		push	{r7, lr}
 156              		.cfi_def_cfa_offset 8
 157              		.cfi_offset 7, -8
 158              		.cfi_offset 14, -4
 159 0058 82B0     		sub	sp, sp, #8
 160              		.cfi_def_cfa_offset 16
 161 005a 00AF     		add	r7, sp, #0
 162              		.cfi_def_cfa_register 7
 163 005c 7860     		str	r0, [r7, #4]
  65:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     while(us--){
 164              		.loc 1 65 0
 165 005e 07E0     		b	.L8
 166              	.L9:
  66:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         delay_250ns();
 167              		.loc 1 66 0
 168 0060 FFF7FEFF 		bl	delay_250ns
  67:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         delay_250ns();
 169              		.loc 1 67 0
 170 0064 FFF7FEFF 		bl	delay_250ns
  68:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         delay_250ns();
 171              		.loc 1 68 0
 172 0068 FFF7FEFF 		bl	delay_250ns
  69:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         delay_250ns();
 173              		.loc 1 69 0
 174 006c FFF7FEFF 		bl	delay_250ns
 175              	.L8:
  65:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         delay_250ns();
 176              		.loc 1 65 0
 177 0070 7B68     		ldr	r3, [r7, #4]
 178 0072 5A1E     		subs	r2, r3, #1
 179 0074 7A60     		str	r2, [r7, #4]
 180 0076 002B     		cmp	r3, #0
 181 0078 F2D1     		bne	.L9
  70:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     }
  71:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 182              		.loc 1 71 0
 183 007a C046     		nop
 184 007c BD46     		mov	sp, r7
 185 007e 02B0     		add	sp, sp, #8
 186              		@ sp needed
 187 0080 80BD     		pop	{r7, pc}
 188              		.cfi_endproc
 189              	.LFE3:
 191              		.align	1
 192              		.global	delay_milli
 193              		.syntax unified
 194              		.code	16
 195              		.thumb_func
 196              		.fpu softvfp
 198              	delay_milli:
 199              	.LFB4:
  72:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void delay_milli(unsigned int ms){
 200              		.loc 1 72 0
 201              		.cfi_startproc
 202              		@ args = 0, pretend = 0, frame = 8
 203              		@ frame_needed = 1, uses_anonymous_args = 0
 204 0082 80B5     		push	{r7, lr}
 205              		.cfi_def_cfa_offset 8
 206              		.cfi_offset 7, -8
 207              		.cfi_offset 14, -4
 208 0084 82B0     		sub	sp, sp, #8
 209              		.cfi_def_cfa_offset 16
 210 0086 00AF     		add	r7, sp, #0
 211              		.cfi_def_cfa_register 7
 212 0088 7860     		str	r0, [r7, #4]
  73:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     while(ms--){
 213              		.loc 1 73 0
 214 008a 02E0     		b	.L11
 215              	.L12:
  74:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         delay_micro(10);
 216              		.loc 1 74 0
 217 008c 0A20     		movs	r0, #10
 218 008e FFF7FEFF 		bl	delay_micro
 219              	.L11:
  73:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     while(ms--){
 220              		.loc 1 73 0
 221 0092 7B68     		ldr	r3, [r7, #4]
 222 0094 5A1E     		subs	r2, r3, #1
 223 0096 7A60     		str	r2, [r7, #4]
 224 0098 002B     		cmp	r3, #0
 225 009a F7D1     		bne	.L12
  75:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     }
  76:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     
  77:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 226              		.loc 1 77 0
 227 009c C046     		nop
 228 009e BD46     		mov	sp, r7
 229 00a0 02B0     		add	sp, sp, #8
 230              		@ sp needed
 231 00a2 80BD     		pop	{r7, pc}
 232              		.cfi_endproc
 233              	.LFE4:
 235              		.global	ball_geometry
 236              		.data
 237              		.align	2
 240              	ball_geometry:
 241 0000 0C000000 		.word	12
 242 0004 04000000 		.word	4
 243 0008 04000000 		.word	4
 244 000c 00       		.byte	0
 245 000d 01       		.byte	1
 246 000e 00       		.byte	0
 247 000f 02       		.byte	2
 248 0010 01       		.byte	1
 249 0011 00       		.byte	0
 250 0012 01       		.byte	1
 251 0013 01       		.byte	1
 252 0014 01       		.byte	1
 253 0015 02       		.byte	2
 254 0016 01       		.byte	1
 255 0017 03       		.byte	3
 256 0018 02       		.byte	2
 257 0019 00       		.byte	0
 258 001a 02       		.byte	2
 259 001b 01       		.byte	1
 260 001c 02       		.byte	2
 261 001d 02       		.byte	2
 262 001e 02       		.byte	2
 263 001f 03       		.byte	3
 264 0020 03       		.byte	3
 265 0021 01       		.byte	1
 266 0022 03       		.byte	3
 267 0023 02       		.byte	2
 268 0024 00000000 		.space	16
 268      00000000 
 268      00000000 
 268      00000000 
 269              		.text
 270              		.align	1
 271              		.global	graphic_ctrl_bit_set
 272              		.syntax unified
 273              		.code	16
 274              		.thumb_func
 275              		.fpu softvfp
 277              	graphic_ctrl_bit_set:
 278              	.LFB5:
  78:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** typedef unsigned char uint8_t;
  79:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** typedef struct tPoint{
  80:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	unsigned char x;
  81:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	unsigned char y;
  82:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }POINT;
  83:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** #define MAX_POINTS 20
  84:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** typedef struct tGeometry{
  85:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	int numPoints;
  86:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	int sizeX;
  87:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	int sizeY;
  88:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	POINT px[ MAX_POINTS ];
  89:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** } GEOMETRY, *PGEOMETRY;
  90:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** GEOMETRY ball_geometry = {
  91:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	12,	//numpoints
  92:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	4,4, //size x and size y
  93:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	{{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}}
  94:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** };
  95:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** typedef struct tObj{
  96:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	PGEOMETRY geo;
  97:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	int dirx, diry;
  98:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	int posx, posy;
  99:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	void (* draw ) (struct tObj *);
 100:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	void (* clear ) (struct tObj *);
 101:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	void (* move ) (struct tObj *);
 102:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	void (* set_speed ) (struct tObj *, int, int);
 103:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }OBJECT, *POBJECT;
 104:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 
 105:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 
 106:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void graphic_ctrl_bit_set(uint8_t x){
 279              		.loc 1 106 0
 280              		.cfi_startproc
 281              		@ args = 0, pretend = 0, frame = 8
 282              		@ frame_needed = 1, uses_anonymous_args = 0
 283 00a4 80B5     		push	{r7, lr}
 284              		.cfi_def_cfa_offset 8
 285              		.cfi_offset 7, -8
 286              		.cfi_offset 14, -4
 287 00a6 82B0     		sub	sp, sp, #8
 288              		.cfi_def_cfa_offset 16
 289 00a8 00AF     		add	r7, sp, #0
 290              		.cfi_def_cfa_register 7
 291 00aa 0200     		movs	r2, r0
 292 00ac FB1D     		adds	r3, r7, #7
 293 00ae 1A70     		strb	r2, [r3]
 107:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	*PORT_ODR_LOW |= x;
 294              		.loc 1 107 0
 295 00b0 0A4B     		ldr	r3, .L14
 296 00b2 1B78     		ldrb	r3, [r3]
 297 00b4 DAB2     		uxtb	r2, r3
 298 00b6 0949     		ldr	r1, .L14
 299 00b8 FB1D     		adds	r3, r7, #7
 300 00ba 1B78     		ldrb	r3, [r3]
 301 00bc 1343     		orrs	r3, r2
 302 00be DBB2     		uxtb	r3, r3
 303 00c0 0B70     		strb	r3, [r1]
 108:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	*PORT_ODR_LOW &= ~(1UL << 2);
 304              		.loc 1 108 0
 305 00c2 064B     		ldr	r3, .L14
 306 00c4 1B78     		ldrb	r3, [r3]
 307 00c6 DBB2     		uxtb	r3, r3
 308 00c8 044A     		ldr	r2, .L14
 309 00ca 0421     		movs	r1, #4
 310 00cc 8B43     		bics	r3, r1
 311 00ce DBB2     		uxtb	r3, r3
 312 00d0 1370     		strb	r3, [r2]
 109:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 
 110:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 313              		.loc 1 110 0
 314 00d2 C046     		nop
 315 00d4 BD46     		mov	sp, r7
 316 00d6 02B0     		add	sp, sp, #8
 317              		@ sp needed
 318 00d8 80BD     		pop	{r7, pc}
 319              	.L15:
 320 00da C046     		.align	2
 321              	.L14:
 322 00dc 14100240 		.word	1073877012
 323              		.cfi_endproc
 324              	.LFE5:
 326              		.align	1
 327              		.global	graphic_ctrl_bit_clear
 328              		.syntax unified
 329              		.code	16
 330              		.thumb_func
 331              		.fpu softvfp
 333              	graphic_ctrl_bit_clear:
 334              	.LFB6:
 111:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void graphic_ctrl_bit_clear(uint8_t x){
 335              		.loc 1 111 0
 336              		.cfi_startproc
 337              		@ args = 0, pretend = 0, frame = 8
 338              		@ frame_needed = 1, uses_anonymous_args = 0
 339 00e0 80B5     		push	{r7, lr}
 340              		.cfi_def_cfa_offset 8
 341              		.cfi_offset 7, -8
 342              		.cfi_offset 14, -4
 343 00e2 82B0     		sub	sp, sp, #8
 344              		.cfi_def_cfa_offset 16
 345 00e4 00AF     		add	r7, sp, #0
 346              		.cfi_def_cfa_register 7
 347 00e6 0200     		movs	r2, r0
 348 00e8 FB1D     		adds	r3, r7, #7
 349 00ea 1A70     		strb	r2, [r3]
 112:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	*PORT_ODR_LOW &= ~((1UL << 2) | x);
 350              		.loc 1 112 0
 351 00ec 084B     		ldr	r3, .L17
 352 00ee 1B78     		ldrb	r3, [r3]
 353 00f0 DBB2     		uxtb	r3, r3
 354 00f2 FA1D     		adds	r2, r7, #7
 355 00f4 1278     		ldrb	r2, [r2]
 356 00f6 0421     		movs	r1, #4
 357 00f8 0A43     		orrs	r2, r1
 358 00fa D2B2     		uxtb	r2, r2
 359 00fc D243     		mvns	r2, r2
 360 00fe D2B2     		uxtb	r2, r2
 361 0100 0349     		ldr	r1, .L17
 362 0102 1340     		ands	r3, r2
 363 0104 DBB2     		uxtb	r3, r3
 364 0106 0B70     		strb	r3, [r1]
 113:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 
 114:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 365              		.loc 1 114 0
 366 0108 C046     		nop
 367 010a BD46     		mov	sp, r7
 368 010c 02B0     		add	sp, sp, #8
 369              		@ sp needed
 370 010e 80BD     		pop	{r7, pc}
 371              	.L18:
 372              		.align	2
 373              	.L17:
 374 0110 14100240 		.word	1073877012
 375              		.cfi_endproc
 376              	.LFE6:
 378              		.align	1
 379              		.global	select_controller
 380              		.syntax unified
 381              		.code	16
 382              		.thumb_func
 383              		.fpu softvfp
 385              	select_controller:
 386              	.LFB7:
 115:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void select_controller(uint8_t controller){
 387              		.loc 1 115 0
 388              		.cfi_startproc
 389              		@ args = 0, pretend = 0, frame = 8
 390              		@ frame_needed = 1, uses_anonymous_args = 0
 391 0114 80B5     		push	{r7, lr}
 392              		.cfi_def_cfa_offset 8
 393              		.cfi_offset 7, -8
 394              		.cfi_offset 14, -4
 395 0116 82B0     		sub	sp, sp, #8
 396              		.cfi_def_cfa_offset 16
 397 0118 00AF     		add	r7, sp, #0
 398              		.cfi_def_cfa_register 7
 399 011a 0200     		movs	r2, r0
 400 011c FB1D     		adds	r3, r7, #7
 401 011e 1A70     		strb	r2, [r3]
 116:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	switch(controller){
 402              		.loc 1 116 0
 403 0120 FB1D     		adds	r3, r7, #7
 404 0122 1B78     		ldrb	r3, [r3]
 405 0124 082B     		cmp	r3, #8
 406 0126 0CD0     		beq	.L21
 407 0128 02DC     		bgt	.L22
 408 012a 002B     		cmp	r3, #0
 409 012c 05D0     		beq	.L23
 117:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	case 0:
 118:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_ctrl_bit_clear(B_CS1 | B_CS2);
 119:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		break;
 120:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	case B_CS1:
 121:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_ctrl_bit_set(B_CS1);
 122:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 123:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		break;
 124:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	case B_CS2:
 125:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 126:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
 127:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		break;
 128:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	case B_CS1 | B_CS2:
 129:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_ctrl_bit_set(B_CS1 | B_CS2);
 130:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		break;
 131:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}
 132:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		
 133:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	
 134:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 410              		.loc 1 134 0
 411 012e 1AE0     		b	.L26
 412              	.L22:
 116:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	switch(controller){
 413              		.loc 1 116 0
 414 0130 102B     		cmp	r3, #16
 415 0132 0DD0     		beq	.L24
 416 0134 182B     		cmp	r3, #24
 417 0136 12D0     		beq	.L25
 418              		.loc 1 134 0
 419 0138 15E0     		b	.L26
 420              	.L23:
 118:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		break;
 421              		.loc 1 118 0
 422 013a 1820     		movs	r0, #24
 423 013c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 119:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	case B_CS1:
 424              		.loc 1 119 0
 425 0140 11E0     		b	.L20
 426              	.L21:
 121:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 427              		.loc 1 121 0
 428 0142 0820     		movs	r0, #8
 429 0144 FFF7FEFF 		bl	graphic_ctrl_bit_set
 122:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		break;
 430              		.loc 1 122 0
 431 0148 1020     		movs	r0, #16
 432 014a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 123:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	case B_CS2:
 433              		.loc 1 123 0
 434 014e 0AE0     		b	.L20
 435              	.L24:
 125:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
 436              		.loc 1 125 0
 437 0150 1020     		movs	r0, #16
 438 0152 FFF7FEFF 		bl	graphic_ctrl_bit_set
 126:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		break;
 439              		.loc 1 126 0
 440 0156 0820     		movs	r0, #8
 441 0158 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 127:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	case B_CS1 | B_CS2:
 442              		.loc 1 127 0
 443 015c 03E0     		b	.L20
 444              	.L25:
 129:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		break;
 445              		.loc 1 129 0
 446 015e 1820     		movs	r0, #24
 447 0160 FFF7FEFF 		bl	graphic_ctrl_bit_set
 130:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}
 448              		.loc 1 130 0
 449 0164 C046     		nop
 450              	.L20:
 451              	.L26:
 452              		.loc 1 134 0
 453 0166 C046     		nop
 454 0168 BD46     		mov	sp, r7
 455 016a 02B0     		add	sp, sp, #8
 456              		@ sp needed
 457 016c 80BD     		pop	{r7, pc}
 458              		.cfi_endproc
 459              	.LFE7:
 461              		.align	1
 462              		.global	graphic_wait_ready
 463              		.syntax unified
 464              		.code	16
 465              		.thumb_func
 466              		.fpu softvfp
 468              	graphic_wait_ready:
 469              	.LFB8:
 135:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void graphic_wait_ready(void){
 470              		.loc 1 135 0
 471              		.cfi_startproc
 472              		@ args = 0, pretend = 0, frame = 8
 473              		@ frame_needed = 1, uses_anonymous_args = 0
 474 016e 80B5     		push	{r7, lr}
 475              		.cfi_def_cfa_offset 8
 476              		.cfi_offset 7, -8
 477              		.cfi_offset 14, -4
 478 0170 82B0     		sub	sp, sp, #8
 479              		.cfi_def_cfa_offset 16
 480 0172 00AF     		add	r7, sp, #0
 481              		.cfi_def_cfa_register 7
 136:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	uint8_t c;
 137:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 482              		.loc 1 137 0
 483 0174 4020     		movs	r0, #64
 484 0176 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 138:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	*PORT_MODER = 0x00005555;
 485              		.loc 1 138 0
 486 017a 164B     		ldr	r3, .L33
 487 017c 164A     		ldr	r2, .L33+4
 488 017e 1A60     		str	r2, [r3]
 139:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 489              		.loc 1 139 0
 490 0180 0120     		movs	r0, #1
 491 0182 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 140:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_set(B_RW);
 492              		.loc 1 140 0
 493 0186 0220     		movs	r0, #2
 494 0188 FFF7FEFF 		bl	graphic_ctrl_bit_set
 141:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	delay_500ns();
 495              		.loc 1 141 0
 496 018c FFF7FEFF 		bl	delay_500ns
 497              	.L30:
 142:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	while(1){
 143:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_ctrl_bit_set(B_E);
 498              		.loc 1 143 0
 499 0190 4020     		movs	r0, #64
 500 0192 FFF7FEFF 		bl	graphic_ctrl_bit_set
 144:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		delay_500ns();
 501              		.loc 1 144 0
 502 0196 FFF7FEFF 		bl	delay_500ns
 145:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		c = *PORT_IDR_HIGH & LCD_BUSY;
 503              		.loc 1 145 0
 504 019a 104B     		ldr	r3, .L33+8
 505 019c 1B78     		ldrb	r3, [r3]
 506 019e DAB2     		uxtb	r2, r3
 507 01a0 FB1D     		adds	r3, r7, #7
 508 01a2 7F21     		movs	r1, #127
 509 01a4 8A43     		bics	r2, r1
 510 01a6 1A70     		strb	r2, [r3]
 146:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_ctrl_bit_clear(B_E);
 511              		.loc 1 146 0
 512 01a8 4020     		movs	r0, #64
 513 01aa FFF7FEFF 		bl	graphic_ctrl_bit_clear
 147:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		delay_500ns();
 514              		.loc 1 147 0
 515 01ae FFF7FEFF 		bl	delay_500ns
 148:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		if( c == 0)
 516              		.loc 1 148 0
 517 01b2 FB1D     		adds	r3, r7, #7
 518 01b4 1B78     		ldrb	r3, [r3]
 519 01b6 002B     		cmp	r3, #0
 520 01b8 00D0     		beq	.L32
 143:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		delay_500ns();
 521              		.loc 1 143 0
 522 01ba E9E7     		b	.L30
 523              	.L32:
 149:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 			break;
 524              		.loc 1 149 0
 525 01bc C046     		nop
 150:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		
 151:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}
 152:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_set(B_E);
 526              		.loc 1 152 0
 527 01be 4020     		movs	r0, #64
 528 01c0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 153:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	*PORT_MODER = 0x55555555;
 529              		.loc 1 153 0
 530 01c4 034B     		ldr	r3, .L33
 531 01c6 064A     		ldr	r2, .L33+12
 532 01c8 1A60     		str	r2, [r3]
 154:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 533              		.loc 1 154 0
 534 01ca C046     		nop
 535 01cc BD46     		mov	sp, r7
 536 01ce 02B0     		add	sp, sp, #8
 537              		@ sp needed
 538 01d0 80BD     		pop	{r7, pc}
 539              	.L34:
 540 01d2 C046     		.align	2
 541              	.L33:
 542 01d4 00100240 		.word	1073876992
 543 01d8 55550000 		.word	21845
 544 01dc 11100240 		.word	1073877009
 545 01e0 55555555 		.word	1431655765
 546              		.cfi_endproc
 547              	.LFE8:
 549              		.align	1
 550              		.global	graphic_read
 551              		.syntax unified
 552              		.code	16
 553              		.thumb_func
 554              		.fpu softvfp
 556              	graphic_read:
 557              	.LFB9:
 155:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** uint8_t graphic_read(uint8_t controller ){
 558              		.loc 1 155 0
 559              		.cfi_startproc
 560              		@ args = 0, pretend = 0, frame = 16
 561              		@ frame_needed = 1, uses_anonymous_args = 0
 562 01e4 80B5     		push	{r7, lr}
 563              		.cfi_def_cfa_offset 8
 564              		.cfi_offset 7, -8
 565              		.cfi_offset 14, -4
 566 01e6 84B0     		sub	sp, sp, #16
 567              		.cfi_def_cfa_offset 24
 568 01e8 00AF     		add	r7, sp, #0
 569              		.cfi_def_cfa_register 7
 570 01ea 0200     		movs	r2, r0
 571 01ec FB1D     		adds	r3, r7, #7
 572 01ee 1A70     		strb	r2, [r3]
 156:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	uint8_t RV;
 157:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 573              		.loc 1 157 0
 574 01f0 4020     		movs	r0, #64
 575 01f2 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 158:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	*PORT_MODER = 0x00005555;
 576              		.loc 1 158 0
 577 01f6 1C4B     		ldr	r3, .L39
 578 01f8 1C4A     		ldr	r2, .L39+4
 579 01fa 1A60     		str	r2, [r3]
 159:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	
 160:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_set( B_RS | B_RW);
 580              		.loc 1 160 0
 581 01fc 0320     		movs	r0, #3
 582 01fe FFF7FEFF 		bl	graphic_ctrl_bit_set
 161:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	
 162:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	select_controller( controller );
 583              		.loc 1 162 0
 584 0202 FB1D     		adds	r3, r7, #7
 585 0204 1B78     		ldrb	r3, [r3]
 586 0206 1800     		movs	r0, r3
 587 0208 FFF7FEFF 		bl	select_controller
 163:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	delay_500ns();
 588              		.loc 1 163 0
 589 020c FFF7FEFF 		bl	delay_500ns
 164:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	
 165:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_set( B_E );
 590              		.loc 1 165 0
 591 0210 4020     		movs	r0, #64
 592 0212 FFF7FEFF 		bl	graphic_ctrl_bit_set
 166:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	delay_500ns();
 593              		.loc 1 166 0
 594 0216 FFF7FEFF 		bl	delay_500ns
 167:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	
 168:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	RV = *PORT_IDR_HIGH;
 595              		.loc 1 168 0
 596 021a 154A     		ldr	r2, .L39+8
 597 021c 0F23     		movs	r3, #15
 598 021e FB18     		adds	r3, r7, r3
 599 0220 1278     		ldrb	r2, [r2]
 600 0222 1A70     		strb	r2, [r3]
 169:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 601              		.loc 1 169 0
 602 0224 4020     		movs	r0, #64
 603 0226 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 170:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	
 171:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	*PORT_MODER = 0x55555555;
 604              		.loc 1 171 0
 605 022a 0F4B     		ldr	r3, .L39
 606 022c 114A     		ldr	r2, .L39+12
 607 022e 1A60     		str	r2, [r3]
 172:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	if( controller & B_CS1 ){
 608              		.loc 1 172 0
 609 0230 FB1D     		adds	r3, r7, #7
 610 0232 1B78     		ldrb	r3, [r3]
 611 0234 0822     		movs	r2, #8
 612 0236 1340     		ands	r3, r2
 613 0238 04D0     		beq	.L36
 173:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		select_controller(B_CS1);
 614              		.loc 1 173 0
 615 023a 0820     		movs	r0, #8
 616 023c FFF7FEFF 		bl	select_controller
 174:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_wait_ready();
 617              		.loc 1 174 0
 618 0240 FFF7FEFF 		bl	graphic_wait_ready
 619              	.L36:
 175:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}
 176:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	if( controller & B_CS2 ){
 620              		.loc 1 176 0
 621 0244 FB1D     		adds	r3, r7, #7
 622 0246 1B78     		ldrb	r3, [r3]
 623 0248 1022     		movs	r2, #16
 624 024a 1340     		ands	r3, r2
 625 024c 04D0     		beq	.L37
 177:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		select_controller(B_CS2);
 626              		.loc 1 177 0
 627 024e 1020     		movs	r0, #16
 628 0250 FFF7FEFF 		bl	select_controller
 178:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_wait_ready();
 629              		.loc 1 178 0
 630 0254 FFF7FEFF 		bl	graphic_wait_ready
 631              	.L37:
 179:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}
 180:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	return RV;
 632              		.loc 1 180 0
 633 0258 0F23     		movs	r3, #15
 634 025a FB18     		adds	r3, r7, r3
 635 025c 1B78     		ldrb	r3, [r3]
 181:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 636              		.loc 1 181 0
 637 025e 1800     		movs	r0, r3
 638 0260 BD46     		mov	sp, r7
 639 0262 04B0     		add	sp, sp, #16
 640              		@ sp needed
 641 0264 80BD     		pop	{r7, pc}
 642              	.L40:
 643 0266 C046     		.align	2
 644              	.L39:
 645 0268 00100240 		.word	1073876992
 646 026c 55550000 		.word	21845
 647 0270 11100240 		.word	1073877009
 648 0274 55555555 		.word	1431655765
 649              		.cfi_endproc
 650              	.LFE9:
 652              		.align	1
 653              		.global	graphic_read_data
 654              		.syntax unified
 655              		.code	16
 656              		.thumb_func
 657              		.fpu softvfp
 659              	graphic_read_data:
 660              	.LFB10:
 182:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** uint8_t graphic_read_data(unsigned char controller){
 661              		.loc 1 182 0
 662              		.cfi_startproc
 663              		@ args = 0, pretend = 0, frame = 8
 664              		@ frame_needed = 1, uses_anonymous_args = 0
 665 0278 80B5     		push	{r7, lr}
 666              		.cfi_def_cfa_offset 8
 667              		.cfi_offset 7, -8
 668              		.cfi_offset 14, -4
 669 027a 82B0     		sub	sp, sp, #8
 670              		.cfi_def_cfa_offset 16
 671 027c 00AF     		add	r7, sp, #0
 672              		.cfi_def_cfa_register 7
 673 027e 0200     		movs	r2, r0
 674 0280 FB1D     		adds	r3, r7, #7
 675 0282 1A70     		strb	r2, [r3]
 183:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_read(controller);
 676              		.loc 1 183 0
 677 0284 FB1D     		adds	r3, r7, #7
 678 0286 1B78     		ldrb	r3, [r3]
 679 0288 1800     		movs	r0, r3
 680 028a FFF7FEFF 		bl	graphic_read
 184:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	return graphic_read(controller);
 681              		.loc 1 184 0
 682 028e FB1D     		adds	r3, r7, #7
 683 0290 1B78     		ldrb	r3, [r3]
 684 0292 1800     		movs	r0, r3
 685 0294 FFF7FEFF 		bl	graphic_read
 686 0298 0300     		movs	r3, r0
 185:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	
 186:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 687              		.loc 1 186 0
 688 029a 1800     		movs	r0, r3
 689 029c BD46     		mov	sp, r7
 690 029e 02B0     		add	sp, sp, #8
 691              		@ sp needed
 692 02a0 80BD     		pop	{r7, pc}
 693              		.cfi_endproc
 694              	.LFE10:
 696              		.align	1
 697              		.global	graphic_write
 698              		.syntax unified
 699              		.code	16
 700              		.thumb_func
 701              		.fpu softvfp
 703              	graphic_write:
 704              	.LFB11:
 187:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void graphic_write(uint8_t value, uint8_t controller){
 705              		.loc 1 187 0
 706              		.cfi_startproc
 707              		@ args = 0, pretend = 0, frame = 8
 708              		@ frame_needed = 1, uses_anonymous_args = 0
 709 02a2 80B5     		push	{r7, lr}
 710              		.cfi_def_cfa_offset 8
 711              		.cfi_offset 7, -8
 712              		.cfi_offset 14, -4
 713 02a4 82B0     		sub	sp, sp, #8
 714              		.cfi_def_cfa_offset 16
 715 02a6 00AF     		add	r7, sp, #0
 716              		.cfi_def_cfa_register 7
 717 02a8 0200     		movs	r2, r0
 718 02aa FB1D     		adds	r3, r7, #7
 719 02ac 1A70     		strb	r2, [r3]
 720 02ae BB1D     		adds	r3, r7, #6
 721 02b0 0A1C     		adds	r2, r1, #0
 722 02b2 1A70     		strb	r2, [r3]
 188:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	*PORT_ODR_HIGH = value;
 723              		.loc 1 188 0
 724 02b4 194A     		ldr	r2, .L46
 725 02b6 FB1D     		adds	r3, r7, #7
 726 02b8 1B78     		ldrb	r3, [r3]
 727 02ba 1370     		strb	r3, [r2]
 189:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	select_controller(controller);
 728              		.loc 1 189 0
 729 02bc BB1D     		adds	r3, r7, #6
 730 02be 1B78     		ldrb	r3, [r3]
 731 02c0 1800     		movs	r0, r3
 732 02c2 FFF7FEFF 		bl	select_controller
 190:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	delay_500ns();
 733              		.loc 1 190 0
 734 02c6 FFF7FEFF 		bl	delay_500ns
 191:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_set(B_E);
 735              		.loc 1 191 0
 736 02ca 4020     		movs	r0, #64
 737 02cc FFF7FEFF 		bl	graphic_ctrl_bit_set
 192:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	delay_500ns();
 738              		.loc 1 192 0
 739 02d0 FFF7FEFF 		bl	delay_500ns
 193:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 740              		.loc 1 193 0
 741 02d4 4020     		movs	r0, #64
 742 02d6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 194:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	
 195:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	if( controller & B_CS1 ){
 743              		.loc 1 195 0
 744 02da BB1D     		adds	r3, r7, #6
 745 02dc 1B78     		ldrb	r3, [r3]
 746 02de 0822     		movs	r2, #8
 747 02e0 1340     		ands	r3, r2
 748 02e2 04D0     		beq	.L44
 196:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		select_controller( B_CS1 );
 749              		.loc 1 196 0
 750 02e4 0820     		movs	r0, #8
 751 02e6 FFF7FEFF 		bl	select_controller
 197:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_wait_ready();
 752              		.loc 1 197 0
 753 02ea FFF7FEFF 		bl	graphic_wait_ready
 754              	.L44:
 198:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}
 199:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	if( controller & B_CS2 ){
 755              		.loc 1 199 0
 756 02ee BB1D     		adds	r3, r7, #6
 757 02f0 1B78     		ldrb	r3, [r3]
 758 02f2 1022     		movs	r2, #16
 759 02f4 1340     		ands	r3, r2
 760 02f6 04D0     		beq	.L45
 200:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		select_controller( B_CS2 );
 761              		.loc 1 200 0
 762 02f8 1020     		movs	r0, #16
 763 02fa FFF7FEFF 		bl	select_controller
 201:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_wait_ready();
 764              		.loc 1 201 0
 765 02fe FFF7FEFF 		bl	graphic_wait_ready
 766              	.L45:
 202:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}
 203:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	*PORT_ODR_HIGH = 0x0;
 767              		.loc 1 203 0
 768 0302 064B     		ldr	r3, .L46
 769 0304 0022     		movs	r2, #0
 770 0306 1A70     		strb	r2, [r3]
 204:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_set(B_E);
 771              		.loc 1 204 0
 772 0308 4020     		movs	r0, #64
 773 030a FFF7FEFF 		bl	graphic_ctrl_bit_set
 205:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	select_controller(0);
 774              		.loc 1 205 0
 775 030e 0020     		movs	r0, #0
 776 0310 FFF7FEFF 		bl	select_controller
 206:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 777              		.loc 1 206 0
 778 0314 C046     		nop
 779 0316 BD46     		mov	sp, r7
 780 0318 02B0     		add	sp, sp, #8
 781              		@ sp needed
 782 031a 80BD     		pop	{r7, pc}
 783              	.L47:
 784              		.align	2
 785              	.L46:
 786 031c 15100240 		.word	1073877013
 787              		.cfi_endproc
 788              	.LFE11:
 790              		.align	1
 791              		.global	graphic_write_command
 792              		.syntax unified
 793              		.code	16
 794              		.thumb_func
 795              		.fpu softvfp
 797              	graphic_write_command:
 798              	.LFB12:
 207:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 799              		.loc 1 207 0
 800              		.cfi_startproc
 801              		@ args = 0, pretend = 0, frame = 8
 802              		@ frame_needed = 1, uses_anonymous_args = 0
 803 0320 80B5     		push	{r7, lr}
 804              		.cfi_def_cfa_offset 8
 805              		.cfi_offset 7, -8
 806              		.cfi_offset 14, -4
 807 0322 82B0     		sub	sp, sp, #8
 808              		.cfi_def_cfa_offset 16
 809 0324 00AF     		add	r7, sp, #0
 810              		.cfi_def_cfa_register 7
 811 0326 0200     		movs	r2, r0
 812 0328 FB1D     		adds	r3, r7, #7
 813 032a 1A70     		strb	r2, [r3]
 814 032c BB1D     		adds	r3, r7, #6
 815 032e 0A1C     		adds	r2, r1, #0
 816 0330 1A70     		strb	r2, [r3]
 208:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 817              		.loc 1 208 0
 818 0332 4020     		movs	r0, #64
 819 0334 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 209:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	select_controller( controller );
 820              		.loc 1 209 0
 821 0338 BB1D     		adds	r3, r7, #6
 822 033a 1B78     		ldrb	r3, [r3]
 823 033c 1800     		movs	r0, r3
 824 033e FFF7FEFF 		bl	select_controller
 210:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_clear( B_RS | B_RW );
 825              		.loc 1 210 0
 826 0342 0320     		movs	r0, #3
 827 0344 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 211:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_write( command, controller );
 828              		.loc 1 211 0
 829 0348 BB1D     		adds	r3, r7, #6
 830 034a 1A78     		ldrb	r2, [r3]
 831 034c FB1D     		adds	r3, r7, #7
 832 034e 1B78     		ldrb	r3, [r3]
 833 0350 1100     		movs	r1, r2
 834 0352 1800     		movs	r0, r3
 835 0354 FFF7FEFF 		bl	graphic_write
 212:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 836              		.loc 1 212 0
 837 0358 C046     		nop
 838 035a BD46     		mov	sp, r7
 839 035c 02B0     		add	sp, sp, #8
 840              		@ sp needed
 841 035e 80BD     		pop	{r7, pc}
 842              		.cfi_endproc
 843              	.LFE12:
 845              		.align	1
 846              		.global	graphic_write_data
 847              		.syntax unified
 848              		.code	16
 849              		.thumb_func
 850              		.fpu softvfp
 852              	graphic_write_data:
 853              	.LFB13:
 213:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void graphic_write_data( uint8_t data, uint8_t controller ){
 854              		.loc 1 213 0
 855              		.cfi_startproc
 856              		@ args = 0, pretend = 0, frame = 8
 857              		@ frame_needed = 1, uses_anonymous_args = 0
 858 0360 80B5     		push	{r7, lr}
 859              		.cfi_def_cfa_offset 8
 860              		.cfi_offset 7, -8
 861              		.cfi_offset 14, -4
 862 0362 82B0     		sub	sp, sp, #8
 863              		.cfi_def_cfa_offset 16
 864 0364 00AF     		add	r7, sp, #0
 865              		.cfi_def_cfa_register 7
 866 0366 0200     		movs	r2, r0
 867 0368 FB1D     		adds	r3, r7, #7
 868 036a 1A70     		strb	r2, [r3]
 869 036c BB1D     		adds	r3, r7, #6
 870 036e 0A1C     		adds	r2, r1, #0
 871 0370 1A70     		strb	r2, [r3]
 214:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 872              		.loc 1 214 0
 873 0372 4020     		movs	r0, #64
 874 0374 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 215:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	select_controller( controller );
 875              		.loc 1 215 0
 876 0378 BB1D     		adds	r3, r7, #6
 877 037a 1B78     		ldrb	r3, [r3]
 878 037c 1800     		movs	r0, r3
 879 037e FFF7FEFF 		bl	select_controller
 216:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_set( B_RS );
 880              		.loc 1 216 0
 881 0382 0120     		movs	r0, #1
 882 0384 FFF7FEFF 		bl	graphic_ctrl_bit_set
 217:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_clear( B_RW );
 883              		.loc 1 217 0
 884 0388 0220     		movs	r0, #2
 885 038a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 218:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_write( data, controller );
 886              		.loc 1 218 0
 887 038e BB1D     		adds	r3, r7, #6
 888 0390 1A78     		ldrb	r2, [r3]
 889 0392 FB1D     		adds	r3, r7, #7
 890 0394 1B78     		ldrb	r3, [r3]
 891 0396 1100     		movs	r1, r2
 892 0398 1800     		movs	r0, r3
 893 039a FFF7FEFF 		bl	graphic_write
 219:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 894              		.loc 1 219 0
 895 039e C046     		nop
 896 03a0 BD46     		mov	sp, r7
 897 03a2 02B0     		add	sp, sp, #8
 898              		@ sp needed
 899 03a4 80BD     		pop	{r7, pc}
 900              		.cfi_endproc
 901              	.LFE13:
 903              		.align	1
 904              		.global	graphic_clear_screen
 905              		.syntax unified
 906              		.code	16
 907              		.thumb_func
 908              		.fpu softvfp
 910              	graphic_clear_screen:
 911              	.LFB14:
 220:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void graphic_clear_screen(void){
 912              		.loc 1 220 0
 913              		.cfi_startproc
 914              		@ args = 0, pretend = 0, frame = 8
 915              		@ frame_needed = 1, uses_anonymous_args = 0
 916 03a6 80B5     		push	{r7, lr}
 917              		.cfi_def_cfa_offset 8
 918              		.cfi_offset 7, -8
 919              		.cfi_offset 14, -4
 920 03a8 82B0     		sub	sp, sp, #8
 921              		.cfi_def_cfa_offset 16
 922 03aa 00AF     		add	r7, sp, #0
 923              		.cfi_def_cfa_register 7
 924              	.LBB2:
 221:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	for( int i = 0; i < 7; i++){											//KAN SKAPA PROBLEM DÅ I ALDRiG ÄR 7, SAMMA MED K
 925              		.loc 1 221 0
 926 03ac 0023     		movs	r3, #0
 927 03ae 7B60     		str	r3, [r7, #4]
 928 03b0 1EE0     		b	.L51
 929              	.L54:
 222:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_write_command( LCD_SET_PAGE | i, B_CS1 | B_CS2 );
 930              		.loc 1 222 0
 931 03b2 7B68     		ldr	r3, [r7, #4]
 932 03b4 5BB2     		sxtb	r3, r3
 933 03b6 4822     		movs	r2, #72
 934 03b8 5242     		rsbs	r2, r2, #0
 935 03ba 1343     		orrs	r3, r2
 936 03bc 5BB2     		sxtb	r3, r3
 937 03be DBB2     		uxtb	r3, r3
 938 03c0 1821     		movs	r1, #24
 939 03c2 1800     		movs	r0, r3
 940 03c4 FFF7FEFF 		bl	graphic_write_command
 223:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_write_command( LCD_SET_ADD	| 0, B_CS1 | B_CS2 );
 941              		.loc 1 223 0
 942 03c8 1821     		movs	r1, #24
 943 03ca 4020     		movs	r0, #64
 944 03cc FFF7FEFF 		bl	graphic_write_command
 945              	.LBB3:
 224:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		for(int k = 0; k < 63; k++){
 946              		.loc 1 224 0
 947 03d0 0023     		movs	r3, #0
 948 03d2 3B60     		str	r3, [r7]
 949 03d4 06E0     		b	.L52
 950              	.L53:
 225:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 			graphic_write_data( 0, B_CS1 | B_CS2 );
 951              		.loc 1 225 0 discriminator 3
 952 03d6 1821     		movs	r1, #24
 953 03d8 0020     		movs	r0, #0
 954 03da FFF7FEFF 		bl	graphic_write_data
 224:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		for(int k = 0; k < 63; k++){
 955              		.loc 1 224 0 discriminator 3
 956 03de 3B68     		ldr	r3, [r7]
 957 03e0 0133     		adds	r3, r3, #1
 958 03e2 3B60     		str	r3, [r7]
 959              	.L52:
 224:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		for(int k = 0; k < 63; k++){
 960              		.loc 1 224 0 is_stmt 0 discriminator 1
 961 03e4 3B68     		ldr	r3, [r7]
 962 03e6 3E2B     		cmp	r3, #62
 963 03e8 F5DD     		ble	.L53
 964              	.LBE3:
 221:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_write_command( LCD_SET_PAGE | i, B_CS1 | B_CS2 );
 965              		.loc 1 221 0 is_stmt 1 discriminator 2
 966 03ea 7B68     		ldr	r3, [r7, #4]
 967 03ec 0133     		adds	r3, r3, #1
 968 03ee 7B60     		str	r3, [r7, #4]
 969              	.L51:
 221:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		graphic_write_command( LCD_SET_PAGE | i, B_CS1 | B_CS2 );
 970              		.loc 1 221 0 is_stmt 0 discriminator 1
 971 03f0 7B68     		ldr	r3, [r7, #4]
 972 03f2 062B     		cmp	r3, #6
 973 03f4 DDDD     		ble	.L54
 974              	.LBE2:
 226:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		}
 227:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}
 228:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 975              		.loc 1 228 0 is_stmt 1
 976 03f6 C046     		nop
 977 03f8 BD46     		mov	sp, r7
 978 03fa 02B0     		add	sp, sp, #8
 979              		@ sp needed
 980 03fc 80BD     		pop	{r7, pc}
 981              		.cfi_endproc
 982              	.LFE14:
 984              		.align	1
 985              		.global	pixel
 986              		.syntax unified
 987              		.code	16
 988              		.thumb_func
 989              		.fpu softvfp
 991              	pixel:
 992              	.LFB15:
 229:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void pixel(unsigned x, unsigned y, unsigned set){
 993              		.loc 1 229 0
 994              		.cfi_startproc
 995              		@ args = 0, pretend = 0, frame = 32
 996              		@ frame_needed = 1, uses_anonymous_args = 0
 997 03fe B0B5     		push	{r4, r5, r7, lr}
 998              		.cfi_def_cfa_offset 16
 999              		.cfi_offset 4, -16
 1000              		.cfi_offset 5, -12
 1001              		.cfi_offset 7, -8
 1002              		.cfi_offset 14, -4
 1003 0400 88B0     		sub	sp, sp, #32
 1004              		.cfi_def_cfa_offset 48
 1005 0402 00AF     		add	r7, sp, #0
 1006              		.cfi_def_cfa_register 7
 1007 0404 F860     		str	r0, [r7, #12]
 1008 0406 B960     		str	r1, [r7, #8]
 1009 0408 7A60     		str	r2, [r7, #4]
 230:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	uint8_t mask, c, controller;
 231:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	int index;
 232:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	
 233:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	if(x < 1 || y < 1 || x > 128 || y > 64)
 1010              		.loc 1 233 0
 1011 040a FB68     		ldr	r3, [r7, #12]
 1012 040c 002B     		cmp	r3, #0
 1013 040e 00D1     		bne	.LCB769
 1014 0410 ABE0     		b	.L74	@long jump
 1015              	.LCB769:
 1016              		.loc 1 233 0 is_stmt 0 discriminator 1
 1017 0412 BB68     		ldr	r3, [r7, #8]
 1018 0414 002B     		cmp	r3, #0
 1019 0416 00D1     		bne	.LCB772
 1020 0418 A7E0     		b	.L74	@long jump
 1021              	.LCB772:
 1022              		.loc 1 233 0 discriminator 2
 1023 041a FB68     		ldr	r3, [r7, #12]
 1024 041c 802B     		cmp	r3, #128
 1025 041e 00D9     		bls	.LCB775
 1026 0420 A3E0     		b	.L74	@long jump
 1027              	.LCB775:
 1028              		.loc 1 233 0 discriminator 3
 1029 0422 BB68     		ldr	r3, [r7, #8]
 1030 0424 402B     		cmp	r3, #64
 1031 0426 00D9     		bls	.LCB778
 1032 0428 9FE0     		b	.L74	@long jump
 1033              	.LCB778:
 234:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		return;
 235:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	index = (y-1)/8;
 1034              		.loc 1 235 0 is_stmt 1
 1035 042a BB68     		ldr	r3, [r7, #8]
 1036 042c 013B     		subs	r3, r3, #1
 1037 042e DB08     		lsrs	r3, r3, #3
 1038 0430 BB61     		str	r3, [r7, #24]
 236:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	switch((y-1)%8){
 1039              		.loc 1 236 0
 1040 0432 BB68     		ldr	r3, [r7, #8]
 1041 0434 013B     		subs	r3, r3, #1
 1042 0436 0722     		movs	r2, #7
 1043 0438 1340     		ands	r3, r2
 1044 043a 072B     		cmp	r3, #7
 1045 043c 2CD8     		bhi	.L59
 1046 043e 9A00     		lsls	r2, r3, #2
 1047 0440 4C4B     		ldr	r3, .L75
 1048 0442 D318     		adds	r3, r2, r3
 1049 0444 1B68     		ldr	r3, [r3]
 1050 0446 9F46     		mov	pc, r3
 1051              		.section	.rodata
 1052              		.align	2
 1053              	.L61:
 1054 0000 48040000 		.word	.L60
 1055 0004 52040000 		.word	.L62
 1056 0008 5C040000 		.word	.L63
 1057 000c 66040000 		.word	.L64
 1058 0010 70040000 		.word	.L65
 1059 0014 7A040000 		.word	.L66
 1060 0018 84040000 		.word	.L67
 1061 001c 8E040000 		.word	.L68
 1062              		.text
 1063              	.L60:
 237:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		case 0: mask = 1; break;
 1064              		.loc 1 237 0
 1065 0448 1F23     		movs	r3, #31
 1066 044a FB18     		adds	r3, r7, r3
 1067 044c 0122     		movs	r2, #1
 1068 044e 1A70     		strb	r2, [r3]
 1069 0450 22E0     		b	.L59
 1070              	.L62:
 238:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		case 1:	mask = 2; break;
 1071              		.loc 1 238 0
 1072 0452 1F23     		movs	r3, #31
 1073 0454 FB18     		adds	r3, r7, r3
 1074 0456 0222     		movs	r2, #2
 1075 0458 1A70     		strb	r2, [r3]
 1076 045a 1DE0     		b	.L59
 1077              	.L63:
 239:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		case 2: mask = 4; break;
 1078              		.loc 1 239 0
 1079 045c 1F23     		movs	r3, #31
 1080 045e FB18     		adds	r3, r7, r3
 1081 0460 0422     		movs	r2, #4
 1082 0462 1A70     		strb	r2, [r3]
 1083 0464 18E0     		b	.L59
 1084              	.L64:
 240:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		case 3: mask = 8; break;
 1085              		.loc 1 240 0
 1086 0466 1F23     		movs	r3, #31
 1087 0468 FB18     		adds	r3, r7, r3
 1088 046a 0822     		movs	r2, #8
 1089 046c 1A70     		strb	r2, [r3]
 1090 046e 13E0     		b	.L59
 1091              	.L65:
 241:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		case 4: mask = 0x10; break;
 1092              		.loc 1 241 0
 1093 0470 1F23     		movs	r3, #31
 1094 0472 FB18     		adds	r3, r7, r3
 1095 0474 1022     		movs	r2, #16
 1096 0476 1A70     		strb	r2, [r3]
 1097 0478 0EE0     		b	.L59
 1098              	.L66:
 242:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		case 5: mask = 0x20; break;
 1099              		.loc 1 242 0
 1100 047a 1F23     		movs	r3, #31
 1101 047c FB18     		adds	r3, r7, r3
 1102 047e 2022     		movs	r2, #32
 1103 0480 1A70     		strb	r2, [r3]
 1104 0482 09E0     		b	.L59
 1105              	.L67:
 243:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		case 6: mask = 0x40; break;
 1106              		.loc 1 243 0
 1107 0484 1F23     		movs	r3, #31
 1108 0486 FB18     		adds	r3, r7, r3
 1109 0488 4022     		movs	r2, #64
 1110 048a 1A70     		strb	r2, [r3]
 1111 048c 04E0     		b	.L59
 1112              	.L68:
 244:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		case 7: mask = 0x80; break;
 1113              		.loc 1 244 0
 1114 048e 1F23     		movs	r3, #31
 1115 0490 FB18     		adds	r3, r7, r3
 1116 0492 8022     		movs	r2, #128
 1117 0494 1A70     		strb	r2, [r3]
 1118 0496 C046     		nop
 1119              	.L59:
 245:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}
 246:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	if(set == 0)
 1120              		.loc 1 246 0
 1121 0498 7B68     		ldr	r3, [r7, #4]
 1122 049a 002B     		cmp	r3, #0
 1123 049c 05D1     		bne	.L69
 247:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		mask = ~mask;
 1124              		.loc 1 247 0
 1125 049e 1F22     		movs	r2, #31
 1126 04a0 BB18     		adds	r3, r7, r2
 1127 04a2 BA18     		adds	r2, r7, r2
 1128 04a4 1278     		ldrb	r2, [r2]
 1129 04a6 D243     		mvns	r2, r2
 1130 04a8 1A70     		strb	r2, [r3]
 1131              	.L69:
 248:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	if(x > 64){
 1132              		.loc 1 248 0
 1133 04aa FB68     		ldr	r3, [r7, #12]
 1134 04ac 402B     		cmp	r3, #64
 1135 04ae 07D9     		bls	.L70
 249:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		controller = B_CS2;
 1136              		.loc 1 249 0
 1137 04b0 1E23     		movs	r3, #30
 1138 04b2 FB18     		adds	r3, r7, r3
 1139 04b4 1022     		movs	r2, #16
 1140 04b6 1A70     		strb	r2, [r3]
 250:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		x = x-65;
 1141              		.loc 1 250 0
 1142 04b8 FB68     		ldr	r3, [r7, #12]
 1143 04ba 413B     		subs	r3, r3, #65
 1144 04bc FB60     		str	r3, [r7, #12]
 1145 04be 06E0     		b	.L71
 1146              	.L70:
 251:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}else{ 
 252:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		controller = B_CS1;
 1147              		.loc 1 252 0
 1148 04c0 1E23     		movs	r3, #30
 1149 04c2 FB18     		adds	r3, r7, r3
 1150 04c4 0822     		movs	r2, #8
 1151 04c6 1A70     		strb	r2, [r3]
 253:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		x = x-1;	
 1152              		.loc 1 253 0
 1153 04c8 FB68     		ldr	r3, [r7, #12]
 1154 04ca 013B     		subs	r3, r3, #1
 1155 04cc FB60     		str	r3, [r7, #12]
 1156              	.L71:
 254:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}
 255:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_write_command(LCD_SET_ADD | x, controller);
 1157              		.loc 1 255 0
 1158 04ce FB68     		ldr	r3, [r7, #12]
 1159 04d0 DBB2     		uxtb	r3, r3
 1160 04d2 4022     		movs	r2, #64
 1161 04d4 1343     		orrs	r3, r2
 1162 04d6 DAB2     		uxtb	r2, r3
 1163 04d8 1E25     		movs	r5, #30
 1164 04da 7B19     		adds	r3, r7, r5
 1165 04dc 1B78     		ldrb	r3, [r3]
 1166 04de 1900     		movs	r1, r3
 1167 04e0 1000     		movs	r0, r2
 1168 04e2 FFF7FEFF 		bl	graphic_write_command
 256:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_write_command(LCD_SET_PAGE | index, controller);
 1169              		.loc 1 256 0
 1170 04e6 BB69     		ldr	r3, [r7, #24]
 1171 04e8 5BB2     		sxtb	r3, r3
 1172 04ea 4822     		movs	r2, #72
 1173 04ec 5242     		rsbs	r2, r2, #0
 1174 04ee 1343     		orrs	r3, r2
 1175 04f0 5BB2     		sxtb	r3, r3
 1176 04f2 DAB2     		uxtb	r2, r3
 1177 04f4 7B19     		adds	r3, r7, r5
 1178 04f6 1B78     		ldrb	r3, [r3]
 1179 04f8 1900     		movs	r1, r3
 1180 04fa 1000     		movs	r0, r2
 1181 04fc FFF7FEFF 		bl	graphic_write_command
 257:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	c = graphic_read_data(controller);
 1182              		.loc 1 257 0
 1183 0500 1723     		movs	r3, #23
 1184 0502 FC18     		adds	r4, r7, r3
 1185 0504 7B19     		adds	r3, r7, r5
 1186 0506 1B78     		ldrb	r3, [r3]
 1187 0508 1800     		movs	r0, r3
 1188 050a FFF7FEFF 		bl	graphic_read_data
 1189 050e 0300     		movs	r3, r0
 1190 0510 2370     		strb	r3, [r4]
 258:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_write_command(LCD_SET_ADD | x, controller);
 1191              		.loc 1 258 0
 1192 0512 FB68     		ldr	r3, [r7, #12]
 1193 0514 DBB2     		uxtb	r3, r3
 1194 0516 4022     		movs	r2, #64
 1195 0518 1343     		orrs	r3, r2
 1196 051a DAB2     		uxtb	r2, r3
 1197 051c 7B19     		adds	r3, r7, r5
 1198 051e 1B78     		ldrb	r3, [r3]
 1199 0520 1900     		movs	r1, r3
 1200 0522 1000     		movs	r0, r2
 1201 0524 FFF7FEFF 		bl	graphic_write_command
 259:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	if(set == 1){
 1202              		.loc 1 259 0
 1203 0528 7B68     		ldr	r3, [r7, #4]
 1204 052a 012B     		cmp	r3, #1
 1205 052c 09D1     		bne	.L72
 260:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		mask = mask | c;
 1206              		.loc 1 260 0
 1207 052e 1F22     		movs	r2, #31
 1208 0530 BB18     		adds	r3, r7, r2
 1209 0532 B918     		adds	r1, r7, r2
 1210 0534 1722     		movs	r2, #23
 1211 0536 BA18     		adds	r2, r7, r2
 1212 0538 0978     		ldrb	r1, [r1]
 1213 053a 1278     		ldrb	r2, [r2]
 1214 053c 0A43     		orrs	r2, r1
 1215 053e 1A70     		strb	r2, [r3]
 1216 0540 08E0     		b	.L73
 1217              	.L72:
 261:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}else{
 262:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		mask = mask & c;
 1218              		.loc 1 262 0
 1219 0542 1F22     		movs	r2, #31
 1220 0544 BB18     		adds	r3, r7, r2
 1221 0546 BA18     		adds	r2, r7, r2
 1222 0548 1721     		movs	r1, #23
 1223 054a 7918     		adds	r1, r7, r1
 1224 054c 1278     		ldrb	r2, [r2]
 1225 054e 0978     		ldrb	r1, [r1]
 1226 0550 0A40     		ands	r2, r1
 1227 0552 1A70     		strb	r2, [r3]
 1228              	.L73:
 263:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}
 264:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_write_data(mask, controller);
 1229              		.loc 1 264 0
 1230 0554 1E23     		movs	r3, #30
 1231 0556 FB18     		adds	r3, r7, r3
 1232 0558 1A78     		ldrb	r2, [r3]
 1233 055a 1F23     		movs	r3, #31
 1234 055c FB18     		adds	r3, r7, r3
 1235 055e 1B78     		ldrb	r3, [r3]
 1236 0560 1100     		movs	r1, r2
 1237 0562 1800     		movs	r0, r3
 1238 0564 FFF7FEFF 		bl	graphic_write_data
 1239 0568 00E0     		b	.L55
 1240              	.L74:
 234:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	index = (y-1)/8;
 1241              		.loc 1 234 0
 1242 056a C046     		nop
 1243              	.L55:
 265:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 1244              		.loc 1 265 0
 1245 056c BD46     		mov	sp, r7
 1246 056e 08B0     		add	sp, sp, #32
 1247              		@ sp needed
 1248 0570 B0BD     		pop	{r4, r5, r7, pc}
 1249              	.L76:
 1250 0572 C046     		.align	2
 1251              	.L75:
 1252 0574 00000000 		.word	.L61
 1253              		.cfi_endproc
 1254              	.LFE15:
 1256              		.align	1
 1257              		.global	set_object_speed
 1258              		.syntax unified
 1259              		.code	16
 1260              		.thumb_func
 1261              		.fpu softvfp
 1263              	set_object_speed:
 1264              	.LFB16:
 266:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void set_object_speed(POBJECT object, int speedx, int speedy){
 1265              		.loc 1 266 0
 1266              		.cfi_startproc
 1267              		@ args = 0, pretend = 0, frame = 16
 1268              		@ frame_needed = 1, uses_anonymous_args = 0
 1269 0578 80B5     		push	{r7, lr}
 1270              		.cfi_def_cfa_offset 8
 1271              		.cfi_offset 7, -8
 1272              		.cfi_offset 14, -4
 1273 057a 84B0     		sub	sp, sp, #16
 1274              		.cfi_def_cfa_offset 24
 1275 057c 00AF     		add	r7, sp, #0
 1276              		.cfi_def_cfa_register 7
 1277 057e F860     		str	r0, [r7, #12]
 1278 0580 B960     		str	r1, [r7, #8]
 1279 0582 7A60     		str	r2, [r7, #4]
 267:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	object->dirx = speedx;
 1280              		.loc 1 267 0
 1281 0584 FB68     		ldr	r3, [r7, #12]
 1282 0586 BA68     		ldr	r2, [r7, #8]
 1283 0588 5A60     		str	r2, [r3, #4]
 268:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	object->diry = speedy;
 1284              		.loc 1 268 0
 1285 058a FB68     		ldr	r3, [r7, #12]
 1286 058c 7A68     		ldr	r2, [r7, #4]
 1287 058e 9A60     		str	r2, [r3, #8]
 269:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 1288              		.loc 1 269 0
 1289 0590 C046     		nop
 1290 0592 BD46     		mov	sp, r7
 1291 0594 04B0     		add	sp, sp, #16
 1292              		@ sp needed
 1293 0596 80BD     		pop	{r7, pc}
 1294              		.cfi_endproc
 1295              	.LFE16:
 1297              		.align	1
 1298              		.global	draw_object
 1299              		.syntax unified
 1300              		.code	16
 1301              		.thumb_func
 1302              		.fpu softvfp
 1304              	draw_object:
 1305              	.LFB17:
 270:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void draw_object(POBJECT object){
 1306              		.loc 1 270 0
 1307              		.cfi_startproc
 1308              		@ args = 0, pretend = 0, frame = 16
 1309              		@ frame_needed = 1, uses_anonymous_args = 0
 1310 0598 80B5     		push	{r7, lr}
 1311              		.cfi_def_cfa_offset 8
 1312              		.cfi_offset 7, -8
 1313              		.cfi_offset 14, -4
 1314 059a 84B0     		sub	sp, sp, #16
 1315              		.cfi_def_cfa_offset 24
 1316 059c 00AF     		add	r7, sp, #0
 1317              		.cfi_def_cfa_register 7
 1318 059e 7860     		str	r0, [r7, #4]
 1319              	.LBB4:
 271:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	for(int i = 0; i < object->geo->numPoints; i++){
 1320              		.loc 1 271 0
 1321 05a0 0023     		movs	r3, #0
 1322 05a2 FB60     		str	r3, [r7, #12]
 1323 05a4 1FE0     		b	.L79
 1324              	.L80:
 272:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 			pixel( object->geo->px[i].x+object->posx, object->geo->px[i].y+object->posy,1 );
 1325              		.loc 1 272 0 discriminator 3
 1326 05a6 7B68     		ldr	r3, [r7, #4]
 1327 05a8 1A68     		ldr	r2, [r3]
 1328 05aa FB68     		ldr	r3, [r7, #12]
 1329 05ac 0433     		adds	r3, r3, #4
 1330 05ae 5B00     		lsls	r3, r3, #1
 1331 05b0 D318     		adds	r3, r2, r3
 1332 05b2 0433     		adds	r3, r3, #4
 1333 05b4 1B78     		ldrb	r3, [r3]
 1334 05b6 1A00     		movs	r2, r3
 1335 05b8 7B68     		ldr	r3, [r7, #4]
 1336 05ba DB68     		ldr	r3, [r3, #12]
 1337 05bc D318     		adds	r3, r2, r3
 1338 05be 1800     		movs	r0, r3
 1339 05c0 7B68     		ldr	r3, [r7, #4]
 1340 05c2 1A68     		ldr	r2, [r3]
 1341 05c4 FB68     		ldr	r3, [r7, #12]
 1342 05c6 0433     		adds	r3, r3, #4
 1343 05c8 5B00     		lsls	r3, r3, #1
 1344 05ca D318     		adds	r3, r2, r3
 1345 05cc 0533     		adds	r3, r3, #5
 1346 05ce 1B78     		ldrb	r3, [r3]
 1347 05d0 1A00     		movs	r2, r3
 1348 05d2 7B68     		ldr	r3, [r7, #4]
 1349 05d4 1B69     		ldr	r3, [r3, #16]
 1350 05d6 D318     		adds	r3, r2, r3
 1351 05d8 0122     		movs	r2, #1
 1352 05da 1900     		movs	r1, r3
 1353 05dc FFF7FEFF 		bl	pixel
 271:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	for(int i = 0; i < object->geo->numPoints; i++){
 1354              		.loc 1 271 0 discriminator 3
 1355 05e0 FB68     		ldr	r3, [r7, #12]
 1356 05e2 0133     		adds	r3, r3, #1
 1357 05e4 FB60     		str	r3, [r7, #12]
 1358              	.L79:
 271:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	for(int i = 0; i < object->geo->numPoints; i++){
 1359              		.loc 1 271 0 is_stmt 0 discriminator 1
 1360 05e6 7B68     		ldr	r3, [r7, #4]
 1361 05e8 1B68     		ldr	r3, [r3]
 1362 05ea 1B68     		ldr	r3, [r3]
 1363 05ec FA68     		ldr	r2, [r7, #12]
 1364 05ee 9A42     		cmp	r2, r3
 1365 05f0 D9DB     		blt	.L80
 1366              	.LBE4:
 273:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}
 274:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 1367              		.loc 1 274 0 is_stmt 1
 1368 05f2 C046     		nop
 1369 05f4 BD46     		mov	sp, r7
 1370 05f6 04B0     		add	sp, sp, #16
 1371              		@ sp needed
 1372 05f8 80BD     		pop	{r7, pc}
 1373              		.cfi_endproc
 1374              	.LFE17:
 1376              		.align	1
 1377              		.global	clear_object
 1378              		.syntax unified
 1379              		.code	16
 1380              		.thumb_func
 1381              		.fpu softvfp
 1383              	clear_object:
 1384              	.LFB18:
 275:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void clear_object(POBJECT object){
 1385              		.loc 1 275 0
 1386              		.cfi_startproc
 1387              		@ args = 0, pretend = 0, frame = 16
 1388              		@ frame_needed = 1, uses_anonymous_args = 0
 1389 05fa 80B5     		push	{r7, lr}
 1390              		.cfi_def_cfa_offset 8
 1391              		.cfi_offset 7, -8
 1392              		.cfi_offset 14, -4
 1393 05fc 84B0     		sub	sp, sp, #16
 1394              		.cfi_def_cfa_offset 24
 1395 05fe 00AF     		add	r7, sp, #0
 1396              		.cfi_def_cfa_register 7
 1397 0600 7860     		str	r0, [r7, #4]
 1398              	.LBB5:
 276:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	for(int i = 0; i < object->geo->numPoints; i++){
 1399              		.loc 1 276 0
 1400 0602 0023     		movs	r3, #0
 1401 0604 FB60     		str	r3, [r7, #12]
 1402 0606 1FE0     		b	.L82
 1403              	.L83:
 277:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 			pixel( object->geo->px[i].x+object->posx, object->geo->px[i].y+object->posy,0 );
 1404              		.loc 1 277 0 discriminator 3
 1405 0608 7B68     		ldr	r3, [r7, #4]
 1406 060a 1A68     		ldr	r2, [r3]
 1407 060c FB68     		ldr	r3, [r7, #12]
 1408 060e 0433     		adds	r3, r3, #4
 1409 0610 5B00     		lsls	r3, r3, #1
 1410 0612 D318     		adds	r3, r2, r3
 1411 0614 0433     		adds	r3, r3, #4
 1412 0616 1B78     		ldrb	r3, [r3]
 1413 0618 1A00     		movs	r2, r3
 1414 061a 7B68     		ldr	r3, [r7, #4]
 1415 061c DB68     		ldr	r3, [r3, #12]
 1416 061e D318     		adds	r3, r2, r3
 1417 0620 1800     		movs	r0, r3
 1418 0622 7B68     		ldr	r3, [r7, #4]
 1419 0624 1A68     		ldr	r2, [r3]
 1420 0626 FB68     		ldr	r3, [r7, #12]
 1421 0628 0433     		adds	r3, r3, #4
 1422 062a 5B00     		lsls	r3, r3, #1
 1423 062c D318     		adds	r3, r2, r3
 1424 062e 0533     		adds	r3, r3, #5
 1425 0630 1B78     		ldrb	r3, [r3]
 1426 0632 1A00     		movs	r2, r3
 1427 0634 7B68     		ldr	r3, [r7, #4]
 1428 0636 1B69     		ldr	r3, [r3, #16]
 1429 0638 D318     		adds	r3, r2, r3
 1430 063a 0022     		movs	r2, #0
 1431 063c 1900     		movs	r1, r3
 1432 063e FFF7FEFF 		bl	pixel
 276:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	for(int i = 0; i < object->geo->numPoints; i++){
 1433              		.loc 1 276 0 discriminator 3
 1434 0642 FB68     		ldr	r3, [r7, #12]
 1435 0644 0133     		adds	r3, r3, #1
 1436 0646 FB60     		str	r3, [r7, #12]
 1437              	.L82:
 276:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	for(int i = 0; i < object->geo->numPoints; i++){
 1438              		.loc 1 276 0 is_stmt 0 discriminator 1
 1439 0648 7B68     		ldr	r3, [r7, #4]
 1440 064a 1B68     		ldr	r3, [r3]
 1441 064c 1B68     		ldr	r3, [r3]
 1442 064e FA68     		ldr	r2, [r7, #12]
 1443 0650 9A42     		cmp	r2, r3
 1444 0652 D9DB     		blt	.L83
 1445              	.LBE5:
 278:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	}
 279:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 1446              		.loc 1 279 0 is_stmt 1
 1447 0654 C046     		nop
 1448 0656 BD46     		mov	sp, r7
 1449 0658 04B0     		add	sp, sp, #16
 1450              		@ sp needed
 1451 065a 80BD     		pop	{r7, pc}
 1452              		.cfi_endproc
 1453              	.LFE18:
 1455              		.align	1
 1456              		.global	move_object
 1457              		.syntax unified
 1458              		.code	16
 1459              		.thumb_func
 1460              		.fpu softvfp
 1462              	move_object:
 1463              	.LFB19:
 280:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void move_object(POBJECT object){
 1464              		.loc 1 280 0
 1465              		.cfi_startproc
 1466              		@ args = 0, pretend = 0, frame = 8
 1467              		@ frame_needed = 1, uses_anonymous_args = 0
 1468 065c 80B5     		push	{r7, lr}
 1469              		.cfi_def_cfa_offset 8
 1470              		.cfi_offset 7, -8
 1471              		.cfi_offset 14, -4
 1472 065e 82B0     		sub	sp, sp, #8
 1473              		.cfi_def_cfa_offset 16
 1474 0660 00AF     		add	r7, sp, #0
 1475              		.cfi_def_cfa_register 7
 1476 0662 7860     		str	r0, [r7, #4]
 281:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	clear_object(object);
 1477              		.loc 1 281 0
 1478 0664 7B68     		ldr	r3, [r7, #4]
 1479 0666 1800     		movs	r0, r3
 1480 0668 FFF7FEFF 		bl	clear_object
 282:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	object->posx = object->dirx + object->posx;
 1481              		.loc 1 282 0
 1482 066c 7B68     		ldr	r3, [r7, #4]
 1483 066e 5A68     		ldr	r2, [r3, #4]
 1484 0670 7B68     		ldr	r3, [r7, #4]
 1485 0672 DB68     		ldr	r3, [r3, #12]
 1486 0674 D218     		adds	r2, r2, r3
 1487 0676 7B68     		ldr	r3, [r7, #4]
 1488 0678 DA60     		str	r2, [r3, #12]
 283:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	object->posy = object->diry + object->posy;
 1489              		.loc 1 283 0
 1490 067a 7B68     		ldr	r3, [r7, #4]
 1491 067c 9A68     		ldr	r2, [r3, #8]
 1492 067e 7B68     		ldr	r3, [r7, #4]
 1493 0680 1B69     		ldr	r3, [r3, #16]
 1494 0682 D218     		adds	r2, r2, r3
 1495 0684 7B68     		ldr	r3, [r7, #4]
 1496 0686 1A61     		str	r2, [r3, #16]
 284:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	
 285:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	if( object->posx < 1)
 1497              		.loc 1 285 0
 1498 0688 7B68     		ldr	r3, [r7, #4]
 1499 068a DB68     		ldr	r3, [r3, #12]
 1500 068c 002B     		cmp	r3, #0
 1501 068e 04DC     		bgt	.L85
 286:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		object->dirx = ~( object->dirx );
 1502              		.loc 1 286 0
 1503 0690 7B68     		ldr	r3, [r7, #4]
 1504 0692 5B68     		ldr	r3, [r3, #4]
 1505 0694 DA43     		mvns	r2, r3
 1506 0696 7B68     		ldr	r3, [r7, #4]
 1507 0698 5A60     		str	r2, [r3, #4]
 1508              	.L85:
 287:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	if( object->posx > 128 || object->geo->sizeX > 128 )
 1509              		.loc 1 287 0
 1510 069a 7B68     		ldr	r3, [r7, #4]
 1511 069c DB68     		ldr	r3, [r3, #12]
 1512 069e 802B     		cmp	r3, #128
 1513 06a0 04DC     		bgt	.L86
 1514              		.loc 1 287 0 is_stmt 0 discriminator 1
 1515 06a2 7B68     		ldr	r3, [r7, #4]
 1516 06a4 1B68     		ldr	r3, [r3]
 1517 06a6 5B68     		ldr	r3, [r3, #4]
 1518 06a8 802B     		cmp	r3, #128
 1519 06aa 04DD     		ble	.L87
 1520              	.L86:
 288:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		object->dirx = ~( object->dirx );
 1521              		.loc 1 288 0 is_stmt 1
 1522 06ac 7B68     		ldr	r3, [r7, #4]
 1523 06ae 5B68     		ldr	r3, [r3, #4]
 1524 06b0 DA43     		mvns	r2, r3
 1525 06b2 7B68     		ldr	r3, [r7, #4]
 1526 06b4 5A60     		str	r2, [r3, #4]
 1527              	.L87:
 289:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	if( object->posy < 1)
 1528              		.loc 1 289 0
 1529 06b6 7B68     		ldr	r3, [r7, #4]
 1530 06b8 1B69     		ldr	r3, [r3, #16]
 1531 06ba 002B     		cmp	r3, #0
 1532 06bc 04DC     		bgt	.L88
 290:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		object->diry = ~( object->diry );
 1533              		.loc 1 290 0
 1534 06be 7B68     		ldr	r3, [r7, #4]
 1535 06c0 9B68     		ldr	r3, [r3, #8]
 1536 06c2 DA43     		mvns	r2, r3
 1537 06c4 7B68     		ldr	r3, [r7, #4]
 1538 06c6 9A60     		str	r2, [r3, #8]
 1539              	.L88:
 291:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	if( object->posy > 64 || object->geo->sizeY > 64 )
 1540              		.loc 1 291 0
 1541 06c8 7B68     		ldr	r3, [r7, #4]
 1542 06ca 1B69     		ldr	r3, [r3, #16]
 1543 06cc 402B     		cmp	r3, #64
 1544 06ce 04DC     		bgt	.L89
 1545              		.loc 1 291 0 is_stmt 0 discriminator 1
 1546 06d0 7B68     		ldr	r3, [r7, #4]
 1547 06d2 1B68     		ldr	r3, [r3]
 1548 06d4 9B68     		ldr	r3, [r3, #8]
 1549 06d6 402B     		cmp	r3, #64
 1550 06d8 04DD     		ble	.L90
 1551              	.L89:
 292:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		object->diry = ~( object->diry );
 1552              		.loc 1 292 0 is_stmt 1
 1553 06da 7B68     		ldr	r3, [r7, #4]
 1554 06dc 9B68     		ldr	r3, [r3, #8]
 1555 06de DA43     		mvns	r2, r3
 1556 06e0 7B68     		ldr	r3, [r7, #4]
 1557 06e2 9A60     		str	r2, [r3, #8]
 1558              	.L90:
 293:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	draw_object(object);
 1559              		.loc 1 293 0
 1560 06e4 7B68     		ldr	r3, [r7, #4]
 1561 06e6 1800     		movs	r0, r3
 1562 06e8 FFF7FEFF 		bl	draw_object
 294:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 1563              		.loc 1 294 0
 1564 06ec C046     		nop
 1565 06ee BD46     		mov	sp, r7
 1566 06f0 02B0     		add	sp, sp, #8
 1567              		@ sp needed
 1568 06f2 80BD     		pop	{r7, pc}
 1569              		.cfi_endproc
 1570              	.LFE19:
 1572              		.data
 1573              		.align	2
 1576              	ball:
 1577 0034 00000000 		.word	ball_geometry
 1578 0038 00000000 		.word	0
 1579 003c 00000000 		.word	0
 1580 0040 01000000 		.word	1
 1581 0044 01000000 		.word	1
 1582 0048 00000000 		.word	draw_object
 1583 004c 00000000 		.word	clear_object
 1584 0050 00000000 		.word	move_object
 1585 0054 00000000 		.word	set_object_speed
 1586              		.text
 1587              		.align	1
 1588              		.global	activateRow
 1589              		.syntax unified
 1590              		.code	16
 1591              		.thumb_func
 1592              		.fpu softvfp
 1594              	activateRow:
 1595              	.LFB20:
 295:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** static OBJECT ball = {
 296:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	&ball_geometry,
 297:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	0,0,
 298:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	1,1,
 299:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	draw_object,
 300:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	clear_object,
 301:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	move_object,
 302:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	set_object_speed
 303:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** };
 304:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** //----------------------------------------------------KEYPAD-RELATED
 305:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 
 306:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void activateRow(int row){
 1596              		.loc 1 306 0
 1597              		.cfi_startproc
 1598              		@ args = 0, pretend = 0, frame = 8
 1599              		@ frame_needed = 1, uses_anonymous_args = 0
 1600 06f4 80B5     		push	{r7, lr}
 1601              		.cfi_def_cfa_offset 8
 1602              		.cfi_offset 7, -8
 1603              		.cfi_offset 14, -4
 1604 06f6 82B0     		sub	sp, sp, #8
 1605              		.cfi_def_cfa_offset 16
 1606 06f8 00AF     		add	r7, sp, #0
 1607              		.cfi_def_cfa_register 7
 1608 06fa 7860     		str	r0, [r7, #4]
 307:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****  
 308:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     switch(row){
 1609              		.loc 1 308 0
 1610 06fc 7B68     		ldr	r3, [r7, #4]
 1611 06fe 042B     		cmp	r3, #4
 1612 0700 19D8     		bhi	.L99
 1613 0702 7B68     		ldr	r3, [r7, #4]
 1614 0704 9A00     		lsls	r2, r3, #2
 1615 0706 0E4B     		ldr	r3, .L100
 1616 0708 D318     		adds	r3, r2, r3
 1617 070a 1B68     		ldr	r3, [r3]
 1618 070c 9F46     		mov	pc, r3
 1619              		.section	.rodata
 1620              		.align	2
 1621              	.L94:
 1622 0020 2E070000 		.word	.L93
 1623 0024 0E070000 		.word	.L95
 1624 0028 16070000 		.word	.L96
 1625 002c 1E070000 		.word	.L97
 1626 0030 26070000 		.word	.L98
 1627              		.text
 1628              	.L95:
 309:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         case 1: *PORT_D_ODR_HIGH = 0x10; break;
 1629              		.loc 1 309 0
 1630 070e 0D4B     		ldr	r3, .L100+4
 1631 0710 1022     		movs	r2, #16
 1632 0712 1A70     		strb	r2, [r3]
 1633 0714 0FE0     		b	.L92
 1634              	.L96:
 310:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         case 2: *PORT_D_ODR_HIGH = 0x20; break;
 1635              		.loc 1 310 0
 1636 0716 0B4B     		ldr	r3, .L100+4
 1637 0718 2022     		movs	r2, #32
 1638 071a 1A70     		strb	r2, [r3]
 1639 071c 0BE0     		b	.L92
 1640              	.L97:
 311:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         case 3: *PORT_D_ODR_HIGH = 0x40; break;
 1641              		.loc 1 311 0
 1642 071e 094B     		ldr	r3, .L100+4
 1643 0720 4022     		movs	r2, #64
 1644 0722 1A70     		strb	r2, [r3]
 1645 0724 07E0     		b	.L92
 1646              	.L98:
 312:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         case 4: *PORT_D_ODR_HIGH = 0x80; break;
 1647              		.loc 1 312 0
 1648 0726 074B     		ldr	r3, .L100+4
 1649 0728 8022     		movs	r2, #128
 1650 072a 1A70     		strb	r2, [r3]
 1651 072c 03E0     		b	.L92
 1652              	.L93:
 313:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         case 0: *PORT_D_ODR_HIGH = 0x00; break;
 1653              		.loc 1 313 0
 1654 072e 054B     		ldr	r3, .L100+4
 1655 0730 0022     		movs	r2, #0
 1656 0732 1A70     		strb	r2, [r3]
 1657 0734 C046     		nop
 1658              	.L92:
 1659              	.L99:
 314:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     }
 315:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 1660              		.loc 1 315 0
 1661 0736 C046     		nop
 1662 0738 BD46     		mov	sp, r7
 1663 073a 02B0     		add	sp, sp, #8
 1664              		@ sp needed
 1665 073c 80BD     		pop	{r7, pc}
 1666              	.L101:
 1667 073e C046     		.align	2
 1668              	.L100:
 1669 0740 20000000 		.word	.L94
 1670 0744 150C0240 		.word	1073875989
 1671              		.cfi_endproc
 1672              	.LFE20:
 1674              		.align	1
 1675              		.global	readColumn
 1676              		.syntax unified
 1677              		.code	16
 1678              		.thumb_func
 1679              		.fpu softvfp
 1681              	readColumn:
 1682              	.LFB21:
 316:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** int readColumn(void){
 1683              		.loc 1 316 0
 1684              		.cfi_startproc
 1685              		@ args = 0, pretend = 0, frame = 8
 1686              		@ frame_needed = 1, uses_anonymous_args = 0
 1687 0748 80B5     		push	{r7, lr}
 1688              		.cfi_def_cfa_offset 8
 1689              		.cfi_offset 7, -8
 1690              		.cfi_offset 14, -4
 1691 074a 82B0     		sub	sp, sp, #8
 1692              		.cfi_def_cfa_offset 16
 1693 074c 00AF     		add	r7, sp, #0
 1694              		.cfi_def_cfa_register 7
 317:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     unsigned char c;
 318:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     c = *PORT_D_IDR_HIGH;
 1695              		.loc 1 318 0
 1696 074e 124A     		ldr	r2, .L108
 1697 0750 FB1D     		adds	r3, r7, #7
 1698 0752 1278     		ldrb	r2, [r2]
 1699 0754 1A70     		strb	r2, [r3]
 319:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     if( c & 0x8) return 4;
 1700              		.loc 1 319 0
 1701 0756 FB1D     		adds	r3, r7, #7
 1702 0758 1B78     		ldrb	r3, [r3]
 1703 075a 0822     		movs	r2, #8
 1704 075c 1340     		ands	r3, r2
 1705 075e 01D0     		beq	.L103
 1706              		.loc 1 319 0 is_stmt 0 discriminator 1
 1707 0760 0423     		movs	r3, #4
 1708 0762 15E0     		b	.L104
 1709              	.L103:
 320:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     if( c & 0x4) return 3;
 1710              		.loc 1 320 0 is_stmt 1
 1711 0764 FB1D     		adds	r3, r7, #7
 1712 0766 1B78     		ldrb	r3, [r3]
 1713 0768 0422     		movs	r2, #4
 1714 076a 1340     		ands	r3, r2
 1715 076c 01D0     		beq	.L105
 1716              		.loc 1 320 0 is_stmt 0 discriminator 1
 1717 076e 0323     		movs	r3, #3
 1718 0770 0EE0     		b	.L104
 1719              	.L105:
 321:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     if( c & 0x2) return 2;
 1720              		.loc 1 321 0 is_stmt 1
 1721 0772 FB1D     		adds	r3, r7, #7
 1722 0774 1B78     		ldrb	r3, [r3]
 1723 0776 0222     		movs	r2, #2
 1724 0778 1340     		ands	r3, r2
 1725 077a 01D0     		beq	.L106
 1726              		.loc 1 321 0 is_stmt 0 discriminator 1
 1727 077c 0223     		movs	r3, #2
 1728 077e 07E0     		b	.L104
 1729              	.L106:
 322:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     if( c & 0x1) return 1;
 1730              		.loc 1 322 0 is_stmt 1
 1731 0780 FB1D     		adds	r3, r7, #7
 1732 0782 1B78     		ldrb	r3, [r3]
 1733 0784 0122     		movs	r2, #1
 1734 0786 1340     		ands	r3, r2
 1735 0788 01D0     		beq	.L107
 1736              		.loc 1 322 0 is_stmt 0 discriminator 1
 1737 078a 0123     		movs	r3, #1
 1738 078c 00E0     		b	.L104
 1739              	.L107:
 323:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     return 0;
 1740              		.loc 1 323 0 is_stmt 1
 1741 078e 0023     		movs	r3, #0
 1742              	.L104:
 324:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         
 325:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 1743              		.loc 1 325 0
 1744 0790 1800     		movs	r0, r3
 1745 0792 BD46     		mov	sp, r7
 1746 0794 02B0     		add	sp, sp, #8
 1747              		@ sp needed
 1748 0796 80BD     		pop	{r7, pc}
 1749              	.L109:
 1750              		.align	2
 1751              	.L108:
 1752 0798 110C0240 		.word	1073875985
 1753              		.cfi_endproc
 1754              	.LFE21:
 1756              		.section	.rodata
 1757              		.align	2
 1758              	.LC0:
 1759 0034 01       		.byte	1
 1760 0035 02       		.byte	2
 1761 0036 03       		.byte	3
 1762 0037 0A       		.byte	10
 1763 0038 04       		.byte	4
 1764 0039 05       		.byte	5
 1765 003a 06       		.byte	6
 1766 003b 0B       		.byte	11
 1767 003c 07       		.byte	7
 1768 003d 08       		.byte	8
 1769 003e 09       		.byte	9
 1770 003f 0C       		.byte	12
 1771 0040 0E       		.byte	14
 1772 0041 00       		.byte	0
 1773 0042 0F       		.byte	15
 1774 0043 0D       		.byte	13
 1775              		.text
 1776              		.align	1
 1777              		.global	keyb
 1778              		.syntax unified
 1779              		.code	16
 1780              		.thumb_func
 1781              		.fpu softvfp
 1783              	keyb:
 1784              	.LFB22:
 326:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 
 327:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     
 328:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** unsigned char keyb(void){
 1785              		.loc 1 328 0
 1786              		.cfi_startproc
 1787              		@ args = 0, pretend = 0, frame = 24
 1788              		@ frame_needed = 1, uses_anonymous_args = 0
 1789 079c 90B5     		push	{r4, r7, lr}
 1790              		.cfi_def_cfa_offset 12
 1791              		.cfi_offset 4, -12
 1792              		.cfi_offset 7, -8
 1793              		.cfi_offset 14, -4
 1794 079e 87B0     		sub	sp, sp, #28
 1795              		.cfi_def_cfa_offset 40
 1796 07a0 00AF     		add	r7, sp, #0
 1797              		.cfi_def_cfa_register 7
 329:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	unsigned char key[]= {1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
 1798              		.loc 1 329 0
 1799 07a2 3B00     		movs	r3, r7
 1800 07a4 164A     		ldr	r2, .L116
 1801 07a6 13CA     		ldmia	r2!, {r0, r1, r4}
 1802 07a8 13C3     		stmia	r3!, {r0, r1, r4}
 1803 07aa 1268     		ldr	r2, [r2]
 1804 07ac 1A60     		str	r2, [r3]
 330:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     int row, col;
 331:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     for(row = 1; row <=4; row++){
 1805              		.loc 1 331 0
 1806 07ae 0123     		movs	r3, #1
 1807 07b0 7B61     		str	r3, [r7, #20]
 1808 07b2 19E0     		b	.L111
 1809              	.L114:
 332:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         activateRow(row);
 1810              		.loc 1 332 0
 1811 07b4 7B69     		ldr	r3, [r7, #20]
 1812 07b6 1800     		movs	r0, r3
 1813 07b8 FFF7FEFF 		bl	activateRow
 333:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         if((col = readColumn()))
 1814              		.loc 1 333 0
 1815 07bc FFF7FEFF 		bl	readColumn
 1816 07c0 0300     		movs	r3, r0
 1817 07c2 3B61     		str	r3, [r7, #16]
 1818 07c4 3B69     		ldr	r3, [r7, #16]
 1819 07c6 002B     		cmp	r3, #0
 1820 07c8 0BD0     		beq	.L112
 334:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         {
 335:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****             activateRow(0);
 1821              		.loc 1 335 0
 1822 07ca 0020     		movs	r0, #0
 1823 07cc FFF7FEFF 		bl	activateRow
 336:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****             return key[4*(row-1)+(col-1)];
 1824              		.loc 1 336 0
 1825 07d0 7B69     		ldr	r3, [r7, #20]
 1826 07d2 013B     		subs	r3, r3, #1
 1827 07d4 9A00     		lsls	r2, r3, #2
 1828 07d6 3B69     		ldr	r3, [r7, #16]
 1829 07d8 013B     		subs	r3, r3, #1
 1830 07da D318     		adds	r3, r2, r3
 1831 07dc 3A00     		movs	r2, r7
 1832 07de D35C     		ldrb	r3, [r2, r3]
 1833 07e0 09E0     		b	.L115
 1834              	.L112:
 331:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         activateRow(row);
 1835              		.loc 1 331 0 discriminator 2
 1836 07e2 7B69     		ldr	r3, [r7, #20]
 1837 07e4 0133     		adds	r3, r3, #1
 1838 07e6 7B61     		str	r3, [r7, #20]
 1839              	.L111:
 331:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         activateRow(row);
 1840              		.loc 1 331 0 is_stmt 0 discriminator 1
 1841 07e8 7B69     		ldr	r3, [r7, #20]
 1842 07ea 042B     		cmp	r3, #4
 1843 07ec E2DD     		ble	.L114
 337:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****         }
 338:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     }
 339:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     activateRow(0);
 1844              		.loc 1 339 0 is_stmt 1
 1845 07ee 0020     		movs	r0, #0
 1846 07f0 FFF7FEFF 		bl	activateRow
 340:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	return 0xFF;
 1847              		.loc 1 340 0
 1848 07f4 FF23     		movs	r3, #255
 1849              	.L115:
 341:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 1850              		.loc 1 341 0 discriminator 1
 1851 07f6 1800     		movs	r0, r3
 1852 07f8 BD46     		mov	sp, r7
 1853 07fa 07B0     		add	sp, sp, #28
 1854              		@ sp needed
 1855 07fc 90BD     		pop	{r4, r7, pc}
 1856              	.L117:
 1857 07fe C046     		.align	2
 1858              	.L116:
 1859 0800 34000000 		.word	.LC0
 1860              		.cfi_endproc
 1861              	.LFE22:
 1863              		.align	1
 1864              		.global	graphic_initialize
 1865              		.syntax unified
 1866              		.code	16
 1867              		.thumb_func
 1868              		.fpu softvfp
 1870              	graphic_initialize:
 1871              	.LFB23:
 342:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** //---------------------------------------------------------------------
 343:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void graphic_initialize(void){
 1872              		.loc 1 343 0
 1873              		.cfi_startproc
 1874              		@ args = 0, pretend = 0, frame = 0
 1875              		@ frame_needed = 1, uses_anonymous_args = 0
 1876 0804 80B5     		push	{r7, lr}
 1877              		.cfi_def_cfa_offset 8
 1878              		.cfi_offset 7, -8
 1879              		.cfi_offset 14, -4
 1880 0806 00AF     		add	r7, sp, #0
 1881              		.cfi_def_cfa_register 7
 344:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_set(B_E);
 1882              		.loc 1 344 0
 1883 0808 4020     		movs	r0, #64
 1884 080a FFF7FEFF 		bl	graphic_ctrl_bit_set
 345:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	delay_micro(10);
 1885              		.loc 1 345 0
 1886 080e 0A20     		movs	r0, #10
 1887 0810 FFF7FEFF 		bl	delay_micro
 346:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	
 347:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E );
 1888              		.loc 1 347 0
 1889 0814 7820     		movs	r0, #120
 1890 0816 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 348:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	delay_milli(30);
 1891              		.loc 1 348 0
 1892 081a 1E20     		movs	r0, #30
 1893 081c FFF7FEFF 		bl	delay_milli
 349:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	
 350:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_ctrl_bit_set(B_RST);
 1894              		.loc 1 350 0
 1895 0820 2020     		movs	r0, #32
 1896 0822 FFF7FEFF 		bl	graphic_ctrl_bit_set
 351:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	delay_milli(100);
 1897              		.loc 1 351 0
 1898 0826 6420     		movs	r0, #100
 1899 0828 FFF7FEFF 		bl	delay_milli
 352:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_write_command(LCD_OFF,			B_CS1 | B_CS2);
 1900              		.loc 1 352 0
 1901 082c 1821     		movs	r1, #24
 1902 082e 3E20     		movs	r0, #62
 1903 0830 FFF7FEFF 		bl	graphic_write_command
 353:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_write_command(LCD_ON,			B_CS1 | B_CS2);
 1904              		.loc 1 353 0
 1905 0834 1821     		movs	r1, #24
 1906 0836 3F20     		movs	r0, #63
 1907 0838 FFF7FEFF 		bl	graphic_write_command
 354:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_write_command(LCD_DISP_START, 	B_CS1 | B_CS2);
 1908              		.loc 1 354 0
 1909 083c 1821     		movs	r1, #24
 1910 083e C020     		movs	r0, #192
 1911 0840 FFF7FEFF 		bl	graphic_write_command
 355:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_write_command(LCD_SET_ADD,		B_CS1 | B_CS2);
 1912              		.loc 1 355 0
 1913 0844 1821     		movs	r1, #24
 1914 0846 4020     		movs	r0, #64
 1915 0848 FFF7FEFF 		bl	graphic_write_command
 356:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_write_command(LCD_SET_PAGE,		B_CS1 | B_CS2);
 1916              		.loc 1 356 0
 1917 084c 1821     		movs	r1, #24
 1918 084e B820     		movs	r0, #184
 1919 0850 FFF7FEFF 		bl	graphic_write_command
 357:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	select_controller(0);
 1920              		.loc 1 357 0
 1921 0854 0020     		movs	r0, #0
 1922 0856 FFF7FEFF 		bl	select_controller
 358:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 1923              		.loc 1 358 0
 1924 085a C046     		nop
 1925 085c BD46     		mov	sp, r7
 1926              		@ sp needed
 1927 085e 80BD     		pop	{r7, pc}
 1928              		.cfi_endproc
 1929              	.LFE23:
 1931              		.align	1
 1932              		.global	init_app
 1933              		.syntax unified
 1934              		.code	16
 1935              		.thumb_func
 1936              		.fpu softvfp
 1938              	init_app:
 1939              	.LFB24:
 359:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** void init_app(void){
 1940              		.loc 1 359 0
 1941              		.cfi_startproc
 1942              		@ args = 0, pretend = 0, frame = 0
 1943              		@ frame_needed = 1, uses_anonymous_args = 0
 1944 0860 80B5     		push	{r7, lr}
 1945              		.cfi_def_cfa_offset 8
 1946              		.cfi_offset 7, -8
 1947              		.cfi_offset 14, -4
 1948 0862 00AF     		add	r7, sp, #0
 1949              		.cfi_def_cfa_register 7
 360:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	*PORT_MODER 	=0x55555555;
 1950              		.loc 1 360 0
 1951 0864 0A4B     		ldr	r3, .L120
 1952 0866 0B4A     		ldr	r2, .L120+4
 1953 0868 1A60     		str	r2, [r3]
 361:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	*PORT_OTYPER 	=0x0000;
 1954              		.loc 1 361 0
 1955 086a 0B4B     		ldr	r3, .L120+8
 1956 086c 0022     		movs	r2, #0
 1957 086e 1A80     		strh	r2, [r3]
 362:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     *PORT_OSPEEDR   =0x55555555;
 1958              		.loc 1 362 0
 1959 0870 0A4B     		ldr	r3, .L120+12
 1960 0872 084A     		ldr	r2, .L120+4
 1961 0874 1A60     		str	r2, [r3]
 363:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	*PORT_MODER_D  = 0x55005555;
 1962              		.loc 1 363 0
 1963 0876 0A4B     		ldr	r3, .L120+16
 1964 0878 0A4A     		ldr	r2, .L120+20
 1965 087a 1A60     		str	r2, [r3]
 364:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     *PORT_OTYPER_D = 0x0F;
 1966              		.loc 1 364 0
 1967 087c 0A4B     		ldr	r3, .L120+24
 1968 087e 0F22     		movs	r2, #15
 1969 0880 1A80     		strh	r2, [r3]
 365:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c ****     *PORT_PUPDR_D  = 0x00AA;
 1970              		.loc 1 365 0
 1971 0882 0A4B     		ldr	r3, .L120+28
 1972 0884 AA22     		movs	r2, #170
 1973 0886 1A60     		str	r2, [r3]
 366:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** }
 1974              		.loc 1 366 0
 1975 0888 C046     		nop
 1976 088a BD46     		mov	sp, r7
 1977              		@ sp needed
 1978 088c 80BD     		pop	{r7, pc}
 1979              	.L121:
 1980 088e C046     		.align	2
 1981              	.L120:
 1982 0890 00100240 		.word	1073876992
 1983 0894 55555555 		.word	1431655765
 1984 0898 08100240 		.word	1073877000
 1985 089c 20100240 		.word	1073877024
 1986 08a0 000C0240 		.word	1073875968
 1987 08a4 55550055 		.word	1426085205
 1988 08a8 080C0240 		.word	1073875976
 1989 08ac 300C0240 		.word	1073876016
 1990              		.cfi_endproc
 1991              	.LFE24:
 1993              		.align	1
 1994              		.global	main
 1995              		.syntax unified
 1996              		.code	16
 1997              		.thumb_func
 1998              		.fpu softvfp
 2000              	main:
 2001              	.LFB25:
 367:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 
 368:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** int main(int argc, char **argv){
 2002              		.loc 1 368 0
 2003              		.cfi_startproc
 2004              		@ args = 0, pretend = 0, frame = 16
 2005              		@ frame_needed = 1, uses_anonymous_args = 0
 2006 08b0 B0B5     		push	{r4, r5, r7, lr}
 2007              		.cfi_def_cfa_offset 16
 2008              		.cfi_offset 4, -16
 2009              		.cfi_offset 5, -12
 2010              		.cfi_offset 7, -8
 2011              		.cfi_offset 14, -4
 2012 08b2 84B0     		sub	sp, sp, #16
 2013              		.cfi_def_cfa_offset 32
 2014 08b4 00AF     		add	r7, sp, #0
 2015              		.cfi_def_cfa_register 7
 2016 08b6 7860     		str	r0, [r7, #4]
 2017 08b8 3960     		str	r1, [r7]
 369:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	char c;
 370:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	POBJECT p = &ball;
 2018              		.loc 1 370 0
 2019 08ba 204B     		ldr	r3, .L130
 2020 08bc FB60     		str	r3, [r7, #12]
 371:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	init_app();
 2021              		.loc 1 371 0
 2022 08be FFF7FEFF 		bl	init_app
 372:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	graphic_initialize();
 2023              		.loc 1 372 0
 2024 08c2 FFF7FEFF 		bl	graphic_initialize
 2025              	.L129:
 373:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	//graphic_clear_screen();
 374:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	
 375:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 	while(1){
 376:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		p->move(p);
 2026              		.loc 1 376 0
 2027 08c6 FB68     		ldr	r3, [r7, #12]
 2028 08c8 DB69     		ldr	r3, [r3, #28]
 2029 08ca FA68     		ldr	r2, [r7, #12]
 2030 08cc 1000     		movs	r0, r2
 2031 08ce 9847     		blx	r3
 2032              	.LVL0:
 377:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		delay_milli(40);
 2033              		.loc 1 377 0
 2034 08d0 2820     		movs	r0, #40
 2035 08d2 FFF7FEFF 		bl	delay_milli
 378:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		c = keyb();
 2036              		.loc 1 378 0
 2037 08d6 0B25     		movs	r5, #11
 2038 08d8 7C19     		adds	r4, r7, r5
 2039 08da FFF7FEFF 		bl	keyb
 2040 08de 0300     		movs	r3, r0
 2041 08e0 2370     		strb	r3, [r4]
 379:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		switch(c){
 2042              		.loc 1 379 0
 2043 08e2 7B19     		adds	r3, r7, r5
 2044 08e4 1B78     		ldrb	r3, [r3]
 2045 08e6 042B     		cmp	r3, #4
 2046 08e8 0FD0     		beq	.L124
 2047 08ea 02DC     		bgt	.L125
 2048 08ec 022B     		cmp	r3, #2
 2049 08ee 14D0     		beq	.L126
 2050 08f0 22E0     		b	.L123
 2051              	.L125:
 2052 08f2 062B     		cmp	r3, #6
 2053 08f4 02D0     		beq	.L127
 2054 08f6 082B     		cmp	r3, #8
 2055 08f8 17D0     		beq	.L128
 2056 08fa 1DE0     		b	.L123
 2057              	.L127:
 380:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 			case 6: p->set_speed( p, 2, 0 ); break;
 2058              		.loc 1 380 0
 2059 08fc FB68     		ldr	r3, [r7, #12]
 2060 08fe 1B6A     		ldr	r3, [r3, #32]
 2061 0900 F868     		ldr	r0, [r7, #12]
 2062 0902 0022     		movs	r2, #0
 2063 0904 0221     		movs	r1, #2
 2064 0906 9847     		blx	r3
 2065              	.LVL1:
 2066 0908 16E0     		b	.L123
 2067              	.L124:
 381:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 			case 4: p->set_speed( p,-2, 0 ); break;
 2068              		.loc 1 381 0
 2069 090a FB68     		ldr	r3, [r7, #12]
 2070 090c 1B6A     		ldr	r3, [r3, #32]
 2071 090e 0222     		movs	r2, #2
 2072 0910 5142     		rsbs	r1, r2, #0
 2073 0912 F868     		ldr	r0, [r7, #12]
 2074 0914 0022     		movs	r2, #0
 2075 0916 9847     		blx	r3
 2076              	.LVL2:
 2077 0918 0EE0     		b	.L123
 2078              	.L126:
 382:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 			case 2: p->set_speed( p, 0,-2 ); break;
 2079              		.loc 1 382 0
 2080 091a FB68     		ldr	r3, [r7, #12]
 2081 091c 1B6A     		ldr	r3, [r3, #32]
 2082 091e 0222     		movs	r2, #2
 2083 0920 5242     		rsbs	r2, r2, #0
 2084 0922 F868     		ldr	r0, [r7, #12]
 2085 0924 0021     		movs	r1, #0
 2086 0926 9847     		blx	r3
 2087              	.LVL3:
 2088 0928 06E0     		b	.L123
 2089              	.L128:
 383:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 			case 8: p->set_speed( p, 0, 2 ); break;
 2090              		.loc 1 383 0
 2091 092a FB68     		ldr	r3, [r7, #12]
 2092 092c 1B6A     		ldr	r3, [r3, #32]
 2093 092e F868     		ldr	r0, [r7, #12]
 2094 0930 0222     		movs	r2, #2
 2095 0932 0021     		movs	r1, #0
 2096 0934 9847     		blx	r3
 2097              	.LVL4:
 2098 0936 C046     		nop
 2099              	.L123:
 376:/home/tom/Documents/WORK/MachineOrientedProgramming/autopong_keypad/startup.c **** 		delay_milli(40);
 2100              		.loc 1 376 0
 2101 0938 C5E7     		b	.L129
 2102              	.L131:
 2103 093a C046     		.align	2
 2104              	.L130:
 2105 093c 34000000 		.word	ball
 2106              		.cfi_endproc
 2107              	.LFE25:
 2109              	.Letext0:
