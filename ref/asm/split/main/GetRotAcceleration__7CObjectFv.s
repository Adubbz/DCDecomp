.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRotAcceleration__7CObjectFv
/* 0570A0 00156FA0 80008224 */  addiu       $2, $4, 0x80
/* 0570A4 00156FA4 0800E003 */  jr          $31
/* 0570A8 00156FA8 00000000 */   nop
/* 0570AC 00156FAC 00000000 */  nop
