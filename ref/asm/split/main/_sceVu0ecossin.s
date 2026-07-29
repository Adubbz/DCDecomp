.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _sceVu0ecossin
/* 0219D0 001218D0 2500083C */  lui         $8, %hi(S5432)
/* 0219D4 001218D4 F00A0825 */  addiu       $8, $8, %lo(S5432)
/* 0219D8 001218D8 000005D9 */  lqc2        $vf5, 0x0($8)
/* 0219DC 001218DC 3D33264A */  vmr32.w     $vf6, $vf6
/* 0219E0 001218E0 0001064B */  vaddx.x     $vf4, $vf0, $vf6x
/* 0219E4 001218E4 AA31064B */  vmul.x      $vf6, $vf6, $vf6
/* 0219E8 001218E8 1821E04A */  vmulx.yzw   $vf4, $vf4, $vf0x
/* 0219EC 001218EC 1B2AE64B */  vmulw.xyzw  $vf8, $vf5, $vf6w
/* 0219F0 001218F0 6C01E04B */  vsub.xyzw   $vf5, $vf0, $vf0
/* 0219F4 001218F4 1842E64B */  vmulx.xyzw  $vf8, $vf8, $vf6x
/* 0219F8 001218F8 1842C64B */  vmulx.xyz   $vf8, $vf8, $vf6x
/* 0219FC 001218FC 0321084B */  vaddw.x     $vf4, $vf4, $vf8w
/* 021A00 00121900 1842864B */  vmulx.xy    $vf8, $vf8, $vf6x
/* 021A04 00121904 0221084B */  vaddz.x     $vf4, $vf4, $vf8z
/* 021A08 00121908 1842064B */  vmulx.x     $vf8, $vf8, $vf6x
/* 021A0C 0012190C 0121084B */  vaddy.x     $vf4, $vf4, $vf8y
/* 021A10 00121910 0021084B */  vaddx.x     $vf4, $vf4, $vf8x
/* 021A14 00121914 0029844B */  vaddx.xy    $vf4, $vf5, $vf4x
/* 021A18 00121918 EA21044B */  vmul.x      $vf7, $vf4, $vf4
/* 021A1C 0012191C C401274A */  vsubx.w     $vf7, $vf0, $vf7x
/* 021A20 00121920 BD03874B */  .word       0x4B8703BD                   # vsqrt       $Q, $vf7w # 00000000 <InstrIdType: R5900_COP2_SPECIAL2>
/* 021A24 00121924 BF03004A */  vwaitq
/* 021A28 00121928 0300E014 */  bnez        $7, _ecossin_01
/* 021A2C 0012192C E001004B */   vaddq.x    $vf7, $vf0, $Q
/* 021A30 00121930 02000010 */  b           _ecossin_02
/* 021A34 00121934 0029074B */   vaddx.x    $vf4, $vf5, $vf7x
_ecossin_01:
/* 021A38 00121938 0429074B */  vsubx.x     $vf4, $vf5, $vf7x
_ecossin_02:
/* 021A3C 0012193C 0800E003 */  jr          $31
/* 021A40 00121940 00000000 */   nop
/* 021A44 00121944 00000000 */  nop
