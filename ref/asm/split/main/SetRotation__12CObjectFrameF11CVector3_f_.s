.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRotation__12CObjectFrameF11CVector3_f_
/* 057B40 00157A40 E0FFBD27 */  addiu       $29, $29, -0x20
/* 057B44 00157A44 1000A627 */  addiu       $6, $29, 0x10
/* 057B48 00157A48 0000A378 */  lq          $3, 0x0($5)
/* 057B4C 00157A4C 0000C37C */  sq          $3, 0x0($6)
/* 057B50 00157A50 0000A527 */  addiu       $5, $29, 0x0
/* 057B54 00157A54 0000C378 */  lq          $3, 0x0($6)
/* 057B58 00157A58 0000A37C */  sq          $3, 0x0($5)
/* 057B5C 00157A5C 0000C378 */  lq          $3, 0x0($6)
/* 057B60 00157A60 6000837C */  sq          $3, 0x60($4)
/* 057B64 00157A64 01000324 */  addiu       $3, $0, 0x1
/* 057B68 00157A68 C00083AC */  sw          $3, 0xC0($4)
/* 057B6C 00157A6C 2000BD27 */  addiu       $29, $29, 0x20
/* 057B70 00157A70 0800E003 */  jr          $31
/* 057B74 00157A74 00000000 */   nop
/* 057B78 00157A78 00000000 */  nop
/* 057B7C 00157A7C 00000000 */  nop
