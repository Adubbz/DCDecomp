.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitProcE__Fv
/* 0229A0 01DCE6A0 50FEBD27 */  addiu       $29, $29, -0x1B0
/* 0229A4 01DCE6A4 2000BF7F */  sq          $31, 0x20($29)
/* 0229A8 01DCE6A8 1000B17F */  sq          $17, 0x10($29)
/* 0229AC 01DCE6AC 0000B07F */  sq          $16, 0x0($29)
/* 0229B0 01DCE6B0 DE01023C */  lui         $2, %hi(LIT_1325__2)
/* 0229B4 01DCE6B4 40B74524 */  addiu       $5, $2, %lo(LIT_1325__2)
/* 0229B8 01DCE6B8 3000A427 */  addiu       $4, $29, 0x30
/* 0229BC 01DCE6BC 07000324 */  addiu       $3, $0, 0x7
.L01DCE6C0_2D3EC0:
/* 0229C0 01DCE6C0 0000A278 */  lq          $2, 0x0($5)
/* 0229C4 01DCE6C4 1000A524 */  addiu       $5, $5, 0x10
/* 0229C8 01DCE6C8 FFFF6324 */  addiu       $3, $3, -0x1
/* 0229CC 01DCE6CC 0000827C */  sq          $2, 0x0($4)
/* 0229D0 01DCE6D0 10008424 */  addiu       $4, $4, 0x10
/* 0229D4 01DCE6D4 FAFF601C */  bgtz        $3, .L01DCE6C0_2D3EC0
/* 0229D8 01DCE6D8 00000000 */   nop
/* 0229DC 01DCE6DC 0000A2DC */  ld          $2, 0x0($5)
/* 0229E0 01DCE6E0 000082FC */  sd          $2, 0x0($4)
/* 0229E4 01DCE6E4 948B848F */  lw          $4, -0x746C($28)
/* 0229E8 01DCE6E8 DE01023C */  lui         $2, %hi(LIT_937__5)
/* 0229EC 01DCE6EC 10024524 */  addiu       $5, $2, %lo(LIT_937__5)
/* 0229F0 01DCE6F0 28360070 */  paddub      $6, $0, $0
/* 0229F4 01DCE6F4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0229F8 01DCE6F8 00000000 */   nop
/* 0229FC 01DCE6FC 5400A2AF */  sw          $2, 0x54($29)
/* 022A00 01DCE700 948B848F */  lw          $4, -0x746C($28)
/* 022A04 01DCE704 DE01023C */  lui         $2, %hi(LIT_1357__2)
/* 022A08 01DCE708 48074524 */  addiu       $5, $2, %lo(LIT_1357__2)
/* 022A0C 01DCE70C 28360070 */  paddub      $6, $0, $0
/* 022A10 01DCE710 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 022A14 01DCE714 00000000 */   nop
/* 022A18 01DCE718 6000A2AF */  sw          $2, 0x60($29)
/* 022A1C 01DCE71C 948B848F */  lw          $4, -0x746C($28)
/* 022A20 01DCE720 DE01023C */  lui         $2, %hi(LIT_939__2)
/* 022A24 01DCE724 30024524 */  addiu       $5, $2, %lo(LIT_939__2)
/* 022A28 01DCE728 28360070 */  paddub      $6, $0, $0
/* 022A2C 01DCE72C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 022A30 01DCE730 00000000 */   nop
/* 022A34 01DCE734 6C00A2AF */  sw          $2, 0x6C($29)
/* 022A38 01DCE738 948B848F */  lw          $4, -0x746C($28)
/* 022A3C 01DCE73C DE01023C */  lui         $2, %hi(LIT_1299)
/* 022A40 01DCE740 88064524 */  addiu       $5, $2, %lo(LIT_1299)
/* 022A44 01DCE744 28360070 */  paddub      $6, $0, $0
/* 022A48 01DCE748 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 022A4C 01DCE74C 00000000 */   nop
/* 022A50 01DCE750 7800A2AF */  sw          $2, 0x78($29)
/* 022A54 01DCE754 948B848F */  lw          $4, -0x746C($28)
/* 022A58 01DCE758 DE01023C */  lui         $2, %hi(LIT_1358__2)
/* 022A5C 01DCE75C 58074524 */  addiu       $5, $2, %lo(LIT_1358__2)
/* 022A60 01DCE760 28360070 */  paddub      $6, $0, $0
/* 022A64 01DCE764 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 022A68 01DCE768 00000000 */   nop
/* 022A6C 01DCE76C 8400A2AF */  sw          $2, 0x84($29)
/* 022A70 01DCE770 948B848F */  lw          $4, -0x746C($28)
/* 022A74 01DCE774 DE01023C */  lui         $2, %hi(LIT_1359__2)
/* 022A78 01DCE778 68074524 */  addiu       $5, $2, %lo(LIT_1359__2)
/* 022A7C 01DCE77C 28360070 */  paddub      $6, $0, $0
/* 022A80 01DCE780 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 022A84 01DCE784 00000000 */   nop
/* 022A88 01DCE788 9000A2AF */  sw          $2, 0x90($29)
/* 022A8C 01DCE78C C701023C */  lui         $2, %hi(TexManager)
/* 022A90 01DCE790 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 022A94 01DCE794 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 022A98 01DCE798 F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 022A9C 01DCE79C 00000000 */   nop
/* 022AA0 01DCE7A0 C701023C */  lui         $2, %hi(TexManager)
/* 022AA4 01DCE7A4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 022AA8 01DCE7A8 FFFF0524 */  addiu       $5, $0, -0x1
/* 022AAC 01DCE7AC 3000A627 */  addiu       $6, $29, 0x30
/* 022AB0 01DCE7B0 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 022AB4 01DCE7B4 00000000 */   nop
/* 022AB8 01DCE7B8 01000224 */  addiu       $2, $0, 0x1
/* 022ABC 01DCE7BC E401013C */  lui         $1, %hi(CharaTex)
/* 022AC0 01DCE7C0 10D022A0 */  sb          $2, %lo(CharaTex)($1)
/* 022AC4 01DCE7C4 02000224 */  addiu       $2, $0, 0x2
/* 022AC8 01DCE7C8 E401013C */  lui         $1, %hi(CharaTex + 0x1)
/* 022ACC 01DCE7CC 11D022A0 */  sb          $2, %lo(CharaTex + 0x1)($1)
/* 022AD0 01DCE7D0 A801A327 */  addiu       $3, $29, 0x1A8
/* 022AD4 01DCE7D4 B08A82DF */  ld          $2, -0x7550($28)
/* 022AD8 01DCE7D8 000062FC */  sd          $2, 0x0($3)
/* 022ADC 01DCE7DC E401013C */  lui         $1, %hi(CharaDataBuffer + 0x8)
/* 022AE0 01DCE7E0 28D020AC */  sw          $0, %lo(CharaDataBuffer + 0x8)($1)
/* 022AE4 01DCE7E4 28860070 */  paddub      $16, $0, $0
/* 022AE8 01DCE7E8 0C000010 */  b           .L01DCE81C_2D401C
/* 022AEC 01DCE7EC 00000000 */   nop
.L01DCE7F0_2D3FF0:
/* 022AF0 01DCE7F0 80101000 */  sll         $2, $16, 2
/* 022AF4 01DCE7F4 21105000 */  addu        $2, $2, $16
/* 022AF8 01DCE7F8 40100200 */  sll         $2, $2, 1
/* 022AFC 01DCE7FC 21105000 */  addu        $2, $2, $16
/* 022B00 01DCE800 C0180200 */  sll         $3, $2, 3
/* 022B04 01DCE804 E501023C */  lui         $2, %hi(TexAnimeData__3)
/* 022B08 01DCE808 F00A4224 */  addiu       $2, $2, %lo(TexAnimeData__3)
/* 022B0C 01DCE80C 21204300 */  addu        $4, $2, $3
/* 022B10 01DCE810 349C050C */  jal         Initialize__13CTexAnimeDataFv
/* 022B14 01DCE814 00000000 */   nop
/* 022B18 01DCE818 01001026 */  addiu       $16, $16, 0x1
.L01DCE81C_2D401C:
/* 022B1C 01DCE81C 1E00022A */  slti        $2, $16, 0x1E
/* 022B20 01DCE820 F3FF4014 */  bnez        $2, .L01DCE7F0_2D3FF0
/* 022B24 01DCE824 00000000 */   nop
/* 022B28 01DCE828 DF01023C */  lui         $2, %hi(Chara__3)
/* 022B2C 01DCE82C E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 022B30 01DCE830 E501023C */  lui         $2, %hi(TexAnimeData__3)
/* 022B34 01DCE834 F00A4524 */  addiu       $5, $2, %lo(TexAnimeData__3)
/* 022B38 01DCE838 1E000624 */  addiu       $6, $0, 0x1E
/* 022B3C 01DCE83C FCDF040C */  jal         InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* 022B40 01DCE840 00000000 */   nop
/* 022B44 01DCE844 DF01023C */  lui         $2, %hi(Chara__3 + 0x11B0)
/* 022B48 01DCE848 90104424 */  addiu       $4, $2, %lo(Chara__3 + 0x11B0)
/* 022B4C 01DCE84C E501023C */  lui         $2, %hi(TexAnimeData__3)
/* 022B50 01DCE850 F00A4524 */  addiu       $5, $2, %lo(TexAnimeData__3)
/* 022B54 01DCE854 1E000624 */  addiu       $6, $0, 0x1E
/* 022B58 01DCE858 FCDF040C */  jal         InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* 022B5C 01DCE85C 00000000 */   nop
/* 022B60 01DCE860 DF01023C */  lui         $2, %hi(Chara__3)
/* 022B64 01DCE864 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 022B68 01DCE868 948B858F */  lw          $5, -0x746C($28)
/* 022B6C 01DCE86C DE01023C */  lui         $2, %hi(LIT_1081__2)
/* 022B70 01DCE870 08044624 */  addiu       $6, $2, %lo(LIT_1081__2)
/* 022B74 01DCE874 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 022B78 01DCE878 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 022B7C 01DCE87C 28460070 */  paddub      $8, $0, $0
/* 022B80 01DCE880 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 022B84 01DCE884 00000000 */   nop
/* 022B88 01DCE888 28860070 */  paddub      $16, $0, $0
/* 022B8C 01DCE88C 2F000010 */  b           .L01DCE94C_2D414C
/* 022B90 01DCE890 00000000 */   nop
.L01DCE894_2D4094:
/* 022B94 01DCE894 B0110224 */  addiu       $2, $0, 0x11B0
/* 022B98 01DCE898 18880202 */  mult        $17, $16, $2
/* 022B9C 01DCE89C DF01023C */  lui         $2, %hi(Chara__3)
/* 022BA0 01DCE8A0 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 022BA4 01DCE8A4 21205100 */  addu        $4, $2, $17
/* 022BA8 01DCE8A8 80101000 */  sll         $2, $16, 2
/* 022BAC 01DCE8AC 21105D00 */  addu        $2, $2, $29
/* 022BB0 01DCE8B0 948B858F */  lw          $5, -0x746C($28)
/* 022BB4 01DCE8B4 A801468C */  lw          $6, 0x1A8($2)
/* 022BB8 01DCE8B8 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 022BBC 01DCE8BC 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 022BC0 01DCE8C0 28460070 */  paddub      $8, $0, $0
/* 022BC4 01DCE8C4 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 022BC8 01DCE8C8 00000000 */   nop
/* 022BCC 01DCE8CC B000A427 */  addiu       $4, $29, 0xB0
/* 022BD0 01DCE8D0 509F040C */  jal         __ct__10CFrameAttrFv
/* 022BD4 01DCE8D4 00000000 */   nop
/* 022BD8 01DCE8D8 B800A0A3 */  sb          $0, 0xB8($29)
/* 022BDC 01DCE8DC DF01023C */  lui         $2, %hi(Chara__3 + 0xBC)
/* 022BE0 01DCE8E0 9CFF4224 */  addiu       $2, $2, %lo(Chara__3 + 0xBC)
/* 022BE4 01DCE8E4 21105100 */  addu        $2, $2, $17
/* 022BE8 01DCE8E8 0000448C */  lw          $4, 0x0($2)
/* 022BEC 01DCE8EC B000A527 */  addiu       $5, $29, 0xB0
/* 022BF0 01DCE8F0 01000624 */  addiu       $6, $0, 0x1
/* 022BF4 01DCE8F4 04000724 */  addiu       $7, $0, 0x4
/* 022BF8 01DCE8F8 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 022BFC 01DCE8FC 00000000 */   nop
/* 022C00 01DCE900 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 022C04 01DCE904 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F0)
/* 022C08 01DCE908 D0014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F0)
/* 022C0C 01DCE90C 21105100 */  addu        $2, $2, $17
/* 022C10 01DCE910 000043AC */  sw          $3, 0x0($2)
/* 022C14 01DCE914 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 022C18 01DCE918 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F8)
/* 022C1C 01DCE91C D8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F8)
/* 022C20 01DCE920 21105100 */  addu        $2, $2, $17
/* 022C24 01DCE924 000040E4 */  swc1        $f0, 0x0($2)
/* 022C28 01DCE928 DF01023C */  lui         $2, %hi(Chara__3 + 0x304)
/* 022C2C 01DCE92C E4014224 */  addiu       $2, $2, %lo(Chara__3 + 0x304)
/* 022C30 01DCE930 21105100 */  addu        $2, $2, $17
/* 022C34 01DCE934 000040AC */  sw          $0, 0x0($2)
/* 022C38 01DCE938 DF01023C */  lui         $2, %hi(Chara__3 + 0x308)
/* 022C3C 01DCE93C E8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x308)
/* 022C40 01DCE940 21105100 */  addu        $2, $2, $17
/* 022C44 01DCE944 000040AC */  sw          $0, 0x0($2)
/* 022C48 01DCE948 01001026 */  addiu       $16, $16, 0x1
.L01DCE94C_2D414C:
/* 022C4C 01DCE94C 0200022A */  slti        $2, $16, 0x2
/* 022C50 01DCE950 D0FF4014 */  bnez        $2, .L01DCE894_2D4094
/* 022C54 01DCE954 00000000 */   nop
/* 022C58 01DCE958 DF01023C */  lui         $2, %hi(Chara__3)
/* 022C5C 01DCE95C E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 022C60 01DCE960 02000524 */  addiu       $5, $0, 0x2
/* 022C64 01DCE964 20E0040C */  jal         TexAnimeOn__10CCharacterFi
/* 022C68 01DCE968 00000000 */   nop
/* 022C6C 01DCE96C DF01023C */  lui         $2, %hi(Chara__3 + 0x11B0)
/* 022C70 01DCE970 90104424 */  addiu       $4, $2, %lo(Chara__3 + 0x11B0)
/* 022C74 01DCE974 01000524 */  addiu       $5, $0, 0x1
/* 022C78 01DCE978 20E0040C */  jal         TexAnimeOn__10CCharacterFi
/* 022C7C 01DCE97C 00000000 */   nop
/* 022C80 01DCE980 E401023C */  lui         $2, %hi(Wind__4)
/* 022C84 01DCE984 C0CC4224 */  addiu       $2, $2, %lo(Wind__4)
/* 022C88 01DCE988 DF01013C */  lui         $1, %hi(Chara__3 + 0xC98)
/* 022C8C 01DCE98C 780B22AC */  sw          $2, %lo(Chara__3 + 0xC98)($1)
/* 022C90 01DCE990 B89880AF */  sw          $0, -0x6748($28)
/* 022C94 01DCE994 B49880AF */  sw          $0, -0x674C($28)
/* 022C98 01DCE998 DF01013C */  lui         $1, %hi(MapDataBuffer + 0x8)
/* 022C9C 01DCE99C B8FE20AC */  sw          $0, %lo(MapDataBuffer + 0x8)($1)
/* 022CA0 01DCE9A0 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 022CA4 01DCE9A4 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 022CA8 01DCE9A8 A80E050C */  jal         Initialize__4CMapFv
/* 022CAC 01DCE9AC 00000000 */   nop
/* 022CB0 01DCE9B0 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 022CB4 01DCE9B4 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 022CB8 01DCE9B8 A80E050C */  jal         Initialize__4CMapFv
/* 022CBC 01DCE9BC 00000000 */   nop
/* 022CC0 01DCE9C0 E201023C */  lui         $2, %hi(OP_BuildingMap2)
/* 022CC4 01DCE9C4 40AF4424 */  addiu       $4, $2, %lo(OP_BuildingMap2)
/* 022CC8 01DCE9C8 A80E050C */  jal         Initialize__4CMapFv
/* 022CCC 01DCE9CC 00000000 */   nop
/* 022CD0 01DCE9D0 1001A427 */  addiu       $4, $29, 0x110
/* 022CD4 01DCE9D4 509F040C */  jal         __ct__10CFrameAttrFv
/* 022CD8 01DCE9D8 00000000 */   nop
/* 022CDC 01DCE9DC 948B848F */  lw          $4, -0x746C($28)
/* 022CE0 01DCE9E0 DE01023C */  lui         $2, %hi(LIT_1360__2)
/* 022CE4 01DCE9E4 78074524 */  addiu       $5, $2, %lo(LIT_1360__2)
/* 022CE8 01DCE9E8 28360070 */  paddub      $6, $0, $0
/* 022CEC 01DCE9EC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 022CF0 01DCE9F0 00000000 */   nop
/* 022CF4 01DCE9F4 28264070 */  paddub      $4, $2, $0
/* 022CF8 01DCE9F8 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 022CFC 01DCE9FC B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 022D00 01DCEA00 02000624 */  addiu       $6, $0, 0x2
/* 022D04 01DCEA04 283E0070 */  paddub      $7, $0, $0
/* 022D08 01DCEA08 28460070 */  paddub      $8, $0, $0
/* 022D0C 01DCEA0C AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 022D10 01DCEA10 00000000 */   nop
/* 022D14 01DCEA14 28864070 */  paddub      $16, $2, $0
/* 022D18 01DCEA18 01000624 */  addiu       $6, $0, 0x1
/* 022D1C 01DCEA1C 1C01A6A3 */  sb          $6, 0x11C($29)
/* 022D20 01DCEA20 28260072 */  paddub      $4, $16, $0
/* 022D24 01DCEA24 1001A527 */  addiu       $5, $29, 0x110
/* 022D28 01DCEA28 40000724 */  addiu       $7, $0, 0x40
/* 022D2C 01DCEA2C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 022D30 01DCEA30 00000000 */   nop
/* 022D34 01DCEA34 28260072 */  paddub      $4, $16, $0
/* 022D38 01DCEA38 01000524 */  addiu       $5, $0, 0x1
/* 022D3C 01DCEA3C BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 022D40 01DCEA40 00000000 */   nop
/* 022D44 01DCEA44 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 022D48 01DCEA48 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 022D4C 01DCEA4C 282E0072 */  paddub      $5, $16, $0
/* 022D50 01DCEA50 28360070 */  paddub      $6, $0, $0
/* 022D54 01DCEA54 283E0070 */  paddub      $7, $0, $0
/* 022D58 01DCEA58 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 022D5C 01DCEA5C 00000000 */   nop
/* 022D60 01DCEA60 28864070 */  paddub      $16, $2, $0
/* 022D64 01DCEA64 8001A0AF */  sw          $0, 0x180($29)
/* 022D68 01DCEA68 8401A0AF */  sw          $0, 0x184($29)
/* 022D6C 01DCEA6C 8801A0AF */  sw          $0, 0x188($29)
/* 022D70 01DCEA70 28260072 */  paddub      $4, $16, $0
/* 022D74 01DCEA74 8001A527 */  addiu       $5, $29, 0x180
/* 022D78 01DCEA78 A000598C */  lw          $25, 0xA0($2)
/* 022D7C 01DCEA7C 1000398F */  lw          $25, 0x10($25)
/* 022D80 01DCEA80 09F82003 */  jalr        $25
/* 022D84 01DCEA84 00000000 */   nop
/* 022D88 01DCEA88 9001A0AF */  sw          $0, 0x190($29)
/* 022D8C 01DCEA8C 9401A0AF */  sw          $0, 0x194($29)
/* 022D90 01DCEA90 9801A0AF */  sw          $0, 0x198($29)
/* 022D94 01DCEA94 28260072 */  paddub      $4, $16, $0
/* 022D98 01DCEA98 9001A527 */  addiu       $5, $29, 0x190
/* 022D9C 01DCEA9C A000198E */  lw          $25, 0xA0($16)
/* 022DA0 01DCEAA0 2C00398F */  lw          $25, 0x2C($25)
/* 022DA4 01DCEAA4 09F82003 */  jalr        $25
/* 022DA8 01DCEAA8 00000000 */   nop
/* 022DAC 01DCEAAC 28260072 */  paddub      $4, $16, $0
/* 022DB0 01DCEAB0 DE01023C */  lui         $2, %hi(LIT_1361__2)
/* 022DB4 01DCEAB4 88074524 */  addiu       $5, $2, %lo(LIT_1361__2)
/* 022DB8 01DCEAB8 28360070 */  paddub      $6, $0, $0
/* 022DBC 01DCEABC A000198E */  lw          $25, 0xA0($16)
/* 022DC0 01DCEAC0 9000398F */  lw          $25, 0x90($25)
/* 022DC4 01DCEAC4 09F82003 */  jalr        $25
/* 022DC8 01DCEAC8 00000000 */   nop
/* 022DCC 01DCEACC E501013C */  lui         $1, %hi(PathDataBuffer + 0x8)
/* 022DD0 01DCEAD0 C80A20AC */  sw          $0, %lo(PathDataBuffer + 0x8)($1)
/* 022DD4 01DCEAD4 FFFF0224 */  addiu       $2, $0, -0x1
/* 022DD8 01DCEAD8 C09B82AF */  sw          $2, -0x6440($28)
/* 022DDC 01DCEADC DE01023C */  lui         $2, %hi(LIT_1341__3)
/* 022DE0 01DCEAE0 C0B74224 */  addiu       $2, $2, %lo(LIT_1341__3)
/* 022DE4 01DCEAE4 7001A327 */  addiu       $3, $29, 0x170
/* 022DE8 01DCEAE8 00004278 */  lq          $2, 0x0($2)
/* 022DEC 01DCEAEC 0000627C */  sq          $2, 0x0($3)
/* 022DF0 01DCEAF0 28860070 */  paddub      $16, $0, $0
/* 022DF4 01DCEAF4 27000010 */  b           .L01DCEB94_2D4394
/* 022DF8 01DCEAF8 00000000 */   nop
.L01DCEAFC_2D42FC:
/* 022DFC 01DCEAFC B0110224 */  addiu       $2, $0, 0x11B0
/* 022E00 01DCEB00 18880202 */  mult        $17, $16, $2
/* 022E04 01DCEB04 E501023C */  lui         $2, %hi(Cam)
/* 022E08 01DCEB08 F0C34224 */  addiu       $2, $2, %lo(Cam)
/* 022E0C 01DCEB0C 21205100 */  addu        $4, $2, $17
/* 022E10 01DCEB10 80101000 */  sll         $2, $16, 2
/* 022E14 01DCEB14 21105D00 */  addu        $2, $2, $29
/* 022E18 01DCEB18 948B858F */  lw          $5, -0x746C($28)
/* 022E1C 01DCEB1C 7001468C */  lw          $6, 0x170($2)
/* 022E20 01DCEB20 E501023C */  lui         $2, %hi(PathDataBuffer)
/* 022E24 01DCEB24 C00A4724 */  addiu       $7, $2, %lo(PathDataBuffer)
/* 022E28 01DCEB28 28460070 */  paddub      $8, $0, $0
/* 022E2C 01DCEB2C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 022E30 01DCEB30 00000000 */   nop
/* 022E34 01DCEB34 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 022E38 01DCEB38 E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 022E3C 01DCEB3C E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 022E40 01DCEB40 21105100 */  addu        $2, $2, $17
/* 022E44 01DCEB44 000043AC */  sw          $3, 0x0($2)
/* 022E48 01DCEB48 E501023C */  lui         $2, %hi(Cam + 0x2F8)
/* 022E4C 01DCEB4C E8C64224 */  addiu       $2, $2, %lo(Cam + 0x2F8)
/* 022E50 01DCEB50 21105100 */  addu        $2, $2, $17
/* 022E54 01DCEB54 000043AC */  sw          $3, 0x0($2)
/* 022E58 01DCEB58 E501023C */  lui         $2, %hi(Cam + 0x304)
/* 022E5C 01DCEB5C F4C64224 */  addiu       $2, $2, %lo(Cam + 0x304)
/* 022E60 01DCEB60 21105100 */  addu        $2, $2, $17
/* 022E64 01DCEB64 000040AC */  sw          $0, 0x0($2)
/* 022E68 01DCEB68 E501023C */  lui         $2, %hi(Cam + 0x308)
/* 022E6C 01DCEB6C F8C64224 */  addiu       $2, $2, %lo(Cam + 0x308)
/* 022E70 01DCEB70 21105100 */  addu        $2, $2, $17
/* 022E74 01DCEB74 000040AC */  sw          $0, 0x0($2)
/* 022E78 01DCEB78 E301023C */  lui         $2, %hi(MainCamera__3)
/* 022E7C 01DCEB7C 80E64324 */  addiu       $3, $2, %lo(MainCamera__3)
/* 022E80 01DCEB80 E501023C */  lui         $2, %hi(Cam + 0x310)
/* 022E84 01DCEB84 00C74224 */  addiu       $2, $2, %lo(Cam + 0x310)
/* 022E88 01DCEB88 21105100 */  addu        $2, $2, $17
/* 022E8C 01DCEB8C 000043AC */  sw          $3, 0x0($2)
/* 022E90 01DCEB90 01001026 */  addiu       $16, $16, 0x1
.L01DCEB94_2D4394:
/* 022E94 01DCEB94 0200022A */  slti        $2, $16, 0x2
/* 022E98 01DCEB98 D8FF4014 */  bnez        $2, .L01DCEAFC_2D42FC
/* 022E9C 01DCEB9C 00000000 */   nop
/* 022EA0 01DCEBA0 B89880AF */  sw          $0, -0x6748($28)
/* 022EA4 01DCEBA4 B49880AF */  sw          $0, -0x674C($28)
/* 022EA8 01DCEBA8 DE01023C */  lui         $2, %hi(LIT_1362__2)
/* 022EAC 01DCEBAC 90074424 */  addiu       $4, $2, %lo(LIT_1362__2)
/* 022EB0 01DCEBB0 00C5760C */  jal         OPAnalyz__FPc
/* 022EB4 01DCEBB4 00000000 */   nop
/* 022EB8 01DCEBB8 4CCA760C */  jal         OPMdsLoad__Fv
/* 022EBC 01DCEBBC 00000000 */   nop
/* 022EC0 01DCEBC0 2000BF7B */  lq          $31, 0x20($29)
/* 022EC4 01DCEBC4 1000B17B */  lq          $17, 0x10($29)
/* 022EC8 01DCEBC8 0000B07B */  lq          $16, 0x0($29)
/* 022ECC 01DCEBCC B001BD27 */  addiu       $29, $29, 0x1B0
/* 022ED0 01DCEBD0 0800E003 */  jr          $31
/* 022ED4 01DCEBD4 00000000 */   nop
/* 022ED8 01DCEBD8 00000000 */  nop
/* 022EDC 01DCEBDC 00000000 */  nop
