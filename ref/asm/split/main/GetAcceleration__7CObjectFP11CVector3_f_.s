.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetAcceleration__7CObjectFP11CVector3_f_
/* 056FC0 00156EC0 30008378 */  lq          $3, 0x30($4)
/* 056FC4 00156EC4 0000A37C */  sq          $3, 0x0($5)
/* 056FC8 00156EC8 0800E003 */  jr          $31
/* 056FCC 00156ECC 00000000 */   nop
