.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU073
/* 0144B0 001143B0 49000324 */  addiu       $3, $0, 0x49
/* 0144B4 001143B4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0144B8 001143B8 0800E003 */  jr          $31
/* 0144BC 001143BC 00000000 */   nop
