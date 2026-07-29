.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iSignalSema
/* 014450 00114350 BDFF0324 */  addiu       $3, $0, -0x43
/* 014454 00114354 0C000000 */  syscall     0 /* handwritten instruction */
/* 014458 00114358 0800E003 */  jr          $31
/* 01445C 0011435C 00000000 */   nop
