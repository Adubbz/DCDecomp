.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel GsGetIMR
/* 014740 00114640 70000324 */  addiu       $3, $0, 0x70
/* 014744 00114644 0C000000 */  syscall     0 /* handwritten instruction */
/* 014748 00114648 0800E003 */  jr          $31
/* 01474C 0011464C 00000000 */   nop
