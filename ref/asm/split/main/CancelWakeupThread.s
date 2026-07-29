.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel CancelWakeupThread
/* 014370 00114270 35000324 */  addiu       $3, $0, 0x35
/* 014374 00114274 0C000000 */  syscall     0 /* handwritten instruction */
/* 014378 00114278 0800E003 */  jr          $31
/* 01437C 0011427C 00000000 */   nop
