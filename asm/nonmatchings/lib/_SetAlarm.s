.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SetAlarm
/* 141A0 001140A0 18000324 */  addiu      $3, $0, 0x18
/* 141A4 001140A4 0C000000 */  syscall    0
/* 141A8 001140A8 0800E003 */  jr         $31
/* 141AC 001140AC 00000000 */   nop
