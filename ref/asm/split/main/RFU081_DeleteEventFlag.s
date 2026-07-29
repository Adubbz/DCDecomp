.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU081_DeleteEventFlag
/* 014530 00114430 51000324 */  addiu       $3, $0, 0x51
/* 014534 00114434 0C000000 */  syscall     0 /* handwritten instruction */
/* 014538 00114438 0800E003 */  jr          $31
/* 01453C 0011443C 00000000 */   nop
