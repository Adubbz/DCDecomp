.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _EnableDmac
/* 014180 00114080 16000324 */  addiu       $3, $0, 0x16
/* 014184 00114084 0C000000 */  syscall     0 /* handwritten instruction */
/* 014188 00114088 0800E003 */  jr          $31
/* 01418C 0011408C 00000000 */   nop
