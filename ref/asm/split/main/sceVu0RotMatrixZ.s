.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sceVu0RotMatrixZ
/* 021A48 00121948 00008044 */  mtc1        $0, $f0
/* 021A4C 0012194C 34600046 */  c.lt.s      $f12, $f0
/* 021A50 00121950 C93F013C */  lui         $1, (0x3FC90FDB >> 16)
/* 021A54 00121954 DB0F2134 */  ori         $1, $1, (0x3FC90FDB & 0xFFFF)
/* 021A58 00121958 00008144 */  mtc1        $1, $f0
/* 021A5C 0012195C 04000045 */  bc1f        _RotMatrixZ_01
/* 021A60 00121960 00000000 */   nop
/* 021A64 00121964 00030C46 */  add.s       $f12, $f0, $f12
/* 021A68 00121968 5E860408 */  j           _RotMatrixZ_02
/* 021A6C 0012196C 01000724 */   addiu      $7, $0, 0x1
_RotMatrixZ_01:
/* 021A70 00121970 01030C46 */  sub.s       $f12, $f0, $f12
/* 021A74 00121974 2D380000 */  daddu       $7, $0, $0
_RotMatrixZ_02:
/* 021A78 00121978 00600844 */  mfc1        $8, $f12
/* 021A7C 0012197C 0030A848 */  qmtc2.ni    $8, $vf6
/* 021A80 00121980 2D30E003 */  daddu       $6, $31, $0
/* 021A84 00121984 3486040C */  jal         _sceVu0ecossin
/* 021A88 00121988 00000000 */   nop
/* 021A8C 0012198C 2DF8C000 */  daddu       $31, $6, $0
/* 021A90 00121990 3C2BE64B */  vmove.xyzw  $vf6, $vf5
/* 021A94 00121994 3C2BE74B */  vmove.xyzw  $vf7, $vf5
/* 021A98 00121998 3C03E94B */  vmove.xyzw  $vf9, $vf0
/* 021A9C 0012199C 6C4AC94B */  vsub.xyz    $vf9, $vf9, $vf9
/* 021AA0 001219A0 3D4BE84B */  vmr32.xyzw  $vf8, $vf9
/* 021AA4 001219A4 2C21644A */  vsub.zw     $vf4, $vf4, $vf4
/* 021AA8 001219A8 8029844A */  vaddx.y     $vf6, $vf5, $vf4x
/* 021AAC 001219AC 8129044B */  vaddy.x     $vf6, $vf5, $vf4y
/* 021AB0 001219B0 C429044B */  vsubx.x     $vf7, $vf5, $vf4x
/* 021AB4 001219B4 C129844A */  vaddy.y     $vf7, $vf5, $vf4y
/* 021AB8 001219B8 04000724 */  addiu       $7, $0, 0x4
_loopRotMatrixZ:
/* 021ABC 001219BC 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 021AC0 001219C0 BC31E44B */  vmulax.xyzw $ACC, $vf6, $vf4x
/* 021AC4 001219C4 BD38E44B */  vmadday.xyzw $ACC, $vf7, $vf4y
/* 021AC8 001219C8 BE40E44B */  vmaddaz.xyzw $ACC, $vf8, $vf4z
/* 021ACC 001219CC 4B49E44B */  vmaddw.xyzw $vf5, $vf9, $vf4w
/* 021AD0 001219D0 000085F8 */  sqc2        $vf5, 0x0($4)
/* 021AD4 001219D4 FFFFE720 */  addi        $7, $7, -0x1 /* handwritten instruction */
/* 021AD8 001219D8 1000A520 */  addi        $5, $5, 0x10 /* handwritten instruction */
/* 021ADC 001219DC F7FF0714 */  bne         $0, $7, _loopRotMatrixZ
/* 021AE0 001219E0 10008420 */   addi       $4, $4, 0x10 /* handwritten instruction */
/* 021AE4 001219E4 0800E003 */  jr          $31
/* 021AE8 001219E8 00000000 */   nop
/* 021AEC 001219EC 00000000 */  nop
