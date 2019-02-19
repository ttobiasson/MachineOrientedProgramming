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
  25:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_OFF 		0x3E
  26:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_ON			0x3F
  27:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_DISP_START	0xC0
  28:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_SET_ADD		0x40
  29:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_SET_PAGE	0xB8
  30:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*STK DELAY*/
  31:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_CTRL ((volatile unsigned int*)(0xE000E010))
  32:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_LOAD ((volatile unsigned int*)(0xE000E014))
  33:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_VAL  ((volatile unsigned int*)(0xE000E018))
  34:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  35:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  36:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void startup ( void )
  37:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** {
  26              		.loc 1 37 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  38:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** asm volatile(
  31              		.loc 1 38 0
  32              		.syntax divided
  33              	@ 38 "/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  39:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  40:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" MOV SP,R0\n"
  41:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" BL main\n"				/* call main */
  42:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	".L1: B .L1\n"				/* never return */
  43:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	) ;
  44:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
  40              		.loc 1 44 0
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
  45:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_250ns(void){
  57              		.loc 1 45 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  46:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 0;
  67              		.loc 1 46 0
  68 0004 0C4B     		ldr	r3, .L4
  69 0006 0022     		movs	r2, #0
  70 0008 1A60     		str	r2, [r3]
  47:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_LOAD = ((168/4)-1);
  71              		.loc 1 47 0
  72 000a 0C4B     		ldr	r3, .L4+4
  73 000c 2922     		movs	r2, #41
  74 000e 1A60     		str	r2, [r3]
  48:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_VAL  = 0;
  75              		.loc 1 48 0
  76 0010 0B4B     		ldr	r3, .L4+8
  77 0012 0022     		movs	r2, #0
  78 0014 1A60     		str	r2, [r3]
  49:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 5;
  79              		.loc 1 49 0
  80 0016 084B     		ldr	r3, .L4
  81 0018 0522     		movs	r2, #5
  82 001a 1A60     		str	r2, [r3]
  50:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while( (*STK_CTRL & 0x10000)== 0){}
  83              		.loc 1 50 0
  84 001c C046     		nop
  85              	.L3:
  86              		.loc 1 50 0 is_stmt 0 discriminator 1
  87 001e 064B     		ldr	r3, .L4
  88 0020 1A68     		ldr	r2, [r3]
  89 0022 8023     		movs	r3, #128
  90 0024 5B02     		lsls	r3, r3, #9
  91 0026 1340     		ands	r3, r2
  92 0028 F9D0     		beq	.L3
  51:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 0;
  93              		.loc 1 51 0 is_stmt 1
  94 002a 034B     		ldr	r3, .L4
  95 002c 0022     		movs	r2, #0
  96 002e 1A60     		str	r2, [r3]
  52:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
  97              		.loc 1 52 0
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
  53:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_500ns(void){
 120              		.loc 1 53 0
 121              		.cfi_startproc
 122              		@ args = 0, pretend = 0, frame = 0
 123              		@ frame_needed = 1, uses_anonymous_args = 0
 124 0044 80B5     		push	{r7, lr}
 125              		.cfi_def_cfa_offset 8
 126              		.cfi_offset 7, -8
 127              		.cfi_offset 14, -4
 128 0046 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
  54:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_250ns();
 130              		.loc 1 54 0
 131 0048 FFF7FEFF 		bl	delay_250ns
  55:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_250ns();
 132              		.loc 1 55 0
 133 004c FFF7FEFF 		bl	delay_250ns
  56:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 134              		.loc 1 56 0
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
  57:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_micro(unsigned int us){
 151              		.loc 1 57 0
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
  58:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(us--){
 164              		.loc 1 58 0
 165 005e 07E0     		b	.L8
 166              	.L9:
  59:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 167              		.loc 1 59 0
 168 0060 FFF7FEFF 		bl	delay_250ns
  60:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 169              		.loc 1 60 0
 170 0064 FFF7FEFF 		bl	delay_250ns
  61:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 171              		.loc 1 61 0
 172 0068 FFF7FEFF 		bl	delay_250ns
  62:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 173              		.loc 1 62 0
 174 006c FFF7FEFF 		bl	delay_250ns
 175              	.L8:
  58:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 176              		.loc 1 58 0
 177 0070 7B68     		ldr	r3, [r7, #4]
 178 0072 5A1E     		subs	r2, r3, #1
 179 0074 7A60     		str	r2, [r7, #4]
 180 0076 002B     		cmp	r3, #0
 181 0078 F2D1     		bne	.L9
  63:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     }
  64:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 182              		.loc 1 64 0
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
  65:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_milli(unsigned int ms){
 200              		.loc 1 65 0
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
  66:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(ms--){
 213              		.loc 1 66 0
 214 008a 02E0     		b	.L11
 215              	.L12:
  67:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_micro(10);
 216              		.loc 1 67 0
 217 008c 0A20     		movs	r0, #10
 218 008e FFF7FEFF 		bl	delay_micro
 219              	.L11:
  66:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(ms--){
 220              		.loc 1 66 0
 221 0092 7B68     		ldr	r3, [r7, #4]
 222 0094 5A1E     		subs	r2, r3, #1
 223 0096 7A60     		str	r2, [r7, #4]
 224 0098 002B     		cmp	r3, #0
 225 009a F7D1     		bne	.L12
  68:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     }
  69:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     
  70:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 226              		.loc 1 70 0
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
  71:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** typedef unsigned char uint8_t;
  72:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  73:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_ctrl_bit_set(uint8_t x){
 244              		.loc 1 73 0
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
  74:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW |= x;
 259              		.loc 1 74 0
 260 00b0 0A4B     		ldr	r3, .L14
 261 00b2 1B78     		ldrb	r3, [r3]
 262 00b4 DAB2     		uxtb	r2, r3
 263 00b6 0949     		ldr	r1, .L14
 264 00b8 FB1D     		adds	r3, r7, #7
 265 00ba 1B78     		ldrb	r3, [r3]
 266 00bc 1343     		orrs	r3, r2
 267 00be DBB2     		uxtb	r3, r3
 268 00c0 0B70     		strb	r3, [r1]
  75:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW &= ~(1UL << 2);
 269              		.loc 1 75 0
 270 00c2 064B     		ldr	r3, .L14
 271 00c4 1B78     		ldrb	r3, [r3]
 272 00c6 DBB2     		uxtb	r3, r3
 273 00c8 044A     		ldr	r2, .L14
 274 00ca 0421     		movs	r1, #4
 275 00cc 8B43     		bics	r3, r1
 276 00ce DBB2     		uxtb	r3, r3
 277 00d0 1370     		strb	r3, [r2]
  76:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  77:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 278              		.loc 1 77 0
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
  78:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_ctrl_bit_clear(uint8_t x){
 300              		.loc 1 78 0
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
  79:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW &= ~((1UL << 2) | x);
 315              		.loc 1 79 0
 316 00ec 084B     		ldr	r3, .L17
 317 00ee 1B78     		ldrb	r3, [r3]
 318 00f0 DBB2     		uxtb	r3, r3
 319 00f2 FA1D     		adds	r2, r7, #7
 320 00f4 1278     		ldrb	r2, [r2]
 321 00f6 0421     		movs	r1, #4
 322 00f8 0A43     		orrs	r2, r1
 323 00fa D2B2     		uxtb	r2, r2
 324 00fc D243     		mvns	r2, r2
 325 00fe D2B2     		uxtb	r2, r2
 326 0100 0349     		ldr	r1, .L17
 327 0102 1340     		ands	r3, r2
 328 0104 DBB2     		uxtb	r3, r3
 329 0106 0B70     		strb	r3, [r1]
  80:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  81:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 330              		.loc 1 81 0
 331 0108 C046     		nop
 332 010a BD46     		mov	sp, r7
 333 010c 02B0     		add	sp, sp, #8
 334              		@ sp needed
 335 010e 80BD     		pop	{r7, pc}
 336              	.L18:
 337              		.align	2
 338              	.L17:
 339 0110 14100240 		.word	1073877012
 340              		.cfi_endproc
 341              	.LFE6:
 343              		.align	1
 344              		.global	select_controller
 345              		.syntax unified
 346              		.code	16
 347              		.thumb_func
 348              		.fpu softvfp
 350              	select_controller:
 351              	.LFB7:
  82:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void select_controller(uint8_t controller){
 352              		.loc 1 82 0
 353              		.cfi_startproc
 354              		@ args = 0, pretend = 0, frame = 8
 355              		@ frame_needed = 1, uses_anonymous_args = 0
 356 0114 80B5     		push	{r7, lr}
 357              		.cfi_def_cfa_offset 8
 358              		.cfi_offset 7, -8
 359              		.cfi_offset 14, -4
 360 0116 82B0     		sub	sp, sp, #8
 361              		.cfi_def_cfa_offset 16
 362 0118 00AF     		add	r7, sp, #0
 363              		.cfi_def_cfa_register 7
 364 011a 0200     		movs	r2, r0
 365 011c FB1D     		adds	r3, r7, #7
 366 011e 1A70     		strb	r2, [r3]
  83:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	switch(controller){
 367              		.loc 1 83 0
 368 0120 FB1D     		adds	r3, r7, #7
 369 0122 1B78     		ldrb	r3, [r3]
 370 0124 082B     		cmp	r3, #8
 371 0126 0CD0     		beq	.L21
 372 0128 02DC     		bgt	.L22
 373 012a 002B     		cmp	r3, #0
 374 012c 05D0     		beq	.L23
  84:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case 0:
  85:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS1 | B_CS2);
  86:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  87:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1:
  88:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS1);
  89:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
  90:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  91:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS2:
  92:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
  93:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
  94:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  95:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1 | B_CS2:
  96:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS1 | B_CS2);
  97:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  98:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
  99:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		
 100:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 101:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 375              		.loc 1 101 0
 376 012e 1AE0     		b	.L26
 377              	.L22:
  83:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	switch(controller){
 378              		.loc 1 83 0
 379 0130 102B     		cmp	r3, #16
 380 0132 0DD0     		beq	.L24
 381 0134 182B     		cmp	r3, #24
 382 0136 12D0     		beq	.L25
 383              		.loc 1 101 0
 384 0138 15E0     		b	.L26
 385              	.L23:
  85:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 386              		.loc 1 85 0
 387 013a 1820     		movs	r0, #24
 388 013c FFF7FEFF 		bl	graphic_ctrl_bit_clear
  86:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1:
 389              		.loc 1 86 0
 390 0140 11E0     		b	.L20
 391              	.L21:
  88:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 392              		.loc 1 88 0
 393 0142 0820     		movs	r0, #8
 394 0144 FFF7FEFF 		bl	graphic_ctrl_bit_set
  89:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 395              		.loc 1 89 0
 396 0148 1020     		movs	r0, #16
 397 014a FFF7FEFF 		bl	graphic_ctrl_bit_clear
  90:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS2:
 398              		.loc 1 90 0
 399 014e 0AE0     		b	.L20
 400              	.L24:
  92:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
 401              		.loc 1 92 0
 402 0150 1020     		movs	r0, #16
 403 0152 FFF7FEFF 		bl	graphic_ctrl_bit_set
  93:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 404              		.loc 1 93 0
 405 0156 0820     		movs	r0, #8
 406 0158 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  94:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1 | B_CS2:
 407              		.loc 1 94 0
 408 015c 03E0     		b	.L20
 409              	.L25:
  96:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 410              		.loc 1 96 0
 411 015e 1820     		movs	r0, #24
 412 0160 FFF7FEFF 		bl	graphic_ctrl_bit_set
  97:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 413              		.loc 1 97 0
 414 0164 C046     		nop
 415              	.L20:
 416              	.L26:
 417              		.loc 1 101 0
 418 0166 C046     		nop
 419 0168 BD46     		mov	sp, r7
 420 016a 02B0     		add	sp, sp, #8
 421              		@ sp needed
 422 016c 80BD     		pop	{r7, pc}
 423              		.cfi_endproc
 424              	.LFE7:
 426              		.align	1
 427              		.global	graphic_wait_ready
 428              		.syntax unified
 429              		.code	16
 430              		.thumb_func
 431              		.fpu softvfp
 433              	graphic_wait_ready:
 434              	.LFB8:
 102:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_wait_ready(void){
 435              		.loc 1 102 0
 436              		.cfi_startproc
 437              		@ args = 0, pretend = 0, frame = 8
 438              		@ frame_needed = 1, uses_anonymous_args = 0
 439 016e 80B5     		push	{r7, lr}
 440              		.cfi_def_cfa_offset 8
 441              		.cfi_offset 7, -8
 442              		.cfi_offset 14, -4
 443 0170 82B0     		sub	sp, sp, #8
 444              		.cfi_def_cfa_offset 16
 445 0172 00AF     		add	r7, sp, #0
 446              		.cfi_def_cfa_register 7
 103:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	uint8_t c;
 104:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 447              		.loc 1 104 0
 448 0174 4020     		movs	r0, #64
 449 0176 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 105:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER = 0x00005555;
 450              		.loc 1 105 0
 451 017a 164B     		ldr	r3, .L33
 452 017c 164A     		ldr	r2, .L33+4
 453 017e 1A60     		str	r2, [r3]
 106:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 454              		.loc 1 106 0
 455 0180 0120     		movs	r0, #1
 456 0182 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 107:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_RW);
 457              		.loc 1 107 0
 458 0186 0220     		movs	r0, #2
 459 0188 FFF7FEFF 		bl	graphic_ctrl_bit_set
 108:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 460              		.loc 1 108 0
 461 018c FFF7FEFF 		bl	delay_500ns
 462              	.L30:
 109:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	while(1){
 110:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_E);
 463              		.loc 1 110 0
 464 0190 4020     		movs	r0, #64
 465 0192 FFF7FEFF 		bl	graphic_ctrl_bit_set
 111:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		delay_500ns();
 466              		.loc 1 111 0
 467 0196 FFF7FEFF 		bl	delay_500ns
 112:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		c = *PORT_IDR_HIGH & LCD_BUSY;
 468              		.loc 1 112 0
 469 019a 104B     		ldr	r3, .L33+8
 470 019c 1B78     		ldrb	r3, [r3]
 471 019e DAB2     		uxtb	r2, r3
 472 01a0 FB1D     		adds	r3, r7, #7
 473 01a2 7F21     		movs	r1, #127
 474 01a4 8A43     		bics	r2, r1
 475 01a6 1A70     		strb	r2, [r3]
 113:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_E);
 476              		.loc 1 113 0
 477 01a8 4020     		movs	r0, #64
 478 01aa FFF7FEFF 		bl	graphic_ctrl_bit_clear
 114:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		delay_500ns();
 479              		.loc 1 114 0
 480 01ae FFF7FEFF 		bl	delay_500ns
 115:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		if( c == 0)
 481              		.loc 1 115 0
 482 01b2 FB1D     		adds	r3, r7, #7
 483 01b4 1B78     		ldrb	r3, [r3]
 484 01b6 002B     		cmp	r3, #0
 485 01b8 00D0     		beq	.L32
 110:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		delay_500ns();
 486              		.loc 1 110 0
 487 01ba E9E7     		b	.L30
 488              	.L32:
 116:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 			break;
 489              		.loc 1 116 0
 490 01bc C046     		nop
 117:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		
 118:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 119:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 491              		.loc 1 119 0
 492 01be 4020     		movs	r0, #64
 493 01c0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 120:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER = 0x55555555;
 494              		.loc 1 120 0
 495 01c4 034B     		ldr	r3, .L33
 496 01c6 064A     		ldr	r2, .L33+12
 497 01c8 1A60     		str	r2, [r3]
 121:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 498              		.loc 1 121 0
 499 01ca C046     		nop
 500 01cc BD46     		mov	sp, r7
 501 01ce 02B0     		add	sp, sp, #8
 502              		@ sp needed
 503 01d0 80BD     		pop	{r7, pc}
 504              	.L34:
 505 01d2 C046     		.align	2
 506              	.L33:
 507 01d4 00100240 		.word	1073876992
 508 01d8 55550000 		.word	21845
 509 01dc 11100240 		.word	1073877009
 510 01e0 55555555 		.word	1431655765
 511              		.cfi_endproc
 512              	.LFE8:
 514              		.align	1
 515              		.global	graphic_read
 516              		.syntax unified
 517              		.code	16
 518              		.thumb_func
 519              		.fpu softvfp
 521              	graphic_read:
 522              	.LFB9:
 122:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** uint8_t graphic_read(uint8_t controller ){
 523              		.loc 1 122 0
 524              		.cfi_startproc
 525              		@ args = 0, pretend = 0, frame = 16
 526              		@ frame_needed = 1, uses_anonymous_args = 0
 527 01e4 80B5     		push	{r7, lr}
 528              		.cfi_def_cfa_offset 8
 529              		.cfi_offset 7, -8
 530              		.cfi_offset 14, -4
 531 01e6 84B0     		sub	sp, sp, #16
 532              		.cfi_def_cfa_offset 24
 533 01e8 00AF     		add	r7, sp, #0
 534              		.cfi_def_cfa_register 7
 535 01ea 0200     		movs	r2, r0
 536 01ec FB1D     		adds	r3, r7, #7
 537 01ee 1A70     		strb	r2, [r3]
 123:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	uint8_t RV;
 124:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 538              		.loc 1 124 0
 539 01f0 4020     		movs	r0, #64
 540 01f2 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 125:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER = 0x00005555;
 541              		.loc 1 125 0
 542 01f6 1C4B     		ldr	r3, .L39
 543 01f8 1C4A     		ldr	r2, .L39+4
 544 01fa 1A60     		str	r2, [r3]
 126:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 127:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_RS | B_RW);
 545              		.loc 1 127 0
 546 01fc 0320     		movs	r0, #3
 547 01fe FFF7FEFF 		bl	graphic_ctrl_bit_set
 128:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 129:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller( controller );
 548              		.loc 1 129 0
 549 0202 FB1D     		adds	r3, r7, #7
 550 0204 1B78     		ldrb	r3, [r3]
 551 0206 1800     		movs	r0, r3
 552 0208 FFF7FEFF 		bl	select_controller
 130:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 553              		.loc 1 130 0
 554 020c FFF7FEFF 		bl	delay_500ns
 131:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 132:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_E );
 555              		.loc 1 132 0
 556 0210 4020     		movs	r0, #64
 557 0212 FFF7FEFF 		bl	graphic_ctrl_bit_set
 133:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 558              		.loc 1 133 0
 559 0216 FFF7FEFF 		bl	delay_500ns
 134:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 135:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	RV = *PORT_IDR_HIGH;
 560              		.loc 1 135 0
 561 021a 154A     		ldr	r2, .L39+8
 562 021c 0F23     		movs	r3, #15
 563 021e FB18     		adds	r3, r7, r3
 564 0220 1278     		ldrb	r2, [r2]
 565 0222 1A70     		strb	r2, [r3]
 136:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 566              		.loc 1 136 0
 567 0224 4020     		movs	r0, #64
 568 0226 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 137:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 138:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER = 0x55555555;
 569              		.loc 1 138 0
 570 022a 0F4B     		ldr	r3, .L39
 571 022c 114A     		ldr	r2, .L39+12
 572 022e 1A60     		str	r2, [r3]
 139:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( controller & B_CS1 ){
 573              		.loc 1 139 0
 574 0230 FB1D     		adds	r3, r7, #7
 575 0232 1B78     		ldrb	r3, [r3]
 576 0234 0822     		movs	r2, #8
 577 0236 1340     		ands	r3, r2
 578 0238 04D0     		beq	.L36
 140:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller(B_CS1);
 579              		.loc 1 140 0
 580 023a 0820     		movs	r0, #8
 581 023c FFF7FEFF 		bl	select_controller
 141:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 582              		.loc 1 141 0
 583 0240 FFF7FEFF 		bl	graphic_wait_ready
 584              	.L36:
 142:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 143:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( controller & B_CS2 ){
 585              		.loc 1 143 0
 586 0244 FB1D     		adds	r3, r7, #7
 587 0246 1B78     		ldrb	r3, [r3]
 588 0248 1022     		movs	r2, #16
 589 024a 1340     		ands	r3, r2
 590 024c 04D0     		beq	.L37
 144:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller(B_CS2);
 591              		.loc 1 144 0
 592 024e 1020     		movs	r0, #16
 593 0250 FFF7FEFF 		bl	select_controller
 145:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 594              		.loc 1 145 0
 595 0254 FFF7FEFF 		bl	graphic_wait_ready
 596              	.L37:
 146:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 147:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	return RV;
 597              		.loc 1 147 0
 598 0258 0F23     		movs	r3, #15
 599 025a FB18     		adds	r3, r7, r3
 600 025c 1B78     		ldrb	r3, [r3]
 148:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 601              		.loc 1 148 0
 602 025e 1800     		movs	r0, r3
 603 0260 BD46     		mov	sp, r7
 604 0262 04B0     		add	sp, sp, #16
 605              		@ sp needed
 606 0264 80BD     		pop	{r7, pc}
 607              	.L40:
 608 0266 C046     		.align	2
 609              	.L39:
 610 0268 00100240 		.word	1073876992
 611 026c 55550000 		.word	21845
 612 0270 11100240 		.word	1073877009
 613 0274 55555555 		.word	1431655765
 614              		.cfi_endproc
 615              	.LFE9:
 617              		.align	1
 618              		.global	graphic_read_data
 619              		.syntax unified
 620              		.code	16
 621              		.thumb_func
 622              		.fpu softvfp
 624              	graphic_read_data:
 625              	.LFB10:
 149:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** uint8_t graphic_read_data(unsigned char controller){
 626              		.loc 1 149 0
 627              		.cfi_startproc
 628              		@ args = 0, pretend = 0, frame = 8
 629              		@ frame_needed = 1, uses_anonymous_args = 0
 630 0278 80B5     		push	{r7, lr}
 631              		.cfi_def_cfa_offset 8
 632              		.cfi_offset 7, -8
 633              		.cfi_offset 14, -4
 634 027a 82B0     		sub	sp, sp, #8
 635              		.cfi_def_cfa_offset 16
 636 027c 00AF     		add	r7, sp, #0
 637              		.cfi_def_cfa_register 7
 638 027e 0200     		movs	r2, r0
 639 0280 FB1D     		adds	r3, r7, #7
 640 0282 1A70     		strb	r2, [r3]
 150:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_read(controller);
 641              		.loc 1 150 0
 642 0284 FB1D     		adds	r3, r7, #7
 643 0286 1B78     		ldrb	r3, [r3]
 644 0288 1800     		movs	r0, r3
 645 028a FFF7FEFF 		bl	graphic_read
 151:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	return graphic_read(controller);
 646              		.loc 1 151 0
 647 028e FB1D     		adds	r3, r7, #7
 648 0290 1B78     		ldrb	r3, [r3]
 649 0292 1800     		movs	r0, r3
 650 0294 FFF7FEFF 		bl	graphic_read
 651 0298 0300     		movs	r3, r0
 152:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 153:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 652              		.loc 1 153 0
 653 029a 1800     		movs	r0, r3
 654 029c BD46     		mov	sp, r7
 655 029e 02B0     		add	sp, sp, #8
 656              		@ sp needed
 657 02a0 80BD     		pop	{r7, pc}
 658              		.cfi_endproc
 659              	.LFE10:
 661              		.align	1
 662              		.global	graphic_write
 663              		.syntax unified
 664              		.code	16
 665              		.thumb_func
 666              		.fpu softvfp
 668              	graphic_write:
 669              	.LFB11:
 154:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_write(uint8_t value, uint8_t controller){
 670              		.loc 1 154 0
 671              		.cfi_startproc
 672              		@ args = 0, pretend = 0, frame = 8
 673              		@ frame_needed = 1, uses_anonymous_args = 0
 674 02a2 80B5     		push	{r7, lr}
 675              		.cfi_def_cfa_offset 8
 676              		.cfi_offset 7, -8
 677              		.cfi_offset 14, -4
 678 02a4 82B0     		sub	sp, sp, #8
 679              		.cfi_def_cfa_offset 16
 680 02a6 00AF     		add	r7, sp, #0
 681              		.cfi_def_cfa_register 7
 682 02a8 0200     		movs	r2, r0
 683 02aa FB1D     		adds	r3, r7, #7
 684 02ac 1A70     		strb	r2, [r3]
 685 02ae BB1D     		adds	r3, r7, #6
 686 02b0 0A1C     		adds	r2, r1, #0
 687 02b2 1A70     		strb	r2, [r3]
 155:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_HIGH = value;
 688              		.loc 1 155 0
 689 02b4 194A     		ldr	r2, .L46
 690 02b6 FB1D     		adds	r3, r7, #7
 691 02b8 1B78     		ldrb	r3, [r3]
 692 02ba 1370     		strb	r3, [r2]
 156:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller(controller);
 693              		.loc 1 156 0
 694 02bc BB1D     		adds	r3, r7, #6
 695 02be 1B78     		ldrb	r3, [r3]
 696 02c0 1800     		movs	r0, r3
 697 02c2 FFF7FEFF 		bl	select_controller
 157:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 698              		.loc 1 157 0
 699 02c6 FFF7FEFF 		bl	delay_500ns
 158:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 700              		.loc 1 158 0
 701 02ca 4020     		movs	r0, #64
 702 02cc FFF7FEFF 		bl	graphic_ctrl_bit_set
 159:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 703              		.loc 1 159 0
 704 02d0 FFF7FEFF 		bl	delay_500ns
 160:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 705              		.loc 1 160 0
 706 02d4 4020     		movs	r0, #64
 707 02d6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 161:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 162:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( controller & B_CS1 ){
 708              		.loc 1 162 0
 709 02da BB1D     		adds	r3, r7, #6
 710 02dc 1B78     		ldrb	r3, [r3]
 711 02de 0822     		movs	r2, #8
 712 02e0 1340     		ands	r3, r2
 713 02e2 04D0     		beq	.L44
 163:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller( B_CS1 );
 714              		.loc 1 163 0
 715 02e4 0820     		movs	r0, #8
 716 02e6 FFF7FEFF 		bl	select_controller
 164:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 717              		.loc 1 164 0
 718 02ea FFF7FEFF 		bl	graphic_wait_ready
 719              	.L44:
 165:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 166:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( controller & B_CS2 ){
 720              		.loc 1 166 0
 721 02ee BB1D     		adds	r3, r7, #6
 722 02f0 1B78     		ldrb	r3, [r3]
 723 02f2 1022     		movs	r2, #16
 724 02f4 1340     		ands	r3, r2
 725 02f6 04D0     		beq	.L45
 167:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller( B_CS2 );
 726              		.loc 1 167 0
 727 02f8 1020     		movs	r0, #16
 728 02fa FFF7FEFF 		bl	select_controller
 168:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 729              		.loc 1 168 0
 730 02fe FFF7FEFF 		bl	graphic_wait_ready
 731              	.L45:
 169:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 170:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_HIGH = 0x0;
 732              		.loc 1 170 0
 733 0302 064B     		ldr	r3, .L46
 734 0304 0022     		movs	r2, #0
 735 0306 1A70     		strb	r2, [r3]
 171:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 736              		.loc 1 171 0
 737 0308 4020     		movs	r0, #64
 738 030a FFF7FEFF 		bl	graphic_ctrl_bit_set
 172:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller(0);
 739              		.loc 1 172 0
 740 030e 0020     		movs	r0, #0
 741 0310 FFF7FEFF 		bl	select_controller
 173:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 742              		.loc 1 173 0
 743 0314 C046     		nop
 744 0316 BD46     		mov	sp, r7
 745 0318 02B0     		add	sp, sp, #8
 746              		@ sp needed
 747 031a 80BD     		pop	{r7, pc}
 748              	.L47:
 749              		.align	2
 750              	.L46:
 751 031c 15100240 		.word	1073877013
 752              		.cfi_endproc
 753              	.LFE11:
 755              		.align	1
 756              		.global	graphic_write_command
 757              		.syntax unified
 758              		.code	16
 759              		.thumb_func
 760              		.fpu softvfp
 762              	graphic_write_command:
 763              	.LFB12:
 174:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 764              		.loc 1 174 0
 765              		.cfi_startproc
 766              		@ args = 0, pretend = 0, frame = 8
 767              		@ frame_needed = 1, uses_anonymous_args = 0
 768 0320 80B5     		push	{r7, lr}
 769              		.cfi_def_cfa_offset 8
 770              		.cfi_offset 7, -8
 771              		.cfi_offset 14, -4
 772 0322 82B0     		sub	sp, sp, #8
 773              		.cfi_def_cfa_offset 16
 774 0324 00AF     		add	r7, sp, #0
 775              		.cfi_def_cfa_register 7
 776 0326 0200     		movs	r2, r0
 777 0328 FB1D     		adds	r3, r7, #7
 778 032a 1A70     		strb	r2, [r3]
 779 032c BB1D     		adds	r3, r7, #6
 780 032e 0A1C     		adds	r2, r1, #0
 781 0330 1A70     		strb	r2, [r3]
 175:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 782              		.loc 1 175 0
 783 0332 4020     		movs	r0, #64
 784 0334 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 176:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller( controller );
 785              		.loc 1 176 0
 786 0338 BB1D     		adds	r3, r7, #6
 787 033a 1B78     		ldrb	r3, [r3]
 788 033c 1800     		movs	r0, r3
 789 033e FFF7FEFF 		bl	select_controller
 177:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_RS | B_RW );
 790              		.loc 1 177 0
 791 0342 0320     		movs	r0, #3
 792 0344 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 178:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write( command, controller );
 793              		.loc 1 178 0
 794 0348 BB1D     		adds	r3, r7, #6
 795 034a 1A78     		ldrb	r2, [r3]
 796 034c FB1D     		adds	r3, r7, #7
 797 034e 1B78     		ldrb	r3, [r3]
 798 0350 1100     		movs	r1, r2
 799 0352 1800     		movs	r0, r3
 800 0354 FFF7FEFF 		bl	graphic_write
 179:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 801              		.loc 1 179 0
 802 0358 C046     		nop
 803 035a BD46     		mov	sp, r7
 804 035c 02B0     		add	sp, sp, #8
 805              		@ sp needed
 806 035e 80BD     		pop	{r7, pc}
 807              		.cfi_endproc
 808              	.LFE12:
 810              		.align	1
 811              		.global	graphic_write_data
 812              		.syntax unified
 813              		.code	16
 814              		.thumb_func
 815              		.fpu softvfp
 817              	graphic_write_data:
 818              	.LFB13:
 180:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_write_data( uint8_t data, uint8_t controller ){
 819              		.loc 1 180 0
 820              		.cfi_startproc
 821              		@ args = 0, pretend = 0, frame = 8
 822              		@ frame_needed = 1, uses_anonymous_args = 0
 823 0360 80B5     		push	{r7, lr}
 824              		.cfi_def_cfa_offset 8
 825              		.cfi_offset 7, -8
 826              		.cfi_offset 14, -4
 827 0362 82B0     		sub	sp, sp, #8
 828              		.cfi_def_cfa_offset 16
 829 0364 00AF     		add	r7, sp, #0
 830              		.cfi_def_cfa_register 7
 831 0366 0200     		movs	r2, r0
 832 0368 FB1D     		adds	r3, r7, #7
 833 036a 1A70     		strb	r2, [r3]
 834 036c BB1D     		adds	r3, r7, #6
 835 036e 0A1C     		adds	r2, r1, #0
 836 0370 1A70     		strb	r2, [r3]
 181:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 837              		.loc 1 181 0
 838 0372 4020     		movs	r0, #64
 839 0374 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 182:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller( controller );
 840              		.loc 1 182 0
 841 0378 BB1D     		adds	r3, r7, #6
 842 037a 1B78     		ldrb	r3, [r3]
 843 037c 1800     		movs	r0, r3
 844 037e FFF7FEFF 		bl	select_controller
 183:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_RS );
 845              		.loc 1 183 0
 846 0382 0120     		movs	r0, #1
 847 0384 FFF7FEFF 		bl	graphic_ctrl_bit_set
 184:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_RW );
 848              		.loc 1 184 0
 849 0388 0220     		movs	r0, #2
 850 038a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 185:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write( data, controller );
 851              		.loc 1 185 0
 852 038e BB1D     		adds	r3, r7, #6
 853 0390 1A78     		ldrb	r2, [r3]
 854 0392 FB1D     		adds	r3, r7, #7
 855 0394 1B78     		ldrb	r3, [r3]
 856 0396 1100     		movs	r1, r2
 857 0398 1800     		movs	r0, r3
 858 039a FFF7FEFF 		bl	graphic_write
 186:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 859              		.loc 1 186 0
 860 039e C046     		nop
 861 03a0 BD46     		mov	sp, r7
 862 03a2 02B0     		add	sp, sp, #8
 863              		@ sp needed
 864 03a4 80BD     		pop	{r7, pc}
 865              		.cfi_endproc
 866              	.LFE13:
 868              		.align	1
 869              		.global	graphic_clear_screen
 870              		.syntax unified
 871              		.code	16
 872              		.thumb_func
 873              		.fpu softvfp
 875              	graphic_clear_screen:
 876              	.LFB14:
 187:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_clear_screen(void){
 877              		.loc 1 187 0
 878              		.cfi_startproc
 879              		@ args = 0, pretend = 0, frame = 8
 880              		@ frame_needed = 1, uses_anonymous_args = 0
 881 03a6 80B5     		push	{r7, lr}
 882              		.cfi_def_cfa_offset 8
 883              		.cfi_offset 7, -8
 884              		.cfi_offset 14, -4
 885 03a8 82B0     		sub	sp, sp, #8
 886              		.cfi_def_cfa_offset 16
 887 03aa 00AF     		add	r7, sp, #0
 888              		.cfi_def_cfa_register 7
 889              	.LBB2:
 188:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	for( int i = 0; i < 7; i++){											//KAN SKAPA PROBLEM DÅ I ALDRiG ÄR 7, SAMMA MED K
 890              		.loc 1 188 0
 891 03ac 0023     		movs	r3, #0
 892 03ae 7B60     		str	r3, [r7, #4]
 893 03b0 1EE0     		b	.L51
 894              	.L54:
 189:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_write_command( LCD_SET_PAGE | i, B_CS1 | B_CS2 );
 895              		.loc 1 189 0
 896 03b2 7B68     		ldr	r3, [r7, #4]
 897 03b4 5BB2     		sxtb	r3, r3
 898 03b6 4822     		movs	r2, #72
 899 03b8 5242     		rsbs	r2, r2, #0
 900 03ba 1343     		orrs	r3, r2
 901 03bc 5BB2     		sxtb	r3, r3
 902 03be DBB2     		uxtb	r3, r3
 903 03c0 1821     		movs	r1, #24
 904 03c2 1800     		movs	r0, r3
 905 03c4 FFF7FEFF 		bl	graphic_write_command
 190:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_write_command( LCD_SET_ADD	| 0, B_CS1 | B_CS2 );
 906              		.loc 1 190 0
 907 03c8 1821     		movs	r1, #24
 908 03ca 4020     		movs	r0, #64
 909 03cc FFF7FEFF 		bl	graphic_write_command
 910              	.LBB3:
 191:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		for(int k = 0; k < 63; k++){
 911              		.loc 1 191 0
 912 03d0 0023     		movs	r3, #0
 913 03d2 3B60     		str	r3, [r7]
 914 03d4 06E0     		b	.L52
 915              	.L53:
 192:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 			graphic_write_data( 0, B_CS1 | B_CS2 );
 916              		.loc 1 192 0 discriminator 3
 917 03d6 1821     		movs	r1, #24
 918 03d8 0020     		movs	r0, #0
 919 03da FFF7FEFF 		bl	graphic_write_data
 191:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		for(int k = 0; k < 63; k++){
 920              		.loc 1 191 0 discriminator 3
 921 03de 3B68     		ldr	r3, [r7]
 922 03e0 0133     		adds	r3, r3, #1
 923 03e2 3B60     		str	r3, [r7]
 924              	.L52:
 191:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		for(int k = 0; k < 63; k++){
 925              		.loc 1 191 0 is_stmt 0 discriminator 1
 926 03e4 3B68     		ldr	r3, [r7]
 927 03e6 3E2B     		cmp	r3, #62
 928 03e8 F5DD     		ble	.L53
 929              	.LBE3:
 188:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_write_command( LCD_SET_PAGE | i, B_CS1 | B_CS2 );
 930              		.loc 1 188 0 is_stmt 1 discriminator 2
 931 03ea 7B68     		ldr	r3, [r7, #4]
 932 03ec 0133     		adds	r3, r3, #1
 933 03ee 7B60     		str	r3, [r7, #4]
 934              	.L51:
 188:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_write_command( LCD_SET_PAGE | i, B_CS1 | B_CS2 );
 935              		.loc 1 188 0 is_stmt 0 discriminator 1
 936 03f0 7B68     		ldr	r3, [r7, #4]
 937 03f2 062B     		cmp	r3, #6
 938 03f4 DDDD     		ble	.L54
 939              	.LBE2:
 193:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		}
 194:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 195:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 940              		.loc 1 195 0 is_stmt 1
 941 03f6 C046     		nop
 942 03f8 BD46     		mov	sp, r7
 943 03fa 02B0     		add	sp, sp, #8
 944              		@ sp needed
 945 03fc 80BD     		pop	{r7, pc}
 946              		.cfi_endproc
 947              	.LFE14:
 949              		.align	1
 950              		.global	graphic_initialize
 951              		.syntax unified
 952              		.code	16
 953              		.thumb_func
 954              		.fpu softvfp
 956              	graphic_initialize:
 957              	.LFB15:
 196:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
 197:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_initialize(void){
 958              		.loc 1 197 0
 959              		.cfi_startproc
 960              		@ args = 0, pretend = 0, frame = 0
 961              		@ frame_needed = 1, uses_anonymous_args = 0
 962 03fe 80B5     		push	{r7, lr}
 963              		.cfi_def_cfa_offset 8
 964              		.cfi_offset 7, -8
 965              		.cfi_offset 14, -4
 966 0400 00AF     		add	r7, sp, #0
 967              		.cfi_def_cfa_register 7
 198:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 968              		.loc 1 198 0
 969 0402 4020     		movs	r0, #64
 970 0404 FFF7FEFF 		bl	graphic_ctrl_bit_set
 199:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_micro(10);
 971              		.loc 1 199 0
 972 0408 0A20     		movs	r0, #10
 973 040a FFF7FEFF 		bl	delay_micro
 200:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 201:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E );
 974              		.loc 1 201 0
 975 040e 7820     		movs	r0, #120
 976 0410 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 202:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_milli(30);
 977              		.loc 1 202 0
 978 0414 1E20     		movs	r0, #30
 979 0416 FFF7FEFF 		bl	delay_milli
 203:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 204:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_RST);
 980              		.loc 1 204 0
 981 041a 2020     		movs	r0, #32
 982 041c FFF7FEFF 		bl	graphic_ctrl_bit_set
 205:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_milli(100);
 983              		.loc 1 205 0
 984 0420 6420     		movs	r0, #100
 985 0422 FFF7FEFF 		bl	delay_milli
 206:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_OFF,			B_CS1 | B_CS2);
 986              		.loc 1 206 0
 987 0426 1821     		movs	r1, #24
 988 0428 3E20     		movs	r0, #62
 989 042a FFF7FEFF 		bl	graphic_write_command
 207:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_ON,			B_CS1 | B_CS2);
 990              		.loc 1 207 0
 991 042e 1821     		movs	r1, #24
 992 0430 3F20     		movs	r0, #63
 993 0432 FFF7FEFF 		bl	graphic_write_command
 208:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_DISP_START, 	B_CS1 | B_CS2);
 994              		.loc 1 208 0
 995 0436 1821     		movs	r1, #24
 996 0438 C020     		movs	r0, #192
 997 043a FFF7FEFF 		bl	graphic_write_command
 209:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_SET_ADD,		B_CS1 | B_CS2);
 998              		.loc 1 209 0
 999 043e 1821     		movs	r1, #24
 1000 0440 4020     		movs	r0, #64
 1001 0442 FFF7FEFF 		bl	graphic_write_command
 210:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_SET_PAGE,		B_CS1 | B_CS2);
 1002              		.loc 1 210 0
 1003 0446 1821     		movs	r1, #24
 1004 0448 B820     		movs	r0, #184
 1005 044a FFF7FEFF 		bl	graphic_write_command
 211:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller(0);
 1006              		.loc 1 211 0
 1007 044e 0020     		movs	r0, #0
 1008 0450 FFF7FEFF 		bl	select_controller
 212:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 1009              		.loc 1 212 0
 1010 0454 C046     		nop
 1011 0456 BD46     		mov	sp, r7
 1012              		@ sp needed
 1013 0458 80BD     		pop	{r7, pc}
 1014              		.cfi_endproc
 1015              	.LFE15:
 1017              		.align	1
 1018              		.global	init_app
 1019              		.syntax unified
 1020              		.code	16
 1021              		.thumb_func
 1022              		.fpu softvfp
 1024              	init_app:
 1025              	.LFB16:
 213:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void init_app(void){
 1026              		.loc 1 213 0
 1027              		.cfi_startproc
 1028              		@ args = 0, pretend = 0, frame = 0
 1029              		@ frame_needed = 1, uses_anonymous_args = 0
 1030 045a 80B5     		push	{r7, lr}
 1031              		.cfi_def_cfa_offset 8
 1032              		.cfi_offset 7, -8
 1033              		.cfi_offset 14, -4
 1034 045c 00AF     		add	r7, sp, #0
 1035              		.cfi_def_cfa_register 7
 214:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER 	=0x55555555;
 1036              		.loc 1 214 0
 1037 045e 064B     		ldr	r3, .L57
 1038 0460 064A     		ldr	r2, .L57+4
 1039 0462 1A60     		str	r2, [r3]
 215:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_OTYPER 	=0x0000;
 1040              		.loc 1 215 0
 1041 0464 064B     		ldr	r3, .L57+8
 1042 0466 0022     		movs	r2, #0
 1043 0468 1A80     		strh	r2, [r3]
 216:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *PORT_OSPEEDR   =0x55555555;
 1044              		.loc 1 216 0
 1045 046a 064B     		ldr	r3, .L57+12
 1046 046c 034A     		ldr	r2, .L57+4
 1047 046e 1A60     		str	r2, [r3]
 217:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 1048              		.loc 1 217 0
 1049 0470 C046     		nop
 1050 0472 BD46     		mov	sp, r7
 1051              		@ sp needed
 1052 0474 80BD     		pop	{r7, pc}
 1053              	.L58:
 1054 0476 C046     		.align	2
 1055              	.L57:
 1056 0478 00100240 		.word	1073876992
 1057 047c 55555555 		.word	1431655765
 1058 0480 08100240 		.word	1073877000
 1059 0484 20100240 		.word	1073877024
 1060              		.cfi_endproc
 1061              	.LFE16:
 1063              		.align	1
 1064              		.global	main
 1065              		.syntax unified
 1066              		.code	16
 1067              		.thumb_func
 1068              		.fpu softvfp
 1070              	main:
 1071              	.LFB17:
 218:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
 219:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** int main(void){
 1072              		.loc 1 219 0
 1073              		.cfi_startproc
 1074              		@ args = 0, pretend = 0, frame = 0
 1075              		@ frame_needed = 1, uses_anonymous_args = 0
 1076 0488 80B5     		push	{r7, lr}
 1077              		.cfi_def_cfa_offset 8
 1078              		.cfi_offset 7, -8
 1079              		.cfi_offset 14, -4
 1080 048a 00AF     		add	r7, sp, #0
 1081              		.cfi_def_cfa_register 7
 220:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	init_app();
 1082              		.loc 1 220 0
 1083 048c FFF7FEFF 		bl	init_app
 221:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_initialize();
 1084              		.loc 1 221 0
 1085 0490 FFF7FEFF 		bl	graphic_initialize
 222:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	//graphic_clear_screen();
 223:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command( LCD_SET_ADD | 10, B_CS1 | B_CS2 );
 1086              		.loc 1 223 0
 1087 0494 1821     		movs	r1, #24
 1088 0496 4A20     		movs	r0, #74
 1089 0498 FFF7FEFF 		bl	graphic_write_command
 224:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command( LCD_SET_PAGE | 1, B_CS1 | B_CS2 );
 1090              		.loc 1 224 0
 1091 049c 1821     		movs	r1, #24
 1092 049e B920     		movs	r0, #185
 1093 04a0 FFF7FEFF 		bl	graphic_write_command
 225:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_data( 0xFF, B_CS1 | B_CS2 );
 1094              		.loc 1 225 0
 1095 04a4 1821     		movs	r1, #24
 1096 04a6 FF20     		movs	r0, #255
 1097 04a8 FFF7FEFF 		bl	graphic_write_data
 226:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	return 0;
 1098              		.loc 1 226 0
 1099 04ac 0023     		movs	r3, #0
 227:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 228:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 1100              		.loc 1 228 0
 1101 04ae 1800     		movs	r0, r3
 1102 04b0 BD46     		mov	sp, r7
 1103              		@ sp needed
 1104 04b2 80BD     		pop	{r7, pc}
 1105              		.cfi_endproc
 1106              	.LFE17:
 1108              	.Letext0:
