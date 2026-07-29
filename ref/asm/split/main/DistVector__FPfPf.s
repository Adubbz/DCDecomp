.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DistVector__FPfPf
/* 023690 00123590 000082D8 */  lqc2        $vf2, 0x0($4)
/* 023694 00123594 0000A3D8 */  lqc2        $vf3, 0x0($5)
/* 023698 00123598 2C19C24B */  vsub.xyz    $vf4, $vf3, $vf2
/* 02369C 0012359C 2A21C44B */  vmul.xyz    $vf4, $vf4, $vf4
/* 0236A0 001235A0 3D23854B */  vmr32.xy    $vf5, $vf4
/* 0236A4 001235A4 3D2B064B */  vmr32.x     $vf6, $vf5
/* 0236A8 001235A8 E821054B */  vadd.x      $vf7, $vf4, $vf5
/* 0236AC 001235AC 6831074B */  vadd.x      $vf5, $vf6, $vf7
/* 0236B0 001235B0 BD03054A */  .word       0x4A0503BD                   # vsqrt       $Q, $vf5x # 00000000 <InstrIdType: R5900_COP2_SPECIAL2>
/* 0236B4 001235B4 BF03004A */  vwaitq
/* 0236B8 001235B8 00B04248 */  cfc2.ni     $2, $vi22
/* 0236BC 001235BC 00008244 */  mtc1        $2, $f0
/* 0236C0 001235C0 0800E003 */  jr          $31
/* 0236C4 001235C4 00000000 */   nop
/* 0236C8 001235C8 00000000 */  nop
/* 0236CC 001235CC 00000000 */  nop
