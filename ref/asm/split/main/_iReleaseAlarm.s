.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _iReleaseAlarm
/* 014210 00114110 E1FF0324 */  addiu       $3, $0, -0x1F
/* 014214 00114114 0C000000 */  syscall     0 /* handwritten instruction */
/* 014218 00114118 0800E003 */  jr          $31
/* 01421C 0011411C 00000000 */   nop
