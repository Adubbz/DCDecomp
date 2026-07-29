.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGCalcColor__FPfPf
/* 02EA90 0012E990 7F43033C */  lui         $3, (0x437F0000 >> 16)
/* 02EA94 0012E994 000083AC */  sw          $3, 0x0($4)
/* 02EA98 0012E998 C701033C */  lui         $3, %hi(mgRenderInfo + 0x110)
/* 02EA9C 0012E99C 30566724 */  addiu       $7, $3, %lo(mgRenderInfo + 0x110)
/* 02EAA0 0012E9A0 C701033C */  lui         $3, %hi(mgRenderInfo + 0x150)
/* 02EAA4 0012E9A4 70566624 */  addiu       $6, $3, %lo(mgRenderInfo + 0x150)
/* 02EAA8 0012E9A8 C701033C */  lui         $3, %hi(mgRenderInfo + 0x190)
/* 02EAAC 0012E9AC B0566324 */  addiu       $3, $3, %lo(mgRenderInfo + 0x190)
/* 02EAB0 0012E9B0 000094D8 */  lqc2        $vf20, 0x0($4)
/* 02EAB4 0012E9B4 0000AAD8 */  lqc2        $vf10, 0x0($5)
/* 02EAB8 0012E9B8 0000E1D8 */  lqc2        $vf1, 0x0($7)
/* 02EABC 0012E9BC 1000E2D8 */  lqc2        $vf2, 0x10($7)
/* 02EAC0 0012E9C0 2000E3D8 */  lqc2        $vf3, 0x20($7)
/* 02EAC4 0012E9C4 0000C5D8 */  lqc2        $vf5, 0x0($6)
/* 02EAC8 0012E9C8 1000C6D8 */  lqc2        $vf6, 0x10($6)
/* 02EACC 0012E9CC 2000C7D8 */  lqc2        $vf7, 0x20($6)
/* 02EAD0 0012E9D0 3000C8D8 */  lqc2        $vf8, 0x30($6)
/* 02EAD4 0012E9D4 000069D8 */  lqc2        $vf9, 0x0($3)
/* 02EAD8 0012E9D8 BC09EA4B */  vmulax.xyzw $ACC, $vf1, $vf10x
/* 02EADC 0012E9DC BD10EA4B */  vmadday.xyzw $ACC, $vf2, $vf10y
/* 02EAE0 0012E9E0 CA1AEA4B */  vmaddz.xyzw $vf11, $vf3, $vf10z
/* 02EAE4 0012E9E4 FF02004A */  vnop
/* 02EAE8 0012E9E8 FF02004A */  vnop
/* 02EAEC 0012E9EC FF02004A */  vnop
/* 02EAF0 0012E9F0 105BE04B */  vmaxx.xyzw  $vf12, $vf11, $vf0x
/* 02EAF4 0012E9F4 FF02004A */  vnop
/* 02EAF8 0012E9F8 FF02004A */  vnop
/* 02EAFC 0012E9FC BF49E04B */  vmulaw.xyzw $ACC, $vf9, $vf0w
/* 02EB00 0012EA00 BC28EC4B */  vmaddax.xyzw $ACC, $vf5, $vf12x
/* 02EB04 0012EA04 BD30EC4B */  vmadday.xyzw $ACC, $vf6, $vf12y
/* 02EB08 0012EA08 BE38EC4B */  vmaddaz.xyzw $ACC, $vf7, $vf12z
/* 02EB0C 0012EA0C 4B43EC4B */  vmaddw.xyzw $vf13, $vf8, $vf12w
/* 02EB10 0012EA10 FF02004A */  vnop
/* 02EB14 0012EA14 FF02004A */  vnop
/* 02EB18 0012EA18 FF02004A */  vnop
/* 02EB1C 0012EA1C 946BF44B */  vminix.xyzw $vf14, $vf13, $vf20x
/* 02EB20 0012EA20 FF02004A */  vnop
/* 02EB24 0012EA24 FF02004A */  vnop
/* 02EB28 0012EA28 FF02004A */  vnop
/* 02EB2C 0012EA2C 00008EF8 */  sqc2        $vf14, 0x0($4)
/* 02EB30 0012EA30 0800E003 */  jr          $31
/* 02EB34 0012EA34 00000000 */   nop
/* 02EB38 0012EA38 00000000 */  nop
/* 02EB3C 0012EA3C 00000000 */  nop
