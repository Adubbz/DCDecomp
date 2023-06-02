.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRotVelocity__7CObjectFP11CVector3_f_
/* 57020 00156F20 70008378 */  lq         $3, 0x70($4)
/* 57024 00156F24 0000A37C */  sq         $3, 0x0($5)
/* 57028 00156F28 0800E003 */  jr         $31
/* 5702C 00156F2C 00000000 */   nop
