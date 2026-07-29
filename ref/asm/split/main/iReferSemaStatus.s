.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iReferSemaStatus
/* 0144A0 001143A0 B8FF0324 */  addiu       $3, $0, -0x48
/* 0144A4 001143A4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0144A8 001143A8 0800E003 */  jr          $31
/* 0144AC 001143AC 00000000 */   nop
