.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAcceleration__7CObjectFP11CVector3_f_
/* 56FC0 00156EC0 30008378 */  lq         $3, 0x30($4)
/* 56FC4 00156EC4 0000A37C */  sq         $3, 0x0($5)
/* 56FC8 00156EC8 0800E003 */  jr         $31
/* 56FCC 00156ECC 00000000 */   nop
