.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _iWakeupThread
/* 014360 00114260 CCFF0324 */  addiu       $3, $0, -0x34
/* 014364 00114264 0C000000 */  syscall     0 /* handwritten instruction */
/* 014368 00114268 0800E003 */  jr          $31
/* 01436C 0011426C 00000000 */   nop
