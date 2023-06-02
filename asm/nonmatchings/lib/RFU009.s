.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU009
/* 14090 00113F90 09000324 */  addiu      $3, $0, 0x9
/* 14094 00113F94 0C000000 */  syscall    0
/* 14098 00113F98 0800E003 */  jr         $31
/* 1409C 00113F9C 00000000 */   nop
