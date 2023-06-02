.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SignalSema
/* 14440 00114340 42000324 */  addiu      $3, $0, 0x42
/* 14444 00114344 0C000000 */  syscall    0
/* 14448 00114348 0800E003 */  jr         $31
/* 1444C 0011434C 00000000 */   nop
