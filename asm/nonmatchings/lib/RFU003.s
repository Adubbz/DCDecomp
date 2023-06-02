.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU003
/* 14030 00113F30 03000324 */  addiu      $3, $0, 0x3
/* 14034 00113F34 0C000000 */  syscall    0
/* 14038 00113F38 0800E003 */  jr         $31
/* 1403C 00113F3C 00000000 */   nop
