.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU090_iReferEventFlagStatus
/* 0145C0 001144C0 A6FF0324 */  addiu       $3, $0, -0x5A
/* 0145C4 001144C4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0145C8 001144C8 0800E003 */  jr          $31
/* 0145CC 001144CC 00000000 */   nop
