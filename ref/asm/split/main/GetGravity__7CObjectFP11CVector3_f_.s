.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetGravity__7CObjectFP11CVector3_f_
/* 056FD0 00156ED0 40008378 */  lq          $3, 0x40($4)
/* 056FD4 00156ED4 0000A37C */  sq          $3, 0x0($5)
/* 056FD8 00156ED8 0800E003 */  jr          $31
/* 056FDC 00156EDC 00000000 */   nop
