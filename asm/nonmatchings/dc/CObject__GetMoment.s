.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMoment__7CObjectFP11CVector3_f_
/* 56FE0 00156EE0 50008378 */  lq         $3, 0x50($4)
/* 56FE4 00156EE4 0000A37C */  sq         $3, 0x0($5)
/* 56FE8 00156EE8 0800E003 */  jr         $31
/* 56FEC 00156EEC 00000000 */   nop
