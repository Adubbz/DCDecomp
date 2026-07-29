.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iChangeThreadPriority
/* 0142C0 001141C0 D6FF0324 */  addiu       $3, $0, -0x2A
/* 0142C4 001141C4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0142C8 001141C8 0800E003 */  jr          $31
/* 0142CC 001141CC 00000000 */   nop
