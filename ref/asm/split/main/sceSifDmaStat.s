.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sceSifDmaStat
/* 0147C0 001146C0 76000324 */  addiu       $3, $0, 0x76
/* 0147C4 001146C4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0147C8 001146C8 0800E003 */  jr          $31
/* 0147CC 001146CC 00000000 */   nop
