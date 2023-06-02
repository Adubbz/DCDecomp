.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitMemoryFile__Fv
/* 3F450 0013F350 0800E003 */  jr         $31
/* 3F454 0013F354 00000000 */   nop
/* 3F458 0013F358 00000000 */  nop
/* 3F45C 0013F35C 00000000 */  nop
