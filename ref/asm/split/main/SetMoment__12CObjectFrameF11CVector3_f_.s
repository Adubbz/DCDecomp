.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetMoment__12CObjectFrameF11CVector3_f_
/* 057AE0 001579E0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 057AE4 001579E4 1000A627 */  addiu       $6, $29, 0x10
/* 057AE8 001579E8 0000A378 */  lq          $3, 0x0($5)
/* 057AEC 001579EC 0000C37C */  sq          $3, 0x0($6)
/* 057AF0 001579F0 0000A527 */  addiu       $5, $29, 0x0
/* 057AF4 001579F4 0000C378 */  lq          $3, 0x0($6)
/* 057AF8 001579F8 0000A37C */  sq          $3, 0x0($5)
/* 057AFC 001579FC 0000C378 */  lq          $3, 0x0($6)
/* 057B00 00157A00 5000837C */  sq          $3, 0x50($4)
/* 057B04 00157A04 01000324 */  addiu       $3, $0, 0x1
/* 057B08 00157A08 C00083AC */  sw          $3, 0xC0($4)
/* 057B0C 00157A0C 2000BD27 */  addiu       $29, $29, 0x20
/* 057B10 00157A10 0800E003 */  jr          $31
/* 057B14 00157A14 00000000 */   nop
/* 057B18 00157A18 00000000 */  nop
/* 057B1C 00157A1C 00000000 */  nop
