.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _EnableIntc
/* 14160 00114060 14000324 */  addiu      $3, $0, 0x14
/* 14164 00114064 0C000000 */  syscall    0
/* 14168 00114068 0800E003 */  jr         $31
/* 1416C 0011406C 00000000 */   nop
