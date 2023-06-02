.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetVisual__9CFrameVu1Fv
/* 2A320 0012A220 6002828C */  lw         $2, 0x260($4)
/* 2A324 0012A224 0800E003 */  jr         $31
/* 2A328 0012A228 00000000 */   nop
/* 2A32C 0012A22C 00000000 */  nop
