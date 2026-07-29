.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetVisual__9CFrameVu1Fv
/* 02A320 0012A220 6002828C */  lw          $2, 0x260($4)
/* 02A324 0012A224 0800E003 */  jr          $31
/* 02A328 0012A228 00000000 */   nop
/* 02A32C 0012A22C 00000000 */  nop
