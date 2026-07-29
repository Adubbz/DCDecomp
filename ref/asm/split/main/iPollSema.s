.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iPollSema
/* 014480 00114380 BAFF0324 */  addiu       $3, $0, -0x46
/* 014484 00114384 0C000000 */  syscall     0 /* handwritten instruction */
/* 014488 00114388 0800E003 */  jr          $31
/* 01448C 0011438C 00000000 */   nop
