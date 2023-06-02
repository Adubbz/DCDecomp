.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EnableIntcHandler
/* 145E0 001144E0 5C000324 */  addiu      $3, $0, 0x5C
/* 145E4 001144E4 0C000000 */  syscall    0
/* 145E8 001144E8 0800E003 */  jr         $31
/* 145EC 001144EC 00000000 */   nop
