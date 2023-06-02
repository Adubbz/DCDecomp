.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishPullHook__Ff
/* AA270 001AA170 88938CE7 */  swc1       $f12, -0x6C78($gp)
/* AA274 001AA174 0800E003 */  jr         $31
/* AA278 001AA178 00000000 */   nop
/* AA27C 001AA17C 00000000 */  nop
