.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iGsGetIMR
/* 14750 00114650 90FF0324 */  addiu      $3, $0, -0x70
/* 14754 00114654 0C000000 */  syscall    0
/* 14758 00114658 0800E003 */  jr         $31
/* 1475C 0011465C 00000000 */   nop
