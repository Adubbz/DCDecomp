.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DistVector__FPfPf
/* 23690 00123590 000082D8 */  lqc2       $vf2, 0x0($4)
/* 23694 00123594 0000A3D8 */  lqc2       $vf3, 0x0($5)
/* 23698 00123598 2C19C24B */  vsub.xyz   $vf4, $vf3, $vf2
/* 2369C 0012359C 2A21C44B */  vmul.xyz   $vf4, $vf4, $vf4
/* 236A0 001235A0 3D23854B */  vmr32.xy   $vf5, $vf4
/* 236A4 001235A4 3D2B064B */  vmr32.x    $vf6, $vf5
/* 236A8 001235A8 E821054B */  vadd.x     $vf7, $vf4, $vf5
/* 236AC 001235AC 6831074B */  vadd.x     $vf5, $vf6, $vf7
/* 236B0 001235B0 BD03054A */  vsqrt      Q, $vf5x
/* 236B4 001235B4 BF03004A */  vwaitq
/* 236B8 001235B8 00B04248 */  cfc2       $2, $vi22
/* 236BC 001235BC 00008244 */  mtc1       $2, $f0
/* 236C0 001235C0 0800E003 */  jr         $31
/* 236C4 001235C4 00000000 */   nop
/* 236C8 001235C8 00000000 */  nop
/* 236CC 001235CC 00000000 */  nop
