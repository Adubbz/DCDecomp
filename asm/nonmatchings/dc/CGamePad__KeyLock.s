.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel KeyLock__8CGamePadFi
/* 2B6E0 0012B5E0 5C0485AC */  sw         $5, 0x45C($4)
/* 2B6E4 0012B5E4 0800E003 */  jr         $31
/* 2B6E8 0012B5E8 00000000 */   nop
/* 2B6EC 0012B5EC 00000000 */  nop
