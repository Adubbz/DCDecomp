.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishingSetGroundLevel__Fff
/* 0A92C0 001A91C0 40938CE7 */  swc1        $f12, -0x6CC0($28)
/* 0A92C4 001A91C4 44938DE7 */  swc1        $f13, -0x6CBC($28)
/* 0A92C8 001A91C8 0800E003 */  jr          $31
/* 0A92CC 001A91CC 00000000 */   nop
