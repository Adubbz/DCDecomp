.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel FlushCache
/* 0146A0 001145A0 64000324 */  addiu       $3, $0, 0x64
/* 0146A4 001145A4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0146A8 001145A8 0800E003 */  jr          $31
/* 0146AC 001145AC 00000000 */   nop
