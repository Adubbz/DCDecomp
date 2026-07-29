.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iTerminateThread
/* 014280 00114180 DAFF0324 */  addiu       $3, $0, -0x26
/* 014284 00114184 0C000000 */  syscall     0 /* handwritten instruction */
/* 014288 00114188 0800E003 */  jr          $31
/* 01428C 0011418C 00000000 */   nop
