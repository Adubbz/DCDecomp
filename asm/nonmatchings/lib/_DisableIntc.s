.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DisableIntc
/* 14170 00114070 15000324 */  addiu      $3, $0, 0x15
/* 14174 00114074 0C000000 */  syscall    0
/* 14178 00114078 0800E003 */  jr         $31
/* 1417C 0011407C 00000000 */   nop
