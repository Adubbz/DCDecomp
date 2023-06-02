.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MachineType
/* 14870 00114770 7E000324 */  addiu      $3, $0, 0x7E
/* 14874 00114774 0C000000 */  syscall    0
/* 14878 00114778 0800E003 */  jr         $31
/* 1487C 0011477C 00000000 */   nop
