.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMenuCharaEffectReadFlag__Fi
/* 10D150 0020D050 E09584A7 */  sh         $4, -0x6A20($gp)
/* 10D154 0020D054 0800E003 */  jr         $31
/* 10D158 0020D058 00000000 */   nop
/* 10D15C 0020D05C 00000000 */  nop
