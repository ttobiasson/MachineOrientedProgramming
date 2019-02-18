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
  25              		.file 1 "/home/tom/Documents/WORK/upg57_2/startup.c"
   1:/home/tom/Documents/WORK/upg57_2/startup.c **** /*
   2:/home/tom/Documents/WORK/upg57_2/startup.c ****  * 	startup.c
   3:/home/tom/Documents/WORK/upg57_2/startup.c ****  *
   4:/home/tom/Documents/WORK/upg57_2/startup.c ****  */
   5:/home/tom/Documents/WORK/upg57_2/startup.c ****  
   6:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define PORT_BASE_E 0x40021000
   7:/home/tom/Documents/WORK/upg57_2/startup.c **** 			/* Definiera word-adresser för initiering*/
   8:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define portModer ((volatile unsigned int*)PORT_BASE_E)
   9:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define portModerHigh ((volatile unsigned char*)PORT_BASE_E+0x01)
  10:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define portOtyper ((volatile unsigned int*) PORT_BASE_E+0x04)
  11:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define Ospeedr    ((volatile unsigned int*) PORT_BASE_E+0x08)
  12:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define portPupdr  ((volatile unsigned int*) PORT_BASE_E+0x0C)
  13:/home/tom/Documents/WORK/upg57_2/startup.c **** 			/*Definiera byte-adresser för data och styrregister*/
  14:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define portIdrLow ((volatile unsigned char*) PORT_BASE_E+0x10)
  15:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define portIdrHigh ((volatile unsigned char*) PORT_BASE_E+0x10)
  16:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define portOdrLow  ((volatile unsigned char*) PORT_BASE_E+0x14)
  17:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define portOdrHigh ((volatile unsigned char*) PORT_BASE_E+0x15)
  18:/home/tom/Documents/WORK/upg57_2/startup.c **** 			/*Definiera lämpliga definitioner för de olika bitarna i styrregistret*/
  19:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define B_E 0x40  		/*ENABLE SIGNAL*/
  20:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define B_SELECT 4 	/*SELECT ASCII-DISPLAY*/
  21:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define B_RW 2    	 	/* 0 = writem, 1 = read*/
  22:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define B_RS 1     	/* 0 = control, 1 =data*/
  23:/home/tom/Documents/WORK/upg57_2/startup.c **** 			/*STK DELAY*/
  24:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define STK_CTRL ((volatile unsigned int*)(0xE000E010))
  25:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define STK_LOAD ((volatile unsigned int*)(0xE000E014))
  26:/home/tom/Documents/WORK/upg57_2/startup.c ****  #define STK_VAL  ((volatile unsigned int*)(0xE000E018))
  27:/home/tom/Documents/WORK/upg57_2/startup.c ****  
  28:/home/tom/Documents/WORK/upg57_2/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  29:/home/tom/Documents/WORK/upg57_2/startup.c **** 
  30:/home/tom/Documents/WORK/upg57_2/startup.c **** void startup ( void )
  31:/home/tom/Documents/WORK/upg57_2/startup.c **** {
  26              		.loc 1 31 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  32:/home/tom/Documents/WORK/upg57_2/startup.c **** __asm volatile(
  31              		.loc 1 32 0
  32              		.syntax divided
  33              	@ 32 "/home/tom/Documents/WORK/upg57_2/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  33:/home/tom/Documents/WORK/upg57_2/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  34:/home/tom/Documents/WORK/upg57_2/startup.c **** 	" MOV SP,R0\n"
  35:/home/tom/Documents/WORK/upg57_2/startup.c **** 	" BL main\n"				/* call main */
  36:/home/tom/Documents/WORK/upg57_2/startup.c **** 	"_exit: B .\n"				/* never return */
  37:/home/tom/Documents/WORK/upg57_2/startup.c **** 	) ;
  38:/home/tom/Documents/WORK/upg57_2/startup.c **** }
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
  39:/home/tom/Documents/WORK/upg57_2/startup.c **** 
  40:/home/tom/Documents/WORK/upg57_2/startup.c **** void init_app(){
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
  41:/home/tom/Documents/WORK/upg57_2/startup.c ****     *portModer = 0x55555555;
  67              		.loc 1 41 0
  68 0004 054B     		ldr	r3, .L3
  69 0006 064A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  42:/home/tom/Documents/WORK/upg57_2/startup.c ****     *portOtyper =0x00000000;
  71              		.loc 1 42 0
  72 000a 064B     		ldr	r3, .L3+8
  73 000c 0022     		movs	r2, #0
  74 000e 1A60     		str	r2, [r3]
  43:/home/tom/Documents/WORK/upg57_2/startup.c ****     *Ospeedr    =0x55555555;
  75              		.loc 1 43 0
  76 0010 054B     		ldr	r3, .L3+12
  77 0012 034A     		ldr	r2, .L3+4
  78 0014 1A60     		str	r2, [r3]
  44:/home/tom/Documents/WORK/upg57_2/startup.c **** }
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
  45:/home/tom/Documents/WORK/upg57_2/startup.c **** 
  46:/home/tom/Documents/WORK/upg57_2/startup.c **** void delay_250ns(void){
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
  47:/home/tom/Documents/WORK/upg57_2/startup.c ****     *STK_CTRL = 0;
 113              		.loc 1 47 0
 114 0030 0C4B     		ldr	r3, .L7
 115 0032 0022     		movs	r2, #0
 116 0034 1A60     		str	r2, [r3]
  48:/home/tom/Documents/WORK/upg57_2/startup.c ****     *STK_LOAD = ((168/4)-1);
 117              		.loc 1 48 0
 118 0036 0C4B     		ldr	r3, .L7+4
 119 0038 2922     		movs	r2, #41
 120 003a 1A60     		str	r2, [r3]
  49:/home/tom/Documents/WORK/upg57_2/startup.c ****     *STK_VAL  = 0;
 121              		.loc 1 49 0
 122 003c 0B4B     		ldr	r3, .L7+8
 123 003e 0022     		movs	r2, #0
 124 0040 1A60     		str	r2, [r3]
  50:/home/tom/Documents/WORK/upg57_2/startup.c ****     *STK_CTRL = 5;
 125              		.loc 1 50 0
 126 0042 084B     		ldr	r3, .L7
 127 0044 0522     		movs	r2, #5
 128 0046 1A60     		str	r2, [r3]
  51:/home/tom/Documents/WORK/upg57_2/startup.c ****     while( (*STK_CTRL & 0x10000)== 0){}
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
  52:/home/tom/Documents/WORK/upg57_2/startup.c ****     *STK_CTRL = 0;
 139              		.loc 1 52 0 is_stmt 1
 140 0056 034B     		ldr	r3, .L7
 141 0058 0022     		movs	r2, #0
 142 005a 1A60     		str	r2, [r3]
  53:/home/tom/Documents/WORK/upg57_2/startup.c **** }
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
  54:/home/tom/Documents/WORK/upg57_2/startup.c **** 
  55:/home/tom/Documents/WORK/upg57_2/startup.c **** void delay_micro(unsigned int us){
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
  56:/home/tom/Documents/WORK/upg57_2/startup.c ****     while(us > 0){
 179              		.loc 1 56 0
 180 0078 0AE0     		b	.L10
 181              	.L11:
  57:/home/tom/Documents/WORK/upg57_2/startup.c ****         delay_250ns();
 182              		.loc 1 57 0
 183 007a FFF7FEFF 		bl	delay_250ns
  58:/home/tom/Documents/WORK/upg57_2/startup.c ****         delay_250ns();
 184              		.loc 1 58 0
 185 007e FFF7FEFF 		bl	delay_250ns
  59:/home/tom/Documents/WORK/upg57_2/startup.c ****         delay_250ns();
 186              		.loc 1 59 0
 187 0082 FFF7FEFF 		bl	delay_250ns
  60:/home/tom/Documents/WORK/upg57_2/startup.c ****         delay_250ns();
 188              		.loc 1 60 0
 189 0086 FFF7FEFF 		bl	delay_250ns
  61:/home/tom/Documents/WORK/upg57_2/startup.c ****         us--;
 190              		.loc 1 61 0
 191 008a 7B68     		ldr	r3, [r7, #4]
 192 008c 013B     		subs	r3, r3, #1
 193 008e 7B60     		str	r3, [r7, #4]
 194              	.L10:
  56:/home/tom/Documents/WORK/upg57_2/startup.c ****         delay_250ns();
 195              		.loc 1 56 0
 196 0090 7B68     		ldr	r3, [r7, #4]
 197 0092 002B     		cmp	r3, #0
 198 0094 F1D1     		bne	.L11
  62:/home/tom/Documents/WORK/upg57_2/startup.c ****     }
  63:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 199              		.loc 1 63 0
 200 0096 C046     		nop
 201 0098 BD46     		mov	sp, r7
 202 009a 02B0     		add	sp, sp, #8
 203              		@ sp needed
 204 009c 80BD     		pop	{r7, pc}
 205              		.cfi_endproc
 206              	.LFE3:
 208              		.align	1
 209              		.global	delay_milli
 210              		.syntax unified
 211              		.code	16
 212              		.thumb_func
 213              		.fpu softvfp
 215              	delay_milli:
 216              	.LFB4:
  64:/home/tom/Documents/WORK/upg57_2/startup.c **** 
  65:/home/tom/Documents/WORK/upg57_2/startup.c **** void delay_milli(unsigned int ms){
 217              		.loc 1 65 0
 218              		.cfi_startproc
 219              		@ args = 0, pretend = 0, frame = 8
 220              		@ frame_needed = 1, uses_anonymous_args = 0
 221 009e 80B5     		push	{r7, lr}
 222              		.cfi_def_cfa_offset 8
 223              		.cfi_offset 7, -8
 224              		.cfi_offset 14, -4
 225 00a0 82B0     		sub	sp, sp, #8
 226              		.cfi_def_cfa_offset 16
 227 00a2 00AF     		add	r7, sp, #0
 228              		.cfi_def_cfa_register 7
 229 00a4 7860     		str	r0, [r7, #4]
  66:/home/tom/Documents/WORK/upg57_2/startup.c **** 
  67:/home/tom/Documents/WORK/upg57_2/startup.c ****     while(ms--){
 230              		.loc 1 67 0
 231 00a6 02E0     		b	.L13
 232              	.L14:
  68:/home/tom/Documents/WORK/upg57_2/startup.c ****         delay_micro(10);
 233              		.loc 1 68 0
 234 00a8 0A20     		movs	r0, #10
 235 00aa FFF7FEFF 		bl	delay_micro
 236              	.L13:
  67:/home/tom/Documents/WORK/upg57_2/startup.c ****         delay_micro(10);
 237              		.loc 1 67 0
 238 00ae 7B68     		ldr	r3, [r7, #4]
 239 00b0 5A1E     		subs	r2, r3, #1
 240 00b2 7A60     		str	r2, [r7, #4]
 241 00b4 002B     		cmp	r3, #0
 242 00b6 F7D1     		bne	.L14
  69:/home/tom/Documents/WORK/upg57_2/startup.c ****     }
  70:/home/tom/Documents/WORK/upg57_2/startup.c ****     
  71:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 243              		.loc 1 71 0
 244 00b8 C046     		nop
 245 00ba BD46     		mov	sp, r7
 246 00bc 02B0     		add	sp, sp, #8
 247              		@ sp needed
 248 00be 80BD     		pop	{r7, pc}
 249              		.cfi_endproc
 250              	.LFE4:
 252              		.align	1
 253              		.global	ascii_ctrl_bit_set
 254              		.syntax unified
 255              		.code	16
 256              		.thumb_func
 257              		.fpu softvfp
 259              	ascii_ctrl_bit_set:
 260              	.LFB5:
  72:/home/tom/Documents/WORK/upg57_2/startup.c **** 
  73:/home/tom/Documents/WORK/upg57_2/startup.c **** 
  74:/home/tom/Documents/WORK/upg57_2/startup.c **** void ascii_ctrl_bit_set( unsigned char x){
 261              		.loc 1 74 0
 262              		.cfi_startproc
 263              		@ args = 0, pretend = 0, frame = 16
 264              		@ frame_needed = 1, uses_anonymous_args = 0
 265 00c0 80B5     		push	{r7, lr}
 266              		.cfi_def_cfa_offset 8
 267              		.cfi_offset 7, -8
 268              		.cfi_offset 14, -4
 269 00c2 84B0     		sub	sp, sp, #16
 270              		.cfi_def_cfa_offset 24
 271 00c4 00AF     		add	r7, sp, #0
 272              		.cfi_def_cfa_register 7
 273 00c6 0200     		movs	r2, r0
 274 00c8 FB1D     		adds	r3, r7, #7
 275 00ca 1A70     		strb	r2, [r3]
  75:/home/tom/Documents/WORK/upg57_2/startup.c ****     unsigned char c;
  76:/home/tom/Documents/WORK/upg57_2/startup.c ****     c = *portOdrLow;
 276              		.loc 1 76 0
 277 00cc 0C4A     		ldr	r2, .L16
 278 00ce 0F21     		movs	r1, #15
 279 00d0 7B18     		adds	r3, r7, r1
 280 00d2 1278     		ldrb	r2, [r2]
 281 00d4 1A70     		strb	r2, [r3]
  77:/home/tom/Documents/WORK/upg57_2/startup.c ****     c |= (B_SELECT | x);
 282              		.loc 1 77 0
 283 00d6 FA1D     		adds	r2, r7, #7
 284 00d8 7B18     		adds	r3, r7, r1
 285 00da 1278     		ldrb	r2, [r2]
 286 00dc 1B78     		ldrb	r3, [r3]
 287 00de 1343     		orrs	r3, r2
 288 00e0 DAB2     		uxtb	r2, r3
 289 00e2 0800     		movs	r0, r1
 290 00e4 7B18     		adds	r3, r7, r1
 291 00e6 0421     		movs	r1, #4
 292 00e8 0A43     		orrs	r2, r1
 293 00ea 1A70     		strb	r2, [r3]
  78:/home/tom/Documents/WORK/upg57_2/startup.c ****     *portOdrLow = c;
 294              		.loc 1 78 0
 295 00ec 044A     		ldr	r2, .L16
 296 00ee 0100     		movs	r1, r0
 297 00f0 7B18     		adds	r3, r7, r1
 298 00f2 1B78     		ldrb	r3, [r3]
 299 00f4 1370     		strb	r3, [r2]
  79:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 300              		.loc 1 79 0
 301 00f6 C046     		nop
 302 00f8 BD46     		mov	sp, r7
 303 00fa 04B0     		add	sp, sp, #16
 304              		@ sp needed
 305 00fc 80BD     		pop	{r7, pc}
 306              	.L17:
 307 00fe C046     		.align	2
 308              	.L16:
 309 0100 14100240 		.word	1073877012
 310              		.cfi_endproc
 311              	.LFE5:
 313              		.align	1
 314              		.global	ascii_ctrl_bit_clear
 315              		.syntax unified
 316              		.code	16
 317              		.thumb_func
 318              		.fpu softvfp
 320              	ascii_ctrl_bit_clear:
 321              	.LFB6:
  80:/home/tom/Documents/WORK/upg57_2/startup.c **** 
  81:/home/tom/Documents/WORK/upg57_2/startup.c **** void ascii_ctrl_bit_clear(unsigned char x){
 322              		.loc 1 81 0
 323              		.cfi_startproc
 324              		@ args = 0, pretend = 0, frame = 16
 325              		@ frame_needed = 1, uses_anonymous_args = 0
 326 0104 80B5     		push	{r7, lr}
 327              		.cfi_def_cfa_offset 8
 328              		.cfi_offset 7, -8
 329              		.cfi_offset 14, -4
 330 0106 84B0     		sub	sp, sp, #16
 331              		.cfi_def_cfa_offset 24
 332 0108 00AF     		add	r7, sp, #0
 333              		.cfi_def_cfa_register 7
 334 010a 0200     		movs	r2, r0
 335 010c FB1D     		adds	r3, r7, #7
 336 010e 1A70     		strb	r2, [r3]
  82:/home/tom/Documents/WORK/upg57_2/startup.c ****     unsigned char c;
  83:/home/tom/Documents/WORK/upg57_2/startup.c ****     c = *portOdrLow;
 337              		.loc 1 83 0
 338 0110 0D4A     		ldr	r2, .L19
 339 0112 0F21     		movs	r1, #15
 340 0114 7B18     		adds	r3, r7, r1
 341 0116 1278     		ldrb	r2, [r2]
 342 0118 1A70     		strb	r2, [r3]
  84:/home/tom/Documents/WORK/upg57_2/startup.c ****     c &= (B_SELECT | ~x);
 343              		.loc 1 84 0
 344 011a FB1D     		adds	r3, r7, #7
 345 011c 1B78     		ldrb	r3, [r3]
 346 011e 5BB2     		sxtb	r3, r3
 347 0120 DB43     		mvns	r3, r3
 348 0122 5BB2     		sxtb	r3, r3
 349 0124 0422     		movs	r2, #4
 350 0126 1343     		orrs	r3, r2
 351 0128 5BB2     		sxtb	r3, r3
 352 012a 7A18     		adds	r2, r7, r1
 353 012c 1278     		ldrb	r2, [r2]
 354 012e 52B2     		sxtb	r2, r2
 355 0130 1340     		ands	r3, r2
 356 0132 5AB2     		sxtb	r2, r3
 357 0134 7B18     		adds	r3, r7, r1
 358 0136 1A70     		strb	r2, [r3]
  85:/home/tom/Documents/WORK/upg57_2/startup.c ****     *portOdrLow = c;
 359              		.loc 1 85 0
 360 0138 034A     		ldr	r2, .L19
 361 013a 7B18     		adds	r3, r7, r1
 362 013c 1B78     		ldrb	r3, [r3]
 363 013e 1370     		strb	r3, [r2]
  86:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 364              		.loc 1 86 0
 365 0140 C046     		nop
 366 0142 BD46     		mov	sp, r7
 367 0144 04B0     		add	sp, sp, #16
 368              		@ sp needed
 369 0146 80BD     		pop	{r7, pc}
 370              	.L20:
 371              		.align	2
 372              	.L19:
 373 0148 14100240 		.word	1073877012
 374              		.cfi_endproc
 375              	.LFE6:
 377              		.align	1
 378              		.global	ascii_read_controller
 379              		.syntax unified
 380              		.code	16
 381              		.thumb_func
 382              		.fpu softvfp
 384              	ascii_read_controller:
 385              	.LFB7:
  87:/home/tom/Documents/WORK/upg57_2/startup.c **** 
  88:/home/tom/Documents/WORK/upg57_2/startup.c **** unsigned char ascii_read_controller( void ){
 386              		.loc 1 88 0
 387              		.cfi_startproc
 388              		@ args = 0, pretend = 0, frame = 8
 389              		@ frame_needed = 1, uses_anonymous_args = 0
 390 014c 80B5     		push	{r7, lr}
 391              		.cfi_def_cfa_offset 8
 392              		.cfi_offset 7, -8
 393              		.cfi_offset 14, -4
 394 014e 82B0     		sub	sp, sp, #8
 395              		.cfi_def_cfa_offset 16
 396 0150 00AF     		add	r7, sp, #0
 397              		.cfi_def_cfa_register 7
  89:/home/tom/Documents/WORK/upg57_2/startup.c ****     unsigned char c;
  90:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_ctrl_bit_set( B_E );
 398              		.loc 1 90 0
 399 0152 4020     		movs	r0, #64
 400 0154 FFF7FEFF 		bl	ascii_ctrl_bit_set
  91:/home/tom/Documents/WORK/upg57_2/startup.c ****     delay_250ns();
 401              		.loc 1 91 0
 402 0158 FFF7FEFF 		bl	delay_250ns
  92:/home/tom/Documents/WORK/upg57_2/startup.c ****     delay_250ns();
 403              		.loc 1 92 0
 404 015c FFF7FEFF 		bl	delay_250ns
  93:/home/tom/Documents/WORK/upg57_2/startup.c ****     c = *portIdrHigh;
 405              		.loc 1 93 0
 406 0160 064A     		ldr	r2, .L23
 407 0162 FB1D     		adds	r3, r7, #7
 408 0164 1278     		ldrb	r2, [r2]
 409 0166 1A70     		strb	r2, [r3]
  94:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_ctrl_bit_clear( B_E );
 410              		.loc 1 94 0
 411 0168 4020     		movs	r0, #64
 412 016a FFF7FEFF 		bl	ascii_ctrl_bit_clear
  95:/home/tom/Documents/WORK/upg57_2/startup.c ****     return c;   
 413              		.loc 1 95 0
 414 016e FB1D     		adds	r3, r7, #7
 415 0170 1B78     		ldrb	r3, [r3]
  96:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 416              		.loc 1 96 0
 417 0172 1800     		movs	r0, r3
 418 0174 BD46     		mov	sp, r7
 419 0176 02B0     		add	sp, sp, #8
 420              		@ sp needed
 421 0178 80BD     		pop	{r7, pc}
 422              	.L24:
 423 017a C046     		.align	2
 424              	.L23:
 425 017c 10100240 		.word	1073877008
 426              		.cfi_endproc
 427              	.LFE7:
 429              		.align	1
 430              		.global	ascii_write_controller
 431              		.syntax unified
 432              		.code	16
 433              		.thumb_func
 434              		.fpu softvfp
 436              	ascii_write_controller:
 437              	.LFB8:
  97:/home/tom/Documents/WORK/upg57_2/startup.c **** 
  98:/home/tom/Documents/WORK/upg57_2/startup.c **** void ascii_write_controller( unsigned char c ){
 438              		.loc 1 98 0
 439              		.cfi_startproc
 440              		@ args = 0, pretend = 0, frame = 8
 441              		@ frame_needed = 1, uses_anonymous_args = 0
 442 0180 80B5     		push	{r7, lr}
 443              		.cfi_def_cfa_offset 8
 444              		.cfi_offset 7, -8
 445              		.cfi_offset 14, -4
 446 0182 82B0     		sub	sp, sp, #8
 447              		.cfi_def_cfa_offset 16
 448 0184 00AF     		add	r7, sp, #0
 449              		.cfi_def_cfa_register 7
 450 0186 0200     		movs	r2, r0
 451 0188 FB1D     		adds	r3, r7, #7
 452 018a 1A70     		strb	r2, [r3]
  99:/home/tom/Documents/WORK/upg57_2/startup.c **** 	delay_250ns();
 453              		.loc 1 99 0
 454 018c FFF7FEFF 		bl	delay_250ns
 100:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_ctrl_bit_set( B_E );   // Synchronization signal =1
 455              		.loc 1 100 0
 456 0190 4020     		movs	r0, #64
 457 0192 FFF7FEFF 		bl	ascii_ctrl_bit_set
 101:/home/tom/Documents/WORK/upg57_2/startup.c ****     *portOdrHigh = c;            // Ger kommandot till porten
 458              		.loc 1 101 0
 459 0196 074A     		ldr	r2, .L26
 460 0198 FB1D     		adds	r3, r7, #7
 461 019a 1B78     		ldrb	r3, [r3]
 462 019c 1370     		strb	r3, [r2]
 102:/home/tom/Documents/WORK/upg57_2/startup.c ****     delay_250ns();
 463              		.loc 1 102 0
 464 019e FFF7FEFF 		bl	delay_250ns
 103:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_ctrl_bit_clear( B_E ); // Stänger av synchronizatoin.
 465              		.loc 1 103 0
 466 01a2 4020     		movs	r0, #64
 467 01a4 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 104:/home/tom/Documents/WORK/upg57_2/startup.c ****     delay_250ns();
 468              		.loc 1 104 0
 469 01a8 FFF7FEFF 		bl	delay_250ns
 105:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 470              		.loc 1 105 0
 471 01ac C046     		nop
 472 01ae BD46     		mov	sp, r7
 473 01b0 02B0     		add	sp, sp, #8
 474              		@ sp needed
 475 01b2 80BD     		pop	{r7, pc}
 476              	.L27:
 477              		.align	2
 478              	.L26:
 479 01b4 15100240 		.word	1073877013
 480              		.cfi_endproc
 481              	.LFE8:
 483              		.align	1
 484              		.global	ascii_read_status
 485              		.syntax unified
 486              		.code	16
 487              		.thumb_func
 488              		.fpu softvfp
 490              	ascii_read_status:
 491              	.LFB9:
 106:/home/tom/Documents/WORK/upg57_2/startup.c **** 
 107:/home/tom/Documents/WORK/upg57_2/startup.c **** unsigned char ascii_read_status(){
 492              		.loc 1 107 0
 493              		.cfi_startproc
 494              		@ args = 0, pretend = 0, frame = 8
 495              		@ frame_needed = 1, uses_anonymous_args = 0
 496 01b8 90B5     		push	{r4, r7, lr}
 497              		.cfi_def_cfa_offset 12
 498              		.cfi_offset 4, -12
 499              		.cfi_offset 7, -8
 500              		.cfi_offset 14, -4
 501 01ba 83B0     		sub	sp, sp, #12
 502              		.cfi_def_cfa_offset 24
 503 01bc 00AF     		add	r7, sp, #0
 504              		.cfi_def_cfa_register 7
 108:/home/tom/Documents/WORK/upg57_2/startup.c ****     unsigned char c;
 109:/home/tom/Documents/WORK/upg57_2/startup.c ****     *portModer = 0x0000;   //GÖR OM PORTEN TILL INGÅNGAR
 505              		.loc 1 109 0
 506 01be 0B4B     		ldr	r3, .L30
 507 01c0 0022     		movs	r2, #0
 508 01c2 1A60     		str	r2, [r3]
 110:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_ctrl_bit_set( B_RW );   // ETT STÄLL READ/WRITE
 509              		.loc 1 110 0
 510 01c4 0220     		movs	r0, #2
 511 01c6 FFF7FEFF 		bl	ascii_ctrl_bit_set
 111:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_ctrl_bit_clear( B_RS );  //NOLLSTÄLL READ/ SET
 512              		.loc 1 111 0
 513 01ca 0120     		movs	r0, #1
 514 01cc FFF7FEFF 		bl	ascii_ctrl_bit_clear
 112:/home/tom/Documents/WORK/upg57_2/startup.c ****     c = ascii_read_controller( );
 515              		.loc 1 112 0
 516 01d0 FC1D     		adds	r4, r7, #7
 517 01d2 FFF7FEFF 		bl	ascii_read_controller
 518 01d6 0300     		movs	r3, r0
 519 01d8 2370     		strb	r3, [r4]
 113:/home/tom/Documents/WORK/upg57_2/startup.c ****     *portModer = 0x5555;    //GÖR OM PORTEN TILL UTGÅNGAR
 520              		.loc 1 113 0
 521 01da 044B     		ldr	r3, .L30
 522 01dc 044A     		ldr	r2, .L30+4
 523 01de 1A60     		str	r2, [r3]
 114:/home/tom/Documents/WORK/upg57_2/startup.c **** return c;
 524              		.loc 1 114 0
 525 01e0 FB1D     		adds	r3, r7, #7
 526 01e2 1B78     		ldrb	r3, [r3]
 115:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 527              		.loc 1 115 0
 528 01e4 1800     		movs	r0, r3
 529 01e6 BD46     		mov	sp, r7
 530 01e8 03B0     		add	sp, sp, #12
 531              		@ sp needed
 532 01ea 90BD     		pop	{r4, r7, pc}
 533              	.L31:
 534              		.align	2
 535              	.L30:
 536 01ec 00100240 		.word	1073876992
 537 01f0 55550000 		.word	21845
 538              		.cfi_endproc
 539              	.LFE9:
 541              		.align	1
 542              		.global	ascii_write_cmd
 543              		.syntax unified
 544              		.code	16
 545              		.thumb_func
 546              		.fpu softvfp
 548              	ascii_write_cmd:
 549              	.LFB10:
 116:/home/tom/Documents/WORK/upg57_2/startup.c **** 
 117:/home/tom/Documents/WORK/upg57_2/startup.c **** void ascii_write_cmd ( unsigned char command){
 550              		.loc 1 117 0
 551              		.cfi_startproc
 552              		@ args = 0, pretend = 0, frame = 8
 553              		@ frame_needed = 1, uses_anonymous_args = 0
 554 01f4 80B5     		push	{r7, lr}
 555              		.cfi_def_cfa_offset 8
 556              		.cfi_offset 7, -8
 557              		.cfi_offset 14, -4
 558 01f6 82B0     		sub	sp, sp, #8
 559              		.cfi_def_cfa_offset 16
 560 01f8 00AF     		add	r7, sp, #0
 561              		.cfi_def_cfa_register 7
 562 01fa 0200     		movs	r2, r0
 563 01fc FB1D     		adds	r3, r7, #7
 564 01fe 1A70     		strb	r2, [r3]
 118:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_ctrl_bit_clear(B_RS);
 565              		.loc 1 118 0
 566 0200 0120     		movs	r0, #1
 567 0202 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 119:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_ctrl_bit_clear(B_RW);
 568              		.loc 1 119 0
 569 0206 0220     		movs	r0, #2
 570 0208 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 120:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_write_controller(command);
 571              		.loc 1 120 0
 572 020c FB1D     		adds	r3, r7, #7
 573 020e 1B78     		ldrb	r3, [r3]
 574 0210 1800     		movs	r0, r3
 575 0212 FFF7FEFF 		bl	ascii_write_controller
 121:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 576              		.loc 1 121 0
 577 0216 C046     		nop
 578 0218 BD46     		mov	sp, r7
 579 021a 02B0     		add	sp, sp, #8
 580              		@ sp needed
 581 021c 80BD     		pop	{r7, pc}
 582              		.cfi_endproc
 583              	.LFE10:
 585              		.align	1
 586              		.global	ascii_write_data
 587              		.syntax unified
 588              		.code	16
 589              		.thumb_func
 590              		.fpu softvfp
 592              	ascii_write_data:
 593              	.LFB11:
 122:/home/tom/Documents/WORK/upg57_2/startup.c **** 
 123:/home/tom/Documents/WORK/upg57_2/startup.c **** void ascii_write_data (unsigned char data){
 594              		.loc 1 123 0
 595              		.cfi_startproc
 596              		@ args = 0, pretend = 0, frame = 8
 597              		@ frame_needed = 1, uses_anonymous_args = 0
 598 021e 80B5     		push	{r7, lr}
 599              		.cfi_def_cfa_offset 8
 600              		.cfi_offset 7, -8
 601              		.cfi_offset 14, -4
 602 0220 82B0     		sub	sp, sp, #8
 603              		.cfi_def_cfa_offset 16
 604 0222 00AF     		add	r7, sp, #0
 605              		.cfi_def_cfa_register 7
 606 0224 0200     		movs	r2, r0
 607 0226 FB1D     		adds	r3, r7, #7
 608 0228 1A70     		strb	r2, [r3]
 124:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_ctrl_bit_clear(B_RW);
 609              		.loc 1 124 0
 610 022a 0220     		movs	r0, #2
 611 022c FFF7FEFF 		bl	ascii_ctrl_bit_clear
 125:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_ctrl_bit_set(B_RS);
 612              		.loc 1 125 0
 613 0230 0120     		movs	r0, #1
 614 0232 FFF7FEFF 		bl	ascii_ctrl_bit_set
 126:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_write_controller(data);
 615              		.loc 1 126 0
 616 0236 FB1D     		adds	r3, r7, #7
 617 0238 1B78     		ldrb	r3, [r3]
 618 023a 1800     		movs	r0, r3
 619 023c FFF7FEFF 		bl	ascii_write_controller
 127:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 620              		.loc 1 127 0
 621 0240 C046     		nop
 622 0242 BD46     		mov	sp, r7
 623 0244 02B0     		add	sp, sp, #8
 624              		@ sp needed
 625 0246 80BD     		pop	{r7, pc}
 626              		.cfi_endproc
 627              	.LFE11:
 629              		.align	1
 630              		.global	ascii_read_data
 631              		.syntax unified
 632              		.code	16
 633              		.thumb_func
 634              		.fpu softvfp
 636              	ascii_read_data:
 637              	.LFB12:
 128:/home/tom/Documents/WORK/upg57_2/startup.c **** 
 129:/home/tom/Documents/WORK/upg57_2/startup.c **** void ascii_read_data(void){
 638              		.loc 1 129 0
 639              		.cfi_startproc
 640              		@ args = 0, pretend = 0, frame = 8
 641              		@ frame_needed = 1, uses_anonymous_args = 0
 642 0248 90B5     		push	{r4, r7, lr}
 643              		.cfi_def_cfa_offset 12
 644              		.cfi_offset 4, -12
 645              		.cfi_offset 7, -8
 646              		.cfi_offset 14, -4
 647 024a 83B0     		sub	sp, sp, #12
 648              		.cfi_def_cfa_offset 24
 649 024c 00AF     		add	r7, sp, #0
 650              		.cfi_def_cfa_register 7
 130:/home/tom/Documents/WORK/upg57_2/startup.c ****     unsigned char c;
 131:/home/tom/Documents/WORK/upg57_2/startup.c ****     *portModer = 0x0000;
 651              		.loc 1 131 0
 652 024e 0A4B     		ldr	r3, .L36
 653 0250 0022     		movs	r2, #0
 654 0252 1A60     		str	r2, [r3]
 132:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_ctrl_bit_set(B_RS);
 655              		.loc 1 132 0
 656 0254 0120     		movs	r0, #1
 657 0256 FFF7FEFF 		bl	ascii_ctrl_bit_set
 133:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_ctrl_bit_set(B_RW);
 658              		.loc 1 133 0
 659 025a 0220     		movs	r0, #2
 660 025c FFF7FEFF 		bl	ascii_ctrl_bit_set
 134:/home/tom/Documents/WORK/upg57_2/startup.c ****     c = ascii_read_controller();
 661              		.loc 1 134 0
 662 0260 FC1D     		adds	r4, r7, #7
 663 0262 FFF7FEFF 		bl	ascii_read_controller
 664 0266 0300     		movs	r3, r0
 665 0268 2370     		strb	r3, [r4]
 135:/home/tom/Documents/WORK/upg57_2/startup.c ****     *portModer = 0x5555;
 666              		.loc 1 135 0
 667 026a 034B     		ldr	r3, .L36
 668 026c 034A     		ldr	r2, .L36+4
 669 026e 1A60     		str	r2, [r3]
 136:/home/tom/Documents/WORK/upg57_2/startup.c ****     return c;
 670              		.loc 1 136 0
 671 0270 C046     		nop
 137:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 672              		.loc 1 137 0
 673 0272 BD46     		mov	sp, r7
 674 0274 03B0     		add	sp, sp, #12
 675              		@ sp needed
 676 0276 90BD     		pop	{r4, r7, pc}
 677              	.L37:
 678              		.align	2
 679              	.L36:
 680 0278 00100240 		.word	1073876992
 681 027c 55550000 		.word	21845
 682              		.cfi_endproc
 683              	.LFE12:
 685              		.align	1
 686              		.global	ascii_clear_cmd
 687              		.syntax unified
 688              		.code	16
 689              		.thumb_func
 690              		.fpu softvfp
 692              	ascii_clear_cmd:
 693              	.LFB13:
 138:/home/tom/Documents/WORK/upg57_2/startup.c **** void ascii_clear_cmd(unsigned char cmd){
 694              		.loc 1 138 0
 695              		.cfi_startproc
 696              		@ args = 0, pretend = 0, frame = 8
 697              		@ frame_needed = 1, uses_anonymous_args = 0
 698 0280 80B5     		push	{r7, lr}
 699              		.cfi_def_cfa_offset 8
 700              		.cfi_offset 7, -8
 701              		.cfi_offset 14, -4
 702 0282 82B0     		sub	sp, sp, #8
 703              		.cfi_def_cfa_offset 16
 704 0284 00AF     		add	r7, sp, #0
 705              		.cfi_def_cfa_register 7
 706 0286 0200     		movs	r2, r0
 707 0288 FB1D     		adds	r3, r7, #7
 708 028a 1A70     		strb	r2, [r3]
 139:/home/tom/Documents/WORK/upg57_2/startup.c ****     while((ascii_read_status() & 0x80) == 0x80){
 709              		.loc 1 139 0
 710 028c 0AE0     		b	.L39
 711              	.L40:
 140:/home/tom/Documents/WORK/upg57_2/startup.c ****         delay_micro(8);
 712              		.loc 1 140 0
 713 028e 0820     		movs	r0, #8
 714 0290 FFF7FEFF 		bl	delay_micro
 141:/home/tom/Documents/WORK/upg57_2/startup.c ****         ascii_write_cmd(cmd);
 715              		.loc 1 141 0
 716 0294 FB1D     		adds	r3, r7, #7
 717 0296 1B78     		ldrb	r3, [r3]
 718 0298 1800     		movs	r0, r3
 719 029a FFF7FEFF 		bl	ascii_write_cmd
 142:/home/tom/Documents/WORK/upg57_2/startup.c ****         delay_milli(2);
 720              		.loc 1 142 0
 721 029e 0220     		movs	r0, #2
 722 02a0 FFF7FEFF 		bl	delay_milli
 723              	.L39:
 139:/home/tom/Documents/WORK/upg57_2/startup.c ****         delay_micro(8);
 724              		.loc 1 139 0
 725 02a4 FFF7FEFF 		bl	ascii_read_status
 726 02a8 0300     		movs	r3, r0
 727 02aa 1A00     		movs	r2, r3
 728 02ac 8023     		movs	r3, #128
 729 02ae 1340     		ands	r3, r2
 730 02b0 802B     		cmp	r3, #128
 731 02b2 ECD0     		beq	.L40
 143:/home/tom/Documents/WORK/upg57_2/startup.c ****     }
 144:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 732              		.loc 1 144 0
 733 02b4 C046     		nop
 734 02b6 BD46     		mov	sp, r7
 735 02b8 02B0     		add	sp, sp, #8
 736              		@ sp needed
 737 02ba 80BD     		pop	{r7, pc}
 738              		.cfi_endproc
 739              	.LFE13:
 741              		.align	1
 742              		.global	ascii_init
 743              		.syntax unified
 744              		.code	16
 745              		.thumb_func
 746              		.fpu softvfp
 748              	ascii_init:
 749              	.LFB14:
 145:/home/tom/Documents/WORK/upg57_2/startup.c **** 
 146:/home/tom/Documents/WORK/upg57_2/startup.c **** void ascii_init(void){
 750              		.loc 1 146 0
 751              		.cfi_startproc
 752              		@ args = 0, pretend = 0, frame = 0
 753              		@ frame_needed = 1, uses_anonymous_args = 0
 754 02bc 80B5     		push	{r7, lr}
 755              		.cfi_def_cfa_offset 8
 756              		.cfi_offset 7, -8
 757              		.cfi_offset 14, -4
 758 02be 00AF     		add	r7, sp, #0
 759              		.cfi_def_cfa_register 7
 147:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_write_cmd(0x38);
 760              		.loc 1 147 0
 761 02c0 3820     		movs	r0, #56
 762 02c2 FFF7FEFF 		bl	ascii_write_cmd
 148:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_write_cmd(0x0E);
 763              		.loc 1 148 0
 764 02c6 0E20     		movs	r0, #14
 765 02c8 FFF7FEFF 		bl	ascii_write_cmd
 149:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_clear_cmd(0x01);
 766              		.loc 1 149 0
 767 02cc 0120     		movs	r0, #1
 768 02ce FFF7FEFF 		bl	ascii_clear_cmd
 150:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_write_cmd(0x04);
 769              		.loc 1 150 0
 770 02d2 0420     		movs	r0, #4
 771 02d4 FFF7FEFF 		bl	ascii_write_cmd
 151:/home/tom/Documents/WORK/upg57_2/startup.c **** 
 152:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 772              		.loc 1 152 0
 773 02d8 C046     		nop
 774 02da BD46     		mov	sp, r7
 775              		@ sp needed
 776 02dc 80BD     		pop	{r7, pc}
 777              		.cfi_endproc
 778              	.LFE14:
 780              		.align	1
 781              		.global	ascii_gotoxy
 782              		.syntax unified
 783              		.code	16
 784              		.thumb_func
 785              		.fpu softvfp
 787              	ascii_gotoxy:
 788              	.LFB15:
 153:/home/tom/Documents/WORK/upg57_2/startup.c **** 
 154:/home/tom/Documents/WORK/upg57_2/startup.c **** 
 155:/home/tom/Documents/WORK/upg57_2/startup.c **** void ascii_gotoxy( unsigned int x, unsigned int y) {
 789              		.loc 1 155 0
 790              		.cfi_startproc
 791              		@ args = 0, pretend = 0, frame = 16
 792              		@ frame_needed = 1, uses_anonymous_args = 0
 793 02de 80B5     		push	{r7, lr}
 794              		.cfi_def_cfa_offset 8
 795              		.cfi_offset 7, -8
 796              		.cfi_offset 14, -4
 797 02e0 84B0     		sub	sp, sp, #16
 798              		.cfi_def_cfa_offset 24
 799 02e2 00AF     		add	r7, sp, #0
 800              		.cfi_def_cfa_register 7
 801 02e4 7860     		str	r0, [r7, #4]
 802 02e6 3960     		str	r1, [r7]
 156:/home/tom/Documents/WORK/upg57_2/startup.c ****     unsigned char address = x-1;
 803              		.loc 1 156 0
 804 02e8 7B68     		ldr	r3, [r7, #4]
 805 02ea DAB2     		uxtb	r2, r3
 806 02ec 0F23     		movs	r3, #15
 807 02ee FB18     		adds	r3, r7, r3
 808 02f0 013A     		subs	r2, r2, #1
 809 02f2 1A70     		strb	r2, [r3]
 157:/home/tom/Documents/WORK/upg57_2/startup.c ****     if(y != 1){
 810              		.loc 1 157 0
 811 02f4 3B68     		ldr	r3, [r7]
 812 02f6 012B     		cmp	r3, #1
 813 02f8 0CD0     		beq	.L43
 158:/home/tom/Documents/WORK/upg57_2/startup.c ****         address +=0x40 | (x-1);
 814              		.loc 1 158 0
 815 02fa 7B68     		ldr	r3, [r7, #4]
 816 02fc DBB2     		uxtb	r3, r3
 817 02fe 013B     		subs	r3, r3, #1
 818 0300 DBB2     		uxtb	r3, r3
 819 0302 4022     		movs	r2, #64
 820 0304 1343     		orrs	r3, r2
 821 0306 D9B2     		uxtb	r1, r3
 822 0308 0F22     		movs	r2, #15
 823 030a BB18     		adds	r3, r7, r2
 824 030c BA18     		adds	r2, r7, r2
 825 030e 1278     		ldrb	r2, [r2]
 826 0310 8A18     		adds	r2, r1, r2
 827 0312 1A70     		strb	r2, [r3]
 828              	.L43:
 159:/home/tom/Documents/WORK/upg57_2/startup.c **** } 
 160:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_write_cmd( 0x80 | address);
 829              		.loc 1 160 0
 830 0314 0F23     		movs	r3, #15
 831 0316 FB18     		adds	r3, r7, r3
 832 0318 1B78     		ldrb	r3, [r3]
 833 031a 8022     		movs	r2, #128
 834 031c 5242     		rsbs	r2, r2, #0
 835 031e 1343     		orrs	r3, r2
 836 0320 DBB2     		uxtb	r3, r3
 837 0322 1800     		movs	r0, r3
 838 0324 FFF7FEFF 		bl	ascii_write_cmd
 161:/home/tom/Documents/WORK/upg57_2/startup.c ****     delay_micro(45);
 839              		.loc 1 161 0
 840 0328 2D20     		movs	r0, #45
 841 032a FFF7FEFF 		bl	delay_micro
 162:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 842              		.loc 1 162 0
 843 032e C046     		nop
 844 0330 BD46     		mov	sp, r7
 845 0332 04B0     		add	sp, sp, #16
 846              		@ sp needed
 847 0334 80BD     		pop	{r7, pc}
 848              		.cfi_endproc
 849              	.LFE15:
 851              		.align	1
 852              		.global	ascii_write_char
 853              		.syntax unified
 854              		.code	16
 855              		.thumb_func
 856              		.fpu softvfp
 858              	ascii_write_char:
 859              	.LFB16:
 163:/home/tom/Documents/WORK/upg57_2/startup.c **** 
 164:/home/tom/Documents/WORK/upg57_2/startup.c **** void ascii_write_char( unsigned char c){
 860              		.loc 1 164 0
 861              		.cfi_startproc
 862              		@ args = 0, pretend = 0, frame = 8
 863              		@ frame_needed = 1, uses_anonymous_args = 0
 864 0336 80B5     		push	{r7, lr}
 865              		.cfi_def_cfa_offset 8
 866              		.cfi_offset 7, -8
 867              		.cfi_offset 14, -4
 868 0338 82B0     		sub	sp, sp, #8
 869              		.cfi_def_cfa_offset 16
 870 033a 00AF     		add	r7, sp, #0
 871              		.cfi_def_cfa_register 7
 872 033c 0200     		movs	r2, r0
 873 033e FB1D     		adds	r3, r7, #7
 874 0340 1A70     		strb	r2, [r3]
 165:/home/tom/Documents/WORK/upg57_2/startup.c ****     while((ascii_read_status() & 0x80) == 0x80){
 875              		.loc 1 165 0
 876 0342 07E0     		b	.L45
 877              	.L46:
 166:/home/tom/Documents/WORK/upg57_2/startup.c ****         delay_micro(8);
 878              		.loc 1 166 0
 879 0344 0820     		movs	r0, #8
 880 0346 FFF7FEFF 		bl	delay_micro
 167:/home/tom/Documents/WORK/upg57_2/startup.c ****         ascii_write_data(c);
 881              		.loc 1 167 0
 882 034a FB1D     		adds	r3, r7, #7
 883 034c 1B78     		ldrb	r3, [r3]
 884 034e 1800     		movs	r0, r3
 885 0350 FFF7FEFF 		bl	ascii_write_data
 886              	.L45:
 165:/home/tom/Documents/WORK/upg57_2/startup.c ****     while((ascii_read_status() & 0x80) == 0x80){
 887              		.loc 1 165 0
 888 0354 FFF7FEFF 		bl	ascii_read_status
 889 0358 0300     		movs	r3, r0
 890 035a 1A00     		movs	r2, r3
 891 035c 8023     		movs	r3, #128
 892 035e 1340     		ands	r3, r2
 893 0360 802B     		cmp	r3, #128
 894 0362 EFD0     		beq	.L46
 168:/home/tom/Documents/WORK/upg57_2/startup.c ****     }
 169:/home/tom/Documents/WORK/upg57_2/startup.c ****     
 170:/home/tom/Documents/WORK/upg57_2/startup.c **** }
 895              		.loc 1 170 0
 896 0364 C046     		nop
 897 0366 BD46     		mov	sp, r7
 898 0368 02B0     		add	sp, sp, #8
 899              		@ sp needed
 900 036a 80BD     		pop	{r7, pc}
 901              		.cfi_endproc
 902              	.LFE16:
 904              		.section	.rodata
 905              		.align	2
 906              	.LC0:
 907 0000 416C6661 		.ascii	"Alfanumerisk\000"
 907      6E756D65 
 907      7269736B 
 907      00
 908 000d 000000   		.align	2
 909              	.LC2:
 910 0010 44697370 		.ascii	"Display - test\000"
 910      6C617920 
 910      2D207465 
 910      737400
 911              		.text
 912              		.align	1
 913              		.global	main
 914              		.syntax unified
 915              		.code	16
 916              		.thumb_func
 917              		.fpu softvfp
 919              	main:
 920              	.LFB17:
 171:/home/tom/Documents/WORK/upg57_2/startup.c **** 
 172:/home/tom/Documents/WORK/upg57_2/startup.c **** void main(void){
 921              		.loc 1 172 0
 922              		.cfi_startproc
 923              		@ args = 0, pretend = 0, frame = 40
 924              		@ frame_needed = 1, uses_anonymous_args = 0
 925 036c B0B5     		push	{r4, r5, r7, lr}
 926              		.cfi_def_cfa_offset 16
 927              		.cfi_offset 4, -16
 928              		.cfi_offset 5, -12
 929              		.cfi_offset 7, -8
 930              		.cfi_offset 14, -4
 931 036e 8AB0     		sub	sp, sp, #40
 932              		.cfi_def_cfa_offset 56
 933 0370 00AF     		add	r7, sp, #0
 934              		.cfi_def_cfa_register 7
 173:/home/tom/Documents/WORK/upg57_2/startup.c ****     char *s;
 174:/home/tom/Documents/WORK/upg57_2/startup.c ****     char test1[] = "Alfanumerisk";
 935              		.loc 1 174 0
 936 0372 1424     		movs	r4, #20
 937 0374 3B19     		adds	r3, r7, r4
 938 0376 1C4A     		ldr	r2, .L52
 939 0378 23CA     		ldmia	r2!, {r0, r1, r5}
 940 037a 23C3     		stmia	r3!, {r0, r1, r5}
 941 037c 1278     		ldrb	r2, [r2]
 942 037e 1A70     		strb	r2, [r3]
 175:/home/tom/Documents/WORK/upg57_2/startup.c ****     char test2[] = "Display - test";
 943              		.loc 1 175 0
 944 0380 3B1D     		adds	r3, r7, #4
 945 0382 1A4A     		ldr	r2, .L52+4
 946 0384 23CA     		ldmia	r2!, {r0, r1, r5}
 947 0386 23C3     		stmia	r3!, {r0, r1, r5}
 948 0388 1188     		ldrh	r1, [r2]
 949 038a 1980     		strh	r1, [r3]
 950 038c 9278     		ldrb	r2, [r2, #2]
 951 038e 9A70     		strb	r2, [r3, #2]
 176:/home/tom/Documents/WORK/upg57_2/startup.c ****     
 177:/home/tom/Documents/WORK/upg57_2/startup.c ****     init_app();
 952              		.loc 1 177 0
 953 0390 FFF7FEFF 		bl	init_app
 178:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_init();
 954              		.loc 1 178 0
 955 0394 FFF7FEFF 		bl	ascii_init
 179:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_gotoxy(1,1);
 956              		.loc 1 179 0
 957 0398 0121     		movs	r1, #1
 958 039a 0120     		movs	r0, #1
 959 039c FFF7FEFF 		bl	ascii_gotoxy
 180:/home/tom/Documents/WORK/upg57_2/startup.c ****     s = test1;
 960              		.loc 1 180 0
 961 03a0 3B19     		adds	r3, r7, r4
 962 03a2 7B62     		str	r3, [r7, #36]
 181:/home/tom/Documents/WORK/upg57_2/startup.c ****     while (*s){
 963              		.loc 1 181 0
 964 03a4 06E0     		b	.L48
 965              	.L49:
 182:/home/tom/Documents/WORK/upg57_2/startup.c ****         ascii_write_char( *s ++);
 966              		.loc 1 182 0
 967 03a6 7B6A     		ldr	r3, [r7, #36]
 968 03a8 5A1C     		adds	r2, r3, #1
 969 03aa 7A62     		str	r2, [r7, #36]
 970 03ac 1B78     		ldrb	r3, [r3]
 971 03ae 1800     		movs	r0, r3
 972 03b0 FFF7FEFF 		bl	ascii_write_char
 973              	.L48:
 181:/home/tom/Documents/WORK/upg57_2/startup.c ****     while (*s){
 974              		.loc 1 181 0
 975 03b4 7B6A     		ldr	r3, [r7, #36]
 976 03b6 1B78     		ldrb	r3, [r3]
 977 03b8 002B     		cmp	r3, #0
 978 03ba F4D1     		bne	.L49
 183:/home/tom/Documents/WORK/upg57_2/startup.c ****     }
 184:/home/tom/Documents/WORK/upg57_2/startup.c ****     ascii_gotoxy(1,2);
 979              		.loc 1 184 0
 980 03bc 0221     		movs	r1, #2
 981 03be 0120     		movs	r0, #1
 982 03c0 FFF7FEFF 		bl	ascii_gotoxy
 185:/home/tom/Documents/WORK/upg57_2/startup.c ****     s = test2;
 983              		.loc 1 185 0
 984 03c4 3B1D     		adds	r3, r7, #4
 985 03c6 7B62     		str	r3, [r7, #36]
 186:/home/tom/Documents/WORK/upg57_2/startup.c ****     while(*s){
 986              		.loc 1 186 0
 987 03c8 06E0     		b	.L50
 988              	.L51:
 187:/home/tom/Documents/WORK/upg57_2/startup.c ****         ascii_write_char(*s++);
 989              		.loc 1 187 0
 990 03ca 7B6A     		ldr	r3, [r7, #36]
 991 03cc 5A1C     		adds	r2, r3, #1
 992 03ce 7A62     		str	r2, [r7, #36]
 993 03d0 1B78     		ldrb	r3, [r3]
 994 03d2 1800     		movs	r0, r3
 995 03d4 FFF7FEFF 		bl	ascii_write_char
 996              	.L50:
 186:/home/tom/Documents/WORK/upg57_2/startup.c ****     while(*s){
 997              		.loc 1 186 0
 998 03d8 7B6A     		ldr	r3, [r7, #36]
 999 03da 1B78     		ldrb	r3, [r3]
 1000 03dc 002B     		cmp	r3, #0
 1001 03de F4D1     		bne	.L51
 188:/home/tom/Documents/WORK/upg57_2/startup.c ****     }
 189:/home/tom/Documents/WORK/upg57_2/startup.c **** }...
 1002              		.loc 1 189 0
 1003 03e0 C046     		nop
 1004 03e2 BD46     		mov	sp, r7
 1005 03e4 0AB0     		add	sp, sp, #40
 1006              		@ sp needed
 1007 03e6 B0BD     		pop	{r4, r5, r7, pc}
 1008              	.L53:
 1009              		.align	2
 1010              	.L52:
 1011 03e8 00000000 		.word	.LC0
 1012 03ec 10000000 		.word	.LC2
 1013              		.cfi_endproc
 1014              	.LFE17:
 1016              	.Letext0:
