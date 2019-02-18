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
  25              		.file 1 "/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c"
   1:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** /*
   2:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  * 	startup.c
   3:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  *
   4:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  */
   5:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  
   6:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define PORT_BASE_E 0x40021000
   7:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 			/* Definiera word-adresser för initiering*/
   8:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define portModer ((volatile unsigned int*)PORT_BASE_E)
   9:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define portModerHigh ((volatile unsigned char*)PORT_BASE_E+0x01)
  10:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define portOtyper ((volatile unsigned int*) PORT_BASE_E+0x04)
  11:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define Ospeedr    ((volatile unsigned int*) PORT_BASE_E+0x08)
  12:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define portPupdr  ((volatile unsigned int*) PORT_BASE_E+0x0C)
  13:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 			/*Definiera byte-adresser för data och styrregister*/
  14:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define portIdrLow ((volatile unsigned char*) PORT_BASE_E+0x10)
  15:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define portIdrHigh ((volatile unsigned char*) PORT_BASE_E+0x10)
  16:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define portOdrLow  ((volatile unsigned char*) PORT_BASE_E+0x14)
  17:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define portOdrHigh ((volatile unsigned char*) PORT_BASE_E+0x15)
  18:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 			/*Definiera lämpliga definitioner för de olika bitarna i styrregistret*/
  19:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define B_E 0x40  		/*ENABLE SIGNAL*/
  20:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define B_SELECT 4 	/*SELECT ASCII-DISPLAY*/
  21:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define B_RW 2    	 	/* 0 = writem, 1 = read*/
  22:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define B_RS 1     	/* 0 = control, 1 =data*/
  23:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 			/*STK DELAY*/
  24:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define STK_CTRL ((volatile unsigned int*)(0xE000E010))
  25:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define STK_LOAD ((volatile unsigned int*)(0xE000E014))
  26:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  #define STK_VAL  ((volatile unsigned int*)(0xE000E018))
  27:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****  
  28:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  29:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
  30:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void startup ( void )
  31:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** {
  26              		.loc 1 31 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  32:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** __asm volatile(
  31              		.loc 1 32 0
  32              		.syntax divided
  33              	@ 32 "/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  33:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  34:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 	" MOV SP,R0\n"
  35:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 	" BL main\n"				/* call main */
  36:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 	"_exit: B .\n"				/* never return */
  37:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 	) ;
  38:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
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
  39:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
  40:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void init_app(){
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
  41:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *portModer = 0x55555555;
  67              		.loc 1 41 0
  68 0004 054B     		ldr	r3, .L3
  69 0006 064A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  42:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *portOtyper =0x00000000;
  71              		.loc 1 42 0
  72 000a 064B     		ldr	r3, .L3+8
  73 000c 0022     		movs	r2, #0
  74 000e 1A60     		str	r2, [r3]
  43:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *Ospeedr    =0x55555555;
  75              		.loc 1 43 0
  76 0010 054B     		ldr	r3, .L3+12
  77 0012 034A     		ldr	r2, .L3+4
  78 0014 1A60     		str	r2, [r3]
  44:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
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
  45:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
  46:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void delay_250ns(void){
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
  47:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *STK_CTRL = 0;
 113              		.loc 1 47 0
 114 0030 0C4B     		ldr	r3, .L7
 115 0032 0022     		movs	r2, #0
 116 0034 1A60     		str	r2, [r3]
  48:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *STK_LOAD = ((168/4)-1);
 117              		.loc 1 48 0
 118 0036 0C4B     		ldr	r3, .L7+4
 119 0038 2922     		movs	r2, #41
 120 003a 1A60     		str	r2, [r3]
  49:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *STK_VAL  = 0;
 121              		.loc 1 49 0
 122 003c 0B4B     		ldr	r3, .L7+8
 123 003e 0022     		movs	r2, #0
 124 0040 1A60     		str	r2, [r3]
  50:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *STK_CTRL = 5;
 125              		.loc 1 50 0
 126 0042 084B     		ldr	r3, .L7
 127 0044 0522     		movs	r2, #5
 128 0046 1A60     		str	r2, [r3]
  51:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     while( (*STK_CTRL & 0x10000)== 0){}
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
  52:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *STK_CTRL = 0;
 139              		.loc 1 52 0 is_stmt 1
 140 0056 034B     		ldr	r3, .L7
 141 0058 0022     		movs	r2, #0
 142 005a 1A60     		str	r2, [r3]
  53:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
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
  54:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
  55:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void delay_micro(unsigned int us){
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
  56:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     while(us > 0){
 179              		.loc 1 56 0
 180 0078 0AE0     		b	.L10
 181              	.L11:
  57:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         delay_250ns();
 182              		.loc 1 57 0
 183 007a FFF7FEFF 		bl	delay_250ns
  58:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         delay_250ns();
 184              		.loc 1 58 0
 185 007e FFF7FEFF 		bl	delay_250ns
  59:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         delay_250ns();
 186              		.loc 1 59 0
 187 0082 FFF7FEFF 		bl	delay_250ns
  60:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         delay_250ns();
 188              		.loc 1 60 0
 189 0086 FFF7FEFF 		bl	delay_250ns
  61:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         us--;
 190              		.loc 1 61 0
 191 008a 7B68     		ldr	r3, [r7, #4]
 192 008c 013B     		subs	r3, r3, #1
 193 008e 7B60     		str	r3, [r7, #4]
 194              	.L10:
  56:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         delay_250ns();
 195              		.loc 1 56 0
 196 0090 7B68     		ldr	r3, [r7, #4]
 197 0092 002B     		cmp	r3, #0
 198 0094 F1D1     		bne	.L11
  62:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     }
  63:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
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
  64:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
  65:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void delay_milli(unsigned int ms){
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
  66:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
  67:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     while(ms--){
 230              		.loc 1 67 0
 231 00a6 02E0     		b	.L13
 232              	.L14:
  68:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         delay_micro(10);
 233              		.loc 1 68 0
 234 00a8 0A20     		movs	r0, #10
 235 00aa FFF7FEFF 		bl	delay_micro
 236              	.L13:
  67:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         delay_micro(10);
 237              		.loc 1 67 0
 238 00ae 7B68     		ldr	r3, [r7, #4]
 239 00b0 5A1E     		subs	r2, r3, #1
 240 00b2 7A60     		str	r2, [r7, #4]
 241 00b4 002B     		cmp	r3, #0
 242 00b6 F7D1     		bne	.L14
  69:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     }
  70:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     
  71:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
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
  72:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
  73:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
  74:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void ascii_ctrl_bit_set( unsigned char x){
 261              		.loc 1 74 0
 262              		.cfi_startproc
 263              		@ args = 0, pretend = 0, frame = 8
 264              		@ frame_needed = 1, uses_anonymous_args = 0
 265 00c0 80B5     		push	{r7, lr}
 266              		.cfi_def_cfa_offset 8
 267              		.cfi_offset 7, -8
 268              		.cfi_offset 14, -4
 269 00c2 82B0     		sub	sp, sp, #8
 270              		.cfi_def_cfa_offset 16
 271 00c4 00AF     		add	r7, sp, #0
 272              		.cfi_def_cfa_register 7
 273 00c6 0200     		movs	r2, r0
 274 00c8 FB1D     		adds	r3, r7, #7
 275 00ca 1A70     		strb	r2, [r3]
  75:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *portOdrLow |= (B_SELECT | x);
 276              		.loc 1 75 0
 277 00cc 074B     		ldr	r3, .L16
 278 00ce 1B78     		ldrb	r3, [r3]
 279 00d0 DAB2     		uxtb	r2, r3
 280 00d2 FB1D     		adds	r3, r7, #7
 281 00d4 1B78     		ldrb	r3, [r3]
 282 00d6 1343     		orrs	r3, r2
 283 00d8 DBB2     		uxtb	r3, r3
 284 00da 044A     		ldr	r2, .L16
 285 00dc 0421     		movs	r1, #4
 286 00de 0B43     		orrs	r3, r1
 287 00e0 DBB2     		uxtb	r3, r3
 288 00e2 1370     		strb	r3, [r2]
  76:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
 289              		.loc 1 76 0
 290 00e4 C046     		nop
 291 00e6 BD46     		mov	sp, r7
 292 00e8 02B0     		add	sp, sp, #8
 293              		@ sp needed
 294 00ea 80BD     		pop	{r7, pc}
 295              	.L17:
 296              		.align	2
 297              	.L16:
 298 00ec 14100240 		.word	1073877012
 299              		.cfi_endproc
 300              	.LFE5:
 302              		.align	1
 303              		.global	ascii_ctrl_bit_clear
 304              		.syntax unified
 305              		.code	16
 306              		.thumb_func
 307              		.fpu softvfp
 309              	ascii_ctrl_bit_clear:
 310              	.LFB6:
  77:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
  78:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void ascii_ctrl_bit_clear(unsigned char x){
 311              		.loc 1 78 0
 312              		.cfi_startproc
 313              		@ args = 0, pretend = 0, frame = 8
 314              		@ frame_needed = 1, uses_anonymous_args = 0
 315 00f0 80B5     		push	{r7, lr}
 316              		.cfi_def_cfa_offset 8
 317              		.cfi_offset 7, -8
 318              		.cfi_offset 14, -4
 319 00f2 82B0     		sub	sp, sp, #8
 320              		.cfi_def_cfa_offset 16
 321 00f4 00AF     		add	r7, sp, #0
 322              		.cfi_def_cfa_register 7
 323 00f6 0200     		movs	r2, r0
 324 00f8 FB1D     		adds	r3, r7, #7
 325 00fa 1A70     		strb	r2, [r3]
  79:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *portOdrLow &= (B_SELECT | ~x);
 326              		.loc 1 79 0
 327 00fc 0A4B     		ldr	r3, .L19
 328 00fe 1B78     		ldrb	r3, [r3]
 329 0100 DBB2     		uxtb	r3, r3
 330 0102 5BB2     		sxtb	r3, r3
 331 0104 FA1D     		adds	r2, r7, #7
 332 0106 1278     		ldrb	r2, [r2]
 333 0108 52B2     		sxtb	r2, r2
 334 010a D243     		mvns	r2, r2
 335 010c 52B2     		sxtb	r2, r2
 336 010e 0421     		movs	r1, #4
 337 0110 0A43     		orrs	r2, r1
 338 0112 52B2     		sxtb	r2, r2
 339 0114 1340     		ands	r3, r2
 340 0116 5AB2     		sxtb	r2, r3
 341 0118 034B     		ldr	r3, .L19
 342 011a D2B2     		uxtb	r2, r2
 343 011c 1A70     		strb	r2, [r3]
  80:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
 344              		.loc 1 80 0
 345 011e C046     		nop
 346 0120 BD46     		mov	sp, r7
 347 0122 02B0     		add	sp, sp, #8
 348              		@ sp needed
 349 0124 80BD     		pop	{r7, pc}
 350              	.L20:
 351 0126 C046     		.align	2
 352              	.L19:
 353 0128 14100240 		.word	1073877012
 354              		.cfi_endproc
 355              	.LFE6:
 357              		.align	1
 358              		.global	ascii_read_controller
 359              		.syntax unified
 360              		.code	16
 361              		.thumb_func
 362              		.fpu softvfp
 364              	ascii_read_controller:
 365              	.LFB7:
  81:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
  82:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** unsigned char ascii_read_controller( void ){
 366              		.loc 1 82 0
 367              		.cfi_startproc
 368              		@ args = 0, pretend = 0, frame = 8
 369              		@ frame_needed = 1, uses_anonymous_args = 0
 370 012c 80B5     		push	{r7, lr}
 371              		.cfi_def_cfa_offset 8
 372              		.cfi_offset 7, -8
 373              		.cfi_offset 14, -4
 374 012e 82B0     		sub	sp, sp, #8
 375              		.cfi_def_cfa_offset 16
 376 0130 00AF     		add	r7, sp, #0
 377              		.cfi_def_cfa_register 7
  83:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     unsigned char c;
  84:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_ctrl_bit_set( B_E );
 378              		.loc 1 84 0
 379 0132 4020     		movs	r0, #64
 380 0134 FFF7FEFF 		bl	ascii_ctrl_bit_set
  85:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     delay_250ns();
 381              		.loc 1 85 0
 382 0138 FFF7FEFF 		bl	delay_250ns
  86:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     delay_250ns();
 383              		.loc 1 86 0
 384 013c FFF7FEFF 		bl	delay_250ns
  87:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     c = *portIdrHigh;
 385              		.loc 1 87 0
 386 0140 064A     		ldr	r2, .L23
 387 0142 FB1D     		adds	r3, r7, #7
 388 0144 1278     		ldrb	r2, [r2]
 389 0146 1A70     		strb	r2, [r3]
  88:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_ctrl_bit_clear( B_E );
 390              		.loc 1 88 0
 391 0148 4020     		movs	r0, #64
 392 014a FFF7FEFF 		bl	ascii_ctrl_bit_clear
  89:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     return c;   
 393              		.loc 1 89 0
 394 014e FB1D     		adds	r3, r7, #7
 395 0150 1B78     		ldrb	r3, [r3]
  90:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
 396              		.loc 1 90 0
 397 0152 1800     		movs	r0, r3
 398 0154 BD46     		mov	sp, r7
 399 0156 02B0     		add	sp, sp, #8
 400              		@ sp needed
 401 0158 80BD     		pop	{r7, pc}
 402              	.L24:
 403 015a C046     		.align	2
 404              	.L23:
 405 015c 10100240 		.word	1073877008
 406              		.cfi_endproc
 407              	.LFE7:
 409              		.align	1
 410              		.global	ascii_write_controller
 411              		.syntax unified
 412              		.code	16
 413              		.thumb_func
 414              		.fpu softvfp
 416              	ascii_write_controller:
 417              	.LFB8:
  91:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
  92:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void ascii_write_controller( unsigned char c ){
 418              		.loc 1 92 0
 419              		.cfi_startproc
 420              		@ args = 0, pretend = 0, frame = 8
 421              		@ frame_needed = 1, uses_anonymous_args = 0
 422 0160 80B5     		push	{r7, lr}
 423              		.cfi_def_cfa_offset 8
 424              		.cfi_offset 7, -8
 425              		.cfi_offset 14, -4
 426 0162 82B0     		sub	sp, sp, #8
 427              		.cfi_def_cfa_offset 16
 428 0164 00AF     		add	r7, sp, #0
 429              		.cfi_def_cfa_register 7
 430 0166 0200     		movs	r2, r0
 431 0168 FB1D     		adds	r3, r7, #7
 432 016a 1A70     		strb	r2, [r3]
  93:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 	delay_250ns();
 433              		.loc 1 93 0
 434 016c FFF7FEFF 		bl	delay_250ns
  94:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_ctrl_bit_set( B_E );   // Synchronization signal =1
 435              		.loc 1 94 0
 436 0170 4020     		movs	r0, #64
 437 0172 FFF7FEFF 		bl	ascii_ctrl_bit_set
  95:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *portOdrHigh = c;            // Ger kommandot till porten
 438              		.loc 1 95 0
 439 0176 074A     		ldr	r2, .L26
 440 0178 FB1D     		adds	r3, r7, #7
 441 017a 1B78     		ldrb	r3, [r3]
 442 017c 1370     		strb	r3, [r2]
  96:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     delay_250ns();
 443              		.loc 1 96 0
 444 017e FFF7FEFF 		bl	delay_250ns
  97:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_ctrl_bit_clear( B_E ); // Stänger av synchronizatoin.
 445              		.loc 1 97 0
 446 0182 4020     		movs	r0, #64
 447 0184 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  98:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     delay_250ns();
 448              		.loc 1 98 0
 449 0188 FFF7FEFF 		bl	delay_250ns
  99:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
 450              		.loc 1 99 0
 451 018c C046     		nop
 452 018e BD46     		mov	sp, r7
 453 0190 02B0     		add	sp, sp, #8
 454              		@ sp needed
 455 0192 80BD     		pop	{r7, pc}
 456              	.L27:
 457              		.align	2
 458              	.L26:
 459 0194 15100240 		.word	1073877013
 460              		.cfi_endproc
 461              	.LFE8:
 463              		.align	1
 464              		.global	ascii_read_status
 465              		.syntax unified
 466              		.code	16
 467              		.thumb_func
 468              		.fpu softvfp
 470              	ascii_read_status:
 471              	.LFB9:
 100:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
 101:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** unsigned char ascii_read_status(){
 472              		.loc 1 101 0
 473              		.cfi_startproc
 474              		@ args = 0, pretend = 0, frame = 8
 475              		@ frame_needed = 1, uses_anonymous_args = 0
 476 0198 90B5     		push	{r4, r7, lr}
 477              		.cfi_def_cfa_offset 12
 478              		.cfi_offset 4, -12
 479              		.cfi_offset 7, -8
 480              		.cfi_offset 14, -4
 481 019a 83B0     		sub	sp, sp, #12
 482              		.cfi_def_cfa_offset 24
 483 019c 00AF     		add	r7, sp, #0
 484              		.cfi_def_cfa_register 7
 102:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     unsigned char c;
 103:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *portModer = 0x0000;   //GÖR OM PORTEN TILL INGÅNGAR
 485              		.loc 1 103 0
 486 019e 0B4B     		ldr	r3, .L30
 487 01a0 0022     		movs	r2, #0
 488 01a2 1A60     		str	r2, [r3]
 104:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_ctrl_bit_set( B_RW );   // ETT STÄLL READ/WRITE
 489              		.loc 1 104 0
 490 01a4 0220     		movs	r0, #2
 491 01a6 FFF7FEFF 		bl	ascii_ctrl_bit_set
 105:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_ctrl_bit_clear( B_RS );  //NOLLSTÄLL READ/ SET
 492              		.loc 1 105 0
 493 01aa 0120     		movs	r0, #1
 494 01ac FFF7FEFF 		bl	ascii_ctrl_bit_clear
 106:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     c = ascii_read_controller( );
 495              		.loc 1 106 0
 496 01b0 FC1D     		adds	r4, r7, #7
 497 01b2 FFF7FEFF 		bl	ascii_read_controller
 498 01b6 0300     		movs	r3, r0
 499 01b8 2370     		strb	r3, [r4]
 107:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *portModer = 0x5555;    //GÖR OM PORTEN TILL UTGÅNGAR
 500              		.loc 1 107 0
 501 01ba 044B     		ldr	r3, .L30
 502 01bc 044A     		ldr	r2, .L30+4
 503 01be 1A60     		str	r2, [r3]
 108:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** return c;
 504              		.loc 1 108 0
 505 01c0 FB1D     		adds	r3, r7, #7
 506 01c2 1B78     		ldrb	r3, [r3]
 109:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
 507              		.loc 1 109 0
 508 01c4 1800     		movs	r0, r3
 509 01c6 BD46     		mov	sp, r7
 510 01c8 03B0     		add	sp, sp, #12
 511              		@ sp needed
 512 01ca 90BD     		pop	{r4, r7, pc}
 513              	.L31:
 514              		.align	2
 515              	.L30:
 516 01cc 00100240 		.word	1073876992
 517 01d0 55550000 		.word	21845
 518              		.cfi_endproc
 519              	.LFE9:
 521              		.align	1
 522              		.global	ascii_write_cmd
 523              		.syntax unified
 524              		.code	16
 525              		.thumb_func
 526              		.fpu softvfp
 528              	ascii_write_cmd:
 529              	.LFB10:
 110:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
 111:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void ascii_write_cmd ( unsigned char command){
 530              		.loc 1 111 0
 531              		.cfi_startproc
 532              		@ args = 0, pretend = 0, frame = 8
 533              		@ frame_needed = 1, uses_anonymous_args = 0
 534 01d4 80B5     		push	{r7, lr}
 535              		.cfi_def_cfa_offset 8
 536              		.cfi_offset 7, -8
 537              		.cfi_offset 14, -4
 538 01d6 82B0     		sub	sp, sp, #8
 539              		.cfi_def_cfa_offset 16
 540 01d8 00AF     		add	r7, sp, #0
 541              		.cfi_def_cfa_register 7
 542 01da 0200     		movs	r2, r0
 543 01dc FB1D     		adds	r3, r7, #7
 544 01de 1A70     		strb	r2, [r3]
 112:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_ctrl_bit_clear(B_RS);
 545              		.loc 1 112 0
 546 01e0 0120     		movs	r0, #1
 547 01e2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 113:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_ctrl_bit_clear(B_RW);
 548              		.loc 1 113 0
 549 01e6 0220     		movs	r0, #2
 550 01e8 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 114:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_write_controller(command);
 551              		.loc 1 114 0
 552 01ec FB1D     		adds	r3, r7, #7
 553 01ee 1B78     		ldrb	r3, [r3]
 554 01f0 1800     		movs	r0, r3
 555 01f2 FFF7FEFF 		bl	ascii_write_controller
 115:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
 556              		.loc 1 115 0
 557 01f6 C046     		nop
 558 01f8 BD46     		mov	sp, r7
 559 01fa 02B0     		add	sp, sp, #8
 560              		@ sp needed
 561 01fc 80BD     		pop	{r7, pc}
 562              		.cfi_endproc
 563              	.LFE10:
 565              		.align	1
 566              		.global	ascii_write_data
 567              		.syntax unified
 568              		.code	16
 569              		.thumb_func
 570              		.fpu softvfp
 572              	ascii_write_data:
 573              	.LFB11:
 116:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
 117:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void ascii_write_data (unsigned char data){
 574              		.loc 1 117 0
 575              		.cfi_startproc
 576              		@ args = 0, pretend = 0, frame = 8
 577              		@ frame_needed = 1, uses_anonymous_args = 0
 578 01fe 80B5     		push	{r7, lr}
 579              		.cfi_def_cfa_offset 8
 580              		.cfi_offset 7, -8
 581              		.cfi_offset 14, -4
 582 0200 82B0     		sub	sp, sp, #8
 583              		.cfi_def_cfa_offset 16
 584 0202 00AF     		add	r7, sp, #0
 585              		.cfi_def_cfa_register 7
 586 0204 0200     		movs	r2, r0
 587 0206 FB1D     		adds	r3, r7, #7
 588 0208 1A70     		strb	r2, [r3]
 118:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_ctrl_bit_clear(B_RW);
 589              		.loc 1 118 0
 590 020a 0220     		movs	r0, #2
 591 020c FFF7FEFF 		bl	ascii_ctrl_bit_clear
 119:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_ctrl_bit_set(B_RS);
 592              		.loc 1 119 0
 593 0210 0120     		movs	r0, #1
 594 0212 FFF7FEFF 		bl	ascii_ctrl_bit_set
 120:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_write_controller(data);
 595              		.loc 1 120 0
 596 0216 FB1D     		adds	r3, r7, #7
 597 0218 1B78     		ldrb	r3, [r3]
 598 021a 1800     		movs	r0, r3
 599 021c FFF7FEFF 		bl	ascii_write_controller
 121:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
 600              		.loc 1 121 0
 601 0220 C046     		nop
 602 0222 BD46     		mov	sp, r7
 603 0224 02B0     		add	sp, sp, #8
 604              		@ sp needed
 605 0226 80BD     		pop	{r7, pc}
 606              		.cfi_endproc
 607              	.LFE11:
 609              		.align	1
 610              		.global	ascii_read_data
 611              		.syntax unified
 612              		.code	16
 613              		.thumb_func
 614              		.fpu softvfp
 616              	ascii_read_data:
 617              	.LFB12:
 122:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
 123:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void ascii_read_data(void){
 618              		.loc 1 123 0
 619              		.cfi_startproc
 620              		@ args = 0, pretend = 0, frame = 8
 621              		@ frame_needed = 1, uses_anonymous_args = 0
 622 0228 90B5     		push	{r4, r7, lr}
 623              		.cfi_def_cfa_offset 12
 624              		.cfi_offset 4, -12
 625              		.cfi_offset 7, -8
 626              		.cfi_offset 14, -4
 627 022a 83B0     		sub	sp, sp, #12
 628              		.cfi_def_cfa_offset 24
 629 022c 00AF     		add	r7, sp, #0
 630              		.cfi_def_cfa_register 7
 124:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     unsigned char c;
 125:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *portModer = 0x0000;
 631              		.loc 1 125 0
 632 022e 0A4B     		ldr	r3, .L36
 633 0230 0022     		movs	r2, #0
 634 0232 1A60     		str	r2, [r3]
 126:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_ctrl_bit_set(B_RS);
 635              		.loc 1 126 0
 636 0234 0120     		movs	r0, #1
 637 0236 FFF7FEFF 		bl	ascii_ctrl_bit_set
 127:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_ctrl_bit_set(B_RW);
 638              		.loc 1 127 0
 639 023a 0220     		movs	r0, #2
 640 023c FFF7FEFF 		bl	ascii_ctrl_bit_set
 128:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     c = ascii_read_controller();
 641              		.loc 1 128 0
 642 0240 FC1D     		adds	r4, r7, #7
 643 0242 FFF7FEFF 		bl	ascii_read_controller
 644 0246 0300     		movs	r3, r0
 645 0248 2370     		strb	r3, [r4]
 129:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     *portModer = 0x5555;
 646              		.loc 1 129 0
 647 024a 034B     		ldr	r3, .L36
 648 024c 034A     		ldr	r2, .L36+4
 649 024e 1A60     		str	r2, [r3]
 130:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     return c;
 650              		.loc 1 130 0
 651 0250 C046     		nop
 131:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
 652              		.loc 1 131 0
 653 0252 BD46     		mov	sp, r7
 654 0254 03B0     		add	sp, sp, #12
 655              		@ sp needed
 656 0256 90BD     		pop	{r4, r7, pc}
 657              	.L37:
 658              		.align	2
 659              	.L36:
 660 0258 00100240 		.word	1073876992
 661 025c 55550000 		.word	21845
 662              		.cfi_endproc
 663              	.LFE12:
 665              		.align	1
 666              		.global	ascii_clear_cmd
 667              		.syntax unified
 668              		.code	16
 669              		.thumb_func
 670              		.fpu softvfp
 672              	ascii_clear_cmd:
 673              	.LFB13:
 132:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void ascii_clear_cmd(unsigned char cmd){
 674              		.loc 1 132 0
 675              		.cfi_startproc
 676              		@ args = 0, pretend = 0, frame = 8
 677              		@ frame_needed = 1, uses_anonymous_args = 0
 678 0260 80B5     		push	{r7, lr}
 679              		.cfi_def_cfa_offset 8
 680              		.cfi_offset 7, -8
 681              		.cfi_offset 14, -4
 682 0262 82B0     		sub	sp, sp, #8
 683              		.cfi_def_cfa_offset 16
 684 0264 00AF     		add	r7, sp, #0
 685              		.cfi_def_cfa_register 7
 686 0266 0200     		movs	r2, r0
 687 0268 FB1D     		adds	r3, r7, #7
 688 026a 1A70     		strb	r2, [r3]
 133:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     while((ascii_read_status() & 0x80) == 0x80){
 689              		.loc 1 133 0
 690 026c 0AE0     		b	.L39
 691              	.L40:
 134:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         delay_micro(8);
 692              		.loc 1 134 0
 693 026e 0820     		movs	r0, #8
 694 0270 FFF7FEFF 		bl	delay_micro
 135:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         ascii_write_cmd(cmd);
 695              		.loc 1 135 0
 696 0274 FB1D     		adds	r3, r7, #7
 697 0276 1B78     		ldrb	r3, [r3]
 698 0278 1800     		movs	r0, r3
 699 027a FFF7FEFF 		bl	ascii_write_cmd
 136:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         delay_milli(2);
 700              		.loc 1 136 0
 701 027e 0220     		movs	r0, #2
 702 0280 FFF7FEFF 		bl	delay_milli
 703              	.L39:
 133:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         delay_micro(8);
 704              		.loc 1 133 0
 705 0284 FFF7FEFF 		bl	ascii_read_status
 706 0288 0300     		movs	r3, r0
 707 028a 1A00     		movs	r2, r3
 708 028c 8023     		movs	r3, #128
 709 028e 1340     		ands	r3, r2
 710 0290 802B     		cmp	r3, #128
 711 0292 ECD0     		beq	.L40
 137:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     }
 138:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
 712              		.loc 1 138 0
 713 0294 C046     		nop
 714 0296 BD46     		mov	sp, r7
 715 0298 02B0     		add	sp, sp, #8
 716              		@ sp needed
 717 029a 80BD     		pop	{r7, pc}
 718              		.cfi_endproc
 719              	.LFE13:
 721              		.align	1
 722              		.global	ascii_init
 723              		.syntax unified
 724              		.code	16
 725              		.thumb_func
 726              		.fpu softvfp
 728              	ascii_init:
 729              	.LFB14:
 139:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
 140:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void ascii_init(void){
 730              		.loc 1 140 0
 731              		.cfi_startproc
 732              		@ args = 0, pretend = 0, frame = 0
 733              		@ frame_needed = 1, uses_anonymous_args = 0
 734 029c 80B5     		push	{r7, lr}
 735              		.cfi_def_cfa_offset 8
 736              		.cfi_offset 7, -8
 737              		.cfi_offset 14, -4
 738 029e 00AF     		add	r7, sp, #0
 739              		.cfi_def_cfa_register 7
 141:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_write_cmd(0x38);
 740              		.loc 1 141 0
 741 02a0 3820     		movs	r0, #56
 742 02a2 FFF7FEFF 		bl	ascii_write_cmd
 142:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_write_cmd(0x0E);
 743              		.loc 1 142 0
 744 02a6 0E20     		movs	r0, #14
 745 02a8 FFF7FEFF 		bl	ascii_write_cmd
 143:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_clear_cmd(0x01);
 746              		.loc 1 143 0
 747 02ac 0120     		movs	r0, #1
 748 02ae FFF7FEFF 		bl	ascii_clear_cmd
 144:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_write_cmd(0x04);
 749              		.loc 1 144 0
 750 02b2 0420     		movs	r0, #4
 751 02b4 FFF7FEFF 		bl	ascii_write_cmd
 145:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
 146:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
 752              		.loc 1 146 0
 753 02b8 C046     		nop
 754 02ba BD46     		mov	sp, r7
 755              		@ sp needed
 756 02bc 80BD     		pop	{r7, pc}
 757              		.cfi_endproc
 758              	.LFE14:
 760              		.align	1
 761              		.global	ascii_gotoxy
 762              		.syntax unified
 763              		.code	16
 764              		.thumb_func
 765              		.fpu softvfp
 767              	ascii_gotoxy:
 768              	.LFB15:
 147:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
 148:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
 149:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void ascii_gotoxy( unsigned int x, unsigned int y) {
 769              		.loc 1 149 0
 770              		.cfi_startproc
 771              		@ args = 0, pretend = 0, frame = 16
 772              		@ frame_needed = 1, uses_anonymous_args = 0
 773 02be 80B5     		push	{r7, lr}
 774              		.cfi_def_cfa_offset 8
 775              		.cfi_offset 7, -8
 776              		.cfi_offset 14, -4
 777 02c0 84B0     		sub	sp, sp, #16
 778              		.cfi_def_cfa_offset 24
 779 02c2 00AF     		add	r7, sp, #0
 780              		.cfi_def_cfa_register 7
 781 02c4 7860     		str	r0, [r7, #4]
 782 02c6 3960     		str	r1, [r7]
 150:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     unsigned char address = x-1;
 783              		.loc 1 150 0
 784 02c8 7B68     		ldr	r3, [r7, #4]
 785 02ca DAB2     		uxtb	r2, r3
 786 02cc 0F23     		movs	r3, #15
 787 02ce FB18     		adds	r3, r7, r3
 788 02d0 013A     		subs	r2, r2, #1
 789 02d2 1A70     		strb	r2, [r3]
 151:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     if(y != 1){
 790              		.loc 1 151 0
 791 02d4 3B68     		ldr	r3, [r7]
 792 02d6 012B     		cmp	r3, #1
 793 02d8 0CD0     		beq	.L43
 152:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         address +=0x40 | (x-1);
 794              		.loc 1 152 0
 795 02da 7B68     		ldr	r3, [r7, #4]
 796 02dc DBB2     		uxtb	r3, r3
 797 02de 013B     		subs	r3, r3, #1
 798 02e0 DBB2     		uxtb	r3, r3
 799 02e2 4022     		movs	r2, #64
 800 02e4 1343     		orrs	r3, r2
 801 02e6 D9B2     		uxtb	r1, r3
 802 02e8 0F22     		movs	r2, #15
 803 02ea BB18     		adds	r3, r7, r2
 804 02ec BA18     		adds	r2, r7, r2
 805 02ee 1278     		ldrb	r2, [r2]
 806 02f0 8A18     		adds	r2, r1, r2
 807 02f2 1A70     		strb	r2, [r3]
 808              	.L43:
 153:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** } 
 154:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_write_cmd( 0x80 | address);
 809              		.loc 1 154 0
 810 02f4 0F23     		movs	r3, #15
 811 02f6 FB18     		adds	r3, r7, r3
 812 02f8 1B78     		ldrb	r3, [r3]
 813 02fa 8022     		movs	r2, #128
 814 02fc 5242     		rsbs	r2, r2, #0
 815 02fe 1343     		orrs	r3, r2
 816 0300 DBB2     		uxtb	r3, r3
 817 0302 1800     		movs	r0, r3
 818 0304 FFF7FEFF 		bl	ascii_write_cmd
 155:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     delay_micro(45);
 819              		.loc 1 155 0
 820 0308 2D20     		movs	r0, #45
 821 030a FFF7FEFF 		bl	delay_micro
 156:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
 822              		.loc 1 156 0
 823 030e C046     		nop
 824 0310 BD46     		mov	sp, r7
 825 0312 04B0     		add	sp, sp, #16
 826              		@ sp needed
 827 0314 80BD     		pop	{r7, pc}
 828              		.cfi_endproc
 829              	.LFE15:
 831              		.align	1
 832              		.global	ascii_write_char
 833              		.syntax unified
 834              		.code	16
 835              		.thumb_func
 836              		.fpu softvfp
 838              	ascii_write_char:
 839              	.LFB16:
 157:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
 158:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void ascii_write_char( unsigned char c){
 840              		.loc 1 158 0
 841              		.cfi_startproc
 842              		@ args = 0, pretend = 0, frame = 8
 843              		@ frame_needed = 1, uses_anonymous_args = 0
 844 0316 80B5     		push	{r7, lr}
 845              		.cfi_def_cfa_offset 8
 846              		.cfi_offset 7, -8
 847              		.cfi_offset 14, -4
 848 0318 82B0     		sub	sp, sp, #8
 849              		.cfi_def_cfa_offset 16
 850 031a 00AF     		add	r7, sp, #0
 851              		.cfi_def_cfa_register 7
 852 031c 0200     		movs	r2, r0
 853 031e FB1D     		adds	r3, r7, #7
 854 0320 1A70     		strb	r2, [r3]
 159:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     while((ascii_read_status() & 0x80) == 0x80){
 855              		.loc 1 159 0
 856 0322 07E0     		b	.L45
 857              	.L46:
 160:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         delay_micro(8);
 858              		.loc 1 160 0
 859 0324 0820     		movs	r0, #8
 860 0326 FFF7FEFF 		bl	delay_micro
 161:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         ascii_write_data(c);
 861              		.loc 1 161 0
 862 032a FB1D     		adds	r3, r7, #7
 863 032c 1B78     		ldrb	r3, [r3]
 864 032e 1800     		movs	r0, r3
 865 0330 FFF7FEFF 		bl	ascii_write_data
 866              	.L45:
 159:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     while((ascii_read_status() & 0x80) == 0x80){
 867              		.loc 1 159 0
 868 0334 FFF7FEFF 		bl	ascii_read_status
 869 0338 0300     		movs	r3, r0
 870 033a 1A00     		movs	r2, r3
 871 033c 8023     		movs	r3, #128
 872 033e 1340     		ands	r3, r2
 873 0340 802B     		cmp	r3, #128
 874 0342 EFD0     		beq	.L46
 162:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     }
 163:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     
 164:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }
 875              		.loc 1 164 0
 876 0344 C046     		nop
 877 0346 BD46     		mov	sp, r7
 878 0348 02B0     		add	sp, sp, #8
 879              		@ sp needed
 880 034a 80BD     		pop	{r7, pc}
 881              		.cfi_endproc
 882              	.LFE16:
 884              		.section	.rodata
 885              		.align	2
 886              	.LC0:
 887 0000 416C6661 		.ascii	"Alfanumerisk\000"
 887      6E756D65 
 887      7269736B 
 887      00
 888 000d 000000   		.align	2
 889              	.LC2:
 890 0010 44697370 		.ascii	"Display - test\000"
 890      6C617920 
 890      2D207465 
 890      737400
 891              		.text
 892              		.align	1
 893              		.global	main
 894              		.syntax unified
 895              		.code	16
 896              		.thumb_func
 897              		.fpu softvfp
 899              	main:
 900              	.LFB17:
 165:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 
 166:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** void main(void){
 901              		.loc 1 166 0
 902              		.cfi_startproc
 903              		@ args = 0, pretend = 0, frame = 40
 904              		@ frame_needed = 1, uses_anonymous_args = 0
 905 034c B0B5     		push	{r4, r5, r7, lr}
 906              		.cfi_def_cfa_offset 16
 907              		.cfi_offset 4, -16
 908              		.cfi_offset 5, -12
 909              		.cfi_offset 7, -8
 910              		.cfi_offset 14, -4
 911 034e 8AB0     		sub	sp, sp, #40
 912              		.cfi_def_cfa_offset 56
 913 0350 00AF     		add	r7, sp, #0
 914              		.cfi_def_cfa_register 7
 167:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     char *s;
 168:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     char test1[] = "Alfanumerisk";
 915              		.loc 1 168 0
 916 0352 1424     		movs	r4, #20
 917 0354 3B19     		adds	r3, r7, r4
 918 0356 1C4A     		ldr	r2, .L52
 919 0358 23CA     		ldmia	r2!, {r0, r1, r5}
 920 035a 23C3     		stmia	r3!, {r0, r1, r5}
 921 035c 1278     		ldrb	r2, [r2]
 922 035e 1A70     		strb	r2, [r3]
 169:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     char test2[] = "Display - test";
 923              		.loc 1 169 0
 924 0360 3B1D     		adds	r3, r7, #4
 925 0362 1A4A     		ldr	r2, .L52+4
 926 0364 23CA     		ldmia	r2!, {r0, r1, r5}
 927 0366 23C3     		stmia	r3!, {r0, r1, r5}
 928 0368 1188     		ldrh	r1, [r2]
 929 036a 1980     		strh	r1, [r3]
 930 036c 9278     		ldrb	r2, [r2, #2]
 931 036e 9A70     		strb	r2, [r3, #2]
 170:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     
 171:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     init_app();
 932              		.loc 1 171 0
 933 0370 FFF7FEFF 		bl	init_app
 172:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_init();
 934              		.loc 1 172 0
 935 0374 FFF7FEFF 		bl	ascii_init
 173:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_gotoxy(1,1);
 936              		.loc 1 173 0
 937 0378 0121     		movs	r1, #1
 938 037a 0120     		movs	r0, #1
 939 037c FFF7FEFF 		bl	ascii_gotoxy
 174:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     s = test1;
 940              		.loc 1 174 0
 941 0380 3B19     		adds	r3, r7, r4
 942 0382 7B62     		str	r3, [r7, #36]
 175:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 	
 176:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     while (*s){
 943              		.loc 1 176 0
 944 0384 06E0     		b	.L48
 945              	.L49:
 177:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         ascii_write_char( *s++);
 946              		.loc 1 177 0
 947 0386 7B6A     		ldr	r3, [r7, #36]
 948 0388 5A1C     		adds	r2, r3, #1
 949 038a 7A62     		str	r2, [r7, #36]
 950 038c 1B78     		ldrb	r3, [r3]
 951 038e 1800     		movs	r0, r3
 952 0390 FFF7FEFF 		bl	ascii_write_char
 953              	.L48:
 176:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         ascii_write_char( *s++);
 954              		.loc 1 176 0
 955 0394 7B6A     		ldr	r3, [r7, #36]
 956 0396 1B78     		ldrb	r3, [r3]
 957 0398 002B     		cmp	r3, #0
 958 039a F4D1     		bne	.L49
 178:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     }
 179:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     ascii_gotoxy(1,2);
 959              		.loc 1 179 0
 960 039c 0221     		movs	r1, #2
 961 039e 0120     		movs	r0, #1
 962 03a0 FFF7FEFF 		bl	ascii_gotoxy
 180:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     s = test2;
 963              		.loc 1 180 0
 964 03a4 3B1D     		adds	r3, r7, #4
 965 03a6 7B62     		str	r3, [r7, #36]
 181:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** 	
 182:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     while(*s){
 966              		.loc 1 182 0
 967 03a8 06E0     		b	.L50
 968              	.L51:
 183:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         ascii_write_char(*s++);
 969              		.loc 1 183 0
 970 03aa 7B6A     		ldr	r3, [r7, #36]
 971 03ac 5A1C     		adds	r2, r3, #1
 972 03ae 7A62     		str	r2, [r7, #36]
 973 03b0 1B78     		ldrb	r3, [r3]
 974 03b2 1800     		movs	r0, r3
 975 03b4 FFF7FEFF 		bl	ascii_write_char
 976              	.L50:
 182:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****         ascii_write_char(*s++);
 977              		.loc 1 182 0
 978 03b8 7B6A     		ldr	r3, [r7, #36]
 979 03ba 1B78     		ldrb	r3, [r3]
 980 03bc 002B     		cmp	r3, #0
 981 03be F4D1     		bne	.L51
 184:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c ****     }
 185:/home/tom/Documents/WORK/MachineOrientedProgramming/upg57_2/startup.c **** }...
 982              		.loc 1 185 0
 983 03c0 C046     		nop
 984 03c2 BD46     		mov	sp, r7
 985 03c4 0AB0     		add	sp, sp, #40
 986              		@ sp needed
 987 03c6 B0BD     		pop	{r4, r5, r7, pc}
 988              	.L53:
 989              		.align	2
 990              	.L52:
 991 03c8 00000000 		.word	.LC0
 992 03cc 10000000 		.word	.LC2
 993              		.cfi_endproc
 994              	.LFE17:
 996              	.Letext0:
