.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _EnableIntc
/* 014160 00114060 14000324 */  addiu       $3, $0, 0x14
/* 014164 00114064 0C000000 */  syscall     0 /* handwritten instruction */
/* 014168 00114068 0800E003 */  jr          $31
/* 01416C 0011406C 00000000 */   nop
