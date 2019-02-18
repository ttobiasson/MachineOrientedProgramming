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
  25:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*LCD-BUSY-bitens address och andra LCD relaterade saker*/
  26:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_BUSY 		0x80
  27:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_OFF 		0x3E
  28:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_ON			0x3F
  29:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_DISP_START	0xC
  30:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_SET_ADD		0x2
  31:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define LCD_SET_PAGE	0xB8
  32:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		/*STK DELAY*/
  33:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_CTRL ((volatile unsigned int*)(0xE000E010))
  34:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_LOAD ((volatile unsigned int*)(0xE000E014))
  35:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #define STK_VAL  ((volatile unsigned int*)(0xE000E018))
  36:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  37:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  38:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void startup ( void )
  39:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** {
  26              		.loc 1 39 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  40:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** asm volatile(
  31              		.loc 1 40 0
  32              		.syntax divided
  33              	@ 40 "/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  41:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  42:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" MOV SP,R0\n"
  43:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	" BL main\n"				/* call main */
  44:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	".L1: B .L1\n"				/* never return */
  45:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	) ;
  46:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
  40              		.loc 1 46 0
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
  47:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_250ns(void){
  57              		.loc 1 47 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  48:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 0;
  67              		.loc 1 48 0
  68 0004 0C4B     		ldr	r3, .L4
  69 0006 0022     		movs	r2, #0
  70 0008 1A60     		str	r2, [r3]
  49:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_LOAD = ((168/4)-1);
  71              		.loc 1 49 0
  72 000a 0C4B     		ldr	r3, .L4+4
  73 000c 2922     		movs	r2, #41
  74 000e 1A60     		str	r2, [r3]
  50:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_VAL  = 0;
  75              		.loc 1 50 0
  76 0010 0B4B     		ldr	r3, .L4+8
  77 0012 0022     		movs	r2, #0
  78 0014 1A60     		str	r2, [r3]
  51:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 5;
  79              		.loc 1 51 0
  80 0016 084B     		ldr	r3, .L4
  81 0018 0522     		movs	r2, #5
  82 001a 1A60     		str	r2, [r3]
  52:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while( (*STK_CTRL & 0x10000)== 0){}
  83              		.loc 1 52 0
  84 001c C046     		nop
  85              	.L3:
  86              		.loc 1 52 0 is_stmt 0 discriminator 1
  87 001e 064B     		ldr	r3, .L4
  88 0020 1A68     		ldr	r2, [r3]
  89 0022 8023     		movs	r3, #128
  90 0024 5B02     		lsls	r3, r3, #9
  91 0026 1340     		ands	r3, r2
  92 0028 F9D0     		beq	.L3
  53:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     *STK_CTRL = 0;
  93              		.loc 1 53 0 is_stmt 1
  94 002a 034B     		ldr	r3, .L4
  95 002c 0022     		movs	r2, #0
  96 002e 1A60     		str	r2, [r3]
  54:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
  97              		.loc 1 54 0
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
  55:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_500ns(void){
 120              		.loc 1 55 0
 121              		.cfi_startproc
 122              		@ args = 0, pretend = 0, frame = 0
 123              		@ frame_needed = 1, uses_anonymous_args = 0
 124 0044 80B5     		push	{r7, lr}
 125              		.cfi_def_cfa_offset 8
 126              		.cfi_offset 7, -8
 127              		.cfi_offset 14, -4
 128 0046 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
  56:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_250ns();
 130              		.loc 1 56 0
 131 0048 FFF7FEFF 		bl	delay_250ns
  57:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_250ns();
 132              		.loc 1 57 0
 133 004c FFF7FEFF 		bl	delay_250ns
  58:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 134              		.loc 1 58 0
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
  59:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_micro(unsigned int us){
 151              		.loc 1 59 0
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
  60:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(us--){
 164              		.loc 1 60 0
 165 005e 07E0     		b	.L8
 166              	.L9:
  61:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 167              		.loc 1 61 0
 168 0060 FFF7FEFF 		bl	delay_250ns
  62:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 169              		.loc 1 62 0
 170 0064 FFF7FEFF 		bl	delay_250ns
  63:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 171              		.loc 1 63 0
 172 0068 FFF7FEFF 		bl	delay_250ns
  64:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 173              		.loc 1 64 0
 174 006c FFF7FEFF 		bl	delay_250ns
 175              	.L8:
  60:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_250ns();
 176              		.loc 1 60 0
 177 0070 7B68     		ldr	r3, [r7, #4]
 178 0072 5A1E     		subs	r2, r3, #1
 179 0074 7A60     		str	r2, [r7, #4]
 180 0076 002B     		cmp	r3, #0
 181 0078 F2D1     		bne	.L9
  65:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     }
  66:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 182              		.loc 1 66 0
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
  67:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void delay_milli(unsigned int ms){
 200              		.loc 1 67 0
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
  68:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(ms--){
 213              		.loc 1 68 0
 214 008a 02E0     		b	.L11
 215              	.L12:
  69:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****         delay_micro(10);
 216              		.loc 1 69 0
 217 008c 0A20     		movs	r0, #10
 218 008e FFF7FEFF 		bl	delay_micro
 219              	.L11:
  68:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     while(ms--){
 220              		.loc 1 68 0
 221 0092 7B68     		ldr	r3, [r7, #4]
 222 0094 5A1E     		subs	r2, r3, #1
 223 0096 7A60     		str	r2, [r7, #4]
 224 0098 002B     		cmp	r3, #0
 225 009a F7D1     		bne	.L12
  70:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     }
  71:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c ****     
  72:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 226              		.loc 1 72 0
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
  73:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** typedef unsigned char uint8_t;
  74:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  75:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_ctrl_bit_set(uint8_t x){
 244              		.loc 1 75 0
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
  76:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW |= x;
 259              		.loc 1 76 0
 260 00b0 0A4B     		ldr	r3, .L14
 261 00b2 1B78     		ldrb	r3, [r3]
 262 00b4 DAB2     		uxtb	r2, r3
 263 00b6 0949     		ldr	r1, .L14
 264 00b8 FB1D     		adds	r3, r7, #7
 265 00ba 1B78     		ldrb	r3, [r3]
 266 00bc 1343     		orrs	r3, r2
 267 00be DBB2     		uxtb	r3, r3
 268 00c0 0B70     		strb	r3, [r1]
  77:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW &= ~(1UL << 2);
 269              		.loc 1 77 0
 270 00c2 064B     		ldr	r3, .L14
 271 00c4 1B78     		ldrb	r3, [r3]
 272 00c6 DBB2     		uxtb	r3, r3
 273 00c8 044A     		ldr	r2, .L14
 274 00ca 0421     		movs	r1, #4
 275 00cc 8B43     		bics	r3, r1
 276 00ce DBB2     		uxtb	r3, r3
 277 00d0 1370     		strb	r3, [r2]
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
  81:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW &= ~x;
 315              		.loc 1 81 0
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
  82:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_ODR_LOW &= ~(1UL << 2);
 330              		.loc 1 82 0
 331 0108 054B     		ldr	r3, .L17
 332 010a 1B78     		ldrb	r3, [r3]
 333 010c DBB2     		uxtb	r3, r3
 334 010e 044A     		ldr	r2, .L17
 335 0110 0421     		movs	r1, #4
 336 0112 8B43     		bics	r3, r1
 337 0114 DBB2     		uxtb	r3, r3
 338 0116 1370     		strb	r3, [r2]
  83:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  84:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
  85:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 339              		.loc 1 85 0
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
  86:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void select_controller(uint8_t controller){
 361              		.loc 1 86 0
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
  87:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	switch(controller){
 376              		.loc 1 87 0
 377 0130 FB1D     		adds	r3, r7, #7
 378 0132 1B78     		ldrb	r3, [r3]
 379 0134 012B     		cmp	r3, #1
 380 0136 1DD0     		beq	.L21
 381 0138 02DC     		bgt	.L22
 382 013a 002B     		cmp	r3, #0
 383 013c 05D0     		beq	.L23
  88:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case 0:
  89:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
  90:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
  91:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  92:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1:
  93:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS1);
  94:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
  95:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
  96:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS2:
  97:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
  98:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
  99:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 100:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1 && B_CS2:
 101:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS1);
 102:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 103:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 104:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 105:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		
 106:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 107:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 384              		.loc 1 107 0
 385 013e 20E0     		b	.L26
 386              	.L22:
  87:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	switch(controller){
 387              		.loc 1 87 0
 388 0140 082B     		cmp	r3, #8
 389 0142 09D0     		beq	.L24
 390 0144 102B     		cmp	r3, #16
 391 0146 0ED0     		beq	.L25
 392              		.loc 1 107 0
 393 0148 1BE0     		b	.L26
 394              	.L23:
  89:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 395              		.loc 1 89 0
 396 014a 0820     		movs	r0, #8
 397 014c FFF7FEFF 		bl	graphic_ctrl_bit_clear
  90:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 398              		.loc 1 90 0
 399 0150 1020     		movs	r0, #16
 400 0152 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  91:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1:
 401              		.loc 1 91 0
 402 0156 14E0     		b	.L20
 403              	.L24:
  93:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 404              		.loc 1 93 0
 405 0158 0820     		movs	r0, #8
 406 015a FFF7FEFF 		bl	graphic_ctrl_bit_set
  94:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 407              		.loc 1 94 0
 408 015e 1020     		movs	r0, #16
 409 0160 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  95:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS2:
 410              		.loc 1 95 0
 411 0164 0DE0     		b	.L20
 412              	.L25:
  97:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 413              		.loc 1 97 0
 414 0166 0820     		movs	r0, #8
 415 0168 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  98:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 416              		.loc 1 98 0
 417 016c 1020     		movs	r0, #16
 418 016e FFF7FEFF 		bl	graphic_ctrl_bit_set
  99:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	case B_CS1 && B_CS2:
 419              		.loc 1 99 0
 420 0172 06E0     		b	.L20
 421              	.L21:
 101:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 422              		.loc 1 101 0
 423 0174 0820     		movs	r0, #8
 424 0176 FFF7FEFF 		bl	graphic_ctrl_bit_set
 102:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		break;
 425              		.loc 1 102 0
 426 017a 1020     		movs	r0, #16
 427 017c FFF7FEFF 		bl	graphic_ctrl_bit_set
 103:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 428              		.loc 1 103 0
 429 0180 C046     		nop
 430              	.L20:
 431              	.L26:
 432              		.loc 1 107 0
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
 108:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_wait_ready(void){
 450              		.loc 1 108 0
 451              		.cfi_startproc
 452              		@ args = 0, pretend = 0, frame = 0
 453              		@ frame_needed = 1, uses_anonymous_args = 0
 454 018a 80B5     		push	{r7, lr}
 455              		.cfi_def_cfa_offset 8
 456              		.cfi_offset 7, -8
 457              		.cfi_offset 14, -4
 458 018c 00AF     		add	r7, sp, #0
 459              		.cfi_def_cfa_register 7
 109:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 460              		.loc 1 109 0
 461 018e 4020     		movs	r0, #64
 462 0190 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 110:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER_LOW = 0x0055;
 463              		.loc 1 110 0
 464 0194 0F4B     		ldr	r3, .L28
 465 0196 5522     		movs	r2, #85
 466 0198 1A80     		strh	r2, [r3]
 111:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 467              		.loc 1 111 0
 468 019a 0120     		movs	r0, #1
 469 019c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 112:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_RW);
 470              		.loc 1 112 0
 471 01a0 0220     		movs	r0, #2
 472 01a2 FFF7FEFF 		bl	graphic_ctrl_bit_set
 113:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 473              		.loc 1 113 0
 474 01a6 FFF7FEFF 		bl	delay_500ns
 114:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	while(1){
 115:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_set(B_E);
 475              		.loc 1 115 0
 476 01aa 4020     		movs	r0, #64
 477 01ac FFF7FEFF 		bl	graphic_ctrl_bit_set
 116:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		delay_500ns();
 478              		.loc 1 116 0
 479 01b0 FFF7FEFF 		bl	delay_500ns
 117:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_ctrl_bit_clear(B_E);
 480              		.loc 1 117 0
 481 01b4 4020     		movs	r0, #64
 482 01b6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 118:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		delay_500ns();
 483              		.loc 1 118 0
 484 01ba FFF7FEFF 		bl	delay_500ns
 119:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		if( (LCD_BUSY & 0x80) == 0x80)
 120:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 			break;
 485              		.loc 1 120 0
 486 01be C046     		nop
 121:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		
 122:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 123:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 487              		.loc 1 123 0
 488 01c0 4020     		movs	r0, #64
 489 01c2 FFF7FEFF 		bl	graphic_ctrl_bit_set
 124:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER_LOW = 0x5555;
 490              		.loc 1 124 0
 491 01c6 034B     		ldr	r3, .L28
 492 01c8 034A     		ldr	r2, .L28+4
 493 01ca 1A80     		strh	r2, [r3]
 125:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 494              		.loc 1 125 0
 495 01cc C046     		nop
 496 01ce BD46     		mov	sp, r7
 497              		@ sp needed
 498 01d0 80BD     		pop	{r7, pc}
 499              	.L29:
 500 01d2 C046     		.align	2
 501              	.L28:
 502 01d4 00100240 		.word	1073876992
 503 01d8 55550000 		.word	21845
 504              		.cfi_endproc
 505              	.LFE8:
 507              		.align	1
 508              		.global	graphic_read
 509              		.syntax unified
 510              		.code	16
 511              		.thumb_func
 512              		.fpu softvfp
 514              	graphic_read:
 515              	.LFB9:
 126:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** unsigned char graphic_read(unsigned char controller ){
 516              		.loc 1 126 0
 517              		.cfi_startproc
 518              		@ args = 0, pretend = 0, frame = 16
 519              		@ frame_needed = 1, uses_anonymous_args = 0
 520 01dc 80B5     		push	{r7, lr}
 521              		.cfi_def_cfa_offset 8
 522              		.cfi_offset 7, -8
 523              		.cfi_offset 14, -4
 524 01de 84B0     		sub	sp, sp, #16
 525              		.cfi_def_cfa_offset 24
 526 01e0 00AF     		add	r7, sp, #0
 527              		.cfi_def_cfa_register 7
 528 01e2 0200     		movs	r2, r0
 529 01e4 FB1D     		adds	r3, r7, #7
 530 01e6 1A70     		strb	r2, [r3]
 127:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	unsigned char RV;
 128:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 531              		.loc 1 128 0
 532 01e8 4020     		movs	r0, #64
 533 01ea FFF7FEFF 		bl	graphic_ctrl_bit_clear
 129:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER_LOW = 0055;
 534              		.loc 1 129 0
 535 01ee 1D4B     		ldr	r3, .L34
 536 01f0 2D22     		movs	r2, #45
 537 01f2 1A80     		strh	r2, [r3]
 130:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 131:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_RS );
 538              		.loc 1 131 0
 539 01f4 0120     		movs	r0, #1
 540 01f6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 132:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_RW );
 541              		.loc 1 132 0
 542 01fa 0220     		movs	r0, #2
 543 01fc FFF7FEFF 		bl	graphic_ctrl_bit_set
 133:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 134:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller( controller );
 544              		.loc 1 134 0
 545 0200 FB1D     		adds	r3, r7, #7
 546 0202 1B78     		ldrb	r3, [r3]
 547 0204 1800     		movs	r0, r3
 548 0206 FFF7FEFF 		bl	select_controller
 135:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 549              		.loc 1 135 0
 550 020a FFF7FEFF 		bl	delay_500ns
 136:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 137:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_E );
 551              		.loc 1 137 0
 552 020e 4020     		movs	r0, #64
 553 0210 FFF7FEFF 		bl	graphic_ctrl_bit_set
 138:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 554              		.loc 1 138 0
 555 0214 FFF7FEFF 		bl	delay_500ns
 139:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 140:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	RV = *PORT_MODER_LH;
 556              		.loc 1 140 0
 557 0218 134A     		ldr	r2, .L34+4
 558 021a 0F23     		movs	r3, #15
 559 021c FB18     		adds	r3, r7, r3
 560 021e 1278     		ldrb	r2, [r2]
 561 0220 1A70     		strb	r2, [r3]
 141:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 562              		.loc 1 141 0
 563 0222 4020     		movs	r0, #64
 564 0224 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 142:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 143:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER_LOW = 0x5555;
 565              		.loc 1 143 0
 566 0228 0E4B     		ldr	r3, .L34
 567 022a 104A     		ldr	r2, .L34+8
 568 022c 1A80     		strh	r2, [r3]
 144:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( (controller & B_CS1) == B_CS1 ){
 569              		.loc 1 144 0
 570 022e FB1D     		adds	r3, r7, #7
 571 0230 1B78     		ldrb	r3, [r3]
 572 0232 0822     		movs	r2, #8
 573 0234 1340     		ands	r3, r2
 574 0236 04D0     		beq	.L31
 145:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller(B_CS1);
 575              		.loc 1 145 0
 576 0238 0820     		movs	r0, #8
 577 023a FFF7FEFF 		bl	select_controller
 146:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 578              		.loc 1 146 0
 579 023e FFF7FEFF 		bl	graphic_wait_ready
 580              	.L31:
 147:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 148:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if((controller & B_CS2) == B_CS2 ){
 581              		.loc 1 148 0
 582 0242 FB1D     		adds	r3, r7, #7
 583 0244 1B78     		ldrb	r3, [r3]
 584 0246 1022     		movs	r2, #16
 585 0248 1340     		ands	r3, r2
 586 024a 04D0     		beq	.L32
 149:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller(B_CS2);
 587              		.loc 1 149 0
 588 024c 1020     		movs	r0, #16
 589 024e FFF7FEFF 		bl	select_controller
 150:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 590              		.loc 1 150 0
 591 0252 FFF7FEFF 		bl	graphic_wait_ready
 592              	.L32:
 151:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 152:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	return RV;
 593              		.loc 1 152 0
 594 0256 0F23     		movs	r3, #15
 595 0258 FB18     		adds	r3, r7, r3
 596 025a 1B78     		ldrb	r3, [r3]
 153:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 597              		.loc 1 153 0
 598 025c 1800     		movs	r0, r3
 599 025e BD46     		mov	sp, r7
 600 0260 04B0     		add	sp, sp, #16
 601              		@ sp needed
 602 0262 80BD     		pop	{r7, pc}
 603              	.L35:
 604              		.align	2
 605              	.L34:
 606 0264 00100240 		.word	1073876992
 607 0268 01100240 		.word	1073876993
 608 026c 55550000 		.word	21845
 609              		.cfi_endproc
 610              	.LFE9:
 612              		.align	1
 613              		.global	graphic_write
 614              		.syntax unified
 615              		.code	16
 616              		.thumb_func
 617              		.fpu softvfp
 619              	graphic_write:
 620              	.LFB10:
 154:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_write(uint8_t value, uint8_t controller){
 621              		.loc 1 154 0
 622              		.cfi_startproc
 623              		@ args = 0, pretend = 0, frame = 8
 624              		@ frame_needed = 1, uses_anonymous_args = 0
 625 0270 80B5     		push	{r7, lr}
 626              		.cfi_def_cfa_offset 8
 627              		.cfi_offset 7, -8
 628              		.cfi_offset 14, -4
 629 0272 82B0     		sub	sp, sp, #8
 630              		.cfi_def_cfa_offset 16
 631 0274 00AF     		add	r7, sp, #0
 632              		.cfi_def_cfa_register 7
 633 0276 0200     		movs	r2, r0
 634 0278 FB1D     		adds	r3, r7, #7
 635 027a 1A70     		strb	r2, [r3]
 636 027c BB1D     		adds	r3, r7, #6
 637 027e 0A1C     		adds	r2, r1, #0
 638 0280 1A70     		strb	r2, [r3]
 155:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER_LH = value;
 639              		.loc 1 155 0
 640 0282 1A4A     		ldr	r2, .L39
 641 0284 FB1D     		adds	r3, r7, #7
 642 0286 1B78     		ldrb	r3, [r3]
 643 0288 1370     		strb	r3, [r2]
 156:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller(controller);
 644              		.loc 1 156 0
 645 028a BB1D     		adds	r3, r7, #6
 646 028c 1B78     		ldrb	r3, [r3]
 647 028e 1800     		movs	r0, r3
 648 0290 FFF7FEFF 		bl	select_controller
 157:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 649              		.loc 1 157 0
 650 0294 FFF7FEFF 		bl	delay_500ns
 158:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 651              		.loc 1 158 0
 652 0298 4020     		movs	r0, #64
 653 029a FFF7FEFF 		bl	graphic_ctrl_bit_set
 159:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_500ns();
 654              		.loc 1 159 0
 655 029e FFF7FEFF 		bl	delay_500ns
 160:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 656              		.loc 1 160 0
 657 02a2 4020     		movs	r0, #64
 658 02a4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 161:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 162:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( (controller & B_CS1 ) == B_CS1 ){
 659              		.loc 1 162 0
 660 02a8 BB1D     		adds	r3, r7, #6
 661 02aa 1B78     		ldrb	r3, [r3]
 662 02ac 0822     		movs	r2, #8
 663 02ae 1340     		ands	r3, r2
 664 02b0 04D0     		beq	.L37
 163:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller( B_CS1 );
 665              		.loc 1 163 0
 666 02b2 0820     		movs	r0, #8
 667 02b4 FFF7FEFF 		bl	select_controller
 164:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 668              		.loc 1 164 0
 669 02b8 FFF7FEFF 		bl	graphic_wait_ready
 670              	.L37:
 165:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 166:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	if( (controller & B_CS2 ) == B_CS2 ){
 671              		.loc 1 166 0
 672 02bc BB1D     		adds	r3, r7, #6
 673 02be 1B78     		ldrb	r3, [r3]
 674 02c0 1022     		movs	r2, #16
 675 02c2 1340     		ands	r3, r2
 676 02c4 04D0     		beq	.L38
 167:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		select_controller( B_CS2 );
 677              		.loc 1 167 0
 678 02c6 1020     		movs	r0, #16
 679 02c8 FFF7FEFF 		bl	select_controller
 168:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_wait_ready();
 680              		.loc 1 168 0
 681 02cc FFF7FEFF 		bl	graphic_wait_ready
 682              	.L38:
 169:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 170:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER_LH = 0;
 683              		.loc 1 170 0
 684 02d0 064B     		ldr	r3, .L39
 685 02d2 0022     		movs	r2, #0
 686 02d4 1A70     		strb	r2, [r3]
 171:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 687              		.loc 1 171 0
 688 02d6 4020     		movs	r0, #64
 689 02d8 FFF7FEFF 		bl	graphic_ctrl_bit_set
 172:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller(0);
 690              		.loc 1 172 0
 691 02dc 0020     		movs	r0, #0
 692 02de FFF7FEFF 		bl	select_controller
 173:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 693              		.loc 1 173 0
 694 02e2 C046     		nop
 695 02e4 BD46     		mov	sp, r7
 696 02e6 02B0     		add	sp, sp, #8
 697              		@ sp needed
 698 02e8 80BD     		pop	{r7, pc}
 699              	.L40:
 700 02ea C046     		.align	2
 701              	.L39:
 702 02ec 01100240 		.word	1073876993
 703              		.cfi_endproc
 704              	.LFE10:
 706              		.align	1
 707              		.global	graphic_write_command
 708              		.syntax unified
 709              		.code	16
 710              		.thumb_func
 711              		.fpu softvfp
 713              	graphic_write_command:
 714              	.LFB11:
 174:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 715              		.loc 1 174 0
 716              		.cfi_startproc
 717              		@ args = 0, pretend = 0, frame = 8
 718              		@ frame_needed = 1, uses_anonymous_args = 0
 719 02f0 80B5     		push	{r7, lr}
 720              		.cfi_def_cfa_offset 8
 721              		.cfi_offset 7, -8
 722              		.cfi_offset 14, -4
 723 02f2 82B0     		sub	sp, sp, #8
 724              		.cfi_def_cfa_offset 16
 725 02f4 00AF     		add	r7, sp, #0
 726              		.cfi_def_cfa_register 7
 727 02f6 0200     		movs	r2, r0
 728 02f8 FB1D     		adds	r3, r7, #7
 729 02fa 1A70     		strb	r2, [r3]
 730 02fc BB1D     		adds	r3, r7, #6
 731 02fe 0A1C     		adds	r2, r1, #0
 732 0300 1A70     		strb	r2, [r3]
 175:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 733              		.loc 1 175 0
 734 0302 4020     		movs	r0, #64
 735 0304 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 176:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller( controller );
 736              		.loc 1 176 0
 737 0308 BB1D     		adds	r3, r7, #6
 738 030a 1B78     		ldrb	r3, [r3]
 739 030c 1800     		movs	r0, r3
 740 030e FFF7FEFF 		bl	select_controller
 177:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_RS );
 741              		.loc 1 177 0
 742 0312 0120     		movs	r0, #1
 743 0314 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 178:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_RW );
 744              		.loc 1 178 0
 745 0318 0220     		movs	r0, #2
 746 031a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 179:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write( command, controller );
 747              		.loc 1 179 0
 748 031e BB1D     		adds	r3, r7, #6
 749 0320 1A78     		ldrb	r2, [r3]
 750 0322 FB1D     		adds	r3, r7, #7
 751 0324 1B78     		ldrb	r3, [r3]
 752 0326 1100     		movs	r1, r2
 753 0328 1800     		movs	r0, r3
 754 032a FFF7FEFF 		bl	graphic_write
 180:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 755              		.loc 1 180 0
 756 032e C046     		nop
 757 0330 BD46     		mov	sp, r7
 758 0332 02B0     		add	sp, sp, #8
 759              		@ sp needed
 760 0334 80BD     		pop	{r7, pc}
 761              		.cfi_endproc
 762              	.LFE11:
 764              		.align	1
 765              		.global	graphic_write_data
 766              		.syntax unified
 767              		.code	16
 768              		.thumb_func
 769              		.fpu softvfp
 771              	graphic_write_data:
 772              	.LFB12:
 181:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_write_data( uint8_t data, uint8_t controller ){
 773              		.loc 1 181 0
 774              		.cfi_startproc
 775              		@ args = 0, pretend = 0, frame = 8
 776              		@ frame_needed = 1, uses_anonymous_args = 0
 777 0336 80B5     		push	{r7, lr}
 778              		.cfi_def_cfa_offset 8
 779              		.cfi_offset 7, -8
 780              		.cfi_offset 14, -4
 781 0338 82B0     		sub	sp, sp, #8
 782              		.cfi_def_cfa_offset 16
 783 033a 00AF     		add	r7, sp, #0
 784              		.cfi_def_cfa_register 7
 785 033c 0200     		movs	r2, r0
 786 033e FB1D     		adds	r3, r7, #7
 787 0340 1A70     		strb	r2, [r3]
 788 0342 BB1D     		adds	r3, r7, #6
 789 0344 0A1C     		adds	r2, r1, #0
 790 0346 1A70     		strb	r2, [r3]
 182:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_E );
 791              		.loc 1 182 0
 792 0348 4020     		movs	r0, #64
 793 034a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 183:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller( controller );
 794              		.loc 1 183 0
 795 034e BB1D     		adds	r3, r7, #6
 796 0350 1B78     		ldrb	r3, [r3]
 797 0352 1800     		movs	r0, r3
 798 0354 FFF7FEFF 		bl	select_controller
 184:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set( B_RS );
 799              		.loc 1 184 0
 800 0358 0120     		movs	r0, #1
 801 035a FFF7FEFF 		bl	graphic_ctrl_bit_set
 185:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear( B_RW );
 802              		.loc 1 185 0
 803 035e 0220     		movs	r0, #2
 804 0360 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 186:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write( data, controller );
 805              		.loc 1 186 0
 806 0364 BB1D     		adds	r3, r7, #6
 807 0366 1A78     		ldrb	r2, [r3]
 808 0368 FB1D     		adds	r3, r7, #7
 809 036a 1B78     		ldrb	r3, [r3]
 810 036c 1100     		movs	r1, r2
 811 036e 1800     		movs	r0, r3
 812 0370 FFF7FEFF 		bl	graphic_write
 187:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 813              		.loc 1 187 0
 814 0374 C046     		nop
 815 0376 BD46     		mov	sp, r7
 816 0378 02B0     		add	sp, sp, #8
 817              		@ sp needed
 818 037a 80BD     		pop	{r7, pc}
 819              		.cfi_endproc
 820              	.LFE12:
 822              		.align	1
 823              		.global	graphic_clear_screen
 824              		.syntax unified
 825              		.code	16
 826              		.thumb_func
 827              		.fpu softvfp
 829              	graphic_clear_screen:
 830              	.LFB13:
 188:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_clear_screen(void){
 831              		.loc 1 188 0
 832              		.cfi_startproc
 833              		@ args = 0, pretend = 0, frame = 8
 834              		@ frame_needed = 1, uses_anonymous_args = 0
 835 037c 80B5     		push	{r7, lr}
 836              		.cfi_def_cfa_offset 8
 837              		.cfi_offset 7, -8
 838              		.cfi_offset 14, -4
 839 037e 82B0     		sub	sp, sp, #8
 840              		.cfi_def_cfa_offset 16
 841 0380 00AF     		add	r7, sp, #0
 842              		.cfi_def_cfa_register 7
 843              	.LBB2:
 189:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	for( int i = 0; i < 7; i++){											//KAN SKAPA PROBLEM DÅ I ALDRiG ÄR 7, SAMMA MED K
 844              		.loc 1 189 0
 845 0382 0023     		movs	r3, #0
 846 0384 7B60     		str	r3, [r7, #4]
 847 0386 1EE0     		b	.L44
 848              	.L47:
 190:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_write_command( LCD_SET_PAGE | i, B_CS1 | B_CS2 );
 849              		.loc 1 190 0
 850 0388 7B68     		ldr	r3, [r7, #4]
 851 038a 5BB2     		sxtb	r3, r3
 852 038c 4822     		movs	r2, #72
 853 038e 5242     		rsbs	r2, r2, #0
 854 0390 1343     		orrs	r3, r2
 855 0392 5BB2     		sxtb	r3, r3
 856 0394 DBB2     		uxtb	r3, r3
 857 0396 1821     		movs	r1, #24
 858 0398 1800     		movs	r0, r3
 859 039a FFF7FEFF 		bl	graphic_write_command
 191:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_write_command( LCD_SET_ADD	| 0, B_CS1 | B_CS2 );
 860              		.loc 1 191 0
 861 039e 1821     		movs	r1, #24
 862 03a0 0220     		movs	r0, #2
 863 03a2 FFF7FEFF 		bl	graphic_write_command
 864              	.LBB3:
 192:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		for(int k = 0; k < 63; k++){
 865              		.loc 1 192 0
 866 03a6 0023     		movs	r3, #0
 867 03a8 3B60     		str	r3, [r7]
 868 03aa 06E0     		b	.L45
 869              	.L46:
 193:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 			graphic_write_data( 0, B_CS1 | B_CS2 );
 870              		.loc 1 193 0 discriminator 3
 871 03ac 1821     		movs	r1, #24
 872 03ae 0020     		movs	r0, #0
 873 03b0 FFF7FEFF 		bl	graphic_write_data
 192:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		for(int k = 0; k < 63; k++){
 874              		.loc 1 192 0 discriminator 3
 875 03b4 3B68     		ldr	r3, [r7]
 876 03b6 0133     		adds	r3, r3, #1
 877 03b8 3B60     		str	r3, [r7]
 878              	.L45:
 192:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		for(int k = 0; k < 63; k++){
 879              		.loc 1 192 0 is_stmt 0 discriminator 1
 880 03ba 3B68     		ldr	r3, [r7]
 881 03bc 3E2B     		cmp	r3, #62
 882 03be F5DD     		ble	.L46
 883              	.LBE3:
 189:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_write_command( LCD_SET_PAGE | i, B_CS1 | B_CS2 );
 884              		.loc 1 189 0 is_stmt 1 discriminator 2
 885 03c0 7B68     		ldr	r3, [r7, #4]
 886 03c2 0133     		adds	r3, r3, #1
 887 03c4 7B60     		str	r3, [r7, #4]
 888              	.L44:
 189:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		graphic_write_command( LCD_SET_PAGE | i, B_CS1 | B_CS2 );
 889              		.loc 1 189 0 is_stmt 0 discriminator 1
 890 03c6 7B68     		ldr	r3, [r7, #4]
 891 03c8 062B     		cmp	r3, #6
 892 03ca DDDD     		ble	.L47
 893              	.LBE2:
 194:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 		}
 195:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	}
 196:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 894              		.loc 1 196 0 is_stmt 1
 895 03cc C046     		nop
 896 03ce BD46     		mov	sp, r7
 897 03d0 02B0     		add	sp, sp, #8
 898              		@ sp needed
 899 03d2 80BD     		pop	{r7, pc}
 900              		.cfi_endproc
 901              	.LFE13:
 903              		.align	1
 904              		.global	graphic_initialize
 905              		.syntax unified
 906              		.code	16
 907              		.thumb_func
 908              		.fpu softvfp
 910              	graphic_initialize:
 911              	.LFB14:
 197:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
 198:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void graphic_initialize(void){
 912              		.loc 1 198 0
 913              		.cfi_startproc
 914              		@ args = 0, pretend = 0, frame = 0
 915              		@ frame_needed = 1, uses_anonymous_args = 0
 916 03d4 80B5     		push	{r7, lr}
 917              		.cfi_def_cfa_offset 8
 918              		.cfi_offset 7, -8
 919              		.cfi_offset 14, -4
 920 03d6 00AF     		add	r7, sp, #0
 921              		.cfi_def_cfa_register 7
 199:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 922              		.loc 1 199 0
 923 03d8 4020     		movs	r0, #64
 924 03da FFF7FEFF 		bl	graphic_ctrl_bit_set
 200:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_micro(10);
 925              		.loc 1 200 0
 926 03de 0A20     		movs	r0, #10
 927 03e0 FFF7FEFF 		bl	delay_micro
 201:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 202:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_CS1);
 928              		.loc 1 202 0
 929 03e4 0820     		movs	r0, #8
 930 03e6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 203:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_CS2);
 931              		.loc 1 203 0
 932 03ea 1020     		movs	r0, #16
 933 03ec FFF7FEFF 		bl	graphic_ctrl_bit_clear
 204:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_RST);
 934              		.loc 1 204 0
 935 03f0 2020     		movs	r0, #32
 936 03f2 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 205:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 937              		.loc 1 205 0
 938 03f6 4020     		movs	r0, #64
 939 03f8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 206:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	delay_milli(30);
 940              		.loc 1 206 0
 941 03fc 1E20     		movs	r0, #30
 942 03fe FFF7FEFF 		bl	delay_milli
 207:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 208:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_ctrl_bit_set(B_RST);
 943              		.loc 1 208 0
 944 0402 2020     		movs	r0, #32
 945 0404 FFF7FEFF 		bl	graphic_ctrl_bit_set
 209:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_OFF, B_CS1 | B_CS2);
 946              		.loc 1 209 0
 947 0408 1821     		movs	r1, #24
 948 040a 3E20     		movs	r0, #62
 949 040c FFF7FEFF 		bl	graphic_write_command
 210:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_ON, B_CS1 | B_CS2);
 950              		.loc 1 210 0
 951 0410 1821     		movs	r1, #24
 952 0412 3F20     		movs	r0, #63
 953 0414 FFF7FEFF 		bl	graphic_write_command
 211:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_DISP_START, B_CS1 | B_CS2);
 954              		.loc 1 211 0
 955 0418 1821     		movs	r1, #24
 956 041a 0C20     		movs	r0, #12
 957 041c FFF7FEFF 		bl	graphic_write_command
 212:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1 | B_CS2);
 958              		.loc 1 212 0
 959 0420 1821     		movs	r1, #24
 960 0422 0220     		movs	r0, #2
 961 0424 FFF7FEFF 		bl	graphic_write_command
 213:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1 | B_CS2);
 962              		.loc 1 213 0
 963 0428 1821     		movs	r1, #24
 964 042a B820     		movs	r0, #184
 965 042c FFF7FEFF 		bl	graphic_write_command
 214:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	select_controller(0);
 966              		.loc 1 214 0
 967 0430 0020     		movs	r0, #0
 968 0432 FFF7FEFF 		bl	select_controller
 215:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 969              		.loc 1 215 0
 970 0436 C046     		nop
 971 0438 BD46     		mov	sp, r7
 972              		@ sp needed
 973 043a 80BD     		pop	{r7, pc}
 974              		.cfi_endproc
 975              	.LFE14:
 977              		.align	1
 978              		.global	init_app
 979              		.syntax unified
 980              		.code	16
 981              		.thumb_func
 982              		.fpu softvfp
 984              	init_app:
 985              	.LFB15:
 216:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** void init_app(void){
 986              		.loc 1 216 0
 987              		.cfi_startproc
 988              		@ args = 0, pretend = 0, frame = 0
 989              		@ frame_needed = 1, uses_anonymous_args = 0
 990 043c 80B5     		push	{r7, lr}
 991              		.cfi_def_cfa_offset 8
 992              		.cfi_offset 7, -8
 993              		.cfi_offset 14, -4
 994 043e 00AF     		add	r7, sp, #0
 995              		.cfi_def_cfa_register 7
 217:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	*PORT_MODER = 0x55555555;
 996              		.loc 1 217 0
 997 0440 024B     		ldr	r3, .L50
 998 0442 034A     		ldr	r2, .L50+4
 999 0444 1A60     		str	r2, [r3]
 218:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 1000              		.loc 1 218 0
 1001 0446 C046     		nop
 1002 0448 BD46     		mov	sp, r7
 1003              		@ sp needed
 1004 044a 80BD     		pop	{r7, pc}
 1005              	.L51:
 1006              		.align	2
 1007              	.L50:
 1008 044c 00100240 		.word	1073876992
 1009 0450 55555555 		.word	1431655765
 1010              		.cfi_endproc
 1011              	.LFE15:
 1013              		.align	1
 1014              		.global	main
 1015              		.syntax unified
 1016              		.code	16
 1017              		.thumb_func
 1018              		.fpu softvfp
 1020              	main:
 1021              	.LFB16:
 219:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 
 220:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** int main(void){
 1022              		.loc 1 220 0
 1023              		.cfi_startproc
 1024              		@ args = 0, pretend = 0, frame = 0
 1025              		@ frame_needed = 1, uses_anonymous_args = 0
 1026 0454 80B5     		push	{r7, lr}
 1027              		.cfi_def_cfa_offset 8
 1028              		.cfi_offset 7, -8
 1029              		.cfi_offset 14, -4
 1030 0456 00AF     		add	r7, sp, #0
 1031              		.cfi_def_cfa_register 7
 221:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	init_app();
 1032              		.loc 1 221 0
 1033 0458 FFF7FEFF 		bl	init_app
 222:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_initialize();
 1034              		.loc 1 222 0
 1035 045c FFF7FEFF 		bl	graphic_initialize
 223:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #ifndef SIMULATOR
 224:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_clear_screen();
 1036              		.loc 1 224 0
 1037 0460 FFF7FEFF 		bl	graphic_clear_screen
 225:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** #endif
 226:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command( LCD_SET_ADD | 10, B_CS1 | B_CS2 );
 1038              		.loc 1 226 0
 1039 0464 1821     		movs	r1, #24
 1040 0466 0A20     		movs	r0, #10
 1041 0468 FFF7FEFF 		bl	graphic_write_command
 227:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command( LCD_SET_PAGE | 1, B_CS1 | B_CS2 );
 1042              		.loc 1 227 0
 1043 046c 1821     		movs	r1, #24
 1044 046e B920     		movs	r0, #185
 1045 0470 FFF7FEFF 		bl	graphic_write_command
 228:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	graphic_write_command( 0xFF, B_CS1 | B_CS2 );
 1046              		.loc 1 228 0
 1047 0474 1821     		movs	r1, #24
 1048 0476 FF20     		movs	r0, #255
 1049 0478 FFF7FEFF 		bl	graphic_write_command
 229:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	return 0;
 1050              		.loc 1 229 0
 1051 047c 0023     		movs	r3, #0
 230:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** 	
 231:/home/tom/Documents/WORK/MachineOrientedProgramming/graphicdisplay/startup.c **** }
 1052              		.loc 1 231 0
 1053 047e 1800     		movs	r0, r3
 1054 0480 BD46     		mov	sp, r7
 1055              		@ sp needed
 1056 0482 80BD     		pop	{r7, pc}
 1057              		.cfi_endproc
 1058              	.LFE16:
 1060              	.Letext0:
