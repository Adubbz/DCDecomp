.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iFlushCache
/* 0146D0 001145D0 98FF0324 */  addiu       $3, $0, -0x68
/* 0146D4 001145D4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0146D8 001145D8 0800E003 */  jr          $31
/* 0146DC 001145DC 00000000 */   nop
