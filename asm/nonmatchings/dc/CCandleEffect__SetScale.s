.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetScale__13CCandleEffectFff
/* 63BA0 00163AA0 20008CE4 */  swc1       $f12, 0x20($4)
/* 63BA4 00163AA4 24008DE4 */  swc1       $f13, 0x24($4)
/* 63BA8 00163AA8 0800E003 */  jr         $31
/* 63BAC 00163AAC 00000000 */   nop
