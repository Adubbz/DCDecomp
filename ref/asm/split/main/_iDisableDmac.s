.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _iDisableDmac
/* 0141F0 001140F0 E3FF0324 */  addiu       $3, $0, -0x1D
/* 0141F4 001140F4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0141F8 001140F8 0800E003 */  jr          $31
/* 0141FC 001140FC 00000000 */   nop
