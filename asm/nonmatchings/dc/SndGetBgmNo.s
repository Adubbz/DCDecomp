.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndGetBgmNo__Fv
/* 59E10 00159D10 048E828F */  lw         $2, -0x71FC($gp)
/* 59E14 00159D14 0800E003 */  jr         $31
/* 59E18 00159D18 00000000 */   nop
/* 59E1C 00159D1C 00000000 */  nop
