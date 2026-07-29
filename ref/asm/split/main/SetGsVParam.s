.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SetGsVParam
/* 014510 00114410 4F000324 */  addiu       $3, $0, 0x4F
/* 014514 00114414 0C000000 */  syscall     0 /* handwritten instruction */
/* 014518 00114418 0800E003 */  jr          $31
/* 01451C 0011441C 00000000 */   nop
