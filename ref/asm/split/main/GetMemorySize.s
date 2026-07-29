.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel GetMemorySize
/* 014880 00114780 7F000324 */  addiu       $3, $0, 0x7F
/* 014884 00114784 0C000000 */  syscall     0 /* handwritten instruction */
/* 014888 00114788 0800E003 */  jr          $31
/* 01488C 0011478C 00000000 */   nop
