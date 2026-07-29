.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iGetCop0
/* 0146C0 001145C0 99FF0324 */  addiu       $3, $0, -0x67
/* 0146C4 001145C4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0146C8 001145C8 0800E003 */  jr          $31
/* 0146CC 001145CC 00000000 */   nop
