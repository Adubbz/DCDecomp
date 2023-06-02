.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdInitDrawDay__Fv
/* 7D130 0017D030 B49180AF */  sw         $0, -0x6E4C($gp)
/* 7D134 0017D034 B89180AF */  sw         $0, -0x6E48($gp)
/* 7D138 0017D038 0800E003 */  jr         $31
/* 7D13C 0017D03C 00000000 */   nop
