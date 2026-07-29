.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel MachineType
/* 014870 00114770 7E000324 */  addiu       $3, $0, 0x7E
/* 014874 00114774 0C000000 */  syscall     0 /* handwritten instruction */
/* 014878 00114778 0800E003 */  jr          $31
/* 01487C 0011477C 00000000 */   nop
