.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetGravity__7CObjectFP11CVector3_f_
/* 56FD0 00156ED0 40008378 */  lq         $3, 0x40($4)
/* 56FD4 00156ED4 0000A37C */  sq         $3, 0x0($5)
/* 56FD8 00156ED8 0800E003 */  jr         $31
/* 56FDC 00156EDC 00000000 */   nop
