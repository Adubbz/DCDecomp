.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetVelocity__7CObjectF11CVector3_f_
/* 056DF0 00156CF0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 056DF4 00156CF4 1000A627 */  addiu       $6, $29, 0x10
/* 056DF8 00156CF8 0000A378 */  lq          $3, 0x0($5)
/* 056DFC 00156CFC 0000C37C */  sq          $3, 0x0($6)
/* 056E00 00156D00 0000A527 */  addiu       $5, $29, 0x0
/* 056E04 00156D04 0000C378 */  lq          $3, 0x0($6)
/* 056E08 00156D08 0000A37C */  sq          $3, 0x0($5)
/* 056E0C 00156D0C 0000C378 */  lq          $3, 0x0($6)
/* 056E10 00156D10 2000837C */  sq          $3, 0x20($4)
/* 056E14 00156D14 2000BD27 */  addiu       $29, $29, 0x20
/* 056E18 00156D18 0800E003 */  jr          $31
/* 056E1C 00156D1C 00000000 */   nop
