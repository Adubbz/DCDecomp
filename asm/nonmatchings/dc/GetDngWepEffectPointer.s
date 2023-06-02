.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetDngWepEffectPointer__Fv
/* 10D170 0020D070 E895828F */  lw         $2, -0x6A18($gp)
/* 10D174 0020D074 0800E003 */  jr         $31
/* 10D178 0020D078 00000000 */   nop
/* 10D17C 0020D07C 00000000 */  nop
