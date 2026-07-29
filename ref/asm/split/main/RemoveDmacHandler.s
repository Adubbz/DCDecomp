.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RemoveDmacHandler
/* 014150 00114050 13000324 */  addiu       $3, $0, 0x13
/* 014154 00114054 0C000000 */  syscall     0 /* handwritten instruction */
/* 014158 00114058 0800E003 */  jr          $31
/* 01415C 0011405C 00000000 */   nop
