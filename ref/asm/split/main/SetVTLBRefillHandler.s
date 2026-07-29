.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SetVTLBRefillHandler
/* 0140D0 00113FD0 0D000324 */  addiu       $3, $0, 0xD
/* 0140D4 00113FD4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0140D8 00113FD8 0800E003 */  jr          $31
/* 0140DC 00113FDC 00000000 */   nop
