.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuModeOff__8CGamePadFv
/* 2BA30 0012B930 540480AC */  sw         $0, 0x454($4)
/* 2BA34 0012B934 0800E003 */  jr         $31
/* 2BA38 0012B938 00000000 */   nop
/* 2BA3C 0012B93C 00000000 */  nop
