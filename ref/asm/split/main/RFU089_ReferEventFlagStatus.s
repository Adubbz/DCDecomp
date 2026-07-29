.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU089_ReferEventFlagStatus
/* 0145B0 001144B0 59000324 */  addiu       $3, $0, 0x59
/* 0145B4 001144B4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0145B8 001144B8 0800E003 */  jr          $31
/* 0145BC 001144BC 00000000 */   nop
