.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SetGsHParam
/* 014500 00114400 4E000324 */  addiu       $3, $0, 0x4E
/* 014504 00114404 0C000000 */  syscall     0 /* handwritten instruction */
/* 014508 00114408 0800E003 */  jr          $31
/* 01450C 0011440C 00000000 */   nop
