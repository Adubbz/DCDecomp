.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel ExitThread
/* 014250 00114150 23000324 */  addiu       $3, $0, 0x23
/* 014254 00114154 0C000000 */  syscall     0 /* handwritten instruction */
/* 014258 00114158 0800E003 */  jr          $31
/* 01425C 0011415C 00000000 */   nop
