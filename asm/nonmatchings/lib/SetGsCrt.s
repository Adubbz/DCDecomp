.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetGsCrt
/* 14020 00113F20 02000324 */  addiu      $3, $0, 0x2
/* 14024 00113F24 0C000000 */  syscall    0
/* 14028 00113F28 0800E003 */  jr         $31
/* 1402C 00113F2C 00000000 */   nop
