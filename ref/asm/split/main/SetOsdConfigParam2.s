.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SetOsdConfigParam2
/* 014720 00114620 6E000324 */  addiu       $3, $0, 0x6E
/* 014724 00114624 0C000000 */  syscall     0 /* handwritten instruction */
/* 014728 00114628 0800E003 */  jr          $31
/* 01472C 0011462C 00000000 */   nop
