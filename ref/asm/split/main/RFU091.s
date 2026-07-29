.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU091
/* 0145D0 001144D0 5B000324 */  addiu       $3, $0, 0x5B
/* 0145D4 001144D4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0145D8 001144D8 0800E003 */  jr          $31
/* 0145DC 001144DC 00000000 */   nop
