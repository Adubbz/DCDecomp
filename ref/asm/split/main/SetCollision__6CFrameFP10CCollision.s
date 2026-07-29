.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetCollision__6CFrameFP10CCollision
/* 02A290 0012A190 040085AC */  sw          $5, 0x4($4)
/* 02A294 0012A194 0800E003 */  jr          $31
/* 02A298 0012A198 00000000 */   nop
/* 02A29C 0012A19C 00000000 */  nop
