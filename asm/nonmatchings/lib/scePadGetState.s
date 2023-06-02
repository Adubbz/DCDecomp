.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadGetState
/* 1FC60 0011FB60 2D308000 */  daddu      $6, $4, $0
/* 1FC64 0011FB64 70000324 */  addiu      $3, $0, 0x70
/* 1FC68 0011FB68 1C000424 */  addiu      $4, $0, 0x1C
/* 1FC6C 0011FB6C 1818C370 */  mult1      $3, $6, $3
/* 1FC70 0011FB70 1820A400 */  mult       $4, $5, $4
/* 1FC74 0011FB74 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1FC78 0011FB78 2B00023C */  lui        $2, %hi(D_002A9C90)
/* 1FC7C 0011FB7C 0000BFFF */  sd         $31, 0x0($sp)
/* 1FC80 0011FB80 909C4224 */  addiu      $2, $2, %lo(D_002A9C90)
/* 1FC84 0011FB84 21208300 */  addu       $4, $4, $3
/* 1FC88 0011FB88 21104400 */  addu       $2, $2, $4
/* 1FC8C 0011FB8C 1000438C */  lw         $3, 0x10($2)
/* 1FC90 0011FB90 0E006010 */  beqz       $3, .L0011FBCC
/* 1FC94 0011FB94 63000224 */   addiu     $2, $0, 0x63
/* 1FC98 0011FB98 8C7E040C */  jal        scePadGetDmaStr
/* 1FC9C 0011FB9C 2D20C000 */   daddu     $4, $6, $0
/* 1FCA0 0011FBA0 2D204000 */  daddu      $4, $2, $0
/* 1FCA4 0011FBA4 06000324 */  addiu      $3, $0, 0x6
/* 1FCA8 0011FBA8 70008290 */  lbu        $2, 0x70($4)
/* 1FCAC 0011FBAC 08004314 */  bne        $2, $3, .L0011FBD0
/* 1FCB0 0011FBB0 0000BFDF */   ld        $31, 0x0($sp)
/* 1FCB4 0011FBB4 71008390 */  lbu        $3, 0x71($4)
/* 1FCB8 0011FBB8 02000224 */  addiu      $2, $0, 0x2
/* 1FCBC 0011FBBC 04006254 */  bnel       $3, $2, .L0011FBD0
/* 1FCC0 0011FBC0 70008290 */   lbu       $2, 0x70($4)
/* 1FCC4 0011FBC4 02000010 */  b          .L0011FBD0
/* 1FCC8 0011FBC8 05000224 */   addiu     $2, $0, 0x5
.L0011FBCC:
/* 1FCCC 0011FBCC 0000BFDF */  ld         $31, 0x0($sp)
.L0011FBD0:
/* 1FCD0 0011FBD0 0800E003 */  jr         $31
/* 1FCD4 0011FBD4 1000BD27 */   addiu     $sp, $sp, 0x10
