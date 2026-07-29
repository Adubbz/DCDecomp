.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel CreateThread
/* 014220 00114120 20000324 */  addiu       $3, $0, 0x20
/* 014224 00114124 0C000000 */  syscall     0 /* handwritten instruction */
/* 014228 00114128 0800E003 */  jr          $31
/* 01422C 0011412C 00000000 */   nop
