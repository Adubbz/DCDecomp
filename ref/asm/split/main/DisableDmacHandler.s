.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel DisableDmacHandler
/* 014640 00114540 5F000324 */  addiu       $3, $0, 0x5F
/* 014644 00114544 0C000000 */  syscall     0 /* handwritten instruction */
/* 014648 00114548 0800E003 */  jr          $31
/* 01464C 0011454C 00000000 */   nop
