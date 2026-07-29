.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sceSifSetDma
/* 0147E0 001146E0 77000324 */  addiu       $3, $0, 0x77
/* 0147E4 001146E4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0147E8 001146E8 0800E003 */  jr          $31
/* 0147EC 001146EC 00000000 */   nop
