.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdASetViewAngle__Fff
/* 6A250 0016A150 008F8CE7 */  swc1       $f12, -0x7100($gp)
/* 6A254 0016A154 048F8DE7 */  swc1       $f13, -0x70FC($gp)
/* 6A258 0016A158 0800E003 */  jr         $31
/* 6A25C 0016A15C 00000000 */   nop
