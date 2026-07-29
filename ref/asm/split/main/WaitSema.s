.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel WaitSema
/* 014460 00114360 44000324 */  addiu       $3, $0, 0x44
/* 014464 00114364 0C000000 */  syscall     0 /* handwritten instruction */
/* 014468 00114368 0800E003 */  jr          $31
/* 01446C 0011436C 00000000 */   nop
