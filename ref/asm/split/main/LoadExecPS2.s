.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel LoadExecPS2
/* 014060 00113F60 06000324 */  addiu       $3, $0, 0x6
/* 014064 00113F64 0C000000 */  syscall     0 /* handwritten instruction */
/* 014068 00113F68 0800E003 */  jr          $31
/* 01406C 00113F6C 00000000 */   nop
