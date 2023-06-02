.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetVCommonHandler
/* 140E0 00113FE0 0E000324 */  addiu      $3, $0, 0xE
/* 140E4 00113FE4 0C000000 */  syscall    0
/* 140E8 00113FE8 0800E003 */  jr         $31
/* 140EC 00113FEC 00000000 */   nop
