.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ReferSemaStatus
/* 14490 00114390 47000324 */  addiu      $3, $0, 0x47
/* 14494 00114394 0C000000 */  syscall    0
/* 14498 00114398 0800E003 */  jr         $31
/* 1449C 0011439C 00000000 */   nop
