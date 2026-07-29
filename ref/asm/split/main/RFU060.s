.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU060
/* 0143E0 001142E0 3C000324 */  addiu       $3, $0, 0x3C
/* 0143E4 001142E4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0143E8 001142E8 0800E003 */  jr          $31
/* 0143EC 001142EC 00000000 */   nop
