.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SetVCommonHandler
/* 0140E0 00113FE0 0E000324 */  addiu       $3, $0, 0xE
/* 0140E4 00113FE4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0140E8 00113FE8 0800E003 */  jr          $31
/* 0140EC 00113FEC 00000000 */   nop
