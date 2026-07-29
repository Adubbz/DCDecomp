.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU116
/* 0147A0 001146A0 74000324 */  addiu       $3, $0, 0x74
/* 0147A4 001146A4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0147A8 001146A8 0800E003 */  jr          $31
/* 0147AC 001146AC 00000000 */   nop
