.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetVif1Packet__Fv
/* 2E380 0012E280 D48B828F */  lw         $2, -0x742C($gp)
/* 2E384 0012E284 0800E003 */  jr         $31
/* 2E388 0012E288 00000000 */   nop
/* 2E38C 0012E28C 00000000 */  nop
