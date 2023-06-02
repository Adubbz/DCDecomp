.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdNowTalkChara__Fv
/* 99170 00199070 7492828F */  lw         $2, -0x6D8C($gp)
/* 99174 00199074 0800E003 */  jr         $31
/* 99178 00199078 00000000 */   nop
/* 9917C 0019907C 00000000 */  nop
