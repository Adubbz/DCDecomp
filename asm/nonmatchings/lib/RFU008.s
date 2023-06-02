.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU008
/* 14080 00113F80 08000324 */  addiu      $3, $0, 0x8
/* 14084 00113F84 0C000000 */  syscall    0
/* 14088 00113F88 0800E003 */  jr         $31
/* 1408C 00113F8C 00000000 */   nop
