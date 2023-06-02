.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifGetReg
/* 14830 00114730 7A000324 */  addiu      $3, $0, 0x7A
/* 14834 00114734 0C000000 */  syscall    0
/* 14838 00114738 0800E003 */  jr         $31
/* 1483C 0011473C 00000000 */   nop
