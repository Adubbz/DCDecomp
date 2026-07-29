.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitProcG__Fv
/* 023A20 01DCF720 20FEBD27 */  addiu       $29, $29, -0x1E0
/* 023A24 01DCF724 2000BF7F */  sq          $31, 0x20($29)
/* 023A28 01DCF728 1000B17F */  sq          $17, 0x10($29)
/* 023A2C 01DCF72C 0000B07F */  sq          $16, 0x0($29)
/* 023A30 01DCF730 DE01023C */  lui         $2, %hi(LIT_1458__2)
/* 023A34 01DCF734 90B84524 */  addiu       $5, $2, %lo(LIT_1458__2)
/* 023A38 01DCF738 3000A427 */  addiu       $4, $29, 0x30
/* 023A3C 01DCF73C 09000324 */  addiu       $3, $0, 0x9
.L01DCF740_2D4F40:
/* 023A40 01DCF740 0000A278 */  lq          $2, 0x0($5)
/* 023A44 01DCF744 1000A524 */  addiu       $5, $5, 0x10
/* 023A48 01DCF748 FFFF6324 */  addiu       $3, $3, -0x1
/* 023A4C 01DCF74C 0000827C */  sq          $2, 0x0($4)
/* 023A50 01DCF750 10008424 */  addiu       $4, $4, 0x10
/* 023A54 01DCF754 FAFF601C */  bgtz        $3, .L01DCF740_2D4F40
/* 023A58 01DCF758 00000000 */   nop
/* 023A5C 01DCF75C 948B848F */  lw          $4, -0x746C($28)
/* 023A60 01DCF760 DE01023C */  lui         $2, %hi(LIT_937__5)
/* 023A64 01DCF764 10024524 */  addiu       $5, $2, %lo(LIT_937__5)
/* 023A68 01DCF768 28360070 */  paddub      $6, $0, $0
/* 023A6C 01DCF76C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 023A70 01DCF770 00000000 */   nop
/* 023A74 01DCF774 5400A2AF */  sw          $2, 0x54($29)
/* 023A78 01DCF778 948B848F */  lw          $4, -0x746C($28)
/* 023A7C 01DCF77C DE01023C */  lui         $2, %hi(LIT_1491__2)
/* 023A80 01DCF780 18094524 */  addiu       $5, $2, %lo(LIT_1491__2)
/* 023A84 01DCF784 28360070 */  paddub      $6, $0, $0
/* 023A88 01DCF788 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 023A8C 01DCF78C 00000000 */   nop
/* 023A90 01DCF790 6000A2AF */  sw          $2, 0x60($29)
/* 023A94 01DCF794 948B848F */  lw          $4, -0x746C($28)
/* 023A98 01DCF798 DE01023C */  lui         $2, %hi(LIT_1492)
/* 023A9C 01DCF79C 28094524 */  addiu       $5, $2, %lo(LIT_1492)
/* 023AA0 01DCF7A0 28360070 */  paddub      $6, $0, $0
/* 023AA4 01DCF7A4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 023AA8 01DCF7A8 00000000 */   nop
/* 023AAC 01DCF7AC 6C00A2AF */  sw          $2, 0x6C($29)
/* 023AB0 01DCF7B0 948B848F */  lw          $4, -0x746C($28)
/* 023AB4 01DCF7B4 DE01023C */  lui         $2, %hi(LIT_1493__2)
/* 023AB8 01DCF7B8 38094524 */  addiu       $5, $2, %lo(LIT_1493__2)
/* 023ABC 01DCF7BC 28360070 */  paddub      $6, $0, $0
/* 023AC0 01DCF7C0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 023AC4 01DCF7C4 00000000 */   nop
/* 023AC8 01DCF7C8 7800A2AF */  sw          $2, 0x78($29)
/* 023ACC 01DCF7CC 948B848F */  lw          $4, -0x746C($28)
/* 023AD0 01DCF7D0 DE01023C */  lui         $2, %hi(LIT_939__2)
/* 023AD4 01DCF7D4 30024524 */  addiu       $5, $2, %lo(LIT_939__2)
/* 023AD8 01DCF7D8 28360070 */  paddub      $6, $0, $0
/* 023ADC 01DCF7DC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 023AE0 01DCF7E0 00000000 */   nop
/* 023AE4 01DCF7E4 8400A2AF */  sw          $2, 0x84($29)
/* 023AE8 01DCF7E8 948B848F */  lw          $4, -0x746C($28)
/* 023AEC 01DCF7EC DE01023C */  lui         $2, %hi(LIT_1494__2)
/* 023AF0 01DCF7F0 48094524 */  addiu       $5, $2, %lo(LIT_1494__2)
/* 023AF4 01DCF7F4 28360070 */  paddub      $6, $0, $0
/* 023AF8 01DCF7F8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 023AFC 01DCF7FC 00000000 */   nop
/* 023B00 01DCF800 9000A2AF */  sw          $2, 0x90($29)
/* 023B04 01DCF804 948B848F */  lw          $4, -0x746C($28)
/* 023B08 01DCF808 DE01023C */  lui         $2, %hi(LIT_1495__2)
/* 023B0C 01DCF80C 58094524 */  addiu       $5, $2, %lo(LIT_1495__2)
/* 023B10 01DCF810 28360070 */  paddub      $6, $0, $0
/* 023B14 01DCF814 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 023B18 01DCF818 00000000 */   nop
/* 023B1C 01DCF81C 9C00A2AF */  sw          $2, 0x9C($29)
/* 023B20 01DCF820 948B848F */  lw          $4, -0x746C($28)
/* 023B24 01DCF824 DE01023C */  lui         $2, %hi(LIT_1496)
/* 023B28 01DCF828 68094524 */  addiu       $5, $2, %lo(LIT_1496)
/* 023B2C 01DCF82C 28360070 */  paddub      $6, $0, $0
/* 023B30 01DCF830 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 023B34 01DCF834 00000000 */   nop
/* 023B38 01DCF838 A800A2AF */  sw          $2, 0xA8($29)
/* 023B3C 01DCF83C C701023C */  lui         $2, %hi(TexManager)
/* 023B40 01DCF840 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 023B44 01DCF844 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 023B48 01DCF848 F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 023B4C 01DCF84C 00000000 */   nop
/* 023B50 01DCF850 C701023C */  lui         $2, %hi(TexManager)
/* 023B54 01DCF854 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 023B58 01DCF858 FFFF0524 */  addiu       $5, $0, -0x1
/* 023B5C 01DCF85C 3000A627 */  addiu       $6, $29, 0x30
/* 023B60 01DCF860 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 023B64 01DCF864 00000000 */   nop
/* 023B68 01DCF868 01000224 */  addiu       $2, $0, 0x1
/* 023B6C 01DCF86C E401013C */  lui         $1, %hi(CharaTex)
/* 023B70 01DCF870 10D022A0 */  sb          $2, %lo(CharaTex)($1)
/* 023B74 01DCF874 02000224 */  addiu       $2, $0, 0x2
/* 023B78 01DCF878 E401013C */  lui         $1, %hi(CharaTex + 0x1)
/* 023B7C 01DCF87C 11D022A0 */  sb          $2, %lo(CharaTex + 0x1)($1)
/* 023B80 01DCF880 E401013C */  lui         $1, %hi(CharaTex + 0x2)
/* 023B84 01DCF884 12D022A0 */  sb          $2, %lo(CharaTex + 0x2)($1)
/* 023B88 01DCF888 DE01023C */  lui         $2, %hi(LIT_1462)
/* 023B8C 01DCF88C 20B94424 */  addiu       $4, $2, %lo(LIT_1462)
/* 023B90 01DCF890 C001A327 */  addiu       $3, $29, 0x1C0
/* 023B94 01DCF894 000082DC */  ld          $2, 0x0($4)
/* 023B98 01DCF898 080080C4 */  lwc1        $f0, 0x8($4)
/* 023B9C 01DCF89C 000062FC */  sd          $2, 0x0($3)
/* 023BA0 01DCF8A0 080060E4 */  swc1        $f0, 0x8($3)
/* 023BA4 01DCF8A4 E401013C */  lui         $1, %hi(CharaDataBuffer + 0x8)
/* 023BA8 01DCF8A8 28D020AC */  sw          $0, %lo(CharaDataBuffer + 0x8)($1)
/* 023BAC 01DCF8AC DF01023C */  lui         $2, %hi(Chara__3)
/* 023BB0 01DCF8B0 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 023BB4 01DCF8B4 948B858F */  lw          $5, -0x746C($28)
/* 023BB8 01DCF8B8 DE01023C */  lui         $2, %hi(LIT_1081__2)
/* 023BBC 01DCF8BC 08044624 */  addiu       $6, $2, %lo(LIT_1081__2)
/* 023BC0 01DCF8C0 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 023BC4 01DCF8C4 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 023BC8 01DCF8C8 28460070 */  paddub      $8, $0, $0
/* 023BCC 01DCF8CC FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 023BD0 01DCF8D0 00000000 */   nop
/* 023BD4 01DCF8D4 28860070 */  paddub      $16, $0, $0
/* 023BD8 01DCF8D8 2F000010 */  b           .L01DCF998_2D5198
/* 023BDC 01DCF8DC 00000000 */   nop
.L01DCF8E0_2D50E0:
/* 023BE0 01DCF8E0 B0110224 */  addiu       $2, $0, 0x11B0
/* 023BE4 01DCF8E4 18880202 */  mult        $17, $16, $2
/* 023BE8 01DCF8E8 DF01023C */  lui         $2, %hi(Chara__3)
/* 023BEC 01DCF8EC E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 023BF0 01DCF8F0 21205100 */  addu        $4, $2, $17
/* 023BF4 01DCF8F4 80101000 */  sll         $2, $16, 2
/* 023BF8 01DCF8F8 21105D00 */  addu        $2, $2, $29
/* 023BFC 01DCF8FC 948B858F */  lw          $5, -0x746C($28)
/* 023C00 01DCF900 C001468C */  lw          $6, 0x1C0($2)
/* 023C04 01DCF904 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 023C08 01DCF908 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 023C0C 01DCF90C 28460070 */  paddub      $8, $0, $0
/* 023C10 01DCF910 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 023C14 01DCF914 00000000 */   nop
/* 023C18 01DCF918 C000A427 */  addiu       $4, $29, 0xC0
/* 023C1C 01DCF91C 509F040C */  jal         __ct__10CFrameAttrFv
/* 023C20 01DCF920 00000000 */   nop
/* 023C24 01DCF924 C800A0A3 */  sb          $0, 0xC8($29)
/* 023C28 01DCF928 DF01023C */  lui         $2, %hi(Chara__3 + 0xBC)
/* 023C2C 01DCF92C 9CFF4224 */  addiu       $2, $2, %lo(Chara__3 + 0xBC)
/* 023C30 01DCF930 21105100 */  addu        $2, $2, $17
/* 023C34 01DCF934 0000448C */  lw          $4, 0x0($2)
/* 023C38 01DCF938 C000A527 */  addiu       $5, $29, 0xC0
/* 023C3C 01DCF93C 01000624 */  addiu       $6, $0, 0x1
/* 023C40 01DCF940 04000724 */  addiu       $7, $0, 0x4
/* 023C44 01DCF944 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 023C48 01DCF948 00000000 */   nop
/* 023C4C 01DCF94C 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 023C50 01DCF950 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F0)
/* 023C54 01DCF954 D0014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F0)
/* 023C58 01DCF958 21105100 */  addu        $2, $2, $17
/* 023C5C 01DCF95C 000043AC */  sw          $3, 0x0($2)
/* 023C60 01DCF960 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 023C64 01DCF964 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F8)
/* 023C68 01DCF968 D8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F8)
/* 023C6C 01DCF96C 21105100 */  addu        $2, $2, $17
/* 023C70 01DCF970 000040E4 */  swc1        $f0, 0x0($2)
/* 023C74 01DCF974 DF01023C */  lui         $2, %hi(Chara__3 + 0x304)
/* 023C78 01DCF978 E4014224 */  addiu       $2, $2, %lo(Chara__3 + 0x304)
/* 023C7C 01DCF97C 21105100 */  addu        $2, $2, $17
/* 023C80 01DCF980 000040AC */  sw          $0, 0x0($2)
/* 023C84 01DCF984 DF01023C */  lui         $2, %hi(Chara__3 + 0x308)
/* 023C88 01DCF988 E8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x308)
/* 023C8C 01DCF98C 21105100 */  addu        $2, $2, $17
/* 023C90 01DCF990 000040AC */  sw          $0, 0x0($2)
/* 023C94 01DCF994 01001026 */  addiu       $16, $16, 0x1
.L01DCF998_2D5198:
/* 023C98 01DCF998 0300022A */  slti        $2, $16, 0x3
/* 023C9C 01DCF99C D0FF4014 */  bnez        $2, .L01DCF8E0_2D50E0
/* 023CA0 01DCF9A0 00000000 */   nop
/* 023CA4 01DCF9A4 2041023C */  lui         $2, (0x41200000 >> 16)
/* 023CA8 01DCF9A8 DF01013C */  lui         $1, %hi(Chara__3 + 0x2F0)
/* 023CAC 01DCF9AC D00122AC */  sw          $2, %lo(Chara__3 + 0x2F0)($1)
/* 023CB0 01DCF9B0 DF01013C */  lui         $1, %hi(Chara__3 + 0x14A0)
/* 023CB4 01DCF9B4 801322AC */  sw          $2, %lo(Chara__3 + 0x14A0)($1)
/* 023CB8 01DCF9B8 A442023C */  lui         $2, (0x42A40000 >> 16)
/* 023CBC 01DCF9BC DF01013C */  lui         $1, %hi(Chara__3 + 0x2650)
/* 023CC0 01DCF9C0 302522AC */  sw          $2, %lo(Chara__3 + 0x2650)($1)
/* 023CC4 01DCF9C4 E401023C */  lui         $2, %hi(Wind__4)
/* 023CC8 01DCF9C8 C0CC4224 */  addiu       $2, $2, %lo(Wind__4)
/* 023CCC 01DCF9CC DF01013C */  lui         $1, %hi(Chara__3 + 0xC98)
/* 023CD0 01DCF9D0 780B22AC */  sw          $2, %lo(Chara__3 + 0xC98)($1)
/* 023CD4 01DCF9D4 E401023C */  lui         $2, %hi(Wind__4)
/* 023CD8 01DCF9D8 C0CC4224 */  addiu       $2, $2, %lo(Wind__4)
/* 023CDC 01DCF9DC DF01013C */  lui         $1, %hi(Chara__3 + 0x1E48)
/* 023CE0 01DCF9E0 281D22AC */  sw          $2, %lo(Chara__3 + 0x1E48)($1)
/* 023CE4 01DCF9E4 E401023C */  lui         $2, %hi(Wind__4)
/* 023CE8 01DCF9E8 C0CC4224 */  addiu       $2, $2, %lo(Wind__4)
/* 023CEC 01DCF9EC DF01013C */  lui         $1, %hi(Chara__3 + 0x2FF8)
/* 023CF0 01DCF9F0 D82E22AC */  sw          $2, %lo(Chara__3 + 0x2FF8)($1)
/* 023CF4 01DCF9F4 B89880AF */  sw          $0, -0x6748($28)
/* 023CF8 01DCF9F8 B49880AF */  sw          $0, -0x674C($28)
/* 023CFC 01DCF9FC DF01013C */  lui         $1, %hi(MapDataBuffer + 0x8)
/* 023D00 01DCFA00 B8FE20AC */  sw          $0, %lo(MapDataBuffer + 0x8)($1)
/* 023D04 01DCFA04 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 023D08 01DCFA08 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 023D0C 01DCFA0C A80E050C */  jal         Initialize__4CMapFv
/* 023D10 01DCFA10 00000000 */   nop
/* 023D14 01DCFA14 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 023D18 01DCFA18 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 023D1C 01DCFA1C A80E050C */  jal         Initialize__4CMapFv
/* 023D20 01DCFA20 00000000 */   nop
/* 023D24 01DCFA24 E201023C */  lui         $2, %hi(OP_BuildingMap2)
/* 023D28 01DCFA28 40AF4424 */  addiu       $4, $2, %lo(OP_BuildingMap2)
/* 023D2C 01DCFA2C A80E050C */  jal         Initialize__4CMapFv
/* 023D30 01DCFA30 00000000 */   nop
/* 023D34 01DCFA34 2001A427 */  addiu       $4, $29, 0x120
/* 023D38 01DCFA38 509F040C */  jal         __ct__10CFrameAttrFv
/* 023D3C 01DCFA3C 00000000 */   nop
/* 023D40 01DCFA40 948B848F */  lw          $4, -0x746C($28)
/* 023D44 01DCFA44 DE01023C */  lui         $2, %hi(LIT_1497__3)
/* 023D48 01DCFA48 78094524 */  addiu       $5, $2, %lo(LIT_1497__3)
/* 023D4C 01DCFA4C 28360070 */  paddub      $6, $0, $0
/* 023D50 01DCFA50 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 023D54 01DCFA54 00000000 */   nop
/* 023D58 01DCFA58 28264070 */  paddub      $4, $2, $0
/* 023D5C 01DCFA5C DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 023D60 01DCFA60 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 023D64 01DCFA64 02000624 */  addiu       $6, $0, 0x2
/* 023D68 01DCFA68 283E0070 */  paddub      $7, $0, $0
/* 023D6C 01DCFA6C 28460070 */  paddub      $8, $0, $0
/* 023D70 01DCFA70 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 023D74 01DCFA74 00000000 */   nop
/* 023D78 01DCFA78 28864070 */  paddub      $16, $2, $0
/* 023D7C 01DCFA7C 01000624 */  addiu       $6, $0, 0x1
/* 023D80 01DCFA80 2C01A6A3 */  sb          $6, 0x12C($29)
/* 023D84 01DCFA84 28260072 */  paddub      $4, $16, $0
/* 023D88 01DCFA88 2001A527 */  addiu       $5, $29, 0x120
/* 023D8C 01DCFA8C 40000724 */  addiu       $7, $0, 0x40
/* 023D90 01DCFA90 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 023D94 01DCFA94 00000000 */   nop
/* 023D98 01DCFA98 28260072 */  paddub      $4, $16, $0
/* 023D9C 01DCFA9C 01000524 */  addiu       $5, $0, 0x1
/* 023DA0 01DCFAA0 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 023DA4 01DCFAA4 00000000 */   nop
/* 023DA8 01DCFAA8 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 023DAC 01DCFAAC 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 023DB0 01DCFAB0 282E0072 */  paddub      $5, $16, $0
/* 023DB4 01DCFAB4 28360070 */  paddub      $6, $0, $0
/* 023DB8 01DCFAB8 283E0070 */  paddub      $7, $0, $0
/* 023DBC 01DCFABC 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 023DC0 01DCFAC0 00000000 */   nop
/* 023DC4 01DCFAC4 28864070 */  paddub      $16, $2, $0
/* 023DC8 01DCFAC8 8001A0AF */  sw          $0, 0x180($29)
/* 023DCC 01DCFACC 8401A0AF */  sw          $0, 0x184($29)
/* 023DD0 01DCFAD0 8801A0AF */  sw          $0, 0x188($29)
/* 023DD4 01DCFAD4 28260072 */  paddub      $4, $16, $0
/* 023DD8 01DCFAD8 8001A527 */  addiu       $5, $29, 0x180
/* 023DDC 01DCFADC A000598C */  lw          $25, 0xA0($2)
/* 023DE0 01DCFAE0 1000398F */  lw          $25, 0x10($25)
/* 023DE4 01DCFAE4 09F82003 */  jalr        $25
/* 023DE8 01DCFAE8 00000000 */   nop
/* 023DEC 01DCFAEC 9001A0AF */  sw          $0, 0x190($29)
/* 023DF0 01DCFAF0 9401A0AF */  sw          $0, 0x194($29)
/* 023DF4 01DCFAF4 9801A0AF */  sw          $0, 0x198($29)
/* 023DF8 01DCFAF8 28260072 */  paddub      $4, $16, $0
/* 023DFC 01DCFAFC 9001A527 */  addiu       $5, $29, 0x190
/* 023E00 01DCFB00 A000198E */  lw          $25, 0xA0($16)
/* 023E04 01DCFB04 2C00398F */  lw          $25, 0x2C($25)
/* 023E08 01DCFB08 09F82003 */  jalr        $25
/* 023E0C 01DCFB0C 00000000 */   nop
/* 023E10 01DCFB10 948B848F */  lw          $4, -0x746C($28)
/* 023E14 01DCFB14 DE01023C */  lui         $2, %hi(LIT_1498__2)
/* 023E18 01DCFB18 88094524 */  addiu       $5, $2, %lo(LIT_1498__2)
/* 023E1C 01DCFB1C 28360070 */  paddub      $6, $0, $0
/* 023E20 01DCFB20 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 023E24 01DCFB24 00000000 */   nop
/* 023E28 01DCFB28 28264070 */  paddub      $4, $2, $0
/* 023E2C 01DCFB2C DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 023E30 01DCFB30 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 023E34 01DCFB34 02000624 */  addiu       $6, $0, 0x2
/* 023E38 01DCFB38 283E0070 */  paddub      $7, $0, $0
/* 023E3C 01DCFB3C 28460070 */  paddub      $8, $0, $0
/* 023E40 01DCFB40 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 023E44 01DCFB44 00000000 */   nop
/* 023E48 01DCFB48 28864070 */  paddub      $16, $2, $0
/* 023E4C 01DCFB4C 28260072 */  paddub      $4, $16, $0
/* 023E50 01DCFB50 2001A527 */  addiu       $5, $29, 0x120
/* 023E54 01DCFB54 01000624 */  addiu       $6, $0, 0x1
/* 023E58 01DCFB58 40000724 */  addiu       $7, $0, 0x40
/* 023E5C 01DCFB5C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 023E60 01DCFB60 00000000 */   nop
/* 023E64 01DCFB64 28260072 */  paddub      $4, $16, $0
/* 023E68 01DCFB68 01000524 */  addiu       $5, $0, 0x1
/* 023E6C 01DCFB6C BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 023E70 01DCFB70 00000000 */   nop
/* 023E74 01DCFB74 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 023E78 01DCFB78 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 023E7C 01DCFB7C 282E0072 */  paddub      $5, $16, $0
/* 023E80 01DCFB80 28360070 */  paddub      $6, $0, $0
/* 023E84 01DCFB84 283E0070 */  paddub      $7, $0, $0
/* 023E88 01DCFB88 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 023E8C 01DCFB8C 00000000 */   nop
/* 023E90 01DCFB90 28864070 */  paddub      $16, $2, $0
/* 023E94 01DCFB94 A001A0AF */  sw          $0, 0x1A0($29)
/* 023E98 01DCFB98 A401A0AF */  sw          $0, 0x1A4($29)
/* 023E9C 01DCFB9C A801A0AF */  sw          $0, 0x1A8($29)
/* 023EA0 01DCFBA0 28260072 */  paddub      $4, $16, $0
/* 023EA4 01DCFBA4 A001A527 */  addiu       $5, $29, 0x1A0
/* 023EA8 01DCFBA8 A000598C */  lw          $25, 0xA0($2)
/* 023EAC 01DCFBAC 1000398F */  lw          $25, 0x10($25)
/* 023EB0 01DCFBB0 09F82003 */  jalr        $25
/* 023EB4 01DCFBB4 00000000 */   nop
/* 023EB8 01DCFBB8 B001A0AF */  sw          $0, 0x1B0($29)
/* 023EBC 01DCFBBC B401A0AF */  sw          $0, 0x1B4($29)
/* 023EC0 01DCFBC0 B801A0AF */  sw          $0, 0x1B8($29)
/* 023EC4 01DCFBC4 28260072 */  paddub      $4, $16, $0
/* 023EC8 01DCFBC8 B001A527 */  addiu       $5, $29, 0x1B0
/* 023ECC 01DCFBCC A000198E */  lw          $25, 0xA0($16)
/* 023ED0 01DCFBD0 2C00398F */  lw          $25, 0x2C($25)
/* 023ED4 01DCFBD4 09F82003 */  jalr        $25
/* 023ED8 01DCFBD8 00000000 */   nop
/* 023EDC 01DCFBDC E501013C */  lui         $1, %hi(PathDataBuffer + 0x8)
/* 023EE0 01DCFBE0 C80A20AC */  sw          $0, %lo(PathDataBuffer + 0x8)($1)
/* 023EE4 01DCFBE4 FFFF0224 */  addiu       $2, $0, -0x1
/* 023EE8 01DCFBE8 C09B82AF */  sw          $2, -0x6440($28)
/* 023EEC 01DCFBEC DE01023C */  lui         $2, %hi(LIT_1471__2)
/* 023EF0 01DCFBF0 30B94424 */  addiu       $4, $2, %lo(LIT_1471__2)
/* 023EF4 01DCFBF4 D001A327 */  addiu       $3, $29, 0x1D0
/* 023EF8 01DCFBF8 000082DC */  ld          $2, 0x0($4)
/* 023EFC 01DCFBFC 080080C4 */  lwc1        $f0, 0x8($4)
/* 023F00 01DCFC00 000062FC */  sd          $2, 0x0($3)
/* 023F04 01DCFC04 080060E4 */  swc1        $f0, 0x8($3)
/* 023F08 01DCFC08 28860070 */  paddub      $16, $0, $0
/* 023F0C 01DCFC0C 27000010 */  b           .L01DCFCAC_2D54AC
/* 023F10 01DCFC10 00000000 */   nop
.L01DCFC14_2D5414:
/* 023F14 01DCFC14 B0110224 */  addiu       $2, $0, 0x11B0
/* 023F18 01DCFC18 18880202 */  mult        $17, $16, $2
/* 023F1C 01DCFC1C E501023C */  lui         $2, %hi(Cam)
/* 023F20 01DCFC20 F0C34224 */  addiu       $2, $2, %lo(Cam)
/* 023F24 01DCFC24 21205100 */  addu        $4, $2, $17
/* 023F28 01DCFC28 80101000 */  sll         $2, $16, 2
/* 023F2C 01DCFC2C 21105D00 */  addu        $2, $2, $29
/* 023F30 01DCFC30 948B858F */  lw          $5, -0x746C($28)
/* 023F34 01DCFC34 D001468C */  lw          $6, 0x1D0($2)
/* 023F38 01DCFC38 E501023C */  lui         $2, %hi(PathDataBuffer)
/* 023F3C 01DCFC3C C00A4724 */  addiu       $7, $2, %lo(PathDataBuffer)
/* 023F40 01DCFC40 28460070 */  paddub      $8, $0, $0
/* 023F44 01DCFC44 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 023F48 01DCFC48 00000000 */   nop
/* 023F4C 01DCFC4C 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 023F50 01DCFC50 E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 023F54 01DCFC54 E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 023F58 01DCFC58 21105100 */  addu        $2, $2, $17
/* 023F5C 01DCFC5C 000043AC */  sw          $3, 0x0($2)
/* 023F60 01DCFC60 E501023C */  lui         $2, %hi(Cam + 0x2F8)
/* 023F64 01DCFC64 E8C64224 */  addiu       $2, $2, %lo(Cam + 0x2F8)
/* 023F68 01DCFC68 21105100 */  addu        $2, $2, $17
/* 023F6C 01DCFC6C 000043AC */  sw          $3, 0x0($2)
/* 023F70 01DCFC70 E501023C */  lui         $2, %hi(Cam + 0x304)
/* 023F74 01DCFC74 F4C64224 */  addiu       $2, $2, %lo(Cam + 0x304)
/* 023F78 01DCFC78 21105100 */  addu        $2, $2, $17
/* 023F7C 01DCFC7C 000040AC */  sw          $0, 0x0($2)
/* 023F80 01DCFC80 E501023C */  lui         $2, %hi(Cam + 0x308)
/* 023F84 01DCFC84 F8C64224 */  addiu       $2, $2, %lo(Cam + 0x308)
/* 023F88 01DCFC88 21105100 */  addu        $2, $2, $17
/* 023F8C 01DCFC8C 000040AC */  sw          $0, 0x0($2)
/* 023F90 01DCFC90 E301023C */  lui         $2, %hi(MainCamera__3)
/* 023F94 01DCFC94 80E64324 */  addiu       $3, $2, %lo(MainCamera__3)
/* 023F98 01DCFC98 E501023C */  lui         $2, %hi(Cam + 0x310)
/* 023F9C 01DCFC9C 00C74224 */  addiu       $2, $2, %lo(Cam + 0x310)
/* 023FA0 01DCFCA0 21105100 */  addu        $2, $2, $17
/* 023FA4 01DCFCA4 000043AC */  sw          $3, 0x0($2)
/* 023FA8 01DCFCA8 01001026 */  addiu       $16, $16, 0x1
.L01DCFCAC_2D54AC:
/* 023FAC 01DCFCAC 0300022A */  slti        $2, $16, 0x3
/* 023FB0 01DCFCB0 D8FF4014 */  bnez        $2, .L01DCFC14_2D5414
/* 023FB4 01DCFCB4 00000000 */   nop
/* 023FB8 01DCFCB8 B89880AF */  sw          $0, -0x6748($28)
/* 023FBC 01DCFCBC B49880AF */  sw          $0, -0x674C($28)
/* 023FC0 01DCFCC0 DE01023C */  lui         $2, %hi(LIT_1499)
/* 023FC4 01DCFCC4 A0094424 */  addiu       $4, $2, %lo(LIT_1499)
/* 023FC8 01DCFCC8 00C5760C */  jal         OPAnalyz__FPc
/* 023FCC 01DCFCCC 00000000 */   nop
/* 023FD0 01DCFCD0 4CCA760C */  jal         OPMdsLoad__Fv
/* 023FD4 01DCFCD4 00000000 */   nop
/* 023FD8 01DCFCD8 2000BF7B */  lq          $31, 0x20($29)
/* 023FDC 01DCFCDC 1000B17B */  lq          $17, 0x10($29)
/* 023FE0 01DCFCE0 0000B07B */  lq          $16, 0x0($29)
/* 023FE4 01DCFCE4 E001BD27 */  addiu       $29, $29, 0x1E0
/* 023FE8 01DCFCE8 0800E003 */  jr          $31
/* 023FEC 01DCFCEC 00000000 */   nop
