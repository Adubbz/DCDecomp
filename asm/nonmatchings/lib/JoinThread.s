.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel JoinThread
/* 143D0 001142D0 3B000324 */  addiu      $3, $0, 0x3B
/* 143D4 001142D4 0C000000 */  syscall    0
/* 143D8 001142D8 0800E003 */  jr         $31
/* 143DC 001142DC 00000000 */   nop
