.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetOsdConfigParam2
/* 14730 00114630 6F000324 */  addiu      $3, $0, 0x6F
/* 14734 00114634 0C000000 */  syscall    0
/* 14738 00114638 0800E003 */  jr         $31
/* 1473C 0011463C 00000000 */   nop
