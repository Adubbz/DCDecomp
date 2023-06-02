.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdDDebug__Fi
/* 70350 00170250 348780AF */  sw         $0, -0x78CC($gp)
/* 70354 00170254 0800E003 */  jr         $31
/* 70358 00170258 00000000 */   nop
/* 7035C 0017025C 00000000 */  nop
