.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel check_now_loading__Fv
/* 54040 00153F40 E086828F */  lw         $2, -0x7920($gp)
/* 54044 00153F44 0800E003 */  jr         $31
/* 54048 00153F48 00000000 */   nop
/* 5404C 00153F4C 00000000 */  nop
