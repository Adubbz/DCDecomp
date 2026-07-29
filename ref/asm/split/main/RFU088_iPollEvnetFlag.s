.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU088_iPollEvnetFlag
/* 0145A0 001144A0 A8FF0324 */  addiu       $3, $0, -0x58
/* 0145A4 001144A4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0145A8 001144A8 0800E003 */  jr          $31
/* 0145AC 001144AC 00000000 */   nop
