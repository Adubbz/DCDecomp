.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SetOsdConfigParam
/* 0144C0 001143C0 4A000324 */  addiu       $3, $0, 0x4A
/* 0144C4 001143C4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0144C8 001143C8 0800E003 */  jr          $31
/* 0144CC 001143CC 00000000 */   nop
