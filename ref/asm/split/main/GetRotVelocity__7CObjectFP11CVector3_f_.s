.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRotVelocity__7CObjectFP11CVector3_f_
/* 057020 00156F20 70008378 */  lq          $3, 0x70($4)
/* 057024 00156F24 0000A37C */  sq          $3, 0x0($5)
/* 057028 00156F28 0800E003 */  jr          $31
/* 05702C 00156F2C 00000000 */   nop
