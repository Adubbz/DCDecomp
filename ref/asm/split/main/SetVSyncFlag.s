.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SetVSyncFlag
/* 014790 00114690 73000324 */  addiu       $3, $0, 0x73
/* 014794 00114694 0C000000 */  syscall     0 /* handwritten instruction */
/* 014798 00114698 0800E003 */  jr          $31
/* 01479C 0011469C 00000000 */   nop
