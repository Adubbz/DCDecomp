.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _iRotateThreadReadyQueue
/* 0142E0 001141E0 D4FF0324 */  addiu       $3, $0, -0x2C
/* 0142E4 001141E4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0142E8 001141E8 0800E003 */  jr          $31
/* 0142EC 001141EC 00000000 */   nop
