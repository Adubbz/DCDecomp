.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel DisableIntcHandler
/* 014600 00114500 5D000324 */  addiu       $3, $0, 0x5D
/* 014604 00114504 0C000000 */  syscall     0 /* handwritten instruction */
/* 014608 00114508 0800E003 */  jr          $31
/* 01460C 0011450C 00000000 */   nop
