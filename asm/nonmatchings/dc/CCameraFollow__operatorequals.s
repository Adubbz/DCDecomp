.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __as__13CCameraFollowFRC13CCameraFollow
/* 24BA0 00124AA0 C002A0C4 */  lwc1       $f0, 0x2C0($5)
/* 24BA4 00124AA4 C00280E4 */  swc1       $f0, 0x2C0($4)
/* 24BA8 00124AA8 C402A0C4 */  lwc1       $f0, 0x2C4($5)
/* 24BAC 00124AAC C40280E4 */  swc1       $f0, 0x2C4($4)
/* 24BB0 00124AB0 C802A0C4 */  lwc1       $f0, 0x2C8($5)
/* 24BB4 00124AB4 C80280E4 */  swc1       $f0, 0x2C8($4)
/* 24BB8 00124AB8 CC02A0C4 */  lwc1       $f0, 0x2CC($5)
/* 24BBC 00124ABC CC0280E4 */  swc1       $f0, 0x2CC($4)
/* 24BC0 00124AC0 D002A0C4 */  lwc1       $f0, 0x2D0($5)
/* 24BC4 00124AC4 D00280E4 */  swc1       $f0, 0x2D0($4)
/* 24BC8 00124AC8 D402A0C4 */  lwc1       $f0, 0x2D4($5)
/* 24BCC 00124ACC D40280E4 */  swc1       $f0, 0x2D4($4)
/* 24BD0 00124AD0 28168070 */  paddub     $2, $4, $0
/* 24BD4 00124AD4 0800E003 */  jr         $31
/* 24BD8 00124AD8 00000000 */   nop
/* 24BDC 00124ADC 00000000 */  nop
