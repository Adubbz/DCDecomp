.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EndOfHeap
/* 14400 00114300 3E000324 */  addiu      $3, $0, 0x3E
/* 14404 00114304 0C000000 */  syscall    0
/* 14408 00114308 0800E003 */  jr         $31
/* 1440C 0011430C 00000000 */   nop
