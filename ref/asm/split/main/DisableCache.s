.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel DisableCache
/* 014680 00114580 62000324 */  addiu       $3, $0, 0x62
/* 014684 00114584 0C000000 */  syscall     0 /* handwritten instruction */
/* 014688 00114588 0800E003 */  jr          $31
/* 01468C 0011458C 00000000 */   nop
