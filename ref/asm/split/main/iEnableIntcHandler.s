.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iEnableIntcHandler
/* 0145F0 001144F0 A4FF0324 */  addiu       $3, $0, -0x5C
/* 0145F4 001144F4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0145F8 001144F8 0800E003 */  jr          $31
/* 0145FC 001144FC 00000000 */   nop
