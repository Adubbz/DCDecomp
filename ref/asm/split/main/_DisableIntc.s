.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _DisableIntc
/* 014170 00114070 15000324 */  addiu       $3, $0, 0x15
/* 014174 00114074 0C000000 */  syscall     0 /* handwritten instruction */
/* 014178 00114078 0800E003 */  jr          $31
/* 01417C 0011407C 00000000 */   nop
