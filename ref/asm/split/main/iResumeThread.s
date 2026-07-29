.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iResumeThread
/* 0143C0 001142C0 C6FF0324 */  addiu       $3, $0, -0x3A
/* 0143C4 001142C4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0143C8 001142C8 0800E003 */  jr          $31
/* 0143CC 001142CC 00000000 */   nop
