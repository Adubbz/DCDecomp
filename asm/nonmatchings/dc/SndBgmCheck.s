.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndBgmCheck__Fv
/* 59E00 00159D00 088E828F */  lw         $2, -0x71F8($gp)
/* 59E04 00159D04 0800E003 */  jr         $31
/* 59E08 00159D08 00000000 */   nop
/* 59E0C 00159D0C 00000000 */  nop
