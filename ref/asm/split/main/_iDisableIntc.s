.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _iDisableIntc
/* 0141D0 001140D0 E5FF0324 */  addiu       $3, $0, -0x1B
/* 0141D4 001140D4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0141D8 001140D8 0800E003 */  jr          $31
/* 0141DC 001140DC 00000000 */   nop
