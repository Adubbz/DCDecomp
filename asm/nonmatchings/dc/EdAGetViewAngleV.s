.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdAGetViewAngleV__Fv
/* 6A240 0016A140 048F80C7 */  lwc1       $f0, -0x70FC($gp)
/* 6A244 0016A144 0800E003 */  jr         $31
/* 6A248 0016A148 00000000 */   nop
/* 6A24C 0016A14C 00000000 */  nop
