.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StartThread
/* 14240 00114140 22000324 */  addiu      $3, $0, 0x22
/* 14244 00114144 0C000000 */  syscall    0
/* 14248 00114148 0800E003 */  jr         $31
/* 1424C 0011414C 00000000 */   nop
