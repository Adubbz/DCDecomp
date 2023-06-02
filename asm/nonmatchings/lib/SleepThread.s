.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SleepThread
/* 14340 00114240 32000324 */  addiu      $3, $0, 0x32
/* 14344 00114244 0C000000 */  syscall    0
/* 14348 00114248 0800E003 */  jr         $31
/* 1434C 0011424C 00000000 */   nop
