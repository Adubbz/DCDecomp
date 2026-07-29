.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sceSifSetDChain
/* 014800 00114700 78000324 */  addiu       $3, $0, 0x78
/* 014804 00114704 0C000000 */  syscall     0 /* handwritten instruction */
/* 014808 00114708 0800E003 */  jr          $31
/* 01480C 0011470C 00000000 */   nop
