.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DistVector__FPf
/* 023660 00123560 000084D8 */  lqc2        $vf4, 0x0($4)
/* 023664 00123564 2A21C44B */  vmul.xyz    $vf4, $vf4, $vf4
/* 023668 00123568 3D23854B */  vmr32.xy    $vf5, $vf4
/* 02366C 0012356C 3D2B064B */  vmr32.x     $vf6, $vf5
/* 023670 00123570 E821054B */  vadd.x      $vf7, $vf4, $vf5
/* 023674 00123574 6831074B */  vadd.x      $vf5, $vf6, $vf7
/* 023678 00123578 BD03054A */  .word       0x4A0503BD                   # vsqrt       $Q, $vf5x # 00000000 <InstrIdType: R5900_COP2_SPECIAL2>
/* 02367C 0012357C BF03004A */  vwaitq
/* 023680 00123580 00B04248 */  cfc2.ni     $2, $vi22
/* 023684 00123584 00008244 */  mtc1        $2, $f0
/* 023688 00123588 0800E003 */  jr          $31
/* 02368C 0012358C 00000000 */   nop
