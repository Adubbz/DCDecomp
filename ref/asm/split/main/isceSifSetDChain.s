.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel isceSifSetDChain
/* 014810 00114710 88FF0324 */  addiu       $3, $0, -0x78
/* 014814 00114714 0C000000 */  syscall     0 /* handwritten instruction */
/* 014818 00114718 0800E003 */  jr          $31
/* 01481C 0011471C 00000000 */   nop
