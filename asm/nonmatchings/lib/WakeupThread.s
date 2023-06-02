.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WakeupThread
/* 14350 00114250 33000324 */  addiu      $3, $0, 0x33
/* 14354 00114254 0C000000 */  syscall    0
/* 14358 00114258 0800E003 */  jr         $31
/* 1435C 0011425C 00000000 */   nop
