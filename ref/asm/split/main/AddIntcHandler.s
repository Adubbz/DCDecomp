.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel AddIntcHandler
/* 014100 00114000 10000324 */  addiu       $3, $0, 0x10
/* 014104 00114004 0C000000 */  syscall     0 /* handwritten instruction */
/* 014108 00114008 0800E003 */  jr          $31
/* 01410C 0011400C 00000000 */   nop
