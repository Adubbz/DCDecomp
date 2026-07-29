.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitProcB__Fv
/* 020870 01DCC570 C0FDBD27 */  addiu       $29, $29, -0x240
/* 020874 01DCC574 2000BF7F */  sq          $31, 0x20($29)
/* 020878 01DCC578 1000B17F */  sq          $17, 0x10($29)
/* 02087C 01DCC57C 0000B07F */  sq          $16, 0x0($29)
/* 020880 01DCC580 DE01023C */  lui         $2, %hi(LIT_1032__3)
/* 020884 01DCC584 B0B24624 */  addiu       $6, $2, %lo(LIT_1032__3)
/* 020888 01DCC588 3000A527 */  addiu       $5, $29, 0x30
/* 02088C 01DCC58C 05000424 */  addiu       $4, $0, 0x5
.L01DCC590_2D1D90:
/* 020890 01DCC590 0000C378 */  lq          $3, 0x0($6)
/* 020894 01DCC594 1000C278 */  lq          $2, 0x10($6)
/* 020898 01DCC598 2000C624 */  addiu       $6, $6, 0x20
/* 02089C 01DCC59C FFFF8424 */  addiu       $4, $4, -0x1
/* 0208A0 01DCC5A0 0000A37C */  sq          $3, 0x0($5)
/* 0208A4 01DCC5A4 1000A27C */  sq          $2, 0x10($5)
/* 0208A8 01DCC5A8 2000A524 */  addiu       $5, $5, 0x20
/* 0208AC 01DCC5AC F8FF801C */  bgtz        $4, .L01DCC590_2D1D90
/* 0208B0 01DCC5B0 00000000 */   nop
/* 0208B4 01DCC5B4 0000C2DC */  ld          $2, 0x0($6)
/* 0208B8 01DCC5B8 0000A2FC */  sd          $2, 0x0($5)
/* 0208BC 01DCC5BC 948B848F */  lw          $4, -0x746C($28)
/* 0208C0 01DCC5C0 DE01023C */  lui         $2, %hi(LIT_937__5)
/* 0208C4 01DCC5C4 10024524 */  addiu       $5, $2, %lo(LIT_937__5)
/* 0208C8 01DCC5C8 28360070 */  paddub      $6, $0, $0
/* 0208CC 01DCC5CC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0208D0 01DCC5D0 00000000 */   nop
/* 0208D4 01DCC5D4 6000A2AF */  sw          $2, 0x60($29)
/* 0208D8 01DCC5D8 948B848F */  lw          $4, -0x746C($28)
/* 0208DC 01DCC5DC DE01023C */  lui         $2, %hi(LIT_938__2)
/* 0208E0 01DCC5E0 20024524 */  addiu       $5, $2, %lo(LIT_938__2)
/* 0208E4 01DCC5E4 28360070 */  paddub      $6, $0, $0
/* 0208E8 01DCC5E8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0208EC 01DCC5EC 00000000 */   nop
/* 0208F0 01DCC5F0 6C00A2AF */  sw          $2, 0x6C($29)
/* 0208F4 01DCC5F4 948B848F */  lw          $4, -0x746C($28)
/* 0208F8 01DCC5F8 DE01023C */  lui         $2, %hi(LIT_1075)
/* 0208FC 01DCC5FC A8034524 */  addiu       $5, $2, %lo(LIT_1075)
/* 020900 01DCC600 28360070 */  paddub      $6, $0, $0
/* 020904 01DCC604 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 020908 01DCC608 00000000 */   nop
/* 02090C 01DCC60C 7800A2AF */  sw          $2, 0x78($29)
/* 020910 01DCC610 948B848F */  lw          $4, -0x746C($28)
/* 020914 01DCC614 DE01023C */  lui         $2, %hi(LIT_939__2)
/* 020918 01DCC618 30024524 */  addiu       $5, $2, %lo(LIT_939__2)
/* 02091C 01DCC61C 28360070 */  paddub      $6, $0, $0
/* 020920 01DCC620 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 020924 01DCC624 00000000 */   nop
/* 020928 01DCC628 8400A2AF */  sw          $2, 0x84($29)
/* 02092C 01DCC62C 948B848F */  lw          $4, -0x746C($28)
/* 020930 01DCC630 DE01023C */  lui         $2, %hi(LIT_1076__2)
/* 020934 01DCC634 B8034524 */  addiu       $5, $2, %lo(LIT_1076__2)
/* 020938 01DCC638 28360070 */  paddub      $6, $0, $0
/* 02093C 01DCC63C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 020940 01DCC640 00000000 */   nop
/* 020944 01DCC644 9000A2AF */  sw          $2, 0x90($29)
/* 020948 01DCC648 948B848F */  lw          $4, -0x746C($28)
/* 02094C 01DCC64C DE01023C */  lui         $2, %hi(LIT_1077)
/* 020950 01DCC650 C8034524 */  addiu       $5, $2, %lo(LIT_1077)
/* 020954 01DCC654 28360070 */  paddub      $6, $0, $0
/* 020958 01DCC658 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 02095C 01DCC65C 00000000 */   nop
/* 020960 01DCC660 9C00A2AF */  sw          $2, 0x9C($29)
/* 020964 01DCC664 948B848F */  lw          $4, -0x746C($28)
/* 020968 01DCC668 DE01023C */  lui         $2, %hi(LIT_1078)
/* 02096C 01DCC66C D8034524 */  addiu       $5, $2, %lo(LIT_1078)
/* 020970 01DCC670 28360070 */  paddub      $6, $0, $0
/* 020974 01DCC674 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 020978 01DCC678 00000000 */   nop
/* 02097C 01DCC67C A800A2AF */  sw          $2, 0xA8($29)
/* 020980 01DCC680 948B848F */  lw          $4, -0x746C($28)
/* 020984 01DCC684 DE01023C */  lui         $2, %hi(LIT_1079__2)
/* 020988 01DCC688 E8034524 */  addiu       $5, $2, %lo(LIT_1079__2)
/* 02098C 01DCC68C 28360070 */  paddub      $6, $0, $0
/* 020990 01DCC690 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 020994 01DCC694 00000000 */   nop
/* 020998 01DCC698 B400A2AF */  sw          $2, 0xB4($29)
/* 02099C 01DCC69C 948B848F */  lw          $4, -0x746C($28)
/* 0209A0 01DCC6A0 DE01023C */  lui         $2, %hi(LIT_1080__2)
/* 0209A4 01DCC6A4 F8034524 */  addiu       $5, $2, %lo(LIT_1080__2)
/* 0209A8 01DCC6A8 28360070 */  paddub      $6, $0, $0
/* 0209AC 01DCC6AC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0209B0 01DCC6B0 00000000 */   nop
/* 0209B4 01DCC6B4 C000A2AF */  sw          $2, 0xC0($29)
/* 0209B8 01DCC6B8 C701023C */  lui         $2, %hi(TexManager)
/* 0209BC 01DCC6BC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0209C0 01DCC6C0 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 0209C4 01DCC6C4 F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 0209C8 01DCC6C8 00000000 */   nop
/* 0209CC 01DCC6CC C701023C */  lui         $2, %hi(TexManager)
/* 0209D0 01DCC6D0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0209D4 01DCC6D4 FFFF0524 */  addiu       $5, $0, -0x1
/* 0209D8 01DCC6D8 3000A627 */  addiu       $6, $29, 0x30
/* 0209DC 01DCC6DC C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0209E0 01DCC6E0 00000000 */   nop
/* 0209E4 01DCC6E4 01000224 */  addiu       $2, $0, 0x1
/* 0209E8 01DCC6E8 E401013C */  lui         $1, %hi(CharaTex)
/* 0209EC 01DCC6EC 10D022A0 */  sb          $2, %lo(CharaTex)($1)
/* 0209F0 01DCC6F0 02000224 */  addiu       $2, $0, 0x2
/* 0209F4 01DCC6F4 E401013C */  lui         $1, %hi(CharaTex + 0x1)
/* 0209F8 01DCC6F8 11D022A0 */  sb          $2, %lo(CharaTex + 0x1)($1)
/* 0209FC 01DCC6FC 03000224 */  addiu       $2, $0, 0x3
/* 020A00 01DCC700 E401013C */  lui         $1, %hi(CharaTex + 0x2)
/* 020A04 01DCC704 12D022A0 */  sb          $2, %lo(CharaTex + 0x2)($1)
/* 020A08 01DCC708 04000224 */  addiu       $2, $0, 0x4
/* 020A0C 01DCC70C E401013C */  lui         $1, %hi(CharaTex + 0x3)
/* 020A10 01DCC710 13D022A0 */  sb          $2, %lo(CharaTex + 0x3)($1)
/* 020A14 01DCC714 08000224 */  addiu       $2, $0, 0x8
/* 020A18 01DCC718 E401013C */  lui         $1, %hi(CharaTex + 0x7)
/* 020A1C 01DCC71C 17D022A0 */  sb          $2, %lo(CharaTex + 0x7)($1)
/* 020A20 01DCC720 09000224 */  addiu       $2, $0, 0x9
/* 020A24 01DCC724 E401013C */  lui         $1, %hi(CharaTex + 0x8)
/* 020A28 01DCC728 18D022A0 */  sb          $2, %lo(CharaTex + 0x8)($1)
/* 020A2C 01DCC72C DE01023C */  lui         $2, %hi(LIT_1037__3)
/* 020A30 01DCC730 60B34224 */  addiu       $2, $2, %lo(LIT_1037__3)
/* 020A34 01DCC734 E000A327 */  addiu       $3, $29, 0xE0
/* 020A38 01DCC738 00004278 */  lq          $2, 0x0($2)
/* 020A3C 01DCC73C 0000627C */  sq          $2, 0x0($3)
/* 020A40 01DCC740 E401013C */  lui         $1, %hi(CharaDataBuffer + 0x8)
/* 020A44 01DCC744 28D020AC */  sw          $0, %lo(CharaDataBuffer + 0x8)($1)
/* 020A48 01DCC748 28860070 */  paddub      $16, $0, $0
/* 020A4C 01DCC74C 0C000010 */  b           .L01DCC780_2D1F80
/* 020A50 01DCC750 00000000 */   nop
.L01DCC754_2D1F54:
/* 020A54 01DCC754 80101000 */  sll         $2, $16, 2
/* 020A58 01DCC758 21105000 */  addu        $2, $2, $16
/* 020A5C 01DCC75C 40100200 */  sll         $2, $2, 1
/* 020A60 01DCC760 21105000 */  addu        $2, $2, $16
/* 020A64 01DCC764 C0180200 */  sll         $3, $2, 3
/* 020A68 01DCC768 E501023C */  lui         $2, %hi(TexAnimeData__3)
/* 020A6C 01DCC76C F00A4224 */  addiu       $2, $2, %lo(TexAnimeData__3)
/* 020A70 01DCC770 21204300 */  addu        $4, $2, $3
/* 020A74 01DCC774 349C050C */  jal         Initialize__13CTexAnimeDataFv
/* 020A78 01DCC778 00000000 */   nop
/* 020A7C 01DCC77C 01001026 */  addiu       $16, $16, 0x1
.L01DCC780_2D1F80:
/* 020A80 01DCC780 1E00022A */  slti        $2, $16, 0x1E
/* 020A84 01DCC784 F3FF4014 */  bnez        $2, .L01DCC754_2D1F54
/* 020A88 01DCC788 00000000 */   nop
/* 020A8C 01DCC78C DF01023C */  lui         $2, %hi(Chara__3 + 0x3510)
/* 020A90 01DCC790 F0334424 */  addiu       $4, $2, %lo(Chara__3 + 0x3510)
/* 020A94 01DCC794 E501023C */  lui         $2, %hi(TexAnimeData__3)
/* 020A98 01DCC798 F00A4524 */  addiu       $5, $2, %lo(TexAnimeData__3)
/* 020A9C 01DCC79C 1E000624 */  addiu       $6, $0, 0x1E
/* 020AA0 01DCC7A0 FCDF040C */  jal         InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* 020AA4 01DCC7A4 00000000 */   nop
/* 020AA8 01DCC7A8 DF01023C */  lui         $2, %hi(Chara__3 + 0x3510)
/* 020AAC 01DCC7AC F0334424 */  addiu       $4, $2, %lo(Chara__3 + 0x3510)
/* 020AB0 01DCC7B0 282E0070 */  paddub      $5, $0, $0
/* 020AB4 01DCC7B4 20E0040C */  jal         TexAnimeOn__10CCharacterFi
/* 020AB8 01DCC7B8 00000000 */   nop
/* 020ABC 01DCC7BC DF01023C */  lui         $2, %hi(Chara__3)
/* 020AC0 01DCC7C0 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 020AC4 01DCC7C4 948B858F */  lw          $5, -0x746C($28)
/* 020AC8 01DCC7C8 DE01023C */  lui         $2, %hi(LIT_1081__2)
/* 020ACC 01DCC7CC 08044624 */  addiu       $6, $2, %lo(LIT_1081__2)
/* 020AD0 01DCC7D0 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 020AD4 01DCC7D4 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 020AD8 01DCC7D8 28460070 */  paddub      $8, $0, $0
/* 020ADC 01DCC7DC FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 020AE0 01DCC7E0 00000000 */   nop
/* 020AE4 01DCC7E4 DF01023C */  lui         $2, %hi(Chara__3)
/* 020AE8 01DCC7E8 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 020AEC 01DCC7EC 948B858F */  lw          $5, -0x746C($28)
/* 020AF0 01DCC7F0 DE01023C */  lui         $2, %hi(LIT_1082__3)
/* 020AF4 01DCC7F4 18044624 */  addiu       $6, $2, %lo(LIT_1082__3)
/* 020AF8 01DCC7F8 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 020AFC 01DCC7FC 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 020B00 01DCC800 28460070 */  paddub      $8, $0, $0
/* 020B04 01DCC804 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 020B08 01DCC808 00000000 */   nop
/* 020B0C 01DCC80C 28860070 */  paddub      $16, $0, $0
/* 020B10 01DCC810 2F000010 */  b           .L01DCC8D0_2D20D0
/* 020B14 01DCC814 00000000 */   nop
.L01DCC818_2D2018:
/* 020B18 01DCC818 B0110224 */  addiu       $2, $0, 0x11B0
/* 020B1C 01DCC81C 18880202 */  mult        $17, $16, $2
/* 020B20 01DCC820 DF01023C */  lui         $2, %hi(Chara__3)
/* 020B24 01DCC824 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 020B28 01DCC828 21205100 */  addu        $4, $2, $17
/* 020B2C 01DCC82C 80101000 */  sll         $2, $16, 2
/* 020B30 01DCC830 21105D00 */  addu        $2, $2, $29
/* 020B34 01DCC834 948B858F */  lw          $5, -0x746C($28)
/* 020B38 01DCC838 E000468C */  lw          $6, 0xE0($2)
/* 020B3C 01DCC83C E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 020B40 01DCC840 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 020B44 01DCC844 28460070 */  paddub      $8, $0, $0
/* 020B48 01DCC848 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 020B4C 01DCC84C 00000000 */   nop
/* 020B50 01DCC850 F000A427 */  addiu       $4, $29, 0xF0
/* 020B54 01DCC854 509F040C */  jal         __ct__10CFrameAttrFv
/* 020B58 01DCC858 00000000 */   nop
/* 020B5C 01DCC85C F800A0A3 */  sb          $0, 0xF8($29)
/* 020B60 01DCC860 DF01023C */  lui         $2, %hi(Chara__3 + 0xBC)
/* 020B64 01DCC864 9CFF4224 */  addiu       $2, $2, %lo(Chara__3 + 0xBC)
/* 020B68 01DCC868 21105100 */  addu        $2, $2, $17
/* 020B6C 01DCC86C 0000448C */  lw          $4, 0x0($2)
/* 020B70 01DCC870 F000A527 */  addiu       $5, $29, 0xF0
/* 020B74 01DCC874 01000624 */  addiu       $6, $0, 0x1
/* 020B78 01DCC878 04000724 */  addiu       $7, $0, 0x4
/* 020B7C 01DCC87C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 020B80 01DCC880 00000000 */   nop
/* 020B84 01DCC884 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 020B88 01DCC888 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F0)
/* 020B8C 01DCC88C D0014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F0)
/* 020B90 01DCC890 21105100 */  addu        $2, $2, $17
/* 020B94 01DCC894 000043AC */  sw          $3, 0x0($2)
/* 020B98 01DCC898 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 020B9C 01DCC89C DF01023C */  lui         $2, %hi(Chara__3 + 0x2F8)
/* 020BA0 01DCC8A0 D8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F8)
/* 020BA4 01DCC8A4 21105100 */  addu        $2, $2, $17
/* 020BA8 01DCC8A8 000040E4 */  swc1        $f0, 0x0($2)
/* 020BAC 01DCC8AC DF01023C */  lui         $2, %hi(Chara__3 + 0x304)
/* 020BB0 01DCC8B0 E4014224 */  addiu       $2, $2, %lo(Chara__3 + 0x304)
/* 020BB4 01DCC8B4 21105100 */  addu        $2, $2, $17
/* 020BB8 01DCC8B8 000040AC */  sw          $0, 0x0($2)
/* 020BBC 01DCC8BC DF01023C */  lui         $2, %hi(Chara__3 + 0x308)
/* 020BC0 01DCC8C0 E8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x308)
/* 020BC4 01DCC8C4 21105100 */  addu        $2, $2, $17
/* 020BC8 01DCC8C8 000040AC */  sw          $0, 0x0($2)
/* 020BCC 01DCC8CC 01001026 */  addiu       $16, $16, 0x1
.L01DCC8D0_2D20D0:
/* 020BD0 01DCC8D0 0400022A */  slti        $2, $16, 0x4
/* 020BD4 01DCC8D4 D0FF4014 */  bnez        $2, .L01DCC818_2D2018
/* 020BD8 01DCC8D8 00000000 */   nop
/* 020BDC 01DCC8DC 2041023C */  lui         $2, (0x41200000 >> 16)
/* 020BE0 01DCC8E0 DF01013C */  lui         $1, %hi(Chara__3 + 0x14A0)
/* 020BE4 01DCC8E4 801322AC */  sw          $2, %lo(Chara__3 + 0x14A0)($1)
/* 020BE8 01DCC8E8 F041023C */  lui         $2, (0x41F00000 >> 16)
/* 020BEC 01DCC8EC DF01013C */  lui         $1, %hi(Chara__3 + 0x2650)
/* 020BF0 01DCC8F0 302522AC */  sw          $2, %lo(Chara__3 + 0x2650)($1)
/* 020BF4 01DCC8F4 E401023C */  lui         $2, %hi(Wind__4)
/* 020BF8 01DCC8F8 C0CC4224 */  addiu       $2, $2, %lo(Wind__4)
/* 020BFC 01DCC8FC DF01013C */  lui         $1, %hi(Chara__3 + 0xC98)
/* 020C00 01DCC900 780B22AC */  sw          $2, %lo(Chara__3 + 0xC98)($1)
/* 020C04 01DCC904 DF01023C */  lui         $2, %hi(UraEventMan + 0x1C00)
/* 020C08 01DCC908 B07A4424 */  addiu       $4, $2, %lo(UraEventMan + 0x1C00)
/* 020C0C 01DCC90C 948B858F */  lw          $5, -0x746C($28)
/* 020C10 01DCC910 DE01023C */  lui         $2, %hi(LIT_1083__2)
/* 020C14 01DCC914 28044624 */  addiu       $6, $2, %lo(LIT_1083__2)
/* 020C18 01DCC918 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 020C1C 01DCC91C 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 020C20 01DCC920 28460070 */  paddub      $8, $0, $0
/* 020C24 01DCC924 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 020C28 01DCC928 00000000 */   nop
/* 020C2C 01DCC92C E001023C */  lui         $2, %hi(MainMonstorUnit + 0x490)
/* 020C30 01DCC930 608C4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x490)
/* 020C34 01DCC934 948B858F */  lw          $5, -0x746C($28)
/* 020C38 01DCC938 DE01023C */  lui         $2, %hi(LIT_1084__2)
/* 020C3C 01DCC93C 38044624 */  addiu       $6, $2, %lo(LIT_1084__2)
/* 020C40 01DCC940 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 020C44 01DCC944 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 020C48 01DCC948 28460070 */  paddub      $8, $0, $0
/* 020C4C 01DCC94C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 020C50 01DCC950 00000000 */   nop
/* 020C54 01DCC954 B89880AF */  sw          $0, -0x6748($28)
/* 020C58 01DCC958 B49880AF */  sw          $0, -0x674C($28)
/* 020C5C 01DCC95C DF01013C */  lui         $1, %hi(MapDataBuffer + 0x8)
/* 020C60 01DCC960 B8FE20AC */  sw          $0, %lo(MapDataBuffer + 0x8)($1)
/* 020C64 01DCC964 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 020C68 01DCC968 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 020C6C 01DCC96C A80E050C */  jal         Initialize__4CMapFv
/* 020C70 01DCC970 00000000 */   nop
/* 020C74 01DCC974 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 020C78 01DCC978 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 020C7C 01DCC97C A80E050C */  jal         Initialize__4CMapFv
/* 020C80 01DCC980 00000000 */   nop
/* 020C84 01DCC984 5001A427 */  addiu       $4, $29, 0x150
/* 020C88 01DCC988 509F040C */  jal         __ct__10CFrameAttrFv
/* 020C8C 01DCC98C 00000000 */   nop
/* 020C90 01DCC990 948B848F */  lw          $4, -0x746C($28)
/* 020C94 01DCC994 DE01023C */  lui         $2, %hi(LIT_1085)
/* 020C98 01DCC998 48044524 */  addiu       $5, $2, %lo(LIT_1085)
/* 020C9C 01DCC99C 28360070 */  paddub      $6, $0, $0
/* 020CA0 01DCC9A0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 020CA4 01DCC9A4 00000000 */   nop
/* 020CA8 01DCC9A8 28264070 */  paddub      $4, $2, $0
/* 020CAC 01DCC9AC DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 020CB0 01DCC9B0 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 020CB4 01DCC9B4 02000624 */  addiu       $6, $0, 0x2
/* 020CB8 01DCC9B8 283E0070 */  paddub      $7, $0, $0
/* 020CBC 01DCC9BC 28460070 */  paddub      $8, $0, $0
/* 020CC0 01DCC9C0 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 020CC4 01DCC9C4 00000000 */   nop
/* 020CC8 01DCC9C8 28864070 */  paddub      $16, $2, $0
/* 020CCC 01DCC9CC 01000624 */  addiu       $6, $0, 0x1
/* 020CD0 01DCC9D0 5C01A6A3 */  sb          $6, 0x15C($29)
/* 020CD4 01DCC9D4 28260072 */  paddub      $4, $16, $0
/* 020CD8 01DCC9D8 5001A527 */  addiu       $5, $29, 0x150
/* 020CDC 01DCC9DC 40000724 */  addiu       $7, $0, 0x40
/* 020CE0 01DCC9E0 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 020CE4 01DCC9E4 00000000 */   nop
/* 020CE8 01DCC9E8 28260072 */  paddub      $4, $16, $0
/* 020CEC 01DCC9EC 01000524 */  addiu       $5, $0, 0x1
/* 020CF0 01DCC9F0 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 020CF4 01DCC9F4 00000000 */   nop
/* 020CF8 01DCC9F8 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 020CFC 01DCC9FC 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 020D00 01DCCA00 282E0072 */  paddub      $5, $16, $0
/* 020D04 01DCCA04 28360070 */  paddub      $6, $0, $0
/* 020D08 01DCCA08 283E0070 */  paddub      $7, $0, $0
/* 020D0C 01DCCA0C 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 020D10 01DCCA10 00000000 */   nop
/* 020D14 01DCCA14 28864070 */  paddub      $16, $2, $0
/* 020D18 01DCCA18 0002A0AF */  sw          $0, 0x200($29)
/* 020D1C 01DCCA1C 0402A0AF */  sw          $0, 0x204($29)
/* 020D20 01DCCA20 0802A0AF */  sw          $0, 0x208($29)
/* 020D24 01DCCA24 28260072 */  paddub      $4, $16, $0
/* 020D28 01DCCA28 0002A527 */  addiu       $5, $29, 0x200
/* 020D2C 01DCCA2C A000598C */  lw          $25, 0xA0($2)
/* 020D30 01DCCA30 1000398F */  lw          $25, 0x10($25)
/* 020D34 01DCCA34 09F82003 */  jalr        $25
/* 020D38 01DCCA38 00000000 */   nop
/* 020D3C 01DCCA3C 1002A0AF */  sw          $0, 0x210($29)
/* 020D40 01DCCA40 1402A0AF */  sw          $0, 0x214($29)
/* 020D44 01DCCA44 1802A0AF */  sw          $0, 0x218($29)
/* 020D48 01DCCA48 28260072 */  paddub      $4, $16, $0
/* 020D4C 01DCCA4C 1002A527 */  addiu       $5, $29, 0x210
/* 020D50 01DCCA50 A000198E */  lw          $25, 0xA0($16)
/* 020D54 01DCCA54 2C00398F */  lw          $25, 0x2C($25)
/* 020D58 01DCCA58 09F82003 */  jalr        $25
/* 020D5C 01DCCA5C 00000000 */   nop
/* 020D60 01DCCA60 948B848F */  lw          $4, -0x746C($28)
/* 020D64 01DCCA64 DE01023C */  lui         $2, %hi(LIT_1086__3)
/* 020D68 01DCCA68 58044524 */  addiu       $5, $2, %lo(LIT_1086__3)
/* 020D6C 01DCCA6C 28360070 */  paddub      $6, $0, $0
/* 020D70 01DCCA70 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 020D74 01DCCA74 00000000 */   nop
/* 020D78 01DCCA78 28264070 */  paddub      $4, $2, $0
/* 020D7C 01DCCA7C DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 020D80 01DCCA80 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 020D84 01DCCA84 02000624 */  addiu       $6, $0, 0x2
/* 020D88 01DCCA88 283E0070 */  paddub      $7, $0, $0
/* 020D8C 01DCCA8C 28460070 */  paddub      $8, $0, $0
/* 020D90 01DCCA90 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 020D94 01DCCA94 00000000 */   nop
/* 020D98 01DCCA98 28864070 */  paddub      $16, $2, $0
/* 020D9C 01DCCA9C 28260072 */  paddub      $4, $16, $0
/* 020DA0 01DCCAA0 5001A527 */  addiu       $5, $29, 0x150
/* 020DA4 01DCCAA4 01000624 */  addiu       $6, $0, 0x1
/* 020DA8 01DCCAA8 40000724 */  addiu       $7, $0, 0x40
/* 020DAC 01DCCAAC D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 020DB0 01DCCAB0 00000000 */   nop
/* 020DB4 01DCCAB4 28260072 */  paddub      $4, $16, $0
/* 020DB8 01DCCAB8 01000524 */  addiu       $5, $0, 0x1
/* 020DBC 01DCCABC BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 020DC0 01DCCAC0 00000000 */   nop
/* 020DC4 01DCCAC4 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 020DC8 01DCCAC8 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 020DCC 01DCCACC 282E0072 */  paddub      $5, $16, $0
/* 020DD0 01DCCAD0 28360070 */  paddub      $6, $0, $0
/* 020DD4 01DCCAD4 283E0070 */  paddub      $7, $0, $0
/* 020DD8 01DCCAD8 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 020DDC 01DCCADC 00000000 */   nop
/* 020DE0 01DCCAE0 28864070 */  paddub      $16, $2, $0
/* 020DE4 01DCCAE4 2002A0AF */  sw          $0, 0x220($29)
/* 020DE8 01DCCAE8 2402A0AF */  sw          $0, 0x224($29)
/* 020DEC 01DCCAEC 2802A0AF */  sw          $0, 0x228($29)
/* 020DF0 01DCCAF0 28260072 */  paddub      $4, $16, $0
/* 020DF4 01DCCAF4 2002A527 */  addiu       $5, $29, 0x220
/* 020DF8 01DCCAF8 A000598C */  lw          $25, 0xA0($2)
/* 020DFC 01DCCAFC 1000398F */  lw          $25, 0x10($25)
/* 020E00 01DCCB00 09F82003 */  jalr        $25
/* 020E04 01DCCB04 00000000 */   nop
/* 020E08 01DCCB08 3002A0AF */  sw          $0, 0x230($29)
/* 020E0C 01DCCB0C 3402A0AF */  sw          $0, 0x234($29)
/* 020E10 01DCCB10 3802A0AF */  sw          $0, 0x238($29)
/* 020E14 01DCCB14 28260072 */  paddub      $4, $16, $0
/* 020E18 01DCCB18 3002A527 */  addiu       $5, $29, 0x230
/* 020E1C 01DCCB1C A000198E */  lw          $25, 0xA0($16)
/* 020E20 01DCCB20 2C00398F */  lw          $25, 0x2C($25)
/* 020E24 01DCCB24 09F82003 */  jalr        $25
/* 020E28 01DCCB28 00000000 */   nop
/* 020E2C 01DCCB2C E501013C */  lui         $1, %hi(PathDataBuffer + 0x8)
/* 020E30 01DCCB30 C80A20AC */  sw          $0, %lo(PathDataBuffer + 0x8)($1)
/* 020E34 01DCCB34 FFFF0224 */  addiu       $2, $0, -0x1
/* 020E38 01DCCB38 C09B82AF */  sw          $2, -0x6440($28)
/* 020E3C 01DCCB3C DE01023C */  lui         $2, %hi(LIT_1051__2)
/* 020E40 01DCCB40 70B34224 */  addiu       $2, $2, %lo(LIT_1051__2)
/* 020E44 01DCCB44 B001A327 */  addiu       $3, $29, 0x1B0
/* 020E48 01DCCB48 00004278 */  lq          $2, 0x0($2)
/* 020E4C 01DCCB4C 0000627C */  sq          $2, 0x0($3)
/* 020E50 01DCCB50 28860070 */  paddub      $16, $0, $0
/* 020E54 01DCCB54 27000010 */  b           .L01DCCBF4_2D23F4
/* 020E58 01DCCB58 00000000 */   nop
.L01DCCB5C_2D235C:
/* 020E5C 01DCCB5C B0110224 */  addiu       $2, $0, 0x11B0
/* 020E60 01DCCB60 18880202 */  mult        $17, $16, $2
/* 020E64 01DCCB64 E501023C */  lui         $2, %hi(Cam)
/* 020E68 01DCCB68 F0C34224 */  addiu       $2, $2, %lo(Cam)
/* 020E6C 01DCCB6C 21205100 */  addu        $4, $2, $17
/* 020E70 01DCCB70 80101000 */  sll         $2, $16, 2
/* 020E74 01DCCB74 21105D00 */  addu        $2, $2, $29
/* 020E78 01DCCB78 948B858F */  lw          $5, -0x746C($28)
/* 020E7C 01DCCB7C B001468C */  lw          $6, 0x1B0($2)
/* 020E80 01DCCB80 E501023C */  lui         $2, %hi(PathDataBuffer)
/* 020E84 01DCCB84 C00A4724 */  addiu       $7, $2, %lo(PathDataBuffer)
/* 020E88 01DCCB88 28460070 */  paddub      $8, $0, $0
/* 020E8C 01DCCB8C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 020E90 01DCCB90 00000000 */   nop
/* 020E94 01DCCB94 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 020E98 01DCCB98 E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 020E9C 01DCCB9C E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 020EA0 01DCCBA0 21105100 */  addu        $2, $2, $17
/* 020EA4 01DCCBA4 000043AC */  sw          $3, 0x0($2)
/* 020EA8 01DCCBA8 E501023C */  lui         $2, %hi(Cam + 0x2F8)
/* 020EAC 01DCCBAC E8C64224 */  addiu       $2, $2, %lo(Cam + 0x2F8)
/* 020EB0 01DCCBB0 21105100 */  addu        $2, $2, $17
/* 020EB4 01DCCBB4 000043AC */  sw          $3, 0x0($2)
/* 020EB8 01DCCBB8 E501023C */  lui         $2, %hi(Cam + 0x304)
/* 020EBC 01DCCBBC F4C64224 */  addiu       $2, $2, %lo(Cam + 0x304)
/* 020EC0 01DCCBC0 21105100 */  addu        $2, $2, $17
/* 020EC4 01DCCBC4 000040AC */  sw          $0, 0x0($2)
/* 020EC8 01DCCBC8 E501023C */  lui         $2, %hi(Cam + 0x308)
/* 020ECC 01DCCBCC F8C64224 */  addiu       $2, $2, %lo(Cam + 0x308)
/* 020ED0 01DCCBD0 21105100 */  addu        $2, $2, $17
/* 020ED4 01DCCBD4 000040AC */  sw          $0, 0x0($2)
/* 020ED8 01DCCBD8 E301023C */  lui         $2, %hi(MainCamera__3)
/* 020EDC 01DCCBDC 80E64324 */  addiu       $3, $2, %lo(MainCamera__3)
/* 020EE0 01DCCBE0 E501023C */  lui         $2, %hi(Cam + 0x310)
/* 020EE4 01DCCBE4 00C74224 */  addiu       $2, $2, %lo(Cam + 0x310)
/* 020EE8 01DCCBE8 21105100 */  addu        $2, $2, $17
/* 020EEC 01DCCBEC 000043AC */  sw          $3, 0x0($2)
/* 020EF0 01DCCBF0 01001026 */  addiu       $16, $16, 0x1
.L01DCCBF4_2D23F4:
/* 020EF4 01DCCBF4 0300022A */  slti        $2, $16, 0x3
/* 020EF8 01DCCBF8 D8FF4014 */  bnez        $2, .L01DCCB5C_2D235C
/* 020EFC 01DCCBFC 00000000 */   nop
/* 020F00 01DCCC00 B89880AF */  sw          $0, -0x6748($28)
/* 020F04 01DCCC04 B49880AF */  sw          $0, -0x674C($28)
/* 020F08 01DCCC08 DE01023C */  lui         $2, %hi(LIT_1087__2)
/* 020F0C 01DCCC0C 70044424 */  addiu       $4, $2, %lo(LIT_1087__2)
/* 020F10 01DCCC10 00C5760C */  jal         OPAnalyz__FPc
/* 020F14 01DCCC14 00000000 */   nop
/* 020F18 01DCCC18 4CCA760C */  jal         OPMdsLoad__Fv
/* 020F1C 01DCCC1C 00000000 */   nop
/* 020F20 01DCCC20 DE01023C */  lui         $2, %hi(LIT_1057)
/* 020F24 01DCCC24 80B34224 */  addiu       $2, $2, %lo(LIT_1057)
/* 020F28 01DCCC28 C001A527 */  addiu       $5, $29, 0x1C0
/* 020F2C 01DCCC2C 00004278 */  lq          $2, 0x0($2)
/* 020F30 01DCCC30 0000A27C */  sq          $2, 0x0($5)
/* 020F34 01DCCC34 DE01023C */  lui         $2, %hi(LIT_1058)
/* 020F38 01DCCC38 90B34224 */  addiu       $2, $2, %lo(LIT_1058)
/* 020F3C 01DCCC3C D001A627 */  addiu       $6, $29, 0x1D0
/* 020F40 01DCCC40 00004278 */  lq          $2, 0x0($2)
/* 020F44 01DCCC44 0000C27C */  sq          $2, 0x0($6)
/* 020F48 01DCCC48 DE01023C */  lui         $2, %hi(LIT_1059)
/* 020F4C 01DCCC4C A0B34224 */  addiu       $2, $2, %lo(LIT_1059)
/* 020F50 01DCCC50 E001A727 */  addiu       $7, $29, 0x1E0
/* 020F54 01DCCC54 00004278 */  lq          $2, 0x0($2)
/* 020F58 01DCCC58 0000E27C */  sq          $2, 0x0($7)
/* 020F5C 01DCCC5C DE01023C */  lui         $2, %hi(LIT_1060__2)
/* 020F60 01DCCC60 B0B34224 */  addiu       $2, $2, %lo(LIT_1060__2)
/* 020F64 01DCCC64 F001A827 */  addiu       $8, $29, 0x1F0
/* 020F68 01DCCC68 00004278 */  lq          $2, 0x0($2)
/* 020F6C 01DCCC6C 0000027D */  sq          $2, 0x0($8)
/* 020F70 01DCCC70 E401023C */  lui         $2, %hi(Water__2)
/* 020F74 01DCCC74 F0CC4424 */  addiu       $4, $2, %lo(Water__2)
/* 020F78 01DCCC78 B884050C */  jal         SetVertex__6CWaterFPfPfPfPf
/* 020F7C 01DCCC7C 00000000 */   nop
/* 020F80 01DCCC80 80C0023C */  lui         $2, (0xC0800000 >> 16)
/* 020F84 01DCCC84 00688244 */  mtc1        $2, $f13
/* 020F88 01DCCC88 00708044 */  mtc1        $0, $f14
/* 020F8C 01DCCC8C 00000000 */  nop
/* 020F90 01DCCC90 06730046 */  mov.s       $f12, $f14
/* 020F94 01DCCC94 E401023C */  lui         $2, %hi(Water__2 + 0xB0)
/* 020F98 01DCCC98 A0CD4424 */  addiu       $4, $2, %lo(Water__2 + 0xB0)
/* 020F9C 01DCCC9C A09F040C */  jal         SetPosition__6CFrameFfff
/* 020FA0 01DCCCA0 00000000 */   nop
/* 020FA4 01DCCCA4 E401023C */  lui         $2, %hi(Water__2)
/* 020FA8 01DCCCA8 F0CC4424 */  addiu       $4, $2, %lo(Water__2)
/* 020FAC 01DCCCAC 18000524 */  addiu       $5, $0, 0x18
/* 020FB0 01DCCCB0 2836A070 */  paddub      $6, $5, $0
/* 020FB4 01DCCCB4 E501023C */  lui         $2, %hi(WaterBuffer)
/* 020FB8 01DCCCB8 D00A4724 */  addiu       $7, $2, %lo(WaterBuffer)
/* 020FBC 01DCCCBC 0485050C */  jal         SetSize__6CWaterFiiP14CDataAlloc2_1_
/* 020FC0 01DCCCC0 00000000 */   nop
/* 020FC4 01DCCCC4 00708044 */  mtc1        $0, $f14
/* 020FC8 01DCCCC8 0040023C */  lui         $2, (0x40000000 >> 16)
/* 020FCC 01DCCCCC 00788244 */  mtc1        $2, $f15
/* 020FD0 01DCCCD0 E401023C */  lui         $2, %hi(Water__2)
/* 020FD4 01DCCCD4 F0CC4424 */  addiu       $4, $2, %lo(Water__2)
/* 020FD8 01DCCCD8 80808CC7 */  lwc1        $f12, -0x7F80($28)
/* 020FDC 01DCCCDC F8808DC7 */  lwc1        $f13, -0x7F08($28)
/* 020FE0 01DCCCE0 E881050C */  jal         SetParam__6CWaterFffff
/* 020FE4 01DCCCE4 00000000 */   nop
/* 020FE8 01DCCCE8 E401023C */  lui         $2, %hi(Water__2)
/* 020FEC 01DCCCEC F0CC4424 */  addiu       $4, $2, %lo(Water__2)
/* 020FF0 01DCCCF0 64000524 */  addiu       $5, $0, 0x64
/* 020FF4 01DCCCF4 6E000624 */  addiu       $6, $0, 0x6E
/* 020FF8 01DCCCF8 78000724 */  addiu       $7, $0, 0x78
/* 020FFC 01DCCCFC 80000824 */  addiu       $8, $0, 0x80
/* 021000 01DCCD00 F081050C */  jal         SetColor__6CWaterFUcUcUcUc
/* 021004 01DCCD04 00000000 */   nop
/* 021008 01DCCD08 2000BF7B */  lq          $31, 0x20($29)
/* 02100C 01DCCD0C 1000B17B */  lq          $17, 0x10($29)
/* 021010 01DCCD10 0000B07B */  lq          $16, 0x0($29)
/* 021014 01DCCD14 4002BD27 */  addiu       $29, $29, 0x240
/* 021018 01DCCD18 0800E003 */  jr          $31
/* 02101C 01DCCD1C 00000000 */   nop
