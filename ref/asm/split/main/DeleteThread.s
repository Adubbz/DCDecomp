.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel DeleteThread
/* 014230 00114130 21000324 */  addiu       $3, $0, 0x21
/* 014234 00114134 0C000000 */  syscall     0 /* handwritten instruction */
/* 014238 00114138 0800E003 */  jr          $31
/* 01423C 0011413C 00000000 */   nop
