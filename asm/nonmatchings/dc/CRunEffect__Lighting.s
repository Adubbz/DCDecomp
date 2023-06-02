.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Lighting__10CRunEffectFi
/* 63570 00163470 000085AC */  sw         $5, 0x0($4)
/* 63574 00163474 0800E003 */  jr         $31
/* 63578 00163478 00000000 */   nop
/* 6357C 0016347C 00000000 */  nop
