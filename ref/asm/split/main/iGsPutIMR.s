.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iGsPutIMR
/* 014770 00114670 8FFF0324 */  addiu       $3, $0, -0x71
/* 014774 00114674 0C000000 */  syscall     0 /* handwritten instruction */
/* 014778 00114678 0800E003 */  jr          $31
/* 01477C 0011467C 00000000 */   nop
