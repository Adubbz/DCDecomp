.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel EnableDmacHandler
/* 014620 00114520 5E000324 */  addiu       $3, $0, 0x5E
/* 014624 00114524 0C000000 */  syscall     0 /* handwritten instruction */
/* 014628 00114528 0800E003 */  jr          $31
/* 01462C 0011452C 00000000 */   nop
