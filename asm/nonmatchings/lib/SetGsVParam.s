.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetGsVParam
/* 14510 00114410 4F000324 */  addiu      $3, $0, 0x4F
/* 14514 00114414 0C000000 */  syscall    0
/* 14518 00114418 0800E003 */  jr         $31
/* 1451C 0011441C 00000000 */   nop
