.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PlayTimeCountFlag__Fi
/* 41020 00140F20 A48684AF */  sw         $4, -0x795C($gp)
/* 41024 00140F24 0800E003 */  jr         $31
/* 41028 00140F28 00000000 */   nop
/* 4102C 00140F2C 00000000 */  nop
