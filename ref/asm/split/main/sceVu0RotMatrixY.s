.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sceVu0RotMatrixY
/* 021B98 00121A98 00008044 */  mtc1        $0, $f0
/* 021B9C 00121A9C 34600046 */  c.lt.s      $f12, $f0
/* 021BA0 00121AA0 C93F013C */  lui         $1, (0x3FC90FDB >> 16)
/* 021BA4 00121AA4 DB0F2134 */  ori         $1, $1, (0x3FC90FDB & 0xFFFF)
/* 021BA8 00121AA8 00008144 */  mtc1        $1, $f0
/* 021BAC 00121AAC 04000045 */  bc1f        _RotMatrixY_01
/* 021BB0 00121AB0 00000000 */   nop
/* 021BB4 00121AB4 00030C46 */  add.s       $f12, $f0, $f12
/* 021BB8 00121AB8 B2860408 */  j           _RotMatrixY_02
/* 021BBC 00121ABC 01000724 */   addiu      $7, $0, 0x1
_RotMatrixY_01:
/* 021BC0 00121AC0 01030C46 */  sub.s       $f12, $f0, $f12
/* 021BC4 00121AC4 2D380000 */  daddu       $7, $0, $0
_RotMatrixY_02:
/* 021BC8 00121AC8 00600844 */  mfc1        $8, $f12
/* 021BCC 00121ACC 0030A848 */  qmtc2.ni    $8, $vf6
/* 021BD0 00121AD0 2D30E003 */  daddu       $6, $31, $0
/* 021BD4 00121AD4 3486040C */  jal         _sceVu0ecossin
/* 021BD8 00121AD8 00000000 */   nop
/* 021BDC 00121ADC 2DF8C000 */  daddu       $31, $6, $0
/* 021BE0 00121AE0 3C2BE64B */  vmove.xyzw  $vf6, $vf5
/* 021BE4 00121AE4 3C2BE74B */  vmove.xyzw  $vf7, $vf5
/* 021BE8 00121AE8 3C2BE84B */  vmove.xyzw  $vf8, $vf5
/* 021BEC 00121AEC 3C2BE94B */  vmove.xyzw  $vf9, $vf5
/* 021BF0 00121AF0 C329804A */  vaddw.y     $vf7, $vf5, $vf0w
/* 021BF4 00121AF4 432A204A */  vaddw.w     $vf9, $vf5, $vf0w
/* 021BF8 00121AF8 2C21644A */  vsub.zw     $vf4, $vf4, $vf4
/* 021BFC 00121AFC 8429444A */  vsubx.z     $vf6, $vf5, $vf4x
/* 021C00 00121B00 8129044B */  vaddy.x     $vf6, $vf5, $vf4y
/* 021C04 00121B04 002A044B */  vaddx.x     $vf8, $vf5, $vf4x
/* 021C08 00121B08 012A444A */  vaddy.z     $vf8, $vf5, $vf4y
/* 021C0C 00121B0C 04000724 */  addiu       $7, $0, 0x4
_loopRotMatrixY:
/* 021C10 00121B10 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 021C14 00121B14 BC31E44B */  vmulax.xyzw $ACC, $vf6, $vf4x
/* 021C18 00121B18 BD38E44B */  vmadday.xyzw $ACC, $vf7, $vf4y
/* 021C1C 00121B1C BE40E44B */  vmaddaz.xyzw $ACC, $vf8, $vf4z
/* 021C20 00121B20 4B49E44B */  vmaddw.xyzw $vf5, $vf9, $vf4w
/* 021C24 00121B24 000085F8 */  sqc2        $vf5, 0x0($4)
/* 021C28 00121B28 FFFFE720 */  addi        $7, $7, -0x1 /* handwritten instruction */
/* 021C2C 00121B2C 1000A520 */  addi        $5, $5, 0x10 /* handwritten instruction */
/* 021C30 00121B30 F7FF0714 */  bne         $0, $7, _loopRotMatrixY
/* 021C34 00121B34 10008420 */   addi       $4, $4, 0x10 /* handwritten instruction */
/* 021C38 00121B38 0800E003 */  jr          $31
/* 021C3C 00121B3C 00000000 */   nop
