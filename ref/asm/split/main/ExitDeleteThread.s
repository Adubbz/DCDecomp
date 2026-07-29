.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel ExitDeleteThread
/* 014260 00114160 24000324 */  addiu       $3, $0, 0x24
/* 014264 00114164 0C000000 */  syscall     0 /* handwritten instruction */
/* 014268 00114168 0800E003 */  jr          $31
/* 01426C 0011416C 00000000 */   nop
