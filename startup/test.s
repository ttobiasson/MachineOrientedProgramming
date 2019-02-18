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
  24              	.LFB3:
  25              		.file 1 "/home/tom/Documents/WORK/startup/startup.c"
   1:/home/tom/Documents/WORK/startup/startup.c **** /*
   2:/home/tom/Documents/WORK/startup/startup.c ****  * 	startup.c
   3:/home/tom/Documents/WORK/startup/startup.c ****  *
   4:/home/tom/Documents/WORK/startup/startup.c ****  */
   5:/home/tom/Documents/WORK/startup/startup.c ****  #include <stdio.h>
   6:/home/tom/Documents/WORK/startup/startup.c ****  #define GPIO_D_BASE 0x40020C00
   7:/home/tom/Documents/WORK/startup/startup.c ****  #define GPIO_D_MODER ((volatile unsigned short*)    			GPIO_D_BASE)
   8:/home/tom/Documents/WORK/startup/startup.c ****  #define GPIO_D_OTYPER_HIGH ((volatile unsigned char*)   	GPIO_D_BASE+0x05)
   9:/home/tom/Documents/WORK/startup/startup.c ****  #define GPIO_D_PUPDR_HIGH ((volatile unsigned short*)     	GPIO_D_BASE+0x0E)
  10:/home/tom/Documents/WORK/startup/startup.c ****  #define GPIO_D_IDR_HIGH ((volatile unsigned char*)     	GPIO_D_BASE+0x11)
  11:/home/tom/Documents/WORK/startup/startup.c ****  #define GPIO_D_ODR_HIGH ((volatile unsigned char*)     	GPIO_D_BASE+0x15)
  12:/home/tom/Documents/WORK/startup/startup.c ****  #define GPIO_D_ODR_LOW ((volatile unsigned char*)     		GPIO_D_BASE+0x14)
  13:/home/tom/Documents/WORK/startup/startup.c ****  
  14:/home/tom/Documents/WORK/startup/startup.c **** 
  15:/home/tom/Documents/WORK/startup/startup.c ****  
  16:/home/tom/Documents/WORK/startup/startup.c ****  
  17:/home/tom/Documents/WORK/startup/startup.c **** 
  18:/home/tom/Documents/WORK/startup/startup.c ****  
  19:/home/tom/Documents/WORK/startup/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  20:/home/tom/Documents/WORK/startup/startup.c **** 
  21:/home/tom/Documents/WORK/startup/startup.c **** 
  22:/home/tom/Documents/WORK/startup/startup.c **** void startup ( void )
  23:/home/tom/Documents/WORK/startup/startup.c **** {
  26              		.loc 1 23 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  24:/home/tom/Documents/WORK/startup/startup.c **** __asm volatile(
  31              		.loc 1 24 0
  32              		.syntax divided
  33              	@ 24 "/home/tom/Documents/WORK/startup/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  25:/home/tom/Documents/WORK/startup/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  26:/home/tom/Documents/WORK/startup/startup.c **** 	" MOV SP,R0\n"
  27:/home/tom/Documents/WORK/startup/startup.c **** 	" BL main\n"				/* call main */
  28:/home/tom/Documents/WORK/startup/startup.c **** 	"_exit: B .\n"				/* never return */
  29:/home/tom/Documents/WORK/startup/startup.c **** 	) ;
  30:/home/tom/Documents/WORK/startup/startup.c **** }
  40              		.loc 1 30 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE3:
  47              		.text
  48              		.align	1
  49              		.global	app_init
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	app_init:
  56              	.LFB4:
  31:/home/tom/Documents/WORK/startup/startup.c **** 
  32:/home/tom/Documents/WORK/startup/startup.c **** void app_init(void){
  57              		.loc 1 32 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  33:/home/tom/Documents/WORK/startup/startup.c **** 
  34:/home/tom/Documents/WORK/startup/startup.c ****    *GPIO_D_MODER  = 0x5500;
  67              		.loc 1 34 0
  68 0004 064B     		ldr	r3, .L3
  69 0006 AA22     		movs	r2, #170
  70 0008 D201     		lsls	r2, r2, #7
  71 000a 1A80     		strh	r2, [r3]
  35:/home/tom/Documents/WORK/startup/startup.c ****    *GPIO_D_OTYPER_HIGH = 0x0F;
  72              		.loc 1 35 0
  73 000c 054B     		ldr	r3, .L3+4
  74 000e 0F22     		movs	r2, #15
  75 0010 1A70     		strb	r2, [r3]
  36:/home/tom/Documents/WORK/startup/startup.c ****    *GPIO_D_PUPDR_HIGH  = 0x00AA;
  76              		.loc 1 36 0
  77 0012 054B     		ldr	r3, .L3+8
  78 0014 AA22     		movs	r2, #170
  79 0016 1A80     		strh	r2, [r3]
  37:/home/tom/Documents/WORK/startup/startup.c **** 
  38:/home/tom/Documents/WORK/startup/startup.c **** }
  80              		.loc 1 38 0
  81 0018 C046     		nop
  82 001a BD46     		mov	sp, r7
  83              		@ sp needed
  84 001c 80BD     		pop	{r7, pc}
  85              	.L4:
  86 001e C046     		.align	2
  87              	.L3:
  88 0020 000C0240 		.word	1073875968
  89 0024 050C0240 		.word	1073875973
  90 0028 1C0C0240 		.word	1073875996
  91              		.cfi_endproc
  92              	.LFE4:
  94              		.align	1
  95              		.global	activateRow
  96              		.syntax unified
  97              		.code	16
  98              		.thumb_func
  99              		.fpu softvfp
 101              	activateRow:
 102              	.LFB5:
  39:/home/tom/Documents/WORK/startup/startup.c **** void activateRow(int row){
 103              		.loc 1 39 0
 104              		.cfi_startproc
 105              		@ args = 0, pretend = 0, frame = 8
 106              		@ frame_needed = 1, uses_anonymous_args = 0
 107 002c 80B5     		push	{r7, lr}
 108              		.cfi_def_cfa_offset 8
 109              		.cfi_offset 7, -8
 110              		.cfi_offset 14, -4
 111 002e 82B0     		sub	sp, sp, #8
 112              		.cfi_def_cfa_offset 16
 113 0030 00AF     		add	r7, sp, #0
 114              		.cfi_def_cfa_register 7
 115 0032 7860     		str	r0, [r7, #4]
  40:/home/tom/Documents/WORK/startup/startup.c **** 	*GPIO_D_ODR_HIGH = 0x0;
 116              		.loc 1 40 0
 117 0034 0F4B     		ldr	r3, .L11
 118 0036 0022     		movs	r2, #0
 119 0038 1A70     		strb	r2, [r3]
  41:/home/tom/Documents/WORK/startup/startup.c **** 	if(row == 1){
 120              		.loc 1 41 0
 121 003a 7B68     		ldr	r3, [r7, #4]
 122 003c 012B     		cmp	r3, #1
 123 003e 02D1     		bne	.L6
  42:/home/tom/Documents/WORK/startup/startup.c **** 		*GPIO_D_ODR_HIGH = 0x10;
 124              		.loc 1 42 0
 125 0040 0C4B     		ldr	r3, .L11
 126 0042 1022     		movs	r2, #16
 127 0044 1A70     		strb	r2, [r3]
 128              	.L6:
  43:/home/tom/Documents/WORK/startup/startup.c **** 	}
  44:/home/tom/Documents/WORK/startup/startup.c **** 	if(row == 2){
 129              		.loc 1 44 0
 130 0046 7B68     		ldr	r3, [r7, #4]
 131 0048 022B     		cmp	r3, #2
 132 004a 02D1     		bne	.L7
  45:/home/tom/Documents/WORK/startup/startup.c **** 		*GPIO_D_ODR_HIGH = 0x20;
 133              		.loc 1 45 0
 134 004c 094B     		ldr	r3, .L11
 135 004e 2022     		movs	r2, #32
 136 0050 1A70     		strb	r2, [r3]
 137              	.L7:
  46:/home/tom/Documents/WORK/startup/startup.c **** 	}
  47:/home/tom/Documents/WORK/startup/startup.c **** 	if(row == 3){
 138              		.loc 1 47 0
 139 0052 7B68     		ldr	r3, [r7, #4]
 140 0054 032B     		cmp	r3, #3
 141 0056 02D1     		bne	.L8
  48:/home/tom/Documents/WORK/startup/startup.c **** 		*GPIO_D_ODR_HIGH = 0x40;
 142              		.loc 1 48 0
 143 0058 064B     		ldr	r3, .L11
 144 005a 4022     		movs	r2, #64
 145 005c 1A70     		strb	r2, [r3]
 146              	.L8:
  49:/home/tom/Documents/WORK/startup/startup.c **** 	}
  50:/home/tom/Documents/WORK/startup/startup.c **** 	if(row == 4){
 147              		.loc 1 50 0
 148 005e 7B68     		ldr	r3, [r7, #4]
 149 0060 042B     		cmp	r3, #4
 150 0062 02D1     		bne	.L10
  51:/home/tom/Documents/WORK/startup/startup.c **** 		*GPIO_D_ODR_HIGH = 0x80;
 151              		.loc 1 51 0
 152 0064 034B     		ldr	r3, .L11
 153 0066 8022     		movs	r2, #128
 154 0068 1A70     		strb	r2, [r3]
 155              	.L10:
  52:/home/tom/Documents/WORK/startup/startup.c **** 	}
  53:/home/tom/Documents/WORK/startup/startup.c **** 
  54:/home/tom/Documents/WORK/startup/startup.c **** }
 156              		.loc 1 54 0
 157 006a C046     		nop
 158 006c BD46     		mov	sp, r7
 159 006e 02B0     		add	sp, sp, #8
 160              		@ sp needed
 161 0070 80BD     		pop	{r7, pc}
 162              	.L12:
 163 0072 C046     		.align	2
 164              	.L11:
 165 0074 150C0240 		.word	1073875989
 166              		.cfi_endproc
 167              	.LFE5:
 169              		.align	1
 170              		.global	readColumn
 171              		.syntax unified
 172              		.code	16
 173              		.thumb_func
 174              		.fpu softvfp
 176              	readColumn:
 177              	.LFB6:
  55:/home/tom/Documents/WORK/startup/startup.c **** unsigned char readColumn(){
 178              		.loc 1 55 0
 179              		.cfi_startproc
 180              		@ args = 0, pretend = 0, frame = 0
 181              		@ frame_needed = 1, uses_anonymous_args = 0
 182 0078 80B5     		push	{r7, lr}
 183              		.cfi_def_cfa_offset 8
 184              		.cfi_offset 7, -8
 185              		.cfi_offset 14, -4
 186 007a 00AF     		add	r7, sp, #0
 187              		.cfi_def_cfa_register 7
  56:/home/tom/Documents/WORK/startup/startup.c **** 	if(*GPIO_D_IDR_HIGH == 0x01){
 188              		.loc 1 56 0
 189 007c 0F4B     		ldr	r3, .L19
 190 007e 1B78     		ldrb	r3, [r3]
 191 0080 DBB2     		uxtb	r3, r3
 192 0082 012B     		cmp	r3, #1
 193 0084 01D1     		bne	.L14
  57:/home/tom/Documents/WORK/startup/startup.c **** 		return 0x1;
 194              		.loc 1 57 0
 195 0086 0123     		movs	r3, #1
 196 0088 14E0     		b	.L13
 197              	.L14:
  58:/home/tom/Documents/WORK/startup/startup.c **** 	}
  59:/home/tom/Documents/WORK/startup/startup.c **** 	if(*GPIO_D_IDR_HIGH == 0x02){
 198              		.loc 1 59 0
 199 008a 0C4B     		ldr	r3, .L19
 200 008c 1B78     		ldrb	r3, [r3]
 201 008e DBB2     		uxtb	r3, r3
 202 0090 022B     		cmp	r3, #2
 203 0092 01D1     		bne	.L16
  60:/home/tom/Documents/WORK/startup/startup.c **** 		return 0x2;
 204              		.loc 1 60 0
 205 0094 0223     		movs	r3, #2
 206 0096 0DE0     		b	.L13
 207              	.L16:
  61:/home/tom/Documents/WORK/startup/startup.c **** 	}
  62:/home/tom/Documents/WORK/startup/startup.c **** 	if(*GPIO_D_IDR_HIGH == 0x04){
 208              		.loc 1 62 0
 209 0098 084B     		ldr	r3, .L19
 210 009a 1B78     		ldrb	r3, [r3]
 211 009c DBB2     		uxtb	r3, r3
 212 009e 042B     		cmp	r3, #4
 213 00a0 01D1     		bne	.L17
  63:/home/tom/Documents/WORK/startup/startup.c **** 		return 0x4;
 214              		.loc 1 63 0
 215 00a2 0423     		movs	r3, #4
 216 00a4 06E0     		b	.L13
 217              	.L17:
  64:/home/tom/Documents/WORK/startup/startup.c **** 	}
  65:/home/tom/Documents/WORK/startup/startup.c **** 	if(*GPIO_D_IDR_HIGH == 0x08){
 218              		.loc 1 65 0
 219 00a6 054B     		ldr	r3, .L19
 220 00a8 1B78     		ldrb	r3, [r3]
 221 00aa DBB2     		uxtb	r3, r3
 222 00ac 082B     		cmp	r3, #8
 223 00ae 01D1     		bne	.L18
  66:/home/tom/Documents/WORK/startup/startup.c **** 		return 0x8;
 224              		.loc 1 66 0
 225 00b0 0823     		movs	r3, #8
 226 00b2 FFE7     		b	.L13
 227              	.L18:
 228              	.L13:
  67:/home/tom/Documents/WORK/startup/startup.c **** 	}
  68:/home/tom/Documents/WORK/startup/startup.c **** }
 229              		.loc 1 68 0
 230 00b4 1800     		movs	r0, r3
 231 00b6 BD46     		mov	sp, r7
 232              		@ sp needed
 233 00b8 80BD     		pop	{r7, pc}
 234              	.L20:
 235 00ba C046     		.align	2
 236              	.L19:
 237 00bc 110C0240 		.word	1073875985
 238              		.cfi_endproc
 239              	.LFE6:
 241              		.align	1
 242              		.global	keyb
 243              		.syntax unified
 244              		.code	16
 245              		.thumb_func
 246              		.fpu softvfp
 248              	keyb:
 249              	.LFB7:
  69:/home/tom/Documents/WORK/startup/startup.c **** 
  70:/home/tom/Documents/WORK/startup/startup.c ****     
  71:/home/tom/Documents/WORK/startup/startup.c **** unsigned char keyb(void){
 250              		.loc 1 71 0
 251              		.cfi_startproc
 252              		@ args = 0, pretend = 0, frame = 8
 253              		@ frame_needed = 1, uses_anonymous_args = 0
 254 00c0 90B5     		push	{r4, r7, lr}
 255              		.cfi_def_cfa_offset 12
 256              		.cfi_offset 4, -12
 257              		.cfi_offset 7, -8
 258              		.cfi_offset 14, -4
 259 00c2 83B0     		sub	sp, sp, #12
 260              		.cfi_def_cfa_offset 24
 261 00c4 00AF     		add	r7, sp, #0
 262              		.cfi_def_cfa_register 7
 263              	.LBB2:
  72:/home/tom/Documents/WORK/startup/startup.c **** 	char column;
  73:/home/tom/Documents/WORK/startup/startup.c **** 	for(int i = 1; i <= 4; i++){
 264              		.loc 1 73 0
 265 00c6 0123     		movs	r3, #1
 266 00c8 7B60     		str	r3, [r7, #4]
 267 00ca A2E0     		b	.L22
 268              	.L41:
  74:/home/tom/Documents/WORK/startup/startup.c **** 			activateRow(i);
 269              		.loc 1 74 0
 270 00cc 7B68     		ldr	r3, [r7, #4]
 271 00ce 1800     		movs	r0, r3
 272 00d0 FFF7FEFF 		bl	activateRow
  75:/home/tom/Documents/WORK/startup/startup.c **** 			column = readColumn();
 273              		.loc 1 75 0
 274 00d4 FC1C     		adds	r4, r7, #3
 275 00d6 FFF7FEFF 		bl	readColumn
 276 00da 0300     		movs	r3, r0
 277 00dc 2370     		strb	r3, [r4]
  76:/home/tom/Documents/WORK/startup/startup.c **** 			if(column != 0){
 278              		.loc 1 76 0
 279 00de FB1C     		adds	r3, r7, #3
 280 00e0 1B78     		ldrb	r3, [r3]
 281 00e2 002B     		cmp	r3, #0
 282 00e4 00D1     		bne	.LCB212
 283 00e6 91E0     		b	.L23	@long jump
 284              	.LCB212:
  77:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x01 && i == 1){ //1
 285              		.loc 1 77 0
 286 00e8 FB1C     		adds	r3, r7, #3
 287 00ea 1B78     		ldrb	r3, [r3]
 288 00ec 012B     		cmp	r3, #1
 289 00ee 04D1     		bne	.L24
 290              		.loc 1 77 0 is_stmt 0 discriminator 1
 291 00f0 7B68     		ldr	r3, [r7, #4]
 292 00f2 012B     		cmp	r3, #1
 293 00f4 01D1     		bne	.L24
  78:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x06;
 294              		.loc 1 78 0 is_stmt 1
 295 00f6 0623     		movs	r3, #6
 296 00f8 8FE0     		b	.L21
 297              	.L24:
  79:/home/tom/Documents/WORK/startup/startup.c **** 
  80:/home/tom/Documents/WORK/startup/startup.c **** 				}
  81:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x02 && i == 1){ //2
 298              		.loc 1 81 0
 299 00fa FB1C     		adds	r3, r7, #3
 300 00fc 1B78     		ldrb	r3, [r3]
 301 00fe 022B     		cmp	r3, #2
 302 0100 04D1     		bne	.L26
 303              		.loc 1 81 0 is_stmt 0 discriminator 1
 304 0102 7B68     		ldr	r3, [r7, #4]
 305 0104 012B     		cmp	r3, #1
 306 0106 01D1     		bne	.L26
  82:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x5B;
 307              		.loc 1 82 0 is_stmt 1
 308 0108 5B23     		movs	r3, #91
 309 010a 86E0     		b	.L21
 310              	.L26:
  83:/home/tom/Documents/WORK/startup/startup.c **** 
  84:/home/tom/Documents/WORK/startup/startup.c **** 				}
  85:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x04 && i == 1){ //3
 311              		.loc 1 85 0
 312 010c FB1C     		adds	r3, r7, #3
 313 010e 1B78     		ldrb	r3, [r3]
 314 0110 042B     		cmp	r3, #4
 315 0112 04D1     		bne	.L27
 316              		.loc 1 85 0 is_stmt 0 discriminator 1
 317 0114 7B68     		ldr	r3, [r7, #4]
 318 0116 012B     		cmp	r3, #1
 319 0118 01D1     		bne	.L27
  86:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x4F;
 320              		.loc 1 86 0 is_stmt 1
 321 011a 4F23     		movs	r3, #79
 322 011c 7DE0     		b	.L21
 323              	.L27:
  87:/home/tom/Documents/WORK/startup/startup.c **** 					
  88:/home/tom/Documents/WORK/startup/startup.c **** 				}
  89:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x08 && i == 1){ //A
 324              		.loc 1 89 0
 325 011e FB1C     		adds	r3, r7, #3
 326 0120 1B78     		ldrb	r3, [r3]
 327 0122 082B     		cmp	r3, #8
 328 0124 04D1     		bne	.L28
 329              		.loc 1 89 0 is_stmt 0 discriminator 1
 330 0126 7B68     		ldr	r3, [r7, #4]
 331 0128 012B     		cmp	r3, #1
 332 012a 01D1     		bne	.L28
  90:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x77;
 333              		.loc 1 90 0 is_stmt 1
 334 012c 7723     		movs	r3, #119
 335 012e 74E0     		b	.L21
 336              	.L28:
  91:/home/tom/Documents/WORK/startup/startup.c **** 
  92:/home/tom/Documents/WORK/startup/startup.c **** 
  93:/home/tom/Documents/WORK/startup/startup.c **** 	
  94:/home/tom/Documents/WORK/startup/startup.c **** 				}
  95:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x01 && i == 2){ //4
 337              		.loc 1 95 0
 338 0130 FB1C     		adds	r3, r7, #3
 339 0132 1B78     		ldrb	r3, [r3]
 340 0134 012B     		cmp	r3, #1
 341 0136 04D1     		bne	.L29
 342              		.loc 1 95 0 is_stmt 0 discriminator 1
 343 0138 7B68     		ldr	r3, [r7, #4]
 344 013a 022B     		cmp	r3, #2
 345 013c 01D1     		bne	.L29
  96:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x66;
 346              		.loc 1 96 0 is_stmt 1
 347 013e 6623     		movs	r3, #102
 348 0140 6BE0     		b	.L21
 349              	.L29:
  97:/home/tom/Documents/WORK/startup/startup.c **** 
  98:/home/tom/Documents/WORK/startup/startup.c **** 				}
  99:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x02 && i == 2){ //5
 350              		.loc 1 99 0
 351 0142 FB1C     		adds	r3, r7, #3
 352 0144 1B78     		ldrb	r3, [r3]
 353 0146 022B     		cmp	r3, #2
 354 0148 04D1     		bne	.L30
 355              		.loc 1 99 0 is_stmt 0 discriminator 1
 356 014a 7B68     		ldr	r3, [r7, #4]
 357 014c 022B     		cmp	r3, #2
 358 014e 01D1     		bne	.L30
 100:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x6D;
 359              		.loc 1 100 0 is_stmt 1
 360 0150 6D23     		movs	r3, #109
 361 0152 62E0     		b	.L21
 362              	.L30:
 101:/home/tom/Documents/WORK/startup/startup.c **** 	
 102:/home/tom/Documents/WORK/startup/startup.c **** 				}
 103:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x04 && i == 2){ //6
 363              		.loc 1 103 0
 364 0154 FB1C     		adds	r3, r7, #3
 365 0156 1B78     		ldrb	r3, [r3]
 366 0158 042B     		cmp	r3, #4
 367 015a 04D1     		bne	.L31
 368              		.loc 1 103 0 is_stmt 0 discriminator 1
 369 015c 7B68     		ldr	r3, [r7, #4]
 370 015e 022B     		cmp	r3, #2
 371 0160 01D1     		bne	.L31
 104:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x7D;
 372              		.loc 1 104 0 is_stmt 1
 373 0162 7D23     		movs	r3, #125
 374 0164 59E0     		b	.L21
 375              	.L31:
 105:/home/tom/Documents/WORK/startup/startup.c **** 	
 106:/home/tom/Documents/WORK/startup/startup.c **** 				}
 107:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x08 && i == 2){ //B
 376              		.loc 1 107 0
 377 0166 FB1C     		adds	r3, r7, #3
 378 0168 1B78     		ldrb	r3, [r3]
 379 016a 082B     		cmp	r3, #8
 380 016c 04D1     		bne	.L32
 381              		.loc 1 107 0 is_stmt 0 discriminator 1
 382 016e 7B68     		ldr	r3, [r7, #4]
 383 0170 022B     		cmp	r3, #2
 384 0172 01D1     		bne	.L32
 108:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x5B;
 385              		.loc 1 108 0 is_stmt 1
 386 0174 5B23     		movs	r3, #91
 387 0176 50E0     		b	.L21
 388              	.L32:
 109:/home/tom/Documents/WORK/startup/startup.c **** 	
 110:/home/tom/Documents/WORK/startup/startup.c **** 	
 111:/home/tom/Documents/WORK/startup/startup.c **** 	
 112:/home/tom/Documents/WORK/startup/startup.c **** 				}
 113:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x01 && i == 3){ //7
 389              		.loc 1 113 0
 390 0178 FB1C     		adds	r3, r7, #3
 391 017a 1B78     		ldrb	r3, [r3]
 392 017c 012B     		cmp	r3, #1
 393 017e 04D1     		bne	.L33
 394              		.loc 1 113 0 is_stmt 0 discriminator 1
 395 0180 7B68     		ldr	r3, [r7, #4]
 396 0182 032B     		cmp	r3, #3
 397 0184 01D1     		bne	.L33
 114:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x07;
 398              		.loc 1 114 0 is_stmt 1
 399 0186 0723     		movs	r3, #7
 400 0188 47E0     		b	.L21
 401              	.L33:
 115:/home/tom/Documents/WORK/startup/startup.c **** 	
 116:/home/tom/Documents/WORK/startup/startup.c **** 				}
 117:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x02 && i == 3){ //8
 402              		.loc 1 117 0
 403 018a FB1C     		adds	r3, r7, #3
 404 018c 1B78     		ldrb	r3, [r3]
 405 018e 022B     		cmp	r3, #2
 406 0190 04D1     		bne	.L34
 407              		.loc 1 117 0 is_stmt 0 discriminator 1
 408 0192 7B68     		ldr	r3, [r7, #4]
 409 0194 032B     		cmp	r3, #3
 410 0196 01D1     		bne	.L34
 118:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x7F;
 411              		.loc 1 118 0 is_stmt 1
 412 0198 7F23     		movs	r3, #127
 413 019a 3EE0     		b	.L21
 414              	.L34:
 119:/home/tom/Documents/WORK/startup/startup.c **** 	
 120:/home/tom/Documents/WORK/startup/startup.c **** 				}
 121:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x04 && i == 3){ //9
 415              		.loc 1 121 0
 416 019c FB1C     		adds	r3, r7, #3
 417 019e 1B78     		ldrb	r3, [r3]
 418 01a0 042B     		cmp	r3, #4
 419 01a2 04D1     		bne	.L35
 420              		.loc 1 121 0 is_stmt 0 discriminator 1
 421 01a4 7B68     		ldr	r3, [r7, #4]
 422 01a6 032B     		cmp	r3, #3
 423 01a8 01D1     		bne	.L35
 122:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x6F;
 424              		.loc 1 122 0 is_stmt 1
 425 01aa 6F23     		movs	r3, #111
 426 01ac 35E0     		b	.L21
 427              	.L35:
 123:/home/tom/Documents/WORK/startup/startup.c **** 	
 124:/home/tom/Documents/WORK/startup/startup.c **** 				}
 125:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x08 && i == 3){ //C
 428              		.loc 1 125 0
 429 01ae FB1C     		adds	r3, r7, #3
 430 01b0 1B78     		ldrb	r3, [r3]
 431 01b2 082B     		cmp	r3, #8
 432 01b4 04D1     		bne	.L36
 433              		.loc 1 125 0 is_stmt 0 discriminator 1
 434 01b6 7B68     		ldr	r3, [r7, #4]
 435 01b8 032B     		cmp	r3, #3
 436 01ba 01D1     		bne	.L36
 126:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x39;
 437              		.loc 1 126 0 is_stmt 1
 438 01bc 3923     		movs	r3, #57
 439 01be 2CE0     		b	.L21
 440              	.L36:
 127:/home/tom/Documents/WORK/startup/startup.c **** 	
 128:/home/tom/Documents/WORK/startup/startup.c **** 	
 129:/home/tom/Documents/WORK/startup/startup.c **** 	
 130:/home/tom/Documents/WORK/startup/startup.c **** 				}
 131:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x01 && i == 4){ //Stjärna
 441              		.loc 1 131 0
 442 01c0 FB1C     		adds	r3, r7, #3
 443 01c2 1B78     		ldrb	r3, [r3]
 444 01c4 012B     		cmp	r3, #1
 445 01c6 04D1     		bne	.L37
 446              		.loc 1 131 0 is_stmt 0 discriminator 1
 447 01c8 7B68     		ldr	r3, [r7, #4]
 448 01ca 042B     		cmp	r3, #4
 449 01cc 01D1     		bne	.L37
 132:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x76;
 450              		.loc 1 132 0 is_stmt 1
 451 01ce 7623     		movs	r3, #118
 452 01d0 23E0     		b	.L21
 453              	.L37:
 133:/home/tom/Documents/WORK/startup/startup.c **** 	
 134:/home/tom/Documents/WORK/startup/startup.c **** 				}
 135:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x02 && i == 4){ //0
 454              		.loc 1 135 0
 455 01d2 FB1C     		adds	r3, r7, #3
 456 01d4 1B78     		ldrb	r3, [r3]
 457 01d6 022B     		cmp	r3, #2
 458 01d8 04D1     		bne	.L38
 459              		.loc 1 135 0 is_stmt 0 discriminator 1
 460 01da 7B68     		ldr	r3, [r7, #4]
 461 01dc 042B     		cmp	r3, #4
 462 01de 01D1     		bne	.L38
 136:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x3F;
 463              		.loc 1 136 0 is_stmt 1
 464 01e0 3F23     		movs	r3, #63
 465 01e2 1AE0     		b	.L21
 466              	.L38:
 137:/home/tom/Documents/WORK/startup/startup.c **** 	
 138:/home/tom/Documents/WORK/startup/startup.c **** 				}
 139:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x04 && i == 4){ //Fyrkant
 467              		.loc 1 139 0
 468 01e4 FB1C     		adds	r3, r7, #3
 469 01e6 1B78     		ldrb	r3, [r3]
 470 01e8 042B     		cmp	r3, #4
 471 01ea 04D1     		bne	.L39
 472              		.loc 1 139 0 is_stmt 0 discriminator 1
 473 01ec 7B68     		ldr	r3, [r7, #4]
 474 01ee 042B     		cmp	r3, #4
 475 01f0 01D1     		bne	.L39
 140:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x8;
 476              		.loc 1 140 0 is_stmt 1
 477 01f2 0823     		movs	r3, #8
 478 01f4 11E0     		b	.L21
 479              	.L39:
 141:/home/tom/Documents/WORK/startup/startup.c **** 	
 142:/home/tom/Documents/WORK/startup/startup.c **** 				}
 143:/home/tom/Documents/WORK/startup/startup.c **** 				if(column == 0x08 && i == 4){ // D
 480              		.loc 1 143 0
 481 01f6 FB1C     		adds	r3, r7, #3
 482 01f8 1B78     		ldrb	r3, [r3]
 483 01fa 082B     		cmp	r3, #8
 484 01fc 04D1     		bne	.L40
 485              		.loc 1 143 0 is_stmt 0 discriminator 1
 486 01fe 7B68     		ldr	r3, [r7, #4]
 487 0200 042B     		cmp	r3, #4
 488 0202 01D1     		bne	.L40
 144:/home/tom/Documents/WORK/startup/startup.c **** 					return 0x5D;
 489              		.loc 1 144 0 is_stmt 1
 490 0204 5D23     		movs	r3, #93
 491 0206 08E0     		b	.L21
 492              	.L40:
 145:/home/tom/Documents/WORK/startup/startup.c **** 	
 146:/home/tom/Documents/WORK/startup/startup.c **** 				}
 147:/home/tom/Documents/WORK/startup/startup.c **** 				else return 0xFF;
 493              		.loc 1 147 0
 494 0208 FF23     		movs	r3, #255
 495 020a 06E0     		b	.L21
 496              	.L23:
  73:/home/tom/Documents/WORK/startup/startup.c **** 			activateRow(i);
 497              		.loc 1 73 0 discriminator 2
 498 020c 7B68     		ldr	r3, [r7, #4]
 499 020e 0133     		adds	r3, r3, #1
 500 0210 7B60     		str	r3, [r7, #4]
 501              	.L22:
  73:/home/tom/Documents/WORK/startup/startup.c **** 			activateRow(i);
 502              		.loc 1 73 0 is_stmt 0 discriminator 1
 503 0212 7B68     		ldr	r3, [r7, #4]
 504 0214 042B     		cmp	r3, #4
 505 0216 00DC     		bgt	.LCB417
 506 0218 58E7     		b	.L41	@long jump
 507              	.LCB417:
 508              	.L21:
 509              	.LBE2:
 148:/home/tom/Documents/WORK/startup/startup.c **** 			}
 149:/home/tom/Documents/WORK/startup/startup.c **** 	}
 150:/home/tom/Documents/WORK/startup/startup.c **** 	
 151:/home/tom/Documents/WORK/startup/startup.c **** }
 510              		.loc 1 151 0 is_stmt 1
 511 021a 1800     		movs	r0, r3
 512 021c BD46     		mov	sp, r7
 513 021e 03B0     		add	sp, sp, #12
 514              		@ sp needed
 515 0220 90BD     		pop	{r4, r7, pc}
 516              		.cfi_endproc
 517              	.LFE7:
 519              		.align	1
 520              		.global	out7seg
 521              		.syntax unified
 522              		.code	16
 523              		.thumb_func
 524              		.fpu softvfp
 526              	out7seg:
 527              	.LFB8:
 152:/home/tom/Documents/WORK/startup/startup.c **** void out7seg(unsigned char c){
 528              		.loc 1 152 0
 529              		.cfi_startproc
 530              		@ args = 0, pretend = 0, frame = 8
 531              		@ frame_needed = 1, uses_anonymous_args = 0
 532 0222 80B5     		push	{r7, lr}
 533              		.cfi_def_cfa_offset 8
 534              		.cfi_offset 7, -8
 535              		.cfi_offset 14, -4
 536 0224 82B0     		sub	sp, sp, #8
 537              		.cfi_def_cfa_offset 16
 538 0226 00AF     		add	r7, sp, #0
 539              		.cfi_def_cfa_register 7
 540 0228 0200     		movs	r2, r0
 541 022a FB1D     		adds	r3, r7, #7
 542 022c 1A70     		strb	r2, [r3]
 153:/home/tom/Documents/WORK/startup/startup.c **** 	*GPIO_D_ODR_LOW = c;
 543              		.loc 1 153 0
 544 022e 044A     		ldr	r2, .L43
 545 0230 FB1D     		adds	r3, r7, #7
 546 0232 1B78     		ldrb	r3, [r3]
 547 0234 1370     		strb	r3, [r2]
 154:/home/tom/Documents/WORK/startup/startup.c **** 
 155:/home/tom/Documents/WORK/startup/startup.c **** 	
 156:/home/tom/Documents/WORK/startup/startup.c **** }
 548              		.loc 1 156 0
 549 0236 C046     		nop
 550 0238 BD46     		mov	sp, r7
 551 023a 02B0     		add	sp, sp, #8
 552              		@ sp needed
 553 023c 80BD     		pop	{r7, pc}
 554              	.L44:
 555 023e C046     		.align	2
 556              	.L43:
 557 0240 140C0240 		.word	1073875988
 558              		.cfi_endproc
 559              	.LFE8:
 561              		.align	1
 562              		.global	main
 563              		.syntax unified
 564              		.code	16
 565              		.thumb_func
 566              		.fpu softvfp
 568              	main:
 569              	.LFB9:
 157:/home/tom/Documents/WORK/startup/startup.c ****     
 158:/home/tom/Documents/WORK/startup/startup.c **** void main(void){
 570              		.loc 1 158 0
 571              		.cfi_startproc
 572              		@ args = 0, pretend = 0, frame = 0
 573              		@ frame_needed = 1, uses_anonymous_args = 0
 574 0244 80B5     		push	{r7, lr}
 575              		.cfi_def_cfa_offset 8
 576              		.cfi_offset 7, -8
 577              		.cfi_offset 14, -4
 578 0246 00AF     		add	r7, sp, #0
 579              		.cfi_def_cfa_register 7
 159:/home/tom/Documents/WORK/startup/startup.c ****     app_init();
 580              		.loc 1 159 0
 581 0248 FFF7FEFF 		bl	app_init
 582              	.L46:
 160:/home/tom/Documents/WORK/startup/startup.c ****     
 161:/home/tom/Documents/WORK/startup/startup.c ****     while(1){
 162:/home/tom/Documents/WORK/startup/startup.c **** 		*GPIO_D_ODR_LOW = 0x3B;
 583              		.loc 1 162 0 discriminator 1
 584 024c 044B     		ldr	r3, .L47
 585 024e 3B22     		movs	r2, #59
 586 0250 1A70     		strb	r2, [r3]
 163:/home/tom/Documents/WORK/startup/startup.c ****         out7seg(keyb());
 587              		.loc 1 163 0 discriminator 1
 588 0252 FFF7FEFF 		bl	keyb
 589 0256 0300     		movs	r3, r0
 590 0258 1800     		movs	r0, r3
 591 025a FFF7FEFF 		bl	out7seg
 162:/home/tom/Documents/WORK/startup/startup.c ****         out7seg(keyb());
 592              		.loc 1 162 0 discriminator 1
 593 025e F5E7     		b	.L46
 594              	.L48:
 595              		.align	2
 596              	.L47:
 597 0260 140C0240 		.word	1073875988
 598              		.cfi_endproc
 599              	.LFE9:
 601              	.Letext0:
 602              		.file 2 "/usr/local/gcc-arm/arm-none-eabi/include/sys/lock.h"
 603              		.file 3 "/usr/local/gcc-arm/arm-none-eabi/include/sys/_types.h"
 604              		.file 4 "/usr/local/gcc-arm/lib/gcc/arm-none-eabi/7.2.1/include/stddef.h"
 605              		.file 5 "/usr/local/gcc-arm/arm-none-eabi/include/sys/reent.h"
