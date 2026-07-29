.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sceSifGetReg
/* 014830 00114730 7A000324 */  addiu       $3, $0, 0x7A
/* 014834 00114734 0C000000 */  syscall     0 /* handwritten instruction */
/* 014838 00114738 0800E003 */  jr          $31
/* 01483C 0011473C 00000000 */   nop
