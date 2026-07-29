.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU009
/* 014090 00113F90 09000324 */  addiu       $3, $0, 0x9
/* 014094 00113F94 0C000000 */  syscall     0 /* handwritten instruction */
/* 014098 00113F98 0800E003 */  jr          $31
/* 01409C 00113F9C 00000000 */   nop
