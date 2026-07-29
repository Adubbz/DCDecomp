.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitSeSeq__FP10SND_SE_SEQ
/* 05AF00 0015AE00 FFFF0324 */  addiu       $3, $0, -0x1
/* 05AF04 0015AE04 000083A4 */  sh          $3, 0x0($4)
/* 05AF08 0015AE08 0800E003 */  jr          $31
/* 05AF0C 0015AE0C 00000000 */   nop
