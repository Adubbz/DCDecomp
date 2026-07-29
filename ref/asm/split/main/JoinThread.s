.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel JoinThread
/* 0143D0 001142D0 3B000324 */  addiu       $3, $0, 0x3B
/* 0143D4 001142D4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0143D8 001142D8 0800E003 */  jr          $31
/* 0143DC 001142DC 00000000 */   nop
