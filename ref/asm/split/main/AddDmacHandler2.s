.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel AddDmacHandler2
/* 014140 00114040 12000324 */  addiu       $3, $0, 0x12
/* 014144 00114044 0C000000 */  syscall     0 /* handwritten instruction */
/* 014148 00114048 0800E003 */  jr          $31
/* 01414C 0011404C 00000000 */   nop
