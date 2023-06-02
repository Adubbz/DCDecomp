.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel fstat
/* 14B28 00114A28 00200224 */  addiu      $2, $0, 0x2000
/* 14B2C 00114A2C 4800A0FC */  sd         $0, 0x48($5)
/* 14B30 00114A30 0400A2AC */  sw         $2, 0x4($5)
/* 14B34 00114A34 0800E003 */  jr         $31
/* 14B38 00114A38 2D100000 */   daddu     $2, $0, $0
/* 14B3C 00114A3C 00000000 */  nop
