.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PrintMemory__Fv
/* 8A520 0018A420 0800E003 */  jr         $31
/* 8A524 0018A424 00000000 */   nop
/* 8A528 0018A428 00000000 */  nop
/* 8A52C 0018A42C 00000000 */  nop
