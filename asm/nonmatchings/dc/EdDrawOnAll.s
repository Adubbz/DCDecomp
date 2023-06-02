.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdDrawOnAll__Fv
/* 78230 00178130 6C9080AF */  sw         $0, -0x6F94($gp)
/* 78234 00178134 0800E003 */  jr         $31
/* 78238 00178138 00000000 */   nop
/* 7823C 0017813C 00000000 */  nop
