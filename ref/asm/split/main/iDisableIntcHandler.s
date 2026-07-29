.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iDisableIntcHandler
/* 014610 00114510 A3FF0324 */  addiu       $3, $0, -0x5D
/* 014614 00114514 0C000000 */  syscall     0 /* handwritten instruction */
/* 014618 00114518 0800E003 */  jr          $31
/* 01461C 0011451C 00000000 */   nop
