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
  25              		.file 1 "/home/tom/Documents/WORK/delay/startup.c"
   1:/home/tom/Documents/WORK/delay/startup.c **** /*
   2:/home/tom/Documents/WORK/delay/startup.c ****  * 	startup.c
   3:/home/tom/Documents/WORK/delay/startup.c ****  *
   4:/home/tom/Documents/WORK/delay/startup.c ****  */
   5:/home/tom/Documents/WORK/delay/startup.c ****  
   6:/home/tom/Documents/WORK/delay/startup.c **** #define GPIO_E_BASE 0x40021000
   7:/home/tom/Documents/WORK/delay/startup.c **** #define GPIO_E_MODER ((volatile unsigned int*)    GPIO_E_BASE)
   8:/home/tom/Documents/WORK/delay/startup.c **** #define GPIO_E_OTYPER_LOW ((volatile unsigned char*)   GPIO_E_BASE+0x04)
   9:/home/tom/Documents/WORK/delay/startup.c **** //#define GPIO_D_PUPDR_HIGH ((volatile unsigned short*)     GPIO_E_BASE+0x0E)
  10:/home/tom/Documents/WORK/delay/startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char*) GPIO_E_BASE+0x14)
  11:/home/tom/Documents/WORK/delay/startup.c **** #define STK_CTRL (*(volatile unsigned int*)(0xE000E010))
  12:/home/tom/Documents/WORK/delay/startup.c **** #define STK_LOAD (*(volatile unsigned int*)(0xE000E014))
  13:/home/tom/Documents/WORK/delay/startup.c **** #define STK_VAL  (*(volatile unsigned int*)(0xE000E018))
  14:/home/tom/Documents/WORK/delay/startup.c **** 
  15:/home/tom/Documents/WORK/delay/startup.c **** 
  16:/home/tom/Documents/WORK/delay/startup.c ****  
  17:/home/tom/Documents/WORK/delay/startup.c ****  
  18:/home/tom/Documents/WORK/delay/startup.c ****  
  19:/home/tom/Documents/WORK/delay/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  20:/home/tom/Documents/WORK/delay/startup.c **** 
  21:/home/tom/Documents/WORK/delay/startup.c **** void startup ( void )
  22:/home/tom/Documents/WORK/delay/startup.c **** {
  26              		.loc 1 22 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  23:/home/tom/Documents/WORK/delay/startup.c **** __asm volatile(
  31              		.loc 1 23 0
  32              		.syntax divided
  33              	@ 23 "/home/tom/Documents/WORK/delay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  24:/home/tom/Documents/WORK/delay/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  25:/home/tom/Documents/WORK/delay/startup.c **** 	" MOV SP,R0\n"
  26:/home/tom/Documents/WORK/delay/startup.c **** 	" BL main\n"				/* call main */
  27:/home/tom/Documents/WORK/delay/startup.c **** 	"_exit: B .\n"				/* never return */
  28:/home/tom/Documents/WORK/delay/startup.c **** 	) ;
  29:/home/tom/Documents/WORK/delay/startup.c **** }
  40              		.loc 1 29 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	delay_micro
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	delay_micro:
  56              	.LFB1:
  30:/home/tom/Documents/WORK/delay/startup.c **** 
  31:/home/tom/Documents/WORK/delay/startup.c **** void delay_micro(unsigned int us){
  57              		.loc 1 31 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 8
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 82B0     		sub	sp, sp, #8
  66              		.cfi_def_cfa_offset 16
  67 0004 00AF     		add	r7, sp, #0
  68              		.cfi_def_cfa_register 7
  69 0006 7860     		str	r0, [r7, #4]
  32:/home/tom/Documents/WORK/delay/startup.c ****     while(us--){
  70              		.loc 1 32 0
  71 0008 07E0     		b	.L3
  72              	.L4:
  73              	.LBB2:
  33:/home/tom/Documents/WORK/delay/startup.c ****         delay_250ns();
  74              		.loc 1 33 0
  75 000a FFF7FEFF 		bl	delay_250ns
  34:/home/tom/Documents/WORK/delay/startup.c ****         delay_250ns();
  76              		.loc 1 34 0
  77 000e FFF7FEFF 		bl	delay_250ns
  35:/home/tom/Documents/WORK/delay/startup.c ****         delay_250ns();
  78              		.loc 1 35 0
  79 0012 FFF7FEFF 		bl	delay_250ns
  36:/home/tom/Documents/WORK/delay/startup.c ****         delay_250ns();
  80              		.loc 1 36 0
  81 0016 FFF7FEFF 		bl	delay_250ns
  82              	.L3:
  83              	.LBE2:
  32:/home/tom/Documents/WORK/delay/startup.c ****         delay_250ns();
  84              		.loc 1 32 0
  85 001a 7B68     		ldr	r3, [r7, #4]
  86 001c 5A1E     		subs	r2, r3, #1
  87 001e 7A60     		str	r2, [r7, #4]
  88 0020 002B     		cmp	r3, #0
  89 0022 F2D1     		bne	.L4
  37:/home/tom/Documents/WORK/delay/startup.c ****     }
  38:/home/tom/Documents/WORK/delay/startup.c **** }
  90              		.loc 1 38 0
  91 0024 C046     		nop
  92 0026 BD46     		mov	sp, r7
  93 0028 02B0     		add	sp, sp, #8
  94              		@ sp needed
  95 002a 80BD     		pop	{r7, pc}
  96              		.cfi_endproc
  97              	.LFE1:
  99              		.align	1
 100              		.global	delay_milli
 101              		.syntax unified
 102              		.code	16
 103              		.thumb_func
 104              		.fpu softvfp
 106              	delay_milli:
 107              	.LFB2:
  39:/home/tom/Documents/WORK/delay/startup.c **** 
  40:/home/tom/Documents/WORK/delay/startup.c **** // delay_milli(): 1ms = 1000us
  41:/home/tom/Documents/WORK/delay/startup.c **** void delay_milli(unsigned int ms){
 108              		.loc 1 41 0
 109              		.cfi_startproc
 110              		@ args = 0, pretend = 0, frame = 8
 111              		@ frame_needed = 1, uses_anonymous_args = 0
 112 002c 80B5     		push	{r7, lr}
 113              		.cfi_def_cfa_offset 8
 114              		.cfi_offset 7, -8
 115              		.cfi_offset 14, -4
 116 002e 82B0     		sub	sp, sp, #8
 117              		.cfi_def_cfa_offset 16
 118 0030 00AF     		add	r7, sp, #0
 119              		.cfi_def_cfa_register 7
 120 0032 7860     		str	r0, [r7, #4]
  42:/home/tom/Documents/WORK/delay/startup.c ****     while(ms--){
 121              		.loc 1 42 0
 122 0034 02E0     		b	.L6
 123              	.L7:
  43:/home/tom/Documents/WORK/delay/startup.c ****         delay_micro(10);
 124              		.loc 1 43 0
 125 0036 0A20     		movs	r0, #10
 126 0038 FFF7FEFF 		bl	delay_micro
 127              	.L6:
  42:/home/tom/Documents/WORK/delay/startup.c ****     while(ms--){
 128              		.loc 1 42 0
 129 003c 7B68     		ldr	r3, [r7, #4]
 130 003e 5A1E     		subs	r2, r3, #1
 131 0040 7A60     		str	r2, [r7, #4]
 132 0042 002B     		cmp	r3, #0
 133 0044 F7D1     		bne	.L7
  44:/home/tom/Documents/WORK/delay/startup.c ****     }
  45:/home/tom/Documents/WORK/delay/startup.c ****     
  46:/home/tom/Documents/WORK/delay/startup.c **** }
 134              		.loc 1 46 0
 135 0046 C046     		nop
 136 0048 BD46     		mov	sp, r7
 137 004a 02B0     		add	sp, sp, #8
 138              		@ sp needed
 139 004c 80BD     		pop	{r7, pc}
 140              		.cfi_endproc
 141              	.LFE2:
 143              		.align	1
 144              		.global	delay_250ns
 145              		.syntax unified
 146              		.code	16
 147              		.thumb_func
 148              		.fpu softvfp
 150              	delay_250ns:
 151              	.LFB3:
  47:/home/tom/Documents/WORK/delay/startup.c **** 
  48:/home/tom/Documents/WORK/delay/startup.c **** void delay_250ns(void){
 152              		.loc 1 48 0
 153              		.cfi_startproc
 154              		@ args = 0, pretend = 0, frame = 0
 155              		@ frame_needed = 1, uses_anonymous_args = 0
 156 004e 80B5     		push	{r7, lr}
 157              		.cfi_def_cfa_offset 8
 158              		.cfi_offset 7, -8
 159              		.cfi_offset 14, -4
 160 0050 00AF     		add	r7, sp, #0
 161              		.cfi_def_cfa_register 7
  49:/home/tom/Documents/WORK/delay/startup.c ****     STK_CTRL = 0;
 162              		.loc 1 49 0
 163 0052 0C4B     		ldr	r3, .L10
 164 0054 0022     		movs	r2, #0
 165 0056 1A60     		str	r2, [r3]
  50:/home/tom/Documents/WORK/delay/startup.c ****     STK_LOAD = ((168/4)-1);
 166              		.loc 1 50 0
 167 0058 0B4B     		ldr	r3, .L10+4
 168 005a 2922     		movs	r2, #41
 169 005c 1A60     		str	r2, [r3]
  51:/home/tom/Documents/WORK/delay/startup.c ****     STK_VAL  = 0;
 170              		.loc 1 51 0
 171 005e 0B4B     		ldr	r3, .L10+8
 172 0060 0022     		movs	r2, #0
 173 0062 1A60     		str	r2, [r3]
  52:/home/tom/Documents/WORK/delay/startup.c ****     STK_CTRL = 5;
 174              		.loc 1 52 0
 175 0064 074B     		ldr	r3, .L10
 176 0066 0522     		movs	r2, #5
 177 0068 1A60     		str	r2, [r3]
  53:/home/tom/Documents/WORK/delay/startup.c ****     while( (STK_CTRL & 0x10000)== 0){}
 178              		.loc 1 53 0
 179 006a C046     		nop
 180              	.L9:
 181              		.loc 1 53 0 is_stmt 0 discriminator 1
 182 006c 054B     		ldr	r3, .L10
 183 006e 1A68     		ldr	r2, [r3]
 184 0070 8023     		movs	r3, #128
 185 0072 5B02     		lsls	r3, r3, #9
 186 0074 1340     		ands	r3, r2
 187 0076 F9D0     		beq	.L9
  54:/home/tom/Documents/WORK/delay/startup.c ****     STK_CTRL = 0;
 188              		.loc 1 54 0 is_stmt 1
 189 0078 024B     		ldr	r3, .L10
 190 007a 0022     		movs	r2, #0
 191 007c 1A60     		str	r2, [r3]
  55:/home/tom/Documents/WORK/delay/startup.c **** }
 192              		.loc 1 55 0
 193 007e C046     		nop
 194 0080 BD46     		mov	sp, r7
 195              		@ sp needed
 196 0082 80BD     		pop	{r7, pc}
 197              	.L11:
 198              		.align	2
 199              	.L10:
 200 0084 10E000E0 		.word	-536813552
 201 0088 14E000E0 		.word	-536813548
 202 008c 18E000E0 		.word	-536813544
 203              		.cfi_endproc
 204              	.LFE3:
 206              		.align	1
 207              		.global	init_app
 208              		.syntax unified
 209              		.code	16
 210              		.thumb_func
 211              		.fpu softvfp
 213              	init_app:
 214              	.LFB4:
  56:/home/tom/Documents/WORK/delay/startup.c **** 
  57:/home/tom/Documents/WORK/delay/startup.c **** void init_app(){
 215              		.loc 1 57 0
 216              		.cfi_startproc
 217              		@ args = 0, pretend = 0, frame = 0
 218              		@ frame_needed = 1, uses_anonymous_args = 0
 219 0090 80B5     		push	{r7, lr}
 220              		.cfi_def_cfa_offset 8
 221              		.cfi_offset 7, -8
 222              		.cfi_offset 14, -4
 223 0092 00AF     		add	r7, sp, #0
 224              		.cfi_def_cfa_register 7
  58:/home/tom/Documents/WORK/delay/startup.c ****     *GPIO_E_MODER = 0x00005555;
 225              		.loc 1 58 0
 226 0094 024B     		ldr	r3, .L13
 227 0096 034A     		ldr	r2, .L13+4
 228 0098 1A60     		str	r2, [r3]
  59:/home/tom/Documents/WORK/delay/startup.c ****    
  60:/home/tom/Documents/WORK/delay/startup.c **** }
 229              		.loc 1 60 0
 230 009a C046     		nop
 231 009c BD46     		mov	sp, r7
 232              		@ sp needed
 233 009e 80BD     		pop	{r7, pc}
 234              	.L14:
 235              		.align	2
 236              	.L13:
 237 00a0 00100240 		.word	1073876992
 238 00a4 55550000 		.word	21845
 239              		.cfi_endproc
 240              	.LFE4:
 242              		.align	1
 243              		.global	main
 244              		.syntax unified
 245              		.code	16
 246              		.thumb_func
 247              		.fpu softvfp
 249              	main:
 250              	.LFB5:
  61:/home/tom/Documents/WORK/delay/startup.c **** 
  62:/home/tom/Documents/WORK/delay/startup.c **** 
  63:/home/tom/Documents/WORK/delay/startup.c **** void main(void)
  64:/home/tom/Documents/WORK/delay/startup.c **** {
 251              		.loc 1 64 0
 252              		.cfi_startproc
 253              		@ args = 0, pretend = 0, frame = 0
 254              		@ frame_needed = 1, uses_anonymous_args = 0
 255 00a8 80B5     		push	{r7, lr}
 256              		.cfi_def_cfa_offset 8
 257              		.cfi_offset 7, -8
 258              		.cfi_offset 14, -4
 259 00aa 00AF     		add	r7, sp, #0
 260              		.cfi_def_cfa_register 7
  65:/home/tom/Documents/WORK/delay/startup.c ****     init_app();
 261              		.loc 1 65 0
 262 00ac FFF7FEFF 		bl	init_app
 263              	.L16:
  66:/home/tom/Documents/WORK/delay/startup.c ****     while(1){
  67:/home/tom/Documents/WORK/delay/startup.c ****         *GPIO_ODR_LOW = 0x0;
 264              		.loc 1 67 0 discriminator 1
 265 00b0 064B     		ldr	r3, .L17
 266 00b2 0022     		movs	r2, #0
 267 00b4 1A70     		strb	r2, [r3]
  68:/home/tom/Documents/WORK/delay/startup.c ****         delay_milli(5);
 268              		.loc 1 68 0 discriminator 1
 269 00b6 0520     		movs	r0, #5
 270 00b8 FFF7FEFF 		bl	delay_milli
  69:/home/tom/Documents/WORK/delay/startup.c ****         *GPIO_ODR_LOW = 0xFF;
 271              		.loc 1 69 0 discriminator 1
 272 00bc 034B     		ldr	r3, .L17
 273 00be FF22     		movs	r2, #255
 274 00c0 1A70     		strb	r2, [r3]
  70:/home/tom/Documents/WORK/delay/startup.c ****         delay_milli(5);
 275              		.loc 1 70 0 discriminator 1
 276 00c2 0520     		movs	r0, #5
 277 00c4 FFF7FEFF 		bl	delay_milli
  67:/home/tom/Documents/WORK/delay/startup.c ****         delay_milli(5);
 278              		.loc 1 67 0 discriminator 1
 279 00c8 F2E7     		b	.L16
 280              	.L18:
 281 00ca C046     		.align	2
 282              	.L17:
 283 00cc 14100240 		.word	1073877012
 284              		.cfi_endproc
 285              	.LFE5:
 287              	.Letext0:
