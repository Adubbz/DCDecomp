.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SetVInterruptHandler
/* 0140F0 00113FF0 0F000324 */  addiu       $3, $0, 0xF
/* 0140F4 00113FF4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0140F8 00113FF8 0800E003 */  jr          $31
/* 0140FC 00113FFC 00000000 */   nop
