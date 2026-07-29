.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel RemoveSbusIntcHandler
/* 0140B0 00113FB0 0B000324 */  addiu       $3, $0, 0xB
/* 0140B4 00113FB4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0140B8 00113FB8 0800E003 */  jr          $31
/* 0140BC 00113FBC 00000000 */   nop
