.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _SetAlarm
/* 0141A0 001140A0 18000324 */  addiu       $3, $0, 0x18
/* 0141A4 001140A4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0141A8 001140A8 0800E003 */  jr          $31
/* 0141AC 001140AC 00000000 */   nop
