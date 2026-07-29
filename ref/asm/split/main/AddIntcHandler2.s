.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel AddIntcHandler2
/* 014110 00114010 10000324 */  addiu       $3, $0, 0x10
/* 014114 00114014 0C000000 */  syscall     0 /* handwritten instruction */
/* 014118 00114018 0800E003 */  jr          $31
/* 01411C 0011401C 00000000 */   nop
