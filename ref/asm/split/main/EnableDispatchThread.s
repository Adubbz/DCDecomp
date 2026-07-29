.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel EnableDispatchThread
/* 0142A0 001141A0 28000324 */  addiu       $3, $0, 0x28
/* 0142A4 001141A4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0142A8 001141A8 0800E003 */  jr          $31
/* 0142AC 001141AC 00000000 */   nop
