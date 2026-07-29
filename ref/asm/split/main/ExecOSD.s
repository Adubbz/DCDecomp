.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel ExecOSD
/* 014840 00114740 7B000324 */  addiu       $3, $0, 0x7B
/* 014844 00114744 0C000000 */  syscall     0 /* handwritten instruction */
/* 014848 00114748 0800E003 */  jr          $31
/* 01484C 0011474C 00000000 */   nop
