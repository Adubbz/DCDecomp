.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetTexture__13CCandleEffectFP8CTexture
/* 63B90 00163A90 080085AC */  sw         $5, 0x8($4)
/* 63B94 00163A94 0800E003 */  jr         $31
/* 63B98 00163A98 00000000 */   nop
/* 63B9C 00163A9C 00000000 */  nop
