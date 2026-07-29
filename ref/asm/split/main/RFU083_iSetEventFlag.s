.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU083_iSetEventFlag
/* 014550 00114450 ADFF0324 */  addiu       $3, $0, -0x53
/* 014554 00114454 0C000000 */  syscall     0 /* handwritten instruction */
/* 014558 00114458 0800E003 */  jr          $31
/* 01455C 0011445C 00000000 */   nop
