.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingSetGroundLevel__Fff
/* A92C0 001A91C0 40938CE7 */  swc1       $f12, -0x6CC0($gp)
/* A92C4 001A91C4 44938DE7 */  swc1       $f13, -0x6CBC($gp)
/* A92C8 001A91C8 0800E003 */  jr         $31
/* A92CC 001A91CC 00000000 */   nop
