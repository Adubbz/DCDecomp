.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRotAcceleration__7CObjectFP11CVector3_f_
/* 057030 00156F30 80008378 */  lq          $3, 0x80($4)
/* 057034 00156F34 0000A37C */  sq          $3, 0x0($5)
/* 057038 00156F38 0800E003 */  jr          $31
/* 05703C 00156F3C 00000000 */   nop
