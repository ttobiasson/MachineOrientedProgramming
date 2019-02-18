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
   8:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_MODER_LH 	((volatile unsigned char*)PORT_BASE_E+0x01)
   9:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_OTYPER 	((volatile unsigned int*) PORT_BASE_E+0x04)
  10:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_OSPEEDR    ((volatile unsigned int*) PORT_BASE_E+0x08)
  11:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_PUPDR  	((volatile unsigned int*) PORT_BASE_E+0x0C)
  12:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*Definiera byte-adresser för data och styrregister*/
  13:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_IDR_LOW 	((volatile unsigned char*) PORT_BASE_E+0x10)
  14:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_IDR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x10)
  15:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_ODR_LOW  	((volatile unsigned char*) PORT_BASE_E+0x14)
  16:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define PORT_ODR_HIGH 	((volatile unsigned char*) PORT_BASE_E+0x15)
  17:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*Definiera lämpliga definitioner för de olika bitarna i styrregistret*/
  18:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_RST 	0x20
  19:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_CS2 	0x10	
  20:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_CS1 	0x08
  21:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_E 	0x40	
  22:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_RW 	0x02		
  23:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define B_RS 	0x01				
  24:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*STK DELAY*/
  25:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_CTRL ((volatile unsigned int*)(0xE000E010))
  26:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_LOAD ((volatile unsigned int*)(0xE000E014))
  27:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_VAL  ((volatile unsigned int*)(0xE000E018))
  28:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  29:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  30:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void startup ( void )
  31:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** {
  26              		.loc 1 31 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  32:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** asm volatile(
  31              		.loc 1 32 0
  32              		.syntax divided
  33              	@ 32 "/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  33:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  34:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" MOV SP,R0\n"
  35:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" BL main\n"				/* call main */
  36:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	".L1: B .L1\n"				/* never return */
  37:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	) ;
  38:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
  40              		.loc 1 38 0
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
  39:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_250ns(void){
  57              		.loc 1 39 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  40:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 0;
  67              		.loc 1 40 0
  68 0004 0C4B     		ldr	r3, .L4
  69 0006 0022     		movs	r2, #0
  70 0008 1A60     		str	r2, [r3]
  41:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_LOAD = ((168/4)-1);
  71              		.loc 1 41 0
  72 000a 0C4B     		ldr	r3, .L4+4
  73 000c 2922     		movs	r2, #41
  74 000e 1A60     		str	r2, [r3]
  42:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_VAL  = 0;
  75              		.loc 1 42 0
  76 0010 0B4B     		ldr	r3, .L4+8
  77 0012 0022     		movs	r2, #0
  78 0014 1A60     		str	r2, [r3]
  43:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 5;
  79              		.loc 1 43 0
  80 0016 084B     		ldr	r3, .L4
  81 0018 0522     		movs	r2, #5
  82 001a 1A60     		str	r2, [r3]
  44:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while( (*STK_CTRL & 0x10000)== 0){}
  83              		.loc 1 44 0
  84 001c C046     		nop
  85              	.L3:
  86              		.loc 1 44 0 is_stmt 0 discriminator 1
  87 001e 064B     		ldr	r3, .L4
  88 0020 1A68     		ldr	r2, [r3]
  89 0022 8023     		movs	r3, #128
  90 0024 5B02     		lsls	r3, r3, #9
  91 0026 1340     		ands	r3, r2
  92 0028 F9D0     		beq	.L3
  45:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 0;
  93              		.loc 1 45 0 is_stmt 1
  94 002a 034B     		ldr	r3, .L4
  95 002c 0022     		movs	r2, #0
  96 002e 1A60     		str	r2, [r3]
  46:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
  97              		.loc 1 46 0
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
  47:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_500ns(void){
 120              		.loc 1 47 0
 121              		.cfi_startproc
 122              		@ args = 0, pretend = 0, frame = 0
 123              		@ frame_needed = 1, uses_anonymous_args = 0
 124 0044 80B5     		push	{r7, lr}
 125              		.cfi_def_cfa_offset 8
 126              		.cfi_offset 7, -8
 127              		.cfi_offset 14, -4
 128 0046 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
  48:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_250ns();
 130              		.loc 1 48 0
 131 0048 FFF7FEFF 		bl	delay_250ns
  49:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_250ns();
 132              		.loc 1 49 0
 133 004c FFF7FEFF 		bl	delay_250ns
  50:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 134              		.loc 1 50 0
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
  51:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_micro(unsigned int us){
 151              		.loc 1 51 0
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
  52:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(us--){
 164              		.loc 1 52 0
 165 005e 07E0     		b	.L8
 166              	.L9:
  53:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 167              		.loc 1 53 0
 168 0060 FFF7FEFF 		bl	delay_250ns
  54:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 169              		.loc 1 54 0
 170 0064 FFF7FEFF 		bl	delay_250ns
  55:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 171              		.loc 1 55 0
 172 0068 FFF7FEFF 		bl	delay_250ns
  56:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 173              		.loc 1 56 0
 174 006c FFF7FEFF 		bl	delay_250ns
 175              	.L8:
  52:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 176              		.loc 1 52 0
 177 0070 7B68     		ldr	r3, [r7, #4]
 178 0072 5A1E     		subs	r2, r3, #1
 179 0074 7A60     		str	r2, [r7, #4]
 180 0076 002B     		cmp	r3, #0
 181 0078 F2D1     		bne	.L9
  57:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     }
  58:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 182              		.loc 1 58 0
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
  59:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_milli(unsigned int ms){
 200              		.loc 1 59 0
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
  60:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(ms--){
 213              		.loc 1 60 0
 214 008a 02E0     		b	.L11
 215              	.L12:
  61:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_micro(10);
 216              		.loc 1 61 0
 217 008c 0A20     		movs	r0, #10
 218 008e FFF7FEFF 		bl	delay_micro
 219              	.L11:
  60:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(ms--){
 220              		.loc 1 60 0
 221 0092 7B68     		ldr	r3, [r7, #4]
 222 0094 5A1E     		subs	r2, r3, #1
 223 0096 7A60     		str	r2, [r7, #4]
 224 0098 002B     		cmp	r3, #0
 225 009a F7D1     		bne	.L12
  62:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     }
  63:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     
  64:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 226              		.loc 1 64 0
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
  65:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** typedef unsigned char uint8_t;
  66:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  67:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_ctrl_bit_set(uint8_t x){
 244              		.loc 1 67 0
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
  68:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW |= x;
 259              		.loc 1 68 0
 260 00b0 0A4B     		ldr	r3, .L14
 261 00b2 1B78     		ldrb	r3, [r3]
 262 00b4 DAB2     		uxtb	r2, r3
 263 00b6 0949     		ldr	r1, .L14
 264 00b8 FB1D     		adds	r3, r7, #7
 265 00ba 1B78     		ldrb	r3, [r3]
 266 00bc 1343     		orrs	r3, r2
 267 00be DBB2     		uxtb	r3, r3
 268 00c0 0B70     		strb	r3, [r1]
  69:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW &= ~(1UL << 2);
 269              		.loc 1 69 0
 270 00c2 064B     		ldr	r3, .L14
 271 00c4 1B78     		ldrb	r3, [r3]
 272 00c6 DBB2     		uxtb	r3, r3
 273 00c8 044A     		ldr	r2, .L14
 274 00ca 0421     		movs	r1, #4
 275 00cc 8B43     		bics	r3, r1
 276 00ce DBB2     		uxtb	r3, r3
 277 00d0 1370     		strb	r3, [r2]
  70:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  71:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 278              		.loc 1 71 0
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
  72:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_ctrl_bit_clear(uint8_t x){
 300              		.loc 1 72 0
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
  73:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW &= ~x;
 315              		.loc 1 73 0
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
  74:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW &= ~(1UL << 2);
 330              		.loc 1 74 0
 331 0108 054B     		ldr	r3, .L17
 332 010a 1B78     		ldrb	r3, [r3]
 333 010c DBB2     		uxtb	r3, r3
 334 010e 044A     		ldr	r2, .L17
 335 0110 0421     		movs	r1, #4
 336 0112 8B43     		bics	r3, r1
 337 0114 DBB2     		uxtb	r3, r3
 338 0116 1370     		strb	r3, [r2]
  75:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  76:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  77:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 339              		.loc 1 77 0
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
  78:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void select_controller(uint8_t controller){
 361              		.loc 1 78 0
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
  79:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	switch(controller){
 376              		.loc 1 79 0
 377 0130 FB1D     		adds	r3, r7, #7
 378 0132 1B78     		ldrb	r3, [r3]
 379 0134 012B     		cmp	r3, #1
 380 0136 1DD0     		beq	.L21
 381 0138 02DC     		bgt	.L22
 382 013a 002B     		cmp	r3, #0
 383 013c 05D0     		beq	.L23
  80:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case 0:
  81:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
  82:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
  83:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  84:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1:
  85:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS1);
  86:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
  87:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  88:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS2:
  89:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
  90:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
  91:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  92:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1 && B_CS2:
  93:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS1);
  94:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
  95:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  96:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
  97:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		
  98:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
  99:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 384              		.loc 1 99 0
 385 013e 20E0     		b	.L26
 386              	.L22:
  79:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	switch(controller){
 387              		.loc 1 79 0
 388 0140 082B     		cmp	r3, #8
 389 0142 09D0     		beq	.L24
 390 0144 102B     		cmp	r3, #16
 391 0146 0ED0     		beq	.L25
 392              		.loc 1 99 0
 393 0148 1BE0     		b	.L26
 394              	.L23:
  81:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 395              		.loc 1 81 0
 396 014a 0820     		movs	r0, #8
 397 014c FFF7FEFF 		bl	graphic_ctrl_bit_clear
  82:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 398              		.loc 1 82 0
 399 0150 1020     		movs	r0, #16
 400 0152 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  83:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1:
 401              		.loc 1 83 0
 402 0156 14E0     		b	.L20
 403              	.L24:
  85:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 404              		.loc 1 85 0
 405 0158 0820     		movs	r0, #8
 406 015a FFF7FEFF 		bl	graphic_ctrl_bit_set
  86:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 407              		.loc 1 86 0
 408 015e 1020     		movs	r0, #16
 409 0160 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  87:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS2:
 410              		.loc 1 87 0
 411 0164 0DE0     		b	.L20
 412              	.L25:
  89:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 413              		.loc 1 89 0
 414 0166 0820     		movs	r0, #8
 415 0168 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  90:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 416              		.loc 1 90 0
 417 016c 1020     		movs	r0, #16
 418 016e FFF7FEFF 		bl	graphic_ctrl_bit_set
  91:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1 && B_CS2:
 419              		.loc 1 91 0
 420 0172 06E0     		b	.L20
 421              	.L21:
  93:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 422              		.loc 1 93 0
 423 0174 0820     		movs	r0, #8
 424 0176 FFF7FEFF 		bl	graphic_ctrl_bit_set
  94:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 425              		.loc 1 94 0
 426 017a 1020     		movs	r0, #16
 427 017c FFF7FEFF 		bl	graphic_ctrl_bit_set
  95:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 428              		.loc 1 95 0
 429 0180 C046     		nop
 430              	.L20:
 431              	.L26:
 432              		.loc 1 99 0
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
 100:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_wait_ready(void){
 450              		.loc 1 100 0
 451              		.cfi_startproc
 452              		@ args = 0, pretend = 0, frame = 0
 453              		@ frame_needed = 1, uses_anonymous_args = 0
 454 018a 80B5     		push	{r7, lr}
 455              		.cfi_def_cfa_offset 8
 456              		.cfi_offset 7, -8
 457              		.cfi_offset 14, -4
 458 018c 00AF     		add	r7, sp, #0
 459              		.cfi_def_cfa_register 7
 101:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_CS2);
 460              		.loc 1 101 0
 461 018e 1020     		movs	r0, #16
 462 0190 FFF7FEFF 		bl	graphic_ctrl_bit_set
 102:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 463              		.loc 1 102 0
 464 0194 C046     		nop
 465 0196 BD46     		mov	sp, r7
 466              		@ sp needed
 467 0198 80BD     		pop	{r7, pc}
 468              		.cfi_endproc
 469              	.LFE8:
 471              		.align	1
 472              		.global	main
 473              		.syntax unified
 474              		.code	16
 475              		.thumb_func
 476              		.fpu softvfp
 478              	main:
 479              	.LFB9:
 103:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
 104:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** int main(void){
 480              		.loc 1 104 0
 481              		.cfi_startproc
 482              		@ args = 0, pretend = 0, frame = 0
 483              		@ frame_needed = 1, uses_anonymous_args = 0
 484 019a 80B5     		push	{r7, lr}
 485              		.cfi_def_cfa_offset 8
 486              		.cfi_offset 7, -8
 487              		.cfi_offset 14, -4
 488 019c 00AF     		add	r7, sp, #0
 489              		.cfi_def_cfa_register 7
 105:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	return 0;
 490              		.loc 1 105 0
 491 019e 0023     		movs	r3, #0
 106:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 107:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 492              		.loc 1 107 0
 493 01a0 1800     		movs	r0, r3
 494 01a2 BD46     		mov	sp, r7
 495              		@ sp needed
 496 01a4 80BD     		pop	{r7, pc}
 497              		.cfi_endproc
 498              	.LFE9:
 500              	.Letext0:
