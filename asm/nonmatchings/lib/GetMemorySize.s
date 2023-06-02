.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMemorySize
/* 14880 00114780 7F000324 */  addiu      $3, $0, 0x7F
/* 14884 00114784 0C000000 */  syscall    0
/* 14888 00114788 0800E003 */  jr         $31
/* 1488C 0011478C 00000000 */   nop
