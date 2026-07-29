.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel SignalSema
/* 014440 00114340 42000324 */  addiu       $3, $0, 0x42
/* 014444 00114344 0C000000 */  syscall     0 /* handwritten instruction */
/* 014448 00114348 0800E003 */  jr          $31
/* 01444C 0011434C 00000000 */   nop
