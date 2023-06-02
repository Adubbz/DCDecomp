.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetThreadId
/* 14310 00114210 2F000324 */  addiu      $3, $0, 0x2F
/* 14314 00114214 0C000000 */  syscall    0
/* 14318 00114218 0800E003 */  jr         $31
/* 1431C 0011421C 00000000 */   nop
