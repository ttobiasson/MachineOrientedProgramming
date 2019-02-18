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
  25              		.file 1 "/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c"
   1:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** /*
   2:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****  * 	startup.c
   3:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****  *
   4:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****  */
   5:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****  
   6:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define PORT_BASE_E 0x40021000
   7:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 		/* Definiera word-adresser för initiering*/
   8:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define PORT_MODER 		((volatile unsigned int*)PORT_BASE_E)
   9:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define PORT_MODER_LH 	((volatile unsigned char*)PORT_BASE_E+0x01)
  10:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define PORT_OTYPER 	((volatile unsigned int*) PORT_BASE_E+0x04)
  11:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define PORT_OSPEEDR    ((volatile unsigned int*) PORT_BASE_E+0x08)
  12:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define PORT_PUPDR  	((volatile unsigned int*) PORT_BASE_E+0x0C)
  13:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 		/*Definiera byte-adresser för data och styrregister*/
  14:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define PORT_IDR_LOW 	((volatile unsigned char*) PORT_BASE_E+0x10)
  15:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define PORT_IDR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x10)
  16:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define PORT_ODR_LOW  	((volatile unsigned char*) PORT_BASE_E+0x14)
  17:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define PORT_ODR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x15)
  18:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 		/*Definiera lämpliga definitioner för de olika bitarna i styrregistret*/
  19:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define B_E 		0x40	/*ENABLE SIGNAL*/
  20:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define B_SELECT 	0x04	/*SELECT ASCII-DISPLAY*/
  21:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define B_RW 		0x02		/* 0 = writem, 1 = read*/
  22:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define B_RS 		0x01		/* 0 = control, 1 =data*/
  23:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 		/*STK DELAY*/
  24:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define STK_CTRL ((volatile unsigned int*)(0xE000E010))
  25:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define STK_LOAD ((volatile unsigned int*)(0xE000E014))
  26:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** #define STK_VAL  ((volatile unsigned int*)(0xE000E018))
  27:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****  
  28:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  29:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 
  30:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void startup ( void )
  31:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** {
  26              		.loc 1 31 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  32:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** __asm volatile(
  31              		.loc 1 32 0
  32              		.syntax divided
  33              	@ 32 "/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  33:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  34:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	" MOV SP,R0\n"
  35:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	" BL main\n"				/* call main */
  36:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	"_exit: B .\n"				/* never return */
  37:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	) ;
  38:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
  40              		.loc 1 38 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	init_app
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	init_app:
  56              	.LFB1:
  39:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 
  40:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void init_app(void){
  57              		.loc 1 40 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  41:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	*PORT_MODER 	=0x55555555;
  67              		.loc 1 41 0
  68 0004 054B     		ldr	r3, .L3
  69 0006 064A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  42:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	*PORT_OTYPER 	=0x00000000;
  71              		.loc 1 42 0
  72 000a 064B     		ldr	r3, .L3+8
  73 000c 0022     		movs	r2, #0
  74 000e 1A60     		str	r2, [r3]
  43:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     *PORT_OSPEEDR   =0x55555555;
  75              		.loc 1 43 0
  76 0010 054B     		ldr	r3, .L3+12
  77 0012 034A     		ldr	r2, .L3+4
  78 0014 1A60     		str	r2, [r3]
  44:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
  79              		.loc 1 44 0
  80 0016 C046     		nop
  81 0018 BD46     		mov	sp, r7
  82              		@ sp needed
  83 001a 80BD     		pop	{r7, pc}
  84              	.L4:
  85              		.align	2
  86              	.L3:
  87 001c 00100240 		.word	1073876992
  88 0020 55555555 		.word	1431655765
  89 0024 10100240 		.word	1073877008
  90 0028 20100240 		.word	1073877024
  91              		.cfi_endproc
  92              	.LFE1:
  94              		.align	1
  95              		.global	delay_250ns
  96              		.syntax unified
  97              		.code	16
  98              		.thumb_func
  99              		.fpu softvfp
 101              	delay_250ns:
 102              	.LFB2:
  45:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void delay_250ns(void){
 103              		.loc 1 45 0
 104              		.cfi_startproc
 105              		@ args = 0, pretend = 0, frame = 0
 106              		@ frame_needed = 1, uses_anonymous_args = 0
 107 002c 80B5     		push	{r7, lr}
 108              		.cfi_def_cfa_offset 8
 109              		.cfi_offset 7, -8
 110              		.cfi_offset 14, -4
 111 002e 00AF     		add	r7, sp, #0
 112              		.cfi_def_cfa_register 7
  46:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     *STK_CTRL = 0;
 113              		.loc 1 46 0
 114 0030 0C4B     		ldr	r3, .L7
 115 0032 0022     		movs	r2, #0
 116 0034 1A60     		str	r2, [r3]
  47:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     *STK_LOAD = ((168/4)-1);
 117              		.loc 1 47 0
 118 0036 0C4B     		ldr	r3, .L7+4
 119 0038 2922     		movs	r2, #41
 120 003a 1A60     		str	r2, [r3]
  48:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     *STK_VAL  = 0;
 121              		.loc 1 48 0
 122 003c 0B4B     		ldr	r3, .L7+8
 123 003e 0022     		movs	r2, #0
 124 0040 1A60     		str	r2, [r3]
  49:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     *STK_CTRL = 5;
 125              		.loc 1 49 0
 126 0042 084B     		ldr	r3, .L7
 127 0044 0522     		movs	r2, #5
 128 0046 1A60     		str	r2, [r3]
  50:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     while( (*STK_CTRL & 0x10000)== 0){}
 129              		.loc 1 50 0
 130 0048 C046     		nop
 131              	.L6:
 132              		.loc 1 50 0 is_stmt 0 discriminator 1
 133 004a 064B     		ldr	r3, .L7
 134 004c 1A68     		ldr	r2, [r3]
 135 004e 8023     		movs	r3, #128
 136 0050 5B02     		lsls	r3, r3, #9
 137 0052 1340     		ands	r3, r2
 138 0054 F9D0     		beq	.L6
  51:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     *STK_CTRL = 0;
 139              		.loc 1 51 0 is_stmt 1
 140 0056 034B     		ldr	r3, .L7
 141 0058 0022     		movs	r2, #0
 142 005a 1A60     		str	r2, [r3]
  52:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 143              		.loc 1 52 0
 144 005c C046     		nop
 145 005e BD46     		mov	sp, r7
 146              		@ sp needed
 147 0060 80BD     		pop	{r7, pc}
 148              	.L8:
 149 0062 C046     		.align	2
 150              	.L7:
 151 0064 10E000E0 		.word	-536813552
 152 0068 14E000E0 		.word	-536813548
 153 006c 18E000E0 		.word	-536813544
 154              		.cfi_endproc
 155              	.LFE2:
 157              		.align	1
 158              		.global	delay_micro
 159              		.syntax unified
 160              		.code	16
 161              		.thumb_func
 162              		.fpu softvfp
 164              	delay_micro:
 165              	.LFB3:
  53:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void delay_micro(unsigned int us){
 166              		.loc 1 53 0
 167              		.cfi_startproc
 168              		@ args = 0, pretend = 0, frame = 8
 169              		@ frame_needed = 1, uses_anonymous_args = 0
 170 0070 80B5     		push	{r7, lr}
 171              		.cfi_def_cfa_offset 8
 172              		.cfi_offset 7, -8
 173              		.cfi_offset 14, -4
 174 0072 82B0     		sub	sp, sp, #8
 175              		.cfi_def_cfa_offset 16
 176 0074 00AF     		add	r7, sp, #0
 177              		.cfi_def_cfa_register 7
 178 0076 7860     		str	r0, [r7, #4]
  54:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     while(us--){
 179              		.loc 1 54 0
 180 0078 07E0     		b	.L10
 181              	.L11:
  55:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****         delay_250ns();
 182              		.loc 1 55 0
 183 007a FFF7FEFF 		bl	delay_250ns
  56:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****         delay_250ns();
 184              		.loc 1 56 0
 185 007e FFF7FEFF 		bl	delay_250ns
  57:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****         delay_250ns();
 186              		.loc 1 57 0
 187 0082 FFF7FEFF 		bl	delay_250ns
  58:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****         delay_250ns();
 188              		.loc 1 58 0
 189 0086 FFF7FEFF 		bl	delay_250ns
 190              	.L10:
  54:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****         delay_250ns();
 191              		.loc 1 54 0
 192 008a 7B68     		ldr	r3, [r7, #4]
 193 008c 5A1E     		subs	r2, r3, #1
 194 008e 7A60     		str	r2, [r7, #4]
 195 0090 002B     		cmp	r3, #0
 196 0092 F2D1     		bne	.L11
  59:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     }
  60:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 197              		.loc 1 60 0
 198 0094 C046     		nop
 199 0096 BD46     		mov	sp, r7
 200 0098 02B0     		add	sp, sp, #8
 201              		@ sp needed
 202 009a 80BD     		pop	{r7, pc}
 203              		.cfi_endproc
 204              	.LFE3:
 206              		.align	1
 207              		.global	delay_milli
 208              		.syntax unified
 209              		.code	16
 210              		.thumb_func
 211              		.fpu softvfp
 213              	delay_milli:
 214              	.LFB4:
  61:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void delay_milli(unsigned int ms){
 215              		.loc 1 61 0
 216              		.cfi_startproc
 217              		@ args = 0, pretend = 0, frame = 8
 218              		@ frame_needed = 1, uses_anonymous_args = 0
 219 009c 80B5     		push	{r7, lr}
 220              		.cfi_def_cfa_offset 8
 221              		.cfi_offset 7, -8
 222              		.cfi_offset 14, -4
 223 009e 82B0     		sub	sp, sp, #8
 224              		.cfi_def_cfa_offset 16
 225 00a0 00AF     		add	r7, sp, #0
 226              		.cfi_def_cfa_register 7
 227 00a2 7860     		str	r0, [r7, #4]
  62:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     while(ms--){
 228              		.loc 1 62 0
 229 00a4 02E0     		b	.L13
 230              	.L14:
  63:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****         delay_micro(10);
 231              		.loc 1 63 0
 232 00a6 0A20     		movs	r0, #10
 233 00a8 FFF7FEFF 		bl	delay_micro
 234              	.L13:
  62:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     while(ms--){
 235              		.loc 1 62 0
 236 00ac 7B68     		ldr	r3, [r7, #4]
 237 00ae 5A1E     		subs	r2, r3, #1
 238 00b0 7A60     		str	r2, [r7, #4]
 239 00b2 002B     		cmp	r3, #0
 240 00b4 F7D1     		bne	.L14
  64:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     }
  65:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     
  66:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 241              		.loc 1 66 0
 242 00b6 C046     		nop
 243 00b8 BD46     		mov	sp, r7
 244 00ba 02B0     		add	sp, sp, #8
 245              		@ sp needed
 246 00bc 80BD     		pop	{r7, pc}
 247              		.cfi_endproc
 248              	.LFE4:
 250              		.align	1
 251              		.global	ascii_ctrl_bit_set
 252              		.syntax unified
 253              		.code	16
 254              		.thumb_func
 255              		.fpu softvfp
 257              	ascii_ctrl_bit_set:
 258              	.LFB5:
  67:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void ascii_ctrl_bit_set( unsigned char x){
 259              		.loc 1 67 0
 260              		.cfi_startproc
 261              		@ args = 0, pretend = 0, frame = 8
 262              		@ frame_needed = 1, uses_anonymous_args = 0
 263 00be 80B5     		push	{r7, lr}
 264              		.cfi_def_cfa_offset 8
 265              		.cfi_offset 7, -8
 266              		.cfi_offset 14, -4
 267 00c0 82B0     		sub	sp, sp, #8
 268              		.cfi_def_cfa_offset 16
 269 00c2 00AF     		add	r7, sp, #0
 270              		.cfi_def_cfa_register 7
 271 00c4 0200     		movs	r2, r0
 272 00c6 FB1D     		adds	r3, r7, #7
 273 00c8 1A70     		strb	r2, [r3]
  68:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     *PORT_ODR_LOW |= (B_SELECT | x);
 274              		.loc 1 68 0
 275 00ca 084B     		ldr	r3, .L16
 276 00cc 1B78     		ldrb	r3, [r3]
 277 00ce DAB2     		uxtb	r2, r3
 278 00d0 FB1D     		adds	r3, r7, #7
 279 00d2 1B78     		ldrb	r3, [r3]
 280 00d4 1343     		orrs	r3, r2
 281 00d6 DBB2     		uxtb	r3, r3
 282 00d8 044A     		ldr	r2, .L16
 283 00da 0421     		movs	r1, #4
 284 00dc 0B43     		orrs	r3, r1
 285 00de DBB2     		uxtb	r3, r3
 286 00e0 1370     		strb	r3, [r2]
  69:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 287              		.loc 1 69 0
 288 00e2 C046     		nop
 289 00e4 BD46     		mov	sp, r7
 290 00e6 02B0     		add	sp, sp, #8
 291              		@ sp needed
 292 00e8 80BD     		pop	{r7, pc}
 293              	.L17:
 294 00ea C046     		.align	2
 295              	.L16:
 296 00ec 14100240 		.word	1073877012
 297              		.cfi_endproc
 298              	.LFE5:
 300              		.align	1
 301              		.global	ascii_ctrl_bit_clear
 302              		.syntax unified
 303              		.code	16
 304              		.thumb_func
 305              		.fpu softvfp
 307              	ascii_ctrl_bit_clear:
 308              	.LFB6:
  70:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 
  71:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void ascii_ctrl_bit_clear(unsigned char x){
 309              		.loc 1 71 0
 310              		.cfi_startproc
 311              		@ args = 0, pretend = 0, frame = 8
 312              		@ frame_needed = 1, uses_anonymous_args = 0
 313 00f0 80B5     		push	{r7, lr}
 314              		.cfi_def_cfa_offset 8
 315              		.cfi_offset 7, -8
 316              		.cfi_offset 14, -4
 317 00f2 82B0     		sub	sp, sp, #8
 318              		.cfi_def_cfa_offset 16
 319 00f4 00AF     		add	r7, sp, #0
 320              		.cfi_def_cfa_register 7
 321 00f6 0200     		movs	r2, r0
 322 00f8 FB1D     		adds	r3, r7, #7
 323 00fa 1A70     		strb	r2, [r3]
  72:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     *PORT_ODR_LOW &= (B_SELECT | ~x);
 324              		.loc 1 72 0
 325 00fc 0A4B     		ldr	r3, .L19
 326 00fe 1B78     		ldrb	r3, [r3]
 327 0100 DBB2     		uxtb	r3, r3
 328 0102 5BB2     		sxtb	r3, r3
 329 0104 FA1D     		adds	r2, r7, #7
 330 0106 1278     		ldrb	r2, [r2]
 331 0108 52B2     		sxtb	r2, r2
 332 010a D243     		mvns	r2, r2
 333 010c 52B2     		sxtb	r2, r2
 334 010e 0421     		movs	r1, #4
 335 0110 0A43     		orrs	r2, r1
 336 0112 52B2     		sxtb	r2, r2
 337 0114 1340     		ands	r3, r2
 338 0116 5AB2     		sxtb	r2, r3
 339 0118 034B     		ldr	r3, .L19
 340 011a D2B2     		uxtb	r2, r2
 341 011c 1A70     		strb	r2, [r3]
  73:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 342              		.loc 1 73 0
 343 011e C046     		nop
 344 0120 BD46     		mov	sp, r7
 345 0122 02B0     		add	sp, sp, #8
 346              		@ sp needed
 347 0124 80BD     		pop	{r7, pc}
 348              	.L20:
 349 0126 C046     		.align	2
 350              	.L19:
 351 0128 14100240 		.word	1073877012
 352              		.cfi_endproc
 353              	.LFE6:
 355              		.align	1
 356              		.global	ascii_write_controller
 357              		.syntax unified
 358              		.code	16
 359              		.thumb_func
 360              		.fpu softvfp
 362              	ascii_write_controller:
 363              	.LFB7:
  74:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void ascii_write_controller( unsigned char command ){
 364              		.loc 1 74 0
 365              		.cfi_startproc
 366              		@ args = 0, pretend = 0, frame = 8
 367              		@ frame_needed = 1, uses_anonymous_args = 0
 368 012c 80B5     		push	{r7, lr}
 369              		.cfi_def_cfa_offset 8
 370              		.cfi_offset 7, -8
 371              		.cfi_offset 14, -4
 372 012e 82B0     		sub	sp, sp, #8
 373              		.cfi_def_cfa_offset 16
 374 0130 00AF     		add	r7, sp, #0
 375              		.cfi_def_cfa_register 7
 376 0132 0200     		movs	r2, r0
 377 0134 FB1D     		adds	r3, r7, #7
 378 0136 1A70     		strb	r2, [r3]
  75:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	delay_250ns();
 379              		.loc 1 75 0
 380 0138 FFF7FEFF 		bl	delay_250ns
  76:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     ascii_ctrl_bit_set( B_E );		// Synchronization signal =1
 381              		.loc 1 76 0
 382 013c 4020     		movs	r0, #64
 383 013e FFF7FEFF 		bl	ascii_ctrl_bit_set
  77:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     *PORT_ODR_HIGH = command;		// Ger kommandot till porten
 384              		.loc 1 77 0
 385 0142 074A     		ldr	r2, .L22
 386 0144 FB1D     		adds	r3, r7, #7
 387 0146 1B78     		ldrb	r3, [r3]
 388 0148 1370     		strb	r3, [r2]
  78:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	delay_250ns();
 389              		.loc 1 78 0
 390 014a FFF7FEFF 		bl	delay_250ns
  79:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     ascii_ctrl_bit_clear( B_E );	// Stänger av synchronization.
 391              		.loc 1 79 0
 392 014e 4020     		movs	r0, #64
 393 0150 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  80:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     delay_250ns();
 394              		.loc 1 80 0
 395 0154 FFF7FEFF 		bl	delay_250ns
  81:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 396              		.loc 1 81 0
 397 0158 C046     		nop
 398 015a BD46     		mov	sp, r7
 399 015c 02B0     		add	sp, sp, #8
 400              		@ sp needed
 401 015e 80BD     		pop	{r7, pc}
 402              	.L23:
 403              		.align	2
 404              	.L22:
 405 0160 15100240 		.word	1073877013
 406              		.cfi_endproc
 407              	.LFE7:
 409              		.align	1
 410              		.global	ascii_read_controller
 411              		.syntax unified
 412              		.code	16
 413              		.thumb_func
 414              		.fpu softvfp
 416              	ascii_read_controller:
 417              	.LFB8:
  82:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** unsigned char ascii_read_controller( void ){
 418              		.loc 1 82 0
 419              		.cfi_startproc
 420              		@ args = 0, pretend = 0, frame = 8
 421              		@ frame_needed = 1, uses_anonymous_args = 0
 422 0164 80B5     		push	{r7, lr}
 423              		.cfi_def_cfa_offset 8
 424              		.cfi_offset 7, -8
 425              		.cfi_offset 14, -4
 426 0166 82B0     		sub	sp, sp, #8
 427              		.cfi_def_cfa_offset 16
 428 0168 00AF     		add	r7, sp, #0
 429              		.cfi_def_cfa_register 7
  83:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	unsigned char RV;
  84:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	ascii_ctrl_bit_set( B_E );
 430              		.loc 1 84 0
 431 016a 4020     		movs	r0, #64
 432 016c FFF7FEFF 		bl	ascii_ctrl_bit_set
  85:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	delay_250ns();
 433              		.loc 1 85 0
 434 0170 FFF7FEFF 		bl	delay_250ns
  86:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	delay_250ns();
 435              		.loc 1 86 0
 436 0174 FFF7FEFF 		bl	delay_250ns
  87:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	RV = *PORT_IDR_HIGH;
 437              		.loc 1 87 0
 438 0178 064A     		ldr	r2, .L26
 439 017a FB1D     		adds	r3, r7, #7
 440 017c 1278     		ldrb	r2, [r2]
 441 017e 1A70     		strb	r2, [r3]
  88:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	ascii_ctrl_bit_clear( B_E );
 442              		.loc 1 88 0
 443 0180 4020     		movs	r0, #64
 444 0182 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  89:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	return RV;
 445              		.loc 1 89 0
 446 0186 FB1D     		adds	r3, r7, #7
 447 0188 1B78     		ldrb	r3, [r3]
  90:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 448              		.loc 1 90 0
 449 018a 1800     		movs	r0, r3
 450 018c BD46     		mov	sp, r7
 451 018e 02B0     		add	sp, sp, #8
 452              		@ sp needed
 453 0190 80BD     		pop	{r7, pc}
 454              	.L27:
 455 0192 C046     		.align	2
 456              	.L26:
 457 0194 10100240 		.word	1073877008
 458              		.cfi_endproc
 459              	.LFE8:
 461              		.align	1
 462              		.global	ascii_write_cmd
 463              		.syntax unified
 464              		.code	16
 465              		.thumb_func
 466              		.fpu softvfp
 468              	ascii_write_cmd:
 469              	.LFB9:
  91:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void ascii_write_cmd ( unsigned char command){
 470              		.loc 1 91 0
 471              		.cfi_startproc
 472              		@ args = 0, pretend = 0, frame = 8
 473              		@ frame_needed = 1, uses_anonymous_args = 0
 474 0198 80B5     		push	{r7, lr}
 475              		.cfi_def_cfa_offset 8
 476              		.cfi_offset 7, -8
 477              		.cfi_offset 14, -4
 478 019a 82B0     		sub	sp, sp, #8
 479              		.cfi_def_cfa_offset 16
 480 019c 00AF     		add	r7, sp, #0
 481              		.cfi_def_cfa_register 7
 482 019e 0200     		movs	r2, r0
 483 01a0 FB1D     		adds	r3, r7, #7
 484 01a2 1A70     		strb	r2, [r3]
  92:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     ascii_ctrl_bit_clear(B_RS);
 485              		.loc 1 92 0
 486 01a4 0120     		movs	r0, #1
 487 01a6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  93:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     ascii_ctrl_bit_clear(B_RW);
 488              		.loc 1 93 0
 489 01aa 0220     		movs	r0, #2
 490 01ac FFF7FEFF 		bl	ascii_ctrl_bit_clear
  94:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     ascii_write_controller(command);
 491              		.loc 1 94 0
 492 01b0 FB1D     		adds	r3, r7, #7
 493 01b2 1B78     		ldrb	r3, [r3]
 494 01b4 1800     		movs	r0, r3
 495 01b6 FFF7FEFF 		bl	ascii_write_controller
  95:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 496              		.loc 1 95 0
 497 01ba C046     		nop
 498 01bc BD46     		mov	sp, r7
 499 01be 02B0     		add	sp, sp, #8
 500              		@ sp needed
 501 01c0 80BD     		pop	{r7, pc}
 502              		.cfi_endproc
 503              	.LFE9:
 505              		.align	1
 506              		.global	ascii_write_data
 507              		.syntax unified
 508              		.code	16
 509              		.thumb_func
 510              		.fpu softvfp
 512              	ascii_write_data:
 513              	.LFB10:
  96:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void ascii_write_data (unsigned char data){
 514              		.loc 1 96 0
 515              		.cfi_startproc
 516              		@ args = 0, pretend = 0, frame = 8
 517              		@ frame_needed = 1, uses_anonymous_args = 0
 518 01c2 80B5     		push	{r7, lr}
 519              		.cfi_def_cfa_offset 8
 520              		.cfi_offset 7, -8
 521              		.cfi_offset 14, -4
 522 01c4 82B0     		sub	sp, sp, #8
 523              		.cfi_def_cfa_offset 16
 524 01c6 00AF     		add	r7, sp, #0
 525              		.cfi_def_cfa_register 7
 526 01c8 0200     		movs	r2, r0
 527 01ca FB1D     		adds	r3, r7, #7
 528 01cc 1A70     		strb	r2, [r3]
  97:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     ascii_ctrl_bit_clear(B_RW);
 529              		.loc 1 97 0
 530 01ce 0220     		movs	r0, #2
 531 01d0 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  98:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     ascii_ctrl_bit_set(B_RS);
 532              		.loc 1 98 0
 533 01d4 0120     		movs	r0, #1
 534 01d6 FFF7FEFF 		bl	ascii_ctrl_bit_set
  99:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     ascii_write_controller(data);
 535              		.loc 1 99 0
 536 01da FB1D     		adds	r3, r7, #7
 537 01dc 1B78     		ldrb	r3, [r3]
 538 01de 1800     		movs	r0, r3
 539 01e0 FFF7FEFF 		bl	ascii_write_controller
 100:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 540              		.loc 1 100 0
 541 01e4 C046     		nop
 542 01e6 BD46     		mov	sp, r7
 543 01e8 02B0     		add	sp, sp, #8
 544              		@ sp needed
 545 01ea 80BD     		pop	{r7, pc}
 546              		.cfi_endproc
 547              	.LFE10:
 549              		.align	1
 550              		.global	ascii_read_status
 551              		.syntax unified
 552              		.code	16
 553              		.thumb_func
 554              		.fpu softvfp
 556              	ascii_read_status:
 557              	.LFB11:
 101:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** unsigned char ascii_read_status(){
 558              		.loc 1 101 0
 559              		.cfi_startproc
 560              		@ args = 0, pretend = 0, frame = 8
 561              		@ frame_needed = 1, uses_anonymous_args = 0
 562 01ec 90B5     		push	{r4, r7, lr}
 563              		.cfi_def_cfa_offset 12
 564              		.cfi_offset 4, -12
 565              		.cfi_offset 7, -8
 566              		.cfi_offset 14, -4
 567 01ee 83B0     		sub	sp, sp, #12
 568              		.cfi_def_cfa_offset 24
 569 01f0 00AF     		add	r7, sp, #0
 570              		.cfi_def_cfa_register 7
 102:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	unsigned char RV;
 103:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	*PORT_MODER_LH = 0x00;   		//GÖR OM PORTAR 8-15 TILL INGÅNGAR
 571              		.loc 1 103 0
 572 01f2 0B4B     		ldr	r3, .L32
 573 01f4 0022     		movs	r2, #0
 574 01f6 1A70     		strb	r2, [r3]
 104:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	ascii_ctrl_bit_clear( B_RS );  	//NOLLSTÄLL READ/ SET
 575              		.loc 1 104 0
 576 01f8 0120     		movs	r0, #1
 577 01fa FFF7FEFF 		bl	ascii_ctrl_bit_clear
 105:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	ascii_ctrl_bit_set( B_RW );   	// ETT STÄLL READ/WRITE
 578              		.loc 1 105 0
 579 01fe 0220     		movs	r0, #2
 580 0200 FFF7FEFF 		bl	ascii_ctrl_bit_set
 106:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	RV = ascii_read_controller();
 581              		.loc 1 106 0
 582 0204 FC1D     		adds	r4, r7, #7
 583 0206 FFF7FEFF 		bl	ascii_read_controller
 584 020a 0300     		movs	r3, r0
 585 020c 2370     		strb	r3, [r4]
 107:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	*PORT_MODER_LH = 0x55;    		//GÖR OM PORTEN TILL UTGÅNGAR
 586              		.loc 1 107 0
 587 020e 044B     		ldr	r3, .L32
 588 0210 5522     		movs	r2, #85
 589 0212 1A70     		strb	r2, [r3]
 108:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	return RV;
 590              		.loc 1 108 0
 591 0214 FB1D     		adds	r3, r7, #7
 592 0216 1B78     		ldrb	r3, [r3]
 109:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 593              		.loc 1 109 0
 594 0218 1800     		movs	r0, r3
 595 021a BD46     		mov	sp, r7
 596 021c 03B0     		add	sp, sp, #12
 597              		@ sp needed
 598 021e 90BD     		pop	{r4, r7, pc}
 599              	.L33:
 600              		.align	2
 601              	.L32:
 602 0220 01100240 		.word	1073876993
 603              		.cfi_endproc
 604              	.LFE11:
 606              		.align	1
 607              		.global	ascii_read_data
 608              		.syntax unified
 609              		.code	16
 610              		.thumb_func
 611              		.fpu softvfp
 613              	ascii_read_data:
 614              	.LFB12:
 110:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** unsigned char ascii_read_data(void){
 615              		.loc 1 110 0
 616              		.cfi_startproc
 617              		@ args = 0, pretend = 0, frame = 8
 618              		@ frame_needed = 1, uses_anonymous_args = 0
 619 0224 90B5     		push	{r4, r7, lr}
 620              		.cfi_def_cfa_offset 12
 621              		.cfi_offset 4, -12
 622              		.cfi_offset 7, -8
 623              		.cfi_offset 14, -4
 624 0226 83B0     		sub	sp, sp, #12
 625              		.cfi_def_cfa_offset 24
 626 0228 00AF     		add	r7, sp, #0
 627              		.cfi_def_cfa_register 7
 111:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     unsigned char RV;
 112:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     *PORT_MODER_LH = 0x00;
 628              		.loc 1 112 0
 629 022a 0B4B     		ldr	r3, .L36
 630 022c 0022     		movs	r2, #0
 631 022e 1A70     		strb	r2, [r3]
 113:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     ascii_ctrl_bit_set(B_RS);
 632              		.loc 1 113 0
 633 0230 0120     		movs	r0, #1
 634 0232 FFF7FEFF 		bl	ascii_ctrl_bit_set
 114:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     ascii_ctrl_bit_set(B_RW);
 635              		.loc 1 114 0
 636 0236 0220     		movs	r0, #2
 637 0238 FFF7FEFF 		bl	ascii_ctrl_bit_set
 115:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     RV = ascii_read_controller();
 638              		.loc 1 115 0
 639 023c FC1D     		adds	r4, r7, #7
 640 023e FFF7FEFF 		bl	ascii_read_controller
 641 0242 0300     		movs	r3, r0
 642 0244 2370     		strb	r3, [r4]
 116:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     *PORT_MODER_LH = 0x55;
 643              		.loc 1 116 0
 644 0246 044B     		ldr	r3, .L36
 645 0248 5522     		movs	r2, #85
 646 024a 1A70     		strb	r2, [r3]
 117:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	return RV;
 647              		.loc 1 117 0
 648 024c FB1D     		adds	r3, r7, #7
 649 024e 1B78     		ldrb	r3, [r3]
 118:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 650              		.loc 1 118 0
 651 0250 1800     		movs	r0, r3
 652 0252 BD46     		mov	sp, r7
 653 0254 03B0     		add	sp, sp, #12
 654              		@ sp needed
 655 0256 90BD     		pop	{r4, r7, pc}
 656              	.L37:
 657              		.align	2
 658              	.L36:
 659 0258 01100240 		.word	1073876993
 660              		.cfi_endproc
 661              	.LFE12:
 663              		.align	1
 664              		.global	ascii_command
 665              		.syntax unified
 666              		.code	16
 667              		.thumb_func
 668              		.fpu softvfp
 670              	ascii_command:
 671              	.LFB13:
 119:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void ascii_command(unsigned char command){
 672              		.loc 1 119 0
 673              		.cfi_startproc
 674              		@ args = 0, pretend = 0, frame = 8
 675              		@ frame_needed = 1, uses_anonymous_args = 0
 676 025c 80B5     		push	{r7, lr}
 677              		.cfi_def_cfa_offset 8
 678              		.cfi_offset 7, -8
 679              		.cfi_offset 14, -4
 680 025e 82B0     		sub	sp, sp, #8
 681              		.cfi_def_cfa_offset 16
 682 0260 00AF     		add	r7, sp, #0
 683              		.cfi_def_cfa_register 7
 684 0262 0200     		movs	r2, r0
 685 0264 FB1D     		adds	r3, r7, #7
 686 0266 1A70     		strb	r2, [r3]
 120:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	while ((ascii_read_status() & 0x80) == 0x80) {}
 687              		.loc 1 120 0
 688 0268 C046     		nop
 689              	.L39:
 690              		.loc 1 120 0 is_stmt 0 discriminator 1
 691 026a FFF7FEFF 		bl	ascii_read_status
 692 026e 0300     		movs	r3, r0
 693 0270 1A00     		movs	r2, r3
 694 0272 8023     		movs	r3, #128
 695 0274 1340     		ands	r3, r2
 696 0276 802B     		cmp	r3, #128
 697 0278 F7D0     		beq	.L39
 121:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	delay_micro(8);
 698              		.loc 1 121 0 is_stmt 1
 699 027a 0820     		movs	r0, #8
 700 027c FFF7FEFF 		bl	delay_micro
 122:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	ascii_write_cmd(command);
 701              		.loc 1 122 0
 702 0280 FB1D     		adds	r3, r7, #7
 703 0282 1B78     		ldrb	r3, [r3]
 704 0284 1800     		movs	r0, r3
 705 0286 FFF7FEFF 		bl	ascii_write_cmd
 123:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	delay_milli(2);
 706              		.loc 1 123 0
 707 028a 0220     		movs	r0, #2
 708 028c FFF7FEFF 		bl	delay_milli
 124:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 709              		.loc 1 124 0
 710 0290 C046     		nop
 711 0292 BD46     		mov	sp, r7
 712 0294 02B0     		add	sp, sp, #8
 713              		@ sp needed
 714 0296 80BD     		pop	{r7, pc}
 715              		.cfi_endproc
 716              	.LFE13:
 718              		.align	1
 719              		.global	ascii_write_char
 720              		.syntax unified
 721              		.code	16
 722              		.thumb_func
 723              		.fpu softvfp
 725              	ascii_write_char:
 726              	.LFB14:
 125:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void ascii_write_char(unsigned char c){
 727              		.loc 1 125 0
 728              		.cfi_startproc
 729              		@ args = 0, pretend = 0, frame = 8
 730              		@ frame_needed = 1, uses_anonymous_args = 0
 731 0298 80B5     		push	{r7, lr}
 732              		.cfi_def_cfa_offset 8
 733              		.cfi_offset 7, -8
 734              		.cfi_offset 14, -4
 735 029a 82B0     		sub	sp, sp, #8
 736              		.cfi_def_cfa_offset 16
 737 029c 00AF     		add	r7, sp, #0
 738              		.cfi_def_cfa_register 7
 739 029e 0200     		movs	r2, r0
 740 02a0 FB1D     		adds	r3, r7, #7
 741 02a2 1A70     		strb	r2, [r3]
 126:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	while ((ascii_read_status() & 0x80) == 0x80) {}
 742              		.loc 1 126 0
 743 02a4 C046     		nop
 744              	.L41:
 745              		.loc 1 126 0 is_stmt 0 discriminator 1
 746 02a6 FFF7FEFF 		bl	ascii_read_status
 747 02aa 0300     		movs	r3, r0
 748 02ac 1A00     		movs	r2, r3
 749 02ae 8023     		movs	r3, #128
 750 02b0 1340     		ands	r3, r2
 751 02b2 802B     		cmp	r3, #128
 752 02b4 F7D0     		beq	.L41
 127:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	delay_micro(8);
 753              		.loc 1 127 0 is_stmt 1
 754 02b6 0820     		movs	r0, #8
 755 02b8 FFF7FEFF 		bl	delay_micro
 128:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	ascii_write_data(c);
 756              		.loc 1 128 0
 757 02bc FB1D     		adds	r3, r7, #7
 758 02be 1B78     		ldrb	r3, [r3]
 759 02c0 1800     		movs	r0, r3
 760 02c2 FFF7FEFF 		bl	ascii_write_data
 129:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	delay_micro(43);
 761              		.loc 1 129 0
 762 02c6 2B20     		movs	r0, #43
 763 02c8 FFF7FEFF 		bl	delay_micro
 130:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 764              		.loc 1 130 0
 765 02cc C046     		nop
 766 02ce BD46     		mov	sp, r7
 767 02d0 02B0     		add	sp, sp, #8
 768              		@ sp needed
 769 02d2 80BD     		pop	{r7, pc}
 770              		.cfi_endproc
 771              	.LFE14:
 773              		.align	1
 774              		.global	ascii_gotoxy
 775              		.syntax unified
 776              		.code	16
 777              		.thumb_func
 778              		.fpu softvfp
 780              	ascii_gotoxy:
 781              	.LFB15:
 131:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void ascii_gotoxy(int x, int y){
 782              		.loc 1 131 0
 783              		.cfi_startproc
 784              		@ args = 0, pretend = 0, frame = 16
 785              		@ frame_needed = 1, uses_anonymous_args = 0
 786 02d4 80B5     		push	{r7, lr}
 787              		.cfi_def_cfa_offset 8
 788              		.cfi_offset 7, -8
 789              		.cfi_offset 14, -4
 790 02d6 84B0     		sub	sp, sp, #16
 791              		.cfi_def_cfa_offset 24
 792 02d8 00AF     		add	r7, sp, #0
 793              		.cfi_def_cfa_register 7
 794 02da 7860     		str	r0, [r7, #4]
 795 02dc 3960     		str	r1, [r7]
 132:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	unsigned char adress = x-1;
 796              		.loc 1 132 0
 797 02de 7B68     		ldr	r3, [r7, #4]
 798 02e0 DAB2     		uxtb	r2, r3
 799 02e2 0F23     		movs	r3, #15
 800 02e4 FB18     		adds	r3, r7, r3
 801 02e6 013A     		subs	r2, r2, #1
 802 02e8 1A70     		strb	r2, [r3]
 133:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	if (y == 2)
 803              		.loc 1 133 0
 804 02ea 3B68     		ldr	r3, [r7]
 805 02ec 022B     		cmp	r3, #2
 806 02ee 05D1     		bne	.L43
 134:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 		adress += 0x40;
 807              		.loc 1 134 0
 808 02f0 0F22     		movs	r2, #15
 809 02f2 BB18     		adds	r3, r7, r2
 810 02f4 BA18     		adds	r2, r7, r2
 811 02f6 1278     		ldrb	r2, [r2]
 812 02f8 4032     		adds	r2, r2, #64
 813 02fa 1A70     		strb	r2, [r3]
 814              	.L43:
 135:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	ascii_write_cmd(0x80 | adress);
 815              		.loc 1 135 0
 816 02fc 0F23     		movs	r3, #15
 817 02fe FB18     		adds	r3, r7, r3
 818 0300 1B78     		ldrb	r3, [r3]
 819 0302 8022     		movs	r2, #128
 820 0304 5242     		rsbs	r2, r2, #0
 821 0306 1343     		orrs	r3, r2
 822 0308 DBB2     		uxtb	r3, r3
 823 030a 1800     		movs	r0, r3
 824 030c FFF7FEFF 		bl	ascii_write_cmd
 136:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 825              		.loc 1 136 0
 826 0310 C046     		nop
 827 0312 BD46     		mov	sp, r7
 828 0314 04B0     		add	sp, sp, #16
 829              		@ sp needed
 830 0316 80BD     		pop	{r7, pc}
 831              		.cfi_endproc
 832              	.LFE15:
 834              		.align	1
 835              		.global	ascii_init
 836              		.syntax unified
 837              		.code	16
 838              		.thumb_func
 839              		.fpu softvfp
 841              	ascii_init:
 842              	.LFB16:
 137:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** void ascii_init(void){
 843              		.loc 1 137 0
 844              		.cfi_startproc
 845              		@ args = 0, pretend = 0, frame = 0
 846              		@ frame_needed = 1, uses_anonymous_args = 0
 847 0318 80B5     		push	{r7, lr}
 848              		.cfi_def_cfa_offset 8
 849              		.cfi_offset 7, -8
 850              		.cfi_offset 14, -4
 851 031a 00AF     		add	r7, sp, #0
 852              		.cfi_def_cfa_register 7
 138:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c ****     ascii_command(0x38);	//Function set
 853              		.loc 1 138 0
 854 031c 3820     		movs	r0, #56
 855 031e FFF7FEFF 		bl	ascii_command
 139:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	ascii_command(0x0E);	//Display control
 856              		.loc 1 139 0
 857 0322 0E20     		movs	r0, #14
 858 0324 FFF7FEFF 		bl	ascii_command
 140:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	ascii_command(0x01);	//Clear Display
 859              		.loc 1 140 0
 860 0328 0120     		movs	r0, #1
 861 032a FFF7FEFF 		bl	ascii_command
 141:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	ascii_command(0x06);	//Entry mode set
 862              		.loc 1 141 0
 863 032e 0620     		movs	r0, #6
 864 0330 FFF7FEFF 		bl	ascii_command
 142:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }
 865              		.loc 1 142 0
 866 0334 C046     		nop
 867 0336 BD46     		mov	sp, r7
 868              		@ sp needed
 869 0338 80BD     		pop	{r7, pc}
 870              		.cfi_endproc
 871              	.LFE16:
 873              		.section	.rodata
 874              		.align	2
 875              	.LC0:
 876 0000 416C6661 		.ascii	"Alfanumerisk \000"
 876      6E756D65 
 876      7269736B 
 876      2000
 877 000e 0000     		.align	2
 878              	.LC2:
 879 0010 44697370 		.ascii	"Display - test\000"
 879      6C617920 
 879      2D207465 
 879      737400
 880              		.text
 881              		.align	1
 882              		.global	main
 883              		.syntax unified
 884              		.code	16
 885              		.thumb_func
 886              		.fpu softvfp
 888              	main:
 889              	.LFB17:
 143:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** int main(int argc, char **argv){
 890              		.loc 1 143 0
 891              		.cfi_startproc
 892              		@ args = 0, pretend = 0, frame = 48
 893              		@ frame_needed = 1, uses_anonymous_args = 0
 894 033a B0B5     		push	{r4, r5, r7, lr}
 895              		.cfi_def_cfa_offset 16
 896              		.cfi_offset 4, -16
 897              		.cfi_offset 5, -12
 898              		.cfi_offset 7, -8
 899              		.cfi_offset 14, -4
 900 033c 8CB0     		sub	sp, sp, #48
 901              		.cfi_def_cfa_offset 64
 902 033e 00AF     		add	r7, sp, #0
 903              		.cfi_def_cfa_register 7
 904 0340 7860     		str	r0, [r7, #4]
 905 0342 3960     		str	r1, [r7]
 144:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	char *s;
 145:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	char test1[] = "Alfanumerisk ";
 906              		.loc 1 145 0
 907 0344 1C24     		movs	r4, #28
 908 0346 3B19     		adds	r3, r7, r4
 909 0348 1D4A     		ldr	r2, .L51
 910 034a 23CA     		ldmia	r2!, {r0, r1, r5}
 911 034c 23C3     		stmia	r3!, {r0, r1, r5}
 912 034e 1288     		ldrh	r2, [r2]
 913 0350 1A80     		strh	r2, [r3]
 146:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	char test2[] = "Display - test";
 914              		.loc 1 146 0
 915 0352 0C23     		movs	r3, #12
 916 0354 FB18     		adds	r3, r7, r3
 917 0356 1B4A     		ldr	r2, .L51+4
 918 0358 23CA     		ldmia	r2!, {r0, r1, r5}
 919 035a 23C3     		stmia	r3!, {r0, r1, r5}
 920 035c 1188     		ldrh	r1, [r2]
 921 035e 1980     		strh	r1, [r3]
 922 0360 9278     		ldrb	r2, [r2, #2]
 923 0362 9A70     		strb	r2, [r3, #2]
 147:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	  
 148:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	init_app();
 924              		.loc 1 148 0
 925 0364 FFF7FEFF 		bl	init_app
 149:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	ascii_init();
 926              		.loc 1 149 0
 927 0368 FFF7FEFF 		bl	ascii_init
 150:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	ascii_gotoxy(1,1);
 928              		.loc 1 150 0
 929 036c 0121     		movs	r1, #1
 930 036e 0120     		movs	r0, #1
 931 0370 FFF7FEFF 		bl	ascii_gotoxy
 151:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	s = test1;
 932              		.loc 1 151 0
 933 0374 3B19     		adds	r3, r7, r4
 934 0376 FB62     		str	r3, [r7, #44]
 152:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	
 153:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	while(*s)
 935              		.loc 1 153 0
 936 0378 06E0     		b	.L46
 937              	.L47:
 154:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 		ascii_write_char(*s++);
 938              		.loc 1 154 0
 939 037a FB6A     		ldr	r3, [r7, #44]
 940 037c 5A1C     		adds	r2, r3, #1
 941 037e FA62     		str	r2, [r7, #44]
 942 0380 1B78     		ldrb	r3, [r3]
 943 0382 1800     		movs	r0, r3
 944 0384 FFF7FEFF 		bl	ascii_write_char
 945              	.L46:
 153:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 		ascii_write_char(*s++);
 946              		.loc 1 153 0
 947 0388 FB6A     		ldr	r3, [r7, #44]
 948 038a 1B78     		ldrb	r3, [r3]
 949 038c 002B     		cmp	r3, #0
 950 038e F4D1     		bne	.L47
 155:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	ascii_gotoxy(1,2);
 951              		.loc 1 155 0
 952 0390 0221     		movs	r1, #2
 953 0392 0120     		movs	r0, #1
 954 0394 FFF7FEFF 		bl	ascii_gotoxy
 156:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	s = test2;
 955              		.loc 1 156 0
 956 0398 0C23     		movs	r3, #12
 957 039a FB18     		adds	r3, r7, r3
 958 039c FB62     		str	r3, [r7, #44]
 157:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	
 158:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	while(*s)
 959              		.loc 1 158 0
 960 039e 06E0     		b	.L48
 961              	.L49:
 159:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 		ascii_write_char(*s++);
 962              		.loc 1 159 0
 963 03a0 FB6A     		ldr	r3, [r7, #44]
 964 03a2 5A1C     		adds	r2, r3, #1
 965 03a4 FA62     		str	r2, [r7, #44]
 966 03a6 1B78     		ldrb	r3, [r3]
 967 03a8 1800     		movs	r0, r3
 968 03aa FFF7FEFF 		bl	ascii_write_char
 969              	.L48:
 158:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 		ascii_write_char(*s++);
 970              		.loc 1 158 0
 971 03ae FB6A     		ldr	r3, [r7, #44]
 972 03b0 1B78     		ldrb	r3, [r3]
 973 03b2 002B     		cmp	r3, #0
 974 03b4 F4D1     		bne	.L49
 160:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** 	return 0;
 975              		.loc 1 160 0
 976 03b6 0023     		movs	r3, #0
 161:/home/tom/Documents/WORK/MachineOrientedProgramming/asciidisplay/startup.c **** }...
 977              		.loc 1 161 0
 978 03b8 1800     		movs	r0, r3
 979 03ba BD46     		mov	sp, r7
 980 03bc 0CB0     		add	sp, sp, #48
 981              		@ sp needed
 982 03be B0BD     		pop	{r4, r5, r7, pc}
 983              	.L52:
 984              		.align	2
 985              	.L51:
 986 03c0 00000000 		.word	.LC0
 987 03c4 10000000 		.word	.LC2
 988              		.cfi_endproc
 989              	.LFE17:
 991              	.Letext0:
