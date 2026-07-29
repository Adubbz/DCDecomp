.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RotateThreadReadyQueue
/* 0142D0 001141D0 2B000324 */  addiu       $3, $0, 0x2B
/* 0142D4 001141D4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0142D8 001141D8 0800E003 */  jr          $31
/* 0142DC 001141DC 00000000 */   nop
