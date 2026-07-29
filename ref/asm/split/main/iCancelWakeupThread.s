.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iCancelWakeupThread
/* 014380 00114280 CAFF0324 */  addiu       $3, $0, -0x36
/* 014384 00114284 0C000000 */  syscall     0 /* handwritten instruction */
/* 014388 00114288 0800E003 */  jr          $31
/* 01438C 0011428C 00000000 */   nop
