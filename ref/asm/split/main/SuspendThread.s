.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SuspendThread
/* 014390 00114290 37000324 */  addiu       $3, $0, 0x37
/* 014394 00114294 0C000000 */  syscall     0 /* handwritten instruction */
/* 014398 00114298 0800E003 */  jr          $31
/* 01439C 0011429C 00000000 */   nop
