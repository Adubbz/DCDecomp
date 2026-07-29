.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _ReleaseAlarm
/* 0141B0 001140B0 19000324 */  addiu       $3, $0, 0x19
/* 0141B4 001140B4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0141B8 001140B8 0800E003 */  jr          $31
/* 0141BC 001140BC 00000000 */   nop
