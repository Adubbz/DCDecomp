.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetCollision__6CFrameFP10CCollision
/* 2A290 0012A190 040085AC */  sw         $5, 0x4($4)
/* 2A294 0012A194 0800E003 */  jr         $31
/* 2A298 0012A198 00000000 */   nop
/* 2A29C 0012A19C 00000000 */  nop
