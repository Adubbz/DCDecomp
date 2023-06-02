.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetCop0
/* 14690 00114590 63000324 */  addiu      $3, $0, 0x63
/* 14694 00114594 0C000000 */  syscall    0
/* 14698 00114598 0800E003 */  jr         $31
/* 1469C 0011459C 00000000 */   nop
