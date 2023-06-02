.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitSeSeq__FP10SND_SE_SEQ
/* 5AF00 0015AE00 FFFF0324 */  addiu      $3, $0, -0x1
/* 5AF04 0015AE04 000083A4 */  sh         $3, 0x0($4)
/* 5AF08 0015AE08 0800E003 */  jr         $31
/* 5AF0C 0015AE0C 00000000 */   nop
