.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRotVelocity__7CObjectF11CVector3_f_
/* 056F20 00156E20 E0FFBD27 */  addiu       $29, $29, -0x20
/* 056F24 00156E24 1000A627 */  addiu       $6, $29, 0x10
/* 056F28 00156E28 0000A378 */  lq          $3, 0x0($5)
/* 056F2C 00156E2C 0000C37C */  sq          $3, 0x0($6)
/* 056F30 00156E30 0000A527 */  addiu       $5, $29, 0x0
/* 056F34 00156E34 0000C378 */  lq          $3, 0x0($6)
/* 056F38 00156E38 0000A37C */  sq          $3, 0x0($5)
/* 056F3C 00156E3C 0000C378 */  lq          $3, 0x0($6)
/* 056F40 00156E40 7000837C */  sq          $3, 0x70($4)
/* 056F44 00156E44 2000BD27 */  addiu       $29, $29, 0x20
/* 056F48 00156E48 0800E003 */  jr          $31
/* 056F4C 00156E4C 00000000 */   nop
