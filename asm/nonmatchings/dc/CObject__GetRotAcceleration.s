.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRotAcceleration__7CObjectFP11CVector3_f_
/* 57030 00156F30 80008378 */  lq         $3, 0x80($4)
/* 57034 00156F34 0000A37C */  sq         $3, 0x0($5)
/* 57038 00156F38 0800E003 */  jr         $31
/* 5703C 00156F3C 00000000 */   nop
