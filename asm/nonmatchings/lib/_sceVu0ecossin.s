.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sceVu0ecossin
/* 219D0 001218D0 2500083C */  lui        $8, %hi(D_00250AF0)
/* 219D4 001218D4 F00A0825 */  addiu      $8, $8, %lo(D_00250AF0)
/* 219D8 001218D8 000005D9 */  lqc2       $vf5, 0x0($8)
/* 219DC 001218DC 3D33264A */  vmr32.w    $vf6, $vf6
/* 219E0 001218E0 0001064B */  vaddx.x    $vf4, $vf0, $vf6x
/* 219E4 001218E4 AA31064B */  vmul.x     $vf6, $vf6, $vf6
/* 219E8 001218E8 1821E04A */  vmulx.yzw  $vf4, $vf4, $vf0x
/* 219EC 001218EC 1B2AE64B */  vmulw.xyzw $vf8, $vf5, $vf6w
/* 219F0 001218F0 6C01E04B */  vsub.xyzw  $vf5, $vf0, $vf0
/* 219F4 001218F4 1842E64B */  vmulx.xyzw $vf8, $vf8, $vf6x
/* 219F8 001218F8 1842C64B */  vmulx.xyz  $vf8, $vf8, $vf6x
/* 219FC 001218FC 0321084B */  vaddw.x    $vf4, $vf4, $vf8w
/* 21A00 00121900 1842864B */  vmulx.xy   $vf8, $vf8, $vf6x
/* 21A04 00121904 0221084B */  vaddz.x    $vf4, $vf4, $vf8z
/* 21A08 00121908 1842064B */  vmulx.x    $vf8, $vf8, $vf6x
/* 21A0C 0012190C 0121084B */  vaddy.x    $vf4, $vf4, $vf8y
/* 21A10 00121910 0021084B */  vaddx.x    $vf4, $vf4, $vf8x
/* 21A14 00121914 0029844B */  vaddx.xy   $vf4, $vf5, $vf4x
/* 21A18 00121918 EA21044B */  vmul.x     $vf7, $vf4, $vf4
/* 21A1C 0012191C C401274A */  vsubx.w    $vf7, $vf0, $vf7x
/* 21A20 00121920 BD03874B */  vsqrt      Q, $vf7w
/* 21A24 00121924 BF03004A */  vwaitq
/* 21A28 00121928 0300E014 */  bnez       $7, .L00121938
/* 21A2C 0012192C E001004B */   vaddq.x   $vf7, $vf0, Q
/* 21A30 00121930 02000010 */  b          .L0012193C
/* 21A34 00121934 0029074B */   vaddx.x   $vf4, $vf5, $vf7x
.L00121938:
/* 21A38 00121938 0429074B */  vsubx.x    $vf4, $vf5, $vf7x
.L0012193C:
/* 21A3C 0012193C 0800E003 */  jr         $31
/* 21A40 00121940 00000000 */   nop
/* 21A44 00121944 00000000 */  nop
