.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel GetCop0
/* 014690 00114590 63000324 */  addiu       $3, $0, 0x63
/* 014694 00114594 0C000000 */  syscall     0 /* handwritten instruction */
/* 014698 00114598 0800E003 */  jr          $31
/* 01469C 0011459C 00000000 */   nop
