.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRotation__7CObjectFP11CVector3_f_
/* 057010 00156F10 60008378 */  lq          $3, 0x60($4)
/* 057014 00156F14 0000A37C */  sq          $3, 0x0($5)
/* 057018 00156F18 0800E003 */  jr          $31
/* 05701C 00156F1C 00000000 */   nop
