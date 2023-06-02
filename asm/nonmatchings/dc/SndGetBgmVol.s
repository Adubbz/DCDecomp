.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndGetBgmVol__Fv
/* 59EE0 00159DE0 0C8E828F */  lw         $2, -0x71F4($gp)
/* 59EE4 00159DE4 0800E003 */  jr         $31
/* 59EE8 00159DE8 00000000 */   nop
/* 59EEC 00159DEC 00000000 */  nop
