.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel cat_end__Fv
/* 798B0 001797B0 28160070 */  paddub     $2, $0, $0
/* 798B4 001797B4 28260070 */  paddub     $4, $0, $0
/* 798B8 001797B8 03000010 */  b          .L001797C8
/* 798BC 001797BC 00000000 */   nop
.L001797C0:
/* 798C0 001797C0 21104400 */  addu       $2, $2, $4
/* 798C4 001797C4 01008424 */  addiu      $4, $4, 0x1
.L001797C8:
/* 798C8 001797C8 0A008328 */  slti       $3, $4, 0xA
/* 798CC 001797CC FCFF6014 */  bnez       $3, .L001797C0
/* 798D0 001797D0 00000000 */   nop
/* 798D4 001797D4 0800E003 */  jr         $31
/* 798D8 001797D8 00000000 */   nop
/* 798DC 001797DC 00000000 */  nop
