.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel DeleteSema
/* 014430 00114330 41000324 */  addiu       $3, $0, 0x41
/* 014434 00114334 0C000000 */  syscall     0 /* handwritten instruction */
/* 014438 00114338 0800E003 */  jr          $31
/* 01443C 0011433C 00000000 */   nop
