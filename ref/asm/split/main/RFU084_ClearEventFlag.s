.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU084_ClearEventFlag
/* 014560 00114460 54000324 */  addiu       $3, $0, 0x54
/* 014564 00114464 0C000000 */  syscall     0 /* handwritten instruction */
/* 014568 00114468 0800E003 */  jr          $31
/* 01456C 0011446C 00000000 */   nop
