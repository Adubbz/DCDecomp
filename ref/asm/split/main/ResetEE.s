.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel ResetEE
/* 014010 00113F10 01000324 */  addiu       $3, $0, 0x1
/* 014014 00113F14 0C000000 */  syscall     0 /* handwritten instruction */
/* 014018 00113F18 0800E003 */  jr          $31
/* 01401C 00113F1C 00000000 */   nop
