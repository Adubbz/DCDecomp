.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU005
/* 014050 00113F50 05000324 */  addiu       $3, $0, 0x5
/* 014054 00113F54 0C000000 */  syscall     0 /* handwritten instruction */
/* 014058 00113F58 0800E003 */  jr          $31
/* 01405C 00113F5C 00000000 */   nop
