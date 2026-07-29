.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iEnableDmacHandler
/* 014630 00114530 A2FF0324 */  addiu       $3, $0, -0x5E
/* 014634 00114534 0C000000 */  syscall     0 /* handwritten instruction */
/* 014638 00114538 0800E003 */  jr          $31
/* 01463C 0011453C 00000000 */   nop
