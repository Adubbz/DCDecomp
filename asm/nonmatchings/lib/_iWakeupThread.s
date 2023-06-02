.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _iWakeupThread
/* 14360 00114260 CCFF0324 */  addiu      $3, $0, -0x34
/* 14364 00114264 0C000000 */  syscall    0
/* 14368 00114268 0800E003 */  jr         $31
/* 1436C 0011426C 00000000 */   nop
