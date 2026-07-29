.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iReferThreadStatus
/* 014330 00114230 CFFF0324 */  addiu       $3, $0, -0x31
/* 014334 00114234 0C000000 */  syscall     0 /* handwritten instruction */
/* 014338 00114238 0800E003 */  jr          $31
/* 01433C 0011423C 00000000 */   nop
