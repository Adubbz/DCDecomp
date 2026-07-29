.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel EnableIntcHandler
/* 0145E0 001144E0 5C000324 */  addiu       $3, $0, 0x5C
/* 0145E4 001144E4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0145E8 001144E8 0800E003 */  jr          $31
/* 0145EC 001144EC 00000000 */   nop
