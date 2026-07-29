.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel GetGsVParam
/* 0144F0 001143F0 4D000324 */  addiu       $3, $0, 0x4D
/* 0144F4 001143F4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0144F8 001143F8 0800E003 */  jr          $31
/* 0144FC 001143FC 00000000 */   nop
