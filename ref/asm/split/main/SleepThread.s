.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SleepThread
/* 014340 00114240 32000324 */  addiu       $3, $0, 0x32
/* 014344 00114244 0C000000 */  syscall     0 /* handwritten instruction */
/* 014348 00114248 0800E003 */  jr          $31
/* 01434C 0011424C 00000000 */   nop
