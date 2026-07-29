.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel TerminateThread
/* 014270 00114170 25000324 */  addiu       $3, $0, 0x25
/* 014274 00114174 0C000000 */  syscall     0 /* handwritten instruction */
/* 014278 00114178 0800E003 */  jr          $31
/* 01427C 0011417C 00000000 */   nop
