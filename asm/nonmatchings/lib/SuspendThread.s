.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SuspendThread
/* 14390 00114290 37000324 */  addiu      $3, $0, 0x37
/* 14394 00114294 0C000000 */  syscall    0
/* 14398 00114298 0800E003 */  jr         $31
/* 1439C 0011429C 00000000 */   nop
