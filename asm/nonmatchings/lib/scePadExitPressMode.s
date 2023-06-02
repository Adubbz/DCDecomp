.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadExitPressMode
/* 20588 00120488 2D308000 */  daddu      $6, $4, $0
/* 2058C 0012048C 70000324 */  addiu      $3, $0, 0x70
/* 20590 00120490 1C000424 */  addiu      $4, $0, 0x1C
/* 20594 00120494 1818C370 */  mult1      $3, $6, $3
/* 20598 00120498 1820A400 */  mult       $4, $5, $4
/* 2059C 0012049C F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 205A0 001204A0 2B00023C */  lui        $2, %hi(D_002A9C90)
/* 205A4 001204A4 0000BFFF */  sd         $31, 0x0($sp)
/* 205A8 001204A8 909C4224 */  addiu      $2, $2, %lo(D_002A9C90)
/* 205AC 001204AC 21208300 */  addu       $4, $4, $3
/* 205B0 001204B0 21104400 */  addu       $2, $2, $4
/* 205B4 001204B4 1000438C */  lw         $3, 0x10($2)
/* 205B8 001204B8 03006014 */  bnez       $3, .L001204C8
/* 205BC 001204BC 2D20C000 */   daddu     $4, $6, $0
/* 205C0 001204C0 03000010 */  b          .L001204D0
/* 205C4 001204C4 2D100000 */   daddu     $2, $0, $0
.L001204C8:
/* 205C8 001204C8 C880040C */  jal        scePadSetButtonInfo
/* 205CC 001204CC 2D300000 */   daddu     $6, $0, $0
.L001204D0:
/* 205D0 001204D0 0000BFDF */  ld         $31, 0x0($sp)
/* 205D4 001204D4 0800E003 */  jr         $31
/* 205D8 001204D8 1000BD27 */   addiu     $sp, $sp, 0x10
/* 205DC 001204DC 00000000 */  nop
