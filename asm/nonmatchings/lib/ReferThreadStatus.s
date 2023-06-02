.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ReferThreadStatus
/* 14320 00114220 30000324 */  addiu      $3, $0, 0x30
/* 14324 00114224 0C000000 */  syscall    0
/* 14328 00114228 0800E003 */  jr         $31
/* 1432C 0011422C 00000000 */   nop
