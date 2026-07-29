.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU000_FullReset
/* 014000 00113F00 00000324 */  addiu       $3, $0, 0x0
/* 014004 00113F04 0C000000 */  syscall     0 /* handwritten instruction */
/* 014008 00113F08 0800E003 */  jr          $31
/* 01400C 00113F0C 00000000 */   nop
