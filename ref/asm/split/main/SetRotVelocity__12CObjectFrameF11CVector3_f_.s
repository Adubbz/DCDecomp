.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRotVelocity__12CObjectFrameF11CVector3_f_
/* 057B80 00157A80 E0FFBD27 */  addiu       $29, $29, -0x20
/* 057B84 00157A84 1000A627 */  addiu       $6, $29, 0x10
/* 057B88 00157A88 0000A378 */  lq          $3, 0x0($5)
/* 057B8C 00157A8C 0000C37C */  sq          $3, 0x0($6)
/* 057B90 00157A90 0000A527 */  addiu       $5, $29, 0x0
/* 057B94 00157A94 0000C378 */  lq          $3, 0x0($6)
/* 057B98 00157A98 0000A37C */  sq          $3, 0x0($5)
/* 057B9C 00157A9C 0000C378 */  lq          $3, 0x0($6)
/* 057BA0 00157AA0 7000837C */  sq          $3, 0x70($4)
/* 057BA4 00157AA4 01000324 */  addiu       $3, $0, 0x1
/* 057BA8 00157AA8 C00083AC */  sw          $3, 0xC0($4)
/* 057BAC 00157AAC 2000BD27 */  addiu       $29, $29, 0x20
/* 057BB0 00157AB0 0800E003 */  jr          $31
/* 057BB4 00157AB4 00000000 */   nop
/* 057BB8 00157AB8 00000000 */  nop
/* 057BBC 00157ABC 00000000 */  nop
