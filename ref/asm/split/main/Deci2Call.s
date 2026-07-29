.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel Deci2Call
/* 014850 00114750 7C000324 */  addiu       $3, $0, 0x7C
/* 014854 00114754 0C000000 */  syscall     0 /* handwritten instruction */
/* 014858 00114758 0800E003 */  jr          $31
/* 01485C 0011475C 00000000 */   nop
