.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMoment__12CObjectFrameF11CVector3_f_
/* 57AE0 001579E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 57AE4 001579E4 1000A627 */  addiu      $6, $sp, 0x10
/* 57AE8 001579E8 0000A378 */  lq         $3, 0x0($5)
/* 57AEC 001579EC 0000C37C */  sq         $3, 0x0($6)
/* 57AF0 001579F0 0000A527 */  addiu      $5, $sp, 0x0
/* 57AF4 001579F4 0000C378 */  lq         $3, 0x0($6)
/* 57AF8 001579F8 0000A37C */  sq         $3, 0x0($5)
/* 57AFC 001579FC 0000C378 */  lq         $3, 0x0($6)
/* 57B00 00157A00 5000837C */  sq         $3, 0x50($4)
/* 57B04 00157A04 01000324 */  addiu      $3, $0, 0x1
/* 57B08 00157A08 C00083AC */  sw         $3, 0xC0($4)
/* 57B0C 00157A0C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 57B10 00157A10 0800E003 */  jr         $31
/* 57B14 00157A14 00000000 */   nop
/* 57B18 00157A18 00000000 */  nop
/* 57B1C 00157A1C 00000000 */  nop
