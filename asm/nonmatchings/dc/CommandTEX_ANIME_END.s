.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandTEX_ANIME_END__FPPv
/* 681F0 001680F0 0800E003 */  jr         $31
/* 681F4 001680F4 00000000 */   nop
/* 681F8 001680F8 00000000 */  nop
/* 681FC 001680FC 00000000 */  nop
