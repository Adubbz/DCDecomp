.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__11MotionParamFv
/* 43710 00143610 28168070 */  paddub     $2, $4, $0
/* 43714 00143614 0800E003 */  jr         $31
/* 43718 00143618 00000000 */   nop
/* 4371C 0014361C 00000000 */  nop
