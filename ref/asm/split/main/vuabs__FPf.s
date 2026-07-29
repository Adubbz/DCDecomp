.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel vuabs__FPf
/* 03B550 0013B450 000084D8 */  lqc2        $vf4, 0x0($4)
/* 03B554 0013B454 2A21C44B */  vmul.xyz    $vf4, $vf4, $vf4
/* 03B558 0013B458 3D23854B */  vmr32.xy    $vf5, $vf4
/* 03B55C 0013B45C 3D2B064B */  vmr32.x     $vf6, $vf5
/* 03B560 0013B460 E821054B */  vadd.x      $vf7, $vf4, $vf5
/* 03B564 0013B464 6831074B */  vadd.x      $vf5, $vf6, $vf7
/* 03B568 0013B468 BD03054A */  .word       0x4A0503BD                   # vsqrt       $Q, $vf5x # 00000000 <InstrIdType: R5900_COP2_SPECIAL2>
/* 03B56C 0013B46C BF03004A */  vwaitq
/* 03B570 0013B470 00B04248 */  cfc2.ni     $2, $vi22
/* 03B574 0013B474 00008244 */  mtc1        $2, $f0
/* 03B578 0013B478 0800E003 */  jr          $31
/* 03B57C 0013B47C 00000000 */   nop
