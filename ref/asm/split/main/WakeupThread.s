.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel WakeupThread
/* 014350 00114250 33000324 */  addiu       $3, $0, 0x33
/* 014354 00114254 0C000000 */  syscall     0 /* handwritten instruction */
/* 014358 00114258 0800E003 */  jr          $31
/* 01435C 0011425C 00000000 */   nop
