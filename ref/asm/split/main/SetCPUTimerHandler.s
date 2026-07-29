.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SetCPUTimerHandler
/* 014700 00114600 6C000324 */  addiu       $3, $0, 0x6C
/* 014704 00114604 0C000000 */  syscall     0 /* handwritten instruction */
/* 014708 00114608 0800E003 */  jr          $31
/* 01470C 0011460C 00000000 */   nop
