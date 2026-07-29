.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel CreateSema
/* 014420 00114320 40000324 */  addiu       $3, $0, 0x40
/* 014424 00114324 0C000000 */  syscall     0 /* handwritten instruction */
/* 014428 00114328 0800E003 */  jr          $31
/* 01442C 0011432C 00000000 */   nop
