.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GsPutIMR
/* 14760 00114660 71000324 */  addiu      $3, $0, 0x71
/* 14764 00114664 0C000000 */  syscall    0
/* 14768 00114668 0800E003 */  jr         $31
/* 1476C 0011466C 00000000 */   nop
