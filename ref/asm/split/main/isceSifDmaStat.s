.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel isceSifDmaStat
/* 0147D0 001146D0 8AFF0324 */  addiu       $3, $0, -0x76
/* 0147D4 001146D4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0147D8 001146D8 0800E003 */  jr          $31
/* 0147DC 001146DC 00000000 */   nop
