.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU000_FullReset
/* 14000 00113F00 00000324 */  addiu      $3, $0, 0x0
/* 14004 00113F04 0C000000 */  syscall    0
/* 14008 00113F08 0800E003 */  jr         $31
/* 1400C 00113F0C 00000000 */   nop
