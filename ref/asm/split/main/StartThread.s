.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel StartThread
/* 014240 00114140 22000324 */  addiu       $3, $0, 0x22
/* 014244 00114144 0C000000 */  syscall     0 /* handwritten instruction */
/* 014248 00114148 0800E003 */  jr          $31
/* 01424C 0011414C 00000000 */   nop
