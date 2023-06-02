.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Exit
/* 14040 00113F40 04000324 */  addiu      $3, $0, 0x4
/* 14044 00113F44 0C000000 */  syscall    0
/* 14048 00113F48 0800E003 */  jr         $31
/* 1404C 00113F4C 00000000 */   nop
