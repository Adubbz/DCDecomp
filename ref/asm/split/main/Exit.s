.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel Exit
/* 014040 00113F40 04000324 */  addiu       $3, $0, 0x4
/* 014044 00113F44 0C000000 */  syscall     0 /* handwritten instruction */
/* 014048 00113F48 0800E003 */  jr          $31
/* 01404C 00113F4C 00000000 */   nop
