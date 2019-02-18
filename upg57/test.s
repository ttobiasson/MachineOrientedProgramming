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
  25              		.file 1 "/home/tom/Documents/WORK/upg57/startup.c"
   1:/home/tom/Documents/WORK/upg57/startup.c **** /*
   2:/home/tom/Documents/WORK/upg57/startup.c ****  * 	startup.c
   3:/home/tom/Documents/WORK/upg57/startup.c ****  *
   4:/home/tom/Documents/WORK/upg57/startup.c ****  */
   5:/home/tom/Documents/WORK/upg57/startup.c ****  
   6:/home/tom/Documents/WORK/upg57/startup.c **** #define PORT_BASE_E 0x40021000
   7:/home/tom/Documents/WORK/upg57/startup.c **** 		/* Definiera word-adresser för initiering*/
   8:/home/tom/Documents/WORK/upg57/startup.c **** #define portModer ((volatile unsigned int*)PORT_BASE_E)
   9:/home/tom/Documents/WORK/upg57/startup.c **** #define portModerHigh ((volatile unsigned short*)PORT_BASE_E+0x02)
  10:/home/tom/Documents/WORK/upg57/startup.c **** #define portOtyper ((volatile unsigned int*) PORT_BASE_E+0x04)
  11:/home/tom/Documents/WORK/upg57/startup.c **** #define Ospeedr    ((volatile unsigned int*) PORT_BASE_E+0x08)
  12:/home/tom/Documents/WORK/upg57/startup.c **** #define portPupdr  ((volatile unsigned int*) PORT_BASE_E+0x0C)
  13:/home/tom/Documents/WORK/upg57/startup.c **** 		/*Definiera byte-adresser för data och styrregister*/
  14:/home/tom/Documents/WORK/upg57/startup.c **** #define portIdrLow ((volatile unsigned char*) PORT_BASE_E+0x10)
  15:/home/tom/Documents/WORK/upg57/startup.c **** #define portIdrHigh ((volatile unsigned char*) PORT_BASE_E+0x10)
  16:/home/tom/Documents/WORK/upg57/startup.c **** #define portOdrLow  ((volatile unsigned char*) PORT_BASE_E+0x14)
  17:/home/tom/Documents/WORK/upg57/startup.c **** #define portOdrHigh ((volatile unsigned char*) PORT_BASE_E+0x15)
  18:/home/tom/Documents/WORK/upg57/startup.c **** 		/*Definiera lämpliga definitioner för de olika bitarna i styrregistret*/
  19:/home/tom/Documents/WORK/upg57/startup.c **** #define B_E 0x40	/*ENABLE SIGNAL*/
  20:/home/tom/Documents/WORK/upg57/startup.c **** #define B_SELECT 4	/*SELECT ASCII-DISPLAY*/
  21:/home/tom/Documents/WORK/upg57/startup.c **** #define B_RW 2		/* 0 = writem, 1 = read*/
  22:/home/tom/Documents/WORK/upg57/startup.c **** #define B_RS 1		/* 0 = control, 1 =data*/
  23:/home/tom/Documents/WORK/upg57/startup.c **** 		/*STK DELAY*/
  24:/home/tom/Documents/WORK/upg57/startup.c **** #define STK_CTRL ((volatile unsigned int*)(0xE000E010))
  25:/home/tom/Documents/WORK/upg57/startup.c **** #define STK_LOAD ((volatile unsigned int*)(0xE000E014))
  26:/home/tom/Documents/WORK/upg57/startup.c **** #define STK_VAL  ((volatile unsigned int*)(0xE000E018))
  27:/home/tom/Documents/WORK/upg57/startup.c ****  
  28:/home/tom/Documents/WORK/upg57/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  29:/home/tom/Documents/WORK/upg57/startup.c **** 
  30:/home/tom/Documents/WORK/upg57/startup.c **** void startup ( void )
  31:/home/tom/Documents/WORK/upg57/startup.c **** {
  26              		.loc 1 31 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  32:/home/tom/Documents/WORK/upg57/startup.c **** __asm volatile(
  31              		.loc 1 32 0
  32              		.syntax divided
  33              	@ 32 "/home/tom/Documents/WORK/upg57/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  33:/home/tom/Documents/WORK/upg57/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  34:/home/tom/Documents/WORK/upg57/startup.c **** 	" MOV SP,R0\n"
  35:/home/tom/Documents/WORK/upg57/startup.c **** 	" BL main\n"				/* call main */
  36:/home/tom/Documents/WORK/upg57/startup.c **** 	"_exit: B .\n"				/* never return */
  37:/home/tom/Documents/WORK/upg57/startup.c **** 	) ;
  38:/home/tom/Documents/WORK/upg57/startup.c **** }
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
  39:/home/tom/Documents/WORK/upg57/startup.c **** 
  40:/home/tom/Documents/WORK/upg57/startup.c **** void init_app(void){
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
  41:/home/tom/Documents/WORK/upg57/startup.c **** 	*portModer = 0x55555555;
  67              		.loc 1 41 0
  68 0004 054B     		ldr	r3, .L3
  69 0006 064A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  42:/home/tom/Documents/WORK/upg57/startup.c **** 	*portOtyper =0x00000000;
  71              		.loc 1 42 0
  72 000a 064B     		ldr	r3, .L3+8
  73 000c 0022     		movs	r2, #0
  74 000e 1A60     		str	r2, [r3]
  43:/home/tom/Documents/WORK/upg57/startup.c ****     *Ospeedr    =0x55555555;
  75              		.loc 1 43 0
  76 0010 054B     		ldr	r3, .L3+12
  77 0012 034A     		ldr	r2, .L3+4
  78 0014 1A60     		str	r2, [r3]
  44:/home/tom/Documents/WORK/upg57/startup.c **** }
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
  45:/home/tom/Documents/WORK/upg57/startup.c **** 
  46:/home/tom/Documents/WORK/upg57/startup.c **** void delay_250ns(void){
 103              		.loc 1 46 0
 104              		.cfi_startproc
 105              		@ args = 0, pretend = 0, frame = 0
 106              		@ frame_needed = 1, uses_anonymous_args = 0
 107 002c 80B5     		push	{r7, lr}
 108              		.cfi_def_cfa_offset 8
 109              		.cfi_offset 7, -8
 110              		.cfi_offset 14, -4
 111 002e 00AF     		add	r7, sp, #0
 112              		.cfi_def_cfa_register 7
  47:/home/tom/Documents/WORK/upg57/startup.c ****     *STK_CTRL = 0;
 113              		.loc 1 47 0
 114 0030 0C4B     		ldr	r3, .L7
 115 0032 0022     		movs	r2, #0
 116 0034 1A60     		str	r2, [r3]
  48:/home/tom/Documents/WORK/upg57/startup.c ****     *STK_LOAD = ((168/4)-1);
 117              		.loc 1 48 0
 118 0036 0C4B     		ldr	r3, .L7+4
 119 0038 2922     		movs	r2, #41
 120 003a 1A60     		str	r2, [r3]
  49:/home/tom/Documents/WORK/upg57/startup.c ****     *STK_VAL  = 0;
 121              		.loc 1 49 0
 122 003c 0B4B     		ldr	r3, .L7+8
 123 003e 0022     		movs	r2, #0
 124 0040 1A60     		str	r2, [r3]
  50:/home/tom/Documents/WORK/upg57/startup.c ****     *STK_CTRL = 5;
 125              		.loc 1 50 0
 126 0042 084B     		ldr	r3, .L7
 127 0044 0522     		movs	r2, #5
 128 0046 1A60     		str	r2, [r3]
  51:/home/tom/Documents/WORK/upg57/startup.c ****     while( (*STK_CTRL & 0x10000)== 0){}
 129              		.loc 1 51 0
 130 0048 C046     		nop
 131              	.L6:
 132              		.loc 1 51 0 is_stmt 0 discriminator 1
 133 004a 064B     		ldr	r3, .L7
 134 004c 1A68     		ldr	r2, [r3]
 135 004e 8023     		movs	r3, #128
 136 0050 5B02     		lsls	r3, r3, #9
 137 0052 1340     		ands	r3, r2
 138 0054 F9D0     		beq	.L6
  52:/home/tom/Documents/WORK/upg57/startup.c ****     *STK_CTRL = 0;
 139              		.loc 1 52 0 is_stmt 1
 140 0056 034B     		ldr	r3, .L7
 141 0058 0022     		movs	r2, #0
 142 005a 1A60     		str	r2, [r3]
  53:/home/tom/Documents/WORK/upg57/startup.c **** }
 143              		.loc 1 53 0
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
  54:/home/tom/Documents/WORK/upg57/startup.c **** 
  55:/home/tom/Documents/WORK/upg57/startup.c **** void delay_micro(unsigned int us){
 166              		.loc 1 55 0
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
  56:/home/tom/Documents/WORK/upg57/startup.c ****     while(us--){
 179              		.loc 1 56 0
 180 0078 07E0     		b	.L10
 181              	.L11:
  57:/home/tom/Documents/WORK/upg57/startup.c ****         delay_250ns();
 182              		.loc 1 57 0
 183 007a FFF7FEFF 		bl	delay_250ns
  58:/home/tom/Documents/WORK/upg57/startup.c ****         delay_250ns();
 184              		.loc 1 58 0
 185 007e FFF7FEFF 		bl	delay_250ns
  59:/home/tom/Documents/WORK/upg57/startup.c ****         delay_250ns();
 186              		.loc 1 59 0
 187 0082 FFF7FEFF 		bl	delay_250ns
  60:/home/tom/Documents/WORK/upg57/startup.c ****         delay_250ns();
 188              		.loc 1 60 0
 189 0086 FFF7FEFF 		bl	delay_250ns
 190              	.L10:
  56:/home/tom/Documents/WORK/upg57/startup.c ****         delay_250ns();
 191              		.loc 1 56 0
 192 008a 7B68     		ldr	r3, [r7, #4]
 193 008c 5A1E     		subs	r2, r3, #1
 194 008e 7A60     		str	r2, [r7, #4]
 195 0090 002B     		cmp	r3, #0
 196 0092 F2D1     		bne	.L11
  61:/home/tom/Documents/WORK/upg57/startup.c ****     }
  62:/home/tom/Documents/WORK/upg57/startup.c **** }
 197              		.loc 1 62 0
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
  63:/home/tom/Documents/WORK/upg57/startup.c **** 
  64:/home/tom/Documents/WORK/upg57/startup.c **** 
  65:/home/tom/Documents/WORK/upg57/startup.c **** void delay_milli(unsigned int ms){
 215              		.loc 1 65 0
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
  66:/home/tom/Documents/WORK/upg57/startup.c **** 
  67:/home/tom/Documents/WORK/upg57/startup.c ****     while(ms--){
 228              		.loc 1 67 0
 229 00a4 02E0     		b	.L13
 230              	.L14:
  68:/home/tom/Documents/WORK/upg57/startup.c ****         delay_micro(10);
 231              		.loc 1 68 0
 232 00a6 0A20     		movs	r0, #10
 233 00a8 FFF7FEFF 		bl	delay_micro
 234              	.L13:
  67:/home/tom/Documents/WORK/upg57/startup.c ****         delay_micro(10);
 235              		.loc 1 67 0
 236 00ac 7B68     		ldr	r3, [r7, #4]
 237 00ae 5A1E     		subs	r2, r3, #1
 238 00b0 7A60     		str	r2, [r7, #4]
 239 00b2 002B     		cmp	r3, #0
 240 00b4 F7D1     		bne	.L14
  69:/home/tom/Documents/WORK/upg57/startup.c ****     }
  70:/home/tom/Documents/WORK/upg57/startup.c ****     
  71:/home/tom/Documents/WORK/upg57/startup.c **** }
 241              		.loc 1 71 0
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
  72:/home/tom/Documents/WORK/upg57/startup.c **** 
  73:/home/tom/Documents/WORK/upg57/startup.c **** 
  74:/home/tom/Documents/WORK/upg57/startup.c **** void ascii_ctrl_bit_set( unsigned char x){
 259              		.loc 1 74 0
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
  75:/home/tom/Documents/WORK/upg57/startup.c ****     *portOdrLow |= (B_SELECT | x);
 274              		.loc 1 75 0
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
  76:/home/tom/Documents/WORK/upg57/startup.c **** }
 287              		.loc 1 76 0
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
  77:/home/tom/Documents/WORK/upg57/startup.c **** 
  78:/home/tom/Documents/WORK/upg57/startup.c **** void ascii_ctrl_bit_clear(unsigned char x){
 309              		.loc 1 78 0
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
  79:/home/tom/Documents/WORK/upg57/startup.c ****     *portOdrLow &= (B_SELECT | ~x);
 324              		.loc 1 79 0
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
  80:/home/tom/Documents/WORK/upg57/startup.c **** }
 342              		.loc 1 80 0
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
 356              		.global	ascii_read_controller
 357              		.syntax unified
 358              		.code	16
 359              		.thumb_func
 360              		.fpu softvfp
 362              	ascii_read_controller:
 363              	.LFB7:
  81:/home/tom/Documents/WORK/upg57/startup.c **** 
  82:/home/tom/Documents/WORK/upg57/startup.c **** unsigned char ascii_read_controller( void ){
 364              		.loc 1 82 0
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
  83:/home/tom/Documents/WORK/upg57/startup.c **** 	unsigned char c;
  84:/home/tom/Documents/WORK/upg57/startup.c **** 	ascii_ctrl_bit_set( B_E );
 376              		.loc 1 84 0
 377 0132 4020     		movs	r0, #64
 378 0134 FFF7FEFF 		bl	ascii_ctrl_bit_set
  85:/home/tom/Documents/WORK/upg57/startup.c **** 	delay_250ns();
 379              		.loc 1 85 0
 380 0138 FFF7FEFF 		bl	delay_250ns
  86:/home/tom/Documents/WORK/upg57/startup.c **** 	delay_250ns();
 381              		.loc 1 86 0
 382 013c FFF7FEFF 		bl	delay_250ns
  87:/home/tom/Documents/WORK/upg57/startup.c **** 	c = *portIdrHigh;
 383              		.loc 1 87 0
 384 0140 064A     		ldr	r2, .L23
 385 0142 FB1D     		adds	r3, r7, #7
 386 0144 1278     		ldrb	r2, [r2]
 387 0146 1A70     		strb	r2, [r3]
  88:/home/tom/Documents/WORK/upg57/startup.c **** 	ascii_ctrl_bit_clear( B_E );
 388              		.loc 1 88 0
 389 0148 4020     		movs	r0, #64
 390 014a FFF7FEFF 		bl	ascii_ctrl_bit_clear
  89:/home/tom/Documents/WORK/upg57/startup.c **** 	return c;
 391              		.loc 1 89 0
 392 014e FB1D     		adds	r3, r7, #7
 393 0150 1B78     		ldrb	r3, [r3]
  90:/home/tom/Documents/WORK/upg57/startup.c **** }
 394              		.loc 1 90 0
 395 0152 1800     		movs	r0, r3
 396 0154 BD46     		mov	sp, r7
 397 0156 02B0     		add	sp, sp, #8
 398              		@ sp needed
 399 0158 80BD     		pop	{r7, pc}
 400              	.L24:
 401 015a C046     		.align	2
 402              	.L23:
 403 015c 10100240 		.word	1073877008
 404              		.cfi_endproc
 405              	.LFE7:
 407              		.align	1
 408              		.global	ascii_write_controller
 409              		.syntax unified
 410              		.code	16
 411              		.thumb_func
 412              		.fpu softvfp
 414              	ascii_write_controller:
 415              	.LFB8:
  91:/home/tom/Documents/WORK/upg57/startup.c **** 
  92:/home/tom/Documents/WORK/upg57/startup.c **** void ascii_write_controller( unsigned char c ){
 416              		.loc 1 92 0
 417              		.cfi_startproc
 418              		@ args = 0, pretend = 0, frame = 8
 419              		@ frame_needed = 1, uses_anonymous_args = 0
 420 0160 80B5     		push	{r7, lr}
 421              		.cfi_def_cfa_offset 8
 422              		.cfi_offset 7, -8
 423              		.cfi_offset 14, -4
 424 0162 82B0     		sub	sp, sp, #8
 425              		.cfi_def_cfa_offset 16
 426 0164 00AF     		add	r7, sp, #0
 427              		.cfi_def_cfa_register 7
 428 0166 0200     		movs	r2, r0
 429 0168 FB1D     		adds	r3, r7, #7
 430 016a 1A70     		strb	r2, [r3]
  93:/home/tom/Documents/WORK/upg57/startup.c **** 	delay_250ns();
 431              		.loc 1 93 0
 432 016c FFF7FEFF 		bl	delay_250ns
  94:/home/tom/Documents/WORK/upg57/startup.c ****     ascii_ctrl_bit_set( B_E ); // Synchronization signal =1
 433              		.loc 1 94 0
 434 0170 4020     		movs	r0, #64
 435 0172 FFF7FEFF 		bl	ascii_ctrl_bit_set
  95:/home/tom/Documents/WORK/upg57/startup.c ****     *portOdrHigh = c;          // Ger kommandot till porten
 436              		.loc 1 95 0
 437 0176 074A     		ldr	r2, .L26
 438 0178 FB1D     		adds	r3, r7, #7
 439 017a 1B78     		ldrb	r3, [r3]
 440 017c 1370     		strb	r3, [r2]
  96:/home/tom/Documents/WORK/upg57/startup.c **** 	delay_250ns();
 441              		.loc 1 96 0
 442 017e FFF7FEFF 		bl	delay_250ns
  97:/home/tom/Documents/WORK/upg57/startup.c ****     ascii_ctrl_bit_clear( B_E ); // Stänger av synchronizatoin.
 443              		.loc 1 97 0
 444 0182 4020     		movs	r0, #64
 445 0184 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  98:/home/tom/Documents/WORK/upg57/startup.c ****     delay_250ns();
 446              		.loc 1 98 0
 447 0188 FFF7FEFF 		bl	delay_250ns
  99:/home/tom/Documents/WORK/upg57/startup.c **** }
 448              		.loc 1 99 0
 449 018c C046     		nop
 450 018e BD46     		mov	sp, r7
 451 0190 02B0     		add	sp, sp, #8
 452              		@ sp needed
 453 0192 80BD     		pop	{r7, pc}
 454              	.L27:
 455              		.align	2
 456              	.L26:
 457 0194 15100240 		.word	1073877013
 458              		.cfi_endproc
 459              	.LFE8:
 461              		.align	1
 462              		.global	ascii_read_status
 463              		.syntax unified
 464              		.code	16
 465              		.thumb_func
 466              		.fpu softvfp
 468              	ascii_read_status:
 469              	.LFB9:
 100:/home/tom/Documents/WORK/upg57/startup.c **** 
 101:/home/tom/Documents/WORK/upg57/startup.c **** unsigned char ascii_read_status(){
 470              		.loc 1 101 0
 471              		.cfi_startproc
 472              		@ args = 0, pretend = 0, frame = 8
 473              		@ frame_needed = 1, uses_anonymous_args = 0
 474 0198 90B5     		push	{r4, r7, lr}
 475              		.cfi_def_cfa_offset 12
 476              		.cfi_offset 4, -12
 477              		.cfi_offset 7, -8
 478              		.cfi_offset 14, -4
 479 019a 83B0     		sub	sp, sp, #12
 480              		.cfi_def_cfa_offset 24
 481 019c 00AF     		add	r7, sp, #0
 482              		.cfi_def_cfa_register 7
 102:/home/tom/Documents/WORK/upg57/startup.c **** 	unsigned char c;
 103:/home/tom/Documents/WORK/upg57/startup.c **** 	*portModerHigh = 0x0000;   //GÖR OM PORTEN TILL INGÅNGAR
 483              		.loc 1 103 0
 484 019e 0B4B     		ldr	r3, .L30
 485 01a0 0022     		movs	r2, #0
 486 01a2 1A80     		strh	r2, [r3]
 104:/home/tom/Documents/WORK/upg57/startup.c **** 	ascii_ctrl_bit_set( B_RW );   // ETT STÄLL READ/WRITE
 487              		.loc 1 104 0
 488 01a4 0220     		movs	r0, #2
 489 01a6 FFF7FEFF 		bl	ascii_ctrl_bit_set
 105:/home/tom/Documents/WORK/upg57/startup.c **** 	ascii_ctrl_bit_clear( B_RS );  //NOLLSTÄLL READ/ SET
 490              		.loc 1 105 0
 491 01aa 0120     		movs	r0, #1
 492 01ac FFF7FEFF 		bl	ascii_ctrl_bit_clear
 106:/home/tom/Documents/WORK/upg57/startup.c **** 	c = ascii_read_controller( );
 493              		.loc 1 106 0
 494 01b0 FC1D     		adds	r4, r7, #7
 495 01b2 FFF7FEFF 		bl	ascii_read_controller
 496 01b6 0300     		movs	r3, r0
 497 01b8 2370     		strb	r3, [r4]
 107:/home/tom/Documents/WORK/upg57/startup.c **** 	*portModerHigh = 0x5555;    //GÖR OM PORTEN TILL UTGÅNGAR
 498              		.loc 1 107 0
 499 01ba 044B     		ldr	r3, .L30
 500 01bc 044A     		ldr	r2, .L30+4
 501 01be 1A80     		strh	r2, [r3]
 108:/home/tom/Documents/WORK/upg57/startup.c **** 	return c;
 502              		.loc 1 108 0
 503 01c0 FB1D     		adds	r3, r7, #7
 504 01c2 1B78     		ldrb	r3, [r3]
 109:/home/tom/Documents/WORK/upg57/startup.c **** }
 505              		.loc 1 109 0
 506 01c4 1800     		movs	r0, r3
 507 01c6 BD46     		mov	sp, r7
 508 01c8 03B0     		add	sp, sp, #12
 509              		@ sp needed
 510 01ca 90BD     		pop	{r4, r7, pc}
 511              	.L31:
 512              		.align	2
 513              	.L30:
 514 01cc 04100240 		.word	1073876996
 515 01d0 55550000 		.word	21845
 516              		.cfi_endproc
 517              	.LFE9:
 519              		.align	1
 520              		.global	ascii_write_cmd
 521              		.syntax unified
 522              		.code	16
 523              		.thumb_func
 524              		.fpu softvfp
 526              	ascii_write_cmd:
 527              	.LFB10:
 110:/home/tom/Documents/WORK/upg57/startup.c **** 
 111:/home/tom/Documents/WORK/upg57/startup.c **** void ascii_write_cmd ( unsigned char command){
 528              		.loc 1 111 0
 529              		.cfi_startproc
 530              		@ args = 0, pretend = 0, frame = 8
 531              		@ frame_needed = 1, uses_anonymous_args = 0
 532 01d4 80B5     		push	{r7, lr}
 533              		.cfi_def_cfa_offset 8
 534              		.cfi_offset 7, -8
 535              		.cfi_offset 14, -4
 536 01d6 82B0     		sub	sp, sp, #8
 537              		.cfi_def_cfa_offset 16
 538 01d8 00AF     		add	r7, sp, #0
 539              		.cfi_def_cfa_register 7
 540 01da 0200     		movs	r2, r0
 541 01dc FB1D     		adds	r3, r7, #7
 542 01de 1A70     		strb	r2, [r3]
 112:/home/tom/Documents/WORK/upg57/startup.c ****     ascii_ctrl_bit_clear(B_RS);
 543              		.loc 1 112 0
 544 01e0 0120     		movs	r0, #1
 545 01e2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 113:/home/tom/Documents/WORK/upg57/startup.c ****     ascii_ctrl_bit_clear(B_RW);
 546              		.loc 1 113 0
 547 01e6 0220     		movs	r0, #2
 548 01e8 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 114:/home/tom/Documents/WORK/upg57/startup.c ****     ascii_write_controller(command);
 549              		.loc 1 114 0
 550 01ec FB1D     		adds	r3, r7, #7
 551 01ee 1B78     		ldrb	r3, [r3]
 552 01f0 1800     		movs	r0, r3
 553 01f2 FFF7FEFF 		bl	ascii_write_controller
 115:/home/tom/Documents/WORK/upg57/startup.c **** }
 554              		.loc 1 115 0
 555 01f6 C046     		nop
 556 01f8 BD46     		mov	sp, r7
 557 01fa 02B0     		add	sp, sp, #8
 558              		@ sp needed
 559 01fc 80BD     		pop	{r7, pc}
 560              		.cfi_endproc
 561              	.LFE10:
 563              		.align	1
 564              		.global	ascii_write_data
 565              		.syntax unified
 566              		.code	16
 567              		.thumb_func
 568              		.fpu softvfp
 570              	ascii_write_data:
 571              	.LFB11:
 116:/home/tom/Documents/WORK/upg57/startup.c **** 
 117:/home/tom/Documents/WORK/upg57/startup.c **** void ascii_write_data (unsigned char data){
 572              		.loc 1 117 0
 573              		.cfi_startproc
 574              		@ args = 0, pretend = 0, frame = 8
 575              		@ frame_needed = 1, uses_anonymous_args = 0
 576 01fe 80B5     		push	{r7, lr}
 577              		.cfi_def_cfa_offset 8
 578              		.cfi_offset 7, -8
 579              		.cfi_offset 14, -4
 580 0200 82B0     		sub	sp, sp, #8
 581              		.cfi_def_cfa_offset 16
 582 0202 00AF     		add	r7, sp, #0
 583              		.cfi_def_cfa_register 7
 584 0204 0200     		movs	r2, r0
 585 0206 FB1D     		adds	r3, r7, #7
 586 0208 1A70     		strb	r2, [r3]
 118:/home/tom/Documents/WORK/upg57/startup.c ****     ascii_ctrl_bit_clear(B_RW);
 587              		.loc 1 118 0
 588 020a 0220     		movs	r0, #2
 589 020c FFF7FEFF 		bl	ascii_ctrl_bit_clear
 119:/home/tom/Documents/WORK/upg57/startup.c ****     ascii_ctrl_bit_set(B_RS);
 590              		.loc 1 119 0
 591 0210 0120     		movs	r0, #1
 592 0212 FFF7FEFF 		bl	ascii_ctrl_bit_set
 120:/home/tom/Documents/WORK/upg57/startup.c ****     ascii_write_controller(data);
 593              		.loc 1 120 0
 594 0216 FB1D     		adds	r3, r7, #7
 595 0218 1B78     		ldrb	r3, [r3]
 596 021a 1800     		movs	r0, r3
 597 021c FFF7FEFF 		bl	ascii_write_controller
 121:/home/tom/Documents/WORK/upg57/startup.c **** }
 598              		.loc 1 121 0
 599 0220 C046     		nop
 600 0222 BD46     		mov	sp, r7
 601 0224 02B0     		add	sp, sp, #8
 602              		@ sp needed
 603 0226 80BD     		pop	{r7, pc}
 604              		.cfi_endproc
 605              	.LFE11:
 607              		.align	1
 608              		.global	ascii_read_data
 609              		.syntax unified
 610              		.code	16
 611              		.thumb_func
 612              		.fpu softvfp
 614              	ascii_read_data:
 615              	.LFB12:
 122:/home/tom/Documents/WORK/upg57/startup.c **** 
 123:/home/tom/Documents/WORK/upg57/startup.c **** void ascii_read_data(void){
 616              		.loc 1 123 0
 617              		.cfi_startproc
 618              		@ args = 0, pretend = 0, frame = 8
 619              		@ frame_needed = 1, uses_anonymous_args = 0
 620 0228 90B5     		push	{r4, r7, lr}
 621              		.cfi_def_cfa_offset 12
 622              		.cfi_offset 4, -12
 623              		.cfi_offset 7, -8
 624              		.cfi_offset 14, -4
 625 022a 83B0     		sub	sp, sp, #12
 626              		.cfi_def_cfa_offset 24
 627 022c 00AF     		add	r7, sp, #0
 628              		.cfi_def_cfa_register 7
 124:/home/tom/Documents/WORK/upg57/startup.c ****     unsigned char c;
 125:/home/tom/Documents/WORK/upg57/startup.c ****     *portModerHigh = 0x0000;
 629              		.loc 1 125 0
 630 022e 0A4B     		ldr	r3, .L35
 631 0230 0022     		movs	r2, #0
 632 0232 1A80     		strh	r2, [r3]
 126:/home/tom/Documents/WORK/upg57/startup.c ****     ascii_ctrl_bit_set(B_RS);
 633              		.loc 1 126 0
 634 0234 0120     		movs	r0, #1
 635 0236 FFF7FEFF 		bl	ascii_ctrl_bit_set
 127:/home/tom/Documents/WORK/upg57/startup.c ****     ascii_ctrl_bit_set(B_RW);
 636              		.loc 1 127 0
 637 023a 0220     		movs	r0, #2
 638 023c FFF7FEFF 		bl	ascii_ctrl_bit_set
 128:/home/tom/Documents/WORK/upg57/startup.c ****     c = ascii_read_controller();
 639              		.loc 1 128 0
 640 0240 FC1D     		adds	r4, r7, #7
 641 0242 FFF7FEFF 		bl	ascii_read_controller
 642 0246 0300     		movs	r3, r0
 643 0248 2370     		strb	r3, [r4]
 129:/home/tom/Documents/WORK/upg57/startup.c ****     *portModerHigh = 0x5555;
 644              		.loc 1 129 0
 645 024a 034B     		ldr	r3, .L35
 646 024c 034A     		ldr	r2, .L35+4
 647 024e 1A80     		strh	r2, [r3]
 130:/home/tom/Documents/WORK/upg57/startup.c **** }
 648              		.loc 1 130 0
 649 0250 C046     		nop
 650 0252 BD46     		mov	sp, r7
 651 0254 03B0     		add	sp, sp, #12
 652              		@ sp needed
 653 0256 90BD     		pop	{r4, r7, pc}
 654              	.L36:
 655              		.align	2
 656              	.L35:
 657 0258 04100240 		.word	1073876996
 658 025c 55550000 		.word	21845
 659              		.cfi_endproc
 660              	.LFE12:
 662              		.align	1
 663              		.global	ascii_command
 664              		.syntax unified
 665              		.code	16
 666              		.thumb_func
 667              		.fpu softvfp
 669              	ascii_command:
 670              	.LFB13:
 131:/home/tom/Documents/WORK/upg57/startup.c **** 
 132:/home/tom/Documents/WORK/upg57/startup.c **** void ascii_command(unsigned char cmd){
 671              		.loc 1 132 0
 672              		.cfi_startproc
 673              		@ args = 0, pretend = 0, frame = 8
 674              		@ frame_needed = 1, uses_anonymous_args = 0
 675 0260 80B5     		push	{r7, lr}
 676              		.cfi_def_cfa_offset 8
 677              		.cfi_offset 7, -8
 678              		.cfi_offset 14, -4
 679 0262 82B0     		sub	sp, sp, #8
 680              		.cfi_def_cfa_offset 16
 681 0264 00AF     		add	r7, sp, #0
 682              		.cfi_def_cfa_register 7
 683 0266 0200     		movs	r2, r0
 684 0268 FB1D     		adds	r3, r7, #7
 685 026a 1A70     		strb	r2, [r3]
 133:/home/tom/Documents/WORK/upg57/startup.c **** 	while ((ascii_read_status() & 0x80) == 0x80) {}
 686              		.loc 1 133 0
 687 026c C046     		nop
 688              	.L38:
 689              		.loc 1 133 0 is_stmt 0 discriminator 1
 690 026e FFF7FEFF 		bl	ascii_read_status
 691 0272 0300     		movs	r3, r0
 692 0274 1A00     		movs	r2, r3
 693 0276 8023     		movs	r3, #128
 694 0278 1340     		ands	r3, r2
 695 027a 802B     		cmp	r3, #128
 696 027c F7D0     		beq	.L38
 134:/home/tom/Documents/WORK/upg57/startup.c **** 	delay_micro(8);
 697              		.loc 1 134 0 is_stmt 1
 698 027e 0820     		movs	r0, #8
 699 0280 FFF7FEFF 		bl	delay_micro
 135:/home/tom/Documents/WORK/upg57/startup.c **** 	ascii_write_cmd(cmd);
 700              		.loc 1 135 0
 701 0284 FB1D     		adds	r3, r7, #7
 702 0286 1B78     		ldrb	r3, [r3]
 703 0288 1800     		movs	r0, r3
 704 028a FFF7FEFF 		bl	ascii_write_cmd
 136:/home/tom/Documents/WORK/upg57/startup.c **** 	delay_milli(2);
 705              		.loc 1 136 0
 706 028e 0220     		movs	r0, #2
 707 0290 FFF7FEFF 		bl	delay_milli
 137:/home/tom/Documents/WORK/upg57/startup.c **** }
 708              		.loc 1 137 0
 709 0294 C046     		nop
 710 0296 BD46     		mov	sp, r7
 711 0298 02B0     		add	sp, sp, #8
 712              		@ sp needed
 713 029a 80BD     		pop	{r7, pc}
 714              		.cfi_endproc
 715              	.LFE13:
 717              		.align	1
 718              		.global	ascii_init
 719              		.syntax unified
 720              		.code	16
 721              		.thumb_func
 722              		.fpu softvfp
 724              	ascii_init:
 725              	.LFB14:
 138:/home/tom/Documents/WORK/upg57/startup.c **** 
 139:/home/tom/Documents/WORK/upg57/startup.c **** void ascii_init(void){
 726              		.loc 1 139 0
 727              		.cfi_startproc
 728              		@ args = 0, pretend = 0, frame = 0
 729              		@ frame_needed = 1, uses_anonymous_args = 0
 730 029c 80B5     		push	{r7, lr}
 731              		.cfi_def_cfa_offset 8
 732              		.cfi_offset 7, -8
 733              		.cfi_offset 14, -4
 734 029e 00AF     		add	r7, sp, #0
 735              		.cfi_def_cfa_register 7
 140:/home/tom/Documents/WORK/upg57/startup.c ****     ascii_command(0x38);	//Function set
 736              		.loc 1 140 0
 737 02a0 3820     		movs	r0, #56
 738 02a2 FFF7FEFF 		bl	ascii_command
 141:/home/tom/Documents/WORK/upg57/startup.c **** 	ascii_command(0x0E);	//Display control
 739              		.loc 1 141 0
 740 02a6 0E20     		movs	r0, #14
 741 02a8 FFF7FEFF 		bl	ascii_command
 142:/home/tom/Documents/WORK/upg57/startup.c **** 	ascii_command(0x01);	//Clear Display
 742              		.loc 1 142 0
 743 02ac 0120     		movs	r0, #1
 744 02ae FFF7FEFF 		bl	ascii_command
 143:/home/tom/Documents/WORK/upg57/startup.c **** 	ascii_command(0x04);	//Entry mode set
 745              		.loc 1 143 0
 746 02b2 0420     		movs	r0, #4
 747 02b4 FFF7FEFF 		bl	ascii_command
 144:/home/tom/Documents/WORK/upg57/startup.c **** }
 748              		.loc 1 144 0
 749 02b8 C046     		nop
 750 02ba BD46     		mov	sp, r7
 751              		@ sp needed
 752 02bc 80BD     		pop	{r7, pc}
 753              		.cfi_endproc
 754              	.LFE14:
 756              		.align	1
 757              		.global	ascii_write_char
 758              		.syntax unified
 759              		.code	16
 760              		.thumb_func
 761              		.fpu softvfp
 763              	ascii_write_char:
 764              	.LFB15:
 145:/home/tom/Documents/WORK/upg57/startup.c **** 
 146:/home/tom/Documents/WORK/upg57/startup.c **** void ascii_write_char(unsigned char c){
 765              		.loc 1 146 0
 766              		.cfi_startproc
 767              		@ args = 0, pretend = 0, frame = 8
 768              		@ frame_needed = 1, uses_anonymous_args = 0
 769 02be 80B5     		push	{r7, lr}
 770              		.cfi_def_cfa_offset 8
 771              		.cfi_offset 7, -8
 772              		.cfi_offset 14, -4
 773 02c0 82B0     		sub	sp, sp, #8
 774              		.cfi_def_cfa_offset 16
 775 02c2 00AF     		add	r7, sp, #0
 776              		.cfi_def_cfa_register 7
 777 02c4 0200     		movs	r2, r0
 778 02c6 FB1D     		adds	r3, r7, #7
 779 02c8 1A70     		strb	r2, [r3]
 147:/home/tom/Documents/WORK/upg57/startup.c **** 	while ((ascii_read_status() & 0x80) == 0x80) {}
 780              		.loc 1 147 0
 781 02ca C046     		nop
 782              	.L41:
 783              		.loc 1 147 0 is_stmt 0 discriminator 1
 784 02cc FFF7FEFF 		bl	ascii_read_status
 785 02d0 0300     		movs	r3, r0
 786 02d2 1A00     		movs	r2, r3
 787 02d4 8023     		movs	r3, #128
 788 02d6 1340     		ands	r3, r2
 789 02d8 802B     		cmp	r3, #128
 790 02da F7D0     		beq	.L41
 148:/home/tom/Documents/WORK/upg57/startup.c **** 	delay_micro(8);
 791              		.loc 1 148 0 is_stmt 1
 792 02dc 0820     		movs	r0, #8
 793 02de FFF7FEFF 		bl	delay_micro
 149:/home/tom/Documents/WORK/upg57/startup.c **** 	ascii_write_data(c);
 794              		.loc 1 149 0
 795 02e2 FB1D     		adds	r3, r7, #7
 796 02e4 1B78     		ldrb	r3, [r3]
 797 02e6 1800     		movs	r0, r3
 798 02e8 FFF7FEFF 		bl	ascii_write_data
 150:/home/tom/Documents/WORK/upg57/startup.c **** 	delay_micro(43);
 799              		.loc 1 150 0
 800 02ec 2B20     		movs	r0, #43
 801 02ee FFF7FEFF 		bl	delay_micro
 151:/home/tom/Documents/WORK/upg57/startup.c **** }
 802              		.loc 1 151 0
 803 02f2 C046     		nop
 804 02f4 BD46     		mov	sp, r7
 805 02f6 02B0     		add	sp, sp, #8
 806              		@ sp needed
 807 02f8 80BD     		pop	{r7, pc}
 808              		.cfi_endproc
 809              	.LFE15:
 811              		.align	1
 812              		.global	ascii_gotoxy
 813              		.syntax unified
 814              		.code	16
 815              		.thumb_func
 816              		.fpu softvfp
 818              	ascii_gotoxy:
 819              	.LFB16:
 152:/home/tom/Documents/WORK/upg57/startup.c **** 
 153:/home/tom/Documents/WORK/upg57/startup.c **** void ascii_gotoxy(int x, int y){
 820              		.loc 1 153 0
 821              		.cfi_startproc
 822              		@ args = 0, pretend = 0, frame = 16
 823              		@ frame_needed = 1, uses_anonymous_args = 0
 824 02fa 80B5     		push	{r7, lr}
 825              		.cfi_def_cfa_offset 8
 826              		.cfi_offset 7, -8
 827              		.cfi_offset 14, -4
 828 02fc 84B0     		sub	sp, sp, #16
 829              		.cfi_def_cfa_offset 24
 830 02fe 00AF     		add	r7, sp, #0
 831              		.cfi_def_cfa_register 7
 832 0300 7860     		str	r0, [r7, #4]
 833 0302 3960     		str	r1, [r7]
 154:/home/tom/Documents/WORK/upg57/startup.c **** 	unsigned char adress = x-1;
 834              		.loc 1 154 0
 835 0304 7B68     		ldr	r3, [r7, #4]
 836 0306 DAB2     		uxtb	r2, r3
 837 0308 0F23     		movs	r3, #15
 838 030a FB18     		adds	r3, r7, r3
 839 030c 013A     		subs	r2, r2, #1
 840 030e 1A70     		strb	r2, [r3]
 155:/home/tom/Documents/WORK/upg57/startup.c **** 	if (y == 2)
 841              		.loc 1 155 0
 842 0310 3B68     		ldr	r3, [r7]
 843 0312 022B     		cmp	r3, #2
 844 0314 05D1     		bne	.L43
 156:/home/tom/Documents/WORK/upg57/startup.c **** 		adress += 0x40;
 845              		.loc 1 156 0
 846 0316 0F22     		movs	r2, #15
 847 0318 BB18     		adds	r3, r7, r2
 848 031a BA18     		adds	r2, r7, r2
 849 031c 1278     		ldrb	r2, [r2]
 850 031e 4032     		adds	r2, r2, #64
 851 0320 1A70     		strb	r2, [r3]
 852              	.L43:
 157:/home/tom/Documents/WORK/upg57/startup.c **** 	ascii_write_cmd(0x80 | adress);
 853              		.loc 1 157 0
 854 0322 0F23     		movs	r3, #15
 855 0324 FB18     		adds	r3, r7, r3
 856 0326 1B78     		ldrb	r3, [r3]
 857 0328 8022     		movs	r2, #128
 858 032a 5242     		rsbs	r2, r2, #0
 859 032c 1343     		orrs	r3, r2
 860 032e DBB2     		uxtb	r3, r3
 861 0330 1800     		movs	r0, r3
 862 0332 FFF7FEFF 		bl	ascii_write_cmd
 158:/home/tom/Documents/WORK/upg57/startup.c **** }
 863              		.loc 1 158 0
 864 0336 C046     		nop
 865 0338 BD46     		mov	sp, r7
 866 033a 04B0     		add	sp, sp, #16
 867              		@ sp needed
 868 033c 80BD     		pop	{r7, pc}
 869              		.cfi_endproc
 870              	.LFE16:
 872              		.section	.rodata
 873              		.align	2
 874              	.LC0:
 875 0000 416C6661 		.ascii	"Alfanumerisk \000"
 875      6E756D65 
 875      7269736B 
 875      2000
 876 000e 0000     		.align	2
 877              	.LC2:
 878 0010 44697370 		.ascii	"Display - test\000"
 878      6C617920 
 878      2D207465 
 878      737400
 879              		.text
 880              		.align	1
 881              		.global	main
 882              		.syntax unified
 883              		.code	16
 884              		.thumb_func
 885              		.fpu softvfp
 887              	main:
 888              	.LFB17:
 159:/home/tom/Documents/WORK/upg57/startup.c **** 
 160:/home/tom/Documents/WORK/upg57/startup.c **** void main(void)
 161:/home/tom/Documents/WORK/upg57/startup.c **** {
 889              		.loc 1 161 0
 890              		.cfi_startproc
 891              		@ args = 0, pretend = 0, frame = 40
 892              		@ frame_needed = 1, uses_anonymous_args = 0
 893 033e B0B5     		push	{r4, r5, r7, lr}
 894              		.cfi_def_cfa_offset 16
 895              		.cfi_offset 4, -16
 896              		.cfi_offset 5, -12
 897              		.cfi_offset 7, -8
 898              		.cfi_offset 14, -4
 899 0340 8AB0     		sub	sp, sp, #40
 900              		.cfi_def_cfa_offset 56
 901 0342 00AF     		add	r7, sp, #0
 902              		.cfi_def_cfa_register 7
 162:/home/tom/Documents/WORK/upg57/startup.c **** 	char *s;
 163:/home/tom/Documents/WORK/upg57/startup.c **** 	char test1[] = "Alfanumerisk ";
 903              		.loc 1 163 0
 904 0344 1424     		movs	r4, #20
 905 0346 3B19     		adds	r3, r7, r4
 906 0348 1C4A     		ldr	r2, .L49
 907 034a 23CA     		ldmia	r2!, {r0, r1, r5}
 908 034c 23C3     		stmia	r3!, {r0, r1, r5}
 909 034e 1288     		ldrh	r2, [r2]
 910 0350 1A80     		strh	r2, [r3]
 164:/home/tom/Documents/WORK/upg57/startup.c **** 	char test2[] = "Display - test";
 911              		.loc 1 164 0
 912 0352 3B1D     		adds	r3, r7, #4
 913 0354 1A4A     		ldr	r2, .L49+4
 914 0356 23CA     		ldmia	r2!, {r0, r1, r5}
 915 0358 23C3     		stmia	r3!, {r0, r1, r5}
 916 035a 1188     		ldrh	r1, [r2]
 917 035c 1980     		strh	r1, [r3]
 918 035e 9278     		ldrb	r2, [r2, #2]
 919 0360 9A70     		strb	r2, [r3, #2]
 165:/home/tom/Documents/WORK/upg57/startup.c **** 	  
 166:/home/tom/Documents/WORK/upg57/startup.c **** 	init_app();
 920              		.loc 1 166 0
 921 0362 FFF7FEFF 		bl	init_app
 167:/home/tom/Documents/WORK/upg57/startup.c **** 	ascii_init();
 922              		.loc 1 167 0
 923 0366 FFF7FEFF 		bl	ascii_init
 168:/home/tom/Documents/WORK/upg57/startup.c **** 	ascii_gotoxy(1,1);
 924              		.loc 1 168 0
 925 036a 0121     		movs	r1, #1
 926 036c 0120     		movs	r0, #1
 927 036e FFF7FEFF 		bl	ascii_gotoxy
 169:/home/tom/Documents/WORK/upg57/startup.c **** 	s = test1;
 928              		.loc 1 169 0
 929 0372 3B19     		adds	r3, r7, r4
 930 0374 7B62     		str	r3, [r7, #36]
 170:/home/tom/Documents/WORK/upg57/startup.c **** 	
 171:/home/tom/Documents/WORK/upg57/startup.c **** 	while(*s)
 931              		.loc 1 171 0
 932 0376 06E0     		b	.L45
 933              	.L46:
 172:/home/tom/Documents/WORK/upg57/startup.c **** 		ascii_write_char(*s++);
 934              		.loc 1 172 0
 935 0378 7B6A     		ldr	r3, [r7, #36]
 936 037a 5A1C     		adds	r2, r3, #1
 937 037c 7A62     		str	r2, [r7, #36]
 938 037e 1B78     		ldrb	r3, [r3]
 939 0380 1800     		movs	r0, r3
 940 0382 FFF7FEFF 		bl	ascii_write_char
 941              	.L45:
 171:/home/tom/Documents/WORK/upg57/startup.c **** 		ascii_write_char(*s++);
 942              		.loc 1 171 0
 943 0386 7B6A     		ldr	r3, [r7, #36]
 944 0388 1B78     		ldrb	r3, [r3]
 945 038a 002B     		cmp	r3, #0
 946 038c F4D1     		bne	.L46
 173:/home/tom/Documents/WORK/upg57/startup.c **** 	ascii_gotoxy(1,2);
 947              		.loc 1 173 0
 948 038e 0221     		movs	r1, #2
 949 0390 0120     		movs	r0, #1
 950 0392 FFF7FEFF 		bl	ascii_gotoxy
 174:/home/tom/Documents/WORK/upg57/startup.c **** 	s = test2;
 951              		.loc 1 174 0
 952 0396 3B1D     		adds	r3, r7, #4
 953 0398 7B62     		str	r3, [r7, #36]
 175:/home/tom/Documents/WORK/upg57/startup.c **** 	
 176:/home/tom/Documents/WORK/upg57/startup.c **** 	while(*s)
 954              		.loc 1 176 0
 955 039a 06E0     		b	.L47
 956              	.L48:
 177:/home/tom/Documents/WORK/upg57/startup.c **** 		ascii_write_char(*s++);
 957              		.loc 1 177 0
 958 039c 7B6A     		ldr	r3, [r7, #36]
 959 039e 5A1C     		adds	r2, r3, #1
 960 03a0 7A62     		str	r2, [r7, #36]
 961 03a2 1B78     		ldrb	r3, [r3]
 962 03a4 1800     		movs	r0, r3
 963 03a6 FFF7FEFF 		bl	ascii_write_char
 964              	.L47:
 176:/home/tom/Documents/WORK/upg57/startup.c **** 		ascii_write_char(*s++);
 965              		.loc 1 176 0
 966 03aa 7B6A     		ldr	r3, [r7, #36]
 967 03ac 1B78     		ldrb	r3, [r3]
 968 03ae 002B     		cmp	r3, #0
 969 03b0 F4D1     		bne	.L48
 178:/home/tom/Documents/WORK/upg57/startup.c **** }...
 970              		.loc 1 178 0
 971 03b2 C046     		nop
 972 03b4 BD46     		mov	sp, r7
 973 03b6 0AB0     		add	sp, sp, #40
 974              		@ sp needed
 975 03b8 B0BD     		pop	{r4, r5, r7, pc}
 976              	.L50:
 977 03ba C046     		.align	2
 978              	.L49:
 979 03bc 00000000 		.word	.LC0
 980 03c0 10000000 		.word	.LC2
 981              		.cfi_endproc
 982              	.LFE17:
 984              	.Letext0:
