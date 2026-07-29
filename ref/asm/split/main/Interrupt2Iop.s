.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel Interrupt2Iop
/* 0140C0 00113FC0 0C000324 */  addiu       $3, $0, 0xC
/* 0140C4 00113FC4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0140C8 00113FC8 0800E003 */  jr          $31
/* 0140CC 00113FCC 00000000 */   nop
