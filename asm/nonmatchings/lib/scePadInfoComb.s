.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadInfoComb
/* 1FF20 0011FE20 2D408000 */  daddu      $8, $4, $0
/* 1FF24 0011FE24 70000324 */  addiu      $3, $0, 0x70
/* 1FF28 0011FE28 1C000424 */  addiu      $4, $0, 0x1C
/* 1FF2C 0011FE2C 18180371 */  mult1      $3, $8, $3
/* 1FF30 0011FE30 1820A400 */  mult       $4, $5, $4
/* 1FF34 0011FE34 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 1FF38 0011FE38 2B00023C */  lui        $2, %hi(D_002A9C90)
/* 1FF3C 0011FE3C 1000B1FF */  sd         $17, 0x10($sp)
/* 1FF40 0011FE40 0000B0FF */  sd         $16, 0x0($sp)
/* 1FF44 0011FE44 909C4224 */  addiu      $2, $2, %lo(D_002A9C90)
/* 1FF48 0011FE48 2000BFFF */  sd         $31, 0x20($sp)
/* 1FF4C 0011FE4C 2D88C000 */  daddu      $17, $6, $0
/* 1FF50 0011FE50 21208300 */  addu       $4, $4, $3
/* 1FF54 0011FE54 21104400 */  addu       $2, $2, $4
/* 1FF58 0011FE58 1000438C */  lw         $3, 0x10($2)
/* 1FF5C 0011FE5C 31006010 */  beqz       $3, .L0011FF24
/* 1FF60 0011FE60 2D80E000 */   daddu     $16, $7, $0
/* 1FF64 0011FE64 8C7E040C */  jal        scePadGetDmaStr
/* 1FF68 0011FE68 2D200001 */   daddu     $4, $8, $0
/* 1FF6C 0011FE6C 2D204000 */  daddu      $4, $2, $0
/* 1FF70 0011FE70 72008390 */  lbu        $3, 0x72($4)
/* 1FF74 0011FE74 01000224 */  addiu      $2, $0, 0x1
/* 1FF78 0011FE78 2B006214 */  bne        $3, $2, .L0011FF28
/* 1FF7C 0011FE7C 2D100000 */   daddu     $2, $0, $0
/* 1FF80 0011FE80 64008290 */  lbu        $2, 0x64($4)
/* 1FF84 0011FE84 0200422C */  sltiu      $2, $2, 0x2
/* 1FF88 0011FE88 27004014 */  bnez       $2, .L0011FF28
/* 1FF8C 0011FE8C 2D100000 */   daddu     $2, $0, $0
/* 1FF90 0011FE90 FFFF0524 */  addiu      $5, $0, -0x1
/* 1FF94 0011FE94 03002516 */  bne        $17, $5, .L0011FEA4
/* 1FF98 0011FE98 6B008290 */   lbu       $2, 0x6B($4)
/* 1FF9C 0011FE9C 23000010 */  b          .L0011FF2C
/* 1FFA0 0011FEA0 2000BFDF */   ld        $31, 0x20($sp)
.L0011FEA4:
/* 1FFA4 0011FEA4 2A102202 */  slt        $2, $17, $2
/* 1FFA8 0011FEA8 1F004050 */  beql       $2, $0, .L0011FF28
/* 1FFAC 0011FEAC 2D100000 */   daddu     $2, $0, $0
/* 1FFB0 0011FEB0 11000052 */  beql       $16, $0, .L0011FEF8
/* 1FFB4 0011FEB4 80181100 */   sll       $3, $17, 2
/* 1FFB8 0011FEB8 0500001E */  bgtz       $16, .L0011FED0
/* 1FFBC 0011FEBC 00000000 */   nop
/* 1FFC0 0011FEC0 09000512 */  beq        $16, $5, .L0011FEE8
/* 1FFC4 0011FEC4 2D100000 */   daddu     $2, $0, $0
/* 1FFC8 0011FEC8 18000010 */  b          .L0011FF2C
/* 1FFCC 0011FECC 2000BFDF */   ld        $31, 0x20($sp)
.L0011FED0:
/* 1FFD0 0011FED0 0C000312 */  beq        $16, $3, .L0011FF04
/* 1FFD4 0011FED4 02000224 */   addiu     $2, $0, 0x2
/* 1FFD8 0011FED8 0E000212 */  beq        $16, $2, .L0011FF14
/* 1FFDC 0011FEDC 2D100000 */   daddu     $2, $0, $0
/* 1FFE0 0011FEE0 12000010 */  b          .L0011FF2C
/* 1FFE4 0011FEE4 2000BFDF */   ld        $31, 0x20($sp)
.L0011FEE8:
/* 1FFE8 0011FEE8 80181100 */  sll        $3, $17, 2
/* 1FFEC 0011FEEC 21188300 */  addu       $3, $4, $3
/* 1FFF0 0011FEF0 0D000010 */  b          .L0011FF28
/* 1FFF4 0011FEF4 40006290 */   lbu       $2, 0x40($3)
.L0011FEF8:
/* 1FFF8 0011FEF8 21188300 */  addu       $3, $4, $3
/* 1FFFC 0011FEFC 0A000010 */  b          .L0011FF28
/* 20000 0011FF00 41006290 */   lbu       $2, 0x41($3)
.L0011FF04:
/* 20004 0011FF04 80181100 */  sll        $3, $17, 2
/* 20008 0011FF08 21188300 */  addu       $3, $4, $3
/* 2000C 0011FF0C 06000010 */  b          .L0011FF28
/* 20010 0011FF10 42006290 */   lbu       $2, 0x42($3)
.L0011FF14:
/* 20014 0011FF14 80181100 */  sll        $3, $17, 2
/* 20018 0011FF18 21188300 */  addu       $3, $4, $3
/* 2001C 0011FF1C 02000010 */  b          .L0011FF28
/* 20020 0011FF20 43006290 */   lbu       $2, 0x43($3)
.L0011FF24:
/* 20024 0011FF24 2D100000 */  daddu      $2, $0, $0
.L0011FF28:
/* 20028 0011FF28 2000BFDF */  ld         $31, 0x20($sp)
.L0011FF2C:
/* 2002C 0011FF2C 1000B1DF */  ld         $17, 0x10($sp)
/* 20030 0011FF30 0000B0DF */  ld         $16, 0x0($sp)
/* 20034 0011FF34 0800E003 */  jr         $31
/* 20038 0011FF38 3000BD27 */   addiu     $sp, $sp, 0x30
/* 2003C 0011FF3C 00000000 */  nop
