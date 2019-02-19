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
  25              		.file 1 "/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c"
   1:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** /*
   2:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****  * 	startup.c
   3:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****  *
   4:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****  */
   5:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_BASE_E 0x40021000
   6:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/* Definiera word-adresser för initiering*/
   7:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_MODER 		((volatile unsigned int*)PORT_BASE_E)
   8:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_OTYPER 	((volatile unsigned short*) PORT_BASE_E+0x04)
   9:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_OSPEEDR    ((volatile unsigned int*) PORT_BASE_E+0x08)
  10:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_PUPDR  	((volatile unsigned int*) PORT_BASE_E+0x0C)
  11:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*Definiera byte-adresser för data och styrregister*/
  12:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_IDR_LOW 	((volatile unsigned char*) PORT_BASE_E+0x10)
  13:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_IDR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x11)
  14:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_ODR_LOW  	((volatile unsigned char*) PORT_BASE_E+0x14)
  15:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_ODR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x15)
  16:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*Definiera lämpliga definitioner för de olika bitarna i styrregistret*/
  17:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_RST 	0x20
  18:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_CS2 	0x10	
  19:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_CS1 	0x08
  20:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_E 	0x40	
  21:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_RW 	0x02		
  22:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_RS 	0x01				
  23:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*LCD-BUSY-bitens address och andra LCD relaterade saker*/
  24:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_BUSY		0x80
  25:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_SELECT		0x04
  26:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_OFF 		0x3E
  27:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_ON			0x3F
  28:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_DISP_START	0xC0
  29:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_SET_ADD		0x40
  30:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_SET_PAGE	0xB8
  31:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*STK DELAY*/
  32:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_CTRL ((volatile unsigned int*)(0xE000E010))
  33:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_LOAD ((volatile unsigned int*)(0xE000E014))
  34:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_VAL  ((volatile unsigned int*)(0xE000E018))
  35:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  36:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  37:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void startup ( void )
  38:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** {
  26              		.loc 1 38 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  39:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** asm volatile(
  31              		.loc 1 39 0
  32              		.syntax divided
  33              	@ 39 "/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  40:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  41:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" MOV SP,R0\n"
  42:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" BL main\n"				/* call main */
  43:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	".L1: B .L1\n"				/* never return */
  44:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	) ;
  45:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
  40              		.loc 1 45 0
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
  46:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_250ns(void){
  57              		.loc 1 46 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  47:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 0;
  67              		.loc 1 47 0
  68 0004 0C4B     		ldr	r3, .L4
  69 0006 0022     		movs	r2, #0
  70 0008 1A60     		str	r2, [r3]
  48:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_LOAD = ((168/4)-1);
  71              		.loc 1 48 0
  72 000a 0C4B     		ldr	r3, .L4+4
  73 000c 2922     		movs	r2, #41
  74 000e 1A60     		str	r2, [r3]
  49:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_VAL  = 0;
  75              		.loc 1 49 0
  76 0010 0B4B     		ldr	r3, .L4+8
  77 0012 0022     		movs	r2, #0
  78 0014 1A60     		str	r2, [r3]
  50:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 5;
  79              		.loc 1 50 0
  80 0016 084B     		ldr	r3, .L4
  81 0018 0522     		movs	r2, #5
  82 001a 1A60     		str	r2, [r3]
  51:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while( (*STK_CTRL & 0x10000)== 0){}
  83              		.loc 1 51 0
  84 001c C046     		nop
  85              	.L3:
  86              		.loc 1 51 0 is_stmt 0 discriminator 1
  87 001e 064B     		ldr	r3, .L4
  88 0020 1A68     		ldr	r2, [r3]
  89 0022 8023     		movs	r3, #128
  90 0024 5B02     		lsls	r3, r3, #9
  91 0026 1340     		ands	r3, r2
  92 0028 F9D0     		beq	.L3
  52:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 0;
  93              		.loc 1 52 0 is_stmt 1
  94 002a 034B     		ldr	r3, .L4
  95 002c 0022     		movs	r2, #0
  96 002e 1A60     		str	r2, [r3]
  53:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
  97              		.loc 1 53 0
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
  54:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_500ns(void){
 120              		.loc 1 54 0
 121              		.cfi_startproc
 122              		@ args = 0, pretend = 0, frame = 0
 123              		@ frame_needed = 1, uses_anonymous_args = 0
 124 0044 80B5     		push	{r7, lr}
 125              		.cfi_def_cfa_offset 8
 126              		.cfi_offset 7, -8
 127              		.cfi_offset 14, -4
 128 0046 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
  55:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_250ns();
 130              		.loc 1 55 0
 131 0048 FFF7FEFF 		bl	delay_250ns
  56:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_250ns();
 132              		.loc 1 56 0
 133 004c FFF7FEFF 		bl	delay_250ns
  57:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 134              		.loc 1 57 0
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
  58:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_micro(unsigned int us){
 151              		.loc 1 58 0
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
  59:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(us--){
 164              		.loc 1 59 0
 165 005e 07E0     		b	.L8
 166              	.L9:
  60:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 167              		.loc 1 60 0
 168 0060 FFF7FEFF 		bl	delay_250ns
  61:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 169              		.loc 1 61 0
 170 0064 FFF7FEFF 		bl	delay_250ns
  62:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 171              		.loc 1 62 0
 172 0068 FFF7FEFF 		bl	delay_250ns
  63:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 173              		.loc 1 63 0
 174 006c FFF7FEFF 		bl	delay_250ns
 175              	.L8:
  59:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 176              		.loc 1 59 0
 177 0070 7B68     		ldr	r3, [r7, #4]
 178 0072 5A1E     		subs	r2, r3, #1
 179 0074 7A60     		str	r2, [r7, #4]
 180 0076 002B     		cmp	r3, #0
 181 0078 F2D1     		bne	.L9
  64:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     }
  65:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 182              		.loc 1 65 0
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
  66:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_milli(unsigned int ms){
 200              		.loc 1 66 0
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
  67:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(ms--){
 213              		.loc 1 67 0
 214 008a 02E0     		b	.L11
 215              	.L12:
  68:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_micro(10);
 216              		.loc 1 68 0
 217 008c 0A20     		movs	r0, #10
 218 008e FFF7FEFF 		bl	delay_micro
 219              	.L11:
  67:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(ms--){
 220              		.loc 1 67 0
 221 0092 7B68     		ldr	r3, [r7, #4]
 222 0094 5A1E     		subs	r2, r3, #1
 223 0096 7A60     		str	r2, [r7, #4]
 224 0098 002B     		cmp	r3, #0
 225 009a F7D1     		bne	.L12
  69:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     }
  70:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     
  71:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 226              		.loc 1 71 0
 227 009c C046     		nop
 228 009e BD46     		mov	sp, r7
 229 00a0 02B0     		add	sp, sp, #8
 230              		@ sp needed
 231 00a2 80BD     		pop	{r7, pc}
 232              		.cfi_endproc
 233              	.LFE4:
 235              		.align	1
 236              		.global	graphic_ctrl_bit_set
 237              		.syntax unified
 238              		.code	16
 239              		.thumb_func
 240              		.fpu softvfp
 242              	graphic_ctrl_bit_set:
 243              	.LFB5:
  72:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** typedef unsigned char uint8_t;
  73:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  74:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_ctrl_bit_set(uint8_t x){
 244              		.loc 1 74 0
 245              		.cfi_startproc
 246              		@ args = 0, pretend = 0, frame = 8
 247              		@ frame_needed = 1, uses_anonymous_args = 0
 248 00a4 80B5     		push	{r7, lr}
 249              		.cfi_def_cfa_offset 8
 250              		.cfi_offset 7, -8
 251              		.cfi_offset 14, -4
 252 00a6 82B0     		sub	sp, sp, #8
 253              		.cfi_def_cfa_offset 16
 254 00a8 00AF     		add	r7, sp, #0
 255              		.cfi_def_cfa_register 7
 256 00aa 0200     		movs	r2, r0
 257 00ac FB1D     		adds	r3, r7, #7
 258 00ae 1A70     		strb	r2, [r3]
  75:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW |= x;
 259              		.loc 1 75 0
 260 00b0 0A4B     		ldr	r3, .L14
 261 00b2 1B78     		ldrb	r3, [r3]
 262 00b4 DAB2     		uxtb	r2, r3
 263 00b6 0949     		ldr	r1, .L14
 264 00b8 FB1D     		adds	r3, r7, #7
 265 00ba 1B78     		ldrb	r3, [r3]
 266 00bc 1343     		orrs	r3, r2
 267 00be DBB2     		uxtb	r3, r3
 268 00c0 0B70     		strb	r3, [r1]
  76:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW &= ~B_SELECT;
 269              		.loc 1 76 0
 270 00c2 064B     		ldr	r3, .L14
 271 00c4 1B78     		ldrb	r3, [r3]
 272 00c6 DBB2     		uxtb	r3, r3
 273 00c8 044A     		ldr	r2, .L14
 274 00ca 0421     		movs	r1, #4
 275 00cc 8B43     		bics	r3, r1
 276 00ce DBB2     		uxtb	r3, r3
 277 00d0 1370     		strb	r3, [r2]
  77:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** //	*PORT_ODR_LOW &= ~(1UL << 2);
  78:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  79:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 278              		.loc 1 79 0
 279 00d2 C046     		nop
 280 00d4 BD46     		mov	sp, r7
 281 00d6 02B0     		add	sp, sp, #8
 282              		@ sp needed
 283 00d8 80BD     		pop	{r7, pc}
 284              	.L15:
 285 00da C046     		.align	2
 286              	.L14:
 287 00dc 14100240 		.word	1073877012
 288              		.cfi_endproc
 289              	.LFE5:
 291              		.align	1
 292              		.global	graphic_ctrl_bit_clear
 293              		.syntax unified
 294              		.code	16
 295              		.thumb_func
 296              		.fpu softvfp
 298              	graphic_ctrl_bit_clear:
 299              	.LFB6:
  80:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_ctrl_bit_clear(uint8_t x){
 300              		.loc 1 80 0
 301              		.cfi_startproc
 302              		@ args = 0, pretend = 0, frame = 8
 303              		@ frame_needed = 1, uses_anonymous_args = 0
 304 00e0 80B5     		push	{r7, lr}
 305              		.cfi_def_cfa_offset 8
 306              		.cfi_offset 7, -8
 307              		.cfi_offset 14, -4
 308 00e2 82B0     		sub	sp, sp, #8
 309              		.cfi_def_cfa_offset 16
 310 00e4 00AF     		add	r7, sp, #0
 311              		.cfi_def_cfa_register 7
 312 00e6 0200     		movs	r2, r0
 313 00e8 FB1D     		adds	r3, r7, #7
 314 00ea 1A70     		strb	r2, [r3]
  81:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** //	*PORT_ODR_LOW &= ~((1UL << 2) | x);
  82:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW &= ~(B_SELECT | x);
 315              		.loc 1 82 0
 316 00ec 0A4B     		ldr	r3, .L17
 317 00ee 1B78     		ldrb	r3, [r3]
 318 00f0 DBB2     		uxtb	r3, r3
 319 00f2 5BB2     		sxtb	r3, r3
 320 00f4 FA1D     		adds	r2, r7, #7
 321 00f6 1278     		ldrb	r2, [r2]
 322 00f8 0421     		movs	r1, #4
 323 00fa 0A43     		orrs	r2, r1
 324 00fc D2B2     		uxtb	r2, r2
 325 00fe 52B2     		sxtb	r2, r2
 326 0100 D243     		mvns	r2, r2
 327 0102 52B2     		sxtb	r2, r2
 328 0104 1340     		ands	r3, r2
 329 0106 5AB2     		sxtb	r2, r3
 330 0108 034B     		ldr	r3, .L17
 331 010a D2B2     		uxtb	r2, r2
 332 010c 1A70     		strb	r2, [r3]
  83:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  84:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 333              		.loc 1 84 0
 334 010e C046     		nop
 335 0110 BD46     		mov	sp, r7
 336 0112 02B0     		add	sp, sp, #8
 337              		@ sp needed
 338 0114 80BD     		pop	{r7, pc}
 339              	.L18:
 340 0116 C046     		.align	2
 341              	.L17:
 342 0118 14100240 		.word	1073877012
 343              		.cfi_endproc
 344              	.LFE6:
 346              		.align	1
 347              		.global	select_controller
 348              		.syntax unified
 349              		.code	16
 350              		.thumb_func
 351              		.fpu softvfp
 353              	select_controller:
 354              	.LFB7:
  85:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void select_controller(uint8_t controller){
 355              		.loc 1 85 0
 356              		.cfi_startproc
 357              		@ args = 0, pretend = 0, frame = 8
 358              		@ frame_needed = 1, uses_anonymous_args = 0
 359 011c 80B5     		push	{r7, lr}
 360              		.cfi_def_cfa_offset 8
 361              		.cfi_offset 7, -8
 362              		.cfi_offset 14, -4
 363 011e 82B0     		sub	sp, sp, #8
 364              		.cfi_def_cfa_offset 16
 365 0120 00AF     		add	r7, sp, #0
 366              		.cfi_def_cfa_register 7
 367 0122 0200     		movs	r2, r0
 368 0124 FB1D     		adds	r3, r7, #7
 369 0126 1A70     		strb	r2, [r3]
  86:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	switch(controller){
 370              		.loc 1 86 0
 371 0128 FB1D     		adds	r3, r7, #7
 372 012a 1B78     		ldrb	r3, [r3]
 373 012c 082B     		cmp	r3, #8
 374 012e 0CD0     		beq	.L21
 375 0130 02DC     		bgt	.L22
 376 0132 002B     		cmp	r3, #0
 377 0134 05D0     		beq	.L23
  87:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case 0:
  88:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS1 | B_CS2);
  89:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  90:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1:
  91:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS1);
  92:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
  93:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  94:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS2:
  95:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
  96:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
  97:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  98:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1 | B_CS2:
  99:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS1 | B_CS2);
 100:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 101:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 102:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		
 103:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 104:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 378              		.loc 1 104 0
 379 0136 1AE0     		b	.L26
 380              	.L22:
  86:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	switch(controller){
 381              		.loc 1 86 0
 382 0138 102B     		cmp	r3, #16
 383 013a 0DD0     		beq	.L24
 384 013c 182B     		cmp	r3, #24
 385 013e 12D0     		beq	.L25
 386              		.loc 1 104 0
 387 0140 15E0     		b	.L26
 388              	.L23:
  88:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 389              		.loc 1 88 0
 390 0142 1820     		movs	r0, #24
 391 0144 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  89:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1:
 392              		.loc 1 89 0
 393 0148 11E0     		b	.L20
 394              	.L21:
  91:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 395              		.loc 1 91 0
 396 014a 0820     		movs	r0, #8
 397 014c FFF7FEFF 		bl	graphic_ctrl_bit_set
  92:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 398              		.loc 1 92 0
 399 0150 1020     		movs	r0, #16
 400 0152 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  93:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS2:
 401              		.loc 1 93 0
 402 0156 0AE0     		b	.L20
 403              	.L24:
  95:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
 404              		.loc 1 95 0
 405 0158 1020     		movs	r0, #16
 406 015a FFF7FEFF 		bl	graphic_ctrl_bit_set
  96:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 407              		.loc 1 96 0
 408 015e 0820     		movs	r0, #8
 409 0160 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  97:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1 | B_CS2:
 410              		.loc 1 97 0
 411 0164 03E0     		b	.L20
 412              	.L25:
  99:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 413              		.loc 1 99 0
 414 0166 1820     		movs	r0, #24
 415 0168 FFF7FEFF 		bl	graphic_ctrl_bit_set
 100:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 416              		.loc 1 100 0
 417 016c C046     		nop
 418              	.L20:
 419              	.L26:
 420              		.loc 1 104 0
 421 016e C046     		nop
 422 0170 BD46     		mov	sp, r7
 423 0172 02B0     		add	sp, sp, #8
 424              		@ sp needed
 425 0174 80BD     		pop	{r7, pc}
 426              		.cfi_endproc
 427              	.LFE7:
 429              		.align	1
 430              		.global	graphic_wait_ready
 431              		.syntax unified
 432              		.code	16
 433              		.thumb_func
 434              		.fpu softvfp
 436              	graphic_wait_ready:
 437              	.LFB8:
 105:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_wait_ready(void){
 438              		.loc 1 105 0
 439              		.cfi_startproc
 440              		@ args = 0, pretend = 0, frame = 8
 441              		@ frame_needed = 1, uses_anonymous_args = 0
 442 0176 80B5     		push	{r7, lr}
 443              		.cfi_def_cfa_offset 8
 444              		.cfi_offset 7, -8
 445              		.cfi_offset 14, -4
 446 0178 82B0     		sub	sp, sp, #8
 447              		.cfi_def_cfa_offset 16
 448 017a 00AF     		add	r7, sp, #0
 449              		.cfi_def_cfa_register 7
 106:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	uint8_t c;
 107:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 450              		.loc 1 107 0
 451 017c 4020     		movs	r0, #64
 452 017e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 108:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER = 0x00005555;
 453              		.loc 1 108 0
 454 0182 164B     		ldr	r3, .L33
 455 0184 164A     		ldr	r2, .L33+4
 456 0186 1A60     		str	r2, [r3]
 109:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 457              		.loc 1 109 0
 458 0188 0120     		movs	r0, #1
 459 018a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 110:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_RW);
 460              		.loc 1 110 0
 461 018e 0220     		movs	r0, #2
 462 0190 FFF7FEFF 		bl	graphic_ctrl_bit_set
 111:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 463              		.loc 1 111 0
 464 0194 FFF7FEFF 		bl	delay_500ns
 465              	.L30:
 112:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	while(1){
 113:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_E);
 466              		.loc 1 113 0
 467 0198 4020     		movs	r0, #64
 468 019a FFF7FEFF 		bl	graphic_ctrl_bit_set
 114:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		delay_500ns();
 469              		.loc 1 114 0
 470 019e FFF7FEFF 		bl	delay_500ns
 115:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		c = *PORT_IDR_HIGH & LCD_BUSY;
 471              		.loc 1 115 0
 472 01a2 104B     		ldr	r3, .L33+8
 473 01a4 1B78     		ldrb	r3, [r3]
 474 01a6 DAB2     		uxtb	r2, r3
 475 01a8 FB1D     		adds	r3, r7, #7
 476 01aa 7F21     		movs	r1, #127
 477 01ac 8A43     		bics	r2, r1
 478 01ae 1A70     		strb	r2, [r3]
 116:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_E);
 479              		.loc 1 116 0
 480 01b0 4020     		movs	r0, #64
 481 01b2 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 117:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		delay_500ns();
 482              		.loc 1 117 0
 483 01b6 FFF7FEFF 		bl	delay_500ns
 118:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		if( c == 0)
 484              		.loc 1 118 0
 485 01ba FB1D     		adds	r3, r7, #7
 486 01bc 1B78     		ldrb	r3, [r3]
 487 01be 002B     		cmp	r3, #0
 488 01c0 00D0     		beq	.L32
 113:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		delay_500ns();
 489              		.loc 1 113 0
 490 01c2 E9E7     		b	.L30
 491              	.L32:
 119:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 			break;
 492              		.loc 1 119 0
 493 01c4 C046     		nop
 120:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		
 121:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 122:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 494              		.loc 1 122 0
 495 01c6 4020     		movs	r0, #64
 496 01c8 FFF7FEFF 		bl	graphic_ctrl_bit_set
 123:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER = 0x55555555;
 497              		.loc 1 123 0
 498 01cc 034B     		ldr	r3, .L33
 499 01ce 064A     		ldr	r2, .L33+12
 500 01d0 1A60     		str	r2, [r3]
 124:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 501              		.loc 1 124 0
 502 01d2 C046     		nop
 503 01d4 BD46     		mov	sp, r7
 504 01d6 02B0     		add	sp, sp, #8
 505              		@ sp needed
 506 01d8 80BD     		pop	{r7, pc}
 507              	.L34:
 508 01da C046     		.align	2
 509              	.L33:
 510 01dc 00100240 		.word	1073876992
 511 01e0 55550000 		.word	21845
 512 01e4 11100240 		.word	1073877009
 513 01e8 55555555 		.word	1431655765
 514              		.cfi_endproc
 515              	.LFE8:
 517              		.align	1
 518              		.global	graphic_read
 519              		.syntax unified
 520              		.code	16
 521              		.thumb_func
 522              		.fpu softvfp
 524              	graphic_read:
 525              	.LFB9:
 125:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** uint8_t graphic_read(uint8_t controller ){
 526              		.loc 1 125 0
 527              		.cfi_startproc
 528              		@ args = 0, pretend = 0, frame = 16
 529              		@ frame_needed = 1, uses_anonymous_args = 0
 530 01ec 80B5     		push	{r7, lr}
 531              		.cfi_def_cfa_offset 8
 532              		.cfi_offset 7, -8
 533              		.cfi_offset 14, -4
 534 01ee 84B0     		sub	sp, sp, #16
 535              		.cfi_def_cfa_offset 24
 536 01f0 00AF     		add	r7, sp, #0
 537              		.cfi_def_cfa_register 7
 538 01f2 0200     		movs	r2, r0
 539 01f4 FB1D     		adds	r3, r7, #7
 540 01f6 1A70     		strb	r2, [r3]
 126:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	uint8_t RV;
 127:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 541              		.loc 1 127 0
 542 01f8 4020     		movs	r0, #64
 543 01fa FFF7FEFF 		bl	graphic_ctrl_bit_clear
 128:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER = 0x00005555;
 544              		.loc 1 128 0
 545 01fe 1C4B     		ldr	r3, .L39
 546 0200 1C4A     		ldr	r2, .L39+4
 547 0202 1A60     		str	r2, [r3]
 129:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 130:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_RS | B_RW);
 548              		.loc 1 130 0
 549 0204 0320     		movs	r0, #3
 550 0206 FFF7FEFF 		bl	graphic_ctrl_bit_set
 131:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 132:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller( controller );
 551              		.loc 1 132 0
 552 020a FB1D     		adds	r3, r7, #7
 553 020c 1B78     		ldrb	r3, [r3]
 554 020e 1800     		movs	r0, r3
 555 0210 FFF7FEFF 		bl	select_controller
 133:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 556              		.loc 1 133 0
 557 0214 FFF7FEFF 		bl	delay_500ns
 134:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 135:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_E );
 558              		.loc 1 135 0
 559 0218 4020     		movs	r0, #64
 560 021a FFF7FEFF 		bl	graphic_ctrl_bit_set
 136:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 561              		.loc 1 136 0
 562 021e FFF7FEFF 		bl	delay_500ns
 137:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 138:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	RV = *PORT_IDR_HIGH;
 563              		.loc 1 138 0
 564 0222 154A     		ldr	r2, .L39+8
 565 0224 0F23     		movs	r3, #15
 566 0226 FB18     		adds	r3, r7, r3
 567 0228 1278     		ldrb	r2, [r2]
 568 022a 1A70     		strb	r2, [r3]
 139:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 569              		.loc 1 139 0
 570 022c 4020     		movs	r0, #64
 571 022e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 140:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 141:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER = 0x55555555;
 572              		.loc 1 141 0
 573 0232 0F4B     		ldr	r3, .L39
 574 0234 114A     		ldr	r2, .L39+12
 575 0236 1A60     		str	r2, [r3]
 142:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( controller & B_CS1 ){
 576              		.loc 1 142 0
 577 0238 FB1D     		adds	r3, r7, #7
 578 023a 1B78     		ldrb	r3, [r3]
 579 023c 0822     		movs	r2, #8
 580 023e 1340     		ands	r3, r2
 581 0240 04D0     		beq	.L36
 143:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller(B_CS1);
 582              		.loc 1 143 0
 583 0242 0820     		movs	r0, #8
 584 0244 FFF7FEFF 		bl	select_controller
 144:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 585              		.loc 1 144 0
 586 0248 FFF7FEFF 		bl	graphic_wait_ready
 587              	.L36:
 145:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 146:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( controller & B_CS2 ){
 588              		.loc 1 146 0
 589 024c FB1D     		adds	r3, r7, #7
 590 024e 1B78     		ldrb	r3, [r3]
 591 0250 1022     		movs	r2, #16
 592 0252 1340     		ands	r3, r2
 593 0254 04D0     		beq	.L37
 147:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller(B_CS2);
 594              		.loc 1 147 0
 595 0256 1020     		movs	r0, #16
 596 0258 FFF7FEFF 		bl	select_controller
 148:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 597              		.loc 1 148 0
 598 025c FFF7FEFF 		bl	graphic_wait_ready
 599              	.L37:
 149:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 150:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	return RV;
 600              		.loc 1 150 0
 601 0260 0F23     		movs	r3, #15
 602 0262 FB18     		adds	r3, r7, r3
 603 0264 1B78     		ldrb	r3, [r3]
 151:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 604              		.loc 1 151 0
 605 0266 1800     		movs	r0, r3
 606 0268 BD46     		mov	sp, r7
 607 026a 04B0     		add	sp, sp, #16
 608              		@ sp needed
 609 026c 80BD     		pop	{r7, pc}
 610              	.L40:
 611 026e C046     		.align	2
 612              	.L39:
 613 0270 00100240 		.word	1073876992
 614 0274 55550000 		.word	21845
 615 0278 11100240 		.word	1073877009
 616 027c 55555555 		.word	1431655765
 617              		.cfi_endproc
 618              	.LFE9:
 620              		.align	1
 621              		.global	graphic_read_data
 622              		.syntax unified
 623              		.code	16
 624              		.thumb_func
 625              		.fpu softvfp
 627              	graphic_read_data:
 628              	.LFB10:
 152:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** uint8_t graphic_read_data(unsigned char controller){
 629              		.loc 1 152 0
 630              		.cfi_startproc
 631              		@ args = 0, pretend = 0, frame = 8
 632              		@ frame_needed = 1, uses_anonymous_args = 0
 633 0280 80B5     		push	{r7, lr}
 634              		.cfi_def_cfa_offset 8
 635              		.cfi_offset 7, -8
 636              		.cfi_offset 14, -4
 637 0282 82B0     		sub	sp, sp, #8
 638              		.cfi_def_cfa_offset 16
 639 0284 00AF     		add	r7, sp, #0
 640              		.cfi_def_cfa_register 7
 641 0286 0200     		movs	r2, r0
 642 0288 FB1D     		adds	r3, r7, #7
 643 028a 1A70     		strb	r2, [r3]
 153:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_read(controller);
 644              		.loc 1 153 0
 645 028c FB1D     		adds	r3, r7, #7
 646 028e 1B78     		ldrb	r3, [r3]
 647 0290 1800     		movs	r0, r3
 648 0292 FFF7FEFF 		bl	graphic_read
 154:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	return graphic_read(controller);
 649              		.loc 1 154 0
 650 0296 FB1D     		adds	r3, r7, #7
 651 0298 1B78     		ldrb	r3, [r3]
 652 029a 1800     		movs	r0, r3
 653 029c FFF7FEFF 		bl	graphic_read
 654 02a0 0300     		movs	r3, r0
 155:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 156:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 655              		.loc 1 156 0
 656 02a2 1800     		movs	r0, r3
 657 02a4 BD46     		mov	sp, r7
 658 02a6 02B0     		add	sp, sp, #8
 659              		@ sp needed
 660 02a8 80BD     		pop	{r7, pc}
 661              		.cfi_endproc
 662              	.LFE10:
 664              		.align	1
 665              		.global	graphic_write
 666              		.syntax unified
 667              		.code	16
 668              		.thumb_func
 669              		.fpu softvfp
 671              	graphic_write:
 672              	.LFB11:
 157:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_write(uint8_t value, uint8_t controller){
 673              		.loc 1 157 0
 674              		.cfi_startproc
 675              		@ args = 0, pretend = 0, frame = 8
 676              		@ frame_needed = 1, uses_anonymous_args = 0
 677 02aa 80B5     		push	{r7, lr}
 678              		.cfi_def_cfa_offset 8
 679              		.cfi_offset 7, -8
 680              		.cfi_offset 14, -4
 681 02ac 82B0     		sub	sp, sp, #8
 682              		.cfi_def_cfa_offset 16
 683 02ae 00AF     		add	r7, sp, #0
 684              		.cfi_def_cfa_register 7
 685 02b0 0200     		movs	r2, r0
 686 02b2 FB1D     		adds	r3, r7, #7
 687 02b4 1A70     		strb	r2, [r3]
 688 02b6 BB1D     		adds	r3, r7, #6
 689 02b8 0A1C     		adds	r2, r1, #0
 690 02ba 1A70     		strb	r2, [r3]
 158:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_HIGH = value;
 691              		.loc 1 158 0
 692 02bc 194A     		ldr	r2, .L46
 693 02be FB1D     		adds	r3, r7, #7
 694 02c0 1B78     		ldrb	r3, [r3]
 695 02c2 1370     		strb	r3, [r2]
 159:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller(controller);
 696              		.loc 1 159 0
 697 02c4 BB1D     		adds	r3, r7, #6
 698 02c6 1B78     		ldrb	r3, [r3]
 699 02c8 1800     		movs	r0, r3
 700 02ca FFF7FEFF 		bl	select_controller
 160:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 701              		.loc 1 160 0
 702 02ce FFF7FEFF 		bl	delay_500ns
 161:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 703              		.loc 1 161 0
 704 02d2 4020     		movs	r0, #64
 705 02d4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 162:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 706              		.loc 1 162 0
 707 02d8 FFF7FEFF 		bl	delay_500ns
 163:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 708              		.loc 1 163 0
 709 02dc 4020     		movs	r0, #64
 710 02de FFF7FEFF 		bl	graphic_ctrl_bit_clear
 164:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 165:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( controller & B_CS1 ){
 711              		.loc 1 165 0
 712 02e2 BB1D     		adds	r3, r7, #6
 713 02e4 1B78     		ldrb	r3, [r3]
 714 02e6 0822     		movs	r2, #8
 715 02e8 1340     		ands	r3, r2
 716 02ea 04D0     		beq	.L44
 166:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller( B_CS1 );
 717              		.loc 1 166 0
 718 02ec 0820     		movs	r0, #8
 719 02ee FFF7FEFF 		bl	select_controller
 167:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 720              		.loc 1 167 0
 721 02f2 FFF7FEFF 		bl	graphic_wait_ready
 722              	.L44:
 168:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 169:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( controller & B_CS2 ){
 723              		.loc 1 169 0
 724 02f6 BB1D     		adds	r3, r7, #6
 725 02f8 1B78     		ldrb	r3, [r3]
 726 02fa 1022     		movs	r2, #16
 727 02fc 1340     		ands	r3, r2
 728 02fe 04D0     		beq	.L45
 170:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller( B_CS2 );
 729              		.loc 1 170 0
 730 0300 1020     		movs	r0, #16
 731 0302 FFF7FEFF 		bl	select_controller
 171:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 732              		.loc 1 171 0
 733 0306 FFF7FEFF 		bl	graphic_wait_ready
 734              	.L45:
 172:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 173:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_HIGH = 0x0;
 735              		.loc 1 173 0
 736 030a 064B     		ldr	r3, .L46
 737 030c 0022     		movs	r2, #0
 738 030e 1A70     		strb	r2, [r3]
 174:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 739              		.loc 1 174 0
 740 0310 4020     		movs	r0, #64
 741 0312 FFF7FEFF 		bl	graphic_ctrl_bit_set
 175:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller(0);
 742              		.loc 1 175 0
 743 0316 0020     		movs	r0, #0
 744 0318 FFF7FEFF 		bl	select_controller
 176:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 745              		.loc 1 176 0
 746 031c C046     		nop
 747 031e BD46     		mov	sp, r7
 748 0320 02B0     		add	sp, sp, #8
 749              		@ sp needed
 750 0322 80BD     		pop	{r7, pc}
 751              	.L47:
 752              		.align	2
 753              	.L46:
 754 0324 15100240 		.word	1073877013
 755              		.cfi_endproc
 756              	.LFE11:
 758              		.align	1
 759              		.global	graphic_write_command
 760              		.syntax unified
 761              		.code	16
 762              		.thumb_func
 763              		.fpu softvfp
 765              	graphic_write_command:
 766              	.LFB12:
 177:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 767              		.loc 1 177 0
 768              		.cfi_startproc
 769              		@ args = 0, pretend = 0, frame = 8
 770              		@ frame_needed = 1, uses_anonymous_args = 0
 771 0328 80B5     		push	{r7, lr}
 772              		.cfi_def_cfa_offset 8
 773              		.cfi_offset 7, -8
 774              		.cfi_offset 14, -4
 775 032a 82B0     		sub	sp, sp, #8
 776              		.cfi_def_cfa_offset 16
 777 032c 00AF     		add	r7, sp, #0
 778              		.cfi_def_cfa_register 7
 779 032e 0200     		movs	r2, r0
 780 0330 FB1D     		adds	r3, r7, #7
 781 0332 1A70     		strb	r2, [r3]
 782 0334 BB1D     		adds	r3, r7, #6
 783 0336 0A1C     		adds	r2, r1, #0
 784 0338 1A70     		strb	r2, [r3]
 178:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 785              		.loc 1 178 0
 786 033a 4020     		movs	r0, #64
 787 033c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 179:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller( controller );
 788              		.loc 1 179 0
 789 0340 BB1D     		adds	r3, r7, #6
 790 0342 1B78     		ldrb	r3, [r3]
 791 0344 1800     		movs	r0, r3
 792 0346 FFF7FEFF 		bl	select_controller
 180:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_RS | B_RW );
 793              		.loc 1 180 0
 794 034a 0320     		movs	r0, #3
 795 034c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 181:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write( command, controller );
 796              		.loc 1 181 0
 797 0350 BB1D     		adds	r3, r7, #6
 798 0352 1A78     		ldrb	r2, [r3]
 799 0354 FB1D     		adds	r3, r7, #7
 800 0356 1B78     		ldrb	r3, [r3]
 801 0358 1100     		movs	r1, r2
 802 035a 1800     		movs	r0, r3
 803 035c FFF7FEFF 		bl	graphic_write
 182:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 804              		.loc 1 182 0
 805 0360 C046     		nop
 806 0362 BD46     		mov	sp, r7
 807 0364 02B0     		add	sp, sp, #8
 808              		@ sp needed
 809 0366 80BD     		pop	{r7, pc}
 810              		.cfi_endproc
 811              	.LFE12:
 813              		.align	1
 814              		.global	graphic_write_data
 815              		.syntax unified
 816              		.code	16
 817              		.thumb_func
 818              		.fpu softvfp
 820              	graphic_write_data:
 821              	.LFB13:
 183:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_write_data( uint8_t data, uint8_t controller ){
 822              		.loc 1 183 0
 823              		.cfi_startproc
 824              		@ args = 0, pretend = 0, frame = 8
 825              		@ frame_needed = 1, uses_anonymous_args = 0
 826 0368 80B5     		push	{r7, lr}
 827              		.cfi_def_cfa_offset 8
 828              		.cfi_offset 7, -8
 829              		.cfi_offset 14, -4
 830 036a 82B0     		sub	sp, sp, #8
 831              		.cfi_def_cfa_offset 16
 832 036c 00AF     		add	r7, sp, #0
 833              		.cfi_def_cfa_register 7
 834 036e 0200     		movs	r2, r0
 835 0370 FB1D     		adds	r3, r7, #7
 836 0372 1A70     		strb	r2, [r3]
 837 0374 BB1D     		adds	r3, r7, #6
 838 0376 0A1C     		adds	r2, r1, #0
 839 0378 1A70     		strb	r2, [r3]
 184:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 840              		.loc 1 184 0
 841 037a 4020     		movs	r0, #64
 842 037c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 185:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller( controller );
 843              		.loc 1 185 0
 844 0380 BB1D     		adds	r3, r7, #6
 845 0382 1B78     		ldrb	r3, [r3]
 846 0384 1800     		movs	r0, r3
 847 0386 FFF7FEFF 		bl	select_controller
 186:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_RS );
 848              		.loc 1 186 0
 849 038a 0120     		movs	r0, #1
 850 038c FFF7FEFF 		bl	graphic_ctrl_bit_set
 187:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_RW );
 851              		.loc 1 187 0
 852 0390 0220     		movs	r0, #2
 853 0392 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 188:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write( data, controller );
 854              		.loc 1 188 0
 855 0396 BB1D     		adds	r3, r7, #6
 856 0398 1A78     		ldrb	r2, [r3]
 857 039a FB1D     		adds	r3, r7, #7
 858 039c 1B78     		ldrb	r3, [r3]
 859 039e 1100     		movs	r1, r2
 860 03a0 1800     		movs	r0, r3
 861 03a2 FFF7FEFF 		bl	graphic_write
 189:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 862              		.loc 1 189 0
 863 03a6 C046     		nop
 864 03a8 BD46     		mov	sp, r7
 865 03aa 02B0     		add	sp, sp, #8
 866              		@ sp needed
 867 03ac 80BD     		pop	{r7, pc}
 868              		.cfi_endproc
 869              	.LFE13:
 871              		.align	1
 872              		.global	graphic_initialize
 873              		.syntax unified
 874              		.code	16
 875              		.thumb_func
 876              		.fpu softvfp
 878              	graphic_initialize:
 879              	.LFB14:
 190:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** //void graphic_clear_screen(void){
 191:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** //	for( int i = 0; i < 7; i++){											//KAN SKAPA PROBLEM DÅ I ALDRiG ÄR 7, SAMMA MED K
 192:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** //		graphic_write_command( LCD_SET_PAGE | i, B_CS1 | B_CS2 );
 193:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** //		graphic_write_command( LCD_SET_ADD	| 0, B_CS1 | B_CS2 );
 194:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** //		for(int k = 0; k < 63; k++){
 195:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** //			graphic_write_data( 0, B_CS1 | B_CS2 );
 196:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** //		}
 197:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** //	}
 198:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** //}
 199:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
 200:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_initialize(void){
 880              		.loc 1 200 0
 881              		.cfi_startproc
 882              		@ args = 0, pretend = 0, frame = 0
 883              		@ frame_needed = 1, uses_anonymous_args = 0
 884 03ae 80B5     		push	{r7, lr}
 885              		.cfi_def_cfa_offset 8
 886              		.cfi_offset 7, -8
 887              		.cfi_offset 14, -4
 888 03b0 00AF     		add	r7, sp, #0
 889              		.cfi_def_cfa_register 7
 201:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 890              		.loc 1 201 0
 891 03b2 4020     		movs	r0, #64
 892 03b4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 202:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_micro(10);
 893              		.loc 1 202 0
 894 03b8 0A20     		movs	r0, #10
 895 03ba FFF7FEFF 		bl	delay_micro
 203:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 204:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E );
 896              		.loc 1 204 0
 897 03be 7820     		movs	r0, #120
 898 03c0 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 205:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_milli(30);
 899              		.loc 1 205 0
 900 03c4 1E20     		movs	r0, #30
 901 03c6 FFF7FEFF 		bl	delay_milli
 206:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 207:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_RST);
 902              		.loc 1 207 0
 903 03ca 2020     		movs	r0, #32
 904 03cc FFF7FEFF 		bl	graphic_ctrl_bit_set
 208:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_milli(100);
 905              		.loc 1 208 0
 906 03d0 6420     		movs	r0, #100
 907 03d2 FFF7FEFF 		bl	delay_milli
 209:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_OFF,			B_CS1 | B_CS2);
 908              		.loc 1 209 0
 909 03d6 1821     		movs	r1, #24
 910 03d8 3E20     		movs	r0, #62
 911 03da FFF7FEFF 		bl	graphic_write_command
 210:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_ON,			B_CS1 | B_CS2);
 912              		.loc 1 210 0
 913 03de 1821     		movs	r1, #24
 914 03e0 3F20     		movs	r0, #63
 915 03e2 FFF7FEFF 		bl	graphic_write_command
 211:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_DISP_START, 	B_CS1 | B_CS2);
 916              		.loc 1 211 0
 917 03e6 1821     		movs	r1, #24
 918 03e8 C020     		movs	r0, #192
 919 03ea FFF7FEFF 		bl	graphic_write_command
 212:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_SET_ADD,		B_CS1 | B_CS2);
 920              		.loc 1 212 0
 921 03ee 1821     		movs	r1, #24
 922 03f0 4020     		movs	r0, #64
 923 03f2 FFF7FEFF 		bl	graphic_write_command
 213:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_SET_PAGE,		B_CS1 | B_CS2);
 924              		.loc 1 213 0
 925 03f6 1821     		movs	r1, #24
 926 03f8 B820     		movs	r0, #184
 927 03fa FFF7FEFF 		bl	graphic_write_command
 214:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller(0);
 928              		.loc 1 214 0
 929 03fe 0020     		movs	r0, #0
 930 0400 FFF7FEFF 		bl	select_controller
 215:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 931              		.loc 1 215 0
 932 0404 C046     		nop
 933 0406 BD46     		mov	sp, r7
 934              		@ sp needed
 935 0408 80BD     		pop	{r7, pc}
 936              		.cfi_endproc
 937              	.LFE14:
 939              		.align	1
 940              		.global	init_app
 941              		.syntax unified
 942              		.code	16
 943              		.thumb_func
 944              		.fpu softvfp
 946              	init_app:
 947              	.LFB15:
 216:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void init_app(void){
 948              		.loc 1 216 0
 949              		.cfi_startproc
 950              		@ args = 0, pretend = 0, frame = 0
 951              		@ frame_needed = 1, uses_anonymous_args = 0
 952 040a 80B5     		push	{r7, lr}
 953              		.cfi_def_cfa_offset 8
 954              		.cfi_offset 7, -8
 955              		.cfi_offset 14, -4
 956 040c 00AF     		add	r7, sp, #0
 957              		.cfi_def_cfa_register 7
 217:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER 	=0x55555555;
 958              		.loc 1 217 0
 959 040e 064B     		ldr	r3, .L52
 960 0410 064A     		ldr	r2, .L52+4
 961 0412 1A60     		str	r2, [r3]
 218:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_OTYPER 	=0x0000;
 962              		.loc 1 218 0
 963 0414 064B     		ldr	r3, .L52+8
 964 0416 0022     		movs	r2, #0
 965 0418 1A80     		strh	r2, [r3]
 219:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *PORT_OSPEEDR   =0x55555555;
 966              		.loc 1 219 0
 967 041a 064B     		ldr	r3, .L52+12
 968 041c 034A     		ldr	r2, .L52+4
 969 041e 1A60     		str	r2, [r3]
 220:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 970              		.loc 1 220 0
 971 0420 C046     		nop
 972 0422 BD46     		mov	sp, r7
 973              		@ sp needed
 974 0424 80BD     		pop	{r7, pc}
 975              	.L53:
 976 0426 C046     		.align	2
 977              	.L52:
 978 0428 00100240 		.word	1073876992
 979 042c 55555555 		.word	1431655765
 980 0430 08100240 		.word	1073877000
 981 0434 20100240 		.word	1073877024
 982              		.cfi_endproc
 983              	.LFE15:
 985              		.align	1
 986              		.global	main
 987              		.syntax unified
 988              		.code	16
 989              		.thumb_func
 990              		.fpu softvfp
 992              	main:
 993              	.LFB16:
 221:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
 222:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** int main(void){
 994              		.loc 1 222 0
 995              		.cfi_startproc
 996              		@ args = 0, pretend = 0, frame = 0
 997              		@ frame_needed = 1, uses_anonymous_args = 0
 998 0438 80B5     		push	{r7, lr}
 999              		.cfi_def_cfa_offset 8
 1000              		.cfi_offset 7, -8
 1001              		.cfi_offset 14, -4
 1002 043a 00AF     		add	r7, sp, #0
 1003              		.cfi_def_cfa_register 7
 223:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	init_app();
 1004              		.loc 1 223 0
 1005 043c FFF7FEFF 		bl	init_app
 224:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_initialize();
 1006              		.loc 1 224 0
 1007 0440 FFF7FEFF 		bl	graphic_initialize
 225:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	//graphic_clear_screen();
 226:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command( LCD_SET_ADD | 10, B_CS1 | B_CS2 );
 1008              		.loc 1 226 0
 1009 0444 1821     		movs	r1, #24
 1010 0446 4A20     		movs	r0, #74
 1011 0448 FFF7FEFF 		bl	graphic_write_command
 227:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command( LCD_SET_PAGE | 1, B_CS1 | B_CS2 );
 1012              		.loc 1 227 0
 1013 044c 1821     		movs	r1, #24
 1014 044e B920     		movs	r0, #185
 1015 0450 FFF7FEFF 		bl	graphic_write_command
 228:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command( 0xFF, B_CS1 | B_CS2 );
 1016              		.loc 1 228 0
 1017 0454 1821     		movs	r1, #24
 1018 0456 FF20     		movs	r0, #255
 1019 0458 FFF7FEFF 		bl	graphic_write_command
 229:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	return 0;
 1020              		.loc 1 229 0
 1021 045c 0023     		movs	r3, #0
 230:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 231:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 1022              		.loc 1 231 0
 1023 045e 1800     		movs	r0, r3
 1024 0460 BD46     		mov	sp, r7
 1025              		@ sp needed
 1026 0462 80BD     		pop	{r7, pc}
 1027              		.cfi_endproc
 1028              	.LFE16:
 1030              	.Letext0:
