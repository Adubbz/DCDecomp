.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifSetReg
/* 14820 00114720 79000324 */  addiu      $3, $0, 0x79
/* 14824 00114724 0C000000 */  syscall    0
/* 14828 00114728 0800E003 */  jr         $31
/* 1482C 0011472C 00000000 */   nop
