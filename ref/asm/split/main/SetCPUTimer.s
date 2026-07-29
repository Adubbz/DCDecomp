.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SetCPUTimer
/* 014710 00114610 6D000324 */  addiu       $3, $0, 0x6D
/* 014714 00114614 0C000000 */  syscall     0 /* handwritten instruction */
/* 014718 00114618 0800E003 */  jr          $31
/* 01471C 0011461C 00000000 */   nop
