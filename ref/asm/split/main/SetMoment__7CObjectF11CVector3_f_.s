.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetMoment__7CObjectF11CVector3_f_
/* 056E80 00156D80 E0FFBD27 */  addiu       $29, $29, -0x20
/* 056E84 00156D84 1000A627 */  addiu       $6, $29, 0x10
/* 056E88 00156D88 0000A378 */  lq          $3, 0x0($5)
/* 056E8C 00156D8C 0000C37C */  sq          $3, 0x0($6)
/* 056E90 00156D90 0000A527 */  addiu       $5, $29, 0x0
/* 056E94 00156D94 0000C378 */  lq          $3, 0x0($6)
/* 056E98 00156D98 0000A37C */  sq          $3, 0x0($5)
/* 056E9C 00156D9C 0000C378 */  lq          $3, 0x0($6)
/* 056EA0 00156DA0 5000837C */  sq          $3, 0x50($4)
/* 056EA4 00156DA4 2000BD27 */  addiu       $29, $29, 0x20
/* 056EA8 00156DA8 0800E003 */  jr          $31
/* 056EAC 00156DAC 00000000 */   nop
