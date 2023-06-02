.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetCPUTimerHandler
/* 14700 00114600 6C000324 */  addiu      $3, $0, 0x6C
/* 14704 00114604 0C000000 */  syscall    0
/* 14708 00114608 0800E003 */  jr         $31
/* 1470C 0011460C 00000000 */   nop
