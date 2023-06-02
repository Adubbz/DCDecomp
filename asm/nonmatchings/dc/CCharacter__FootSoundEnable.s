.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FootSoundEnable__10CCharacterFi
/* 38320 00138220 DC0D85AC */  sw         $5, 0xDDC($4)
/* 38324 00138224 0800E003 */  jr         $31
/* 38328 00138228 00000000 */   nop
/* 3832C 0013822C 00000000 */  nop
