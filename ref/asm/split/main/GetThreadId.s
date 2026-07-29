.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel GetThreadId
/* 014310 00114210 2F000324 */  addiu       $3, $0, 0x2F
/* 014314 00114214 0C000000 */  syscall     0 /* handwritten instruction */
/* 014318 00114218 0800E003 */  jr          $31
/* 01431C 0011421C 00000000 */   nop
