.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _iSetAlarm
/* 014200 00114100 E2FF0324 */  addiu       $3, $0, -0x1E
/* 014204 00114104 0C000000 */  syscall     0 /* handwritten instruction */
/* 014208 00114108 0800E003 */  jr          $31
/* 01420C 0011410C 00000000 */   nop
