.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU091
/* 145D0 001144D0 5B000324 */  addiu      $3, $0, 0x5B
/* 145D4 001144D4 0C000000 */  syscall    0
/* 145D8 001144D8 0800E003 */  jr         $31
/* 145DC 001144DC 00000000 */   nop
