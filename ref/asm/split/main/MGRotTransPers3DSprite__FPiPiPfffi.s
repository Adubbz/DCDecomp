.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGRotTransPers3DSprite__FPiPiPfffi
/* 02E840 0012E740 E0FFBD27 */  addiu       $29, $29, -0x20
/* 02E844 0012E744 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 02E848 0012E748 00108244 */  mtc1        $2, $f2
/* 02E84C 0012E74C 00000000 */  nop
/* 02E850 0012E750 42100C46 */  mul.s       $f1, $f2, $f12
/* 02E854 0012E754 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 02E858 0012E758 C05620C4 */  lwc1        $f0, %lo(mgRenderInfo + 0x1A0)($1)
/* 02E85C 0012E75C 02080046 */  mul.s       $f0, $f1, $f0
/* 02E860 0012E760 0000A0E7 */  swc1        $f0, 0x0($29)
/* 02E864 0012E764 42100D46 */  mul.s       $f1, $f2, $f13
/* 02E868 0012E768 C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A4)
/* 02E86C 0012E76C C45620C4 */  lwc1        $f0, %lo(mgRenderInfo + 0x1A4)($1)
/* 02E870 0012E770 02080046 */  mul.s       $f0, $f1, $f0
/* 02E874 0012E774 0400A0E7 */  swc1        $f0, 0x4($29)
/* 02E878 0012E778 3400E014 */  bnez        $7, .L0012E84C
/* 02E87C 0012E77C 00000000 */   nop
/* 02E880 0012E780 C701023C */  lui         $2, %hi(mgRenderInfo + 0xD0)
/* 02E884 0012E784 F0554324 */  addiu       $3, $2, %lo(mgRenderInfo + 0xD0)
/* 02E888 0012E788 0000A227 */  addiu       $2, $29, 0x0
/* 02E88C 0012E78C 000061D8 */  lqc2        $vf1, 0x0($3)
/* 02E890 0012E790 100062D8 */  lqc2        $vf2, 0x10($3)
/* 02E894 0012E794 200063D8 */  lqc2        $vf3, 0x20($3)
/* 02E898 0012E798 300064D8 */  lqc2        $vf4, 0x30($3)
/* 02E89C 0012E79C 0000C5D8 */  lqc2        $vf5, 0x0($6)
/* 02E8A0 0012E7A0 000046D8 */  lqc2        $vf6, 0x0($2)
/* 02E8A4 0012E7A4 BC09E54B */  vmulax.xyzw $ACC, $vf1, $vf5x
/* 02E8A8 0012E7A8 BD10E54B */  vmadday.xyzw $ACC, $vf2, $vf5y
/* 02E8AC 0012E7AC BE18E54B */  vmaddaz.xyzw $ACC, $vf3, $vf5z
/* 02E8B0 0012E7B0 8B22E54B */  vmaddw.xyzw $vf10, $vf4, $vf5w
/* 02E8B4 0012E7B4 BC03EA4B */  vdiv        $Q, $vf0w, $vf10w
/* 02E8B8 0012E7B8 BF03004A */  vwaitq
/* 02E8BC 0012E7BC 9C52C04B */  vmulq.xyz   $vf10, $vf10, $Q
/* 02E8C0 0012E7C0 9C31804B */  vmulq.xy    $vf6, $vf6, $Q
/* 02E8C4 0012E7C4 3C53EB4B */  vmove.xyzw  $vf11, $vf10
/* 02E8C8 0012E7C8 3C53EC4B */  vmove.xyzw  $vf12, $vf10
/* 02E8CC 0012E7CC EC5A864B */  vsub.xy     $vf11, $vf11, $vf6
/* 02E8D0 0012E7D0 2863864B */  vadd.xy     $vf12, $vf12, $vf6
/* 02E8D4 0012E7D4 2C05E04B */  vsub.xyzw   $vf20, $vf0, $vf0
/* 02E8D8 0012E7D8 80450234 */  ori         $2, $0, 0x4580
/* 02E8DC 0012E7DC 38140200 */  dsll        $2, $2, 16
/* 02E8E0 0012E7E0 38140200 */  dsll        $2, $2, 16
/* 02E8E4 0012E7E4 80454234 */  ori         $2, $2, 0x4580
/* 02E8E8 0012E7E8 38140200 */  dsll        $2, $2, 16
/* 02E8EC 0012E7EC 00A8A248 */  qmtc2.ni    $2, $vf21
/* 02E8F0 0012E7F0 0080C048 */  ctc2.ni     $0, $vi16
/* 02E8F4 0012E7F4 6C5EB44B */  vsub.xyw    $vf25, $vf11, $vf20
/* 02E8F8 0012E7F8 6CAE8B4B */  vsub.xy     $vf25, $vf21, $vf11
/* 02E8FC 0012E7FC 6C66B44B */  vsub.xyw    $vf25, $vf12, $vf20
/* 02E900 0012E800 6CAE8C4B */  vsub.xy     $vf25, $vf21, $vf12
/* 02E904 0012E804 FF02004A */  vnop
/* 02E908 0012E808 FF02004A */  vnop
/* 02E90C 0012E80C FF02004A */  vnop
/* 02E910 0012E810 FF02004A */  vnop
/* 02E914 0012E814 FF02004A */  vnop
/* 02E918 0012E818 00804248 */  cfc2.ni     $2, $vi16
/* 02E91C 0012E81C C0004230 */  andi        $2, $2, 0xC0
/* 02E920 0012E820 7D598B4B */  vftoi4.xy   $vf11, $vf11
/* 02E924 0012E824 7C594B4A */  vftoi0.z    $vf11, $vf11
/* 02E928 0012E828 7D618C4B */  vftoi4.xy   $vf12, $vf12
/* 02E92C 0012E82C 7C614C4A */  vftoi0.z    $vf12, $vf12
/* 02E930 0012E830 00008BF8 */  sqc2        $vf11, 0x0($4)
/* 02E934 0012E834 0000ACF8 */  sqc2        $vf12, 0x0($5)
/* 02E938 0012E838 2B100200 */  sltu        $2, $0, $2
/* 02E93C 0012E83C 01004238 */  xori        $2, $2, 0x1
/* 02E940 0012E840 FF004230 */  andi        $2, $2, 0xFF
/* 02E944 0012E844 4A000010 */  b           .L0012E970
/* 02E948 0012E848 00000000 */   nop
.L0012E84C:
/* 02E94C 0012E84C 2500023C */  lui         $2, %hi(LIT_550)
/* 02E950 0012E850 600B4224 */  addiu       $2, $2, %lo(LIT_550)
/* 02E954 0012E854 1000A327 */  addiu       $3, $29, 0x10
/* 02E958 0012E858 00004278 */  lq          $2, 0x0($2)
/* 02E95C 0012E85C 0000627C */  sq          $2, 0x0($3)
/* 02E960 0012E860 C701013C */  lui         $1, %hi(mgRenderInfo + 0x328)
/* 02E964 0012E864 485820C4 */  lwc1        $f0, %lo(mgRenderInfo + 0x328)($1)
/* 02E968 0012E868 1000A0E7 */  swc1        $f0, 0x10($29)
/* 02E96C 0012E86C C701013C */  lui         $1, %hi(mgRenderInfo + 0x334)
/* 02E970 0012E870 545820C4 */  lwc1        $f0, %lo(mgRenderInfo + 0x334)($1)
/* 02E974 0012E874 1400A0E7 */  swc1        $f0, 0x14($29)
/* 02E978 0012E878 C701013C */  lui         $1, %hi(mgRenderInfo + 0x330)
/* 02E97C 0012E87C 505820C4 */  lwc1        $f0, %lo(mgRenderInfo + 0x330)($1)
/* 02E980 0012E880 1800A0E7 */  swc1        $f0, 0x18($29)
/* 02E984 0012E884 C701013C */  lui         $1, %hi(mgRenderInfo + 0x32C)
/* 02E988 0012E888 4C5820C4 */  lwc1        $f0, %lo(mgRenderInfo + 0x32C)($1)
/* 02E98C 0012E88C 1C00A0E7 */  swc1        $f0, 0x1C($29)
/* 02E990 0012E890 C701023C */  lui         $2, %hi(mgRenderInfo + 0xD0)
/* 02E994 0012E894 F0554724 */  addiu       $7, $2, %lo(mgRenderInfo + 0xD0)
/* 02E998 0012E898 0000A227 */  addiu       $2, $29, 0x0
/* 02E99C 0012E89C 0000E1D8 */  lqc2        $vf1, 0x0($7)
/* 02E9A0 0012E8A0 1000E2D8 */  lqc2        $vf2, 0x10($7)
/* 02E9A4 0012E8A4 2000E3D8 */  lqc2        $vf3, 0x20($7)
/* 02E9A8 0012E8A8 3000E4D8 */  lqc2        $vf4, 0x30($7)
/* 02E9AC 0012E8AC 0000C5D8 */  lqc2        $vf5, 0x0($6)
/* 02E9B0 0012E8B0 000046D8 */  lqc2        $vf6, 0x0($2)
/* 02E9B4 0012E8B4 000067D8 */  lqc2        $vf7, 0x0($3)
/* 02E9B8 0012E8B8 BC09E54B */  vmulax.xyzw $ACC, $vf1, $vf5x
/* 02E9BC 0012E8BC BD10E54B */  vmadday.xyzw $ACC, $vf2, $vf5y
/* 02E9C0 0012E8C0 BE18E54B */  vmaddaz.xyzw $ACC, $vf3, $vf5z
/* 02E9C4 0012E8C4 8B22E54B */  vmaddw.xyzw $vf10, $vf4, $vf5w
/* 02E9C8 0012E8C8 BC03EA4B */  vdiv        $Q, $vf0w, $vf10w
/* 02E9CC 0012E8CC BF03004A */  vwaitq
/* 02E9D0 0012E8D0 9C52C04B */  vmulq.xyz   $vf10, $vf10, $Q
/* 02E9D4 0012E8D4 9C31804B */  vmulq.xy    $vf6, $vf6, $Q
/* 02E9D8 0012E8D8 BC01274A */  vmulax.w    $ACC, $vf0, $vf7x
/* 02E9DC 0012E8DC E13F204A */  vmaddq.w    $vf31, $vf7, $Q
/* 02E9E0 0012E8E0 D5FF274A */  vminiy.w    $vf31, $vf31, $vf7y
/* 02E9E4 0012E8E4 D2FF274A */  vmaxz.w     $vf31, $vf31, $vf7z
/* 02E9E8 0012E8E8 3C53EB4B */  vmove.xyzw  $vf11, $vf10
/* 02E9EC 0012E8EC 3C53EC4B */  vmove.xyzw  $vf12, $vf10
/* 02E9F0 0012E8F0 EC5A864B */  vsub.xy     $vf11, $vf11, $vf6
/* 02E9F4 0012E8F4 2863864B */  vadd.xy     $vf12, $vf12, $vf6
/* 02E9F8 0012E8F8 2C05E04B */  vsub.xyzw   $vf20, $vf0, $vf0
/* 02E9FC 0012E8FC 80450234 */  ori         $2, $0, 0x4580
/* 02EA00 0012E900 38140200 */  dsll        $2, $2, 16
/* 02EA04 0012E904 38140200 */  dsll        $2, $2, 16
/* 02EA08 0012E908 80454234 */  ori         $2, $2, 0x4580
/* 02EA0C 0012E90C 38140200 */  dsll        $2, $2, 16
/* 02EA10 0012E910 00A8A248 */  qmtc2.ni    $2, $vf21
/* 02EA14 0012E914 0080C048 */  ctc2.ni     $0, $vi16
/* 02EA18 0012E918 6C5EB44B */  vsub.xyw    $vf25, $vf11, $vf20
/* 02EA1C 0012E91C 6CAE8B4B */  vsub.xy     $vf25, $vf21, $vf11
/* 02EA20 0012E920 6C66B44B */  vsub.xyw    $vf25, $vf12, $vf20
/* 02EA24 0012E924 6CAE8C4B */  vsub.xy     $vf25, $vf21, $vf12
/* 02EA28 0012E928 FF02004A */  vnop
/* 02EA2C 0012E92C FF02004A */  vnop
/* 02EA30 0012E930 FF02004A */  vnop
/* 02EA34 0012E934 FF02004A */  vnop
/* 02EA38 0012E938 FF02004A */  vnop
/* 02EA3C 0012E93C 00804248 */  cfc2.ni     $2, $vi16
/* 02EA40 0012E940 C0004230 */  andi        $2, $2, 0xC0
/* 02EA44 0012E944 7D598B4B */  vftoi4.xy   $vf11, $vf11
/* 02EA48 0012E948 7C594B4A */  vftoi0.z    $vf11, $vf11
/* 02EA4C 0012E94C 7CF92B4A */  vftoi0.w    $vf11, $vf31
/* 02EA50 0012E950 7D618C4B */  vftoi4.xy   $vf12, $vf12
/* 02EA54 0012E954 7C614C4A */  vftoi0.z    $vf12, $vf12
/* 02EA58 0012E958 7CF92C4A */  vftoi0.w    $vf12, $vf31
/* 02EA5C 0012E95C 00008BF8 */  sqc2        $vf11, 0x0($4)
/* 02EA60 0012E960 0000ACF8 */  sqc2        $vf12, 0x0($5)
/* 02EA64 0012E964 2B100200 */  sltu        $2, $0, $2
/* 02EA68 0012E968 01004238 */  xori        $2, $2, 0x1
/* 02EA6C 0012E96C FF004230 */  andi        $2, $2, 0xFF
.L0012E970:
/* 02EA70 0012E970 04004014 */  bnez        $2, .L0012E984
/* 02EA74 0012E974 00000000 */   nop
/* 02EA78 0012E978 28160070 */  paddub      $2, $0, $0
/* 02EA7C 0012E97C 01000010 */  b           .L0012E984
/* 02EA80 0012E980 00000000 */   nop
.L0012E984:
/* 02EA84 0012E984 2000BD27 */  addiu       $29, $29, 0x20
/* 02EA88 0012E988 0800E003 */  jr          $31
/* 02EA8C 0012E98C 00000000 */   nop
