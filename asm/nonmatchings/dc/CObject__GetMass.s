.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMass__7CObjectFv
/* 56F80 00156E80 000080C4 */  lwc1       $f0, 0x0($4)
/* 56F84 00156E84 0800E003 */  jr         $31
/* 56F88 00156E88 00000000 */   nop
/* 56F8C 00156E8C 00000000 */  nop
