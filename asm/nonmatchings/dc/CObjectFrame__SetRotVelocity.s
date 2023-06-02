.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotVelocity__12CObjectFrameF11CVector3_f_
/* 57B80 00157A80 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 57B84 00157A84 1000A627 */  addiu      $6, $sp, 0x10
/* 57B88 00157A88 0000A378 */  lq         $3, 0x0($5)
/* 57B8C 00157A8C 0000C37C */  sq         $3, 0x0($6)
/* 57B90 00157A90 0000A527 */  addiu      $5, $sp, 0x0
/* 57B94 00157A94 0000C378 */  lq         $3, 0x0($6)
/* 57B98 00157A98 0000A37C */  sq         $3, 0x0($5)
/* 57B9C 00157A9C 0000C378 */  lq         $3, 0x0($6)
/* 57BA0 00157AA0 7000837C */  sq         $3, 0x70($4)
/* 57BA4 00157AA4 01000324 */  addiu      $3, $0, 0x1
/* 57BA8 00157AA8 C00083AC */  sw         $3, 0xC0($4)
/* 57BAC 00157AAC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 57BB0 00157AB0 0800E003 */  jr         $31
/* 57BB4 00157AB4 00000000 */   nop
/* 57BB8 00157AB8 00000000 */  nop
/* 57BBC 00157ABC 00000000 */  nop
