.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RFU085_iClearEventFlag
/* 014570 00114470 ABFF0324 */  addiu       $3, $0, -0x55
/* 014574 00114474 0C000000 */  syscall     0 /* handwritten instruction */
/* 014578 00114478 0800E003 */  jr          $31
/* 01457C 0011447C 00000000 */   nop
