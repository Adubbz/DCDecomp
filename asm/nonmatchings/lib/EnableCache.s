.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EnableCache
/* 14670 00114570 61000324 */  addiu      $3, $0, 0x61
/* 14674 00114574 0C000000 */  syscall    0
/* 14678 00114578 0800E003 */  jr         $31
/* 1467C 0011457C 00000000 */   nop
