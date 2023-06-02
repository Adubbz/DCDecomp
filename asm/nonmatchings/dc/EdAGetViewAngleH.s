.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdAGetViewAngleH__Fv
/* 6A230 0016A130 008F80C7 */  lwc1       $f0, -0x7100($gp)
/* 6A234 0016A134 0800E003 */  jr         $31
/* 6A238 0016A138 00000000 */   nop
/* 6A23C 0016A13C 00000000 */  nop
