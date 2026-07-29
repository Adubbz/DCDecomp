.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _DisableDmac
/* 014190 00114090 17000324 */  addiu       $3, $0, 0x17
/* 014194 00114094 0C000000 */  syscall     0 /* handwritten instruction */
/* 014198 00114098 0800E003 */  jr          $31
/* 01419C 0011409C 00000000 */   nop
