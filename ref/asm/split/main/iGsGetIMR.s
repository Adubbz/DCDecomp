.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iGsGetIMR
/* 014750 00114650 90FF0324 */  addiu       $3, $0, -0x70
/* 014754 00114654 0C000000 */  syscall     0 /* handwritten instruction */
/* 014758 00114658 0800E003 */  jr          $31
/* 01475C 0011465C 00000000 */   nop
