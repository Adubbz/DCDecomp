.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadRead
/* 1FBE0 0011FAE0 2D388000 */  daddu      $7, $4, $0
/* 1FBE4 0011FAE4 70000324 */  addiu      $3, $0, 0x70
/* 1FBE8 0011FAE8 1C000424 */  addiu      $4, $0, 0x1C
/* 1FBEC 0011FAEC 1818E370 */  mult1      $3, $7, $3
/* 1FBF0 0011FAF0 1820A400 */  mult       $4, $5, $4
/* 1FBF4 0011FAF4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 1FBF8 0011FAF8 2B00023C */  lui        $2, %hi(D_002A9C90)
/* 1FBFC 0011FAFC 1000B1FF */  sd         $17, 0x10($sp)
/* 1FC00 0011FB00 2000BFFF */  sd         $31, 0x20($sp)
/* 1FC04 0011FB04 909C4224 */  addiu      $2, $2, %lo(D_002A9C90)
/* 1FC08 0011FB08 0000B0FF */  sd         $16, 0x0($sp)
/* 1FC0C 0011FB0C 21208300 */  addu       $4, $4, $3
/* 1FC10 0011FB10 21104400 */  addu       $2, $2, $4
/* 1FC14 0011FB14 1000438C */  lw         $3, 0x10($2)
/* 1FC18 0011FB18 03006014 */  bnez       $3, .L0011FB28
/* 1FC1C 0011FB1C 2D88C000 */   daddu     $17, $6, $0
/* 1FC20 0011FB20 09000010 */  b          .L0011FB48
/* 1FC24 0011FB24 2D100000 */   daddu     $2, $0, $0
.L0011FB28:
/* 1FC28 0011FB28 8C7E040C */  jal        scePadGetDmaStr
/* 1FC2C 0011FB2C 2D20E000 */   daddu     $4, $7, $0
/* 1FC30 0011FB30 2D804000 */  daddu      $16, $2, $0
/* 1FC34 0011FB34 2D202002 */  daddu      $4, $17, $0
/* 1FC38 0011FB38 6000068E */  lw         $6, 0x60($16)
/* 1FC3C 0011FB3C EC0C040C */  jal        memcpy
/* 1FC40 0011FB40 2D280002 */   daddu     $5, $16, $0
/* 1FC44 0011FB44 6000028E */  lw         $2, 0x60($16)
.L0011FB48:
/* 1FC48 0011FB48 2000BFDF */  ld         $31, 0x20($sp)
/* 1FC4C 0011FB4C 1000B1DF */  ld         $17, 0x10($sp)
/* 1FC50 0011FB50 0000B0DF */  ld         $16, 0x0($sp)
/* 1FC54 0011FB54 0800E003 */  jr         $31
/* 1FC58 0011FB58 3000BD27 */   addiu     $sp, $sp, 0x30
/* 1FC5C 0011FB5C 00000000 */  nop
