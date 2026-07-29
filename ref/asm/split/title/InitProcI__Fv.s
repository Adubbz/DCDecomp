.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitProcI__Fv
/* 024FA0 01DD0CA0 D0FDBD27 */  addiu       $29, $29, -0x230
/* 024FA4 01DD0CA4 2000BF7F */  sq          $31, 0x20($29)
/* 024FA8 01DD0CA8 1000B17F */  sq          $17, 0x10($29)
/* 024FAC 01DD0CAC 0000B07F */  sq          $16, 0x0($29)
/* 024FB0 01DD0CB0 DE01023C */  lui         $2, %hi(LIT_1609__2)
/* 024FB4 01DD0CB4 D0B94524 */  addiu       $5, $2, %lo(LIT_1609__2)
/* 024FB8 01DD0CB8 3000A427 */  addiu       $4, $29, 0x30
/* 024FBC 01DD0CBC 07000324 */  addiu       $3, $0, 0x7
.L01DD0CC0_2D64C0:
/* 024FC0 01DD0CC0 0000A278 */  lq          $2, 0x0($5)
/* 024FC4 01DD0CC4 1000A524 */  addiu       $5, $5, 0x10
/* 024FC8 01DD0CC8 FFFF6324 */  addiu       $3, $3, -0x1
/* 024FCC 01DD0CCC 0000827C */  sq          $2, 0x0($4)
/* 024FD0 01DD0CD0 10008424 */  addiu       $4, $4, 0x10
/* 024FD4 01DD0CD4 FAFF601C */  bgtz        $3, .L01DD0CC0_2D64C0
/* 024FD8 01DD0CD8 00000000 */   nop
/* 024FDC 01DD0CDC 0000A2DC */  ld          $2, 0x0($5)
/* 024FE0 01DD0CE0 000082FC */  sd          $2, 0x0($4)
/* 024FE4 01DD0CE4 948B848F */  lw          $4, -0x746C($28)
/* 024FE8 01DD0CE8 DE01023C */  lui         $2, %hi(LIT_937__5)
/* 024FEC 01DD0CEC 10024524 */  addiu       $5, $2, %lo(LIT_937__5)
/* 024FF0 01DD0CF0 28360070 */  paddub      $6, $0, $0
/* 024FF4 01DD0CF4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 024FF8 01DD0CF8 00000000 */   nop
/* 024FFC 01DD0CFC 5400A2AF */  sw          $2, 0x54($29)
/* 025000 01DD0D00 948B848F */  lw          $4, -0x746C($28)
/* 025004 01DD0D04 DE01023C */  lui         $2, %hi(LIT_1654__2)
/* 025008 01DD0D08 180B4524 */  addiu       $5, $2, %lo(LIT_1654__2)
/* 02500C 01DD0D0C 28360070 */  paddub      $6, $0, $0
/* 025010 01DD0D10 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 025014 01DD0D14 00000000 */   nop
/* 025018 01DD0D18 6000A2AF */  sw          $2, 0x60($29)
/* 02501C 01DD0D1C 948B848F */  lw          $4, -0x746C($28)
/* 025020 01DD0D20 DE01023C */  lui         $2, %hi(LIT_1655__2)
/* 025024 01DD0D24 280B4524 */  addiu       $5, $2, %lo(LIT_1655__2)
/* 025028 01DD0D28 28360070 */  paddub      $6, $0, $0
/* 02502C 01DD0D2C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 025030 01DD0D30 00000000 */   nop
/* 025034 01DD0D34 6C00A2AF */  sw          $2, 0x6C($29)
/* 025038 01DD0D38 948B848F */  lw          $4, -0x746C($28)
/* 02503C 01DD0D3C DE01023C */  lui         $2, %hi(LIT_1656__2)
/* 025040 01DD0D40 380B4524 */  addiu       $5, $2, %lo(LIT_1656__2)
/* 025044 01DD0D44 28360070 */  paddub      $6, $0, $0
/* 025048 01DD0D48 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 02504C 01DD0D4C 00000000 */   nop
/* 025050 01DD0D50 7800A2AF */  sw          $2, 0x78($29)
/* 025054 01DD0D54 948B848F */  lw          $4, -0x746C($28)
/* 025058 01DD0D58 DE01023C */  lui         $2, %hi(LIT_939__2)
/* 02505C 01DD0D5C 30024524 */  addiu       $5, $2, %lo(LIT_939__2)
/* 025060 01DD0D60 28360070 */  paddub      $6, $0, $0
/* 025064 01DD0D64 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 025068 01DD0D68 00000000 */   nop
/* 02506C 01DD0D6C 8400A2AF */  sw          $2, 0x84($29)
/* 025070 01DD0D70 948B848F */  lw          $4, -0x746C($28)
/* 025074 01DD0D74 DE01023C */  lui         $2, %hi(LIT_1657__2)
/* 025078 01DD0D78 480B4524 */  addiu       $5, $2, %lo(LIT_1657__2)
/* 02507C 01DD0D7C 28360070 */  paddub      $6, $0, $0
/* 025080 01DD0D80 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 025084 01DD0D84 00000000 */   nop
/* 025088 01DD0D88 9000A2AF */  sw          $2, 0x90($29)
/* 02508C 01DD0D8C C701023C */  lui         $2, %hi(TexManager)
/* 025090 01DD0D90 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025094 01DD0D94 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 025098 01DD0D98 F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 02509C 01DD0D9C 00000000 */   nop
/* 0250A0 01DD0DA0 C701023C */  lui         $2, %hi(TexManager)
/* 0250A4 01DD0DA4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0250A8 01DD0DA8 FFFF0524 */  addiu       $5, $0, -0x1
/* 0250AC 01DD0DAC 3000A627 */  addiu       $6, $29, 0x30
/* 0250B0 01DD0DB0 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0250B4 01DD0DB4 00000000 */   nop
/* 0250B8 01DD0DB8 01000224 */  addiu       $2, $0, 0x1
/* 0250BC 01DD0DBC E401013C */  lui         $1, %hi(CharaTex)
/* 0250C0 01DD0DC0 10D022A0 */  sb          $2, %lo(CharaTex)($1)
/* 0250C4 01DD0DC4 02000224 */  addiu       $2, $0, 0x2
/* 0250C8 01DD0DC8 E401013C */  lui         $1, %hi(CharaTex + 0x1)
/* 0250CC 01DD0DCC 11D022A0 */  sb          $2, %lo(CharaTex + 0x1)($1)
/* 0250D0 01DD0DD0 03000224 */  addiu       $2, $0, 0x3
/* 0250D4 01DD0DD4 E401013C */  lui         $1, %hi(CharaTex + 0x2)
/* 0250D8 01DD0DD8 12D022A0 */  sb          $2, %lo(CharaTex + 0x2)($1)
/* 0250DC 01DD0DDC DE01023C */  lui         $2, %hi(LIT_1613)
/* 0250E0 01DD0DE0 48BA4424 */  addiu       $4, $2, %lo(LIT_1613)
/* 0250E4 01DD0DE4 2002A327 */  addiu       $3, $29, 0x220
/* 0250E8 01DD0DE8 000082DC */  ld          $2, 0x0($4)
/* 0250EC 01DD0DEC 080080C4 */  lwc1        $f0, 0x8($4)
/* 0250F0 01DD0DF0 000062FC */  sd          $2, 0x0($3)
/* 0250F4 01DD0DF4 080060E4 */  swc1        $f0, 0x8($3)
/* 0250F8 01DD0DF8 E401013C */  lui         $1, %hi(CharaDataBuffer + 0x8)
/* 0250FC 01DD0DFC 28D020AC */  sw          $0, %lo(CharaDataBuffer + 0x8)($1)
/* 025100 01DD0E00 DF01023C */  lui         $2, %hi(Chara__3)
/* 025104 01DD0E04 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 025108 01DD0E08 948B858F */  lw          $5, -0x746C($28)
/* 02510C 01DD0E0C DE01023C */  lui         $2, %hi(LIT_1081__2)
/* 025110 01DD0E10 08044624 */  addiu       $6, $2, %lo(LIT_1081__2)
/* 025114 01DD0E14 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 025118 01DD0E18 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 02511C 01DD0E1C 28460070 */  paddub      $8, $0, $0
/* 025120 01DD0E20 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 025124 01DD0E24 00000000 */   nop
/* 025128 01DD0E28 28860070 */  paddub      $16, $0, $0
/* 02512C 01DD0E2C 2F000010 */  b           .L01DD0EEC_2D66EC
/* 025130 01DD0E30 00000000 */   nop
.L01DD0E34_2D6634:
/* 025134 01DD0E34 B0110224 */  addiu       $2, $0, 0x11B0
/* 025138 01DD0E38 18880202 */  mult        $17, $16, $2
/* 02513C 01DD0E3C DF01023C */  lui         $2, %hi(Chara__3)
/* 025140 01DD0E40 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 025144 01DD0E44 21205100 */  addu        $4, $2, $17
/* 025148 01DD0E48 80101000 */  sll         $2, $16, 2
/* 02514C 01DD0E4C 21105D00 */  addu        $2, $2, $29
/* 025150 01DD0E50 948B858F */  lw          $5, -0x746C($28)
/* 025154 01DD0E54 2002468C */  lw          $6, 0x220($2)
/* 025158 01DD0E58 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 02515C 01DD0E5C 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 025160 01DD0E60 28460070 */  paddub      $8, $0, $0
/* 025164 01DD0E64 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 025168 01DD0E68 00000000 */   nop
/* 02516C 01DD0E6C B000A427 */  addiu       $4, $29, 0xB0
/* 025170 01DD0E70 509F040C */  jal         __ct__10CFrameAttrFv
/* 025174 01DD0E74 00000000 */   nop
/* 025178 01DD0E78 B800A0A3 */  sb          $0, 0xB8($29)
/* 02517C 01DD0E7C DF01023C */  lui         $2, %hi(Chara__3 + 0xBC)
/* 025180 01DD0E80 9CFF4224 */  addiu       $2, $2, %lo(Chara__3 + 0xBC)
/* 025184 01DD0E84 21105100 */  addu        $2, $2, $17
/* 025188 01DD0E88 0000448C */  lw          $4, 0x0($2)
/* 02518C 01DD0E8C B000A527 */  addiu       $5, $29, 0xB0
/* 025190 01DD0E90 01000624 */  addiu       $6, $0, 0x1
/* 025194 01DD0E94 04000724 */  addiu       $7, $0, 0x4
/* 025198 01DD0E98 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 02519C 01DD0E9C 00000000 */   nop
/* 0251A0 01DD0EA0 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0251A4 01DD0EA4 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F0)
/* 0251A8 01DD0EA8 D0014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F0)
/* 0251AC 01DD0EAC 21105100 */  addu        $2, $2, $17
/* 0251B0 01DD0EB0 000043AC */  sw          $3, 0x0($2)
/* 0251B4 01DD0EB4 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 0251B8 01DD0EB8 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F8)
/* 0251BC 01DD0EBC D8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F8)
/* 0251C0 01DD0EC0 21105100 */  addu        $2, $2, $17
/* 0251C4 01DD0EC4 000040E4 */  swc1        $f0, 0x0($2)
/* 0251C8 01DD0EC8 DF01023C */  lui         $2, %hi(Chara__3 + 0x304)
/* 0251CC 01DD0ECC E4014224 */  addiu       $2, $2, %lo(Chara__3 + 0x304)
/* 0251D0 01DD0ED0 21105100 */  addu        $2, $2, $17
/* 0251D4 01DD0ED4 000040AC */  sw          $0, 0x0($2)
/* 0251D8 01DD0ED8 DF01023C */  lui         $2, %hi(Chara__3 + 0x308)
/* 0251DC 01DD0EDC E8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x308)
/* 0251E0 01DD0EE0 21105100 */  addu        $2, $2, $17
/* 0251E4 01DD0EE4 000040AC */  sw          $0, 0x0($2)
/* 0251E8 01DD0EE8 01001026 */  addiu       $16, $16, 0x1
.L01DD0EEC_2D66EC:
/* 0251EC 01DD0EEC 0300022A */  slti        $2, $16, 0x3
/* 0251F0 01DD0EF0 D0FF4014 */  bnez        $2, .L01DD0E34_2D6634
/* 0251F4 01DD0EF4 00000000 */   nop
/* 0251F8 01DD0EF8 B841023C */  lui         $2, (0x41B80000 >> 16)
/* 0251FC 01DD0EFC DF01013C */  lui         $1, %hi(Chara__3 + 0x14A0)
/* 025200 01DD0F00 801322AC */  sw          $2, %lo(Chara__3 + 0x14A0)($1)
/* 025204 01DD0F04 E401023C */  lui         $2, %hi(Wind__4)
/* 025208 01DD0F08 C0CC4224 */  addiu       $2, $2, %lo(Wind__4)
/* 02520C 01DD0F0C DF01013C */  lui         $1, %hi(Chara__3 + 0xC98)
/* 025210 01DD0F10 780B22AC */  sw          $2, %lo(Chara__3 + 0xC98)($1)
/* 025214 01DD0F14 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 025218 01DD0F18 00608244 */  mtc1        $2, $f12
/* 02521C 01DD0F1C 00000000 */  nop
/* 025220 01DD0F20 46630046 */  mov.s       $f13, $f12
/* 025224 01DD0F24 86630046 */  mov.s       $f14, $f12
/* 025228 01DD0F28 DF01023C */  lui         $2, %hi(Chara__3 + 0x2360)
/* 02522C 01DD0F2C 40224424 */  addiu       $4, $2, %lo(Chara__3 + 0x2360)
/* 025230 01DD0F30 94E4040C */  jal         SetScale__10CCharacterFfff
/* 025234 01DD0F34 00000000 */   nop
/* 025238 01DD0F38 B89880AF */  sw          $0, -0x6748($28)
/* 02523C 01DD0F3C B49880AF */  sw          $0, -0x674C($28)
/* 025240 01DD0F40 DF01013C */  lui         $1, %hi(MapDataBuffer + 0x8)
/* 025244 01DD0F44 B8FE20AC */  sw          $0, %lo(MapDataBuffer + 0x8)($1)
/* 025248 01DD0F48 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 02524C 01DD0F4C 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 025250 01DD0F50 A80E050C */  jal         Initialize__4CMapFv
/* 025254 01DD0F54 00000000 */   nop
/* 025258 01DD0F58 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 02525C 01DD0F5C 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 025260 01DD0F60 A80E050C */  jal         Initialize__4CMapFv
/* 025264 01DD0F64 00000000 */   nop
/* 025268 01DD0F68 E201023C */  lui         $2, %hi(OP_BuildingMap2)
/* 02526C 01DD0F6C 40AF4424 */  addiu       $4, $2, %lo(OP_BuildingMap2)
/* 025270 01DD0F70 A80E050C */  jal         Initialize__4CMapFv
/* 025274 01DD0F74 00000000 */   nop
/* 025278 01DD0F78 1001A427 */  addiu       $4, $29, 0x110
/* 02527C 01DD0F7C 509F040C */  jal         __ct__10CFrameAttrFv
/* 025280 01DD0F80 00000000 */   nop
/* 025284 01DD0F84 948B848F */  lw          $4, -0x746C($28)
/* 025288 01DD0F88 DE01023C */  lui         $2, %hi(LIT_1658)
/* 02528C 01DD0F8C 580B4524 */  addiu       $5, $2, %lo(LIT_1658)
/* 025290 01DD0F90 28360070 */  paddub      $6, $0, $0
/* 025294 01DD0F94 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 025298 01DD0F98 00000000 */   nop
/* 02529C 01DD0F9C 28264070 */  paddub      $4, $2, $0
/* 0252A0 01DD0FA0 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0252A4 01DD0FA4 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 0252A8 01DD0FA8 02000624 */  addiu       $6, $0, 0x2
/* 0252AC 01DD0FAC 283E0070 */  paddub      $7, $0, $0
/* 0252B0 01DD0FB0 28460070 */  paddub      $8, $0, $0
/* 0252B4 01DD0FB4 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0252B8 01DD0FB8 00000000 */   nop
/* 0252BC 01DD0FBC 28864070 */  paddub      $16, $2, $0
/* 0252C0 01DD0FC0 01000624 */  addiu       $6, $0, 0x1
/* 0252C4 01DD0FC4 1C01B127 */  addiu       $17, $29, 0x11C
/* 0252C8 01DD0FC8 000026A2 */  sb          $6, 0x0($17)
/* 0252CC 01DD0FCC 28260072 */  paddub      $4, $16, $0
/* 0252D0 01DD0FD0 1001A527 */  addiu       $5, $29, 0x110
/* 0252D4 01DD0FD4 40000724 */  addiu       $7, $0, 0x40
/* 0252D8 01DD0FD8 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0252DC 01DD0FDC 00000000 */   nop
/* 0252E0 01DD0FE0 28260072 */  paddub      $4, $16, $0
/* 0252E4 01DD0FE4 01000524 */  addiu       $5, $0, 0x1
/* 0252E8 01DD0FE8 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 0252EC 01DD0FEC 00000000 */   nop
/* 0252F0 01DD0FF0 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 0252F4 01DD0FF4 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 0252F8 01DD0FF8 282E0072 */  paddub      $5, $16, $0
/* 0252FC 01DD0FFC 28360070 */  paddub      $6, $0, $0
/* 025300 01DD1000 283E0070 */  paddub      $7, $0, $0
/* 025304 01DD1004 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 025308 01DD1008 00000000 */   nop
/* 02530C 01DD100C 28864070 */  paddub      $16, $2, $0
/* 025310 01DD1010 8001A0AF */  sw          $0, 0x180($29)
/* 025314 01DD1014 8401A0AF */  sw          $0, 0x184($29)
/* 025318 01DD1018 8801A0AF */  sw          $0, 0x188($29)
/* 02531C 01DD101C 28260072 */  paddub      $4, $16, $0
/* 025320 01DD1020 8001A527 */  addiu       $5, $29, 0x180
/* 025324 01DD1024 A000598C */  lw          $25, 0xA0($2)
/* 025328 01DD1028 1000398F */  lw          $25, 0x10($25)
/* 02532C 01DD102C 09F82003 */  jalr        $25
/* 025330 01DD1030 00000000 */   nop
/* 025334 01DD1034 9001A0AF */  sw          $0, 0x190($29)
/* 025338 01DD1038 9401A0AF */  sw          $0, 0x194($29)
/* 02533C 01DD103C 9801A0AF */  sw          $0, 0x198($29)
/* 025340 01DD1040 28260072 */  paddub      $4, $16, $0
/* 025344 01DD1044 9001A527 */  addiu       $5, $29, 0x190
/* 025348 01DD1048 A000198E */  lw          $25, 0xA0($16)
/* 02534C 01DD104C 2C00398F */  lw          $25, 0x2C($25)
/* 025350 01DD1050 09F82003 */  jalr        $25
/* 025354 01DD1054 00000000 */   nop
/* 025358 01DD1058 948B848F */  lw          $4, -0x746C($28)
/* 02535C 01DD105C DE01023C */  lui         $2, %hi(LIT_1659)
/* 025360 01DD1060 680B4524 */  addiu       $5, $2, %lo(LIT_1659)
/* 025364 01DD1064 28360070 */  paddub      $6, $0, $0
/* 025368 01DD1068 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 02536C 01DD106C 00000000 */   nop
/* 025370 01DD1070 28264070 */  paddub      $4, $2, $0
/* 025374 01DD1074 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 025378 01DD1078 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 02537C 01DD107C 02000624 */  addiu       $6, $0, 0x2
/* 025380 01DD1080 283E0070 */  paddub      $7, $0, $0
/* 025384 01DD1084 28460070 */  paddub      $8, $0, $0
/* 025388 01DD1088 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 02538C 01DD108C 00000000 */   nop
/* 025390 01DD1090 28864070 */  paddub      $16, $2, $0
/* 025394 01DD1094 01000624 */  addiu       $6, $0, 0x1
/* 025398 01DD1098 000026A2 */  sb          $6, 0x0($17)
/* 02539C 01DD109C 28260072 */  paddub      $4, $16, $0
/* 0253A0 01DD10A0 1001A527 */  addiu       $5, $29, 0x110
/* 0253A4 01DD10A4 40000724 */  addiu       $7, $0, 0x40
/* 0253A8 01DD10A8 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0253AC 01DD10AC 00000000 */   nop
/* 0253B0 01DD10B0 28260072 */  paddub      $4, $16, $0
/* 0253B4 01DD10B4 01000524 */  addiu       $5, $0, 0x1
/* 0253B8 01DD10B8 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 0253BC 01DD10BC 00000000 */   nop
/* 0253C0 01DD10C0 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 0253C4 01DD10C4 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 0253C8 01DD10C8 282E0070 */  paddub      $5, $0, $0
/* 0253CC 01DD10CC 28360072 */  paddub      $6, $16, $0
/* 0253D0 01DD10D0 283E0070 */  paddub      $7, $0, $0
/* 0253D4 01DD10D4 28460070 */  paddub      $8, $0, $0
/* 0253D8 01DD10D8 1C0E050C */  jal         SetObject__4CMapFiP9CFrameVu1ii
/* 0253DC 01DD10DC 00000000 */   nop
/* 0253E0 01DD10E0 28864070 */  paddub      $16, $2, $0
/* 0253E4 01DD10E4 A001A0AF */  sw          $0, 0x1A0($29)
/* 0253E8 01DD10E8 A401A0AF */  sw          $0, 0x1A4($29)
/* 0253EC 01DD10EC A801A0AF */  sw          $0, 0x1A8($29)
/* 0253F0 01DD10F0 28260072 */  paddub      $4, $16, $0
/* 0253F4 01DD10F4 A001A527 */  addiu       $5, $29, 0x1A0
/* 0253F8 01DD10F8 A000598C */  lw          $25, 0xA0($2)
/* 0253FC 01DD10FC 1000398F */  lw          $25, 0x10($25)
/* 025400 01DD1100 09F82003 */  jalr        $25
/* 025404 01DD1104 00000000 */   nop
/* 025408 01DD1108 B001A0AF */  sw          $0, 0x1B0($29)
/* 02540C 01DD110C B401A0AF */  sw          $0, 0x1B4($29)
/* 025410 01DD1110 B801A0AF */  sw          $0, 0x1B8($29)
/* 025414 01DD1114 28260072 */  paddub      $4, $16, $0
/* 025418 01DD1118 B001A527 */  addiu       $5, $29, 0x1B0
/* 02541C 01DD111C A000198E */  lw          $25, 0xA0($16)
/* 025420 01DD1120 2C00398F */  lw          $25, 0x2C($25)
/* 025424 01DD1124 09F82003 */  jalr        $25
/* 025428 01DD1128 00000000 */   nop
/* 02542C 01DD112C 948B848F */  lw          $4, -0x746C($28)
/* 025430 01DD1130 DE01023C */  lui         $2, %hi(LIT_1660)
/* 025434 01DD1134 780B4524 */  addiu       $5, $2, %lo(LIT_1660)
/* 025438 01DD1138 28360070 */  paddub      $6, $0, $0
/* 02543C 01DD113C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 025440 01DD1140 00000000 */   nop
/* 025444 01DD1144 28264070 */  paddub      $4, $2, $0
/* 025448 01DD1148 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 02544C 01DD114C B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 025450 01DD1150 02000624 */  addiu       $6, $0, 0x2
/* 025454 01DD1154 283E0070 */  paddub      $7, $0, $0
/* 025458 01DD1158 28460070 */  paddub      $8, $0, $0
/* 02545C 01DD115C AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 025460 01DD1160 00000000 */   nop
/* 025464 01DD1164 28864070 */  paddub      $16, $2, $0
/* 025468 01DD1168 01000624 */  addiu       $6, $0, 0x1
/* 02546C 01DD116C 000026A2 */  sb          $6, 0x0($17)
/* 025470 01DD1170 28260072 */  paddub      $4, $16, $0
/* 025474 01DD1174 1001A527 */  addiu       $5, $29, 0x110
/* 025478 01DD1178 40000724 */  addiu       $7, $0, 0x40
/* 02547C 01DD117C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 025480 01DD1180 00000000 */   nop
/* 025484 01DD1184 28260072 */  paddub      $4, $16, $0
/* 025488 01DD1188 01000524 */  addiu       $5, $0, 0x1
/* 02548C 01DD118C BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 025490 01DD1190 00000000 */   nop
/* 025494 01DD1194 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 025498 01DD1198 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 02549C 01DD119C 01000524 */  addiu       $5, $0, 0x1
/* 0254A0 01DD11A0 28360072 */  paddub      $6, $16, $0
/* 0254A4 01DD11A4 283E0070 */  paddub      $7, $0, $0
/* 0254A8 01DD11A8 28460070 */  paddub      $8, $0, $0
/* 0254AC 01DD11AC 1C0E050C */  jal         SetObject__4CMapFiP9CFrameVu1ii
/* 0254B0 01DD11B0 00000000 */   nop
/* 0254B4 01DD11B4 28864070 */  paddub      $16, $2, $0
/* 0254B8 01DD11B8 C001A0AF */  sw          $0, 0x1C0($29)
/* 0254BC 01DD11BC C401A0AF */  sw          $0, 0x1C4($29)
/* 0254C0 01DD11C0 C801A0AF */  sw          $0, 0x1C8($29)
/* 0254C4 01DD11C4 28260072 */  paddub      $4, $16, $0
/* 0254C8 01DD11C8 C001A527 */  addiu       $5, $29, 0x1C0
/* 0254CC 01DD11CC A000598C */  lw          $25, 0xA0($2)
/* 0254D0 01DD11D0 1000398F */  lw          $25, 0x10($25)
/* 0254D4 01DD11D4 09F82003 */  jalr        $25
/* 0254D8 01DD11D8 00000000 */   nop
/* 0254DC 01DD11DC D001A0AF */  sw          $0, 0x1D0($29)
/* 0254E0 01DD11E0 D401A0AF */  sw          $0, 0x1D4($29)
/* 0254E4 01DD11E4 D801A0AF */  sw          $0, 0x1D8($29)
/* 0254E8 01DD11E8 28260072 */  paddub      $4, $16, $0
/* 0254EC 01DD11EC D001A527 */  addiu       $5, $29, 0x1D0
/* 0254F0 01DD11F0 A000198E */  lw          $25, 0xA0($16)
/* 0254F4 01DD11F4 2C00398F */  lw          $25, 0x2C($25)
/* 0254F8 01DD11F8 09F82003 */  jalr        $25
/* 0254FC 01DD11FC 00000000 */   nop
/* 025500 01DD1200 948B848F */  lw          $4, -0x746C($28)
/* 025504 01DD1204 DE01023C */  lui         $2, %hi(LIT_1661)
/* 025508 01DD1208 880B4524 */  addiu       $5, $2, %lo(LIT_1661)
/* 02550C 01DD120C 28360070 */  paddub      $6, $0, $0
/* 025510 01DD1210 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 025514 01DD1214 00000000 */   nop
/* 025518 01DD1218 28264070 */  paddub      $4, $2, $0
/* 02551C 01DD121C DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 025520 01DD1220 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 025524 01DD1224 02000624 */  addiu       $6, $0, 0x2
/* 025528 01DD1228 283E0070 */  paddub      $7, $0, $0
/* 02552C 01DD122C 28460070 */  paddub      $8, $0, $0
/* 025530 01DD1230 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 025534 01DD1234 00000000 */   nop
/* 025538 01DD1238 28864070 */  paddub      $16, $2, $0
/* 02553C 01DD123C 01000624 */  addiu       $6, $0, 0x1
/* 025540 01DD1240 000026A2 */  sb          $6, 0x0($17)
/* 025544 01DD1244 28260072 */  paddub      $4, $16, $0
/* 025548 01DD1248 1001A527 */  addiu       $5, $29, 0x110
/* 02554C 01DD124C 40000724 */  addiu       $7, $0, 0x40
/* 025550 01DD1250 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 025554 01DD1254 00000000 */   nop
/* 025558 01DD1258 28260072 */  paddub      $4, $16, $0
/* 02555C 01DD125C 01000524 */  addiu       $5, $0, 0x1
/* 025560 01DD1260 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 025564 01DD1264 00000000 */   nop
/* 025568 01DD1268 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 02556C 01DD126C 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 025570 01DD1270 02000524 */  addiu       $5, $0, 0x2
/* 025574 01DD1274 28360072 */  paddub      $6, $16, $0
/* 025578 01DD1278 283E0070 */  paddub      $7, $0, $0
/* 02557C 01DD127C 28460070 */  paddub      $8, $0, $0
/* 025580 01DD1280 1C0E050C */  jal         SetObject__4CMapFiP9CFrameVu1ii
/* 025584 01DD1284 00000000 */   nop
/* 025588 01DD1288 28864070 */  paddub      $16, $2, $0
/* 02558C 01DD128C E001A0AF */  sw          $0, 0x1E0($29)
/* 025590 01DD1290 E401A0AF */  sw          $0, 0x1E4($29)
/* 025594 01DD1294 E801A0AF */  sw          $0, 0x1E8($29)
/* 025598 01DD1298 28260072 */  paddub      $4, $16, $0
/* 02559C 01DD129C E001A527 */  addiu       $5, $29, 0x1E0
/* 0255A0 01DD12A0 A000598C */  lw          $25, 0xA0($2)
/* 0255A4 01DD12A4 1000398F */  lw          $25, 0x10($25)
/* 0255A8 01DD12A8 09F82003 */  jalr        $25
/* 0255AC 01DD12AC 00000000 */   nop
/* 0255B0 01DD12B0 F001A0AF */  sw          $0, 0x1F0($29)
/* 0255B4 01DD12B4 F401A0AF */  sw          $0, 0x1F4($29)
/* 0255B8 01DD12B8 F801A0AF */  sw          $0, 0x1F8($29)
/* 0255BC 01DD12BC 28260072 */  paddub      $4, $16, $0
/* 0255C0 01DD12C0 F001A527 */  addiu       $5, $29, 0x1F0
/* 0255C4 01DD12C4 A000198E */  lw          $25, 0xA0($16)
/* 0255C8 01DD12C8 2C00398F */  lw          $25, 0x2C($25)
/* 0255CC 01DD12CC 09F82003 */  jalr        $25
/* 0255D0 01DD12D0 00000000 */   nop
/* 0255D4 01DD12D4 948B848F */  lw          $4, -0x746C($28)
/* 0255D8 01DD12D8 DE01023C */  lui         $2, %hi(LIT_1662)
/* 0255DC 01DD12DC 980B4524 */  addiu       $5, $2, %lo(LIT_1662)
/* 0255E0 01DD12E0 28360070 */  paddub      $6, $0, $0
/* 0255E4 01DD12E4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0255E8 01DD12E8 00000000 */   nop
/* 0255EC 01DD12EC 28264070 */  paddub      $4, $2, $0
/* 0255F0 01DD12F0 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0255F4 01DD12F4 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 0255F8 01DD12F8 02000624 */  addiu       $6, $0, 0x2
/* 0255FC 01DD12FC 283E0070 */  paddub      $7, $0, $0
/* 025600 01DD1300 28460070 */  paddub      $8, $0, $0
/* 025604 01DD1304 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 025608 01DD1308 00000000 */   nop
/* 02560C 01DD130C 28864070 */  paddub      $16, $2, $0
/* 025610 01DD1310 01000624 */  addiu       $6, $0, 0x1
/* 025614 01DD1314 000026A2 */  sb          $6, 0x0($17)
/* 025618 01DD1318 28260072 */  paddub      $4, $16, $0
/* 02561C 01DD131C 1001A527 */  addiu       $5, $29, 0x110
/* 025620 01DD1320 40000724 */  addiu       $7, $0, 0x40
/* 025624 01DD1324 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 025628 01DD1328 00000000 */   nop
/* 02562C 01DD132C 28260072 */  paddub      $4, $16, $0
/* 025630 01DD1330 01000524 */  addiu       $5, $0, 0x1
/* 025634 01DD1334 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 025638 01DD1338 00000000 */   nop
/* 02563C 01DD133C E201023C */  lui         $2, %hi(OP_BuildingMap2)
/* 025640 01DD1340 40AF4424 */  addiu       $4, $2, %lo(OP_BuildingMap2)
/* 025644 01DD1344 282E0070 */  paddub      $5, $0, $0
/* 025648 01DD1348 28360072 */  paddub      $6, $16, $0
/* 02564C 01DD134C 283E0070 */  paddub      $7, $0, $0
/* 025650 01DD1350 28460070 */  paddub      $8, $0, $0
/* 025654 01DD1354 1C0E050C */  jal         SetObject__4CMapFiP9CFrameVu1ii
/* 025658 01DD1358 00000000 */   nop
/* 02565C 01DD135C 28864070 */  paddub      $16, $2, $0
/* 025660 01DD1360 0002A0AF */  sw          $0, 0x200($29)
/* 025664 01DD1364 0402A0AF */  sw          $0, 0x204($29)
/* 025668 01DD1368 0802A0AF */  sw          $0, 0x208($29)
/* 02566C 01DD136C 28260072 */  paddub      $4, $16, $0
/* 025670 01DD1370 0002A527 */  addiu       $5, $29, 0x200
/* 025674 01DD1374 A000598C */  lw          $25, 0xA0($2)
/* 025678 01DD1378 1000398F */  lw          $25, 0x10($25)
/* 02567C 01DD137C 09F82003 */  jalr        $25
/* 025680 01DD1380 00000000 */   nop
/* 025684 01DD1384 1002A0AF */  sw          $0, 0x210($29)
/* 025688 01DD1388 1402A0AF */  sw          $0, 0x214($29)
/* 02568C 01DD138C 1802A0AF */  sw          $0, 0x218($29)
/* 025690 01DD1390 28260072 */  paddub      $4, $16, $0
/* 025694 01DD1394 1002A527 */  addiu       $5, $29, 0x210
/* 025698 01DD1398 A000198E */  lw          $25, 0xA0($16)
/* 02569C 01DD139C 2C00398F */  lw          $25, 0x2C($25)
/* 0256A0 01DD13A0 09F82003 */  jalr        $25
/* 0256A4 01DD13A4 00000000 */   nop
/* 0256A8 01DD13A8 E501013C */  lui         $1, %hi(PathDataBuffer + 0x8)
/* 0256AC 01DD13AC C80A20AC */  sw          $0, %lo(PathDataBuffer + 0x8)($1)
/* 0256B0 01DD13B0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0256B4 01DD13B4 C09B82AF */  sw          $2, -0x6440($28)
/* 0256B8 01DD13B8 DE01023C */  lui         $2, %hi(LIT_1621__3)
/* 0256BC 01DD13BC 60BA4224 */  addiu       $2, $2, %lo(LIT_1621__3)
/* 0256C0 01DD13C0 7001A327 */  addiu       $3, $29, 0x170
/* 0256C4 01DD13C4 00004278 */  lq          $2, 0x0($2)
/* 0256C8 01DD13C8 0000627C */  sq          $2, 0x0($3)
/* 0256CC 01DD13CC 28860070 */  paddub      $16, $0, $0
/* 0256D0 01DD13D0 27000010 */  b           .L01DD1470_2D6C70
/* 0256D4 01DD13D4 00000000 */   nop
.L01DD13D8_2D6BD8:
/* 0256D8 01DD13D8 B0110224 */  addiu       $2, $0, 0x11B0
/* 0256DC 01DD13DC 18880202 */  mult        $17, $16, $2
/* 0256E0 01DD13E0 E501023C */  lui         $2, %hi(Cam)
/* 0256E4 01DD13E4 F0C34224 */  addiu       $2, $2, %lo(Cam)
/* 0256E8 01DD13E8 21205100 */  addu        $4, $2, $17
/* 0256EC 01DD13EC 80101000 */  sll         $2, $16, 2
/* 0256F0 01DD13F0 21105D00 */  addu        $2, $2, $29
/* 0256F4 01DD13F4 948B858F */  lw          $5, -0x746C($28)
/* 0256F8 01DD13F8 7001468C */  lw          $6, 0x170($2)
/* 0256FC 01DD13FC E501023C */  lui         $2, %hi(PathDataBuffer)
/* 025700 01DD1400 C00A4724 */  addiu       $7, $2, %lo(PathDataBuffer)
/* 025704 01DD1404 28460070 */  paddub      $8, $0, $0
/* 025708 01DD1408 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 02570C 01DD140C 00000000 */   nop
/* 025710 01DD1410 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 025714 01DD1414 E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 025718 01DD1418 E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 02571C 01DD141C 21105100 */  addu        $2, $2, $17
/* 025720 01DD1420 000043AC */  sw          $3, 0x0($2)
/* 025724 01DD1424 E501023C */  lui         $2, %hi(Cam + 0x2F8)
/* 025728 01DD1428 E8C64224 */  addiu       $2, $2, %lo(Cam + 0x2F8)
/* 02572C 01DD142C 21105100 */  addu        $2, $2, $17
/* 025730 01DD1430 000043AC */  sw          $3, 0x0($2)
/* 025734 01DD1434 E501023C */  lui         $2, %hi(Cam + 0x304)
/* 025738 01DD1438 F4C64224 */  addiu       $2, $2, %lo(Cam + 0x304)
/* 02573C 01DD143C 21105100 */  addu        $2, $2, $17
/* 025740 01DD1440 000040AC */  sw          $0, 0x0($2)
/* 025744 01DD1444 E501023C */  lui         $2, %hi(Cam + 0x308)
/* 025748 01DD1448 F8C64224 */  addiu       $2, $2, %lo(Cam + 0x308)
/* 02574C 01DD144C 21105100 */  addu        $2, $2, $17
/* 025750 01DD1450 000040AC */  sw          $0, 0x0($2)
/* 025754 01DD1454 E301023C */  lui         $2, %hi(MainCamera__3)
/* 025758 01DD1458 80E64324 */  addiu       $3, $2, %lo(MainCamera__3)
/* 02575C 01DD145C E501023C */  lui         $2, %hi(Cam + 0x310)
/* 025760 01DD1460 00C74224 */  addiu       $2, $2, %lo(Cam + 0x310)
/* 025764 01DD1464 21105100 */  addu        $2, $2, $17
/* 025768 01DD1468 000043AC */  sw          $3, 0x0($2)
/* 02576C 01DD146C 01001026 */  addiu       $16, $16, 0x1
.L01DD1470_2D6C70:
/* 025770 01DD1470 0200022A */  slti        $2, $16, 0x2
/* 025774 01DD1474 D8FF4014 */  bnez        $2, .L01DD13D8_2D6BD8
/* 025778 01DD1478 00000000 */   nop
/* 02577C 01DD147C B89880AF */  sw          $0, -0x6748($28)
/* 025780 01DD1480 B49880AF */  sw          $0, -0x674C($28)
/* 025784 01DD1484 DE01023C */  lui         $2, %hi(LIT_1663__2)
/* 025788 01DD1488 B00B4424 */  addiu       $4, $2, %lo(LIT_1663__2)
/* 02578C 01DD148C 00C5760C */  jal         OPAnalyz__FPc
/* 025790 01DD1490 00000000 */   nop
/* 025794 01DD1494 4CCA760C */  jal         OPMdsLoad__Fv
/* 025798 01DD1498 00000000 */   nop
/* 02579C 01DD149C 2000BF7B */  lq          $31, 0x20($29)
/* 0257A0 01DD14A0 1000B17B */  lq          $17, 0x10($29)
/* 0257A4 01DD14A4 0000B07B */  lq          $16, 0x0($29)
/* 0257A8 01DD14A8 3002BD27 */  addiu       $29, $29, 0x230
/* 0257AC 01DD14AC 0800E003 */  jr          $31
/* 0257B0 01DD14B0 00000000 */   nop
/* 0257B4 01DD14B4 00000000 */  nop
/* 0257B8 01DD14B8 00000000 */  nop
/* 0257BC 01DD14BC 00000000 */  nop
