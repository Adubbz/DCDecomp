.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU063
/* 014410 00114310 3F000324 */  addiu       $3, $0, 0x3F
/* 014414 00114314 0C000000 */  syscall     0 /* handwritten instruction */
/* 014418 00114318 0800E003 */  jr          $31
/* 01441C 0011431C 00000000 */   nop
