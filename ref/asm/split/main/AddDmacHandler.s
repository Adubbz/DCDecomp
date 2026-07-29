.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel AddDmacHandler
/* 014130 00114030 12000324 */  addiu       $3, $0, 0x12
/* 014134 00114034 0C000000 */  syscall     0 /* handwritten instruction */
/* 014138 00114038 0800E003 */  jr          $31
/* 01413C 0011403C 00000000 */   nop
