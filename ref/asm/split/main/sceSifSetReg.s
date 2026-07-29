.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sceSifSetReg
/* 014820 00114720 79000324 */  addiu       $3, $0, 0x79
/* 014824 00114724 0C000000 */  syscall     0 /* handwritten instruction */
/* 014828 00114728 0800E003 */  jr          $31
/* 01482C 0011472C 00000000 */   nop
