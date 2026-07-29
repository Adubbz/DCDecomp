.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetAcceleration__7CObjectF11CVector3_f_
/* 056E20 00156D20 E0FFBD27 */  addiu       $29, $29, -0x20
/* 056E24 00156D24 1000A627 */  addiu       $6, $29, 0x10
/* 056E28 00156D28 0000A378 */  lq          $3, 0x0($5)
/* 056E2C 00156D2C 0000C37C */  sq          $3, 0x0($6)
/* 056E30 00156D30 0000A527 */  addiu       $5, $29, 0x0
/* 056E34 00156D34 0000C378 */  lq          $3, 0x0($6)
/* 056E38 00156D38 0000A37C */  sq          $3, 0x0($5)
/* 056E3C 00156D3C 0000C378 */  lq          $3, 0x0($6)
/* 056E40 00156D40 3000837C */  sq          $3, 0x30($4)
/* 056E44 00156D44 2000BD27 */  addiu       $29, $29, 0x20
/* 056E48 00156D48 0800E003 */  jr          $31
/* 056E4C 00156D4C 00000000 */   nop
