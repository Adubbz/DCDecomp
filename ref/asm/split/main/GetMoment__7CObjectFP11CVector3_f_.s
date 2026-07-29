.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetMoment__7CObjectFP11CVector3_f_
/* 056FE0 00156EE0 50008378 */  lq          $3, 0x50($4)
/* 056FE4 00156EE4 0000A37C */  sq          $3, 0x0($5)
/* 056FE8 00156EE8 0800E003 */  jr          $31
/* 056FEC 00156EEC 00000000 */   nop
