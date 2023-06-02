.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotation__7CObjectFfff
/* 56EE0 00156DE0 60008CE4 */  swc1       $f12, 0x60($4)
/* 56EE4 00156DE4 64008DE4 */  swc1       $f13, 0x64($4)
/* 56EE8 00156DE8 68008EE4 */  swc1       $f14, 0x68($4)
/* 56EEC 00156DEC 0800E003 */  jr         $31
/* 56EF0 00156DF0 00000000 */   nop
/* 56EF4 00156DF4 00000000 */  nop
/* 56EF8 00156DF8 00000000 */  nop
/* 56EFC 00156DFC 00000000 */  nop
