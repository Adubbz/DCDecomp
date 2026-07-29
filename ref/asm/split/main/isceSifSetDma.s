.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel isceSifSetDma
/* 0147F0 001146F0 89FF0324 */  addiu       $3, $0, -0x77
/* 0147F4 001146F4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0147F8 001146F8 0800E003 */  jr          $31
/* 0147FC 001146FC 00000000 */   nop
