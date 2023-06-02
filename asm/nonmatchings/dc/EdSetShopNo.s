.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSetShopNo__Fi
/* 72DC0 00172CC0 748F84AF */  sw         $4, -0x708C($gp)
/* 72DC4 00172CC4 0800E003 */  jr         $31
/* 72DC8 00172CC8 00000000 */   nop
/* 72DCC 00172CCC 00000000 */  nop
