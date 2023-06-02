.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuModeOn__8CGamePadFi
/* 2BA20 0012B920 540485AC */  sw         $5, 0x454($4)
/* 2BA24 0012B924 0800E003 */  jr         $31
/* 2BA28 0012B928 00000000 */   nop
/* 2BA2C 0012B92C 00000000 */  nop
