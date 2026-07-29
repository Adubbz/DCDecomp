.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sceSifStopDma
/* 0146F0 001145F0 6B000324 */  addiu       $3, $0, 0x6B
/* 0146F4 001145F4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0146F8 001145F8 0800E003 */  jr          $31
/* 0146FC 001145FC 00000000 */   nop
