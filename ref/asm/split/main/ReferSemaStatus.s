.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel ReferSemaStatus
/* 014490 00114390 47000324 */  addiu       $3, $0, 0x47
/* 014494 00114394 0C000000 */  syscall     0 /* handwritten instruction */
/* 014498 00114398 0800E003 */  jr          $31
/* 01449C 0011439C 00000000 */   nop
