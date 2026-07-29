.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitProcF__Fv
/* 023110 01DCEE10 10FEBD27 */  addiu       $29, $29, -0x1F0
/* 023114 01DCEE14 2000BF7F */  sq          $31, 0x20($29)
/* 023118 01DCEE18 1000B17F */  sq          $17, 0x10($29)
/* 02311C 01DCEE1C 0000B07F */  sq          $16, 0x0($29)
/* 023120 01DCEE20 DE01023C */  lui         $2, %hi(LIT_1384__2)
/* 023124 01DCEE24 D0B74624 */  addiu       $6, $2, %lo(LIT_1384__2)
/* 023128 01DCEE28 3000A527 */  addiu       $5, $29, 0x30
/* 02312C 01DCEE2C 04000424 */  addiu       $4, $0, 0x4
.L01DCEE30_2D4630:
/* 023130 01DCEE30 0000C378 */  lq          $3, 0x0($6)
/* 023134 01DCEE34 1000C278 */  lq          $2, 0x10($6)
/* 023138 01DCEE38 2000C624 */  addiu       $6, $6, 0x20
/* 02313C 01DCEE3C FFFF8424 */  addiu       $4, $4, -0x1
/* 023140 01DCEE40 0000A37C */  sq          $3, 0x0($5)
/* 023144 01DCEE44 1000A27C */  sq          $2, 0x10($5)
/* 023148 01DCEE48 2000A524 */  addiu       $5, $5, 0x20
/* 02314C 01DCEE4C F8FF801C */  bgtz        $4, .L01DCEE30_2D4630
/* 023150 01DCEE50 00000000 */   nop
/* 023154 01DCEE54 0000C2C4 */  lwc1        $f2, 0x0($6)
/* 023158 01DCEE58 0000A2E4 */  swc1        $f2, 0x0($5)
/* 02315C 01DCEE5C 948B848F */  lw          $4, -0x746C($28)
/* 023160 01DCEE60 DE01023C */  lui         $2, %hi(LIT_937__5)
/* 023164 01DCEE64 10024524 */  addiu       $5, $2, %lo(LIT_937__5)
/* 023168 01DCEE68 28360070 */  paddub      $6, $0, $0
/* 02316C 01DCEE6C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 023170 01DCEE70 00000000 */   nop
/* 023174 01DCEE74 5400A2AF */  sw          $2, 0x54($29)
/* 023178 01DCEE78 948B848F */  lw          $4, -0x746C($28)
/* 02317C 01DCEE7C DE01023C */  lui         $2, %hi(LIT_1424__2)
/* 023180 01DCEE80 28084524 */  addiu       $5, $2, %lo(LIT_1424__2)
/* 023184 01DCEE84 28360070 */  paddub      $6, $0, $0
/* 023188 01DCEE88 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 02318C 01DCEE8C 00000000 */   nop
/* 023190 01DCEE90 6000A2AF */  sw          $2, 0x60($29)
/* 023194 01DCEE94 948B848F */  lw          $4, -0x746C($28)
/* 023198 01DCEE98 DE01023C */  lui         $2, %hi(LIT_939__2)
/* 02319C 01DCEE9C 30024524 */  addiu       $5, $2, %lo(LIT_939__2)
/* 0231A0 01DCEEA0 28360070 */  paddub      $6, $0, $0
/* 0231A4 01DCEEA4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0231A8 01DCEEA8 00000000 */   nop
/* 0231AC 01DCEEAC 6C00A2AF */  sw          $2, 0x6C($29)
/* 0231B0 01DCEEB0 948B848F */  lw          $4, -0x746C($28)
/* 0231B4 01DCEEB4 DE01023C */  lui         $2, %hi(LIT_1299)
/* 0231B8 01DCEEB8 88064524 */  addiu       $5, $2, %lo(LIT_1299)
/* 0231BC 01DCEEBC 28360070 */  paddub      $6, $0, $0
/* 0231C0 01DCEEC0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0231C4 01DCEEC4 00000000 */   nop
/* 0231C8 01DCEEC8 7800A2AF */  sw          $2, 0x78($29)
/* 0231CC 01DCEECC 948B848F */  lw          $4, -0x746C($28)
/* 0231D0 01DCEED0 DE01023C */  lui         $2, %hi(LIT_1425)
/* 0231D4 01DCEED4 38084524 */  addiu       $5, $2, %lo(LIT_1425)
/* 0231D8 01DCEED8 28360070 */  paddub      $6, $0, $0
/* 0231DC 01DCEEDC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0231E0 01DCEEE0 00000000 */   nop
/* 0231E4 01DCEEE4 8400A2AF */  sw          $2, 0x84($29)
/* 0231E8 01DCEEE8 948B848F */  lw          $4, -0x746C($28)
/* 0231EC 01DCEEEC DE01023C */  lui         $2, %hi(LIT_1426)
/* 0231F0 01DCEEF0 48084524 */  addiu       $5, $2, %lo(LIT_1426)
/* 0231F4 01DCEEF4 28360070 */  paddub      $6, $0, $0
/* 0231F8 01DCEEF8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0231FC 01DCEEFC 00000000 */   nop
/* 023200 01DCEF00 9000A2AF */  sw          $2, 0x90($29)
/* 023204 01DCEF04 948B848F */  lw          $4, -0x746C($28)
/* 023208 01DCEF08 DE01023C */  lui         $2, %hi(LIT_1427)
/* 02320C 01DCEF0C 58084524 */  addiu       $5, $2, %lo(LIT_1427)
/* 023210 01DCEF10 28360070 */  paddub      $6, $0, $0
/* 023214 01DCEF14 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 023218 01DCEF18 00000000 */   nop
/* 02321C 01DCEF1C 9C00A2AF */  sw          $2, 0x9C($29)
/* 023220 01DCEF20 C701023C */  lui         $2, %hi(TexManager)
/* 023224 01DCEF24 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 023228 01DCEF28 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 02322C 01DCEF2C F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 023230 01DCEF30 00000000 */   nop
/* 023234 01DCEF34 C701023C */  lui         $2, %hi(TexManager)
/* 023238 01DCEF38 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 02323C 01DCEF3C FFFF0524 */  addiu       $5, $0, -0x1
/* 023240 01DCEF40 3000A627 */  addiu       $6, $29, 0x30
/* 023244 01DCEF44 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 023248 01DCEF48 00000000 */   nop
/* 02324C 01DCEF4C 01000224 */  addiu       $2, $0, 0x1
/* 023250 01DCEF50 E401013C */  lui         $1, %hi(CharaTex)
/* 023254 01DCEF54 10D022A0 */  sb          $2, %lo(CharaTex)($1)
/* 023258 01DCEF58 02000224 */  addiu       $2, $0, 0x2
/* 02325C 01DCEF5C E401013C */  lui         $1, %hi(CharaTex + 0x1)
/* 023260 01DCEF60 11D022A0 */  sb          $2, %lo(CharaTex + 0x1)($1)
/* 023264 01DCEF64 E401013C */  lui         $1, %hi(CharaTex + 0x2)
/* 023268 01DCEF68 12D022A0 */  sb          $2, %lo(CharaTex + 0x2)($1)
/* 02326C 01DCEF6C E401013C */  lui         $1, %hi(CharaTex + 0x3)
/* 023270 01DCEF70 13D022A0 */  sb          $2, %lo(CharaTex + 0x3)($1)
/* 023274 01DCEF74 E401013C */  lui         $1, %hi(CharaTex + 0x4)
/* 023278 01DCEF78 14D022A0 */  sb          $2, %lo(CharaTex + 0x4)($1)
/* 02327C 01DCEF7C 03000224 */  addiu       $2, $0, 0x3
/* 023280 01DCEF80 E401013C */  lui         $1, %hi(CharaTex + 0x5)
/* 023284 01DCEF84 15D022A0 */  sb          $2, %lo(CharaTex + 0x5)($1)
/* 023288 01DCEF88 09000224 */  addiu       $2, $0, 0x9
/* 02328C 01DCEF8C E401013C */  lui         $1, %hi(CharaTex + 0x8)
/* 023290 01DCEF90 18D022A0 */  sb          $2, %lo(CharaTex + 0x8)($1)
/* 023294 01DCEF94 DE01023C */  lui         $2, %hi(LIT_1391)
/* 023298 01DCEF98 60B84224 */  addiu       $2, $2, %lo(LIT_1391)
/* 02329C 01DCEF9C C000A427 */  addiu       $4, $29, 0xC0
/* 0232A0 01DCEFA0 00004378 */  lq          $3, 0x0($2)
/* 0232A4 01DCEFA4 100042DC */  ld          $2, 0x10($2)
/* 0232A8 01DCEFA8 0000837C */  sq          $3, 0x0($4)
/* 0232AC 01DCEFAC 100082FC */  sd          $2, 0x10($4)
/* 0232B0 01DCEFB0 E401013C */  lui         $1, %hi(CharaDataBuffer + 0x8)
/* 0232B4 01DCEFB4 28D020AC */  sw          $0, %lo(CharaDataBuffer + 0x8)($1)
/* 0232B8 01DCEFB8 28860070 */  paddub      $16, $0, $0
/* 0232BC 01DCEFBC 0C000010 */  b           .L01DCEFF0_2D47F0
/* 0232C0 01DCEFC0 00000000 */   nop
.L01DCEFC4_2D47C4:
/* 0232C4 01DCEFC4 80101000 */  sll         $2, $16, 2
/* 0232C8 01DCEFC8 21105000 */  addu        $2, $2, $16
/* 0232CC 01DCEFCC 40100200 */  sll         $2, $2, 1
/* 0232D0 01DCEFD0 21105000 */  addu        $2, $2, $16
/* 0232D4 01DCEFD4 C0180200 */  sll         $3, $2, 3
/* 0232D8 01DCEFD8 E501023C */  lui         $2, %hi(TexAnimeData__3)
/* 0232DC 01DCEFDC F00A4224 */  addiu       $2, $2, %lo(TexAnimeData__3)
/* 0232E0 01DCEFE0 21204300 */  addu        $4, $2, $3
/* 0232E4 01DCEFE4 349C050C */  jal         Initialize__13CTexAnimeDataFv
/* 0232E8 01DCEFE8 00000000 */   nop
/* 0232EC 01DCEFEC 01001026 */  addiu       $16, $16, 0x1
.L01DCEFF0_2D47F0:
/* 0232F0 01DCEFF0 1E00022A */  slti        $2, $16, 0x1E
/* 0232F4 01DCEFF4 F3FF4014 */  bnez        $2, .L01DCEFC4_2D47C4
/* 0232F8 01DCEFF8 00000000 */   nop
/* 0232FC 01DCEFFC DF01023C */  lui         $2, %hi(Chara__3)
/* 023300 01DCF000 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 023304 01DCF004 E501023C */  lui         $2, %hi(TexAnimeData__3)
/* 023308 01DCF008 F00A4524 */  addiu       $5, $2, %lo(TexAnimeData__3)
/* 02330C 01DCF00C 1E000624 */  addiu       $6, $0, 0x1E
/* 023310 01DCF010 FCDF040C */  jal         InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* 023314 01DCF014 00000000 */   nop
/* 023318 01DCF018 DF01023C */  lui         $2, %hi(Chara__3)
/* 02331C 01DCF01C E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 023320 01DCF020 948B858F */  lw          $5, -0x746C($28)
/* 023324 01DCF024 DE01023C */  lui         $2, %hi(LIT_1081__2)
/* 023328 01DCF028 08044624 */  addiu       $6, $2, %lo(LIT_1081__2)
/* 02332C 01DCF02C E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 023330 01DCF030 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 023334 01DCF034 28460070 */  paddub      $8, $0, $0
/* 023338 01DCF038 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 02333C 01DCF03C 00000000 */   nop
/* 023340 01DCF040 28860070 */  paddub      $16, $0, $0
/* 023344 01DCF044 2F000010 */  b           .L01DCF104_2D4904
/* 023348 01DCF048 00000000 */   nop
.L01DCF04C_2D484C:
/* 02334C 01DCF04C B0110224 */  addiu       $2, $0, 0x11B0
/* 023350 01DCF050 18880202 */  mult        $17, $16, $2
/* 023354 01DCF054 DF01023C */  lui         $2, %hi(Chara__3)
/* 023358 01DCF058 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 02335C 01DCF05C 21205100 */  addu        $4, $2, $17
/* 023360 01DCF060 80101000 */  sll         $2, $16, 2
/* 023364 01DCF064 21105D00 */  addu        $2, $2, $29
/* 023368 01DCF068 948B858F */  lw          $5, -0x746C($28)
/* 02336C 01DCF06C C000468C */  lw          $6, 0xC0($2)
/* 023370 01DCF070 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 023374 01DCF074 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 023378 01DCF078 28460070 */  paddub      $8, $0, $0
/* 02337C 01DCF07C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 023380 01DCF080 00000000 */   nop
/* 023384 01DCF084 E000A427 */  addiu       $4, $29, 0xE0
/* 023388 01DCF088 509F040C */  jal         __ct__10CFrameAttrFv
/* 02338C 01DCF08C 00000000 */   nop
/* 023390 01DCF090 E800A0A3 */  sb          $0, 0xE8($29)
/* 023394 01DCF094 DF01023C */  lui         $2, %hi(Chara__3 + 0xBC)
/* 023398 01DCF098 9CFF4224 */  addiu       $2, $2, %lo(Chara__3 + 0xBC)
/* 02339C 01DCF09C 21105100 */  addu        $2, $2, $17
/* 0233A0 01DCF0A0 0000448C */  lw          $4, 0x0($2)
/* 0233A4 01DCF0A4 E000A527 */  addiu       $5, $29, 0xE0
/* 0233A8 01DCF0A8 01000624 */  addiu       $6, $0, 0x1
/* 0233AC 01DCF0AC 04000724 */  addiu       $7, $0, 0x4
/* 0233B0 01DCF0B0 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0233B4 01DCF0B4 00000000 */   nop
/* 0233B8 01DCF0B8 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0233BC 01DCF0BC DF01023C */  lui         $2, %hi(Chara__3 + 0x2F0)
/* 0233C0 01DCF0C0 D0014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F0)
/* 0233C4 01DCF0C4 21105100 */  addu        $2, $2, $17
/* 0233C8 01DCF0C8 000043AC */  sw          $3, 0x0($2)
/* 0233CC 01DCF0CC 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 0233D0 01DCF0D0 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F8)
/* 0233D4 01DCF0D4 D8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F8)
/* 0233D8 01DCF0D8 21105100 */  addu        $2, $2, $17
/* 0233DC 01DCF0DC 000040E4 */  swc1        $f0, 0x0($2)
/* 0233E0 01DCF0E0 DF01023C */  lui         $2, %hi(Chara__3 + 0x304)
/* 0233E4 01DCF0E4 E4014224 */  addiu       $2, $2, %lo(Chara__3 + 0x304)
/* 0233E8 01DCF0E8 21105100 */  addu        $2, $2, $17
/* 0233EC 01DCF0EC 000040AC */  sw          $0, 0x0($2)
/* 0233F0 01DCF0F0 DF01023C */  lui         $2, %hi(Chara__3 + 0x308)
/* 0233F4 01DCF0F4 E8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x308)
/* 0233F8 01DCF0F8 21105100 */  addu        $2, $2, $17
/* 0233FC 01DCF0FC 000040AC */  sw          $0, 0x0($2)
/* 023400 01DCF100 01001026 */  addiu       $16, $16, 0x1
.L01DCF104_2D4904:
/* 023404 01DCF104 0600022A */  slti        $2, $16, 0x6
/* 023408 01DCF108 D0FF4014 */  bnez        $2, .L01DCF04C_2D484C
/* 02340C 01DCF10C 00000000 */   nop
/* 023410 01DCF110 DF01023C */  lui         $2, %hi(Chara__3)
/* 023414 01DCF114 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 023418 01DCF118 04000524 */  addiu       $5, $0, 0x4
/* 02341C 01DCF11C 20E0040C */  jal         TexAnimeOn__10CCharacterFi
/* 023420 01DCF120 00000000 */   nop
/* 023424 01DCF124 E401023C */  lui         $2, %hi(Wind__4)
/* 023428 01DCF128 C0CC4224 */  addiu       $2, $2, %lo(Wind__4)
/* 02342C 01DCF12C DF01013C */  lui         $1, %hi(Chara__3 + 0xC98)
/* 023430 01DCF130 780B22AC */  sw          $2, %lo(Chara__3 + 0xC98)($1)
/* 023434 01DCF134 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x490)
/* 023438 01DCF138 608C4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x490)
/* 02343C 01DCF13C 948B858F */  lw          $5, -0x746C($28)
/* 023440 01DCF140 DE01023C */  lui         $2, %hi(LIT_1428)
/* 023444 01DCF144 68084624 */  addiu       $6, $2, %lo(LIT_1428)
/* 023448 01DCF148 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 02344C 01DCF14C 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 023450 01DCF150 28460070 */  paddub      $8, $0, $0
/* 023454 01DCF154 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 023458 01DCF158 00000000 */   nop
/* 02345C 01DCF15C 1643023C */  lui         $2, (0x43160000 >> 16)
/* 023460 01DCF160 DF01013C */  lui         $1, %hi(Chara__3 + 0x2F0)
/* 023464 01DCF164 D00122AC */  sw          $2, %lo(Chara__3 + 0x2F0)($1)
/* 023468 01DCF168 0743023C */  lui         $2, (0x43070000 >> 16)
/* 02346C 01DCF16C DF01013C */  lui         $1, %hi(Chara__3 + 0x14A0)
/* 023470 01DCF170 801322AC */  sw          $2, %lo(Chara__3 + 0x14A0)($1)
/* 023474 01DCF174 DF01013C */  lui         $1, %hi(Chara__3 + 0x2650)
/* 023478 01DCF178 302522AC */  sw          $2, %lo(Chara__3 + 0x2650)($1)
/* 02347C 01DCF17C DF01013C */  lui         $1, %hi(DngEventMan + 0x30)
/* 023480 01DCF180 E03622AC */  sw          $2, %lo(DngEventMan + 0x30)($1)
/* 023484 01DCF184 DF01013C */  lui         $1, %hi(DngEventMan + 0x11E0)
/* 023488 01DCF188 904822AC */  sw          $2, %lo(DngEventMan + 0x11E0)($1)
/* 02348C 01DCF18C B89880AF */  sw          $0, -0x6748($28)
/* 023490 01DCF190 B49880AF */  sw          $0, -0x674C($28)
/* 023494 01DCF194 DF01013C */  lui         $1, %hi(MapDataBuffer + 0x8)
/* 023498 01DCF198 B8FE20AC */  sw          $0, %lo(MapDataBuffer + 0x8)($1)
/* 02349C 01DCF19C E201023C */  lui         $2, %hi(OP_GroundMap)
/* 0234A0 01DCF1A0 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 0234A4 01DCF1A4 A80E050C */  jal         Initialize__4CMapFv
/* 0234A8 01DCF1A8 00000000 */   nop
/* 0234AC 01DCF1AC E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 0234B0 01DCF1B0 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 0234B4 01DCF1B4 A80E050C */  jal         Initialize__4CMapFv
/* 0234B8 01DCF1B8 00000000 */   nop
/* 0234BC 01DCF1BC E201023C */  lui         $2, %hi(OP_BuildingMap2)
/* 0234C0 01DCF1C0 40AF4424 */  addiu       $4, $2, %lo(OP_BuildingMap2)
/* 0234C4 01DCF1C4 A80E050C */  jal         Initialize__4CMapFv
/* 0234C8 01DCF1C8 00000000 */   nop
/* 0234CC 01DCF1CC 4001A427 */  addiu       $4, $29, 0x140
/* 0234D0 01DCF1D0 509F040C */  jal         __ct__10CFrameAttrFv
/* 0234D4 01DCF1D4 00000000 */   nop
/* 0234D8 01DCF1D8 948B848F */  lw          $4, -0x746C($28)
/* 0234DC 01DCF1DC DE01023C */  lui         $2, %hi(LIT_1429)
/* 0234E0 01DCF1E0 78084524 */  addiu       $5, $2, %lo(LIT_1429)
/* 0234E4 01DCF1E4 28360070 */  paddub      $6, $0, $0
/* 0234E8 01DCF1E8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0234EC 01DCF1EC 00000000 */   nop
/* 0234F0 01DCF1F0 28264070 */  paddub      $4, $2, $0
/* 0234F4 01DCF1F4 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0234F8 01DCF1F8 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 0234FC 01DCF1FC 02000624 */  addiu       $6, $0, 0x2
/* 023500 01DCF200 283E0070 */  paddub      $7, $0, $0
/* 023504 01DCF204 28460070 */  paddub      $8, $0, $0
/* 023508 01DCF208 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 02350C 01DCF20C 00000000 */   nop
/* 023510 01DCF210 28864070 */  paddub      $16, $2, $0
/* 023514 01DCF214 01000624 */  addiu       $6, $0, 0x1
/* 023518 01DCF218 4C01A6A3 */  sb          $6, 0x14C($29)
/* 02351C 01DCF21C 28260072 */  paddub      $4, $16, $0
/* 023520 01DCF220 4001A527 */  addiu       $5, $29, 0x140
/* 023524 01DCF224 40000724 */  addiu       $7, $0, 0x40
/* 023528 01DCF228 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 02352C 01DCF22C 00000000 */   nop
/* 023530 01DCF230 28260072 */  paddub      $4, $16, $0
/* 023534 01DCF234 01000524 */  addiu       $5, $0, 0x1
/* 023538 01DCF238 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 02353C 01DCF23C 00000000 */   nop
/* 023540 01DCF240 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 023544 01DCF244 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 023548 01DCF248 282E0072 */  paddub      $5, $16, $0
/* 02354C 01DCF24C 28360070 */  paddub      $6, $0, $0
/* 023550 01DCF250 283E0070 */  paddub      $7, $0, $0
/* 023554 01DCF254 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 023558 01DCF258 00000000 */   nop
/* 02355C 01DCF25C 28864070 */  paddub      $16, $2, $0
/* 023560 01DCF260 B001A0AF */  sw          $0, 0x1B0($29)
/* 023564 01DCF264 B401A0AF */  sw          $0, 0x1B4($29)
/* 023568 01DCF268 B801A0AF */  sw          $0, 0x1B8($29)
/* 02356C 01DCF26C 28260072 */  paddub      $4, $16, $0
/* 023570 01DCF270 B001A527 */  addiu       $5, $29, 0x1B0
/* 023574 01DCF274 A000598C */  lw          $25, 0xA0($2)
/* 023578 01DCF278 1000398F */  lw          $25, 0x10($25)
/* 02357C 01DCF27C 09F82003 */  jalr        $25
/* 023580 01DCF280 00000000 */   nop
/* 023584 01DCF284 C001A0AF */  sw          $0, 0x1C0($29)
/* 023588 01DCF288 C401A0AF */  sw          $0, 0x1C4($29)
/* 02358C 01DCF28C C801A0AF */  sw          $0, 0x1C8($29)
/* 023590 01DCF290 28260072 */  paddub      $4, $16, $0
/* 023594 01DCF294 C001A527 */  addiu       $5, $29, 0x1C0
/* 023598 01DCF298 A000198E */  lw          $25, 0xA0($16)
/* 02359C 01DCF29C 2C00398F */  lw          $25, 0x2C($25)
/* 0235A0 01DCF2A0 09F82003 */  jalr        $25
/* 0235A4 01DCF2A4 00000000 */   nop
/* 0235A8 01DCF2A8 948B848F */  lw          $4, -0x746C($28)
/* 0235AC 01DCF2AC DE01023C */  lui         $2, %hi(LIT_1430__2)
/* 0235B0 01DCF2B0 88084524 */  addiu       $5, $2, %lo(LIT_1430__2)
/* 0235B4 01DCF2B4 28360070 */  paddub      $6, $0, $0
/* 0235B8 01DCF2B8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0235BC 01DCF2BC 00000000 */   nop
/* 0235C0 01DCF2C0 28264070 */  paddub      $4, $2, $0
/* 0235C4 01DCF2C4 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0235C8 01DCF2C8 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 0235CC 01DCF2CC 02000624 */  addiu       $6, $0, 0x2
/* 0235D0 01DCF2D0 283E0070 */  paddub      $7, $0, $0
/* 0235D4 01DCF2D4 28460070 */  paddub      $8, $0, $0
/* 0235D8 01DCF2D8 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0235DC 01DCF2DC 00000000 */   nop
/* 0235E0 01DCF2E0 28864070 */  paddub      $16, $2, $0
/* 0235E4 01DCF2E4 28260072 */  paddub      $4, $16, $0
/* 0235E8 01DCF2E8 4001A527 */  addiu       $5, $29, 0x140
/* 0235EC 01DCF2EC 01000624 */  addiu       $6, $0, 0x1
/* 0235F0 01DCF2F0 40000724 */  addiu       $7, $0, 0x40
/* 0235F4 01DCF2F4 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0235F8 01DCF2F8 00000000 */   nop
/* 0235FC 01DCF2FC 28260072 */  paddub      $4, $16, $0
/* 023600 01DCF300 01000524 */  addiu       $5, $0, 0x1
/* 023604 01DCF304 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 023608 01DCF308 00000000 */   nop
/* 02360C 01DCF30C E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 023610 01DCF310 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 023614 01DCF314 282E0072 */  paddub      $5, $16, $0
/* 023618 01DCF318 28360070 */  paddub      $6, $0, $0
/* 02361C 01DCF31C 283E0070 */  paddub      $7, $0, $0
/* 023620 01DCF320 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 023624 01DCF324 00000000 */   nop
/* 023628 01DCF328 28864070 */  paddub      $16, $2, $0
/* 02362C 01DCF32C D001A0AF */  sw          $0, 0x1D0($29)
/* 023630 01DCF330 D401A0AF */  sw          $0, 0x1D4($29)
/* 023634 01DCF334 D801A0AF */  sw          $0, 0x1D8($29)
/* 023638 01DCF338 28260072 */  paddub      $4, $16, $0
/* 02363C 01DCF33C D001A527 */  addiu       $5, $29, 0x1D0
/* 023640 01DCF340 A000598C */  lw          $25, 0xA0($2)
/* 023644 01DCF344 1000398F */  lw          $25, 0x10($25)
/* 023648 01DCF348 09F82003 */  jalr        $25
/* 02364C 01DCF34C 00000000 */   nop
/* 023650 01DCF350 E001A0AF */  sw          $0, 0x1E0($29)
/* 023654 01DCF354 E401A0AF */  sw          $0, 0x1E4($29)
/* 023658 01DCF358 E801A0AF */  sw          $0, 0x1E8($29)
/* 02365C 01DCF35C 28260072 */  paddub      $4, $16, $0
/* 023660 01DCF360 E001A527 */  addiu       $5, $29, 0x1E0
/* 023664 01DCF364 A000198E */  lw          $25, 0xA0($16)
/* 023668 01DCF368 2C00398F */  lw          $25, 0x2C($25)
/* 02366C 01DCF36C 09F82003 */  jalr        $25
/* 023670 01DCF370 00000000 */   nop
/* 023674 01DCF374 28260072 */  paddub      $4, $16, $0
/* 023678 01DCF378 DE01023C */  lui         $2, %hi(LIT_1431)
/* 02367C 01DCF37C 98084524 */  addiu       $5, $2, %lo(LIT_1431)
/* 023680 01DCF380 28360070 */  paddub      $6, $0, $0
/* 023684 01DCF384 A000198E */  lw          $25, 0xA0($16)
/* 023688 01DCF388 9000398F */  lw          $25, 0x90($25)
/* 02368C 01DCF38C 09F82003 */  jalr        $25
/* 023690 01DCF390 00000000 */   nop
/* 023694 01DCF394 E501013C */  lui         $1, %hi(PathDataBuffer + 0x8)
/* 023698 01DCF398 C80A20AC */  sw          $0, %lo(PathDataBuffer + 0x8)($1)
/* 02369C 01DCF39C FFFF0224 */  addiu       $2, $0, -0x1
/* 0236A0 01DCF3A0 C09B82AF */  sw          $2, -0x6440($28)
/* 0236A4 01DCF3A4 DE01023C */  lui         $2, %hi(LIT_1404__2)
/* 0236A8 01DCF3A8 80B84224 */  addiu       $2, $2, %lo(LIT_1404__2)
/* 0236AC 01DCF3AC A001A327 */  addiu       $3, $29, 0x1A0
/* 0236B0 01DCF3B0 00004278 */  lq          $2, 0x0($2)
/* 0236B4 01DCF3B4 0000627C */  sq          $2, 0x0($3)
/* 0236B8 01DCF3B8 28860070 */  paddub      $16, $0, $0
/* 0236BC 01DCF3BC 27000010 */  b           .L01DCF45C_2D4C5C
/* 0236C0 01DCF3C0 00000000 */   nop
.L01DCF3C4_2D4BC4:
/* 0236C4 01DCF3C4 B0110224 */  addiu       $2, $0, 0x11B0
/* 0236C8 01DCF3C8 18880202 */  mult        $17, $16, $2
/* 0236CC 01DCF3CC E501023C */  lui         $2, %hi(Cam)
/* 0236D0 01DCF3D0 F0C34224 */  addiu       $2, $2, %lo(Cam)
/* 0236D4 01DCF3D4 21205100 */  addu        $4, $2, $17
/* 0236D8 01DCF3D8 80101000 */  sll         $2, $16, 2
/* 0236DC 01DCF3DC 21105D00 */  addu        $2, $2, $29
/* 0236E0 01DCF3E0 948B858F */  lw          $5, -0x746C($28)
/* 0236E4 01DCF3E4 A001468C */  lw          $6, 0x1A0($2)
/* 0236E8 01DCF3E8 E501023C */  lui         $2, %hi(PathDataBuffer)
/* 0236EC 01DCF3EC C00A4724 */  addiu       $7, $2, %lo(PathDataBuffer)
/* 0236F0 01DCF3F0 28460070 */  paddub      $8, $0, $0
/* 0236F4 01DCF3F4 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0236F8 01DCF3F8 00000000 */   nop
/* 0236FC 01DCF3FC 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 023700 01DCF400 E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 023704 01DCF404 E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 023708 01DCF408 21105100 */  addu        $2, $2, $17
/* 02370C 01DCF40C 000043AC */  sw          $3, 0x0($2)
/* 023710 01DCF410 E501023C */  lui         $2, %hi(Cam + 0x2F8)
/* 023714 01DCF414 E8C64224 */  addiu       $2, $2, %lo(Cam + 0x2F8)
/* 023718 01DCF418 21105100 */  addu        $2, $2, $17
/* 02371C 01DCF41C 000043AC */  sw          $3, 0x0($2)
/* 023720 01DCF420 E501023C */  lui         $2, %hi(Cam + 0x304)
/* 023724 01DCF424 F4C64224 */  addiu       $2, $2, %lo(Cam + 0x304)
/* 023728 01DCF428 21105100 */  addu        $2, $2, $17
/* 02372C 01DCF42C 000040AC */  sw          $0, 0x0($2)
/* 023730 01DCF430 E501023C */  lui         $2, %hi(Cam + 0x308)
/* 023734 01DCF434 F8C64224 */  addiu       $2, $2, %lo(Cam + 0x308)
/* 023738 01DCF438 21105100 */  addu        $2, $2, $17
/* 02373C 01DCF43C 000040AC */  sw          $0, 0x0($2)
/* 023740 01DCF440 E301023C */  lui         $2, %hi(MainCamera__3)
/* 023744 01DCF444 80E64324 */  addiu       $3, $2, %lo(MainCamera__3)
/* 023748 01DCF448 E501023C */  lui         $2, %hi(Cam + 0x310)
/* 02374C 01DCF44C 00C74224 */  addiu       $2, $2, %lo(Cam + 0x310)
/* 023750 01DCF450 21105100 */  addu        $2, $2, $17
/* 023754 01DCF454 000043AC */  sw          $3, 0x0($2)
/* 023758 01DCF458 01001026 */  addiu       $16, $16, 0x1
.L01DCF45C_2D4C5C:
/* 02375C 01DCF45C 0200022A */  slti        $2, $16, 0x2
/* 023760 01DCF460 D8FF4014 */  bnez        $2, .L01DCF3C4_2D4BC4
/* 023764 01DCF464 00000000 */   nop
/* 023768 01DCF468 B89880AF */  sw          $0, -0x6748($28)
/* 02376C 01DCF46C B49880AF */  sw          $0, -0x674C($28)
/* 023770 01DCF470 DE01023C */  lui         $2, %hi(LIT_1432)
/* 023774 01DCF474 A0084424 */  addiu       $4, $2, %lo(LIT_1432)
/* 023778 01DCF478 00C5760C */  jal         OPAnalyz__FPc
/* 02377C 01DCF47C 00000000 */   nop
/* 023780 01DCF480 4CCA760C */  jal         OPMdsLoad__Fv
/* 023784 01DCF484 00000000 */   nop
/* 023788 01DCF488 2000BF7B */  lq          $31, 0x20($29)
/* 02378C 01DCF48C 1000B17B */  lq          $17, 0x10($29)
/* 023790 01DCF490 0000B07B */  lq          $16, 0x0($29)
/* 023794 01DCF494 F001BD27 */  addiu       $29, $29, 0x1F0
/* 023798 01DCF498 0800E003 */  jr          $31
/* 02379C 01DCF49C 00000000 */   nop
