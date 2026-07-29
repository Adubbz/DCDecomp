.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetInteriorOutFlag__Fi
/* 0F40C0 001F3FC0 689584A7 */  sh          $4, -0x6A98($28)
/* 0F40C4 001F3FC4 0800E003 */  jr          $31
/* 0F40C8 001F3FC8 00000000 */   nop
/* 0F40CC 001F3FCC 00000000 */  nop
