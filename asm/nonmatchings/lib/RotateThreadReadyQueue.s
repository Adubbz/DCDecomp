.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RotateThreadReadyQueue
/* 142D0 001141D0 2B000324 */  addiu      $3, $0, 0x2B
/* 142D4 001141D4 0C000000 */  syscall    0
/* 142D8 001141D8 0800E003 */  jr         $31
/* 142DC 001141DC 00000000 */   nop
