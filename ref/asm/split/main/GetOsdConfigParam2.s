.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel GetOsdConfigParam2
/* 014730 00114630 6F000324 */  addiu       $3, $0, 0x6F
/* 014734 00114634 0C000000 */  syscall     0 /* handwritten instruction */
/* 014738 00114638 0800E003 */  jr          $31
/* 01473C 0011463C 00000000 */   nop
