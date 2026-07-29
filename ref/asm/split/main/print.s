.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel print
/* 0147B0 001146B0 75000324 */  addiu       $3, $0, 0x75
/* 0147B4 001146B4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0147B8 001146B8 0800E003 */  jr          $31
/* 0147BC 001146BC 00000000 */   nop
