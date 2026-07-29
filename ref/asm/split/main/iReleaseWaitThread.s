.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iReleaseWaitThread
/* 014300 00114200 D2FF0324 */  addiu       $3, $0, -0x2E
/* 014304 00114204 0C000000 */  syscall     0 /* handwritten instruction */
/* 014308 00114208 0800E003 */  jr          $31
/* 01430C 0011420C 00000000 */   nop
