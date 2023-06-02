.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel sceVu0RotMatrixY
/* 21B98 00121A98 00008044 */  mtc1       $0, $f0
/* 21B9C 00121A9C 34600046 */  c.lt.s     $f12, $f0
/* 21BA0 00121AA0 C93F013C */  lui        $at, (0x3FC90FDB >> 16)
/* 21BA4 00121AA4 DB0F2134 */  ori        $at, $at, (0x3FC90FDB & 0xFFFF)
/* 21BA8 00121AA8 00008144 */  mtc1       $at, $f0
/* 21BAC 00121AAC 04000045 */  bc1f       .L00121AC0
/* 21BB0 00121AB0 00000000 */   nop
/* 21BB4 00121AB4 00030C46 */  add.s      $f12, $f0, $f12
/* 21BB8 00121AB8 B2860408 */  j          .L00121AC8
/* 21BBC 00121ABC 01000724 */   addiu     $7, $0, 0x1
.L00121AC0:
/* 21BC0 00121AC0 01030C46 */  sub.s      $f12, $f0, $f12
/* 21BC4 00121AC4 2D380000 */  daddu      $7, $0, $0
.L00121AC8:
/* 21BC8 00121AC8 00600844 */  mfc1       $8, $f12
/* 21BCC 00121ACC 0030A848 */  qmtc2      $8, $vf6
/* 21BD0 00121AD0 2D30E003 */  daddu      $6, $31, $0
/* 21BD4 00121AD4 3486040C */  jal        _sceVu0ecossin
/* 21BD8 00121AD8 00000000 */   nop
/* 21BDC 00121ADC 2DF8C000 */  daddu      $31, $6, $0
/* 21BE0 00121AE0 3C2BE64B */  vmove.xyzw $vf6, $vf5
/* 21BE4 00121AE4 3C2BE74B */  vmove.xyzw $vf7, $vf5
/* 21BE8 00121AE8 3C2BE84B */  vmove.xyzw $vf8, $vf5
/* 21BEC 00121AEC 3C2BE94B */  vmove.xyzw $vf9, $vf5
/* 21BF0 00121AF0 C329804A */  vaddw.y    $vf7, $vf5, $vf0w
/* 21BF4 00121AF4 432A204A */  vaddw.w    $vf9, $vf5, $vf0w
/* 21BF8 00121AF8 2C21644A */  vsub.zw    $vf4, $vf4, $vf4
/* 21BFC 00121AFC 8429444A */  vsubx.z    $vf6, $vf5, $vf4x
/* 21C00 00121B00 8129044B */  vaddy.x    $vf6, $vf5, $vf4y
/* 21C04 00121B04 002A044B */  vaddx.x    $vf8, $vf5, $vf4x
/* 21C08 00121B08 012A444A */  vaddy.z    $vf8, $vf5, $vf4y
/* 21C0C 00121B0C 04000724 */  addiu      $7, $0, 0x4
.L00121B10:
/* 21C10 00121B10 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 21C14 00121B14 BC31E44B */  vmulax.xyzw ACC, $vf6, $vf4x
/* 21C18 00121B18 BD38E44B */  vmadday.xyzw ACC, $vf7, $vf4y
/* 21C1C 00121B1C BE40E44B */  vmaddaz.xyzw ACC, $vf8, $vf4z
/* 21C20 00121B20 4B49E44B */  vmaddw.xyzw $vf5, $vf9, $vf4w
/* 21C24 00121B24 000085F8 */  sqc2       $vf5, 0x0($4)
/* 21C28 00121B28 FFFFE720 */  addi       $7, $7, -0x1 # handwritten instruction
/* 21C2C 00121B2C 1000A520 */  addi       $5, $5, 0x10 # handwritten instruction
/* 21C30 00121B30 F7FF0714 */  bne        $0, $7, .L00121B10
/* 21C34 00121B34 10008420 */   addi      $4, $4, 0x10 # handwritten instruction
/* 21C38 00121B38 0800E003 */  jr         $31
/* 21C3C 00121B3C 00000000 */   nop
