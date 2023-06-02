.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RemoveIntcHandler
/* 14120 00114020 11000324 */  addiu      $3, $0, 0x11
/* 14124 00114024 0C000000 */  syscall    0
/* 14128 00114028 0800E003 */  jr         $31
/* 1412C 0011402C 00000000 */   nop
