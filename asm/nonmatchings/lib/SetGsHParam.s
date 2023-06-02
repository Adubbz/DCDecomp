.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetGsHParam
/* 14500 00114400 4E000324 */  addiu      $3, $0, 0x4E
/* 14504 00114404 0C000000 */  syscall    0
/* 14508 00114408 0800E003 */  jr         $31
/* 1450C 0011440C 00000000 */   nop
