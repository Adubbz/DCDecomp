.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel ChangeThreadPriority
/* 0142B0 001141B0 29000324 */  addiu       $3, $0, 0x29
/* 0142B4 001141B4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0142B8 001141B8 0800E003 */  jr          $31
/* 0142BC 001141BC 00000000 */   nop
