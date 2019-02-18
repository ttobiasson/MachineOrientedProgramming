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
   8:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_MODER_LOW	((volatile unsigned short*)PORT_BASE_E)
   9:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_MODER_LH 	((volatile unsigned char*)PORT_BASE_E+0x01)
  10:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_OTYPER 	((volatile unsigned int*) PORT_BASE_E+0x04)
  11:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_OSPEEDR    ((volatile unsigned int*) PORT_BASE_E+0x08)
  12:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_PUPDR  	((volatile unsigned int*) PORT_BASE_E+0x0C)
  13:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*Definiera byte-adresser för data och styrregister*/
  14:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_IDR_LOW 	((volatile unsigned char*) PORT_BASE_E+0x10)
  15:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_IDR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x10)
  16:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_ODR_LOW  	((volatile unsigned char*) PORT_BASE_E+0x14)
  17:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_ODR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x15)
  18:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*Definiera lämpliga definitioner för de olika bitarna i styrregistret*/
  19:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_RST 	0x20
  20:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_CS2 	0x10	
  21:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_CS1 	0x08
  22:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_E 	0x40	
  23:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_RW 	0x02		
  24:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_RS 	0x01				
  25:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*LCD-BUSY-bitens address*/
  26:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_BUSY ((volatile unsigned char*)PORT_BASE_E+0x01)
  27:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*STK DELAY*/
  28:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_CTRL ((volatile unsigned int*)(0xE000E010))
  29:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_LOAD ((volatile unsigned int*)(0xE000E014))
  30:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_VAL  ((volatile unsigned int*)(0xE000E018))
  31:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  32:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  33:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void startup ( void )
  34:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** {
  26              		.loc 1 34 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  35:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** asm volatile(
  31              		.loc 1 35 0
  32              		.syntax divided
  33              	@ 35 "/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  36:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  37:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" MOV SP,R0\n"
  38:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" BL main\n"				/* call main */
  39:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	".L1: B .L1\n"				/* never return */
  40:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	) ;
  41:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
  40              		.loc 1 41 0
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
  42:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_250ns(void){
  57              		.loc 1 42 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  43:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 0;
  67              		.loc 1 43 0
  68 0004 0C4B     		ldr	r3, .L4
  69 0006 0022     		movs	r2, #0
  70 0008 1A60     		str	r2, [r3]
  44:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_LOAD = ((168/4)-1);
  71              		.loc 1 44 0
  72 000a 0C4B     		ldr	r3, .L4+4
  73 000c 2922     		movs	r2, #41
  74 000e 1A60     		str	r2, [r3]
  45:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_VAL  = 0;
  75              		.loc 1 45 0
  76 0010 0B4B     		ldr	r3, .L4+8
  77 0012 0022     		movs	r2, #0
  78 0014 1A60     		str	r2, [r3]
  46:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 5;
  79              		.loc 1 46 0
  80 0016 084B     		ldr	r3, .L4
  81 0018 0522     		movs	r2, #5
  82 001a 1A60     		str	r2, [r3]
  47:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while( (*STK_CTRL & 0x10000)== 0){}
  83              		.loc 1 47 0
  84 001c C046     		nop
  85              	.L3:
  86              		.loc 1 47 0 is_stmt 0 discriminator 1
  87 001e 064B     		ldr	r3, .L4
  88 0020 1A68     		ldr	r2, [r3]
  89 0022 8023     		movs	r3, #128
  90 0024 5B02     		lsls	r3, r3, #9
  91 0026 1340     		ands	r3, r2
  92 0028 F9D0     		beq	.L3
  48:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 0;
  93              		.loc 1 48 0 is_stmt 1
  94 002a 034B     		ldr	r3, .L4
  95 002c 0022     		movs	r2, #0
  96 002e 1A60     		str	r2, [r3]
  49:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
  97              		.loc 1 49 0
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
  50:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_500ns(void){
 120              		.loc 1 50 0
 121              		.cfi_startproc
 122              		@ args = 0, pretend = 0, frame = 0
 123              		@ frame_needed = 1, uses_anonymous_args = 0
 124 0044 80B5     		push	{r7, lr}
 125              		.cfi_def_cfa_offset 8
 126              		.cfi_offset 7, -8
 127              		.cfi_offset 14, -4
 128 0046 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
  51:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_250ns();
 130              		.loc 1 51 0
 131 0048 FFF7FEFF 		bl	delay_250ns
  52:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_250ns();
 132              		.loc 1 52 0
 133 004c FFF7FEFF 		bl	delay_250ns
  53:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 134              		.loc 1 53 0
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
  54:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_micro(unsigned int us){
 151              		.loc 1 54 0
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
  55:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(us--){
 164              		.loc 1 55 0
 165 005e 07E0     		b	.L8
 166              	.L9:
  56:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 167              		.loc 1 56 0
 168 0060 FFF7FEFF 		bl	delay_250ns
  57:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 169              		.loc 1 57 0
 170 0064 FFF7FEFF 		bl	delay_250ns
  58:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 171              		.loc 1 58 0
 172 0068 FFF7FEFF 		bl	delay_250ns
  59:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 173              		.loc 1 59 0
 174 006c FFF7FEFF 		bl	delay_250ns
 175              	.L8:
  55:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 176              		.loc 1 55 0
 177 0070 7B68     		ldr	r3, [r7, #4]
 178 0072 5A1E     		subs	r2, r3, #1
 179 0074 7A60     		str	r2, [r7, #4]
 180 0076 002B     		cmp	r3, #0
 181 0078 F2D1     		bne	.L9
  60:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     }
  61:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 182              		.loc 1 61 0
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
  62:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_milli(unsigned int ms){
 200              		.loc 1 62 0
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
  63:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(ms--){
 213              		.loc 1 63 0
 214 008a 02E0     		b	.L11
 215              	.L12:
  64:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_micro(10);
 216              		.loc 1 64 0
 217 008c 0A20     		movs	r0, #10
 218 008e FFF7FEFF 		bl	delay_micro
 219              	.L11:
  63:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(ms--){
 220              		.loc 1 63 0
 221 0092 7B68     		ldr	r3, [r7, #4]
 222 0094 5A1E     		subs	r2, r3, #1
 223 0096 7A60     		str	r2, [r7, #4]
 224 0098 002B     		cmp	r3, #0
 225 009a F7D1     		bne	.L12
  65:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     }
  66:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     
  67:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 226              		.loc 1 67 0
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
  68:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** typedef unsigned char uint8_t;
  69:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  70:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_ctrl_bit_set(uint8_t x){
 244              		.loc 1 70 0
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
  71:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW |= x;
 259              		.loc 1 71 0
 260 00b0 0A4B     		ldr	r3, .L14
 261 00b2 1B78     		ldrb	r3, [r3]
 262 00b4 DAB2     		uxtb	r2, r3
 263 00b6 0949     		ldr	r1, .L14
 264 00b8 FB1D     		adds	r3, r7, #7
 265 00ba 1B78     		ldrb	r3, [r3]
 266 00bc 1343     		orrs	r3, r2
 267 00be DBB2     		uxtb	r3, r3
 268 00c0 0B70     		strb	r3, [r1]
  72:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW &= ~(1UL << 2);
 269              		.loc 1 72 0
 270 00c2 064B     		ldr	r3, .L14
 271 00c4 1B78     		ldrb	r3, [r3]
 272 00c6 DBB2     		uxtb	r3, r3
 273 00c8 044A     		ldr	r2, .L14
 274 00ca 0421     		movs	r1, #4
 275 00cc 8B43     		bics	r3, r1
 276 00ce DBB2     		uxtb	r3, r3
 277 00d0 1370     		strb	r3, [r2]
  73:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  74:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 278              		.loc 1 74 0
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
  75:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_ctrl_bit_clear(uint8_t x){
 300              		.loc 1 75 0
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
  76:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW &= ~x;
 315              		.loc 1 76 0
 316 00ec 0C4B     		ldr	r3, .L17
 317 00ee 1B78     		ldrb	r3, [r3]
 318 00f0 DBB2     		uxtb	r3, r3
 319 00f2 5BB2     		sxtb	r3, r3
 320 00f4 FA1D     		adds	r2, r7, #7
 321 00f6 1278     		ldrb	r2, [r2]
 322 00f8 52B2     		sxtb	r2, r2
 323 00fa D243     		mvns	r2, r2
 324 00fc 52B2     		sxtb	r2, r2
 325 00fe 1340     		ands	r3, r2
 326 0100 5AB2     		sxtb	r2, r3
 327 0102 074B     		ldr	r3, .L17
 328 0104 D2B2     		uxtb	r2, r2
 329 0106 1A70     		strb	r2, [r3]
  77:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW &= ~(1UL << 2);
 330              		.loc 1 77 0
 331 0108 054B     		ldr	r3, .L17
 332 010a 1B78     		ldrb	r3, [r3]
 333 010c DBB2     		uxtb	r3, r3
 334 010e 044A     		ldr	r2, .L17
 335 0110 0421     		movs	r1, #4
 336 0112 8B43     		bics	r3, r1
 337 0114 DBB2     		uxtb	r3, r3
 338 0116 1370     		strb	r3, [r2]
  78:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  79:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  80:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 339              		.loc 1 80 0
 340 0118 C046     		nop
 341 011a BD46     		mov	sp, r7
 342 011c 02B0     		add	sp, sp, #8
 343              		@ sp needed
 344 011e 80BD     		pop	{r7, pc}
 345              	.L18:
 346              		.align	2
 347              	.L17:
 348 0120 14100240 		.word	1073877012
 349              		.cfi_endproc
 350              	.LFE6:
 352              		.align	1
 353              		.global	select_controller
 354              		.syntax unified
 355              		.code	16
 356              		.thumb_func
 357              		.fpu softvfp
 359              	select_controller:
 360              	.LFB7:
  81:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void select_controller(uint8_t controller){
 361              		.loc 1 81 0
 362              		.cfi_startproc
 363              		@ args = 0, pretend = 0, frame = 8
 364              		@ frame_needed = 1, uses_anonymous_args = 0
 365 0124 80B5     		push	{r7, lr}
 366              		.cfi_def_cfa_offset 8
 367              		.cfi_offset 7, -8
 368              		.cfi_offset 14, -4
 369 0126 82B0     		sub	sp, sp, #8
 370              		.cfi_def_cfa_offset 16
 371 0128 00AF     		add	r7, sp, #0
 372              		.cfi_def_cfa_register 7
 373 012a 0200     		movs	r2, r0
 374 012c FB1D     		adds	r3, r7, #7
 375 012e 1A70     		strb	r2, [r3]
  82:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	switch(controller){
 376              		.loc 1 82 0
 377 0130 FB1D     		adds	r3, r7, #7
 378 0132 1B78     		ldrb	r3, [r3]
 379 0134 012B     		cmp	r3, #1
 380 0136 1DD0     		beq	.L21
 381 0138 02DC     		bgt	.L22
 382 013a 002B     		cmp	r3, #0
 383 013c 05D0     		beq	.L23
  83:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case 0:
  84:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
  85:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
  86:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  87:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1:
  88:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS1);
  89:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
  90:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  91:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS2:
  92:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
  93:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
  94:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  95:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1 && B_CS2:
  96:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS1);
  97:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
  98:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  99:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 100:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		
 101:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 102:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 384              		.loc 1 102 0
 385 013e 20E0     		b	.L26
 386              	.L22:
  82:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	switch(controller){
 387              		.loc 1 82 0
 388 0140 082B     		cmp	r3, #8
 389 0142 09D0     		beq	.L24
 390 0144 102B     		cmp	r3, #16
 391 0146 0ED0     		beq	.L25
 392              		.loc 1 102 0
 393 0148 1BE0     		b	.L26
 394              	.L23:
  84:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 395              		.loc 1 84 0
 396 014a 0820     		movs	r0, #8
 397 014c FFF7FEFF 		bl	graphic_ctrl_bit_clear
  85:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 398              		.loc 1 85 0
 399 0150 1020     		movs	r0, #16
 400 0152 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  86:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1:
 401              		.loc 1 86 0
 402 0156 14E0     		b	.L20
 403              	.L24:
  88:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 404              		.loc 1 88 0
 405 0158 0820     		movs	r0, #8
 406 015a FFF7FEFF 		bl	graphic_ctrl_bit_set
  89:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 407              		.loc 1 89 0
 408 015e 1020     		movs	r0, #16
 409 0160 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  90:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS2:
 410              		.loc 1 90 0
 411 0164 0DE0     		b	.L20
 412              	.L25:
  92:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 413              		.loc 1 92 0
 414 0166 0820     		movs	r0, #8
 415 0168 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  93:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 416              		.loc 1 93 0
 417 016c 1020     		movs	r0, #16
 418 016e FFF7FEFF 		bl	graphic_ctrl_bit_set
  94:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1 && B_CS2:
 419              		.loc 1 94 0
 420 0172 06E0     		b	.L20
 421              	.L21:
  96:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 422              		.loc 1 96 0
 423 0174 0820     		movs	r0, #8
 424 0176 FFF7FEFF 		bl	graphic_ctrl_bit_set
  97:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 425              		.loc 1 97 0
 426 017a 1020     		movs	r0, #16
 427 017c FFF7FEFF 		bl	graphic_ctrl_bit_set
  98:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 428              		.loc 1 98 0
 429 0180 C046     		nop
 430              	.L20:
 431              	.L26:
 432              		.loc 1 102 0
 433 0182 C046     		nop
 434 0184 BD46     		mov	sp, r7
 435 0186 02B0     		add	sp, sp, #8
 436              		@ sp needed
 437 0188 80BD     		pop	{r7, pc}
 438              		.cfi_endproc
 439              	.LFE7:
 441              		.align	1
 442              		.global	graphic_wait_ready
 443              		.syntax unified
 444              		.code	16
 445              		.thumb_func
 446              		.fpu softvfp
 448              	graphic_wait_ready:
 449              	.LFB8:
 103:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_wait_ready(void){
 450              		.loc 1 103 0
 451              		.cfi_startproc
 452              		@ args = 0, pretend = 0, frame = 0
 453              		@ frame_needed = 1, uses_anonymous_args = 0
 454 018a 80B5     		push	{r7, lr}
 455              		.cfi_def_cfa_offset 8
 456              		.cfi_offset 7, -8
 457              		.cfi_offset 14, -4
 458 018c 00AF     		add	r7, sp, #0
 459              		.cfi_def_cfa_register 7
 104:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 460              		.loc 1 104 0
 461 018e 4020     		movs	r0, #64
 462 0190 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 105:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER_LOW = 0x0055;
 463              		.loc 1 105 0
 464 0194 134B     		ldr	r3, .L33
 465 0196 5522     		movs	r2, #85
 466 0198 1A80     		strh	r2, [r3]
 106:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 467              		.loc 1 106 0
 468 019a 0120     		movs	r0, #1
 469 019c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 107:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_RW);
 470              		.loc 1 107 0
 471 01a0 0220     		movs	r0, #2
 472 01a2 FFF7FEFF 		bl	graphic_ctrl_bit_set
 108:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 473              		.loc 1 108 0
 474 01a6 FFF7FEFF 		bl	delay_500ns
 475              	.L30:
 109:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	while(1){
 110:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_E);
 476              		.loc 1 110 0
 477 01aa 4020     		movs	r0, #64
 478 01ac FFF7FEFF 		bl	graphic_ctrl_bit_set
 111:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		delay_500ns();
 479              		.loc 1 111 0
 480 01b0 FFF7FEFF 		bl	delay_500ns
 112:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_E);
 481              		.loc 1 112 0
 482 01b4 4020     		movs	r0, #64
 483 01b6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 113:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		delay_500ns();
 484              		.loc 1 113 0
 485 01ba FFF7FEFF 		bl	delay_500ns
 114:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		if( (*LCD_BUSY & 0x80) == 0x80)
 486              		.loc 1 114 0
 487 01be 0A4B     		ldr	r3, .L33+4
 488 01c0 1B78     		ldrb	r3, [r3]
 489 01c2 DBB2     		uxtb	r3, r3
 490 01c4 1A00     		movs	r2, r3
 491 01c6 8023     		movs	r3, #128
 492 01c8 1340     		ands	r3, r2
 493 01ca 802B     		cmp	r3, #128
 494 01cc 00D0     		beq	.L32
 110:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		delay_500ns();
 495              		.loc 1 110 0
 496 01ce ECE7     		b	.L30
 497              	.L32:
 115:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 			break;
 498              		.loc 1 115 0
 499 01d0 C046     		nop
 116:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		
 117:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 118:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 500              		.loc 1 118 0
 501 01d2 4020     		movs	r0, #64
 502 01d4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 119:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER_LOW = 0x5555;
 503              		.loc 1 119 0
 504 01d8 024B     		ldr	r3, .L33
 505 01da 044A     		ldr	r2, .L33+8
 506 01dc 1A80     		strh	r2, [r3]
 120:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 507              		.loc 1 120 0
 508 01de C046     		nop
 509 01e0 BD46     		mov	sp, r7
 510              		@ sp needed
 511 01e2 80BD     		pop	{r7, pc}
 512              	.L34:
 513              		.align	2
 514              	.L33:
 515 01e4 00100240 		.word	1073876992
 516 01e8 01100240 		.word	1073876993
 517 01ec 55550000 		.word	21845
 518              		.cfi_endproc
 519              	.LFE8:
 521              		.align	1
 522              		.global	graphic_read
 523              		.syntax unified
 524              		.code	16
 525              		.thumb_func
 526              		.fpu softvfp
 528              	graphic_read:
 529              	.LFB9:
 121:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** unsigned char graphic_read(unsigned char controller ){
 530              		.loc 1 121 0
 531              		.cfi_startproc
 532              		@ args = 0, pretend = 0, frame = 16
 533              		@ frame_needed = 1, uses_anonymous_args = 0
 534 01f0 80B5     		push	{r7, lr}
 535              		.cfi_def_cfa_offset 8
 536              		.cfi_offset 7, -8
 537              		.cfi_offset 14, -4
 538 01f2 84B0     		sub	sp, sp, #16
 539              		.cfi_def_cfa_offset 24
 540 01f4 00AF     		add	r7, sp, #0
 541              		.cfi_def_cfa_register 7
 542 01f6 0200     		movs	r2, r0
 543 01f8 FB1D     		adds	r3, r7, #7
 544 01fa 1A70     		strb	r2, [r3]
 122:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	unsigned char RV;
 123:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 545              		.loc 1 123 0
 546 01fc 4020     		movs	r0, #64
 547 01fe FFF7FEFF 		bl	graphic_ctrl_bit_clear
 124:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER_LOW = 0055;
 548              		.loc 1 124 0
 549 0202 1D4B     		ldr	r3, .L39
 550 0204 2D22     		movs	r2, #45
 551 0206 1A80     		strh	r2, [r3]
 125:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 126:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_RS );
 552              		.loc 1 126 0
 553 0208 0120     		movs	r0, #1
 554 020a FFF7FEFF 		bl	graphic_ctrl_bit_set
 127:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_RW );
 555              		.loc 1 127 0
 556 020e 0220     		movs	r0, #2
 557 0210 FFF7FEFF 		bl	graphic_ctrl_bit_set
 128:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 129:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller( controller );
 558              		.loc 1 129 0
 559 0214 FB1D     		adds	r3, r7, #7
 560 0216 1B78     		ldrb	r3, [r3]
 561 0218 1800     		movs	r0, r3
 562 021a FFF7FEFF 		bl	select_controller
 130:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 563              		.loc 1 130 0
 564 021e FFF7FEFF 		bl	delay_500ns
 131:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 132:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_E );
 565              		.loc 1 132 0
 566 0222 4020     		movs	r0, #64
 567 0224 FFF7FEFF 		bl	graphic_ctrl_bit_set
 133:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 568              		.loc 1 133 0
 569 0228 FFF7FEFF 		bl	delay_500ns
 134:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 135:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	RV = *PORT_MODER_LH;
 570              		.loc 1 135 0
 571 022c 134A     		ldr	r2, .L39+4
 572 022e 0F23     		movs	r3, #15
 573 0230 FB18     		adds	r3, r7, r3
 574 0232 1278     		ldrb	r2, [r2]
 575 0234 1A70     		strb	r2, [r3]
 136:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 576              		.loc 1 136 0
 577 0236 4020     		movs	r0, #64
 578 0238 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 137:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 138:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER_LOW = 0x5555;
 579              		.loc 1 138 0
 580 023c 0E4B     		ldr	r3, .L39
 581 023e 104A     		ldr	r2, .L39+8
 582 0240 1A80     		strh	r2, [r3]
 139:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( (controller & B_CS1) == B_CS1 ){
 583              		.loc 1 139 0
 584 0242 FB1D     		adds	r3, r7, #7
 585 0244 1B78     		ldrb	r3, [r3]
 586 0246 0822     		movs	r2, #8
 587 0248 1340     		ands	r3, r2
 588 024a 04D0     		beq	.L36
 140:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller(B_CS1);
 589              		.loc 1 140 0
 590 024c 0820     		movs	r0, #8
 591 024e FFF7FEFF 		bl	select_controller
 141:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 592              		.loc 1 141 0
 593 0252 FFF7FEFF 		bl	graphic_wait_ready
 594              	.L36:
 142:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 143:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if((controller & B_CS2) == B_CS2 ){
 595              		.loc 1 143 0
 596 0256 FB1D     		adds	r3, r7, #7
 597 0258 1B78     		ldrb	r3, [r3]
 598 025a 1022     		movs	r2, #16
 599 025c 1340     		ands	r3, r2
 600 025e 04D0     		beq	.L37
 144:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller(B_CS2);
 601              		.loc 1 144 0
 602 0260 1020     		movs	r0, #16
 603 0262 FFF7FEFF 		bl	select_controller
 145:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 604              		.loc 1 145 0
 605 0266 FFF7FEFF 		bl	graphic_wait_ready
 606              	.L37:
 146:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 147:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	return RV;
 607              		.loc 1 147 0
 608 026a 0F23     		movs	r3, #15
 609 026c FB18     		adds	r3, r7, r3
 610 026e 1B78     		ldrb	r3, [r3]
 148:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 611              		.loc 1 148 0
 612 0270 1800     		movs	r0, r3
 613 0272 BD46     		mov	sp, r7
 614 0274 04B0     		add	sp, sp, #16
 615              		@ sp needed
 616 0276 80BD     		pop	{r7, pc}
 617              	.L40:
 618              		.align	2
 619              	.L39:
 620 0278 00100240 		.word	1073876992
 621 027c 01100240 		.word	1073876993
 622 0280 55550000 		.word	21845
 623              		.cfi_endproc
 624              	.LFE9:
 626              		.align	1
 627              		.global	graphic_write
 628              		.syntax unified
 629              		.code	16
 630              		.thumb_func
 631              		.fpu softvfp
 633              	graphic_write:
 634              	.LFB10:
 149:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_write(uint8_t value, uint8_t controller){
 635              		.loc 1 149 0
 636              		.cfi_startproc
 637              		@ args = 0, pretend = 0, frame = 8
 638              		@ frame_needed = 1, uses_anonymous_args = 0
 639 0284 80B5     		push	{r7, lr}
 640              		.cfi_def_cfa_offset 8
 641              		.cfi_offset 7, -8
 642              		.cfi_offset 14, -4
 643 0286 82B0     		sub	sp, sp, #8
 644              		.cfi_def_cfa_offset 16
 645 0288 00AF     		add	r7, sp, #0
 646              		.cfi_def_cfa_register 7
 647 028a 0200     		movs	r2, r0
 648 028c FB1D     		adds	r3, r7, #7
 649 028e 1A70     		strb	r2, [r3]
 650 0290 BB1D     		adds	r3, r7, #6
 651 0292 0A1C     		adds	r2, r1, #0
 652 0294 1A70     		strb	r2, [r3]
 150:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER_LH = value;
 653              		.loc 1 150 0
 654 0296 1A4A     		ldr	r2, .L44
 655 0298 FB1D     		adds	r3, r7, #7
 656 029a 1B78     		ldrb	r3, [r3]
 657 029c 1370     		strb	r3, [r2]
 151:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller(controller);
 658              		.loc 1 151 0
 659 029e BB1D     		adds	r3, r7, #6
 660 02a0 1B78     		ldrb	r3, [r3]
 661 02a2 1800     		movs	r0, r3
 662 02a4 FFF7FEFF 		bl	select_controller
 152:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 663              		.loc 1 152 0
 664 02a8 FFF7FEFF 		bl	delay_500ns
 153:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 665              		.loc 1 153 0
 666 02ac 4020     		movs	r0, #64
 667 02ae FFF7FEFF 		bl	graphic_ctrl_bit_set
 154:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 668              		.loc 1 154 0
 669 02b2 FFF7FEFF 		bl	delay_500ns
 155:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 670              		.loc 1 155 0
 671 02b6 4020     		movs	r0, #64
 672 02b8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 156:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 157:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( (controller & B_CS1 ) == B_CS1 ){
 673              		.loc 1 157 0
 674 02bc BB1D     		adds	r3, r7, #6
 675 02be 1B78     		ldrb	r3, [r3]
 676 02c0 0822     		movs	r2, #8
 677 02c2 1340     		ands	r3, r2
 678 02c4 04D0     		beq	.L42
 158:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller( B_CS1 );
 679              		.loc 1 158 0
 680 02c6 0820     		movs	r0, #8
 681 02c8 FFF7FEFF 		bl	select_controller
 159:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 682              		.loc 1 159 0
 683 02cc FFF7FEFF 		bl	graphic_wait_ready
 684              	.L42:
 160:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 161:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( (controller & B_CS2 ) == B_CS2 ){
 685              		.loc 1 161 0
 686 02d0 BB1D     		adds	r3, r7, #6
 687 02d2 1B78     		ldrb	r3, [r3]
 688 02d4 1022     		movs	r2, #16
 689 02d6 1340     		ands	r3, r2
 690 02d8 04D0     		beq	.L43
 162:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller( B_CS2 );
 691              		.loc 1 162 0
 692 02da 1020     		movs	r0, #16
 693 02dc FFF7FEFF 		bl	select_controller
 163:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 694              		.loc 1 163 0
 695 02e0 FFF7FEFF 		bl	graphic_wait_ready
 696              	.L43:
 164:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 165:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER_LH = 0;
 697              		.loc 1 165 0
 698 02e4 064B     		ldr	r3, .L44
 699 02e6 0022     		movs	r2, #0
 700 02e8 1A70     		strb	r2, [r3]
 166:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 701              		.loc 1 166 0
 702 02ea 4020     		movs	r0, #64
 703 02ec FFF7FEFF 		bl	graphic_ctrl_bit_set
 167:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller(0);
 704              		.loc 1 167 0
 705 02f0 0020     		movs	r0, #0
 706 02f2 FFF7FEFF 		bl	select_controller
 168:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 707              		.loc 1 168 0
 708 02f6 C046     		nop
 709 02f8 BD46     		mov	sp, r7
 710 02fa 02B0     		add	sp, sp, #8
 711              		@ sp needed
 712 02fc 80BD     		pop	{r7, pc}
 713              	.L45:
 714 02fe C046     		.align	2
 715              	.L44:
 716 0300 01100240 		.word	1073876993
 717              		.cfi_endproc
 718              	.LFE10:
 720              		.align	1
 721              		.global	graphic_write_command
 722              		.syntax unified
 723              		.code	16
 724              		.thumb_func
 725              		.fpu softvfp
 727              	graphic_write_command:
 728              	.LFB11:
 169:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 729              		.loc 1 169 0
 730              		.cfi_startproc
 731              		@ args = 0, pretend = 0, frame = 8
 732              		@ frame_needed = 1, uses_anonymous_args = 0
 733 0304 80B5     		push	{r7, lr}
 734              		.cfi_def_cfa_offset 8
 735              		.cfi_offset 7, -8
 736              		.cfi_offset 14, -4
 737 0306 82B0     		sub	sp, sp, #8
 738              		.cfi_def_cfa_offset 16
 739 0308 00AF     		add	r7, sp, #0
 740              		.cfi_def_cfa_register 7
 741 030a 0200     		movs	r2, r0
 742 030c FB1D     		adds	r3, r7, #7
 743 030e 1A70     		strb	r2, [r3]
 744 0310 BB1D     		adds	r3, r7, #6
 745 0312 0A1C     		adds	r2, r1, #0
 746 0314 1A70     		strb	r2, [r3]
 170:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 747              		.loc 1 170 0
 748 0316 4020     		movs	r0, #64
 749 0318 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 171:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller( controller );
 750              		.loc 1 171 0
 751 031c BB1D     		adds	r3, r7, #6
 752 031e 1B78     		ldrb	r3, [r3]
 753 0320 1800     		movs	r0, r3
 754 0322 FFF7FEFF 		bl	select_controller
 172:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_RS );
 755              		.loc 1 172 0
 756 0326 0120     		movs	r0, #1
 757 0328 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 173:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_RW );
 758              		.loc 1 173 0
 759 032c 0220     		movs	r0, #2
 760 032e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 174:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write( command, controller );
 761              		.loc 1 174 0
 762 0332 BB1D     		adds	r3, r7, #6
 763 0334 1A78     		ldrb	r2, [r3]
 764 0336 FB1D     		adds	r3, r7, #7
 765 0338 1B78     		ldrb	r3, [r3]
 766 033a 1100     		movs	r1, r2
 767 033c 1800     		movs	r0, r3
 768 033e FFF7FEFF 		bl	graphic_write
 175:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 769              		.loc 1 175 0
 770 0342 C046     		nop
 771 0344 BD46     		mov	sp, r7
 772 0346 02B0     		add	sp, sp, #8
 773              		@ sp needed
 774 0348 80BD     		pop	{r7, pc}
 775              		.cfi_endproc
 776              	.LFE11:
 778              		.align	1
 779              		.global	graphics_write_data
 780              		.syntax unified
 781              		.code	16
 782              		.thumb_func
 783              		.fpu softvfp
 785              	graphics_write_data:
 786              	.LFB12:
 176:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphics_write_data( uint8_t data, uint8_t controller ){
 787              		.loc 1 176 0
 788              		.cfi_startproc
 789              		@ args = 0, pretend = 0, frame = 8
 790              		@ frame_needed = 1, uses_anonymous_args = 0
 791 034a 80B5     		push	{r7, lr}
 792              		.cfi_def_cfa_offset 8
 793              		.cfi_offset 7, -8
 794              		.cfi_offset 14, -4
 795 034c 82B0     		sub	sp, sp, #8
 796              		.cfi_def_cfa_offset 16
 797 034e 00AF     		add	r7, sp, #0
 798              		.cfi_def_cfa_register 7
 799 0350 0200     		movs	r2, r0
 800 0352 FB1D     		adds	r3, r7, #7
 801 0354 1A70     		strb	r2, [r3]
 802 0356 BB1D     		adds	r3, r7, #6
 803 0358 0A1C     		adds	r2, r1, #0
 804 035a 1A70     		strb	r2, [r3]
 177:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 805              		.loc 1 177 0
 806 035c 4020     		movs	r0, #64
 807 035e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 178:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller( controller );
 808              		.loc 1 178 0
 809 0362 BB1D     		adds	r3, r7, #6
 810 0364 1B78     		ldrb	r3, [r3]
 811 0366 1800     		movs	r0, r3
 812 0368 FFF7FEFF 		bl	select_controller
 179:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_RS );
 813              		.loc 1 179 0
 814 036c 0120     		movs	r0, #1
 815 036e FFF7FEFF 		bl	graphic_ctrl_bit_set
 180:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_RW );
 816              		.loc 1 180 0
 817 0372 0220     		movs	r0, #2
 818 0374 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 181:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write( data, controller );
 819              		.loc 1 181 0
 820 0378 BB1D     		adds	r3, r7, #6
 821 037a 1A78     		ldrb	r2, [r3]
 822 037c FB1D     		adds	r3, r7, #7
 823 037e 1B78     		ldrb	r3, [r3]
 824 0380 1100     		movs	r1, r2
 825 0382 1800     		movs	r0, r3
 826 0384 FFF7FEFF 		bl	graphic_write
 182:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 827              		.loc 1 182 0
 828 0388 C046     		nop
 829 038a BD46     		mov	sp, r7
 830 038c 02B0     		add	sp, sp, #8
 831              		@ sp needed
 832 038e 80BD     		pop	{r7, pc}
 833              		.cfi_endproc
 834              	.LFE12:
 836              		.align	1
 837              		.global	graphic_initialize
 838              		.syntax unified
 839              		.code	16
 840              		.thumb_func
 841              		.fpu softvfp
 843              	graphic_initialize:
 844              	.LFB13:
 183:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_initialize(void){
 845              		.loc 1 183 0
 846              		.cfi_startproc
 847              		@ args = 0, pretend = 0, frame = 0
 848              		@ frame_needed = 1, uses_anonymous_args = 0
 849 0390 80B5     		push	{r7, lr}
 850              		.cfi_def_cfa_offset 8
 851              		.cfi_offset 7, -8
 852              		.cfi_offset 14, -4
 853 0392 00AF     		add	r7, sp, #0
 854              		.cfi_def_cfa_register 7
 184:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 855              		.loc 1 184 0
 856 0394 4020     		movs	r0, #64
 857 0396 FFF7FEFF 		bl	graphic_ctrl_bit_set
 185:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_micro(10);
 858              		.loc 1 185 0
 859 039a 0A20     		movs	r0, #10
 860 039c FFF7FEFF 		bl	delay_micro
 186:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 187:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 861              		.loc 1 187 0
 862 03a0 C046     		nop
 863 03a2 BD46     		mov	sp, r7
 864              		@ sp needed
 865 03a4 80BD     		pop	{r7, pc}
 866              		.cfi_endproc
 867              	.LFE13:
 869              		.align	1
 870              		.global	init_app
 871              		.syntax unified
 872              		.code	16
 873              		.thumb_func
 874              		.fpu softvfp
 876              	init_app:
 877              	.LFB14:
 188:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void init_app(void){
 878              		.loc 1 188 0
 879              		.cfi_startproc
 880              		@ args = 0, pretend = 0, frame = 0
 881              		@ frame_needed = 1, uses_anonymous_args = 0
 882 03a6 80B5     		push	{r7, lr}
 883              		.cfi_def_cfa_offset 8
 884              		.cfi_offset 7, -8
 885              		.cfi_offset 14, -4
 886 03a8 00AF     		add	r7, sp, #0
 887              		.cfi_def_cfa_register 7
 189:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER = 0x55555555;
 888              		.loc 1 189 0
 889 03aa 034B     		ldr	r3, .L50
 890 03ac 034A     		ldr	r2, .L50+4
 891 03ae 1A60     		str	r2, [r3]
 190:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 892              		.loc 1 190 0
 893 03b0 C046     		nop
 894 03b2 BD46     		mov	sp, r7
 895              		@ sp needed
 896 03b4 80BD     		pop	{r7, pc}
 897              	.L51:
 898 03b6 C046     		.align	2
 899              	.L50:
 900 03b8 00100240 		.word	1073876992
 901 03bc 55555555 		.word	1431655765
 902              		.cfi_endproc
 903              	.LFE14:
 905              		.align	1
 906              		.global	main
 907              		.syntax unified
 908              		.code	16
 909              		.thumb_func
 910              		.fpu softvfp
 912              	main:
 913              	.LFB15:
 191:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
 192:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** int main(void){
 914              		.loc 1 192 0
 915              		.cfi_startproc
 916              		@ args = 0, pretend = 0, frame = 0
 917              		@ frame_needed = 1, uses_anonymous_args = 0
 918 03c0 80B5     		push	{r7, lr}
 919              		.cfi_def_cfa_offset 8
 920              		.cfi_offset 7, -8
 921              		.cfi_offset 14, -4
 922 03c2 00AF     		add	r7, sp, #0
 923              		.cfi_def_cfa_register 7
 193:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	return 0;
 924              		.loc 1 193 0
 925 03c4 0023     		movs	r3, #0
 194:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 195:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 926              		.loc 1 195 0
 927 03c6 1800     		movs	r0, r3
 928 03c8 BD46     		mov	sp, r7
 929              		@ sp needed
 930 03ca 80BD     		pop	{r7, pc}
 931              		.cfi_endproc
 932              	.LFE15:
 934              	.Letext0:
