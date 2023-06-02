.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetFootSoundID__10CCharacterFi
/* 38310 00138210 D80D85AC */  sw         $5, 0xDD8($4)
/* 38314 00138214 0800E003 */  jr         $31
/* 38318 00138218 00000000 */   nop
/* 3831C 0013821C 00000000 */  nop
