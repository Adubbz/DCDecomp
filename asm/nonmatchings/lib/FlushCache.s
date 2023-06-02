.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FlushCache
/* 146A0 001145A0 64000324 */  addiu      $3, $0, 0x64
/* 146A4 001145A4 0C000000 */  syscall    0
/* 146A8 001145A8 0800E003 */  jr         $31
/* 146AC 001145AC 00000000 */   nop
