.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _iEnableDmac
/* 0141E0 001140E0 E4FF0324 */  addiu       $3, $0, -0x1C
/* 0141E4 001140E4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0141E8 001140E8 0800E003 */  jr          $31
/* 0141EC 001140EC 00000000 */   nop
