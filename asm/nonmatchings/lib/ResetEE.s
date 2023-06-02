.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ResetEE
/* 14010 00113F10 01000324 */  addiu      $3, $0, 0x1
/* 14014 00113F14 0C000000 */  syscall    0
/* 14018 00113F18 0800E003 */  jr         $31
/* 1401C 00113F1C 00000000 */   nop
