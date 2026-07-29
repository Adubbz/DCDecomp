.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _iSuspendThread
/* 0143A0 001142A0 C8FF0324 */  addiu       $3, $0, -0x38
/* 0143A4 001142A4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0143A8 001142A8 0800E003 */  jr          $31
/* 0143AC 001142AC 00000000 */   nop
