.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadGetFrameCount
/* 1FB90 0011FA90 2D308000 */  daddu      $6, $4, $0
/* 1FB94 0011FA94 70000324 */  addiu      $3, $0, 0x70
/* 1FB98 0011FA98 1C000424 */  addiu      $4, $0, 0x1C
/* 1FB9C 0011FA9C 1818C370 */  mult1      $3, $6, $3
/* 1FBA0 0011FAA0 1820A400 */  mult       $4, $5, $4
/* 1FBA4 0011FAA4 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1FBA8 0011FAA8 2B00023C */  lui        $2, %hi(D_002A9C90)
/* 1FBAC 0011FAAC 0000BFFF */  sd         $31, 0x0($sp)
/* 1FBB0 0011FAB0 909C4224 */  addiu      $2, $2, %lo(D_002A9C90)
/* 1FBB4 0011FAB4 21208300 */  addu       $4, $4, $3
/* 1FBB8 0011FAB8 21104400 */  addu       $2, $2, $4
/* 1FBBC 0011FABC 1000438C */  lw         $3, 0x10($2)
/* 1FBC0 0011FAC0 04006010 */  beqz       $3, .L0011FAD4
/* 1FBC4 0011FAC4 2D100000 */   daddu     $2, $0, $0
/* 1FBC8 0011FAC8 8C7E040C */  jal        scePadGetDmaStr
/* 1FBCC 0011FACC 2D20C000 */   daddu     $4, $6, $0
/* 1FBD0 0011FAD0 5800428C */  lw         $2, 0x58($2)
.L0011FAD4:
/* 1FBD4 0011FAD4 0000BFDF */  ld         $31, 0x0($sp)
/* 1FBD8 0011FAD8 0800E003 */  jr         $31
/* 1FBDC 0011FADC 1000BD27 */   addiu     $sp, $sp, 0x10
