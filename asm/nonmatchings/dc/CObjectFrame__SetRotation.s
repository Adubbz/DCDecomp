.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotation__12CObjectFrameFfff
/* 57B20 00157A20 60008CE4 */  swc1       $f12, 0x60($4)
/* 57B24 00157A24 64008DE4 */  swc1       $f13, 0x64($4)
/* 57B28 00157A28 68008EE4 */  swc1       $f14, 0x68($4)
/* 57B2C 00157A2C 01000324 */  addiu      $3, $0, 0x1
/* 57B30 00157A30 C00083AC */  sw         $3, 0xC0($4)
/* 57B34 00157A34 0800E003 */  jr         $31
/* 57B38 00157A38 00000000 */   nop
/* 57B3C 00157A3C 00000000 */  nop
