.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iDisableDmacHandler
/* 014650 00114550 A1FF0324 */  addiu       $3, $0, -0x5F
/* 014654 00114554 0C000000 */  syscall     0 /* handwritten instruction */
/* 014658 00114558 0800E003 */  jr          $31
/* 01465C 0011455C 00000000 */   nop
