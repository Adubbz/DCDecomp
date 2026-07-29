.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRotAcceleration__7CObjectF11CVector3_f_
/* 056F50 00156E50 E0FFBD27 */  addiu       $29, $29, -0x20
/* 056F54 00156E54 1000A627 */  addiu       $6, $29, 0x10
/* 056F58 00156E58 0000A378 */  lq          $3, 0x0($5)
/* 056F5C 00156E5C 0000C37C */  sq          $3, 0x0($6)
/* 056F60 00156E60 0000A527 */  addiu       $5, $29, 0x0
/* 056F64 00156E64 0000C378 */  lq          $3, 0x0($6)
/* 056F68 00156E68 0000A37C */  sq          $3, 0x0($5)
/* 056F6C 00156E6C 0000C378 */  lq          $3, 0x0($6)
/* 056F70 00156E70 8000837C */  sq          $3, 0x80($4)
/* 056F74 00156E74 2000BD27 */  addiu       $29, $29, 0x20
/* 056F78 00156E78 0800E003 */  jr          $31
/* 056F7C 00156E7C 00000000 */   nop
