.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__12CEffectGroupFP7CEffecti
/* 64C20 00164B20 000085AC */  sw         $5, 0x0($4)
/* 64C24 00164B24 040086AC */  sw         $6, 0x4($4)
/* 64C28 00164B28 0800E003 */  jr         $31
/* 64C2C 00164B2C 00000000 */   nop
