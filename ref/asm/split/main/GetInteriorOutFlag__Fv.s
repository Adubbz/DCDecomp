.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetInteriorOutFlag__Fv
/* 0F40D0 001F3FD0 68958287 */  lh          $2, -0x6A98($28)
/* 0F40D4 001F3FD4 0800E003 */  jr          $31
/* 0F40D8 001F3FD8 00000000 */   nop
/* 0F40DC 001F3FDC 00000000 */  nop
