.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitProcD__Fv
/* 022160 01DCDE60 40FEBD27 */  addiu       $29, $29, -0x1C0
/* 022164 01DCDE64 2000BF7F */  sq          $31, 0x20($29)
/* 022168 01DCDE68 1000B17F */  sq          $17, 0x10($29)
/* 02216C 01DCDE6C 0000B07F */  sq          $16, 0x0($29)
/* 022170 01DCDE70 DE01023C */  lui         $2, %hi(LIT_1262)
/* 022174 01DCDE74 B0B64524 */  addiu       $5, $2, %lo(LIT_1262)
/* 022178 01DCDE78 3000A427 */  addiu       $4, $29, 0x30
/* 02217C 01DCDE7C 07000324 */  addiu       $3, $0, 0x7
.L01DCDE80_2D3680:
/* 022180 01DCDE80 0000A278 */  lq          $2, 0x0($5)
/* 022184 01DCDE84 1000A524 */  addiu       $5, $5, 0x10
/* 022188 01DCDE88 FFFF6324 */  addiu       $3, $3, -0x1
/* 02218C 01DCDE8C 0000827C */  sq          $2, 0x0($4)
/* 022190 01DCDE90 10008424 */  addiu       $4, $4, 0x10
/* 022194 01DCDE94 FAFF601C */  bgtz        $3, .L01DCDE80_2D3680
/* 022198 01DCDE98 00000000 */   nop
/* 02219C 01DCDE9C 0000A2DC */  ld          $2, 0x0($5)
/* 0221A0 01DCDEA0 000082FC */  sd          $2, 0x0($4)
/* 0221A4 01DCDEA4 948B848F */  lw          $4, -0x746C($28)
/* 0221A8 01DCDEA8 DE01023C */  lui         $2, %hi(LIT_937__5)
/* 0221AC 01DCDEAC 10024524 */  addiu       $5, $2, %lo(LIT_937__5)
/* 0221B0 01DCDEB0 28360070 */  paddub      $6, $0, $0
/* 0221B4 01DCDEB4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0221B8 01DCDEB8 00000000 */   nop
/* 0221BC 01DCDEBC 5400A2AF */  sw          $2, 0x54($29)
/* 0221C0 01DCDEC0 948B848F */  lw          $4, -0x746C($28)
/* 0221C4 01DCDEC4 DE01023C */  lui         $2, %hi(LIT_1298)
/* 0221C8 01DCDEC8 78064524 */  addiu       $5, $2, %lo(LIT_1298)
/* 0221CC 01DCDECC 28360070 */  paddub      $6, $0, $0
/* 0221D0 01DCDED0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0221D4 01DCDED4 00000000 */   nop
/* 0221D8 01DCDED8 6000A2AF */  sw          $2, 0x60($29)
/* 0221DC 01DCDEDC 948B848F */  lw          $4, -0x746C($28)
/* 0221E0 01DCDEE0 DE01023C */  lui         $2, %hi(LIT_939__2)
/* 0221E4 01DCDEE4 30024524 */  addiu       $5, $2, %lo(LIT_939__2)
/* 0221E8 01DCDEE8 28360070 */  paddub      $6, $0, $0
/* 0221EC 01DCDEEC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0221F0 01DCDEF0 00000000 */   nop
/* 0221F4 01DCDEF4 6C00A2AF */  sw          $2, 0x6C($29)
/* 0221F8 01DCDEF8 948B848F */  lw          $4, -0x746C($28)
/* 0221FC 01DCDEFC DE01023C */  lui         $2, %hi(LIT_1299)
/* 022200 01DCDF00 88064524 */  addiu       $5, $2, %lo(LIT_1299)
/* 022204 01DCDF04 28360070 */  paddub      $6, $0, $0
/* 022208 01DCDF08 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 02220C 01DCDF0C 00000000 */   nop
/* 022210 01DCDF10 7800A2AF */  sw          $2, 0x78($29)
/* 022214 01DCDF14 948B848F */  lw          $4, -0x746C($28)
/* 022218 01DCDF18 DE01023C */  lui         $2, %hi(LIT_1300__2)
/* 02221C 01DCDF1C 98064524 */  addiu       $5, $2, %lo(LIT_1300__2)
/* 022220 01DCDF20 28360070 */  paddub      $6, $0, $0
/* 022224 01DCDF24 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 022228 01DCDF28 00000000 */   nop
/* 02222C 01DCDF2C 8400A2AF */  sw          $2, 0x84($29)
/* 022230 01DCDF30 948B848F */  lw          $4, -0x746C($28)
/* 022234 01DCDF34 DE01023C */  lui         $2, %hi(LIT_1301__2)
/* 022238 01DCDF38 A8064524 */  addiu       $5, $2, %lo(LIT_1301__2)
/* 02223C 01DCDF3C 28360070 */  paddub      $6, $0, $0
/* 022240 01DCDF40 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 022244 01DCDF44 00000000 */   nop
/* 022248 01DCDF48 9000A2AF */  sw          $2, 0x90($29)
/* 02224C 01DCDF4C C701023C */  lui         $2, %hi(TexManager)
/* 022250 01DCDF50 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 022254 01DCDF54 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 022258 01DCDF58 F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 02225C 01DCDF5C 00000000 */   nop
/* 022260 01DCDF60 C701023C */  lui         $2, %hi(TexManager)
/* 022264 01DCDF64 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 022268 01DCDF68 FFFF0524 */  addiu       $5, $0, -0x1
/* 02226C 01DCDF6C 3000A627 */  addiu       $6, $29, 0x30
/* 022270 01DCDF70 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 022274 01DCDF74 00000000 */   nop
/* 022278 01DCDF78 01000224 */  addiu       $2, $0, 0x1
/* 02227C 01DCDF7C E401013C */  lui         $1, %hi(CharaTex)
/* 022280 01DCDF80 10D022A0 */  sb          $2, %lo(CharaTex)($1)
/* 022284 01DCDF84 02000224 */  addiu       $2, $0, 0x2
/* 022288 01DCDF88 E401013C */  lui         $1, %hi(CharaTex + 0x1)
/* 02228C 01DCDF8C 11D022A0 */  sb          $2, %lo(CharaTex + 0x1)($1)
/* 022290 01DCDF90 E401013C */  lui         $1, %hi(CharaTex + 0x2)
/* 022294 01DCDF94 12D022A0 */  sb          $2, %lo(CharaTex + 0x2)($1)
/* 022298 01DCDF98 09000224 */  addiu       $2, $0, 0x9
/* 02229C 01DCDF9C E401013C */  lui         $1, %hi(CharaTex + 0x8)
/* 0222A0 01DCDFA0 18D022A0 */  sb          $2, %lo(CharaTex + 0x8)($1)
/* 0222A4 01DCDFA4 DE01023C */  lui         $2, %hi(LIT_1266)
/* 0222A8 01DCDFA8 28B74424 */  addiu       $4, $2, %lo(LIT_1266)
/* 0222AC 01DCDFAC B001A327 */  addiu       $3, $29, 0x1B0
/* 0222B0 01DCDFB0 000082DC */  ld          $2, 0x0($4)
/* 0222B4 01DCDFB4 080080C4 */  lwc1        $f0, 0x8($4)
/* 0222B8 01DCDFB8 000062FC */  sd          $2, 0x0($3)
/* 0222BC 01DCDFBC 080060E4 */  swc1        $f0, 0x8($3)
/* 0222C0 01DCDFC0 E401013C */  lui         $1, %hi(CharaDataBuffer + 0x8)
/* 0222C4 01DCDFC4 28D020AC */  sw          $0, %lo(CharaDataBuffer + 0x8)($1)
/* 0222C8 01DCDFC8 28860070 */  paddub      $16, $0, $0
/* 0222CC 01DCDFCC 0C000010 */  b           .L01DCE000_2D3800
/* 0222D0 01DCDFD0 00000000 */   nop
.L01DCDFD4_2D37D4:
/* 0222D4 01DCDFD4 80101000 */  sll         $2, $16, 2
/* 0222D8 01DCDFD8 21105000 */  addu        $2, $2, $16
/* 0222DC 01DCDFDC 40100200 */  sll         $2, $2, 1
/* 0222E0 01DCDFE0 21105000 */  addu        $2, $2, $16
/* 0222E4 01DCDFE4 C0180200 */  sll         $3, $2, 3
/* 0222E8 01DCDFE8 E501023C */  lui         $2, %hi(TexAnimeData__3)
/* 0222EC 01DCDFEC F00A4224 */  addiu       $2, $2, %lo(TexAnimeData__3)
/* 0222F0 01DCDFF0 21204300 */  addu        $4, $2, $3
/* 0222F4 01DCDFF4 349C050C */  jal         Initialize__13CTexAnimeDataFv
/* 0222F8 01DCDFF8 00000000 */   nop
/* 0222FC 01DCDFFC 01001026 */  addiu       $16, $16, 0x1
.L01DCE000_2D3800:
/* 022300 01DCE000 1E00022A */  slti        $2, $16, 0x1E
/* 022304 01DCE004 F3FF4014 */  bnez        $2, .L01DCDFD4_2D37D4
/* 022308 01DCE008 00000000 */   nop
/* 02230C 01DCE00C DF01023C */  lui         $2, %hi(Chara__3)
/* 022310 01DCE010 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 022314 01DCE014 E501023C */  lui         $2, %hi(TexAnimeData__3)
/* 022318 01DCE018 F00A4524 */  addiu       $5, $2, %lo(TexAnimeData__3)
/* 02231C 01DCE01C 1E000624 */  addiu       $6, $0, 0x1E
/* 022320 01DCE020 FCDF040C */  jal         InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* 022324 01DCE024 00000000 */   nop
/* 022328 01DCE028 DF01023C */  lui         $2, %hi(Chara__3)
/* 02232C 01DCE02C E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 022330 01DCE030 948B858F */  lw          $5, -0x746C($28)
/* 022334 01DCE034 DE01023C */  lui         $2, %hi(LIT_1081__2)
/* 022338 01DCE038 08044624 */  addiu       $6, $2, %lo(LIT_1081__2)
/* 02233C 01DCE03C E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 022340 01DCE040 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 022344 01DCE044 28460070 */  paddub      $8, $0, $0
/* 022348 01DCE048 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 02234C 01DCE04C 00000000 */   nop
/* 022350 01DCE050 28860070 */  paddub      $16, $0, $0
/* 022354 01DCE054 2F000010 */  b           .L01DCE114_2D3914
/* 022358 01DCE058 00000000 */   nop
.L01DCE05C_2D385C:
/* 02235C 01DCE05C B0110224 */  addiu       $2, $0, 0x11B0
/* 022360 01DCE060 18880202 */  mult        $17, $16, $2
/* 022364 01DCE064 DF01023C */  lui         $2, %hi(Chara__3)
/* 022368 01DCE068 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 02236C 01DCE06C 21205100 */  addu        $4, $2, $17
/* 022370 01DCE070 80101000 */  sll         $2, $16, 2
/* 022374 01DCE074 21105D00 */  addu        $2, $2, $29
/* 022378 01DCE078 948B858F */  lw          $5, -0x746C($28)
/* 02237C 01DCE07C B001468C */  lw          $6, 0x1B0($2)
/* 022380 01DCE080 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 022384 01DCE084 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 022388 01DCE088 28460070 */  paddub      $8, $0, $0
/* 02238C 01DCE08C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 022390 01DCE090 00000000 */   nop
/* 022394 01DCE094 B000A427 */  addiu       $4, $29, 0xB0
/* 022398 01DCE098 509F040C */  jal         __ct__10CFrameAttrFv
/* 02239C 01DCE09C 00000000 */   nop
/* 0223A0 01DCE0A0 B800A0A3 */  sb          $0, 0xB8($29)
/* 0223A4 01DCE0A4 DF01023C */  lui         $2, %hi(Chara__3 + 0xBC)
/* 0223A8 01DCE0A8 9CFF4224 */  addiu       $2, $2, %lo(Chara__3 + 0xBC)
/* 0223AC 01DCE0AC 21105100 */  addu        $2, $2, $17
/* 0223B0 01DCE0B0 0000448C */  lw          $4, 0x0($2)
/* 0223B4 01DCE0B4 B000A527 */  addiu       $5, $29, 0xB0
/* 0223B8 01DCE0B8 01000624 */  addiu       $6, $0, 0x1
/* 0223BC 01DCE0BC 04000724 */  addiu       $7, $0, 0x4
/* 0223C0 01DCE0C0 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0223C4 01DCE0C4 00000000 */   nop
/* 0223C8 01DCE0C8 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0223CC 01DCE0CC DF01023C */  lui         $2, %hi(Chara__3 + 0x2F0)
/* 0223D0 01DCE0D0 D0014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F0)
/* 0223D4 01DCE0D4 21105100 */  addu        $2, $2, $17
/* 0223D8 01DCE0D8 000043AC */  sw          $3, 0x0($2)
/* 0223DC 01DCE0DC 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 0223E0 01DCE0E0 DF01023C */  lui         $2, %hi(Chara__3 + 0x2F8)
/* 0223E4 01DCE0E4 D8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x2F8)
/* 0223E8 01DCE0E8 21105100 */  addu        $2, $2, $17
/* 0223EC 01DCE0EC 000040E4 */  swc1        $f0, 0x0($2)
/* 0223F0 01DCE0F0 DF01023C */  lui         $2, %hi(Chara__3 + 0x304)
/* 0223F4 01DCE0F4 E4014224 */  addiu       $2, $2, %lo(Chara__3 + 0x304)
/* 0223F8 01DCE0F8 21105100 */  addu        $2, $2, $17
/* 0223FC 01DCE0FC 000040AC */  sw          $0, 0x0($2)
/* 022400 01DCE100 DF01023C */  lui         $2, %hi(Chara__3 + 0x308)
/* 022404 01DCE104 E8014224 */  addiu       $2, $2, %lo(Chara__3 + 0x308)
/* 022408 01DCE108 21105100 */  addu        $2, $2, $17
/* 02240C 01DCE10C 000040AC */  sw          $0, 0x0($2)
/* 022410 01DCE110 01001026 */  addiu       $16, $16, 0x1
.L01DCE114_2D3914:
/* 022414 01DCE114 0300022A */  slti        $2, $16, 0x3
/* 022418 01DCE118 D0FF4014 */  bnez        $2, .L01DCE05C_2D385C
/* 02241C 01DCE11C 00000000 */   nop
/* 022420 01DCE120 2041023C */  lui         $2, (0x41200000 >> 16)
/* 022424 01DCE124 DF01013C */  lui         $1, %hi(Chara__3 + 0x2F0)
/* 022428 01DCE128 D00122AC */  sw          $2, %lo(Chara__3 + 0x2F0)($1)
/* 02242C 01DCE12C DF01013C */  lui         $1, %hi(Chara__3 + 0x14A0)
/* 022430 01DCE130 801322AC */  sw          $2, %lo(Chara__3 + 0x14A0)($1)
/* 022434 01DCE134 DF01013C */  lui         $1, %hi(Chara__3 + 0x2650)
/* 022438 01DCE138 302522AC */  sw          $2, %lo(Chara__3 + 0x2650)($1)
/* 02243C 01DCE13C E001023C */  lui         $2, %hi(MainMonstorUnit + 0x490)
/* 022440 01DCE140 608C4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x490)
/* 022444 01DCE144 948B858F */  lw          $5, -0x746C($28)
/* 022448 01DCE148 DE01023C */  lui         $2, %hi(LIT_1302__2)
/* 02244C 01DCE14C B8064624 */  addiu       $6, $2, %lo(LIT_1302__2)
/* 022450 01DCE150 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 022454 01DCE154 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 022458 01DCE158 28460070 */  paddub      $8, $0, $0
/* 02245C 01DCE15C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 022460 01DCE160 00000000 */   nop
/* 022464 01DCE164 DF01023C */  lui         $2, %hi(Chara__3)
/* 022468 01DCE168 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 02246C 01DCE16C 02000524 */  addiu       $5, $0, 0x2
/* 022470 01DCE170 20E0040C */  jal         TexAnimeOn__10CCharacterFi
/* 022474 01DCE174 00000000 */   nop
/* 022478 01DCE178 E401023C */  lui         $2, %hi(Wind__4)
/* 02247C 01DCE17C C0CC4224 */  addiu       $2, $2, %lo(Wind__4)
/* 022480 01DCE180 DF01013C */  lui         $1, %hi(Chara__3 + 0xC98)
/* 022484 01DCE184 780B22AC */  sw          $2, %lo(Chara__3 + 0xC98)($1)
/* 022488 01DCE188 B89880AF */  sw          $0, -0x6748($28)
/* 02248C 01DCE18C B49880AF */  sw          $0, -0x674C($28)
/* 022490 01DCE190 DF01013C */  lui         $1, %hi(MapDataBuffer + 0x8)
/* 022494 01DCE194 B8FE20AC */  sw          $0, %lo(MapDataBuffer + 0x8)($1)
/* 022498 01DCE198 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 02249C 01DCE19C 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 0224A0 01DCE1A0 A80E050C */  jal         Initialize__4CMapFv
/* 0224A4 01DCE1A4 00000000 */   nop
/* 0224A8 01DCE1A8 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 0224AC 01DCE1AC 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 0224B0 01DCE1B0 A80E050C */  jal         Initialize__4CMapFv
/* 0224B4 01DCE1B4 00000000 */   nop
/* 0224B8 01DCE1B8 E201023C */  lui         $2, %hi(OP_BuildingMap2)
/* 0224BC 01DCE1BC 40AF4424 */  addiu       $4, $2, %lo(OP_BuildingMap2)
/* 0224C0 01DCE1C0 A80E050C */  jal         Initialize__4CMapFv
/* 0224C4 01DCE1C4 00000000 */   nop
/* 0224C8 01DCE1C8 1001A427 */  addiu       $4, $29, 0x110
/* 0224CC 01DCE1CC 509F040C */  jal         __ct__10CFrameAttrFv
/* 0224D0 01DCE1D0 00000000 */   nop
/* 0224D4 01DCE1D4 948B848F */  lw          $4, -0x746C($28)
/* 0224D8 01DCE1D8 DE01023C */  lui         $2, %hi(LIT_1303)
/* 0224DC 01DCE1DC C8064524 */  addiu       $5, $2, %lo(LIT_1303)
/* 0224E0 01DCE1E0 28360070 */  paddub      $6, $0, $0
/* 0224E4 01DCE1E4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0224E8 01DCE1E8 00000000 */   nop
/* 0224EC 01DCE1EC 28264070 */  paddub      $4, $2, $0
/* 0224F0 01DCE1F0 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0224F4 01DCE1F4 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 0224F8 01DCE1F8 02000624 */  addiu       $6, $0, 0x2
/* 0224FC 01DCE1FC 283E0070 */  paddub      $7, $0, $0
/* 022500 01DCE200 28460070 */  paddub      $8, $0, $0
/* 022504 01DCE204 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 022508 01DCE208 00000000 */   nop
/* 02250C 01DCE20C 28864070 */  paddub      $16, $2, $0
/* 022510 01DCE210 01000624 */  addiu       $6, $0, 0x1
/* 022514 01DCE214 1C01A6A3 */  sb          $6, 0x11C($29)
/* 022518 01DCE218 28260072 */  paddub      $4, $16, $0
/* 02251C 01DCE21C 1001A527 */  addiu       $5, $29, 0x110
/* 022520 01DCE220 40000724 */  addiu       $7, $0, 0x40
/* 022524 01DCE224 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 022528 01DCE228 00000000 */   nop
/* 02252C 01DCE22C 28260072 */  paddub      $4, $16, $0
/* 022530 01DCE230 01000524 */  addiu       $5, $0, 0x1
/* 022534 01DCE234 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 022538 01DCE238 00000000 */   nop
/* 02253C 01DCE23C E201023C */  lui         $2, %hi(OP_GroundMap)
/* 022540 01DCE240 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 022544 01DCE244 282E0072 */  paddub      $5, $16, $0
/* 022548 01DCE248 28360070 */  paddub      $6, $0, $0
/* 02254C 01DCE24C 283E0070 */  paddub      $7, $0, $0
/* 022550 01DCE250 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 022554 01DCE254 00000000 */   nop
/* 022558 01DCE258 28864070 */  paddub      $16, $2, $0
/* 02255C 01DCE25C 7001A0AF */  sw          $0, 0x170($29)
/* 022560 01DCE260 7401A0AF */  sw          $0, 0x174($29)
/* 022564 01DCE264 7801A0AF */  sw          $0, 0x178($29)
/* 022568 01DCE268 28260072 */  paddub      $4, $16, $0
/* 02256C 01DCE26C 7001A527 */  addiu       $5, $29, 0x170
/* 022570 01DCE270 A000598C */  lw          $25, 0xA0($2)
/* 022574 01DCE274 1000398F */  lw          $25, 0x10($25)
/* 022578 01DCE278 09F82003 */  jalr        $25
/* 02257C 01DCE27C 00000000 */   nop
/* 022580 01DCE280 8001A0AF */  sw          $0, 0x180($29)
/* 022584 01DCE284 8401A0AF */  sw          $0, 0x184($29)
/* 022588 01DCE288 8801A0AF */  sw          $0, 0x188($29)
/* 02258C 01DCE28C 28260072 */  paddub      $4, $16, $0
/* 022590 01DCE290 8001A527 */  addiu       $5, $29, 0x180
/* 022594 01DCE294 A000198E */  lw          $25, 0xA0($16)
/* 022598 01DCE298 2C00398F */  lw          $25, 0x2C($25)
/* 02259C 01DCE29C 09F82003 */  jalr        $25
/* 0225A0 01DCE2A0 00000000 */   nop
/* 0225A4 01DCE2A4 948B848F */  lw          $4, -0x746C($28)
/* 0225A8 01DCE2A8 DE01023C */  lui         $2, %hi(LIT_1304)
/* 0225AC 01DCE2AC D8064524 */  addiu       $5, $2, %lo(LIT_1304)
/* 0225B0 01DCE2B0 28360070 */  paddub      $6, $0, $0
/* 0225B4 01DCE2B4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0225B8 01DCE2B8 00000000 */   nop
/* 0225BC 01DCE2BC 28264070 */  paddub      $4, $2, $0
/* 0225C0 01DCE2C0 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0225C4 01DCE2C4 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 0225C8 01DCE2C8 02000624 */  addiu       $6, $0, 0x2
/* 0225CC 01DCE2CC 283E0070 */  paddub      $7, $0, $0
/* 0225D0 01DCE2D0 28460070 */  paddub      $8, $0, $0
/* 0225D4 01DCE2D4 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0225D8 01DCE2D8 00000000 */   nop
/* 0225DC 01DCE2DC 28864070 */  paddub      $16, $2, $0
/* 0225E0 01DCE2E0 28260072 */  paddub      $4, $16, $0
/* 0225E4 01DCE2E4 1001A527 */  addiu       $5, $29, 0x110
/* 0225E8 01DCE2E8 01000624 */  addiu       $6, $0, 0x1
/* 0225EC 01DCE2EC 40000724 */  addiu       $7, $0, 0x40
/* 0225F0 01DCE2F0 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0225F4 01DCE2F4 00000000 */   nop
/* 0225F8 01DCE2F8 28260072 */  paddub      $4, $16, $0
/* 0225FC 01DCE2FC 01000524 */  addiu       $5, $0, 0x1
/* 022600 01DCE300 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 022604 01DCE304 00000000 */   nop
/* 022608 01DCE308 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 02260C 01DCE30C 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 022610 01DCE310 282E0072 */  paddub      $5, $16, $0
/* 022614 01DCE314 28360070 */  paddub      $6, $0, $0
/* 022618 01DCE318 283E0070 */  paddub      $7, $0, $0
/* 02261C 01DCE31C 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 022620 01DCE320 00000000 */   nop
/* 022624 01DCE324 28864070 */  paddub      $16, $2, $0
/* 022628 01DCE328 9001A0AF */  sw          $0, 0x190($29)
/* 02262C 01DCE32C 9401A0AF */  sw          $0, 0x194($29)
/* 022630 01DCE330 9801A0AF */  sw          $0, 0x198($29)
/* 022634 01DCE334 28260072 */  paddub      $4, $16, $0
/* 022638 01DCE338 9001A527 */  addiu       $5, $29, 0x190
/* 02263C 01DCE33C A000598C */  lw          $25, 0xA0($2)
/* 022640 01DCE340 1000398F */  lw          $25, 0x10($25)
/* 022644 01DCE344 09F82003 */  jalr        $25
/* 022648 01DCE348 00000000 */   nop
/* 02264C 01DCE34C A001A0AF */  sw          $0, 0x1A0($29)
/* 022650 01DCE350 A401A0AF */  sw          $0, 0x1A4($29)
/* 022654 01DCE354 A801A0AF */  sw          $0, 0x1A8($29)
/* 022658 01DCE358 28260072 */  paddub      $4, $16, $0
/* 02265C 01DCE35C A001A527 */  addiu       $5, $29, 0x1A0
/* 022660 01DCE360 A000198E */  lw          $25, 0xA0($16)
/* 022664 01DCE364 2C00398F */  lw          $25, 0x2C($25)
/* 022668 01DCE368 09F82003 */  jalr        $25
/* 02266C 01DCE36C 00000000 */   nop
/* 022670 01DCE370 E501013C */  lui         $1, %hi(PathDataBuffer + 0x8)
/* 022674 01DCE374 C80A20AC */  sw          $0, %lo(PathDataBuffer + 0x8)($1)
/* 022678 01DCE378 FFFF0224 */  addiu       $2, $0, -0x1
/* 02267C 01DCE37C C09B82AF */  sw          $2, -0x6440($28)
/* 022680 01DCE380 BC01A227 */  addiu       $2, $29, 0x1BC
/* 022684 01DCE384 A08A80C7 */  lwc1        $f0, -0x7560($28)
/* 022688 01DCE388 000040E4 */  swc1        $f0, 0x0($2)
/* 02268C 01DCE38C 28860070 */  paddub      $16, $0, $0
/* 022690 01DCE390 28000010 */  b           .L01DCE434_2D3C34
/* 022694 01DCE394 00000000 */   nop
.L01DCE398_2D3B98:
/* 022698 01DCE398 B0110224 */  addiu       $2, $0, 0x11B0
/* 02269C 01DCE39C 18880202 */  mult        $17, $16, $2
/* 0226A0 01DCE3A0 E501023C */  lui         $2, %hi(Cam)
/* 0226A4 01DCE3A4 F0C34224 */  addiu       $2, $2, %lo(Cam)
/* 0226A8 01DCE3A8 21205100 */  addu        $4, $2, $17
/* 0226AC 01DCE3AC 80101000 */  sll         $2, $16, 2
/* 0226B0 01DCE3B0 21105D00 */  addu        $2, $2, $29
/* 0226B4 01DCE3B4 948B858F */  lw          $5, -0x746C($28)
/* 0226B8 01DCE3B8 BC01468C */  lw          $6, 0x1BC($2)
/* 0226BC 01DCE3BC E501023C */  lui         $2, %hi(PathDataBuffer)
/* 0226C0 01DCE3C0 C00A4724 */  addiu       $7, $2, %lo(PathDataBuffer)
/* 0226C4 01DCE3C4 28460070 */  paddub      $8, $0, $0
/* 0226C8 01DCE3C8 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0226CC 01DCE3CC 00000000 */   nop
/* 0226D0 01DCE3D0 2041033C */  lui         $3, (0x41200000 >> 16)
/* 0226D4 01DCE3D4 E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 0226D8 01DCE3D8 E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 0226DC 01DCE3DC 21105100 */  addu        $2, $2, $17
/* 0226E0 01DCE3E0 000043AC */  sw          $3, 0x0($2)
/* 0226E4 01DCE3E4 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0226E8 01DCE3E8 E501023C */  lui         $2, %hi(Cam + 0x2F8)
/* 0226EC 01DCE3EC E8C64224 */  addiu       $2, $2, %lo(Cam + 0x2F8)
/* 0226F0 01DCE3F0 21105100 */  addu        $2, $2, $17
/* 0226F4 01DCE3F4 000043AC */  sw          $3, 0x0($2)
/* 0226F8 01DCE3F8 E501023C */  lui         $2, %hi(Cam + 0x304)
/* 0226FC 01DCE3FC F4C64224 */  addiu       $2, $2, %lo(Cam + 0x304)
/* 022700 01DCE400 21105100 */  addu        $2, $2, $17
/* 022704 01DCE404 000040AC */  sw          $0, 0x0($2)
/* 022708 01DCE408 E501023C */  lui         $2, %hi(Cam + 0x308)
/* 02270C 01DCE40C F8C64224 */  addiu       $2, $2, %lo(Cam + 0x308)
/* 022710 01DCE410 21105100 */  addu        $2, $2, $17
/* 022714 01DCE414 000040AC */  sw          $0, 0x0($2)
/* 022718 01DCE418 E301023C */  lui         $2, %hi(MainCamera__3)
/* 02271C 01DCE41C 80E64324 */  addiu       $3, $2, %lo(MainCamera__3)
/* 022720 01DCE420 E501023C */  lui         $2, %hi(Cam + 0x310)
/* 022724 01DCE424 00C74224 */  addiu       $2, $2, %lo(Cam + 0x310)
/* 022728 01DCE428 21105100 */  addu        $2, $2, $17
/* 02272C 01DCE42C 000043AC */  sw          $3, 0x0($2)
/* 022730 01DCE430 01001026 */  addiu       $16, $16, 0x1
.L01DCE434_2D3C34:
/* 022734 01DCE434 D8FF001A */  blez        $16, .L01DCE398_2D3B98
/* 022738 01DCE438 00000000 */   nop
/* 02273C 01DCE43C B89880AF */  sw          $0, -0x6748($28)
/* 022740 01DCE440 B49880AF */  sw          $0, -0x674C($28)
/* 022744 01DCE444 DE01023C */  lui         $2, %hi(LIT_1305)
/* 022748 01DCE448 F0064424 */  addiu       $4, $2, %lo(LIT_1305)
/* 02274C 01DCE44C 00C5760C */  jal         OPAnalyz__FPc
/* 022750 01DCE450 00000000 */   nop
/* 022754 01DCE454 4CCA760C */  jal         OPMdsLoad__Fv
/* 022758 01DCE458 00000000 */   nop
/* 02275C 01DCE45C 2000BF7B */  lq          $31, 0x20($29)
/* 022760 01DCE460 1000B17B */  lq          $17, 0x10($29)
/* 022764 01DCE464 0000B07B */  lq          $16, 0x0($29)
/* 022768 01DCE468 C001BD27 */  addiu       $29, $29, 0x1C0
/* 02276C 01DCE46C 0800E003 */  jr          $31
/* 022770 01DCE470 00000000 */   nop
/* 022774 01DCE474 00000000 */  nop
/* 022778 01DCE478 00000000 */  nop
/* 02277C 01DCE47C 00000000 */  nop
