.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel GetGsHParam
/* 0144E0 001143E0 4C000324 */  addiu       $3, $0, 0x4C
/* 0144E4 001143E4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0144E8 001143E8 0800E003 */  jr          $31
/* 0144EC 001143EC 00000000 */   nop
