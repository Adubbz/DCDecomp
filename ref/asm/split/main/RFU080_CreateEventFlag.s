.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU080_CreateEventFlag
/* 014520 00114420 50000324 */  addiu       $3, $0, 0x50
/* 014524 00114424 0C000000 */  syscall     0 /* handwritten instruction */
/* 014528 00114428 0800E003 */  jr          $31
/* 01452C 0011442C 00000000 */   nop
