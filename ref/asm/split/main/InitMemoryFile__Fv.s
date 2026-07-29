.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitMemoryFile__Fv
/* 03F450 0013F350 0800E003 */  jr          $31
/* 03F454 0013F354 00000000 */   nop
/* 03F458 0013F358 00000000 */  nop
/* 03F45C 0013F35C 00000000 */  nop
