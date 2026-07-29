.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU008
/* 014080 00113F80 08000324 */  addiu       $3, $0, 0x8
/* 014084 00113F84 0C000000 */  syscall     0 /* handwritten instruction */
/* 014088 00113F88 0800E003 */  jr          $31
/* 01408C 00113F8C 00000000 */   nop
