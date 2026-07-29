.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RemoveIntcHandler
/* 014120 00114020 11000324 */  addiu       $3, $0, 0x11
/* 014124 00114024 0C000000 */  syscall     0 /* handwritten instruction */
/* 014128 00114028 0800E003 */  jr          $31
/* 01412C 0011402C 00000000 */   nop
