.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel ResumeThread
/* 0143B0 001142B0 39000324 */  addiu       $3, $0, 0x39
/* 0143B4 001142B4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0143B8 001142B8 0800E003 */  jr          $31
/* 0143BC 001142BC 00000000 */   nop
