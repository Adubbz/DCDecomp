.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iCancelWakeupThread
/* 14380 00114280 CAFF0324 */  addiu      $3, $0, -0x36
/* 14384 00114284 0C000000 */  syscall    0
/* 14388 00114288 0800E003 */  jr         $31
/* 1438C 0011428C 00000000 */   nop
