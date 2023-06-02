.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DistVector__FPf
/* 23660 00123560 000084D8 */  lqc2       $vf4, 0x0($4)
/* 23664 00123564 2A21C44B */  vmul.xyz   $vf4, $vf4, $vf4
/* 23668 00123568 3D23854B */  vmr32.xy   $vf5, $vf4
/* 2366C 0012356C 3D2B064B */  vmr32.x    $vf6, $vf5
/* 23670 00123570 E821054B */  vadd.x     $vf7, $vf4, $vf5
/* 23674 00123574 6831074B */  vadd.x     $vf5, $vf6, $vf7
/* 23678 00123578 BD03054A */  vsqrt      Q, $vf5x
/* 2367C 0012357C BF03004A */  vwaitq
/* 23680 00123580 00B04248 */  cfc2       $2, $vi22
/* 23684 00123584 00008244 */  mtc1       $2, $f0
/* 23688 00123588 0800E003 */  jr         $31
/* 2368C 0012358C 00000000 */   nop
