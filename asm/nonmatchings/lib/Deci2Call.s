.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Deci2Call
/* 14850 00114750 7C000324 */  addiu      $3, $0, 0x7C
/* 14854 00114754 0C000000 */  syscall    0
/* 14858 00114758 0800E003 */  jr         $31
/* 1485C 0011475C 00000000 */   nop
