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
  25              		.file 1 "/home/tom/Documents/WORK/7seg/startup.c"
   1:/home/tom/Documents/WORK/7seg/startup.c **** /*
   2:/home/tom/Documents/WORK/7seg/startup.c ****  * 	startup.c
   3:/home/tom/Documents/WORK/7seg/startup.c ****  *
   4:/home/tom/Documents/WORK/7seg/startup.c ****  */
   5:/home/tom/Documents/WORK/7seg/startup.c ****  #include <stdio.h>
   6:/home/tom/Documents/WORK/7seg/startup.c ****  #define GPIO_D_BASE 0x40020C00
   7:/home/tom/Documents/WORK/7seg/startup.c ****  #define GPIO_D_MODER ((volatile unsigned int*)    GPIO_D_BASE)
   8:/home/tom/Documents/WORK/7seg/startup.c ****  #define GPIO_D_OTYPER_HIGH ((volatile unsigned char*)   GPIO_D_BASE+0x05)
   9:/home/tom/Documents/WORK/7seg/startup.c ****  #define GPIO_D_PUPDR_HIGH ((volatile unsigned short*)     GPIO_D_BASE+0x0E)
  10:/home/tom/Documents/WORK/7seg/startup.c ****  #define GPIO_D_IDR_HIGH ((volatile unsigned char*)     GPIO_D_BASE+0x11)
  11:/home/tom/Documents/WORK/7seg/startup.c ****  #define GPIO_D_IDR_LOW  ((volatile unsigned short*)     GPIO_D_BASE+0x10)
  12:/home/tom/Documents/WORK/7seg/startup.c ****  #define GPIO_D_ODR_HIGH ((volatile unsigned char*)     GPIO_D_BASE+0x15)
  13:/home/tom/Documents/WORK/7seg/startup.c ****  #define GPIO_D_ODR_LOW ((volatile unsigned char*)     GPIO_D_BASE+0x14)
  14:/home/tom/Documents/WORK/7seg/startup.c ****  
  15:/home/tom/Documents/WORK/7seg/startup.c ****  
  16:/home/tom/Documents/WORK/7seg/startup.c **** 
  17:/home/tom/Documents/WORK/7seg/startup.c ****  
  18:/home/tom/Documents/WORK/7seg/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  19:/home/tom/Documents/WORK/7seg/startup.c **** 
  20:/home/tom/Documents/WORK/7seg/startup.c **** 
  21:/home/tom/Documents/WORK/7seg/startup.c **** void startup ( void )
  22:/home/tom/Documents/WORK/7seg/startup.c **** {
  26              		.loc 1 22 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  23:/home/tom/Documents/WORK/7seg/startup.c **** __asm volatile(
  31              		.loc 1 23 0
  32              		.syntax divided
  33              	@ 23 "/home/tom/Documents/WORK/7seg/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  24:/home/tom/Documents/WORK/7seg/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  25:/home/tom/Documents/WORK/7seg/startup.c **** 	" MOV SP,R0\n"
  26:/home/tom/Documents/WORK/7seg/startup.c **** 	" BL main\n"				/* call main */
  27:/home/tom/Documents/WORK/7seg/startup.c **** 	"_exit: B .\n"				/* never return */
  28:/home/tom/Documents/WORK/7seg/startup.c **** 	) ;
  29:/home/tom/Documents/WORK/7seg/startup.c **** }
  40              		.loc 1 29 0
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
  30:/home/tom/Documents/WORK/7seg/startup.c **** 
  31:/home/tom/Documents/WORK/7seg/startup.c **** void app_init(void){
  57              		.loc 1 31 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  32:/home/tom/Documents/WORK/7seg/startup.c ****    *GPIO_D_MODER  = 0x55005555;
  67              		.loc 1 32 0
  68 0004 054B     		ldr	r3, .L3
  69 0006 064A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  33:/home/tom/Documents/WORK/7seg/startup.c ****    *GPIO_D_OTYPER_HIGH = 0x0F;
  71              		.loc 1 33 0
  72 000a 064B     		ldr	r3, .L3+8
  73 000c 0F22     		movs	r2, #15
  74 000e 1A70     		strb	r2, [r3]
  34:/home/tom/Documents/WORK/7seg/startup.c ****    *GPIO_D_PUPDR_HIGH  = 0x00AA;
  75              		.loc 1 34 0
  76 0010 054B     		ldr	r3, .L3+12
  77 0012 AA22     		movs	r2, #170
  78 0014 1A80     		strh	r2, [r3]
  35:/home/tom/Documents/WORK/7seg/startup.c **** 
  36:/home/tom/Documents/WORK/7seg/startup.c **** }
  79              		.loc 1 36 0
  80 0016 C046     		nop
  81 0018 BD46     		mov	sp, r7
  82              		@ sp needed
  83 001a 80BD     		pop	{r7, pc}
  84              	.L4:
  85              		.align	2
  86              	.L3:
  87 001c 000C0240 		.word	1073875968
  88 0020 55550055 		.word	1426085205
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
  37:/home/tom/Documents/WORK/7seg/startup.c **** void activateRow(int row){
 103              		.loc 1 37 0
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
  38:/home/tom/Documents/WORK/7seg/startup.c ****  
  39:/home/tom/Documents/WORK/7seg/startup.c ****     switch(row){
 116              		.loc 1 39 0
 117 0034 7B68     		ldr	r3, [r7, #4]
 118 0036 042B     		cmp	r3, #4
 119 0038 19D8     		bhi	.L13
 120 003a 7B68     		ldr	r3, [r7, #4]
 121 003c 9A00     		lsls	r2, r3, #2
 122 003e 0E4B     		ldr	r3, .L14
 123 0040 D318     		adds	r3, r2, r3
 124 0042 1B68     		ldr	r3, [r3]
 125 0044 9F46     		mov	pc, r3
 126              		.section	.rodata
 127              		.align	2
 128              	.L8:
 129 0000 66000000 		.word	.L7
 130 0004 46000000 		.word	.L9
 131 0008 4E000000 		.word	.L10
 132 000c 56000000 		.word	.L11
 133 0010 5E000000 		.word	.L12
 134              		.text
 135              	.L9:
  40:/home/tom/Documents/WORK/7seg/startup.c ****         case 1: *GPIO_D_ODR_HIGH = 0x10; break;
 136              		.loc 1 40 0
 137 0046 0D4B     		ldr	r3, .L14+4
 138 0048 1022     		movs	r2, #16
 139 004a 1A70     		strb	r2, [r3]
 140 004c 0FE0     		b	.L6
 141              	.L10:
  41:/home/tom/Documents/WORK/7seg/startup.c ****         case 2: *GPIO_D_ODR_HIGH = 0x20; break;
 142              		.loc 1 41 0
 143 004e 0B4B     		ldr	r3, .L14+4
 144 0050 2022     		movs	r2, #32
 145 0052 1A70     		strb	r2, [r3]
 146 0054 0BE0     		b	.L6
 147              	.L11:
  42:/home/tom/Documents/WORK/7seg/startup.c ****         case 3: *GPIO_D_ODR_HIGH = 0x40; break;
 148              		.loc 1 42 0
 149 0056 094B     		ldr	r3, .L14+4
 150 0058 4022     		movs	r2, #64
 151 005a 1A70     		strb	r2, [r3]
 152 005c 07E0     		b	.L6
 153              	.L12:
  43:/home/tom/Documents/WORK/7seg/startup.c ****         case 4: *GPIO_D_ODR_HIGH = 0x80; break;
 154              		.loc 1 43 0
 155 005e 074B     		ldr	r3, .L14+4
 156 0060 8022     		movs	r2, #128
 157 0062 1A70     		strb	r2, [r3]
 158 0064 03E0     		b	.L6
 159              	.L7:
  44:/home/tom/Documents/WORK/7seg/startup.c ****         case 0: *GPIO_D_ODR_HIGH = 0x00; break;
 160              		.loc 1 44 0
 161 0066 054B     		ldr	r3, .L14+4
 162 0068 0022     		movs	r2, #0
 163 006a 1A70     		strb	r2, [r3]
 164 006c C046     		nop
 165              	.L6:
 166              	.L13:
  45:/home/tom/Documents/WORK/7seg/startup.c ****     }
  46:/home/tom/Documents/WORK/7seg/startup.c **** }
 167              		.loc 1 46 0
 168 006e C046     		nop
 169 0070 BD46     		mov	sp, r7
 170 0072 02B0     		add	sp, sp, #8
 171              		@ sp needed
 172 0074 80BD     		pop	{r7, pc}
 173              	.L15:
 174 0076 C046     		.align	2
 175              	.L14:
 176 0078 00000000 		.word	.L8
 177 007c 150C0240 		.word	1073875989
 178              		.cfi_endproc
 179              	.LFE5:
 181              		.align	1
 182              		.global	readColumn
 183              		.syntax unified
 184              		.code	16
 185              		.thumb_func
 186              		.fpu softvfp
 188              	readColumn:
 189              	.LFB6:
  47:/home/tom/Documents/WORK/7seg/startup.c **** 
  48:/home/tom/Documents/WORK/7seg/startup.c **** int readColumn(void){
 190              		.loc 1 48 0
 191              		.cfi_startproc
 192              		@ args = 0, pretend = 0, frame = 8
 193              		@ frame_needed = 1, uses_anonymous_args = 0
 194 0080 80B5     		push	{r7, lr}
 195              		.cfi_def_cfa_offset 8
 196              		.cfi_offset 7, -8
 197              		.cfi_offset 14, -4
 198 0082 82B0     		sub	sp, sp, #8
 199              		.cfi_def_cfa_offset 16
 200 0084 00AF     		add	r7, sp, #0
 201              		.cfi_def_cfa_register 7
  49:/home/tom/Documents/WORK/7seg/startup.c ****     unsigned char c;
  50:/home/tom/Documents/WORK/7seg/startup.c ****     c = *GPIO_D_IDR_HIGH;
 202              		.loc 1 50 0
 203 0086 124A     		ldr	r2, .L22
 204 0088 FB1D     		adds	r3, r7, #7
 205 008a 1278     		ldrb	r2, [r2]
 206 008c 1A70     		strb	r2, [r3]
  51:/home/tom/Documents/WORK/7seg/startup.c ****     if( c & 0x8) return 4;
 207              		.loc 1 51 0
 208 008e FB1D     		adds	r3, r7, #7
 209 0090 1B78     		ldrb	r3, [r3]
 210 0092 0822     		movs	r2, #8
 211 0094 1340     		ands	r3, r2
 212 0096 01D0     		beq	.L17
 213              		.loc 1 51 0 is_stmt 0 discriminator 1
 214 0098 0423     		movs	r3, #4
 215 009a 15E0     		b	.L18
 216              	.L17:
  52:/home/tom/Documents/WORK/7seg/startup.c ****     if( c & 0x4) return 3;
 217              		.loc 1 52 0 is_stmt 1
 218 009c FB1D     		adds	r3, r7, #7
 219 009e 1B78     		ldrb	r3, [r3]
 220 00a0 0422     		movs	r2, #4
 221 00a2 1340     		ands	r3, r2
 222 00a4 01D0     		beq	.L19
 223              		.loc 1 52 0 is_stmt 0 discriminator 1
 224 00a6 0323     		movs	r3, #3
 225 00a8 0EE0     		b	.L18
 226              	.L19:
  53:/home/tom/Documents/WORK/7seg/startup.c ****     if( c & 0x2) return 2;
 227              		.loc 1 53 0 is_stmt 1
 228 00aa FB1D     		adds	r3, r7, #7
 229 00ac 1B78     		ldrb	r3, [r3]
 230 00ae 0222     		movs	r2, #2
 231 00b0 1340     		ands	r3, r2
 232 00b2 01D0     		beq	.L20
 233              		.loc 1 53 0 is_stmt 0 discriminator 1
 234 00b4 0223     		movs	r3, #2
 235 00b6 07E0     		b	.L18
 236              	.L20:
  54:/home/tom/Documents/WORK/7seg/startup.c ****     if( c & 0x1) return 1;
 237              		.loc 1 54 0 is_stmt 1
 238 00b8 FB1D     		adds	r3, r7, #7
 239 00ba 1B78     		ldrb	r3, [r3]
 240 00bc 0122     		movs	r2, #1
 241 00be 1340     		ands	r3, r2
 242 00c0 01D0     		beq	.L21
 243              		.loc 1 54 0 is_stmt 0 discriminator 1
 244 00c2 0123     		movs	r3, #1
 245 00c4 00E0     		b	.L18
 246              	.L21:
  55:/home/tom/Documents/WORK/7seg/startup.c ****     return 0;
 247              		.loc 1 55 0 is_stmt 1
 248 00c6 0023     		movs	r3, #0
 249              	.L18:
  56:/home/tom/Documents/WORK/7seg/startup.c ****         
  57:/home/tom/Documents/WORK/7seg/startup.c **** }
 250              		.loc 1 57 0
 251 00c8 1800     		movs	r0, r3
 252 00ca BD46     		mov	sp, r7
 253 00cc 02B0     		add	sp, sp, #8
 254              		@ sp needed
 255 00ce 80BD     		pop	{r7, pc}
 256              	.L23:
 257              		.align	2
 258              	.L22:
 259 00d0 110C0240 		.word	1073875985
 260              		.cfi_endproc
 261              	.LFE6:
 263              		.section	.rodata
 264              		.align	2
 265              	.LC0:
 266 0014 01       		.byte	1
 267 0015 02       		.byte	2
 268 0016 03       		.byte	3
 269 0017 0A       		.byte	10
 270 0018 04       		.byte	4
 271 0019 05       		.byte	5
 272 001a 06       		.byte	6
 273 001b 0B       		.byte	11
 274 001c 07       		.byte	7
 275 001d 08       		.byte	8
 276 001e 09       		.byte	9
 277 001f 0C       		.byte	12
 278 0020 0E       		.byte	14
 279 0021 00       		.byte	0
 280 0022 0F       		.byte	15
 281 0023 0D       		.byte	13
 282              		.text
 283              		.align	1
 284              		.global	keyb
 285              		.syntax unified
 286              		.code	16
 287              		.thumb_func
 288              		.fpu softvfp
 290              	keyb:
 291              	.LFB7:
  58:/home/tom/Documents/WORK/7seg/startup.c **** 
  59:/home/tom/Documents/WORK/7seg/startup.c ****     
  60:/home/tom/Documents/WORK/7seg/startup.c **** unsigned char keyb(void){
 292              		.loc 1 60 0
 293              		.cfi_startproc
 294              		@ args = 0, pretend = 0, frame = 24
 295              		@ frame_needed = 1, uses_anonymous_args = 0
 296 00d4 90B5     		push	{r4, r7, lr}
 297              		.cfi_def_cfa_offset 12
 298              		.cfi_offset 4, -12
 299              		.cfi_offset 7, -8
 300              		.cfi_offset 14, -4
 301 00d6 87B0     		sub	sp, sp, #28
 302              		.cfi_def_cfa_offset 40
 303 00d8 00AF     		add	r7, sp, #0
 304              		.cfi_def_cfa_register 7
  61:/home/tom/Documents/WORK/7seg/startup.c **** 	unsigned char key[]= {1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
 305              		.loc 1 61 0
 306 00da 3B00     		movs	r3, r7
 307 00dc 164A     		ldr	r2, .L30
 308 00de 13CA     		ldmia	r2!, {r0, r1, r4}
 309 00e0 13C3     		stmia	r3!, {r0, r1, r4}
 310 00e2 1268     		ldr	r2, [r2]
 311 00e4 1A60     		str	r2, [r3]
  62:/home/tom/Documents/WORK/7seg/startup.c ****     int row, col;
  63:/home/tom/Documents/WORK/7seg/startup.c ****     for(row = 1; row <=4; row++){
 312              		.loc 1 63 0
 313 00e6 0123     		movs	r3, #1
 314 00e8 7B61     		str	r3, [r7, #20]
 315 00ea 19E0     		b	.L25
 316              	.L28:
  64:/home/tom/Documents/WORK/7seg/startup.c ****         activateRow(row);
 317              		.loc 1 64 0
 318 00ec 7B69     		ldr	r3, [r7, #20]
 319 00ee 1800     		movs	r0, r3
 320 00f0 FFF7FEFF 		bl	activateRow
  65:/home/tom/Documents/WORK/7seg/startup.c ****         if((col = readColumn()))
 321              		.loc 1 65 0
 322 00f4 FFF7FEFF 		bl	readColumn
 323 00f8 0300     		movs	r3, r0
 324 00fa 3B61     		str	r3, [r7, #16]
 325 00fc 3B69     		ldr	r3, [r7, #16]
 326 00fe 002B     		cmp	r3, #0
 327 0100 0BD0     		beq	.L26
  66:/home/tom/Documents/WORK/7seg/startup.c ****         {
  67:/home/tom/Documents/WORK/7seg/startup.c ****             activateRow(0);
 328              		.loc 1 67 0
 329 0102 0020     		movs	r0, #0
 330 0104 FFF7FEFF 		bl	activateRow
  68:/home/tom/Documents/WORK/7seg/startup.c ****             return key[4*(row-1)+(col-1)];
 331              		.loc 1 68 0
 332 0108 7B69     		ldr	r3, [r7, #20]
 333 010a 013B     		subs	r3, r3, #1
 334 010c 9A00     		lsls	r2, r3, #2
 335 010e 3B69     		ldr	r3, [r7, #16]
 336 0110 013B     		subs	r3, r3, #1
 337 0112 D318     		adds	r3, r2, r3
 338 0114 3A00     		movs	r2, r7
 339 0116 D35C     		ldrb	r3, [r2, r3]
 340 0118 09E0     		b	.L29
 341              	.L26:
  63:/home/tom/Documents/WORK/7seg/startup.c ****         activateRow(row);
 342              		.loc 1 63 0 discriminator 2
 343 011a 7B69     		ldr	r3, [r7, #20]
 344 011c 0133     		adds	r3, r3, #1
 345 011e 7B61     		str	r3, [r7, #20]
 346              	.L25:
  63:/home/tom/Documents/WORK/7seg/startup.c ****         activateRow(row);
 347              		.loc 1 63 0 is_stmt 0 discriminator 1
 348 0120 7B69     		ldr	r3, [r7, #20]
 349 0122 042B     		cmp	r3, #4
 350 0124 E2DD     		ble	.L28
  69:/home/tom/Documents/WORK/7seg/startup.c ****         }
  70:/home/tom/Documents/WORK/7seg/startup.c ****     }
  71:/home/tom/Documents/WORK/7seg/startup.c ****     activateRow(0);
 351              		.loc 1 71 0 is_stmt 1
 352 0126 0020     		movs	r0, #0
 353 0128 FFF7FEFF 		bl	activateRow
  72:/home/tom/Documents/WORK/7seg/startup.c **** 	return 0xFF;
 354              		.loc 1 72 0
 355 012c FF23     		movs	r3, #255
 356              	.L29:
  73:/home/tom/Documents/WORK/7seg/startup.c **** }
 357              		.loc 1 73 0 discriminator 1
 358 012e 1800     		movs	r0, r3
 359 0130 BD46     		mov	sp, r7
 360 0132 07B0     		add	sp, sp, #28
 361              		@ sp needed
 362 0134 90BD     		pop	{r4, r7, pc}
 363              	.L31:
 364 0136 C046     		.align	2
 365              	.L30:
 366 0138 14000000 		.word	.LC0
 367              		.cfi_endproc
 368              	.LFE7:
 370              		.align	1
 371              		.global	out7seg
 372              		.syntax unified
 373              		.code	16
 374              		.thumb_func
 375              		.fpu softvfp
 377              	out7seg:
 378              	.LFB8:
  74:/home/tom/Documents/WORK/7seg/startup.c **** void out7seg(unsigned char c){
 379              		.loc 1 74 0
 380              		.cfi_startproc
 381              		@ args = 0, pretend = 0, frame = 8
 382              		@ frame_needed = 1, uses_anonymous_args = 0
 383 013c 80B5     		push	{r7, lr}
 384              		.cfi_def_cfa_offset 8
 385              		.cfi_offset 7, -8
 386              		.cfi_offset 14, -4
 387 013e 82B0     		sub	sp, sp, #8
 388              		.cfi_def_cfa_offset 16
 389 0140 00AF     		add	r7, sp, #0
 390              		.cfi_def_cfa_register 7
 391 0142 0200     		movs	r2, r0
 392 0144 FB1D     		adds	r3, r7, #7
 393 0146 1A70     		strb	r2, [r3]
  75:/home/tom/Documents/WORK/7seg/startup.c ****         switch(c){
 394              		.loc 1 75 0
 395 0148 FB1D     		adds	r3, r7, #7
 396 014a 1B78     		ldrb	r3, [r3]
 397 014c 0F2B     		cmp	r3, #15
 398 014e 44D8     		bhi	.L33
 399 0150 9A00     		lsls	r2, r3, #2
 400 0152 254B     		ldr	r3, .L52
 401 0154 D318     		adds	r3, r2, r3
 402 0156 1B68     		ldr	r3, [r3]
 403 0158 9F46     		mov	pc, r3
 404              		.section	.rodata
 405              		.align	2
 406              	.L35:
 407 0024 5A010000 		.word	.L34
 408 0028 62010000 		.word	.L36
 409 002c 6A010000 		.word	.L37
 410 0030 72010000 		.word	.L38
 411 0034 7A010000 		.word	.L39
 412 0038 82010000 		.word	.L40
 413 003c 8A010000 		.word	.L41
 414 0040 92010000 		.word	.L42
 415 0044 9A010000 		.word	.L43
 416 0048 A2010000 		.word	.L44
 417 004c AA010000 		.word	.L45
 418 0050 B2010000 		.word	.L46
 419 0054 BA010000 		.word	.L47
 420 0058 C2010000 		.word	.L48
 421 005c CA010000 		.word	.L49
 422 0060 D2010000 		.word	.L50
 423              		.text
 424              	.L34:
  76:/home/tom/Documents/WORK/7seg/startup.c ****             case 0: *GPIO_D_ODR_LOW = 0x3F; break;
 425              		.loc 1 76 0
 426 015a 244B     		ldr	r3, .L52+4
 427 015c 3F22     		movs	r2, #63
 428 015e 1A70     		strb	r2, [r3]
 429 0160 3EE0     		b	.L51
 430              	.L36:
  77:/home/tom/Documents/WORK/7seg/startup.c ****             case 1: *GPIO_D_ODR_LOW = 0x06; break; 
 431              		.loc 1 77 0
 432 0162 224B     		ldr	r3, .L52+4
 433 0164 0622     		movs	r2, #6
 434 0166 1A70     		strb	r2, [r3]
 435 0168 3AE0     		b	.L51
 436              	.L37:
  78:/home/tom/Documents/WORK/7seg/startup.c ****             case 2: *GPIO_D_ODR_LOW = 0x5B; break;
 437              		.loc 1 78 0
 438 016a 204B     		ldr	r3, .L52+4
 439 016c 5B22     		movs	r2, #91
 440 016e 1A70     		strb	r2, [r3]
 441 0170 36E0     		b	.L51
 442              	.L38:
  79:/home/tom/Documents/WORK/7seg/startup.c ****             case 3: *GPIO_D_ODR_LOW = 0x4F; break;
 443              		.loc 1 79 0
 444 0172 1E4B     		ldr	r3, .L52+4
 445 0174 4F22     		movs	r2, #79
 446 0176 1A70     		strb	r2, [r3]
 447 0178 32E0     		b	.L51
 448              	.L39:
  80:/home/tom/Documents/WORK/7seg/startup.c ****             case 4: *GPIO_D_ODR_LOW = 0x66; break;
 449              		.loc 1 80 0
 450 017a 1C4B     		ldr	r3, .L52+4
 451 017c 6622     		movs	r2, #102
 452 017e 1A70     		strb	r2, [r3]
 453 0180 2EE0     		b	.L51
 454              	.L40:
  81:/home/tom/Documents/WORK/7seg/startup.c ****             case 5: *GPIO_D_ODR_LOW = 0x6D; break;
 455              		.loc 1 81 0
 456 0182 1A4B     		ldr	r3, .L52+4
 457 0184 6D22     		movs	r2, #109
 458 0186 1A70     		strb	r2, [r3]
 459 0188 2AE0     		b	.L51
 460              	.L41:
  82:/home/tom/Documents/WORK/7seg/startup.c ****             case 6: *GPIO_D_ODR_LOW = 0x7D; break;
 461              		.loc 1 82 0
 462 018a 184B     		ldr	r3, .L52+4
 463 018c 7D22     		movs	r2, #125
 464 018e 1A70     		strb	r2, [r3]
 465 0190 26E0     		b	.L51
 466              	.L42:
  83:/home/tom/Documents/WORK/7seg/startup.c ****             case 7: *GPIO_D_ODR_LOW = 0x07; break;
 467              		.loc 1 83 0
 468 0192 164B     		ldr	r3, .L52+4
 469 0194 0722     		movs	r2, #7
 470 0196 1A70     		strb	r2, [r3]
 471 0198 22E0     		b	.L51
 472              	.L43:
  84:/home/tom/Documents/WORK/7seg/startup.c ****             case 8: *GPIO_D_ODR_LOW = 0x7F; break;
 473              		.loc 1 84 0
 474 019a 144B     		ldr	r3, .L52+4
 475 019c 7F22     		movs	r2, #127
 476 019e 1A70     		strb	r2, [r3]
 477 01a0 1EE0     		b	.L51
 478              	.L44:
  85:/home/tom/Documents/WORK/7seg/startup.c ****             case 9: *GPIO_D_ODR_LOW = 0x6F; break;
 479              		.loc 1 85 0
 480 01a2 124B     		ldr	r3, .L52+4
 481 01a4 6F22     		movs	r2, #111
 482 01a6 1A70     		strb	r2, [r3]
 483 01a8 1AE0     		b	.L51
 484              	.L45:
  86:/home/tom/Documents/WORK/7seg/startup.c ****             case 0xA: *GPIO_D_ODR_LOW = 0x77; break;
 485              		.loc 1 86 0
 486 01aa 104B     		ldr	r3, .L52+4
 487 01ac 7722     		movs	r2, #119
 488 01ae 1A70     		strb	r2, [r3]
 489 01b0 16E0     		b	.L51
 490              	.L46:
  87:/home/tom/Documents/WORK/7seg/startup.c ****             case 0xB: *GPIO_D_ODR_LOW = 0x7C; break;
 491              		.loc 1 87 0
 492 01b2 0E4B     		ldr	r3, .L52+4
 493 01b4 7C22     		movs	r2, #124
 494 01b6 1A70     		strb	r2, [r3]
 495 01b8 12E0     		b	.L51
 496              	.L47:
  88:/home/tom/Documents/WORK/7seg/startup.c ****             case 0xC: *GPIO_D_ODR_LOW = 0x39; break;
 497              		.loc 1 88 0
 498 01ba 0C4B     		ldr	r3, .L52+4
 499 01bc 3922     		movs	r2, #57
 500 01be 1A70     		strb	r2, [r3]
 501 01c0 0EE0     		b	.L51
 502              	.L48:
  89:/home/tom/Documents/WORK/7seg/startup.c ****             case 0xD: *GPIO_D_ODR_LOW = 0x5E; break;
 503              		.loc 1 89 0
 504 01c2 0A4B     		ldr	r3, .L52+4
 505 01c4 5E22     		movs	r2, #94
 506 01c6 1A70     		strb	r2, [r3]
 507 01c8 0AE0     		b	.L51
 508              	.L49:
  90:/home/tom/Documents/WORK/7seg/startup.c ****             case 0xE: *GPIO_D_ODR_LOW = 0xF9; break;
 509              		.loc 1 90 0
 510 01ca 084B     		ldr	r3, .L52+4
 511 01cc F922     		movs	r2, #249
 512 01ce 1A70     		strb	r2, [r3]
 513 01d0 06E0     		b	.L51
 514              	.L50:
  91:/home/tom/Documents/WORK/7seg/startup.c ****             case 0xF: *GPIO_D_ODR_LOW = 0xF1; break;
 515              		.loc 1 91 0
 516 01d2 064B     		ldr	r3, .L52+4
 517 01d4 F122     		movs	r2, #241
 518 01d6 1A70     		strb	r2, [r3]
 519 01d8 02E0     		b	.L51
 520              	.L33:
  92:/home/tom/Documents/WORK/7seg/startup.c ****             default: *GPIO_D_ODR_LOW = 0xFF;
 521              		.loc 1 92 0
 522 01da 044B     		ldr	r3, .L52+4
 523 01dc FF22     		movs	r2, #255
 524 01de 1A70     		strb	r2, [r3]
 525              	.L51:
  93:/home/tom/Documents/WORK/7seg/startup.c ****         }
  94:/home/tom/Documents/WORK/7seg/startup.c **** }
 526              		.loc 1 94 0
 527 01e0 C046     		nop
 528 01e2 BD46     		mov	sp, r7
 529 01e4 02B0     		add	sp, sp, #8
 530              		@ sp needed
 531 01e6 80BD     		pop	{r7, pc}
 532              	.L53:
 533              		.align	2
 534              	.L52:
 535 01e8 24000000 		.word	.L35
 536 01ec 140C0240 		.word	1073875988
 537              		.cfi_endproc
 538              	.LFE8:
 540              		.align	1
 541              		.global	main
 542              		.syntax unified
 543              		.code	16
 544              		.thumb_func
 545              		.fpu softvfp
 547              	main:
 548              	.LFB9:
  95:/home/tom/Documents/WORK/7seg/startup.c ****     
  96:/home/tom/Documents/WORK/7seg/startup.c **** int main(void){
 549              		.loc 1 96 0
 550              		.cfi_startproc
 551              		@ args = 0, pretend = 0, frame = 0
 552              		@ frame_needed = 1, uses_anonymous_args = 0
 553 01f0 80B5     		push	{r7, lr}
 554              		.cfi_def_cfa_offset 8
 555              		.cfi_offset 7, -8
 556              		.cfi_offset 14, -4
 557 01f2 00AF     		add	r7, sp, #0
 558              		.cfi_def_cfa_register 7
  97:/home/tom/Documents/WORK/7seg/startup.c ****     app_init();
 559              		.loc 1 97 0
 560 01f4 FFF7FEFF 		bl	app_init
 561              	.L55:
  98:/home/tom/Documents/WORK/7seg/startup.c ****     
  99:/home/tom/Documents/WORK/7seg/startup.c ****     while(1){
 100:/home/tom/Documents/WORK/7seg/startup.c ****         out7seg(keyb());
 562              		.loc 1 100 0 discriminator 1
 563 01f8 FFF7FEFF 		bl	keyb
 564 01fc 0300     		movs	r3, r0
 565 01fe 1800     		movs	r0, r3
 566 0200 FFF7FEFF 		bl	out7seg
 567 0204 F8E7     		b	.L55
 568              		.cfi_endproc
 569              	.LFE9:
 571              	.Letext0:
 572              		.file 2 "/usr/local/gcc-arm/arm-none-eabi/include/sys/lock.h"
 573              		.file 3 "/usr/local/gcc-arm/arm-none-eabi/include/sys/_types.h"
 574              		.file 4 "/usr/local/gcc-arm/lib/gcc/arm-none-eabi/7.2.1/include/stddef.h"
 575              		.file 5 "/usr/local/gcc-arm/arm-none-eabi/include/sys/reent.h"
