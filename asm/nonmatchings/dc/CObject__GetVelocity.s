.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetVelocity__7CObjectFP11CVector3_f_
/* 56FB0 00156EB0 20008378 */  lq         $3, 0x20($4)
/* 56FB4 00156EB4 0000A37C */  sq         $3, 0x0($5)
/* 56FB8 00156EB8 0800E003 */  jr         $31
/* 56FBC 00156EBC 00000000 */   nop
