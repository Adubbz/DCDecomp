.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRotation__7CObjectFP11CVector3_f_
/* 57010 00156F10 60008378 */  lq         $3, 0x60($4)
/* 57014 00156F14 0000A37C */  sq         $3, 0x0($5)
/* 57018 00156F18 0800E003 */  jr         $31
/* 5701C 00156F1C 00000000 */   nop
