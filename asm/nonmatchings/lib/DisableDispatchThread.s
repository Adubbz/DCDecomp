.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DisableDispatchThread
/* 14290 00114190 27000324 */  addiu      $3, $0, 0x27
/* 14294 00114194 0C000000 */  syscall    0
/* 14298 00114198 0800E003 */  jr         $31
/* 1429C 0011419C 00000000 */   nop
