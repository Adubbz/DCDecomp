.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetGridFrame__9CEditAreaFP9CFrameVu1
/* 70210 00170110 282085AC */  sw         $5, 0x2028($4)
/* 70214 00170114 0800E003 */  jr         $31
/* 70218 00170118 00000000 */   nop
/* 7021C 0017011C 00000000 */  nop
