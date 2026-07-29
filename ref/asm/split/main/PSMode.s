.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel PSMode
/* 014860 00114760 7D000324 */  addiu       $3, $0, 0x7D
/* 014864 00114764 0C000000 */  syscall     0 /* handwritten instruction */
/* 014868 00114768 0800E003 */  jr          $31
/* 01486C 0011476C 00000000 */   nop
