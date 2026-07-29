.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU061
/* 0143F0 001142F0 3D000324 */  addiu       $3, $0, 0x3D
/* 0143F4 001142F4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0143F8 001142F8 0800E003 */  jr          $31
/* 0143FC 001142FC 00000000 */   nop
