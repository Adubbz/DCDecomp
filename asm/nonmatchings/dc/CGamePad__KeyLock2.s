.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel KeyLock2__8CGamePadFi
/* 2B6F0 0012B5F0 600485AC */  sw         $5, 0x460($4)
/* 2B6F4 0012B5F4 0800E003 */  jr         $31
/* 2B6F8 0012B5F8 00000000 */   nop
/* 2B6FC 0012B5FC 00000000 */  nop
