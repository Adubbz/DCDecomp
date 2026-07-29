.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel CpuConfig
/* 0146B0 001145B0 66000324 */  addiu       $3, $0, 0x66
/* 0146B4 001145B4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0146B8 001145B8 0800E003 */  jr          $31
/* 0146BC 001145BC 00000000 */   nop
