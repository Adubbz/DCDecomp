.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel EnableCache
/* 014670 00114570 61000324 */  addiu       $3, $0, 0x61
/* 014674 00114574 0C000000 */  syscall     0 /* handwritten instruction */
/* 014678 00114578 0800E003 */  jr          $31
/* 01467C 0011457C 00000000 */   nop
