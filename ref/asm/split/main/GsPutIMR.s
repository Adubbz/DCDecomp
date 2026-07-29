.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel GsPutIMR
/* 014760 00114660 71000324 */  addiu       $3, $0, 0x71
/* 014764 00114664 0C000000 */  syscall     0 /* handwritten instruction */
/* 014768 00114668 0800E003 */  jr          $31
/* 01476C 0011466C 00000000 */   nop
