.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU005
/* 14050 00113F50 05000324 */  addiu      $3, $0, 0x5
/* 14054 00113F54 0C000000 */  syscall    0
/* 14058 00113F58 0800E003 */  jr         $31
/* 1405C 00113F5C 00000000 */   nop
