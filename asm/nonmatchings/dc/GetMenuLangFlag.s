.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuLangFlag__Fv
/* 12BB00 0022BA00 9886828F */  lw         $2, -0x7968($gp)
/* 12BB04 0022BA04 0800E003 */  jr         $31
/* 12BB08 0022BA08 00000000 */   nop
/* 12BB0C 0022BA0C 00000000 */  nop
