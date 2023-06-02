.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddIntcHandler
/* 14100 00114000 10000324 */  addiu      $3, $0, 0x10
/* 14104 00114004 0C000000 */  syscall    0
/* 14108 00114008 0800E003 */  jr         $31
/* 1410C 0011400C 00000000 */   nop
