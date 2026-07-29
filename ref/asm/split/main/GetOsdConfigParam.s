.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel GetOsdConfigParam
/* 0144D0 001143D0 4B000324 */  addiu       $3, $0, 0x4B
/* 0144D4 001143D4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0144D8 001143D8 0800E003 */  jr          $31
/* 0144DC 001143DC 00000000 */   nop
