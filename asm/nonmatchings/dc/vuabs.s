.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel vuabs__FPf
/* 3B550 0013B450 000084D8 */  lqc2       $vf4, 0x0($4)
/* 3B554 0013B454 2A21C44B */  vmul.xyz   $vf4, $vf4, $vf4
/* 3B558 0013B458 3D23854B */  vmr32.xy   $vf5, $vf4
/* 3B55C 0013B45C 3D2B064B */  vmr32.x    $vf6, $vf5
/* 3B560 0013B460 E821054B */  vadd.x     $vf7, $vf4, $vf5
/* 3B564 0013B464 6831074B */  vadd.x     $vf5, $vf6, $vf7
/* 3B568 0013B468 BD03054A */  vsqrt      Q, $vf5x
/* 3B56C 0013B46C BF03004A */  vwaitq
/* 3B570 0013B470 00B04248 */  cfc2       $2, $vi22
/* 3B574 0013B474 00008244 */  mtc1       $2, $f0
/* 3B578 0013B478 0800E003 */  jr         $31
/* 3B57C 0013B47C 00000000 */   nop
