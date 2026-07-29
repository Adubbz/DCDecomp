.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _root
/* 0001B8 001000B8 23000324 */  addiu       $3, $0, 0x23
/* 0001BC 001000BC 0C000000 */  syscall     0 /* handwritten instruction */
