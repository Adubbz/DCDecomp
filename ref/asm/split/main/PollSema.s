.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel PollSema
/* 014470 00114370 45000324 */  addiu       $3, $0, 0x45
/* 014474 00114374 0C000000 */  syscall     0 /* handwritten instruction */
/* 014478 00114378 0800E003 */  jr          $31
/* 01447C 0011437C 00000000 */   nop
