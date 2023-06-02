.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU082_SetEventFlag
/* 14540 00114440 52000324 */  addiu      $3, $0, 0x52
/* 14544 00114444 0C000000 */  syscall    0
/* 14548 00114448 0800E003 */  jr         $31
/* 1454C 0011444C 00000000 */   nop
