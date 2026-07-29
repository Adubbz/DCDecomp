.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU087_PollEvnetFlag
/* 014590 00114490 57000324 */  addiu       $3, $0, 0x57
/* 014594 00114494 0C000000 */  syscall     0 /* handwritten instruction */
/* 014598 00114498 0800E003 */  jr          $31
/* 01459C 0011449C 00000000 */   nop
