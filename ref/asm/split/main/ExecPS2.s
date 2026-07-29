.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel ExecPS2
/* 014070 00113F70 07000324 */  addiu       $3, $0, 0x7
/* 014074 00113F74 0C000000 */  syscall     0 /* handwritten instruction */
/* 014078 00113F78 0800E003 */  jr          $31
/* 01407C 00113F7C 00000000 */   nop
