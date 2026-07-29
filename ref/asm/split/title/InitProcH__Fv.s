.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitProcH__Fv
/* 0241F0 01DCFEF0 B0FDBD27 */  addiu       $29, $29, -0x250
/* 0241F4 01DCFEF4 2000BF7F */  sq          $31, 0x20($29)
/* 0241F8 01DCFEF8 1000B17F */  sq          $17, 0x10($29)
/* 0241FC 01DCFEFC 0000B07F */  sq          $16, 0x0($29)
/* 024200 01DCFF00 DE01023C */  lui         $2, %hi(LIT_1518__2)
/* 024204 01DCFF04 40B94524 */  addiu       $5, $2, %lo(LIT_1518__2)
/* 024208 01DCFF08 3000A427 */  addiu       $4, $29, 0x30
/* 02420C 01DCFF0C 09000324 */  addiu       $3, $0, 0x9
.L01DCFF10_2D5710:
/* 024210 01DCFF10 0000A278 */  lq          $2, 0x0($5)
/* 024214 01DCFF14 1000A524 */  addiu       $5, $5, 0x10
/* 024218 01DCFF18 FFFF6324 */  addiu       $3, $3, -0x1
/* 02421C 01DCFF1C 0000827C */  sq          $2, 0x0($4)
/* 024220 01DCFF20 10008424 */  addiu       $4, $4, 0x10
/* 024224 01DCFF24 FAFF601C */  bgtz        $3, .L01DCFF10_2D5710
/* 024228 01DCFF28 00000000 */   nop
/* 02422C 01DCFF2C 948B848F */  lw          $4, -0x746C($28)
/* 024230 01DCFF30 DE01023C */  lui         $2, %hi(LIT_937__5)
/* 024234 01DCFF34 10024524 */  addiu       $5, $2, %lo(LIT_937__5)
/* 024238 01DCFF38 28360070 */  paddub      $6, $0, $0
/* 02423C 01DCFF3C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 024240 01DCFF40 00000000 */   nop
/* 024244 01DCFF44 5400A2AF */  sw          $2, 0x54($29)
/* 024248 01DCFF48 948B848F */  lw          $4, -0x746C($28)
/* 02424C 01DCFF4C DE01023C */  lui         $2, %hi(LIT_1557__5)
/* 024250 01DCFF50 D8094524 */  addiu       $5, $2, %lo(LIT_1557__5)
/* 024254 01DCFF54 28360070 */  paddub      $6, $0, $0
/* 024258 01DCFF58 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 02425C 01DCFF5C 00000000 */   nop
/* 024260 01DCFF60 6000A2AF */  sw          $2, 0x60($29)
/* 024264 01DCFF64 948B848F */  lw          $4, -0x746C($28)
/* 024268 01DCFF68 DE01023C */  lui         $2, %hi(LIT_1558__3)
/* 02426C 01DCFF6C E8094524 */  addiu       $5, $2, %lo(LIT_1558__3)
/* 024270 01DCFF70 28360070 */  paddub      $6, $0, $0
/* 024274 01DCFF74 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 024278 01DCFF78 00000000 */   nop
/* 02427C 01DCFF7C 6C00A2AF */  sw          $2, 0x6C($29)
/* 024280 01DCFF80 948B848F */  lw          $4, -0x746C($28)
/* 024284 01DCFF84 DE01023C */  lui         $2, %hi(LIT_940__4)
/* 024288 01DCFF88 40024524 */  addiu       $5, $2, %lo(LIT_940__4)
/* 02428C 01DCFF8C 28360070 */  paddub      $6, $0, $0
/* 024290 01DCFF90 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 024294 01DCFF94 00000000 */   nop
/* 024298 01DCFF98 7800A2AF */  sw          $2, 0x78($29)
/* 02429C 01DCFF9C 948B848F */  lw          $4, -0x746C($28)
/* 0242A0 01DCFFA0 DE01023C */  lui         $2, %hi(LIT_939__2)
/* 0242A4 01DCFFA4 30024524 */  addiu       $5, $2, %lo(LIT_939__2)
/* 0242A8 01DCFFA8 28360070 */  paddub      $6, $0, $0
/* 0242AC 01DCFFAC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0242B0 01DCFFB0 00000000 */   nop
/* 0242B4 01DCFFB4 8400A2AF */  sw          $2, 0x84($29)
/* 0242B8 01DCFFB8 948B848F */  lw          $4, -0x746C($28)
/* 0242BC 01DCFFBC DE01023C */  lui         $2, %hi(LIT_1559__4)
/* 0242C0 01DCFFC0 F8094524 */  addiu       $5, $2, %lo(LIT_1559__4)
/* 0242C4 01DCFFC4 28360070 */  paddub      $6, $0, $0
/* 0242C8 01DCFFC8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0242CC 01DCFFCC 00000000 */   nop
/* 0242D0 01DCFFD0 9000A2AF */  sw          $2, 0x90($29)
/* 0242D4 01DCFFD4 948B848F */  lw          $4, -0x746C($28)
/* 0242D8 01DCFFD8 DE01023C */  lui         $2, %hi(LIT_1560__3)
/* 0242DC 01DCFFDC 080A4524 */  addiu       $5, $2, %lo(LIT_1560__3)
/* 0242E0 01DCFFE0 28360070 */  paddub      $6, $0, $0
/* 0242E4 01DCFFE4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0242E8 01DCFFE8 00000000 */   nop
/* 0242EC 01DCFFEC 9C00A2AF */  sw          $2, 0x9C($29)
/* 0242F0 01DCFFF0 948B848F */  lw          $4, -0x746C($28)
/* 0242F4 01DCFFF4 DE01023C */  lui         $2, %hi(LIT_1427)
/* 0242F8 01DCFFF8 58084524 */  addiu       $5, $2, %lo(LIT_1427)
/* 0242FC 01DCFFFC 28360070 */  paddub      $6, $0, $0
/* 024300 01DD0000 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 024304 01DD0004 00000000 */   nop
/* 024308 01DD0008 A800A2AF */  sw          $2, 0xA8($29)
/* 02430C 01DD000C C701023C */  lui         $2, %hi(TexManager)
/* 024310 01DD0010 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 024314 01DD0014 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 024318 01DD0018 F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 02431C 01DD001C 00000000 */   nop
/* 024320 01DD0020 C701023C */  lui         $2, %hi(TexManager)
/* 024324 01DD0024 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 024328 01DD0028 FFFF0524 */  addiu       $5, $0, -0x1
/* 02432C 01DD002C 3000A627 */  addiu       $6, $29, 0x30
/* 024330 01DD0030 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 024334 01DD0034 00000000 */   nop
/* 024338 01DD0038 01000224 */  addiu       $2, $0, 0x1
/* 02433C 01DD003C E401013C */  lui         $1, %hi(CharaTex)
/* 024340 01DD0040 10D022A0 */  sb          $2, %lo(CharaTex)($1)
/* 024344 01DD0044 02000224 */  addiu       $2, $0, 0x2
/* 024348 01DD0048 E401013C */  lui         $1, %hi(CharaTex + 0x1)
/* 02434C 01DD004C 11D022A0 */  sb          $2, %lo(CharaTex + 0x1)($1)
/* 024350 01DD0050 03000224 */  addiu       $2, $0, 0x3
/* 024354 01DD0054 E401013C */  lui         $1, %hi(CharaTex + 0x2)
/* 024358 01DD0058 12D022A0 */  sb          $2, %lo(CharaTex + 0x2)($1)
/* 02435C 01DD005C 04000224 */  addiu       $2, $0, 0x4
/* 024360 01DD0060 E401013C */  lui         $1, %hi(CharaTex + 0x3)
/* 024364 01DD0064 13D022A0 */  sb          $2, %lo(CharaTex + 0x3)($1)
/* 024368 01DD0068 09000224 */  addiu       $2, $0, 0x9
/* 02436C 01DD006C E401013C */  lui         $1, %hi(CharaTex + 0x8)
/* 024370 01DD0070 18D022A0 */  sb          $2, %lo(CharaTex + 0x8)($1)
/* 024374 01DD0074 DF01023C */  lui         $2, %hi(Chara__3)
/* 024378 01DD0078 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 02437C 01DD007C 948B858F */  lw          $5, -0x746C($28)
/* 024380 01DD0080 DE01023C */  lui         $2, %hi(LIT_1561)
/* 024384 01DD0084 180A4624 */  addiu       $6, $2, %lo(LIT_1561)
/* 024388 01DD0088 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 02438C 01DD008C 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 024390 01DD0090 28460070 */  paddub      $8, $0, $0
/* 024394 01DD0094 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 024398 01DD0098 00000000 */   nop
/* 02439C 01DD009C C000A427 */  addiu       $4, $29, 0xC0
/* 0243A0 01DD00A0 509F040C */  jal         __ct__10CFrameAttrFv
/* 0243A4 01DD00A4 00000000 */   nop
/* 0243A8 01DD00A8 C800B027 */  addiu       $16, $29, 0xC8
/* 0243AC 01DD00AC 000000A2 */  sb          $0, 0x0($16)
/* 0243B0 01DD00B0 DF01013C */  lui         $1, %hi(Chara__3 + 0xBC)
/* 0243B4 01DD00B4 9CFF248C */  lw          $4, %lo(Chara__3 + 0xBC)($1)
/* 0243B8 01DD00B8 C000A527 */  addiu       $5, $29, 0xC0
/* 0243BC 01DD00BC 01000624 */  addiu       $6, $0, 0x1
/* 0243C0 01DD00C0 04000724 */  addiu       $7, $0, 0x4
/* 0243C4 01DD00C4 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0243C8 01DD00C8 00000000 */   nop
/* 0243CC 01DD00CC 2041023C */  lui         $2, (0x41200000 >> 16)
/* 0243D0 01DD00D0 DF01013C */  lui         $1, %hi(Chara__3 + 0x2F0)
/* 0243D4 01DD00D4 D00122AC */  sw          $2, %lo(Chara__3 + 0x2F0)($1)
/* 0243D8 01DD00D8 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 0243DC 01DD00DC DF01013C */  lui         $1, %hi(Chara__3 + 0x2F8)
/* 0243E0 01DD00E0 D80120E4 */  swc1        $f0, %lo(Chara__3 + 0x2F8)($1)
/* 0243E4 01DD00E4 DF01013C */  lui         $1, %hi(Chara__3 + 0x304)
/* 0243E8 01DD00E8 E40120AC */  sw          $0, %lo(Chara__3 + 0x304)($1)
/* 0243EC 01DD00EC DF01013C */  lui         $1, %hi(Chara__3 + 0x308)
/* 0243F0 01DD00F0 E80120AC */  sw          $0, %lo(Chara__3 + 0x308)($1)
/* 0243F4 01DD00F4 DF01023C */  lui         $2, %hi(Chara__3)
/* 0243F8 01DD00F8 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 0243FC 01DD00FC 282E0070 */  paddub      $5, $0, $0
/* 024400 01DD0100 88E0040C */  jal         FootSoundEnable__10CCharacterFi
/* 024404 01DD0104 00000000 */   nop
/* 024408 01DD0108 DF01023C */  lui         $2, %hi(Chara__3 + 0x11B0)
/* 02440C 01DD010C 90104424 */  addiu       $4, $2, %lo(Chara__3 + 0x11B0)
/* 024410 01DD0110 948B858F */  lw          $5, -0x746C($28)
/* 024414 01DD0114 DE01023C */  lui         $2, %hi(LIT_1081__2)
/* 024418 01DD0118 08044624 */  addiu       $6, $2, %lo(LIT_1081__2)
/* 02441C 01DD011C E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 024420 01DD0120 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 024424 01DD0124 28460070 */  paddub      $8, $0, $0
/* 024428 01DD0128 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 02442C 01DD012C 00000000 */   nop
/* 024430 01DD0130 000000A2 */  sb          $0, 0x0($16)
/* 024434 01DD0134 DF01013C */  lui         $1, %hi(Chara__3 + 0x126C)
/* 024438 01DD0138 4C11248C */  lw          $4, %lo(Chara__3 + 0x126C)($1)
/* 02443C 01DD013C C000A527 */  addiu       $5, $29, 0xC0
/* 024440 01DD0140 01000624 */  addiu       $6, $0, 0x1
/* 024444 01DD0144 04000724 */  addiu       $7, $0, 0x4
/* 024448 01DD0148 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 02444C 01DD014C 00000000 */   nop
/* 024450 01DD0150 8C42023C */  lui         $2, (0x428C0000 >> 16)
/* 024454 01DD0154 DF01013C */  lui         $1, %hi(Chara__3 + 0x14A0)
/* 024458 01DD0158 801322AC */  sw          $2, %lo(Chara__3 + 0x14A0)($1)
/* 02445C 01DD015C 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 024460 01DD0160 DF01013C */  lui         $1, %hi(Chara__3 + 0x14A8)
/* 024464 01DD0164 881320E4 */  swc1        $f0, %lo(Chara__3 + 0x14A8)($1)
/* 024468 01DD0168 DF01013C */  lui         $1, %hi(Chara__3 + 0x14B4)
/* 02446C 01DD016C 941320AC */  sw          $0, %lo(Chara__3 + 0x14B4)($1)
/* 024470 01DD0170 DF01013C */  lui         $1, %hi(Chara__3 + 0x14B8)
/* 024474 01DD0174 981320AC */  sw          $0, %lo(Chara__3 + 0x14B8)($1)
/* 024478 01DD0178 DF01023C */  lui         $2, %hi(Chara__3 + 0x2360)
/* 02447C 01DD017C 40224424 */  addiu       $4, $2, %lo(Chara__3 + 0x2360)
/* 024480 01DD0180 948B858F */  lw          $5, -0x746C($28)
/* 024484 01DD0184 DE01023C */  lui         $2, %hi(LIT_1562)
/* 024488 01DD0188 280A4624 */  addiu       $6, $2, %lo(LIT_1562)
/* 02448C 01DD018C E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 024490 01DD0190 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 024494 01DD0194 28460070 */  paddub      $8, $0, $0
/* 024498 01DD0198 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 02449C 01DD019C 00000000 */   nop
/* 0244A0 01DD01A0 000000A2 */  sb          $0, 0x0($16)
/* 0244A4 01DD01A4 DF01013C */  lui         $1, %hi(Chara__3 + 0x241C)
/* 0244A8 01DD01A8 FC22248C */  lw          $4, %lo(Chara__3 + 0x241C)($1)
/* 0244AC 01DD01AC C000A527 */  addiu       $5, $29, 0xC0
/* 0244B0 01DD01B0 01000624 */  addiu       $6, $0, 0x1
/* 0244B4 01DD01B4 04000724 */  addiu       $7, $0, 0x4
/* 0244B8 01DD01B8 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0244BC 01DD01BC 00000000 */   nop
/* 0244C0 01DD01C0 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 0244C4 01DD01C4 DF01013C */  lui         $1, %hi(Chara__3 + 0x2650)
/* 0244C8 01DD01C8 302522AC */  sw          $2, %lo(Chara__3 + 0x2650)($1)
/* 0244CC 01DD01CC 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 0244D0 01DD01D0 DF01013C */  lui         $1, %hi(Chara__3 + 0x2658)
/* 0244D4 01DD01D4 382520E4 */  swc1        $f0, %lo(Chara__3 + 0x2658)($1)
/* 0244D8 01DD01D8 DF01013C */  lui         $1, %hi(Chara__3 + 0x2664)
/* 0244DC 01DD01DC 442520AC */  sw          $0, %lo(Chara__3 + 0x2664)($1)
/* 0244E0 01DD01E0 DF01013C */  lui         $1, %hi(Chara__3 + 0x2668)
/* 0244E4 01DD01E4 482520AC */  sw          $0, %lo(Chara__3 + 0x2668)($1)
/* 0244E8 01DD01E8 DF01023C */  lui         $2, %hi(Chara__3 + 0x3510)
/* 0244EC 01DD01EC F0334424 */  addiu       $4, $2, %lo(Chara__3 + 0x3510)
/* 0244F0 01DD01F0 948B858F */  lw          $5, -0x746C($28)
/* 0244F4 01DD01F4 DE01023C */  lui         $2, %hi(LIT_1563__2)
/* 0244F8 01DD01F8 380A4624 */  addiu       $6, $2, %lo(LIT_1563__2)
/* 0244FC 01DD01FC E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 024500 01DD0200 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 024504 01DD0204 28460070 */  paddub      $8, $0, $0
/* 024508 01DD0208 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 02450C 01DD020C 00000000 */   nop
/* 024510 01DD0210 000000A2 */  sb          $0, 0x0($16)
/* 024514 01DD0214 DF01013C */  lui         $1, %hi(Chara__3 + 0x35CC)
/* 024518 01DD0218 AC34248C */  lw          $4, %lo(Chara__3 + 0x35CC)($1)
/* 02451C 01DD021C C000A527 */  addiu       $5, $29, 0xC0
/* 024520 01DD0220 01000624 */  addiu       $6, $0, 0x1
/* 024524 01DD0224 04000724 */  addiu       $7, $0, 0x4
/* 024528 01DD0228 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 02452C 01DD022C 00000000 */   nop
/* 024530 01DD0230 0040023C */  lui         $2, (0x40000000 >> 16)
/* 024534 01DD0234 DF01013C */  lui         $1, %hi(DngEventMan + 0x30)
/* 024538 01DD0238 E03622AC */  sw          $2, %lo(DngEventMan + 0x30)($1)
/* 02453C 01DD023C 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 024540 01DD0240 DF01013C */  lui         $1, %hi(DngEventMan + 0x38)
/* 024544 01DD0244 E83620E4 */  swc1        $f0, %lo(DngEventMan + 0x38)($1)
/* 024548 01DD0248 DF01013C */  lui         $1, %hi(DngEventMan + 0x44)
/* 02454C 01DD024C F43620AC */  sw          $0, %lo(DngEventMan + 0x44)($1)
/* 024550 01DD0250 DF01013C */  lui         $1, %hi(DngEventMan + 0x48)
/* 024554 01DD0254 F83620AC */  sw          $0, %lo(DngEventMan + 0x48)($1)
/* 024558 01DD0258 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x490)
/* 02455C 01DD025C 608C4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x490)
/* 024560 01DD0260 948B858F */  lw          $5, -0x746C($28)
/* 024564 01DD0264 DE01023C */  lui         $2, %hi(LIT_1428)
/* 024568 01DD0268 68084624 */  addiu       $6, $2, %lo(LIT_1428)
/* 02456C 01DD026C E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 024570 01DD0270 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 024574 01DD0274 28460070 */  paddub      $8, $0, $0
/* 024578 01DD0278 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 02457C 01DD027C 00000000 */   nop
/* 024580 01DD0280 E401023C */  lui         $2, %hi(Wind__4)
/* 024584 01DD0284 C0CC4224 */  addiu       $2, $2, %lo(Wind__4)
/* 024588 01DD0288 DF01013C */  lui         $1, %hi(Chara__3 + 0x1E48)
/* 02458C 01DD028C 281D22AC */  sw          $2, %lo(Chara__3 + 0x1E48)($1)
/* 024590 01DD0290 B89880AF */  sw          $0, -0x6748($28)
/* 024594 01DD0294 B49880AF */  sw          $0, -0x674C($28)
/* 024598 01DD0298 DF01013C */  lui         $1, %hi(MapDataBuffer + 0x8)
/* 02459C 01DD029C B8FE20AC */  sw          $0, %lo(MapDataBuffer + 0x8)($1)
/* 0245A0 01DD02A0 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 0245A4 01DD02A4 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 0245A8 01DD02A8 A80E050C */  jal         Initialize__4CMapFv
/* 0245AC 01DD02AC 00000000 */   nop
/* 0245B0 01DD02B0 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 0245B4 01DD02B4 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 0245B8 01DD02B8 A80E050C */  jal         Initialize__4CMapFv
/* 0245BC 01DD02BC 00000000 */   nop
/* 0245C0 01DD02C0 E201023C */  lui         $2, %hi(OP_BuildingMap2)
/* 0245C4 01DD02C4 40AF4424 */  addiu       $4, $2, %lo(OP_BuildingMap2)
/* 0245C8 01DD02C8 A80E050C */  jal         Initialize__4CMapFv
/* 0245CC 01DD02CC 00000000 */   nop
/* 0245D0 01DD02D0 2001A427 */  addiu       $4, $29, 0x120
/* 0245D4 01DD02D4 509F040C */  jal         __ct__10CFrameAttrFv
/* 0245D8 01DD02D8 00000000 */   nop
/* 0245DC 01DD02DC 948B848F */  lw          $4, -0x746C($28)
/* 0245E0 01DD02E0 DE01023C */  lui         $2, %hi(LIT_1564)
/* 0245E4 01DD02E4 480A4524 */  addiu       $5, $2, %lo(LIT_1564)
/* 0245E8 01DD02E8 28360070 */  paddub      $6, $0, $0
/* 0245EC 01DD02EC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0245F0 01DD02F0 00000000 */   nop
/* 0245F4 01DD02F4 28264070 */  paddub      $4, $2, $0
/* 0245F8 01DD02F8 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0245FC 01DD02FC B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 024600 01DD0300 02000624 */  addiu       $6, $0, 0x2
/* 024604 01DD0304 283E0070 */  paddub      $7, $0, $0
/* 024608 01DD0308 28460070 */  paddub      $8, $0, $0
/* 02460C 01DD030C AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 024610 01DD0310 00000000 */   nop
/* 024614 01DD0314 28864070 */  paddub      $16, $2, $0
/* 024618 01DD0318 01000624 */  addiu       $6, $0, 0x1
/* 02461C 01DD031C 2C01B127 */  addiu       $17, $29, 0x12C
/* 024620 01DD0320 000026A2 */  sb          $6, 0x0($17)
/* 024624 01DD0324 28260072 */  paddub      $4, $16, $0
/* 024628 01DD0328 2001A527 */  addiu       $5, $29, 0x120
/* 02462C 01DD032C 40000724 */  addiu       $7, $0, 0x40
/* 024630 01DD0330 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 024634 01DD0334 00000000 */   nop
/* 024638 01DD0338 28260072 */  paddub      $4, $16, $0
/* 02463C 01DD033C 01000524 */  addiu       $5, $0, 0x1
/* 024640 01DD0340 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 024644 01DD0344 00000000 */   nop
/* 024648 01DD0348 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 02464C 01DD034C 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 024650 01DD0350 282E0072 */  paddub      $5, $16, $0
/* 024654 01DD0354 28360070 */  paddub      $6, $0, $0
/* 024658 01DD0358 283E0070 */  paddub      $7, $0, $0
/* 02465C 01DD035C 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 024660 01DD0360 00000000 */   nop
/* 024664 01DD0364 28864070 */  paddub      $16, $2, $0
/* 024668 01DD0368 8001A0AF */  sw          $0, 0x180($29)
/* 02466C 01DD036C 8401A0AF */  sw          $0, 0x184($29)
/* 024670 01DD0370 8801A0AF */  sw          $0, 0x188($29)
/* 024674 01DD0374 28260072 */  paddub      $4, $16, $0
/* 024678 01DD0378 8001A527 */  addiu       $5, $29, 0x180
/* 02467C 01DD037C A000598C */  lw          $25, 0xA0($2)
/* 024680 01DD0380 1000398F */  lw          $25, 0x10($25)
/* 024684 01DD0384 09F82003 */  jalr        $25
/* 024688 01DD0388 00000000 */   nop
/* 02468C 01DD038C 9001A0AF */  sw          $0, 0x190($29)
/* 024690 01DD0390 9401A0AF */  sw          $0, 0x194($29)
/* 024694 01DD0394 9801A0AF */  sw          $0, 0x198($29)
/* 024698 01DD0398 28260072 */  paddub      $4, $16, $0
/* 02469C 01DD039C 9001A527 */  addiu       $5, $29, 0x190
/* 0246A0 01DD03A0 A000198E */  lw          $25, 0xA0($16)
/* 0246A4 01DD03A4 2C00398F */  lw          $25, 0x2C($25)
/* 0246A8 01DD03A8 09F82003 */  jalr        $25
/* 0246AC 01DD03AC 00000000 */   nop
/* 0246B0 01DD03B0 948B848F */  lw          $4, -0x746C($28)
/* 0246B4 01DD03B4 DE01023C */  lui         $2, %hi(LIT_1565)
/* 0246B8 01DD03B8 580A4524 */  addiu       $5, $2, %lo(LIT_1565)
/* 0246BC 01DD03BC 28360070 */  paddub      $6, $0, $0
/* 0246C0 01DD03C0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0246C4 01DD03C4 00000000 */   nop
/* 0246C8 01DD03C8 28264070 */  paddub      $4, $2, $0
/* 0246CC 01DD03CC DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0246D0 01DD03D0 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 0246D4 01DD03D4 02000624 */  addiu       $6, $0, 0x2
/* 0246D8 01DD03D8 283E0070 */  paddub      $7, $0, $0
/* 0246DC 01DD03DC 28460070 */  paddub      $8, $0, $0
/* 0246E0 01DD03E0 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0246E4 01DD03E4 00000000 */   nop
/* 0246E8 01DD03E8 28864070 */  paddub      $16, $2, $0
/* 0246EC 01DD03EC 01000624 */  addiu       $6, $0, 0x1
/* 0246F0 01DD03F0 000026A2 */  sb          $6, 0x0($17)
/* 0246F4 01DD03F4 28260072 */  paddub      $4, $16, $0
/* 0246F8 01DD03F8 2001A527 */  addiu       $5, $29, 0x120
/* 0246FC 01DD03FC 40000724 */  addiu       $7, $0, 0x40
/* 024700 01DD0400 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 024704 01DD0404 00000000 */   nop
/* 024708 01DD0408 28260072 */  paddub      $4, $16, $0
/* 02470C 01DD040C 01000524 */  addiu       $5, $0, 0x1
/* 024710 01DD0410 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 024714 01DD0414 00000000 */   nop
/* 024718 01DD0418 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 02471C 01DD041C 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 024720 01DD0420 282E0070 */  paddub      $5, $0, $0
/* 024724 01DD0424 28360072 */  paddub      $6, $16, $0
/* 024728 01DD0428 283E0070 */  paddub      $7, $0, $0
/* 02472C 01DD042C 28460070 */  paddub      $8, $0, $0
/* 024730 01DD0430 1C0E050C */  jal         SetObject__4CMapFiP9CFrameVu1ii
/* 024734 01DD0434 00000000 */   nop
/* 024738 01DD0438 28864070 */  paddub      $16, $2, $0
/* 02473C 01DD043C A001A0AF */  sw          $0, 0x1A0($29)
/* 024740 01DD0440 A401A0AF */  sw          $0, 0x1A4($29)
/* 024744 01DD0444 A801A0AF */  sw          $0, 0x1A8($29)
/* 024748 01DD0448 28260072 */  paddub      $4, $16, $0
/* 02474C 01DD044C A001A527 */  addiu       $5, $29, 0x1A0
/* 024750 01DD0450 A000598C */  lw          $25, 0xA0($2)
/* 024754 01DD0454 1000398F */  lw          $25, 0x10($25)
/* 024758 01DD0458 09F82003 */  jalr        $25
/* 02475C 01DD045C 00000000 */   nop
/* 024760 01DD0460 B001A0AF */  sw          $0, 0x1B0($29)
/* 024764 01DD0464 B401A0AF */  sw          $0, 0x1B4($29)
/* 024768 01DD0468 B801A0AF */  sw          $0, 0x1B8($29)
/* 02476C 01DD046C 28260072 */  paddub      $4, $16, $0
/* 024770 01DD0470 B001A527 */  addiu       $5, $29, 0x1B0
/* 024774 01DD0474 A000198E */  lw          $25, 0xA0($16)
/* 024778 01DD0478 2C00398F */  lw          $25, 0x2C($25)
/* 02477C 01DD047C 09F82003 */  jalr        $25
/* 024780 01DD0480 00000000 */   nop
/* 024784 01DD0484 948B848F */  lw          $4, -0x746C($28)
/* 024788 01DD0488 DE01023C */  lui         $2, %hi(LIT_1566)
/* 02478C 01DD048C 680A4524 */  addiu       $5, $2, %lo(LIT_1566)
/* 024790 01DD0490 28360070 */  paddub      $6, $0, $0
/* 024794 01DD0494 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 024798 01DD0498 00000000 */   nop
/* 02479C 01DD049C 28264070 */  paddub      $4, $2, $0
/* 0247A0 01DD04A0 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0247A4 01DD04A4 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 0247A8 01DD04A8 02000624 */  addiu       $6, $0, 0x2
/* 0247AC 01DD04AC 283E0070 */  paddub      $7, $0, $0
/* 0247B0 01DD04B0 28460070 */  paddub      $8, $0, $0
/* 0247B4 01DD04B4 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0247B8 01DD04B8 00000000 */   nop
/* 0247BC 01DD04BC 28864070 */  paddub      $16, $2, $0
/* 0247C0 01DD04C0 01000624 */  addiu       $6, $0, 0x1
/* 0247C4 01DD04C4 000026A2 */  sb          $6, 0x0($17)
/* 0247C8 01DD04C8 28260072 */  paddub      $4, $16, $0
/* 0247CC 01DD04CC 2001A527 */  addiu       $5, $29, 0x120
/* 0247D0 01DD04D0 40000724 */  addiu       $7, $0, 0x40
/* 0247D4 01DD04D4 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0247D8 01DD04D8 00000000 */   nop
/* 0247DC 01DD04DC 28260072 */  paddub      $4, $16, $0
/* 0247E0 01DD04E0 01000524 */  addiu       $5, $0, 0x1
/* 0247E4 01DD04E4 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 0247E8 01DD04E8 00000000 */   nop
/* 0247EC 01DD04EC E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 0247F0 01DD04F0 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 0247F4 01DD04F4 01000524 */  addiu       $5, $0, 0x1
/* 0247F8 01DD04F8 28360072 */  paddub      $6, $16, $0
/* 0247FC 01DD04FC 283E0070 */  paddub      $7, $0, $0
/* 024800 01DD0500 28460070 */  paddub      $8, $0, $0
/* 024804 01DD0504 1C0E050C */  jal         SetObject__4CMapFiP9CFrameVu1ii
/* 024808 01DD0508 00000000 */   nop
/* 02480C 01DD050C 28864070 */  paddub      $16, $2, $0
/* 024810 01DD0510 C001A0AF */  sw          $0, 0x1C0($29)
/* 024814 01DD0514 C401A0AF */  sw          $0, 0x1C4($29)
/* 024818 01DD0518 C801A0AF */  sw          $0, 0x1C8($29)
/* 02481C 01DD051C 28260072 */  paddub      $4, $16, $0
/* 024820 01DD0520 C001A527 */  addiu       $5, $29, 0x1C0
/* 024824 01DD0524 A000598C */  lw          $25, 0xA0($2)
/* 024828 01DD0528 1000398F */  lw          $25, 0x10($25)
/* 02482C 01DD052C 09F82003 */  jalr        $25
/* 024830 01DD0530 00000000 */   nop
/* 024834 01DD0534 D001A0AF */  sw          $0, 0x1D0($29)
/* 024838 01DD0538 D401A0AF */  sw          $0, 0x1D4($29)
/* 02483C 01DD053C D801A0AF */  sw          $0, 0x1D8($29)
/* 024840 01DD0540 28260072 */  paddub      $4, $16, $0
/* 024844 01DD0544 D001A527 */  addiu       $5, $29, 0x1D0
/* 024848 01DD0548 A000198E */  lw          $25, 0xA0($16)
/* 02484C 01DD054C 2C00398F */  lw          $25, 0x2C($25)
/* 024850 01DD0550 09F82003 */  jalr        $25
/* 024854 01DD0554 00000000 */   nop
/* 024858 01DD0558 948B848F */  lw          $4, -0x746C($28)
/* 02485C 01DD055C DE01023C */  lui         $2, %hi(LIT_1567)
/* 024860 01DD0560 780A4524 */  addiu       $5, $2, %lo(LIT_1567)
/* 024864 01DD0564 28360070 */  paddub      $6, $0, $0
/* 024868 01DD0568 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 02486C 01DD056C 00000000 */   nop
/* 024870 01DD0570 28264070 */  paddub      $4, $2, $0
/* 024874 01DD0574 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 024878 01DD0578 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 02487C 01DD057C 02000624 */  addiu       $6, $0, 0x2
/* 024880 01DD0580 283E0070 */  paddub      $7, $0, $0
/* 024884 01DD0584 28460070 */  paddub      $8, $0, $0
/* 024888 01DD0588 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 02488C 01DD058C 00000000 */   nop
/* 024890 01DD0590 28864070 */  paddub      $16, $2, $0
/* 024894 01DD0594 01000624 */  addiu       $6, $0, 0x1
/* 024898 01DD0598 000026A2 */  sb          $6, 0x0($17)
/* 02489C 01DD059C 28260072 */  paddub      $4, $16, $0
/* 0248A0 01DD05A0 2001A527 */  addiu       $5, $29, 0x120
/* 0248A4 01DD05A4 40000724 */  addiu       $7, $0, 0x40
/* 0248A8 01DD05A8 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0248AC 01DD05AC 00000000 */   nop
/* 0248B0 01DD05B0 28260072 */  paddub      $4, $16, $0
/* 0248B4 01DD05B4 01000524 */  addiu       $5, $0, 0x1
/* 0248B8 01DD05B8 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 0248BC 01DD05BC 00000000 */   nop
/* 0248C0 01DD05C0 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 0248C4 01DD05C4 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 0248C8 01DD05C8 02000524 */  addiu       $5, $0, 0x2
/* 0248CC 01DD05CC 28360072 */  paddub      $6, $16, $0
/* 0248D0 01DD05D0 283E0070 */  paddub      $7, $0, $0
/* 0248D4 01DD05D4 28460070 */  paddub      $8, $0, $0
/* 0248D8 01DD05D8 1C0E050C */  jal         SetObject__4CMapFiP9CFrameVu1ii
/* 0248DC 01DD05DC 00000000 */   nop
/* 0248E0 01DD05E0 28864070 */  paddub      $16, $2, $0
/* 0248E4 01DD05E4 E001A0AF */  sw          $0, 0x1E0($29)
/* 0248E8 01DD05E8 E401A0AF */  sw          $0, 0x1E4($29)
/* 0248EC 01DD05EC E801A0AF */  sw          $0, 0x1E8($29)
/* 0248F0 01DD05F0 28260072 */  paddub      $4, $16, $0
/* 0248F4 01DD05F4 E001A527 */  addiu       $5, $29, 0x1E0
/* 0248F8 01DD05F8 A000598C */  lw          $25, 0xA0($2)
/* 0248FC 01DD05FC 1000398F */  lw          $25, 0x10($25)
/* 024900 01DD0600 09F82003 */  jalr        $25
/* 024904 01DD0604 00000000 */   nop
/* 024908 01DD0608 F001A0AF */  sw          $0, 0x1F0($29)
/* 02490C 01DD060C F401A0AF */  sw          $0, 0x1F4($29)
/* 024910 01DD0610 F801A0AF */  sw          $0, 0x1F8($29)
/* 024914 01DD0614 28260072 */  paddub      $4, $16, $0
/* 024918 01DD0618 F001A527 */  addiu       $5, $29, 0x1F0
/* 02491C 01DD061C A000198E */  lw          $25, 0xA0($16)
/* 024920 01DD0620 2C00398F */  lw          $25, 0x2C($25)
/* 024924 01DD0624 09F82003 */  jalr        $25
/* 024928 01DD0628 00000000 */   nop
/* 02492C 01DD062C 948B848F */  lw          $4, -0x746C($28)
/* 024930 01DD0630 DE01023C */  lui         $2, %hi(LIT_1568)
/* 024934 01DD0634 880A4524 */  addiu       $5, $2, %lo(LIT_1568)
/* 024938 01DD0638 28360070 */  paddub      $6, $0, $0
/* 02493C 01DD063C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 024940 01DD0640 00000000 */   nop
/* 024944 01DD0644 28264070 */  paddub      $4, $2, $0
/* 024948 01DD0648 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 02494C 01DD064C B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 024950 01DD0650 02000624 */  addiu       $6, $0, 0x2
/* 024954 01DD0654 283E0070 */  paddub      $7, $0, $0
/* 024958 01DD0658 28460070 */  paddub      $8, $0, $0
/* 02495C 01DD065C AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 024960 01DD0660 00000000 */   nop
/* 024964 01DD0664 28864070 */  paddub      $16, $2, $0
/* 024968 01DD0668 01000624 */  addiu       $6, $0, 0x1
/* 02496C 01DD066C 000026A2 */  sb          $6, 0x0($17)
/* 024970 01DD0670 28260072 */  paddub      $4, $16, $0
/* 024974 01DD0674 2001A527 */  addiu       $5, $29, 0x120
/* 024978 01DD0678 40000724 */  addiu       $7, $0, 0x40
/* 02497C 01DD067C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 024980 01DD0680 00000000 */   nop
/* 024984 01DD0684 28260072 */  paddub      $4, $16, $0
/* 024988 01DD0688 01000524 */  addiu       $5, $0, 0x1
/* 02498C 01DD068C BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 024990 01DD0690 00000000 */   nop
/* 024994 01DD0694 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 024998 01DD0698 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 02499C 01DD069C 03000524 */  addiu       $5, $0, 0x3
/* 0249A0 01DD06A0 28360072 */  paddub      $6, $16, $0
/* 0249A4 01DD06A4 283E0070 */  paddub      $7, $0, $0
/* 0249A8 01DD06A8 28460070 */  paddub      $8, $0, $0
/* 0249AC 01DD06AC 1C0E050C */  jal         SetObject__4CMapFiP9CFrameVu1ii
/* 0249B0 01DD06B0 00000000 */   nop
/* 0249B4 01DD06B4 28864070 */  paddub      $16, $2, $0
/* 0249B8 01DD06B8 0002A0AF */  sw          $0, 0x200($29)
/* 0249BC 01DD06BC 0402A0AF */  sw          $0, 0x204($29)
/* 0249C0 01DD06C0 0802A0AF */  sw          $0, 0x208($29)
/* 0249C4 01DD06C4 28260072 */  paddub      $4, $16, $0
/* 0249C8 01DD06C8 0002A527 */  addiu       $5, $29, 0x200
/* 0249CC 01DD06CC A000598C */  lw          $25, 0xA0($2)
/* 0249D0 01DD06D0 1000398F */  lw          $25, 0x10($25)
/* 0249D4 01DD06D4 09F82003 */  jalr        $25
/* 0249D8 01DD06D8 00000000 */   nop
/* 0249DC 01DD06DC 1002A0AF */  sw          $0, 0x210($29)
/* 0249E0 01DD06E0 1402A0AF */  sw          $0, 0x214($29)
/* 0249E4 01DD06E4 1802A0AF */  sw          $0, 0x218($29)
/* 0249E8 01DD06E8 28260072 */  paddub      $4, $16, $0
/* 0249EC 01DD06EC 1002A527 */  addiu       $5, $29, 0x210
/* 0249F0 01DD06F0 A000198E */  lw          $25, 0xA0($16)
/* 0249F4 01DD06F4 2C00398F */  lw          $25, 0x2C($25)
/* 0249F8 01DD06F8 09F82003 */  jalr        $25
/* 0249FC 01DD06FC 00000000 */   nop
/* 024A00 01DD0700 948B848F */  lw          $4, -0x746C($28)
/* 024A04 01DD0704 DE01023C */  lui         $2, %hi(LIT_1569)
/* 024A08 01DD0708 980A4524 */  addiu       $5, $2, %lo(LIT_1569)
/* 024A0C 01DD070C 28360070 */  paddub      $6, $0, $0
/* 024A10 01DD0710 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 024A14 01DD0714 00000000 */   nop
/* 024A18 01DD0718 28264070 */  paddub      $4, $2, $0
/* 024A1C 01DD071C DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 024A20 01DD0720 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 024A24 01DD0724 02000624 */  addiu       $6, $0, 0x2
/* 024A28 01DD0728 283E0070 */  paddub      $7, $0, $0
/* 024A2C 01DD072C 28460070 */  paddub      $8, $0, $0
/* 024A30 01DD0730 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 024A34 01DD0734 00000000 */   nop
/* 024A38 01DD0738 28864070 */  paddub      $16, $2, $0
/* 024A3C 01DD073C 01000624 */  addiu       $6, $0, 0x1
/* 024A40 01DD0740 000026A2 */  sb          $6, 0x0($17)
/* 024A44 01DD0744 28260072 */  paddub      $4, $16, $0
/* 024A48 01DD0748 2001A527 */  addiu       $5, $29, 0x120
/* 024A4C 01DD074C 40000724 */  addiu       $7, $0, 0x40
/* 024A50 01DD0750 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 024A54 01DD0754 00000000 */   nop
/* 024A58 01DD0758 28260072 */  paddub      $4, $16, $0
/* 024A5C 01DD075C 01000524 */  addiu       $5, $0, 0x1
/* 024A60 01DD0760 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 024A64 01DD0764 00000000 */   nop
/* 024A68 01DD0768 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 024A6C 01DD076C 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 024A70 01DD0770 04000524 */  addiu       $5, $0, 0x4
/* 024A74 01DD0774 28360072 */  paddub      $6, $16, $0
/* 024A78 01DD0778 283E0070 */  paddub      $7, $0, $0
/* 024A7C 01DD077C 28460070 */  paddub      $8, $0, $0
/* 024A80 01DD0780 1C0E050C */  jal         SetObject__4CMapFiP9CFrameVu1ii
/* 024A84 01DD0784 00000000 */   nop
/* 024A88 01DD0788 28864070 */  paddub      $16, $2, $0
/* 024A8C 01DD078C 2002A0AF */  sw          $0, 0x220($29)
/* 024A90 01DD0790 2402A0AF */  sw          $0, 0x224($29)
/* 024A94 01DD0794 2802A0AF */  sw          $0, 0x228($29)
/* 024A98 01DD0798 28260072 */  paddub      $4, $16, $0
/* 024A9C 01DD079C 2002A527 */  addiu       $5, $29, 0x220
/* 024AA0 01DD07A0 A000598C */  lw          $25, 0xA0($2)
/* 024AA4 01DD07A4 1000398F */  lw          $25, 0x10($25)
/* 024AA8 01DD07A8 09F82003 */  jalr        $25
/* 024AAC 01DD07AC 00000000 */   nop
/* 024AB0 01DD07B0 3002A0AF */  sw          $0, 0x230($29)
/* 024AB4 01DD07B4 3402A0AF */  sw          $0, 0x234($29)
/* 024AB8 01DD07B8 3802A0AF */  sw          $0, 0x238($29)
/* 024ABC 01DD07BC 28260072 */  paddub      $4, $16, $0
/* 024AC0 01DD07C0 3002A527 */  addiu       $5, $29, 0x230
/* 024AC4 01DD07C4 A000198E */  lw          $25, 0xA0($16)
/* 024AC8 01DD07C8 2C00398F */  lw          $25, 0x2C($25)
/* 024ACC 01DD07CC 09F82003 */  jalr        $25
/* 024AD0 01DD07D0 00000000 */   nop
/* 024AD4 01DD07D4 E501013C */  lui         $1, %hi(PathDataBuffer + 0x8)
/* 024AD8 01DD07D8 C80A20AC */  sw          $0, %lo(PathDataBuffer + 0x8)($1)
/* 024ADC 01DD07DC FFFF0224 */  addiu       $2, $0, -0x1
/* 024AE0 01DD07E0 C09B82AF */  sw          $2, -0x6440($28)
/* 024AE4 01DD07E4 4802A327 */  addiu       $3, $29, 0x248
/* 024AE8 01DD07E8 C88A82DF */  ld          $2, -0x7538($28)
/* 024AEC 01DD07EC 000062FC */  sd          $2, 0x0($3)
/* 024AF0 01DD07F0 28860070 */  paddub      $16, $0, $0
/* 024AF4 01DD07F4 27000010 */  b           .L01DD0894_2D6094
/* 024AF8 01DD07F8 00000000 */   nop
.L01DD07FC_2D5FFC:
/* 024AFC 01DD07FC B0110224 */  addiu       $2, $0, 0x11B0
/* 024B00 01DD0800 18880202 */  mult        $17, $16, $2
/* 024B04 01DD0804 E501023C */  lui         $2, %hi(Cam)
/* 024B08 01DD0808 F0C34224 */  addiu       $2, $2, %lo(Cam)
/* 024B0C 01DD080C 21205100 */  addu        $4, $2, $17
/* 024B10 01DD0810 80101000 */  sll         $2, $16, 2
/* 024B14 01DD0814 21105D00 */  addu        $2, $2, $29
/* 024B18 01DD0818 948B858F */  lw          $5, -0x746C($28)
/* 024B1C 01DD081C 4802468C */  lw          $6, 0x248($2)
/* 024B20 01DD0820 E501023C */  lui         $2, %hi(PathDataBuffer)
/* 024B24 01DD0824 C00A4724 */  addiu       $7, $2, %lo(PathDataBuffer)
/* 024B28 01DD0828 28460070 */  paddub      $8, $0, $0
/* 024B2C 01DD082C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 024B30 01DD0830 00000000 */   nop
/* 024B34 01DD0834 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 024B38 01DD0838 E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 024B3C 01DD083C E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 024B40 01DD0840 21105100 */  addu        $2, $2, $17
/* 024B44 01DD0844 000043AC */  sw          $3, 0x0($2)
/* 024B48 01DD0848 E501023C */  lui         $2, %hi(Cam + 0x2F8)
/* 024B4C 01DD084C E8C64224 */  addiu       $2, $2, %lo(Cam + 0x2F8)
/* 024B50 01DD0850 21105100 */  addu        $2, $2, $17
/* 024B54 01DD0854 000043AC */  sw          $3, 0x0($2)
/* 024B58 01DD0858 E501023C */  lui         $2, %hi(Cam + 0x304)
/* 024B5C 01DD085C F4C64224 */  addiu       $2, $2, %lo(Cam + 0x304)
/* 024B60 01DD0860 21105100 */  addu        $2, $2, $17
/* 024B64 01DD0864 000040AC */  sw          $0, 0x0($2)
/* 024B68 01DD0868 E501023C */  lui         $2, %hi(Cam + 0x308)
/* 024B6C 01DD086C F8C64224 */  addiu       $2, $2, %lo(Cam + 0x308)
/* 024B70 01DD0870 21105100 */  addu        $2, $2, $17
/* 024B74 01DD0874 000040AC */  sw          $0, 0x0($2)
/* 024B78 01DD0878 E301023C */  lui         $2, %hi(MainCamera__3)
/* 024B7C 01DD087C 80E64324 */  addiu       $3, $2, %lo(MainCamera__3)
/* 024B80 01DD0880 E501023C */  lui         $2, %hi(Cam + 0x310)
/* 024B84 01DD0884 00C74224 */  addiu       $2, $2, %lo(Cam + 0x310)
/* 024B88 01DD0888 21105100 */  addu        $2, $2, $17
/* 024B8C 01DD088C 000043AC */  sw          $3, 0x0($2)
/* 024B90 01DD0890 01001026 */  addiu       $16, $16, 0x1
.L01DD0894_2D6094:
/* 024B94 01DD0894 0200022A */  slti        $2, $16, 0x2
/* 024B98 01DD0898 D8FF4014 */  bnez        $2, .L01DD07FC_2D5FFC
/* 024B9C 01DD089C 00000000 */   nop
/* 024BA0 01DD08A0 B89880AF */  sw          $0, -0x6748($28)
/* 024BA4 01DD08A4 B49880AF */  sw          $0, -0x674C($28)
/* 024BA8 01DD08A8 DE01023C */  lui         $2, %hi(LIT_1570)
/* 024BAC 01DD08AC B00A4424 */  addiu       $4, $2, %lo(LIT_1570)
/* 024BB0 01DD08B0 00C5760C */  jal         OPAnalyz__FPc
/* 024BB4 01DD08B4 00000000 */   nop
/* 024BB8 01DD08B8 4CCA760C */  jal         OPMdsLoad__Fv
/* 024BBC 01DD08BC 00000000 */   nop
/* 024BC0 01DD08C0 2000BF7B */  lq          $31, 0x20($29)
/* 024BC4 01DD08C4 1000B17B */  lq          $17, 0x10($29)
/* 024BC8 01DD08C8 0000B07B */  lq          $16, 0x0($29)
/* 024BCC 01DD08CC 5002BD27 */  addiu       $29, $29, 0x250
/* 024BD0 01DD08D0 0800E003 */  jr          $31
/* 024BD4 01DD08D4 00000000 */   nop
/* 024BD8 01DD08D8 00000000 */  nop
/* 024BDC 01DD08DC 00000000 */  nop
