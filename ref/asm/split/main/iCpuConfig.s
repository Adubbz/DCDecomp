.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iCpuConfig
/* 0146E0 001145E0 96FF0324 */  addiu       $3, $0, -0x6A
/* 0146E4 001145E4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0146E8 001145E8 0800E003 */  jr          $31
/* 0146EC 001145EC 00000000 */   nop
