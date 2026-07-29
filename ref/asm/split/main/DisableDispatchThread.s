.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel DisableDispatchThread
/* 014290 00114190 27000324 */  addiu       $3, $0, 0x27
/* 014294 00114194 0C000000 */  syscall     0 /* handwritten instruction */
/* 014298 00114198 0800E003 */  jr          $31
/* 01429C 0011419C 00000000 */   nop
