.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SetPgifHandler
/* 014780 00114680 72000324 */  addiu       $3, $0, 0x72
/* 014784 00114684 0C000000 */  syscall     0 /* handwritten instruction */
/* 014788 00114688 0800E003 */  jr          $31
/* 01478C 0011468C 00000000 */   nop
