.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _iEnableIntc
/* 0141C0 001140C0 E6FF0324 */  addiu       $3, $0, -0x1A
/* 0141C4 001140C4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0141C8 001140C8 0800E003 */  jr          $31
/* 0141CC 001140CC 00000000 */   nop
