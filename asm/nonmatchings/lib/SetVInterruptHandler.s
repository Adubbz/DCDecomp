.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetVInterruptHandler
/* 140F0 00113FF0 0F000324 */  addiu      $3, $0, 0xF
/* 140F4 00113FF4 0C000000 */  syscall    0
/* 140F8 00113FF8 0800E003 */  jr         $31
/* 140FC 00113FFC 00000000 */   nop
