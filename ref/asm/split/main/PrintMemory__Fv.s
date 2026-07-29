.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel PrintMemory__Fv
/* 08A520 0018A420 0800E003 */  jr          $31
/* 08A524 0018A424 00000000 */   nop
/* 08A528 0018A428 00000000 */  nop
/* 08A52C 0018A42C 00000000 */  nop
