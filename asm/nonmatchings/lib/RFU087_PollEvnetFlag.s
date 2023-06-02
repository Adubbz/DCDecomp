.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU087_PollEvnetFlag
/* 14590 00114490 57000324 */  addiu      $3, $0, 0x57
/* 14594 00114494 0C000000 */  syscall    0
/* 14598 00114498 0800E003 */  jr         $31
/* 1459C 0011449C 00000000 */   nop
