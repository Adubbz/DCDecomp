.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel sceVu0RotMatrixX
/* 21AF0 001219F0 00008044 */  mtc1       $0, $f0
/* 21AF4 001219F4 34600046 */  c.lt.s     $f12, $f0
/* 21AF8 001219F8 C93F013C */  lui        $at, (0x3FC90FDB >> 16)
/* 21AFC 001219FC DB0F2134 */  ori        $at, $at, (0x3FC90FDB & 0xFFFF)
/* 21B00 00121A00 00008144 */  mtc1       $at, $f0
/* 21B04 00121A04 04000045 */  bc1f       .L00121A18
/* 21B08 00121A08 00000000 */   nop
/* 21B0C 00121A0C 00030C46 */  add.s      $f12, $f0, $f12
/* 21B10 00121A10 88860408 */  j          .L00121A20
/* 21B14 00121A14 01000724 */   addiu     $7, $0, 0x1
.L00121A18:
/* 21B18 00121A18 01030C46 */  sub.s      $f12, $f0, $f12
/* 21B1C 00121A1C 2D380000 */  daddu      $7, $0, $0
.L00121A20:
/* 21B20 00121A20 00600844 */  mfc1       $8, $f12
/* 21B24 00121A24 0030A848 */  qmtc2      $8, $vf6
/* 21B28 00121A28 2D30E003 */  daddu      $6, $31, $0
/* 21B2C 00121A2C 3486040C */  jal        _sceVu0ecossin
/* 21B30 00121A30 00000000 */   nop
/* 21B34 00121A34 2DF8C000 */  daddu      $31, $6, $0
/* 21B38 00121A38 3C2BE64B */  vmove.xyzw $vf6, $vf5
/* 21B3C 00121A3C 3C2BE74B */  vmove.xyzw $vf7, $vf5
/* 21B40 00121A40 3C2BE84B */  vmove.xyzw $vf8, $vf5
/* 21B44 00121A44 3C2BE94B */  vmove.xyzw $vf9, $vf5
/* 21B48 00121A48 8329004B */  vaddw.x    $vf6, $vf5, $vf0w
/* 21B4C 00121A4C 432A204A */  vaddw.w    $vf9, $vf5, $vf0w
/* 21B50 00121A50 2C21644A */  vsub.zw    $vf4, $vf4, $vf4
/* 21B54 00121A54 C029444A */  vaddx.z    $vf7, $vf5, $vf4x
/* 21B58 00121A58 C129844A */  vaddy.y    $vf7, $vf5, $vf4y
/* 21B5C 00121A5C 042A844A */  vsubx.y    $vf8, $vf5, $vf4x
/* 21B60 00121A60 012A444A */  vaddy.z    $vf8, $vf5, $vf4y
/* 21B64 00121A64 04000724 */  addiu      $7, $0, 0x4
.L00121A68:
/* 21B68 00121A68 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 21B6C 00121A6C BC31E44B */  vmulax.xyzw ACC, $vf6, $vf4x
/* 21B70 00121A70 BD38E44B */  vmadday.xyzw ACC, $vf7, $vf4y
/* 21B74 00121A74 BE40E44B */  vmaddaz.xyzw ACC, $vf8, $vf4z
/* 21B78 00121A78 4B49E44B */  vmaddw.xyzw $vf5, $vf9, $vf4w
/* 21B7C 00121A7C 000085F8 */  sqc2       $vf5, 0x0($4)
/* 21B80 00121A80 FFFFE720 */  addi       $7, $7, -0x1 # handwritten instruction
/* 21B84 00121A84 1000A520 */  addi       $5, $5, 0x10 # handwritten instruction
/* 21B88 00121A88 F7FF0714 */  bne        $0, $7, .L00121A68
/* 21B8C 00121A8C 10008420 */   addi      $4, $4, 0x10 # handwritten instruction
/* 21B90 00121A90 0800E003 */  jr         $31
/* 21B94 00121A94 00000000 */   nop
