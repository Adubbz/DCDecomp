.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU086_WaitEvnetFlag
/* 014580 00114480 56000324 */  addiu       $3, $0, 0x56
/* 014584 00114484 0C000000 */  syscall     0 /* handwritten instruction */
/* 014588 00114488 0800E003 */  jr          $31
/* 01458C 0011448C 00000000 */   nop
