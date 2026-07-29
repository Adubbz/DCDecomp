.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel EndOfHeap
/* 014400 00114300 3E000324 */  addiu       $3, $0, 0x3E
/* 014404 00114304 0C000000 */  syscall     0 /* handwritten instruction */
/* 014408 00114308 0800E003 */  jr          $31
/* 01440C 0011430C 00000000 */   nop
