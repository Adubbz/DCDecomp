.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel KSeg0
/* 014660 00114560 60000324 */  addiu       $3, $0, 0x60
/* 014664 00114564 0C000000 */  syscall     0 /* handwritten instruction */
/* 014668 00114568 0800E003 */  jr          $31
/* 01466C 0011456C 00000000 */   nop
