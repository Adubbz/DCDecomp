.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGCalcColor__FPfPf
/* 2EA90 0012E990 7F43033C */  lui        $3, (0x437F0000 >> 16)
/* 2EA94 0012E994 000083AC */  sw         $3, 0x0($4)
/* 2EA98 0012E998 C701033C */  lui        $3, %hi(D_1C75630)
/* 2EA9C 0012E99C 30566724 */  addiu      $7, $3, %lo(D_1C75630)
/* 2EAA0 0012E9A0 C701033C */  lui        $3, %hi(D_1C75670)
/* 2EAA4 0012E9A4 70566624 */  addiu      $6, $3, %lo(D_1C75670)
/* 2EAA8 0012E9A8 C701033C */  lui        $3, %hi(D_1C756B0)
/* 2EAAC 0012E9AC B0566324 */  addiu      $3, $3, %lo(D_1C756B0)
/* 2EAB0 0012E9B0 000094D8 */  lqc2       $vf20, 0x0($4)
/* 2EAB4 0012E9B4 0000AAD8 */  lqc2       $vf10, 0x0($5)
/* 2EAB8 0012E9B8 0000E1D8 */  lqc2       $vf1, 0x0($7)
/* 2EABC 0012E9BC 1000E2D8 */  lqc2       $vf2, 0x10($7)
/* 2EAC0 0012E9C0 2000E3D8 */  lqc2       $vf3, 0x20($7)
/* 2EAC4 0012E9C4 0000C5D8 */  lqc2       $vf5, 0x0($6)
/* 2EAC8 0012E9C8 1000C6D8 */  lqc2       $vf6, 0x10($6)
/* 2EACC 0012E9CC 2000C7D8 */  lqc2       $vf7, 0x20($6)
/* 2EAD0 0012E9D0 3000C8D8 */  lqc2       $vf8, 0x30($6)
/* 2EAD4 0012E9D4 000069D8 */  lqc2       $vf9, 0x0($3)
/* 2EAD8 0012E9D8 BC09EA4B */  vmulax.xyzw ACC, $vf1, $vf10x
/* 2EADC 0012E9DC BD10EA4B */  vmadday.xyzw ACC, $vf2, $vf10y
/* 2EAE0 0012E9E0 CA1AEA4B */  vmaddz.xyzw $vf11, $vf3, $vf10z
/* 2EAE4 0012E9E4 FF02004A */  vnop
/* 2EAE8 0012E9E8 FF02004A */  vnop
/* 2EAEC 0012E9EC FF02004A */  vnop
/* 2EAF0 0012E9F0 105BE04B */  vmaxx.xyzw $vf12, $vf11, $vf0x
/* 2EAF4 0012E9F4 FF02004A */  vnop
/* 2EAF8 0012E9F8 FF02004A */  vnop
/* 2EAFC 0012E9FC BF49E04B */  vmulaw.xyzw ACC, $vf9, $vf0w
/* 2EB00 0012EA00 BC28EC4B */  vmaddax.xyzw ACC, $vf5, $vf12x
/* 2EB04 0012EA04 BD30EC4B */  vmadday.xyzw ACC, $vf6, $vf12y
/* 2EB08 0012EA08 BE38EC4B */  vmaddaz.xyzw ACC, $vf7, $vf12z
/* 2EB0C 0012EA0C 4B43EC4B */  vmaddw.xyzw $vf13, $vf8, $vf12w
/* 2EB10 0012EA10 FF02004A */  vnop
/* 2EB14 0012EA14 FF02004A */  vnop
/* 2EB18 0012EA18 FF02004A */  vnop
/* 2EB1C 0012EA1C 946BF44B */  vminix.xyzw $vf14, $vf13, $vf20x
/* 2EB20 0012EA20 FF02004A */  vnop
/* 2EB24 0012EA24 FF02004A */  vnop
/* 2EB28 0012EA28 FF02004A */  vnop
/* 2EB2C 0012EA2C 00008EF8 */  sqc2       $vf14, 0x0($4)
/* 2EB30 0012EA30 0800E003 */  jr         $31
/* 2EB34 0012EA34 00000000 */   nop
/* 2EB38 0012EA38 00000000 */  nop
/* 2EB3C 0012EA3C 00000000 */  nop
