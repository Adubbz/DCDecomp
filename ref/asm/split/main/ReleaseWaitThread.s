.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel ReleaseWaitThread
/* 0142F0 001141F0 2D000324 */  addiu       $3, $0, 0x2D
/* 0142F4 001141F4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0142F8 001141F8 0800E003 */  jr          $31
/* 0142FC 001141FC 00000000 */   nop
