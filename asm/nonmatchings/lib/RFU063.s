.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU063
/* 14410 00114310 3F000324 */  addiu      $3, $0, 0x3F
/* 14414 00114314 0C000000 */  syscall    0
/* 14418 00114318 0800E003 */  jr         $31
/* 1441C 0011431C 00000000 */   nop
