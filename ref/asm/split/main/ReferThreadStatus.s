.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel ReferThreadStatus
/* 014320 00114220 30000324 */  addiu       $3, $0, 0x30
/* 014324 00114224 0C000000 */  syscall     0 /* handwritten instruction */
/* 014328 00114228 0800E003 */  jr          $31
/* 01432C 0011422C 00000000 */   nop
