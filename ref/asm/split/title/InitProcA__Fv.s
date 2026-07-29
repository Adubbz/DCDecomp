.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitProcA__Fv
/* 01F860 01DCB560 60FDBD27 */  addiu       $29, $29, -0x2A0
/* 01F864 01DCB564 5000BF7F */  sq          $31, 0x50($29)
/* 01F868 01DCB568 4000B47F */  sq          $20, 0x40($29)
/* 01F86C 01DCB56C 3000B37F */  sq          $19, 0x30($29)
/* 01F870 01DCB570 2000B27F */  sq          $18, 0x20($29)
/* 01F874 01DCB574 1000B17F */  sq          $17, 0x10($29)
/* 01F878 01DCB578 0000B07F */  sq          $16, 0x0($29)
/* 01F87C 01DCB57C DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 01F880 01DCB580 00000000 */   nop
/* 01F884 01DCB584 DE01023C */  lui         $2, %hi(LIT_875__4)
/* 01F888 01DCB588 90B14524 */  addiu       $5, $2, %lo(LIT_875__4)
/* 01F88C 01DCB58C 6000A427 */  addiu       $4, $29, 0x60
/* 01F890 01DCB590 09000324 */  addiu       $3, $0, 0x9
.L01DCB594_2D0D94:
/* 01F894 01DCB594 0000A278 */  lq          $2, 0x0($5)
/* 01F898 01DCB598 1000A524 */  addiu       $5, $5, 0x10
/* 01F89C 01DCB59C FFFF6324 */  addiu       $3, $3, -0x1
/* 01F8A0 01DCB5A0 0000827C */  sq          $2, 0x0($4)
/* 01F8A4 01DCB5A4 10008424 */  addiu       $4, $4, 0x10
/* 01F8A8 01DCB5A8 FAFF601C */  bgtz        $3, .L01DCB594_2D0D94
/* 01F8AC 01DCB5AC 00000000 */   nop
/* 01F8B0 01DCB5B0 948B848F */  lw          $4, -0x746C($28)
/* 01F8B4 01DCB5B4 DE01023C */  lui         $2, %hi(LIT_937__5)
/* 01F8B8 01DCB5B8 10024524 */  addiu       $5, $2, %lo(LIT_937__5)
/* 01F8BC 01DCB5BC 28360070 */  paddub      $6, $0, $0
/* 01F8C0 01DCB5C0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01F8C4 01DCB5C4 00000000 */   nop
/* 01F8C8 01DCB5C8 7800A2AF */  sw          $2, 0x78($29)
/* 01F8CC 01DCB5CC 948B848F */  lw          $4, -0x746C($28)
/* 01F8D0 01DCB5D0 DE01023C */  lui         $2, %hi(LIT_938__2)
/* 01F8D4 01DCB5D4 20024524 */  addiu       $5, $2, %lo(LIT_938__2)
/* 01F8D8 01DCB5D8 28360070 */  paddub      $6, $0, $0
/* 01F8DC 01DCB5DC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01F8E0 01DCB5E0 00000000 */   nop
/* 01F8E4 01DCB5E4 8400A2AF */  sw          $2, 0x84($29)
/* 01F8E8 01DCB5E8 948B848F */  lw          $4, -0x746C($28)
/* 01F8EC 01DCB5EC DE01023C */  lui         $2, %hi(LIT_939__2)
/* 01F8F0 01DCB5F0 30024524 */  addiu       $5, $2, %lo(LIT_939__2)
/* 01F8F4 01DCB5F4 28360070 */  paddub      $6, $0, $0
/* 01F8F8 01DCB5F8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01F8FC 01DCB5FC 00000000 */   nop
/* 01F900 01DCB600 9000A2AF */  sw          $2, 0x90($29)
/* 01F904 01DCB604 948B848F */  lw          $4, -0x746C($28)
/* 01F908 01DCB608 DE01023C */  lui         $2, %hi(LIT_940__4)
/* 01F90C 01DCB60C 40024524 */  addiu       $5, $2, %lo(LIT_940__4)
/* 01F910 01DCB610 28360070 */  paddub      $6, $0, $0
/* 01F914 01DCB614 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01F918 01DCB618 00000000 */   nop
/* 01F91C 01DCB61C 9C00A2AF */  sw          $2, 0x9C($29)
/* 01F920 01DCB620 948B848F */  lw          $4, -0x746C($28)
/* 01F924 01DCB624 DE01023C */  lui         $2, %hi(LIT_941__3)
/* 01F928 01DCB628 50024524 */  addiu       $5, $2, %lo(LIT_941__3)
/* 01F92C 01DCB62C 28360070 */  paddub      $6, $0, $0
/* 01F930 01DCB630 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01F934 01DCB634 00000000 */   nop
/* 01F938 01DCB638 A800A2AF */  sw          $2, 0xA8($29)
/* 01F93C 01DCB63C 948B848F */  lw          $4, -0x746C($28)
/* 01F940 01DCB640 DE01023C */  lui         $2, %hi(LIT_942__3)
/* 01F944 01DCB644 60024524 */  addiu       $5, $2, %lo(LIT_942__3)
/* 01F948 01DCB648 28360070 */  paddub      $6, $0, $0
/* 01F94C 01DCB64C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01F950 01DCB650 00000000 */   nop
/* 01F954 01DCB654 B400A2AF */  sw          $2, 0xB4($29)
/* 01F958 01DCB658 948B848F */  lw          $4, -0x746C($28)
/* 01F95C 01DCB65C DE01023C */  lui         $2, %hi(LIT_943__2)
/* 01F960 01DCB660 70024524 */  addiu       $5, $2, %lo(LIT_943__2)
/* 01F964 01DCB664 28360070 */  paddub      $6, $0, $0
/* 01F968 01DCB668 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01F96C 01DCB66C 00000000 */   nop
/* 01F970 01DCB670 C000A2AF */  sw          $2, 0xC0($29)
/* 01F974 01DCB674 948B848F */  lw          $4, -0x746C($28)
/* 01F978 01DCB678 DE01023C */  lui         $2, %hi(LIT_944__3)
/* 01F97C 01DCB67C 80024524 */  addiu       $5, $2, %lo(LIT_944__3)
/* 01F980 01DCB680 28360070 */  paddub      $6, $0, $0
/* 01F984 01DCB684 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01F988 01DCB688 00000000 */   nop
/* 01F98C 01DCB68C CC00A2AF */  sw          $2, 0xCC($29)
/* 01F990 01DCB690 948B848F */  lw          $4, -0x746C($28)
/* 01F994 01DCB694 DE01023C */  lui         $2, %hi(LIT_945__3)
/* 01F998 01DCB698 90024524 */  addiu       $5, $2, %lo(LIT_945__3)
/* 01F99C 01DCB69C 28360070 */  paddub      $6, $0, $0
/* 01F9A0 01DCB6A0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01F9A4 01DCB6A4 00000000 */   nop
/* 01F9A8 01DCB6A8 D800A2AF */  sw          $2, 0xD8($29)
/* 01F9AC 01DCB6AC C701023C */  lui         $2, %hi(TexManager)
/* 01F9B0 01DCB6B0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01F9B4 01DCB6B4 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 01F9B8 01DCB6B8 F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 01F9BC 01DCB6BC 00000000 */   nop
/* 01F9C0 01DCB6C0 C701023C */  lui         $2, %hi(TexManager)
/* 01F9C4 01DCB6C4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01F9C8 01DCB6C8 FFFF0524 */  addiu       $5, $0, -0x1
/* 01F9CC 01DCB6CC 6000A627 */  addiu       $6, $29, 0x60
/* 01F9D0 01DCB6D0 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 01F9D4 01DCB6D4 00000000 */   nop
/* 01F9D8 01DCB6D8 01000224 */  addiu       $2, $0, 0x1
/* 01F9DC 01DCB6DC E401013C */  lui         $1, %hi(CharaTex)
/* 01F9E0 01DCB6E0 10D022A0 */  sb          $2, %lo(CharaTex)($1)
/* 01F9E4 01DCB6E4 02000224 */  addiu       $2, $0, 0x2
/* 01F9E8 01DCB6E8 E401013C */  lui         $1, %hi(CharaTex + 0x1)
/* 01F9EC 01DCB6EC 11D022A0 */  sb          $2, %lo(CharaTex + 0x1)($1)
/* 01F9F0 01DCB6F0 03000224 */  addiu       $2, $0, 0x3
/* 01F9F4 01DCB6F4 E401013C */  lui         $1, %hi(CharaTex + 0x2)
/* 01F9F8 01DCB6F8 12D022A0 */  sb          $2, %lo(CharaTex + 0x2)($1)
/* 01F9FC 01DCB6FC 04000224 */  addiu       $2, $0, 0x4
/* 01FA00 01DCB700 E401013C */  lui         $1, %hi(CharaTex + 0x3)
/* 01FA04 01DCB704 13D022A0 */  sb          $2, %lo(CharaTex + 0x3)($1)
/* 01FA08 01DCB708 05000224 */  addiu       $2, $0, 0x5
/* 01FA0C 01DCB70C E401013C */  lui         $1, %hi(CharaTex + 0x4)
/* 01FA10 01DCB710 14D022A0 */  sb          $2, %lo(CharaTex + 0x4)($1)
/* 01FA14 01DCB714 E401013C */  lui         $1, %hi(CharaTex + 0x5)
/* 01FA18 01DCB718 15D022A0 */  sb          $2, %lo(CharaTex + 0x5)($1)
/* 01FA1C 01DCB71C E401013C */  lui         $1, %hi(CharaTex + 0x6)
/* 01FA20 01DCB720 16D022A0 */  sb          $2, %lo(CharaTex + 0x6)($1)
/* 01FA24 01DCB724 E401013C */  lui         $1, %hi(CharaTex + 0x7)
/* 01FA28 01DCB728 17D022A0 */  sb          $2, %lo(CharaTex + 0x7)($1)
/* 01FA2C 01DCB72C E401013C */  lui         $1, %hi(CharaTex + 0x8)
/* 01FA30 01DCB730 18D022A0 */  sb          $2, %lo(CharaTex + 0x8)($1)
/* 01FA34 01DCB734 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 01FA38 01DCB738 00000000 */   nop
/* 01FA3C 01DCB73C DE01023C */  lui         $2, %hi(LIT_881__4)
/* 01FA40 01DCB740 20B24224 */  addiu       $2, $2, %lo(LIT_881__4)
/* 01FA44 01DCB744 F000A427 */  addiu       $4, $29, 0xF0
/* 01FA48 01DCB748 00004378 */  lq          $3, 0x0($2)
/* 01FA4C 01DCB74C 100042C4 */  lwc1        $f2, 0x10($2)
/* 01FA50 01DCB750 0000837C */  sq          $3, 0x0($4)
/* 01FA54 01DCB754 100082E4 */  swc1        $f2, 0x10($4)
/* 01FA58 01DCB758 E401013C */  lui         $1, %hi(CharaDataBuffer + 0x8)
/* 01FA5C 01DCB75C 28D020AC */  sw          $0, %lo(CharaDataBuffer + 0x8)($1)
/* 01FA60 01DCB760 28860070 */  paddub      $16, $0, $0
/* 01FA64 01DCB764 2F000010 */  b           .L01DCB824_2D1024
/* 01FA68 01DCB768 00000000 */   nop
.L01DCB76C_2D0F6C:
/* 01FA6C 01DCB76C B0110224 */  addiu       $2, $0, 0x11B0
/* 01FA70 01DCB770 18880202 */  mult        $17, $16, $2
/* 01FA74 01DCB774 DF01023C */  lui         $2, %hi(Chara__3)
/* 01FA78 01DCB778 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 01FA7C 01DCB77C 21205100 */  addu        $4, $2, $17
/* 01FA80 01DCB780 80101000 */  sll         $2, $16, 2
/* 01FA84 01DCB784 21105D00 */  addu        $2, $2, $29
/* 01FA88 01DCB788 948B858F */  lw          $5, -0x746C($28)
/* 01FA8C 01DCB78C F000468C */  lw          $6, 0xF0($2)
/* 01FA90 01DCB790 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 01FA94 01DCB794 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 01FA98 01DCB798 28460070 */  paddub      $8, $0, $0
/* 01FA9C 01DCB79C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 01FAA0 01DCB7A0 00000000 */   nop
/* 01FAA4 01DCB7A4 1001A427 */  addiu       $4, $29, 0x110
/* 01FAA8 01DCB7A8 509F040C */  jal         __ct__10CFrameAttrFv
/* 01FAAC 01DCB7AC 00000000 */   nop
/* 01FAB0 01DCB7B0 1801A0A3 */  sb          $0, 0x118($29)
/* 01FAB4 01DCB7B4 DF01023C */  lui         $2, %hi(Chara__3 + 0xBC)
/* 01FAB8 01DCB7B8 9CFF4224 */  addiu       $2, $2, %lo(Chara__3 + 0xBC)
/* 01FABC 01DCB7BC 21105100 */  addu        $2, $2, $17
/* 01FAC0 01DCB7C0 0000448C */  lw          $4, 0x0($2)
/* 01FAC4 01DCB7C4 1001A527 */  addiu       $5, $29, 0x110
/* 01FAC8 01DCB7C8 01000624 */  addiu       $6, $0, 0x1
/* 01FACC 01DCB7CC 04000724 */  addiu       $7, $0, 0x4
/* 01FAD0 01DCB7D0 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 01FAD4 01DCB7D4 00000000 */   nop
/* 01FAD8 01DCB7D8 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 01FADC 01DCB7DC DF01023C */  lui         $2, %hi(Chara__3 + 0x2F0)
/* 01FAE0 01DCB7E0 D0014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F0)
/* 01FAE4 01DCB7E4 21105100 */  addu        $2, $2, $17
/* 01FAE8 01DCB7E8 000043AC */  sw          $3, 0x0($2)
/* 01FAEC 01DCB7EC 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 01FAF0 01DCB7F0 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F8)
/* 01FAF4 01DCB7F4 D8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F8)
/* 01FAF8 01DCB7F8 21105100 */  addu        $2, $2, $17
/* 01FAFC 01DCB7FC 000040E4 */  swc1        $f0, 0x0($2)
/* 01FB00 01DCB800 DF01023C */  lui         $2, %hi(Chara__3 + 0x304)
/* 01FB04 01DCB804 E4014224 */  addiu       $2, $2, %lo(Chara__3 + 0x304)
/* 01FB08 01DCB808 21105100 */  addu        $2, $2, $17
/* 01FB0C 01DCB80C 000040AC */  sw          $0, 0x0($2)
/* 01FB10 01DCB810 DF01023C */  lui         $2, %hi(Chara__3 + 0x308)
/* 01FB14 01DCB814 E8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x308)
/* 01FB18 01DCB818 21105100 */  addu        $2, $2, $17
/* 01FB1C 01DCB81C 000040AC */  sw          $0, 0x0($2)
/* 01FB20 01DCB820 01001026 */  addiu       $16, $16, 0x1
.L01DCB824_2D1024:
/* 01FB24 01DCB824 0400022A */  slti        $2, $16, 0x4
/* 01FB28 01DCB828 D0FF4014 */  bnez        $2, .L01DCB76C_2D0F6C
/* 01FB2C 01DCB82C 00000000 */   nop
/* 01FB30 01DCB830 2041023C */  lui         $2, (0x41200000 >> 16)
/* 01FB34 01DCB834 DF01013C */  lui         $1, %hi(Chara__3 + 0x2650)
/* 01FB38 01DCB838 302522AC */  sw          $2, %lo(Chara__3 + 0x2650)($1)
/* 01FB3C 01DCB83C DF01013C */  lui         $1, %hi(DngEventMan + 0x30)
/* 01FB40 01DCB840 E03622AC */  sw          $2, %lo(DngEventMan + 0x30)($1)
/* 01FB44 01DCB844 E401023C */  lui         $2, %hi(Wind__4)
/* 01FB48 01DCB848 C0CC4224 */  addiu       $2, $2, %lo(Wind__4)
/* 01FB4C 01DCB84C DF01013C */  lui         $1, %hi(Chara__3 + 0xC98)
/* 01FB50 01DCB850 780B22AC */  sw          $2, %lo(Chara__3 + 0xC98)($1)
/* 01FB54 01DCB854 DF01023C */  lui         $2, %hi(Chara__3 + 0x11B0)
/* 01FB58 01DCB858 90104424 */  addiu       $4, $2, %lo(Chara__3 + 0x11B0)
/* 01FB5C 01DCB85C 282E0070 */  paddub      $5, $0, $0
/* 01FB60 01DCB860 88E0040C */  jal         FootSoundEnable__10CCharacterFi
/* 01FB64 01DCB864 00000000 */   nop
/* 01FB68 01DCB868 04001024 */  addiu       $16, $0, 0x4
/* 01FB6C 01DCB86C 31000010 */  b           .L01DCB934_2D1134
/* 01FB70 01DCB870 00000000 */   nop
.L01DCB874_2D1074:
/* 01FB74 01DCB874 B0110224 */  addiu       $2, $0, 0x11B0
/* 01FB78 01DCB878 18880202 */  mult        $17, $16, $2
/* 01FB7C 01DCB87C DF01023C */  lui         $2, %hi(Chara__3)
/* 01FB80 01DCB880 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 01FB84 01DCB884 21905100 */  addu        $18, $2, $17
/* 01FB88 01DCB888 28264072 */  paddub      $4, $18, $0
/* 01FB8C 01DCB88C 948B858F */  lw          $5, -0x746C($28)
/* 01FB90 01DCB890 0001A68F */  lw          $6, 0x100($29)
/* 01FB94 01DCB894 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 01FB98 01DCB898 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 01FB9C 01DCB89C 28460070 */  paddub      $8, $0, $0
/* 01FBA0 01DCB8A0 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 01FBA4 01DCB8A4 00000000 */   nop
/* 01FBA8 01DCB8A8 7001A427 */  addiu       $4, $29, 0x170
/* 01FBAC 01DCB8AC 509F040C */  jal         __ct__10CFrameAttrFv
/* 01FBB0 01DCB8B0 00000000 */   nop
/* 01FBB4 01DCB8B4 7801A0A3 */  sb          $0, 0x178($29)
/* 01FBB8 01DCB8B8 DF01023C */  lui         $2, %hi(Chara__3 + 0xBC)
/* 01FBBC 01DCB8BC 9CFF4224 */  addiu       $2, $2, %lo(Chara__3 + 0xBC)
/* 01FBC0 01DCB8C0 21105100 */  addu        $2, $2, $17
/* 01FBC4 01DCB8C4 0000448C */  lw          $4, 0x0($2)
/* 01FBC8 01DCB8C8 7001A527 */  addiu       $5, $29, 0x170
/* 01FBCC 01DCB8CC 01000624 */  addiu       $6, $0, 0x1
/* 01FBD0 01DCB8D0 04000724 */  addiu       $7, $0, 0x4
/* 01FBD4 01DCB8D4 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 01FBD8 01DCB8D8 00000000 */   nop
/* 01FBDC 01DCB8DC 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 01FBE0 01DCB8E0 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F8)
/* 01FBE4 01DCB8E4 D8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F8)
/* 01FBE8 01DCB8E8 21105100 */  addu        $2, $2, $17
/* 01FBEC 01DCB8EC 000040E4 */  swc1        $f0, 0x0($2)
/* 01FBF0 01DCB8F0 DF01023C */  lui         $2, %hi(Chara__3 + 0x304)
/* 01FBF4 01DCB8F4 E4014224 */  addiu       $2, $2, %lo(Chara__3 + 0x304)
/* 01FBF8 01DCB8F8 21105100 */  addu        $2, $2, $17
/* 01FBFC 01DCB8FC 000040AC */  sw          $0, 0x0($2)
/* 01FC00 01DCB900 DF01023C */  lui         $2, %hi(Chara__3 + 0x308)
/* 01FC04 01DCB904 E8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x308)
/* 01FC08 01DCB908 21105100 */  addu        $2, $2, $17
/* 01FC0C 01DCB90C 000040AC */  sw          $0, 0x0($2)
/* 01FC10 01DCB910 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 01FC14 01DCB914 00608244 */  mtc1        $2, $f12
/* 01FC18 01DCB918 00000000 */  nop
/* 01FC1C 01DCB91C 46630046 */  mov.s       $f13, $f12
/* 01FC20 01DCB920 86630046 */  mov.s       $f14, $f12
/* 01FC24 01DCB924 28264072 */  paddub      $4, $18, $0
/* 01FC28 01DCB928 94E4040C */  jal         SetScale__10CCharacterFfff
/* 01FC2C 01DCB92C 00000000 */   nop
/* 01FC30 01DCB930 01001026 */  addiu       $16, $16, 0x1
.L01DCB934_2D1134:
/* 01FC34 01DCB934 0900022A */  slti        $2, $16, 0x9
/* 01FC38 01DCB938 CEFF4014 */  bnez        $2, .L01DCB874_2D1074
/* 01FC3C 01DCB93C 00000000 */   nop
/* 01FC40 01DCB940 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 01FC44 01DCB944 DF01013C */  lui         $1, %hi(DngEventMan + 0x11E0)
/* 01FC48 01DCB948 904822AC */  sw          $2, %lo(DngEventMan + 0x11E0)($1)
/* 01FC4C 01DCB94C 8040023C */  lui         $2, (0x40800000 >> 16)
/* 01FC50 01DCB950 DF01013C */  lui         $1, %hi(DngEventMan + 0x2390)
/* 01FC54 01DCB954 405A22AC */  sw          $2, %lo(DngEventMan + 0x2390)($1)
/* 01FC58 01DCB958 0041023C */  lui         $2, (0x41000000 >> 16)
/* 01FC5C 01DCB95C DF01013C */  lui         $1, %hi(UraEventMan + 0xD40)
/* 01FC60 01DCB960 F06B22AC */  sw          $2, %lo(UraEventMan + 0xD40)($1)
/* 01FC64 01DCB964 4041023C */  lui         $2, (0x41400000 >> 16)
/* 01FC68 01DCB968 DF01013C */  lui         $1, %hi(UraEventMan + 0x1EF0)
/* 01FC6C 01DCB96C A07D22AC */  sw          $2, %lo(UraEventMan + 0x1EF0)($1)
/* 01FC70 01DCB970 8041023C */  lui         $2, (0x41800000 >> 16)
/* 01FC74 01DCB974 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x780)
/* 01FC78 01DCB978 508F22AC */  sw          $2, %lo(MainMonstorUnit + 0x780)($1)
/* 01FC7C 01DCB97C DF01013C */  lui         $1, %hi(Chara__3 + 0xBC)
/* 01FC80 01DCB980 9CFF228C */  lw          $2, %lo(Chara__3 + 0xBC)($1)
/* 01FC84 01DCB984 B09B82AF */  sw          $2, -0x6450($28)
/* 01FC88 01DCB988 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 01FC8C 01DCB98C 00000000 */   nop
/* 01FC90 01DCB990 B89880AF */  sw          $0, -0x6748($28)
/* 01FC94 01DCB994 B49880AF */  sw          $0, -0x674C($28)
/* 01FC98 01DCB998 DF01013C */  lui         $1, %hi(MapDataBuffer + 0x8)
/* 01FC9C 01DCB99C B8FE20AC */  sw          $0, %lo(MapDataBuffer + 0x8)($1)
/* 01FCA0 01DCB9A0 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 01FCA4 01DCB9A4 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 01FCA8 01DCB9A8 A80E050C */  jal         Initialize__4CMapFv
/* 01FCAC 01DCB9AC 00000000 */   nop
/* 01FCB0 01DCB9B0 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 01FCB4 01DCB9B4 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 01FCB8 01DCB9B8 A80E050C */  jal         Initialize__4CMapFv
/* 01FCBC 01DCB9BC 00000000 */   nop
/* 01FCC0 01DCB9C0 E201023C */  lui         $2, %hi(OP_BuildingMap2)
/* 01FCC4 01DCB9C4 40AF4424 */  addiu       $4, $2, %lo(OP_BuildingMap2)
/* 01FCC8 01DCB9C8 A80E050C */  jal         Initialize__4CMapFv
/* 01FCCC 01DCB9CC 00000000 */   nop
/* 01FCD0 01DCB9D0 D001A427 */  addiu       $4, $29, 0x1D0
/* 01FCD4 01DCB9D4 509F040C */  jal         __ct__10CFrameAttrFv
/* 01FCD8 01DCB9D8 00000000 */   nop
/* 01FCDC 01DCB9DC 948B848F */  lw          $4, -0x746C($28)
/* 01FCE0 01DCB9E0 DE01023C */  lui         $2, %hi(LIT_947__3)
/* 01FCE4 01DCB9E4 A0024524 */  addiu       $5, $2, %lo(LIT_947__3)
/* 01FCE8 01DCB9E8 28360070 */  paddub      $6, $0, $0
/* 01FCEC 01DCB9EC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01FCF0 01DCB9F0 00000000 */   nop
/* 01FCF4 01DCB9F4 28264070 */  paddub      $4, $2, $0
/* 01FCF8 01DCB9F8 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 01FCFC 01DCB9FC B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 01FD00 01DCBA00 02000624 */  addiu       $6, $0, 0x2
/* 01FD04 01DCBA04 283E0070 */  paddub      $7, $0, $0
/* 01FD08 01DCBA08 28460070 */  paddub      $8, $0, $0
/* 01FD0C 01DCBA0C AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 01FD10 01DCBA10 00000000 */   nop
/* 01FD14 01DCBA14 28864070 */  paddub      $16, $2, $0
/* 01FD18 01DCBA18 01000624 */  addiu       $6, $0, 0x1
/* 01FD1C 01DCBA1C DC01A6A3 */  sb          $6, 0x1DC($29)
/* 01FD20 01DCBA20 28260072 */  paddub      $4, $16, $0
/* 01FD24 01DCBA24 D001A527 */  addiu       $5, $29, 0x1D0
/* 01FD28 01DCBA28 40000724 */  addiu       $7, $0, 0x40
/* 01FD2C 01DCBA2C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 01FD30 01DCBA30 00000000 */   nop
/* 01FD34 01DCBA34 28260072 */  paddub      $4, $16, $0
/* 01FD38 01DCBA38 01000524 */  addiu       $5, $0, 0x1
/* 01FD3C 01DCBA3C BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 01FD40 01DCBA40 00000000 */   nop
/* 01FD44 01DCBA44 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 01FD48 01DCBA48 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 01FD4C 01DCBA4C 282E0072 */  paddub      $5, $16, $0
/* 01FD50 01DCBA50 28360070 */  paddub      $6, $0, $0
/* 01FD54 01DCBA54 283E0070 */  paddub      $7, $0, $0
/* 01FD58 01DCBA58 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 01FD5C 01DCBA5C 00000000 */   nop
/* 01FD60 01DCBA60 288E4070 */  paddub      $17, $2, $0
/* 01FD64 01DCBA64 6002A0AF */  sw          $0, 0x260($29)
/* 01FD68 01DCBA68 6402A0AF */  sw          $0, 0x264($29)
/* 01FD6C 01DCBA6C 6802A0AF */  sw          $0, 0x268($29)
/* 01FD70 01DCBA70 28262072 */  paddub      $4, $17, $0
/* 01FD74 01DCBA74 6002A527 */  addiu       $5, $29, 0x260
/* 01FD78 01DCBA78 A000598C */  lw          $25, 0xA0($2)
/* 01FD7C 01DCBA7C 1000398F */  lw          $25, 0x10($25)
/* 01FD80 01DCBA80 09F82003 */  jalr        $25
/* 01FD84 01DCBA84 00000000 */   nop
/* 01FD88 01DCBA88 7002A0AF */  sw          $0, 0x270($29)
/* 01FD8C 01DCBA8C 7402A0AF */  sw          $0, 0x274($29)
/* 01FD90 01DCBA90 7802A0AF */  sw          $0, 0x278($29)
/* 01FD94 01DCBA94 28262072 */  paddub      $4, $17, $0
/* 01FD98 01DCBA98 7002A527 */  addiu       $5, $29, 0x270
/* 01FD9C 01DCBA9C A000398E */  lw          $25, 0xA0($17)
/* 01FDA0 01DCBAA0 2C00398F */  lw          $25, 0x2C($25)
/* 01FDA4 01DCBAA4 09F82003 */  jalr        $25
/* 01FDA8 01DCBAA8 00000000 */   nop
/* 01FDAC 01DCBAAC 3002A0AF */  sw          $0, 0x230($29)
/* 01FDB0 01DCBAB0 3402B127 */  addiu       $17, $29, 0x234
/* 01FDB4 01DCBAB4 000020AE */  sw          $0, 0x0($17)
/* 01FDB8 01DCBAB8 3802B227 */  addiu       $18, $29, 0x238
/* 01FDBC 01DCBABC 000040AE */  sw          $0, 0x0($18)
/* 01FDC0 01DCBAC0 4002A0AF */  sw          $0, 0x240($29)
/* 01FDC4 01DCBAC4 F88080C7 */  lwc1        $f0, -0x7F08($28)
/* 01FDC8 01DCBAC8 4402B327 */  addiu       $19, $29, 0x244
/* 01FDCC 01DCBACC 000060E6 */  swc1        $f0, 0x0($19)
/* 01FDD0 01DCBAD0 4802B427 */  addiu       $20, $29, 0x248
/* 01FDD4 01DCBAD4 000080AE */  sw          $0, 0x0($20)
/* 01FDD8 01DCBAD8 DE01023C */  lui         $2, %hi(LIT_949__3)
/* 01FDDC 01DCBADC B0024424 */  addiu       $4, $2, %lo(LIT_949__3)
/* 01FDE0 01DCBAE0 282E0072 */  paddub      $5, $16, $0
/* 01FDE4 01DCBAE4 3002A627 */  addiu       $6, $29, 0x230
/* 01FDE8 01DCBAE8 4002A727 */  addiu       $7, $29, 0x240
/* 01FDEC 01DCBAEC B02B770C */  jal         SetObjAnime__FPcP9CFrameVu1PfPf
/* 01FDF0 01DCBAF0 00000000 */   nop
/* 01FDF4 01DCBAF4 3002A0AF */  sw          $0, 0x230($29)
/* 01FDF8 01DCBAF8 000020AE */  sw          $0, 0x0($17)
/* 01FDFC 01DCBAFC 000040AE */  sw          $0, 0x0($18)
/* 01FE00 01DCBB00 F88080C7 */  lwc1        $f0, -0x7F08($28)
/* 01FE04 01DCBB04 4002A0E7 */  swc1        $f0, 0x240($29)
/* 01FE08 01DCBB08 000060AE */  sw          $0, 0x0($19)
/* 01FE0C 01DCBB0C 000080AE */  sw          $0, 0x0($20)
/* 01FE10 01DCBB10 DE01023C */  lui         $2, %hi(LIT_950__2)
/* 01FE14 01DCBB14 B8024424 */  addiu       $4, $2, %lo(LIT_950__2)
/* 01FE18 01DCBB18 282E0072 */  paddub      $5, $16, $0
/* 01FE1C 01DCBB1C 3002A627 */  addiu       $6, $29, 0x230
/* 01FE20 01DCBB20 4002A727 */  addiu       $7, $29, 0x240
/* 01FE24 01DCBB24 B02B770C */  jal         SetObjAnime__FPcP9CFrameVu1PfPf
/* 01FE28 01DCBB28 00000000 */   nop
/* 01FE2C 01DCBB2C 3002A0AF */  sw          $0, 0x230($29)
/* 01FE30 01DCBB30 000020AE */  sw          $0, 0x0($17)
/* 01FE34 01DCBB34 000040AE */  sw          $0, 0x0($18)
/* 01FE38 01DCBB38 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 01FE3C 01DCBB3C 4002A0E7 */  swc1        $f0, 0x240($29)
/* 01FE40 01DCBB40 000060AE */  sw          $0, 0x0($19)
/* 01FE44 01DCBB44 000080AE */  sw          $0, 0x0($20)
/* 01FE48 01DCBB48 DE01023C */  lui         $2, %hi(LIT_951__2)
/* 01FE4C 01DCBB4C C0024424 */  addiu       $4, $2, %lo(LIT_951__2)
/* 01FE50 01DCBB50 282E0072 */  paddub      $5, $16, $0
/* 01FE54 01DCBB54 3002A627 */  addiu       $6, $29, 0x230
/* 01FE58 01DCBB58 4002A727 */  addiu       $7, $29, 0x240
/* 01FE5C 01DCBB5C B02B770C */  jal         SetObjAnime__FPcP9CFrameVu1PfPf
/* 01FE60 01DCBB60 00000000 */   nop
/* 01FE64 01DCBB64 3002A0AF */  sw          $0, 0x230($29)
/* 01FE68 01DCBB68 000020AE */  sw          $0, 0x0($17)
/* 01FE6C 01DCBB6C 000040AE */  sw          $0, 0x0($18)
/* 01FE70 01DCBB70 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 01FE74 01DCBB74 4002A2AF */  sw          $2, 0x240($29)
/* 01FE78 01DCBB78 F88080C7 */  lwc1        $f0, -0x7F08($28)
/* 01FE7C 01DCBB7C 000060E6 */  swc1        $f0, 0x0($19)
/* 01FE80 01DCBB80 000080AE */  sw          $0, 0x0($20)
/* 01FE84 01DCBB84 DE01023C */  lui         $2, %hi(LIT_952__2)
/* 01FE88 01DCBB88 C8024424 */  addiu       $4, $2, %lo(LIT_952__2)
/* 01FE8C 01DCBB8C 282E0072 */  paddub      $5, $16, $0
/* 01FE90 01DCBB90 3002A627 */  addiu       $6, $29, 0x230
/* 01FE94 01DCBB94 4002A727 */  addiu       $7, $29, 0x240
/* 01FE98 01DCBB98 B02B770C */  jal         SetObjAnime__FPcP9CFrameVu1PfPf
/* 01FE9C 01DCBB9C 00000000 */   nop
/* 01FEA0 01DCBBA0 948B848F */  lw          $4, -0x746C($28)
/* 01FEA4 01DCBBA4 DE01023C */  lui         $2, %hi(LIT_953__3)
/* 01FEA8 01DCBBA8 D0024524 */  addiu       $5, $2, %lo(LIT_953__3)
/* 01FEAC 01DCBBAC 28360070 */  paddub      $6, $0, $0
/* 01FEB0 01DCBBB0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01FEB4 01DCBBB4 00000000 */   nop
/* 01FEB8 01DCBBB8 28264070 */  paddub      $4, $2, $0
/* 01FEBC 01DCBBBC DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 01FEC0 01DCBBC0 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 01FEC4 01DCBBC4 02000624 */  addiu       $6, $0, 0x2
/* 01FEC8 01DCBBC8 283E0070 */  paddub      $7, $0, $0
/* 01FECC 01DCBBCC 28460070 */  paddub      $8, $0, $0
/* 01FED0 01DCBBD0 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 01FED4 01DCBBD4 00000000 */   nop
/* 01FED8 01DCBBD8 28864070 */  paddub      $16, $2, $0
/* 01FEDC 01DCBBDC 28260072 */  paddub      $4, $16, $0
/* 01FEE0 01DCBBE0 D001A527 */  addiu       $5, $29, 0x1D0
/* 01FEE4 01DCBBE4 01000624 */  addiu       $6, $0, 0x1
/* 01FEE8 01DCBBE8 40000724 */  addiu       $7, $0, 0x40
/* 01FEEC 01DCBBEC D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 01FEF0 01DCBBF0 00000000 */   nop
/* 01FEF4 01DCBBF4 28260072 */  paddub      $4, $16, $0
/* 01FEF8 01DCBBF8 01000524 */  addiu       $5, $0, 0x1
/* 01FEFC 01DCBBFC BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 01FF00 01DCBC00 00000000 */   nop
/* 01FF04 01DCBC04 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 01FF08 01DCBC08 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 01FF0C 01DCBC0C 282E0072 */  paddub      $5, $16, $0
/* 01FF10 01DCBC10 28360070 */  paddub      $6, $0, $0
/* 01FF14 01DCBC14 283E0070 */  paddub      $7, $0, $0
/* 01FF18 01DCBC18 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 01FF1C 01DCBC1C 00000000 */   nop
/* 01FF20 01DCBC20 288E4070 */  paddub      $17, $2, $0
/* 01FF24 01DCBC24 8002A0AF */  sw          $0, 0x280($29)
/* 01FF28 01DCBC28 8402A0AF */  sw          $0, 0x284($29)
/* 01FF2C 01DCBC2C 8802A0AF */  sw          $0, 0x288($29)
/* 01FF30 01DCBC30 28262072 */  paddub      $4, $17, $0
/* 01FF34 01DCBC34 8002A527 */  addiu       $5, $29, 0x280
/* 01FF38 01DCBC38 A000598C */  lw          $25, 0xA0($2)
/* 01FF3C 01DCBC3C 1000398F */  lw          $25, 0x10($25)
/* 01FF40 01DCBC40 09F82003 */  jalr        $25
/* 01FF44 01DCBC44 00000000 */   nop
/* 01FF48 01DCBC48 9002A0AF */  sw          $0, 0x290($29)
/* 01FF4C 01DCBC4C 9402A0AF */  sw          $0, 0x294($29)
/* 01FF50 01DCBC50 9802A0AF */  sw          $0, 0x298($29)
/* 01FF54 01DCBC54 28262072 */  paddub      $4, $17, $0
/* 01FF58 01DCBC58 9002A527 */  addiu       $5, $29, 0x290
/* 01FF5C 01DCBC5C A000398E */  lw          $25, 0xA0($17)
/* 01FF60 01DCBC60 2C00398F */  lw          $25, 0x2C($25)
/* 01FF64 01DCBC64 09F82003 */  jalr        $25
/* 01FF68 01DCBC68 00000000 */   nop
/* 01FF6C 01DCBC6C DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 01FF70 01DCBC70 00000000 */   nop
/* 01FF74 01DCBC74 E501013C */  lui         $1, %hi(PathDataBuffer + 0x8)
/* 01FF78 01DCBC78 C80A20AC */  sw          $0, %lo(PathDataBuffer + 0x8)($1)
/* 01FF7C 01DCBC7C FFFF0224 */  addiu       $2, $0, -0x1
/* 01FF80 01DCBC80 C09B82AF */  sw          $2, -0x6440($28)
/* 01FF84 01DCBC84 DE01023C */  lui         $2, %hi(LIT_896__2)
/* 01FF88 01DCBC88 40B24224 */  addiu       $2, $2, %lo(LIT_896__2)
/* 01FF8C 01DCBC8C 5002A327 */  addiu       $3, $29, 0x250
/* 01FF90 01DCBC90 00004278 */  lq          $2, 0x0($2)
/* 01FF94 01DCBC94 0000627C */  sq          $2, 0x0($3)
/* 01FF98 01DCBC98 28860070 */  paddub      $16, $0, $0
/* 01FF9C 01DCBC9C 27000010 */  b           .L01DCBD3C_2D153C
/* 01FFA0 01DCBCA0 00000000 */   nop
.L01DCBCA4_2D14A4:
/* 01FFA4 01DCBCA4 B0110224 */  addiu       $2, $0, 0x11B0
/* 01FFA8 01DCBCA8 18880202 */  mult        $17, $16, $2
/* 01FFAC 01DCBCAC E501023C */  lui         $2, %hi(Cam)
/* 01FFB0 01DCBCB0 F0C34224 */  addiu       $2, $2, %lo(Cam)
/* 01FFB4 01DCBCB4 21205100 */  addu        $4, $2, $17
/* 01FFB8 01DCBCB8 80101000 */  sll         $2, $16, 2
/* 01FFBC 01DCBCBC 21105D00 */  addu        $2, $2, $29
/* 01FFC0 01DCBCC0 948B858F */  lw          $5, -0x746C($28)
/* 01FFC4 01DCBCC4 5002468C */  lw          $6, 0x250($2)
/* 01FFC8 01DCBCC8 E501023C */  lui         $2, %hi(PathDataBuffer)
/* 01FFCC 01DCBCCC C00A4724 */  addiu       $7, $2, %lo(PathDataBuffer)
/* 01FFD0 01DCBCD0 28460070 */  paddub      $8, $0, $0
/* 01FFD4 01DCBCD4 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 01FFD8 01DCBCD8 00000000 */   nop
/* 01FFDC 01DCBCDC 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 01FFE0 01DCBCE0 E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 01FFE4 01DCBCE4 E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 01FFE8 01DCBCE8 21105100 */  addu        $2, $2, $17
/* 01FFEC 01DCBCEC 000043AC */  sw          $3, 0x0($2)
/* 01FFF0 01DCBCF0 E501023C */  lui         $2, %hi(Cam + 0x2F8)
/* 01FFF4 01DCBCF4 E8C64224 */  addiu       $2, $2, %lo(Cam + 0x2F8)
/* 01FFF8 01DCBCF8 21105100 */  addu        $2, $2, $17
/* 01FFFC 01DCBCFC 000043AC */  sw          $3, 0x0($2)
/* 020000 01DCBD00 E501023C */  lui         $2, %hi(Cam + 0x304)
/* 020004 01DCBD04 F4C64224 */  addiu       $2, $2, %lo(Cam + 0x304)
/* 020008 01DCBD08 21105100 */  addu        $2, $2, $17
/* 02000C 01DCBD0C 000040AC */  sw          $0, 0x0($2)
/* 020010 01DCBD10 E501023C */  lui         $2, %hi(Cam + 0x308)
/* 020014 01DCBD14 F8C64224 */  addiu       $2, $2, %lo(Cam + 0x308)
/* 020018 01DCBD18 21105100 */  addu        $2, $2, $17
/* 02001C 01DCBD1C 000040AC */  sw          $0, 0x0($2)
/* 020020 01DCBD20 E301023C */  lui         $2, %hi(MainCamera__3)
/* 020024 01DCBD24 80E64324 */  addiu       $3, $2, %lo(MainCamera__3)
/* 020028 01DCBD28 E501023C */  lui         $2, %hi(Cam + 0x310)
/* 02002C 01DCBD2C 00C74224 */  addiu       $2, $2, %lo(Cam + 0x310)
/* 020030 01DCBD30 21105100 */  addu        $2, $2, $17
/* 020034 01DCBD34 000043AC */  sw          $3, 0x0($2)
/* 020038 01DCBD38 01001026 */  addiu       $16, $16, 0x1
.L01DCBD3C_2D153C:
/* 02003C 01DCBD3C 0400022A */  slti        $2, $16, 0x4
/* 020040 01DCBD40 D8FF4014 */  bnez        $2, .L01DCBCA4_2D14A4
/* 020044 01DCBD44 00000000 */   nop
/* 020048 01DCBD48 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 02004C 01DCBD4C 00000000 */   nop
/* 020050 01DCBD50 DE01023C */  lui         $2, %hi(LIT_954)
/* 020054 01DCBD54 E0024424 */  addiu       $4, $2, %lo(LIT_954)
/* 020058 01DCBD58 00C5760C */  jal         OPAnalyz__FPc
/* 02005C 01DCBD5C 00000000 */   nop
/* 020060 01DCBD60 4CCA760C */  jal         OPMdsLoad__Fv
/* 020064 01DCBD64 00000000 */   nop
/* 020068 01DCBD68 5000BF7B */  lq          $31, 0x50($29)
/* 02006C 01DCBD6C 4000B47B */  lq          $20, 0x40($29)
/* 020070 01DCBD70 3000B37B */  lq          $19, 0x30($29)
/* 020074 01DCBD74 2000B27B */  lq          $18, 0x20($29)
/* 020078 01DCBD78 1000B17B */  lq          $17, 0x10($29)
/* 02007C 01DCBD7C 0000B07B */  lq          $16, 0x0($29)
/* 020080 01DCBD80 A002BD27 */  addiu       $29, $29, 0x2A0
/* 020084 01DCBD84 0800E003 */  jr          $31
/* 020088 01DCBD88 00000000 */   nop
/* 02008C 01DCBD8C 00000000 */  nop
