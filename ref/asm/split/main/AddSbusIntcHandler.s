.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel AddSbusIntcHandler
/* 0140A0 00113FA0 0A000324 */  addiu       $3, $0, 0xA
/* 0140A4 00113FA4 0C000000 */  syscall     0 /* handwritten instruction */
/* 0140A8 00113FA8 0800E003 */  jr          $31
/* 0140AC 00113FAC 00000000 */   nop
