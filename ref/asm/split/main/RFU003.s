.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU003
/* 014030 00113F30 03000324 */  addiu       $3, $0, 0x3
/* 014034 00113F34 0C000000 */  syscall     0 /* handwritten instruction */
/* 014038 00113F38 0800E003 */  jr          $31
/* 01403C 00113F3C 00000000 */   nop
