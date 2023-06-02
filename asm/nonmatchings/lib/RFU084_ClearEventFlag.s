.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU084_ClearEventFlag
/* 14560 00114460 54000324 */  addiu      $3, $0, 0x54
/* 14564 00114464 0C000000 */  syscall    0
/* 14568 00114468 0800E003 */  jr         $31
/* 1456C 0011446C 00000000 */   nop
