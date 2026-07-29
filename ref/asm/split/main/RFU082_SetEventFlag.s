.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU082_SetEventFlag
/* 014540 00114440 52000324 */  addiu       $3, $0, 0x52
/* 014544 00114444 0C000000 */  syscall     0 /* handwritten instruction */
/* 014548 00114448 0800E003 */  jr          $31
/* 01454C 0011444C 00000000 */   nop
