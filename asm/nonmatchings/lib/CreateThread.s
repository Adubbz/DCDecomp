.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CreateThread
/* 14220 00114120 20000324 */  addiu      $3, $0, 0x20
/* 14224 00114124 0C000000 */  syscall    0
/* 14228 00114128 0800E003 */  jr         $31
/* 1422C 0011412C 00000000 */   nop
