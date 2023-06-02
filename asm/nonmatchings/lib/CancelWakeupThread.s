.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CancelWakeupThread
/* 14370 00114270 35000324 */  addiu      $3, $0, 0x35
/* 14374 00114274 0C000000 */  syscall    0
/* 14378 00114278 0800E003 */  jr         $31
/* 1437C 0011427C 00000000 */   nop
