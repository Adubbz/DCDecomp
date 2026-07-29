.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SetGsCrt
/* 014020 00113F20 02000324 */  addiu       $3, $0, 0x2
/* 014024 00113F24 0C000000 */  syscall     0 /* handwritten instruction */
/* 014028 00113F28 0800E003 */  jr          $31
/* 01402C 00113F2C 00000000 */   nop
