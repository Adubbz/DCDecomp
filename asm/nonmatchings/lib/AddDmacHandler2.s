.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddDmacHandler2
/* 14140 00114040 12000324 */  addiu      $3, $0, 0x12
/* 14144 00114044 0C000000 */  syscall    0
/* 14148 00114048 0800E003 */  jr         $31
/* 1414C 0011404C 00000000 */   nop
