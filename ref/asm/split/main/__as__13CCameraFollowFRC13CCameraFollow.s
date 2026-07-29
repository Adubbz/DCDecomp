.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __as__13CCameraFollowFRC13CCameraFollow
/* 024BA0 00124AA0 C002A0C4 */  lwc1        $f0, 0x2C0($5)
/* 024BA4 00124AA4 C00280E4 */  swc1        $f0, 0x2C0($4)
/* 024BA8 00124AA8 C402A0C4 */  lwc1        $f0, 0x2C4($5)
/* 024BAC 00124AAC C40280E4 */  swc1        $f0, 0x2C4($4)
/* 024BB0 00124AB0 C802A0C4 */  lwc1        $f0, 0x2C8($5)
/* 024BB4 00124AB4 C80280E4 */  swc1        $f0, 0x2C8($4)
/* 024BB8 00124AB8 CC02A0C4 */  lwc1        $f0, 0x2CC($5)
/* 024BBC 00124ABC CC0280E4 */  swc1        $f0, 0x2CC($4)
/* 024BC0 00124AC0 D002A0C4 */  lwc1        $f0, 0x2D0($5)
/* 024BC4 00124AC4 D00280E4 */  swc1        $f0, 0x2D0($4)
/* 024BC8 00124AC8 D402A0C4 */  lwc1        $f0, 0x2D4($5)
/* 024BCC 00124ACC D40280E4 */  swc1        $f0, 0x2D4($4)
/* 024BD0 00124AD0 28168070 */  paddub      $2, $4, $0
/* 024BD4 00124AD4 0800E003 */  jr          $31
/* 024BD8 00124AD8 00000000 */   nop
/* 024BDC 00124ADC 00000000 */  nop
