.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdNowTalkCharaInfoID__Fv
/* 99180 00199080 7892828F */  lw         $2, -0x6D88($gp)
/* 99184 00199084 0800E003 */  jr         $31
/* 99188 00199088 00000000 */   nop
/* 9918C 0019908C 00000000 */  nop
