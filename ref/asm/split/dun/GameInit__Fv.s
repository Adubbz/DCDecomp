.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GameInit__Fv
/* 0004C0 01DAC1C0 70FFBD27 */  addiu       $29, $29, -0x90
/* 0004C4 01DAC1C4 1000BF7F */  sq          $31, 0x10($29)
/* 0004C8 01DAC1C8 0000B07F */  sq          $16, 0x0($29)
/* 0004CC 01DAC1CC 849C80AF */  sw          $0, -0x637C($28)
/* 0004D0 01DAC1D0 D49D80AF */  sw          $0, -0x622C($28)
/* 0004D4 01DAC1D4 709D80AF */  sw          $0, -0x6290($28)
/* 0004D8 01DAC1D8 248D828F */  lw          $2, -0x72DC($28)
/* 0004DC 01DAC1DC A49D82AF */  sw          $2, -0x625C($28)
/* 0004E0 01DAC1E0 1C8D848F */  lw          $4, -0x72E4($28)
/* 0004E4 01DAC1E4 7860050C */  jal         GetDngStatus__9CSaveDataFv
/* 0004E8 01DAC1E8 00000000 */   nop
/* 0004EC 01DAC1EC 789C82AF */  sw          $2, -0x6388($28)
/* 0004F0 01DAC1F0 789C848F */  lw          $4, -0x6388($28)
/* 0004F4 01DAC1F4 78FB060C */  jal         Init__11CUserStatusFv
/* 0004F8 01DAC1F8 00000000 */   nop
/* 0004FC 01DAC1FC D501013C */  lui         $1, %hi(BtEventInfo + 0xB8)
/* 000500 01DAC200 F867238C */  lw          $3, %lo(BtEventInfo + 0xB8)($1)
/* 000504 01DAC204 01000224 */  addiu       $2, $0, 0x1
/* 000508 01DAC208 15006210 */  beq         $3, $2, .L01DAC260_2E7860
/* 00050C 01DAC20C 00000000 */   nop
/* 000510 01DAC210 789C858F */  lw          $5, -0x6388($28)
/* 000514 01DAC214 28260070 */  paddub      $4, $0, $0
/* 000518 01DAC218 0A000010 */  b           .L01DAC244_2E7844
/* 00051C 01DAC21C 00000000 */   nop
.L01DAC220_2E7820:
/* 000520 01DAC220 40100400 */  sll         $2, $4, 1
/* 000524 01DAC224 21184500 */  addu        $3, $2, $5
/* 000528 01DAC228 06006284 */  lh          $2, 0x6($3)
/* 00052C 01DAC22C 120062A4 */  sh          $2, 0x12($3)
/* 000530 01DAC230 80100400 */  sll         $2, $4, 2
/* 000534 01DAC234 21104500 */  addu        $2, $2, $5
/* 000538 01DAC238 C84240AC */  sw          $0, 0x42C8($2)
/* 00053C 01DAC23C E04260A4 */  sh          $0, 0x42E0($3)
/* 000540 01DAC240 01008424 */  addiu       $4, $4, 0x1
.L01DAC244_2E7844:
/* 000544 01DAC244 06008228 */  slti        $2, $4, 0x6
/* 000548 01DAC248 F5FF4014 */  bnez        $2, .L01DAC220_2E7820
/* 00054C 01DAC24C 00000000 */   nop
/* 000550 01DAC250 FFFF0224 */  addiu       $2, $0, -0x1
/* 000554 01DAC254 0100013C */  lui         $1, (0x10000 >> 16)
/* 000558 01DAC258 2108A100 */  addu        $1, $5, $1
/* 00055C 01DAC25C 108B22AC */  sw          $2, -0x74F0($1)
.L01DAC260_2E7860:
/* 000560 01DAC260 A49D828F */  lw          $2, -0x625C($28)
/* 000564 01DAC264 789C838F */  lw          $3, -0x6388($28)
/* 000568 01DAC268 000062A0 */  sb          $2, 0x0($3)
/* 00056C 01DAC26C E001023C */  lui         $2, %hi(main_light)
/* 000570 01DAC270 B0864424 */  addiu       $4, $2, %lo(main_light)
/* 000574 01DAC274 DC01023C */  lui         $2, %hi(ZeroMatrix)
/* 000578 01DAC278 60244524 */  addiu       $5, $2, %lo(ZeroMatrix)
/* 00057C 01DAC27C 1086040C */  jal         sceVu0CopyMatrix
/* 000580 01DAC280 00000000 */   nop
/* 000584 01DAC284 E001023C */  lui         $2, %hi(main_lightcolor)
/* 000588 01DAC288 F0864424 */  addiu       $4, $2, %lo(main_lightcolor)
/* 00058C 01DAC28C DC01023C */  lui         $2, %hi(def_lightcolor)
/* 000590 01DAC290 D0244524 */  addiu       $5, $2, %lo(def_lightcolor)
/* 000594 01DAC294 1086040C */  jal         sceVu0CopyMatrix
/* 000598 01DAC298 00000000 */   nop
/* 00059C 01DAC29C E001023C */  lui         $2, %hi(main_ambientlight)
/* 0005A0 01DAC2A0 30874424 */  addiu       $4, $2, %lo(main_ambientlight)
/* 0005A4 01DAC2A4 DC01023C */  lui         $2, %hi(def_ambientlight)
/* 0005A8 01DAC2A8 C0244524 */  addiu       $5, $2, %lo(def_ambientlight)
/* 0005AC 01DAC2AC 0C86040C */  jal         sceVu0CopyVector
/* 0005B0 01DAC2B0 00000000 */   nop
/* 0005B4 01DAC2B4 E001023C */  lui         $2, %hi(sub_light)
/* 0005B8 01DAC2B8 40874424 */  addiu       $4, $2, %lo(sub_light)
/* 0005BC 01DAC2BC DC01023C */  lui         $2, %hi(ZeroMatrix)
/* 0005C0 01DAC2C0 60244524 */  addiu       $5, $2, %lo(ZeroMatrix)
/* 0005C4 01DAC2C4 1086040C */  jal         sceVu0CopyMatrix
/* 0005C8 01DAC2C8 00000000 */   nop
/* 0005CC 01DAC2CC E001023C */  lui         $2, %hi(sub_lightcolor)
/* 0005D0 01DAC2D0 80874424 */  addiu       $4, $2, %lo(sub_lightcolor)
/* 0005D4 01DAC2D4 DC01023C */  lui         $2, %hi(def_lightcolor)
/* 0005D8 01DAC2D8 D0244524 */  addiu       $5, $2, %lo(def_lightcolor)
/* 0005DC 01DAC2DC 1086040C */  jal         sceVu0CopyMatrix
/* 0005E0 01DAC2E0 00000000 */   nop
/* 0005E4 01DAC2E4 E001023C */  lui         $2, %hi(sub_ambientlight)
/* 0005E8 01DAC2E8 C0874424 */  addiu       $4, $2, %lo(sub_ambientlight)
/* 0005EC 01DAC2EC DC01023C */  lui         $2, %hi(def_ambientlight)
/* 0005F0 01DAC2F0 C0244524 */  addiu       $5, $2, %lo(def_ambientlight)
/* 0005F4 01DAC2F4 0C86040C */  jal         sceVu0CopyVector
/* 0005F8 01DAC2F8 00000000 */   nop
/* 0005FC 01DAC2FC 6496040C */  jal         InitializeDataBuffer__Fv
/* 000600 01DAC300 00000000 */   nop
/* 000604 01DAC304 F001023C */  lui         $2, %hi(MainModelBuffer)
/* 000608 01DAC308 40664424 */  addiu       $4, $2, %lo(MainModelBuffer)
/* 00060C 01DAC30C 70940534 */  ori         $5, $0, 0x9470
/* 000610 01DAC310 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 000614 01DAC314 00000000 */   nop
/* 000618 01DAC318 2B00023C */  lui         $2, %hi(MotionData)
/* 00061C 01DAC31C 20B04424 */  addiu       $4, $2, %lo(MotionData)
/* 000620 01DAC320 10270524 */  addiu       $5, $0, 0x2710
/* 000624 01DAC324 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 000628 01DAC328 00000000 */   nop
/* 00062C 01DAC32C F001023C */  lui         $2, %hi(CharaModelBuffer)
/* 000630 01DAC330 60664424 */  addiu       $4, $2, %lo(CharaModelBuffer)
/* 000634 01DAC334 0300023C */  lui         $2, (0x33450 >> 16)
/* 000638 01DAC338 50344534 */  ori         $5, $2, (0x33450 & 0xFFFF)
/* 00063C 01DAC33C A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 000640 01DAC340 00000000 */   nop
/* 000644 01DAC344 F001023C */  lui         $2, %hi(MasekiModelBuffer)
/* 000648 01DAC348 90664424 */  addiu       $4, $2, %lo(MasekiModelBuffer)
/* 00064C 01DAC34C E8FD0534 */  ori         $5, $0, 0xFDE8
/* 000650 01DAC350 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 000654 01DAC354 00000000 */   nop
/* 000658 01DAC358 2B00023C */  lui         $2, %hi(TextureData)
/* 00065C 01DAC35C 30B04424 */  addiu       $4, $2, %lo(TextureData)
/* 000660 01DAC360 B0B30534 */  ori         $5, $0, 0xB3B0
/* 000664 01DAC364 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 000668 01DAC368 00000000 */   nop
/* 00066C 01DAC36C F001023C */  lui         $2, %hi(BtSystemScriptFileBuffer)
/* 000670 01DAC370 70684424 */  addiu       $4, $2, %lo(BtSystemScriptFileBuffer)
/* 000674 01DAC374 B8880534 */  ori         $5, $0, 0x88B8
/* 000678 01DAC378 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 00067C 01DAC37C 00000000 */   nop
/* 000680 01DAC380 F001023C */  lui         $2, %hi(BtMesBuffer)
/* 000684 01DAC384 A0664424 */  addiu       $4, $2, %lo(BtMesBuffer)
/* 000688 01DAC388 04290524 */  addiu       $5, $0, 0x2904
/* 00068C 01DAC38C A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 000690 01DAC390 00000000 */   nop
/* 000694 01DAC394 F001023C */  lui         $2, %hi(BtSteebMesBuffer)
/* 000698 01DAC398 B0664424 */  addiu       $4, $2, %lo(BtSteebMesBuffer)
/* 00069C 01DAC39C AC0D0524 */  addiu       $5, $0, 0xDAC
/* 0006A0 01DAC3A0 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 0006A4 01DAC3A4 00000000 */   nop
/* 0006A8 01DAC3A8 F001023C */  lui         $2, %hi(BtStartLogoBuffer)
/* 0006AC 01DAC3AC C0664424 */  addiu       $4, $2, %lo(BtStartLogoBuffer)
/* 0006B0 01DAC3B0 88130524 */  addiu       $5, $0, 0x1388
/* 0006B4 01DAC3B4 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 0006B8 01DAC3B8 00000000 */   nop
/* 0006BC 01DAC3BC F001023C */  lui         $2, %hi(BtScriptWorkBuffer)
/* 0006C0 01DAC3C0 40684424 */  addiu       $4, $2, %lo(BtScriptWorkBuffer)
/* 0006C4 01DAC3C4 0100023C */  lui         $2, (0x186A0 >> 16)
/* 0006C8 01DAC3C8 A0864534 */  ori         $5, $2, (0x186A0 & 0xFFFF)
/* 0006CC 01DAC3CC A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 0006D0 01DAC3D0 00000000 */   nop
/* 0006D4 01DAC3D4 28860070 */  paddub      $16, $0, $0
/* 0006D8 01DAC3D8 09000010 */  b           .L01DAC400_2E7A00
/* 0006DC 01DAC3DC 00000000 */   nop
.L01DAC3E0_2E79E0:
/* 0006E0 01DAC3E0 00191000 */  sll         $3, $16, 4
/* 0006E4 01DAC3E4 F001023C */  lui         $2, %hi(BtItemCashArea)
/* 0006E8 01DAC3E8 E0674224 */  addiu       $2, $2, %lo(BtItemCashArea)
/* 0006EC 01DAC3EC 21204300 */  addu        $4, $2, $3
/* 0006F0 01DAC3F0 C5090524 */  addiu       $5, $0, 0x9C5
/* 0006F4 01DAC3F4 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 0006F8 01DAC3F8 00000000 */   nop
/* 0006FC 01DAC3FC 01001026 */  addiu       $16, $16, 0x1
.L01DAC400_2E7A00:
/* 000700 01DAC400 0600022A */  slti        $2, $16, 0x6
/* 000704 01DAC404 F6FF4014 */  bnez        $2, .L01DAC3E0_2E79E0
/* 000708 01DAC408 00000000 */   nop
/* 00070C 01DAC40C 28860070 */  paddub      $16, $0, $0
/* 000710 01DAC410 09000010 */  b           .L01DAC438_2E7A38
/* 000714 01DAC414 00000000 */   nop
.L01DAC418_2E7A18:
/* 000718 01DAC418 00191000 */  sll         $3, $16, 4
/* 00071C 01DAC41C F001023C */  lui         $2, %hi(MonstorScriptBuffer)
/* 000720 01DAC420 E0664224 */  addiu       $2, $2, %lo(MonstorScriptBuffer)
/* 000724 01DAC424 21204300 */  addu        $4, $2, $3
/* 000728 01DAC428 53070524 */  addiu       $5, $0, 0x753
/* 00072C 01DAC42C A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 000730 01DAC430 00000000 */   nop
/* 000734 01DAC434 01001026 */  addiu       $16, $16, 0x1
.L01DAC438_2E7A38:
/* 000738 01DAC438 1000022A */  slti        $2, $16, 0x10
/* 00073C 01DAC43C F6FF4014 */  bnez        $2, .L01DAC418_2E7A18
/* 000740 01DAC440 00000000 */   nop
/* 000744 01DAC444 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 000748 01DAC448 50664424 */  addiu       $4, $2, %lo(MapModelBuffer)
/* 00074C 01DAC44C 0A00023C */  lui         $2, (0xA7F80 >> 16)
/* 000750 01DAC450 807F4534 */  ori         $5, $2, (0xA7F80 & 0xFFFF)
/* 000754 01DAC454 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 000758 01DAC458 00000000 */   nop
/* 00075C 01DAC45C 44930434 */  ori         $4, $0, 0x9344
/* 000760 01DAC460 0400023C */  lui         $2, (0x445C0 >> 16)
/* 000764 01DAC464 C0454534 */  ori         $5, $2, (0x445C0 & 0xFFFF)
/* 000768 01DAC468 B896040C */  jal         SetPacketReadBuffer__Fii
/* 00076C 01DAC46C 00000000 */   nop
/* 000770 01DAC470 948B828F */  lw          $2, -0x746C($28)
/* 000774 01DAC474 149E82AF */  sw          $2, -0x61EC($28)
/* 000778 01DAC478 7042023C */  lui         $2, (0x42700000 >> 16)
/* 00077C 01DAC47C 00608244 */  mtc1        $2, $f12
/* 000780 01DAC480 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 000784 01DAC484 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 000788 01DAC488 DC92040C */  jal         SetDistance__13CCameraFollowFf
/* 00078C 01DAC48C 00000000 */   nop
/* 000790 01DAC490 00608044 */  mtc1        $0, $f12
/* 000794 01DAC494 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 000798 01DAC498 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 00079C 01DAC49C EC92040C */  jal         SetHeight__13CCameraFollowFf
/* 0007A0 01DAC4A0 00000000 */   nop
/* 0007A4 01DAC4A4 00608044 */  mtc1        $0, $f12
/* 0007A8 01DAC4A8 00000000 */  nop
/* 0007AC 01DAC4AC 46630046 */  mov.s       $f13, $f12
/* 0007B0 01DAC4B0 86630046 */  mov.s       $f14, $f12
/* 0007B4 01DAC4B4 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0007B8 01DAC4B8 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0007BC 01DAC4BC B892040C */  jal         SetFollow__13CCameraFollowFfff
/* 0007C0 01DAC4C0 00000000 */   nop
/* 0007C4 01DAC4C4 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0007C8 01DAC4C8 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0007CC 01DAC4CC 0A000524 */  addiu       $5, $0, 0xA
/* 0007D0 01DAC4D0 F491040C */  jal         Step__13CCameraFollowFi
/* 0007D4 01DAC4D4 00000000 */   nop
/* 0007D8 01DAC4D8 0041023C */  lui         $2, (0x41000000 >> 16)
/* 0007DC 01DAC4DC 00608244 */  mtc1        $2, $f12
/* 0007E0 01DAC4E0 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0007E4 01DAC4E4 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0007E8 01DAC4E8 9491040C */  jal         SetSpeed__7CCameraFf
/* 0007EC 01DAC4EC 00000000 */   nop
/* 0007F0 01DAC4F0 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0007F4 01DAC4F4 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0007F8 01DAC4F8 C092040C */  jal         FollowOn__13CCameraFollowFv
/* 0007FC 01DAC4FC 00000000 */   nop
/* 000800 01DAC500 7042023C */  lui         $2, (0x42700000 >> 16)
/* 000804 01DAC504 00608244 */  mtc1        $2, $f12
/* 000808 01DAC508 DC01023C */  lui         $2, %hi(SubCamera)
/* 00080C 01DAC50C E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 000810 01DAC510 DC92040C */  jal         SetDistance__13CCameraFollowFf
/* 000814 01DAC514 00000000 */   nop
/* 000818 01DAC518 00608044 */  mtc1        $0, $f12
/* 00081C 01DAC51C DC01023C */  lui         $2, %hi(SubCamera)
/* 000820 01DAC520 E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 000824 01DAC524 EC92040C */  jal         SetHeight__13CCameraFollowFf
/* 000828 01DAC528 00000000 */   nop
/* 00082C 01DAC52C 00608044 */  mtc1        $0, $f12
/* 000830 01DAC530 00000000 */  nop
/* 000834 01DAC534 46630046 */  mov.s       $f13, $f12
/* 000838 01DAC538 86630046 */  mov.s       $f14, $f12
/* 00083C 01DAC53C DC01023C */  lui         $2, %hi(SubCamera)
/* 000840 01DAC540 E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 000844 01DAC544 B892040C */  jal         SetFollow__13CCameraFollowFfff
/* 000848 01DAC548 00000000 */   nop
/* 00084C 01DAC54C DC01023C */  lui         $2, %hi(SubCamera)
/* 000850 01DAC550 E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 000854 01DAC554 0A000524 */  addiu       $5, $0, 0xA
/* 000858 01DAC558 F491040C */  jal         Step__13CCameraFollowFi
/* 00085C 01DAC55C 00000000 */   nop
/* 000860 01DAC560 0041023C */  lui         $2, (0x41000000 >> 16)
/* 000864 01DAC564 00608244 */  mtc1        $2, $f12
/* 000868 01DAC568 DC01023C */  lui         $2, %hi(SubCamera)
/* 00086C 01DAC56C E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 000870 01DAC570 9491040C */  jal         SetSpeed__7CCameraFf
/* 000874 01DAC574 00000000 */   nop
/* 000878 01DAC578 DC01023C */  lui         $2, %hi(SubCamera)
/* 00087C 01DAC57C E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 000880 01DAC580 C092040C */  jal         FollowOn__13CCameraFollowFv
/* 000884 01DAC584 00000000 */   nop
/* 000888 01DAC588 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 00088C 01DAC58C E0454224 */  addiu       $2, $2, %lo(MainCamera__4)
/* 000890 01DAC590 A89C82AF */  sw          $2, -0x6358($28)
/* 000894 01DAC594 DC01023C */  lui         $2, %hi(MainDungeonMap)
/* 000898 01DAC598 E04B4224 */  addiu       $2, $2, %lo(MainDungeonMap)
/* 00089C 01DAC59C C89C82AF */  sw          $2, -0x6338($28)
/* 0008A0 01DAC5A0 C89C848F */  lw          $4, -0x6338($28)
/* 0008A4 01DAC5A4 2431070C */  jal         initalize__11CDungeonMapFv
/* 0008A8 01DAC5A8 00000000 */   nop
/* 0008AC 01DAC5AC F001023C */  lui         $2, %hi(BtTexAnime)
/* 0008B0 01DAC5B0 50014424 */  addiu       $4, $2, %lo(BtTexAnime)
/* 0008B4 01DAC5B4 F001023C */  lui         $2, %hi(BtTexAnimeData)
/* 0008B8 01DAC5B8 40034524 */  addiu       $5, $2, %lo(BtTexAnimeData)
/* 0008BC 01DAC5BC 60000624 */  addiu       $6, $0, 0x60
/* 0008C0 01DAC5C0 089E050C */  jal         Initialize__13CTextureAnimeFP13CTexAnimeDatai
/* 0008C4 01DAC5C4 00000000 */   nop
/* 0008C8 01DAC5C8 28260070 */  paddub      $4, $0, $0
/* 0008CC 01DAC5CC 0C000010 */  b           .L01DAC600_2E7C00
/* 0008D0 01DAC5D0 00000000 */   nop
.L01DAC5D4_2E7BD4:
/* 0008D4 01DAC5D4 80190400 */  sll         $3, $4, 6
/* 0008D8 01DAC5D8 DF01023C */  lui         $2, %hi(DngEventMan)
/* 0008DC 01DAC5DC B0364224 */  addiu       $2, $2, %lo(DngEventMan)
/* 0008E0 01DAC5E0 21184300 */  addu        $3, $2, $3
/* 0008E4 01DAC5E4 000060A0 */  sb          $0, 0x0($3)
/* 0008E8 01DAC5E8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0008EC 01DAC5EC 200062AC */  sw          $2, 0x20($3)
/* 0008F0 01DAC5F0 1C0062AC */  sw          $2, 0x1C($3)
/* 0008F4 01DAC5F4 340060AC */  sw          $0, 0x34($3)
/* 0008F8 01DAC5F8 3C0060AC */  sw          $0, 0x3C($3)
/* 0008FC 01DAC5FC 01008424 */  addiu       $4, $4, 0x1
.L01DAC600_2E7C00:
/* 000900 01DAC600 40008228 */  slti        $2, $4, 0x40
/* 000904 01DAC604 F3FF4014 */  bnez        $2, .L01DAC5D4_2E7BD4
/* 000908 01DAC608 00000000 */   nop
/* 00090C 01DAC60C 28260070 */  paddub      $4, $0, $0
/* 000910 01DAC610 0C000010 */  b           .L01DAC644_2E7C44
/* 000914 01DAC614 00000000 */   nop
.L01DAC618_2E7C18:
/* 000918 01DAC618 80190400 */  sll         $3, $4, 6
/* 00091C 01DAC61C DF01023C */  lui         $2, %hi(DngEventMan)
/* 000920 01DAC620 B0364224 */  addiu       $2, $2, %lo(DngEventMan)
/* 000924 01DAC624 21184300 */  addu        $3, $2, $3
/* 000928 01DAC628 001060AC */  sw          $0, 0x1000($3)
/* 00092C 01DAC62C 341060AC */  sw          $0, 0x1034($3)
/* 000930 01DAC630 381060AC */  sw          $0, 0x1038($3)
/* 000934 01DAC634 301060AC */  sw          $0, 0x1030($3)
/* 000938 01DAC638 FFFF0224 */  addiu       $2, $0, -0x1
/* 00093C 01DAC63C 3C1062AC */  sw          $2, 0x103C($3)
/* 000940 01DAC640 01008424 */  addiu       $4, $4, 0x1
.L01DAC644_2E7C44:
/* 000944 01DAC644 60008228 */  slti        $2, $4, 0x60
/* 000948 01DAC648 F3FF4014 */  bnez        $2, .L01DAC618_2E7C18
/* 00094C 01DAC64C 00000000 */   nop
/* 000950 01DAC650 DF01023C */  lui         $2, %hi(DngEventMan)
/* 000954 01DAC654 B0364224 */  addiu       $2, $2, %lo(DngEventMan)
/* 000958 01DAC658 D09C82AF */  sw          $2, -0x6330($28)
/* 00095C 01DAC65C DC9C80AF */  sw          $0, -0x6324($28)
/* 000960 01DAC660 28860070 */  paddub      $16, $0, $0
/* 000964 01DAC664 15000010 */  b           .L01DAC6BC_2E7CBC
/* 000968 01DAC668 00000000 */   nop
.L01DAC66C_2E7C6C:
/* 00096C 01DAC66C B0110224 */  addiu       $2, $0, 0x11B0
/* 000970 01DAC670 18180202 */  mult        $3, $16, $2
/* 000974 01DAC674 DE01023C */  lui         $2, %hi(DranMapField)
/* 000978 01DAC678 00624224 */  addiu       $2, $2, %lo(DranMapField)
/* 00097C 01DAC67C 21204300 */  addu        $4, $2, $3
/* 000980 01DAC680 A000998C */  lw          $25, 0xA0($4)
/* 000984 01DAC684 C400398F */  lw          $25, 0xC4($25)
/* 000988 01DAC688 09F82003 */  jalr        $25
/* 00098C 01DAC68C 00000000 */   nop
/* 000990 01DAC690 80201000 */  sll         $4, $16, 2
/* 000994 01DAC694 DF01023C */  lui         $2, %hi(Chara__3 + 0x3760)
/* 000998 01DAC698 40364224 */  addiu       $2, $2, %lo(Chara__3 + 0x3760)
/* 00099C 01DAC69C 21104400 */  addu        $2, $2, $4
/* 0009A0 01DAC6A0 000040AC */  sw          $0, 0x0($2)
/* 0009A4 01DAC6A4 03000324 */  addiu       $3, $0, 0x3
/* 0009A8 01DAC6A8 DF01023C */  lui         $2, %hi(Chara__3 + 0x3790)
/* 0009AC 01DAC6AC 70364224 */  addiu       $2, $2, %lo(Chara__3 + 0x3790)
/* 0009B0 01DAC6B0 21104400 */  addu        $2, $2, $4
/* 0009B4 01DAC6B4 000043AC */  sw          $3, 0x0($2)
/* 0009B8 01DAC6B8 01001026 */  addiu       $16, $16, 0x1
.L01DAC6BC_2E7CBC:
/* 0009BC 01DAC6BC 0C00022A */  slti        $2, $16, 0xC
/* 0009C0 01DAC6C0 EAFF4014 */  bnez        $2, .L01DAC66C_2E7C6C
/* 0009C4 01DAC6C4 00000000 */   nop
/* 0009C8 01DAC6C8 DF01013C */  lui         $1, %hi(Chara__3 + 0x37C0)
/* 0009CC 01DAC6CC A03620AC */  sw          $0, %lo(Chara__3 + 0x37C0)($1)
/* 0009D0 01DAC6D0 DF01013C */  lui         $1, %hi(Chara__3 + 0x37C4)
/* 0009D4 01DAC6D4 A43620AC */  sw          $0, %lo(Chara__3 + 0x37C4)($1)
/* 0009D8 01DAC6D8 DE01023C */  lui         $2, %hi(DranMapField)
/* 0009DC 01DAC6DC 00624224 */  addiu       $2, $2, %lo(DranMapField)
/* 0009E0 01DAC6E0 CC9C82AF */  sw          $2, -0x6334($28)
/* 0009E4 01DAC6E4 F001023C */  lui         $2, %hi(CColData)
/* 0009E8 01DAC6E8 40C14224 */  addiu       $2, $2, %lo(CColData)
/* 0009EC 01DAC6EC F09D82AF */  sw          $2, -0x6210($28)
/* 0009F0 01DAC6F0 28260070 */  paddub      $4, $0, $0
/* 0009F4 01DAC6F4 07000010 */  b           .L01DAC714_2E7D14
/* 0009F8 01DAC6F8 00000000 */   nop
.L01DAC6FC_2E7CFC:
/* 0009FC 01DAC6FC 80180400 */  sll         $3, $4, 2
/* 000A00 01DAC700 ED01023C */  lui         $2, %hi(ShotData + 0x3D0)
/* 000A04 01DAC704 10894224 */  addiu       $2, $2, %lo(ShotData + 0x3D0)
/* 000A08 01DAC708 21104300 */  addu        $2, $2, $3
/* 000A0C 01DAC70C 000040AC */  sw          $0, 0x0($2)
/* 000A10 01DAC710 01008424 */  addiu       $4, $4, 0x1
.L01DAC714_2E7D14:
/* 000A14 01DAC714 0C008228 */  slti        $2, $4, 0xC
/* 000A18 01DAC718 F8FF4014 */  bnez        $2, .L01DAC6FC_2E7CFC
/* 000A1C 01DAC71C 00000000 */   nop
/* 000A20 01DAC720 ED01023C */  lui         $2, %hi(ShotData)
/* 000A24 01DAC724 40854224 */  addiu       $2, $2, %lo(ShotData)
/* 000A28 01DAC728 E49D82AF */  sw          $2, -0x621C($28)
/* 000A2C 01DAC72C EC01013C */  lui         $1, %hi(HealEffect + 0x510)
/* 000A30 01DAC730 505020AC */  sw          $0, %lo(HealEffect + 0x510)($1)
/* 000A34 01DAC734 D8BC060C */  jal         WaterSplash_Init__Fv
/* 000A38 01DAC738 00000000 */   nop
/* 000A3C 01DAC73C 28860070 */  paddub      $16, $0, $0
/* 000A40 01DAC740 09000010 */  b           .L01DAC768_2E7D68
/* 000A44 01DAC744 00000000 */   nop
.L01DAC748_2E7D48:
/* 000A48 01DAC748 60A10234 */  ori         $2, $0, 0xA160
/* 000A4C 01DAC74C 18180202 */  mult        $3, $16, $2
/* 000A50 01DAC750 ED01023C */  lui         $2, %hi(ShotEffect)
/* 000A54 01DAC754 40894224 */  addiu       $2, $2, %lo(ShotEffect)
/* 000A58 01DAC758 21204300 */  addu        $4, $2, $3
/* 000A5C 01DAC75C 10B9060C */  jal         Initialize__12CSHOT_EFFECTFv
/* 000A60 01DAC760 00000000 */   nop
/* 000A64 01DAC764 01001026 */  addiu       $16, $16, 0x1
.L01DAC768_2E7D68:
/* 000A68 01DAC768 0500022A */  slti        $2, $16, 0x5
/* 000A6C 01DAC76C F6FF4014 */  bnez        $2, .L01DAC748_2E7D48
/* 000A70 01DAC770 00000000 */   nop
/* 000A74 01DAC774 ED01023C */  lui         $2, %hi(ShotEffect)
/* 000A78 01DAC778 40894224 */  addiu       $2, $2, %lo(ShotEffect)
/* 000A7C 01DAC77C E89D82AF */  sw          $2, -0x6218($28)
/* 000A80 01DAC780 28860070 */  paddub      $16, $0, $0
/* 000A84 01DAC784 09000010 */  b           .L01DAC7AC_2E7DAC
/* 000A88 01DAC788 00000000 */   nop
.L01DAC78C_2E7D8C:
/* 000A8C 01DAC78C 60A10234 */  ori         $2, $0, 0xA160
/* 000A90 01DAC790 18180202 */  mult        $3, $16, $2
/* 000A94 01DAC794 E601023C */  lui         $2, %hi(MasekiEffect)
/* 000A98 01DAC798 80B34224 */  addiu       $2, $2, %lo(MasekiEffect)
/* 000A9C 01DAC79C 21204300 */  addu        $4, $2, $3
/* 000AA0 01DAC7A0 10B9060C */  jal         Initialize__12CSHOT_EFFECTFv
/* 000AA4 01DAC7A4 00000000 */   nop
/* 000AA8 01DAC7A8 01001026 */  addiu       $16, $16, 0x1
.L01DAC7AC_2E7DAC:
/* 000AAC 01DAC7AC 0500022A */  slti        $2, $16, 0x5
/* 000AB0 01DAC7B0 F6FF4014 */  bnez        $2, .L01DAC78C_2E7D8C
/* 000AB4 01DAC7B4 00000000 */   nop
/* 000AB8 01DAC7B8 28260070 */  paddub      $4, $0, $0
/* 000ABC 01DAC7BC 0C000010 */  b           .L01DAC7F0_2E7DF0
/* 000AC0 01DAC7C0 00000000 */   nop
.L01DAC7C4_2E7DC4:
/* 000AC4 01DAC7C4 01000324 */  addiu       $3, $0, 0x1
/* 000AC8 01DAC7C8 80280400 */  sll         $5, $4, 2
/* 000ACC 01DAC7CC F001023C */  lui         $2, %hi(OzumondShot + 0x200)
/* 000AD0 01DAC7D0 30B24224 */  addiu       $2, $2, %lo(OzumondShot + 0x200)
/* 000AD4 01DAC7D4 21104500 */  addu        $2, $2, $5
/* 000AD8 01DAC7D8 000043AC */  sw          $3, 0x0($2)
/* 000ADC 01DAC7DC F001023C */  lui         $2, %hi(OzumondShot + 0x280)
/* 000AE0 01DAC7E0 B0B24224 */  addiu       $2, $2, %lo(OzumondShot + 0x280)
/* 000AE4 01DAC7E4 21104500 */  addu        $2, $2, $5
/* 000AE8 01DAC7E8 000040AC */  sw          $0, 0x0($2)
/* 000AEC 01DAC7EC 01008424 */  addiu       $4, $4, 0x1
.L01DAC7F0_2E7DF0:
/* 000AF0 01DAC7F0 10008228 */  slti        $2, $4, 0x10
/* 000AF4 01DAC7F4 F3FF4014 */  bnez        $2, .L01DAC7C4_2E7DC4
/* 000AF8 01DAC7F8 00000000 */   nop
/* 000AFC 01DAC7FC 28260070 */  paddub      $4, $0, $0
/* 000B00 01DAC800 0D000010 */  b           .L01DAC838_2E7E38
/* 000B04 01DAC804 00000000 */   nop
.L01DAC808_2E7E08:
/* 000B08 01DAC808 01000324 */  addiu       $3, $0, 0x1
/* 000B0C 01DAC80C 80280400 */  sll         $5, $4, 2
/* 000B10 01DAC810 F001023C */  lui         $2, %hi(OzumondFire + 0xA00)
/* 000B14 01DAC814 F0BC4224 */  addiu       $2, $2, %lo(OzumondFire + 0xA00)
/* 000B18 01DAC818 21104500 */  addu        $2, $2, $5
/* 000B1C 01DAC81C 000043AC */  sw          $3, 0x0($2)
/* 000B20 01DAC820 FFFF0324 */  addiu       $3, $0, -0x1
/* 000B24 01DAC824 F001023C */  lui         $2, %hi(OzumondFire + 0xC00)
/* 000B28 01DAC828 F0BE4224 */  addiu       $2, $2, %lo(OzumondFire + 0xC00)
/* 000B2C 01DAC82C 21104500 */  addu        $2, $2, $5
/* 000B30 01DAC830 000043AC */  sw          $3, 0x0($2)
/* 000B34 01DAC834 01008424 */  addiu       $4, $4, 0x1
.L01DAC838_2E7E38:
/* 000B38 01DAC838 40008228 */  slti        $2, $4, 0x40
/* 000B3C 01DAC83C F2FF4014 */  bnez        $2, .L01DAC808_2E7E08
/* 000B40 01DAC840 00000000 */   nop
/* 000B44 01DAC844 F001013C */  lui         $1, %hi(OzumondFire + 0xD00)
/* 000B48 01DAC848 F0BF20AC */  sw          $0, %lo(OzumondFire + 0xD00)($1)
/* 000B4C 01DAC84C 189D80AF */  sw          $0, -0x62E8($28)
/* 000B50 01DAC850 EC01023C */  lui         $2, %hi(WeaponCrashEffect)
/* 000B54 01DAC854 E0DA4424 */  addiu       $4, $2, %lo(WeaponCrashEffect)
/* 000B58 01DAC858 74CD060C */  jal         Initialize__8CHitMarkFv
/* 000B5C 01DAC85C 00000000 */   nop
/* 000B60 01DAC860 28860070 */  paddub      $16, $0, $0
/* 000B64 01DAC864 0C000010 */  b           .L01DAC898_2E7E98
/* 000B68 01DAC868 00000000 */   nop
.L01DAC86C_2E7E6C:
/* 000B6C 01DAC86C 00111000 */  sll         $2, $16, 4
/* 000B70 01DAC870 21185000 */  addu        $3, $2, $16
/* 000B74 01DAC874 80100300 */  sll         $2, $3, 2
/* 000B78 01DAC878 23104300 */  subu        $2, $2, $3
/* 000B7C 01DAC87C 40190200 */  sll         $3, $2, 5
/* 000B80 01DAC880 EC01023C */  lui         $2, %hi(HitMark)
/* 000B84 01DAC884 40E14224 */  addiu       $2, $2, %lo(HitMark)
/* 000B88 01DAC888 21204300 */  addu        $4, $2, $3
/* 000B8C 01DAC88C 74CD060C */  jal         Initialize__8CHitMarkFv
/* 000B90 01DAC890 00000000 */   nop
/* 000B94 01DAC894 01001026 */  addiu       $16, $16, 0x1
.L01DAC898_2E7E98:
/* 000B98 01DAC898 1000022A */  slti        $2, $16, 0x10
/* 000B9C 01DAC89C F3FF4014 */  bnez        $2, .L01DAC86C_2E7E6C
/* 000BA0 01DAC8A0 00000000 */   nop
/* 000BA4 01DAC8A4 282E0070 */  paddub      $5, $0, $0
/* 000BA8 01DAC8A8 08000010 */  b           .L01DAC8CC_2E7ECC
/* 000BAC 01DAC8AC 00000000 */   nop
.L01DAC8B0_2E7EB0:
/* 000BB0 01DAC8B0 FFFF0424 */  addiu       $4, $0, -0x1
/* 000BB4 01DAC8B4 80180500 */  sll         $3, $5, 2
/* 000BB8 01DAC8B8 F001023C */  lui         $2, %hi(OzumondShotEffect + 0x100)
/* 000BBC 01DAC8BC 00C14224 */  addiu       $2, $2, %lo(OzumondShotEffect + 0x100)
/* 000BC0 01DAC8C0 21104300 */  addu        $2, $2, $3
/* 000BC4 01DAC8C4 000044AC */  sw          $4, 0x0($2)
/* 000BC8 01DAC8C8 0100A524 */  addiu       $5, $5, 0x1
.L01DAC8CC_2E7ECC:
/* 000BCC 01DAC8CC 1000A228 */  slti        $2, $5, 0x10
/* 000BD0 01DAC8D0 F7FF4014 */  bnez        $2, .L01DAC8B0_2E7EB0
/* 000BD4 01DAC8D4 00000000 */   nop
/* 000BD8 01DAC8D8 289D80AF */  sw          $0, -0x62D8($28)
/* 000BDC 01DAC8DC 281E0070 */  paddub      $3, $0, $0
/* 000BE0 01DAC8E0 0D000010 */  b           .L01DAC918_2E7F18
/* 000BE4 01DAC8E4 00000000 */   nop
.L01DAC8E8_2E7EE8:
/* 000BE8 01DAC8E8 40100300 */  sll         $2, $3, 1
/* 000BEC 01DAC8EC 21104300 */  addu        $2, $2, $3
/* 000BF0 01DAC8F0 40210200 */  sll         $4, $2, 5
/* 000BF4 01DAC8F4 EC01023C */  lui         $2, %hi(HitValue + 0x5C)
/* 000BF8 01DAC8F8 9C794224 */  addiu       $2, $2, %lo(HitValue + 0x5C)
/* 000BFC 01DAC8FC 21104400 */  addu        $2, $2, $4
/* 000C00 01DAC900 000040AC */  sw          $0, 0x0($2)
/* 000C04 01DAC904 EC01023C */  lui         $2, %hi(HitValue + 0x10)
/* 000C08 01DAC908 50794224 */  addiu       $2, $2, %lo(HitValue + 0x10)
/* 000C0C 01DAC90C 21104400 */  addu        $2, $2, $4
/* 000C10 01DAC910 000040AC */  sw          $0, 0x0($2)
/* 000C14 01DAC914 01006324 */  addiu       $3, $3, 0x1
.L01DAC918_2E7F18:
/* 000C18 01DAC918 20006228 */  slti        $2, $3, 0x20
/* 000C1C 01DAC91C F2FF4014 */  bnez        $2, .L01DAC8E8_2E7EE8
/* 000C20 01DAC920 00000000 */   nop
/* 000C24 01DAC924 EC01023C */  lui         $2, %hi(HitValue)
/* 000C28 01DAC928 40794224 */  addiu       $2, $2, %lo(HitValue)
/* 000C2C 01DAC92C E09D82AF */  sw          $2, -0x6220($28)
/* 000C30 01DAC930 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x48)
/* 000C34 01DAC934 188820AC */  sw          $0, %lo(MainMonstorUnit + 0x48)($1)
/* 000C38 01DAC938 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x90)
/* 000C3C 01DAC93C 608820AC */  sw          $0, %lo(MainMonstorUnit + 0x90)($1)
/* 000C40 01DAC940 282E0070 */  paddub      $5, $0, $0
/* 000C44 01DAC944 0B000010 */  b           .L01DAC974_2E7F74
/* 000C48 01DAC948 00000000 */   nop
.L01DAC94C_2E7F4C:
/* 000C4C 01DAC94C 00190500 */  sll         $3, $5, 4
/* 000C50 01DAC950 F001023C */  lui         $2, %hi(MonstorScriptBuffer)
/* 000C54 01DAC954 E0664224 */  addiu       $2, $2, %lo(MonstorScriptBuffer)
/* 000C58 01DAC958 21204300 */  addu        $4, $2, $3
/* 000C5C 01DAC95C 80180500 */  sll         $3, $5, 2
/* 000C60 01DAC960 E001023C */  lui         $2, %hi(MainMonstorUnit)
/* 000C64 01DAC964 D0874224 */  addiu       $2, $2, %lo(MainMonstorUnit)
/* 000C68 01DAC968 21104300 */  addu        $2, $2, $3
/* 000C6C 01DAC96C 000044AC */  sw          $4, 0x0($2)
/* 000C70 01DAC970 0100A524 */  addiu       $5, $5, 0x1
.L01DAC974_2E7F74:
/* 000C74 01DAC974 1000A228 */  slti        $2, $5, 0x10
/* 000C78 01DAC978 F4FF4014 */  bnez        $2, .L01DAC94C_2E7F4C
/* 000C7C 01DAC97C 00000000 */   nop
/* 000C80 01DAC980 FFFF0224 */  addiu       $2, $0, -0x1
/* 000C84 01DAC984 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x94)
/* 000C88 01DAC988 648822AC */  sw          $2, %lo(MainMonstorUnit + 0x94)($1)
/* 000C8C 01DAC98C E001023C */  lui         $2, %hi(MainMonstorUnit)
/* 000C90 01DAC990 D0874424 */  addiu       $4, $2, %lo(MainMonstorUnit)
/* 000C94 01DAC994 282E0070 */  paddub      $5, $0, $0
/* 000C98 01DAC998 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 000C9C 01DAC99C 00000000 */   nop
/* 000CA0 01DAC9A0 E899070C */  jal         BtSetEventExtendTable__Fv
/* 000CA4 01DAC9A4 00000000 */   nop
/* 000CA8 01DAC9A8 E001023C */  lui         $2, %hi(MainMonstorUnit)
/* 000CAC 01DAC9AC D0874224 */  addiu       $2, $2, %lo(MainMonstorUnit)
/* 000CB0 01DAC9B0 E09C82AF */  sw          $2, -0x6320($28)
/* 000CB4 01DAC9B4 EA01023C */  lui         $2, %hi(WeaponHave)
/* 000CB8 01DAC9B8 90754224 */  addiu       $2, $2, %lo(WeaponHave)
/* 000CBC 01DAC9BC 049D82AF */  sw          $2, -0x62FC($28)
/* 000CC0 01DAC9C0 049D848F */  lw          $4, -0x62FC($28)
/* 000CC4 01DAC9C4 A896080C */  jal         SetWeaponAttachStatus__FP11WEAPON_HAVE
/* 000CC8 01DAC9C8 00000000 */   nop
/* 000CCC 01DAC9CC 189E80AF */  sw          $0, -0x61E8($28)
/* 000CD0 01DAC9D0 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 000CD4 01DAC9D4 D401013C */  lui         $1, %hi(EdEventInfo + 0x3C)
/* 000CD8 01DAC9D8 0CD222AC */  sw          $2, %lo(EdEventInfo + 0x3C)($1)
/* 000CDC 01DAC9DC D401013C */  lui         $1, %hi(EdEventInfo + 0x300)
/* 000CE0 01DAC9E0 D0D420AC */  sw          $0, %lo(EdEventInfo + 0x300)($1)
/* 000CE4 01DAC9E4 B425060C */  jal         EdFadeInit__Fv
/* 000CE8 01DAC9E8 00000000 */   nop
/* 000CEC 01DAC9EC 90D5060C */  jal         ClearGateKeyStack__Fv
/* 000CF0 01DAC9F0 00000000 */   nop
/* 000CF4 01DAC9F4 C701023C */  lui         $2, %hi(TexManager)
/* 000CF8 01DAC9F8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 000CFC 01DAC9FC E03F0524 */  addiu       $5, $0, 0x3FE0
/* 000D00 01DACA00 F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 000D04 01DACA04 00000000 */   nop
/* 000D08 01DACA08 60AF760C */  jal         LoadBaseTexture__Fv
/* 000D0C 01DACA0C 00000000 */   nop
/* 000D10 01DACA10 948B858F */  lw          $5, -0x746C($28)
/* 000D14 01DACA14 DC01023C */  lui         $2, %hi(LIT_910)
/* 000D18 01DACA18 782D4424 */  addiu       $4, $2, %lo(LIT_910)
/* 000D1C 01DACA1C D0AE080C */  jal         LoadFileMenuData__FPcPUi
/* 000D20 01DACA20 00000000 */   nop
/* 000D24 01DACA24 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 000D28 01DACA28 00000000 */   nop
/* 000D2C 01DACA2C 948B858F */  lw          $5, -0x746C($28)
/* 000D30 01DACA30 C701023C */  lui         $2, %hi(TexManager)
/* 000D34 01DACA34 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 000D38 01DACA38 FFFF0624 */  addiu       $6, $0, -0x1
/* 000D3C 01DACA3C 283E0070 */  paddub      $7, $0, $0
/* 000D40 01DACA40 28460070 */  paddub      $8, $0, $0
/* 000D44 01DACA44 E8CA040C */  jal         EnterIMGFile__15CTextureManagerFPUciii
/* 000D48 01DACA48 00000000 */   nop
/* 000D4C 01DACA4C 948B858F */  lw          $5, -0x746C($28)
/* 000D50 01DACA50 DC01023C */  lui         $2, %hi(LIT_911)
/* 000D54 01DACA54 882D4424 */  addiu       $4, $2, %lo(LIT_911)
/* 000D58 01DACA58 D0AE080C */  jal         LoadFileMenuData__FPcPUi
/* 000D5C 01DACA5C 00000000 */   nop
/* 000D60 01DACA60 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 000D64 01DACA64 00000000 */   nop
/* 000D68 01DACA68 948B858F */  lw          $5, -0x746C($28)
/* 000D6C 01DACA6C C701023C */  lui         $2, %hi(TexManager)
/* 000D70 01DACA70 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 000D74 01DACA74 4CCA040C */  jal         EnterFixTextureZ__15CTextureManagerFPUc
/* 000D78 01DACA78 00000000 */   nop
/* 000D7C 01DACA7C EC01023C */  lui         $2, %hi(mainItemModel)
/* 000D80 01DACA80 60504424 */  addiu       $4, $2, %lo(mainItemModel)
/* 000D84 01DACA84 D054070C */  jal         Initialize__14CMainItemModelFv
/* 000D88 01DACA88 00000000 */   nop
/* 000D8C 01DACA8C 28260070 */  paddub      $4, $0, $0
/* 000D90 01DACA90 0C000010 */  b           .L01DACAC4_2E80C4
/* 000D94 01DACA94 00000000 */   nop
.L01DACA98_2E8098:
/* 000D98 01DACA98 FFFF0324 */  addiu       $3, $0, -0x1
/* 000D9C 01DACA9C 80280400 */  sll         $5, $4, 2
/* 000DA0 01DACAA0 EC01023C */  lui         $2, %hi(activeItem + 0x4)
/* 000DA4 01DACAA4 74784224 */  addiu       $2, $2, %lo(activeItem + 0x4)
/* 000DA8 01DACAA8 21104500 */  addu        $2, $2, $5
/* 000DAC 01DACAAC 000043AC */  sw          $3, 0x0($2)
/* 000DB0 01DACAB0 EC01023C */  lui         $2, %hi(activeItem + 0x14)
/* 000DB4 01DACAB4 84784224 */  addiu       $2, $2, %lo(activeItem + 0x14)
/* 000DB8 01DACAB8 21104500 */  addu        $2, $2, $5
/* 000DBC 01DACABC 000043AC */  sw          $3, 0x0($2)
/* 000DC0 01DACAC0 01008424 */  addiu       $4, $4, 0x1
.L01DACAC4_2E80C4:
/* 000DC4 01DACAC4 04008228 */  slti        $2, $4, 0x4
/* 000DC8 01DACAC8 F3FF4014 */  bnez        $2, .L01DACA98_2E8098
/* 000DCC 01DACACC 00000000 */   nop
/* 000DD0 01DACAD0 FFFF0224 */  addiu       $2, $0, -0x1
/* 000DD4 01DACAD4 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 000DD8 01DACAD8 A47822AC */  sw          $2, %lo(activeItem + 0x34)($1)
/* 000DDC 01DACADC 01000224 */  addiu       $2, $0, 0x1
/* 000DE0 01DACAE0 EC01013C */  lui         $1, %hi(activeItem)
/* 000DE4 01DACAE4 707822AC */  sw          $2, %lo(activeItem)($1)
/* 000DE8 01DACAE8 EC01023C */  lui         $2, %hi(mainItemModel)
/* 000DEC 01DACAEC 60504224 */  addiu       $2, $2, %lo(mainItemModel)
/* 000DF0 01DACAF0 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 000DF4 01DACAF4 A87822AC */  sw          $2, %lo(activeItem + 0x38)($1)
/* 000DF8 01DACAF8 948B848F */  lw          $4, -0x746C($28)
/* 000DFC 01DACAFC B44F070C */  jal         BtSetActiveItemModel__FPUi
/* 000E00 01DACB00 00000000 */   nop
/* 000E04 01DACB04 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 000E08 01DACB08 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 000E0C 01DACB0C FFFF0224 */  addiu       $2, $0, -0x1
/* 000E10 01DACB10 DC01013C */  lui         $1, %hi(BtActStatus + 0x4)
/* 000E14 01DACB14 844422AC */  sw          $2, %lo(BtActStatus + 0x4)($1)
/* 000E18 01DACB18 DC01013C */  lui         $1, %hi(BtActStatus + 0x8)
/* 000E1C 01DACB1C 884422AC */  sw          $2, %lo(BtActStatus + 0x8)($1)
/* 000E20 01DACB20 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 000E24 01DACB24 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 000E28 01DACB28 DC01013C */  lui         $1, %hi(BtActStatus + 0x40)
/* 000E2C 01DACB2C C04420AC */  sw          $0, %lo(BtActStatus + 0x40)($1)
/* 000E30 01DACB30 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 000E34 01DACB34 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 000E38 01DACB38 C84422AC */  sw          $2, %lo(BtActStatus + 0x48)($1)
/* 000E3C 01DACB3C DC01013C */  lui         $1, %hi(BtActStatus + 0xA4)
/* 000E40 01DACB40 244520AC */  sw          $0, %lo(BtActStatus + 0xA4)($1)
/* 000E44 01DACB44 DC01013C */  lui         $1, %hi(BtActStatus + 0x4C)
/* 000E48 01DACB48 CC4420AC */  sw          $0, %lo(BtActStatus + 0x4C)($1)
/* 000E4C 01DACB4C DC01013C */  lui         $1, %hi(BtActStatus + 0x20)
/* 000E50 01DACB50 A04420AC */  sw          $0, %lo(BtActStatus + 0x20)($1)
/* 000E54 01DACB54 DC01013C */  lui         $1, %hi(BtActStatus + 0x24)
/* 000E58 01DACB58 A44420AC */  sw          $0, %lo(BtActStatus + 0x24)($1)
/* 000E5C 01DACB5C 01000324 */  addiu       $3, $0, 0x1
/* 000E60 01DACB60 DC01013C */  lui         $1, %hi(BtActStatus + 0x54)
/* 000E64 01DACB64 D44423AC */  sw          $3, %lo(BtActStatus + 0x54)($1)
/* 000E68 01DACB68 DC01013C */  lui         $1, %hi(BtActStatus + 0x58)
/* 000E6C 01DACB6C D84423AC */  sw          $3, %lo(BtActStatus + 0x58)($1)
/* 000E70 01DACB70 DC01013C */  lui         $1, %hi(BtActStatus + 0x5C)
/* 000E74 01DACB74 DC4420AC */  sw          $0, %lo(BtActStatus + 0x5C)($1)
/* 000E78 01DACB78 DC01013C */  lui         $1, %hi(BtActStatus + 0x60)
/* 000E7C 01DACB7C E04420AC */  sw          $0, %lo(BtActStatus + 0x60)($1)
/* 000E80 01DACB80 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 000E84 01DACB84 E44423A4 */  sh          $3, %lo(BtActStatus + 0x64)($1)
/* 000E88 01DACB88 DC01013C */  lui         $1, %hi(BtActStatus + 0x66)
/* 000E8C 01DACB8C E64423A4 */  sh          $3, %lo(BtActStatus + 0x66)($1)
/* 000E90 01DACB90 DC01013C */  lui         $1, %hi(BtActStatus + 0x68)
/* 000E94 01DACB94 E84420AC */  sw          $0, %lo(BtActStatus + 0x68)($1)
/* 000E98 01DACB98 DC01013C */  lui         $1, %hi(BtActStatus + 0x6C)
/* 000E9C 01DACB9C EC4420AC */  sw          $0, %lo(BtActStatus + 0x6C)($1)
/* 000EA0 01DACBA0 DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 000EA4 01DACBA4 F04420AC */  sw          $0, %lo(BtActStatus + 0x70)($1)
/* 000EA8 01DACBA8 DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 000EAC 01DACBAC 184520AC */  sw          $0, %lo(BtActStatus + 0x98)($1)
/* 000EB0 01DACBB0 DC01013C */  lui         $1, %hi(BtActStatus + 0x9C)
/* 000EB4 01DACBB4 1C4520AC */  sw          $0, %lo(BtActStatus + 0x9C)($1)
/* 000EB8 01DACBB8 DC01013C */  lui         $1, %hi(BtActStatus + 0x94)
/* 000EBC 01DACBBC 144520A4 */  sh          $0, %lo(BtActStatus + 0x94)($1)
/* 000EC0 01DACBC0 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 000EC4 01DACBC4 944420AC */  sw          $0, %lo(BtActStatus + 0x14)($1)
/* 000EC8 01DACBC8 DC01013C */  lui         $1, %hi(BtActStatus + 0xA4)
/* 000ECC 01DACBCC 244520AC */  sw          $0, %lo(BtActStatus + 0xA4)($1)
/* 000ED0 01DACBD0 0A000224 */  addiu       $2, $0, 0xA
/* 000ED4 01DACBD4 DC01013C */  lui         $1, %hi(BtActStatus + 0xF8)
/* 000ED8 01DACBD8 784522AC */  sw          $2, %lo(BtActStatus + 0xF8)($1)
/* 000EDC 01DACBDC DC01013C */  lui         $1, %hi(BtActStatus + 0xE4)
/* 000EE0 01DACBE0 644520AC */  sw          $0, %lo(BtActStatus + 0xE4)($1)
/* 000EE4 01DACBE4 DC01013C */  lui         $1, %hi(BtActStatus + 0xE8)
/* 000EE8 01DACBE8 684520AC */  sw          $0, %lo(BtActStatus + 0xE8)($1)
/* 000EEC 01DACBEC DC01013C */  lui         $1, %hi(BtActStatus + 0xF0)
/* 000EF0 01DACBF0 704520AC */  sw          $0, %lo(BtActStatus + 0xF0)($1)
/* 000EF4 01DACBF4 DC01013C */  lui         $1, %hi(BtActStatus + 0x100)
/* 000EF8 01DACBF8 804520AC */  sw          $0, %lo(BtActStatus + 0x100)($1)
/* 000EFC 01DACBFC DC01013C */  lui         $1, %hi(BtActStatus + 0x104)
/* 000F00 01DACC00 844520AC */  sw          $0, %lo(BtActStatus + 0x104)($1)
/* 000F04 01DACC04 DC01013C */  lui         $1, %hi(BtActStatus + 0x108)
/* 000F08 01DACC08 884520AC */  sw          $0, %lo(BtActStatus + 0x108)($1)
/* 000F0C 01DACC0C DC01013C */  lui         $1, %hi(BtActStatus + 0x10C)
/* 000F10 01DACC10 8C4520AC */  sw          $0, %lo(BtActStatus + 0x10C)($1)
/* 000F14 01DACC14 DC01013C */  lui         $1, %hi(BtActStatus + 0x110)
/* 000F18 01DACC18 904520AC */  sw          $0, %lo(BtActStatus + 0x110)($1)
/* 000F1C 01DACC1C DC01013C */  lui         $1, %hi(BtActStatus + 0x114)
/* 000F20 01DACC20 944520AC */  sw          $0, %lo(BtActStatus + 0x114)($1)
/* 000F24 01DACC24 DC01013C */  lui         $1, %hi(BtActStatus + 0x144)
/* 000F28 01DACC28 C44520A4 */  sh          $0, %lo(BtActStatus + 0x144)($1)
/* 000F2C 01DACC2C DC01013C */  lui         $1, %hi(BtActStatus + 0x146)
/* 000F30 01DACC30 C64520A4 */  sh          $0, %lo(BtActStatus + 0x146)($1)
/* 000F34 01DACC34 100E0224 */  addiu       $2, $0, 0xE10
/* 000F38 01DACC38 DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 000F3C 01DACC3C 604522AC */  sw          $2, %lo(BtActStatus + 0xE0)($1)
/* 000F40 01DACC40 DC01013C */  lui         $1, %hi(BtActStatus + 0x124)
/* 000F44 01DACC44 A44520AC */  sw          $0, %lo(BtActStatus + 0x124)($1)
/* 000F48 01DACC48 DC01013C */  lui         $1, %hi(BtActStatus + 0x128)
/* 000F4C 01DACC4C A84520AC */  sw          $0, %lo(BtActStatus + 0x128)($1)
/* 000F50 01DACC50 DC01013C */  lui         $1, %hi(BtActStatus + 0x148)
/* 000F54 01DACC54 C84520A4 */  sh          $0, %lo(BtActStatus + 0x148)($1)
/* 000F58 01DACC58 DC01013C */  lui         $1, %hi(BtActStatus + 0x14A)
/* 000F5C 01DACC5C CA4520A4 */  sh          $0, %lo(BtActStatus + 0x14A)($1)
/* 000F60 01DACC60 D401013C */  lui         $1, %hi(EdEventInfo + 0x60)
/* 000F64 01DACC64 30D223AC */  sw          $3, %lo(EdEventInfo + 0x60)($1)
/* 000F68 01DACC68 D401013C */  lui         $1, %hi(EdEventInfo + 0x64)
/* 000F6C 01DACC6C 34D223AC */  sw          $3, %lo(EdEventInfo + 0x64)($1)
/* 000F70 01DACC70 02000224 */  addiu       $2, $0, 0x2
/* 000F74 01DACC74 F08A82AF */  sw          $2, -0x7510($28)
/* 000F78 01DACC78 BC9C80AF */  sw          $0, -0x6344($28)
/* 000F7C 01DACC7C B89C80AF */  sw          $0, -0x6348($28)
/* 000F80 01DACC80 0043023C */  lui         $2, (0x43000000 >> 16)
/* 000F84 01DACC84 00608244 */  mtc1        $2, $f12
/* 000F88 01DACC88 DC01023C */  lui         $2, %hi(DispFade__3)
/* 000F8C 01DACC8C D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 000F90 01DACC90 94F9040C */  jal         FadeInit__9CDispCtrlFf
/* 000F94 01DACC94 00000000 */   nop
/* 000F98 01DACC98 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 000F9C 01DACC9C 00608244 */  mtc1        $2, $f12
/* 000FA0 01DACCA0 DC01023C */  lui         $2, %hi(DispFade__3)
/* 000FA4 01DACCA4 D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 000FA8 01DACCA8 8CF9040C */  jal         FadeInStart__9CDispCtrlFf
/* 000FAC 01DACCAC 00000000 */   nop
/* 000FB0 01DACCB0 9886838F */  lw          $3, -0x7968($28)
/* 000FB4 01DACCB4 01000224 */  addiu       $2, $0, 0x1
/* 000FB8 01DACCB8 0B006210 */  beq         $3, $2, .L01DACCE8_2E82E8
/* 000FBC 01DACCBC 00000000 */   nop
/* 000FC0 01DACCC0 03006010 */  beqz        $3, .L01DACCD0_2E82D0
/* 000FC4 01DACCC4 00000000 */   nop
/* 000FC8 01DACCC8 07000010 */  b           .L01DACCE8_2E82E8
/* 000FCC 01DACCCC 00000000 */   nop
.L01DACCD0_2E82D0:
/* 000FD0 01DACCD0 20000224 */  addiu       $2, $0, 0x20
/* 000FD4 01DACCD4 9C9C82AF */  sw          $2, -0x6364($28)
/* 000FD8 01DACCD8 40000224 */  addiu       $2, $0, 0x40
/* 000FDC 01DACCDC A09C82AF */  sw          $2, -0x6360($28)
/* 000FE0 01DACCE0 05000010 */  b           .L01DACCF8_2E82F8
/* 000FE4 01DACCE4 00000000 */   nop
.L01DACCE8_2E82E8:
/* 000FE8 01DACCE8 40000224 */  addiu       $2, $0, 0x40
/* 000FEC 01DACCEC 9C9C82AF */  sw          $2, -0x6364($28)
/* 000FF0 01DACCF0 20000224 */  addiu       $2, $0, 0x20
/* 000FF4 01DACCF4 A09C82AF */  sw          $2, -0x6360($28)
.L01DACCF8_2E82F8:
/* 000FF8 01DACCF8 EB01023C */  lui         $2, %hi(DngMes1)
/* 000FFC 01DACCFC 20644424 */  addiu       $4, $2, %lo(DngMes1)
/* 001000 01DACD00 01000524 */  addiu       $5, $0, 0x1
/* 001004 01DACD04 9836050C */  jal         Preset__6ClsMesFi
/* 001008 01DACD08 00000000 */   nop
/* 00100C 01DACD0C EB01013C */  lui         $1, %hi(DngMes1 + 0x16C4)
/* 001010 01DACD10 E47A20AC */  sw          $0, %lo(DngMes1 + 0x16C4)($1)
/* 001014 01DACD14 01000524 */  addiu       $5, $0, 0x1
/* 001018 01DACD18 EB01013C */  lui         $1, %hi(DngMes1 + 0x16CC)
/* 00101C 01DACD1C EC7A25AC */  sw          $5, %lo(DngMes1 + 0x16CC)($1)
/* 001020 01DACD20 1A000224 */  addiu       $2, $0, 0x1A
/* 001024 01DACD24 EB01013C */  lui         $1, %hi(DngMes1 + 0x174C)
/* 001028 01DACD28 6C7B22AC */  sw          $2, %lo(DngMes1 + 0x174C)($1)
/* 00102C 01DACD2C EB01013C */  lui         $1, %hi(DngMes1 + 0x98)
/* 001030 01DACD30 B86425AC */  sw          $5, %lo(DngMes1 + 0x98)($1)
/* 001034 01DACD34 0F000224 */  addiu       $2, $0, 0xF
/* 001038 01DACD38 EB01013C */  lui         $1, %hi(DngMes1 + 0x10)
/* 00103C 01DACD3C 306422AC */  sw          $2, %lo(DngMes1 + 0x10)($1)
/* 001040 01DACD40 03000224 */  addiu       $2, $0, 0x3
/* 001044 01DACD44 EB01013C */  lui         $1, %hi(DngMes1 + 0x14)
/* 001048 01DACD48 346422AC */  sw          $2, %lo(DngMes1 + 0x14)($1)
/* 00104C 01DACD4C 30000224 */  addiu       $2, $0, 0x30
/* 001050 01DACD50 EB01013C */  lui         $1, %hi(DngMes1)
/* 001054 01DACD54 206422AC */  sw          $2, %lo(DngMes1)($1)
/* 001058 01DACD58 70010224 */  addiu       $2, $0, 0x170
/* 00105C 01DACD5C EB01013C */  lui         $1, %hi(DngMes1 + 0x4)
/* 001060 01DACD60 246422AC */  sw          $2, %lo(DngMes1 + 0x4)($1)
/* 001064 01DACD64 0B000224 */  addiu       $2, $0, 0xB
/* 001068 01DACD68 EB01013C */  lui         $1, %hi(DngMes1 + 0x8)
/* 00106C 01DACD6C 286422AC */  sw          $2, %lo(DngMes1 + 0x8)($1)
/* 001070 01DACD70 16000224 */  addiu       $2, $0, 0x16
/* 001074 01DACD74 EB01013C */  lui         $1, %hi(DngMes1 + 0xC)
/* 001078 01DACD78 2C6422AC */  sw          $2, %lo(DngMes1 + 0xC)($1)
/* 00107C 01DACD7C EB01013C */  lui         $1, %hi(DngMes1 + 0x16C0)
/* 001080 01DACD80 E07A20AC */  sw          $0, %lo(DngMes1 + 0x16C0)($1)
/* 001084 01DACD84 D001023C */  lui         $2, %hi(MesWinTexBuff_01)
/* 001088 01DACD88 408B4224 */  addiu       $2, $2, %lo(MesWinTexBuff_01)
/* 00108C 01DACD8C EB01013C */  lui         $1, %hi(DngMes1 + 0x17B0)
/* 001090 01DACD90 D07B22AC */  sw          $2, %lo(DngMes1 + 0x17B0)($1)
/* 001094 01DACD94 EB01023C */  lui         $2, %hi(DngMes2)
/* 001098 01DACD98 E07B4424 */  addiu       $4, $2, %lo(DngMes2)
/* 00109C 01DACD9C 9836050C */  jal         Preset__6ClsMesFi
/* 0010A0 01DACDA0 00000000 */   nop
/* 0010A4 01DACDA4 EC01013C */  lui         $1, %hi(DngMes2 + 0x16C4)
/* 0010A8 01DACDA8 A49220AC */  sw          $0, %lo(DngMes2 + 0x16C4)($1)
/* 0010AC 01DACDAC 01000324 */  addiu       $3, $0, 0x1
/* 0010B0 01DACDB0 EC01013C */  lui         $1, %hi(DngMes2 + 0x16CC)
/* 0010B4 01DACDB4 AC9223AC */  sw          $3, %lo(DngMes2 + 0x16CC)($1)
/* 0010B8 01DACDB8 1A000224 */  addiu       $2, $0, 0x1A
/* 0010BC 01DACDBC EC01013C */  lui         $1, %hi(DngMes2 + 0x174C)
/* 0010C0 01DACDC0 2C9322AC */  sw          $2, %lo(DngMes2 + 0x174C)($1)
/* 0010C4 01DACDC4 EB01013C */  lui         $1, %hi(DngMes2 + 0x98)
/* 0010C8 01DACDC8 787C20AC */  sw          $0, %lo(DngMes2 + 0x98)($1)
/* 0010CC 01DACDCC 0F000224 */  addiu       $2, $0, 0xF
/* 0010D0 01DACDD0 EB01013C */  lui         $1, %hi(DngMes2 + 0x10)
/* 0010D4 01DACDD4 F07B22AC */  sw          $2, %lo(DngMes2 + 0x10)($1)
/* 0010D8 01DACDD8 03000224 */  addiu       $2, $0, 0x3
/* 0010DC 01DACDDC EB01013C */  lui         $1, %hi(DngMes2 + 0x14)
/* 0010E0 01DACDE0 F47B22AC */  sw          $2, %lo(DngMes2 + 0x14)($1)
/* 0010E4 01DACDE4 40010224 */  addiu       $2, $0, 0x140
/* 0010E8 01DACDE8 EB01013C */  lui         $1, %hi(DngMes2)
/* 0010EC 01DACDEC E07B22AC */  sw          $2, %lo(DngMes2)($1)
/* 0010F0 01DACDF0 5A010224 */  addiu       $2, $0, 0x15A
/* 0010F4 01DACDF4 EB01013C */  lui         $1, %hi(DngMes2 + 0x4)
/* 0010F8 01DACDF8 E47B22AC */  sw          $2, %lo(DngMes2 + 0x4)($1)
/* 0010FC 01DACDFC 0B000224 */  addiu       $2, $0, 0xB
/* 001100 01DACE00 EB01013C */  lui         $1, %hi(DngMes2 + 0x8)
/* 001104 01DACE04 E87B22AC */  sw          $2, %lo(DngMes2 + 0x8)($1)
/* 001108 01DACE08 16000224 */  addiu       $2, $0, 0x16
/* 00110C 01DACE0C EB01013C */  lui         $1, %hi(DngMes2 + 0xC)
/* 001110 01DACE10 EC7B22AC */  sw          $2, %lo(DngMes2 + 0xC)($1)
/* 001114 01DACE14 D001023C */  lui         $2, %hi(MesWinTexBuff_02)
/* 001118 01DACE18 408C4224 */  addiu       $2, $2, %lo(MesWinTexBuff_02)
/* 00111C 01DACE1C EC01013C */  lui         $1, %hi(DngMes2 + 0x17B0)
/* 001120 01DACE20 909322AC */  sw          $2, %lo(DngMes2 + 0x17B0)($1)
/* 001124 01DACE24 46000224 */  addiu       $2, $0, 0x46
/* 001128 01DACE28 EC01013C */  lui         $1, %hi(DngMesStb + 0x18)
/* 00112C 01DACE2C B89322AC */  sw          $2, %lo(DngMesStb + 0x18)($1)
/* 001130 01DACE30 0A000224 */  addiu       $2, $0, 0xA
/* 001134 01DACE34 EC01013C */  lui         $1, %hi(DngMesStb + 0x1C)
/* 001138 01DACE38 BC9322AC */  sw          $2, %lo(DngMesStb + 0x1C)($1)
/* 00113C 01DACE3C EC01013C */  lui         $1, %hi(DngMesStb + 0x20)
/* 001140 01DACE40 C09320AC */  sw          $0, %lo(DngMesStb + 0x20)($1)
/* 001144 01DACE44 EC01013C */  lui         $1, %hi(DngMesStb + 0x24)
/* 001148 01DACE48 C49320AC */  sw          $0, %lo(DngMesStb + 0x24)($1)
/* 00114C 01DACE4C EC01013C */  lui         $1, %hi(DngMesStb + 0x28)
/* 001150 01DACE50 C89320AC */  sw          $0, %lo(DngMesStb + 0x28)($1)
/* 001154 01DACE54 EC01013C */  lui         $1, %hi(DngMesStb + 0x90)
/* 001158 01DACE58 309420AC */  sw          $0, %lo(DngMesStb + 0x90)($1)
/* 00115C 01DACE5C EC01013C */  lui         $1, %hi(DngMesStb + 0x94)
/* 001160 01DACE60 349423AC */  sw          $3, %lo(DngMesStb + 0x94)($1)
/* 001164 01DACE64 EC01013C */  lui         $1, %hi(DngMesStb + 0xA8)
/* 001168 01DACE68 489420C4 */  lwc1        $f0, %lo(DngMesStb + 0xA8)($1)
/* 00116C 01DACE6C EC01013C */  lui         $1, %hi(DngMesStb + 0xA4)
/* 001170 01DACE70 449420E4 */  swc1        $f0, %lo(DngMesStb + 0xA4)($1)
/* 001174 01DACE74 EC01013C */  lui         $1, %hi(DngMesStb + 0xAC)
/* 001178 01DACE78 4C9420AC */  sw          $0, %lo(DngMesStb + 0xAC)($1)
/* 00117C 01DACE7C EC01013C */  lui         $1, %hi(DngMesStb + 0xB4)
/* 001180 01DACE80 549420AC */  sw          $0, %lo(DngMesStb + 0xB4)($1)
/* 001184 01DACE84 EC01013C */  lui         $1, %hi(DngMesStb + 0xB8)
/* 001188 01DACE88 589420AC */  sw          $0, %lo(DngMesStb + 0xB8)($1)
/* 00118C 01DACE8C EC01013C */  lui         $1, %hi(DngMesStb + 0xBC)
/* 001190 01DACE90 5C9420AC */  sw          $0, %lo(DngMesStb + 0xBC)($1)
/* 001194 01DACE94 EC01013C */  lui         $1, %hi(DngMesStb + 0xC0)
/* 001198 01DACE98 609420AC */  sw          $0, %lo(DngMesStb + 0xC0)($1)
/* 00119C 01DACE9C EC01023C */  lui         $2, %hi(DngMesStb)
/* 0011A0 01DACEA0 A0934424 */  addiu       $4, $2, %lo(DngMesStb)
/* 0011A4 01DACEA4 643D050C */  jal         InitMesWinTbl__6ClsMesFv
/* 0011A8 01DACEA8 00000000 */   nop
/* 0011AC 01DACEAC EC01013C */  lui         $1, %hi(DngMesStb + 0x16A8)
/* 0011B0 01DACEB0 48AA228C */  lw          $2, %lo(DngMesStb + 0x16A8)($1)
/* 0011B4 01DACEB4 EC01013C */  lui         $1, %hi(DngMesStb + 0x16AC)
/* 0011B8 01DACEB8 4CAA22AC */  sw          $2, %lo(DngMesStb + 0x16AC)($1)
/* 0011BC 01DACEBC EC01013C */  lui         $1, %hi(DngMesStb + 0x16B0)
/* 0011C0 01DACEC0 50AA20AC */  sw          $0, %lo(DngMesStb + 0x16B0)($1)
/* 0011C4 01DACEC4 EC01013C */  lui         $1, %hi(DngMesStb + 0x16B4)
/* 0011C8 01DACEC8 54AA20AC */  sw          $0, %lo(DngMesStb + 0x16B4)($1)
/* 0011CC 01DACECC EC01013C */  lui         $1, %hi(DngMesStb + 0x16B8)
/* 0011D0 01DACED0 58AA20AC */  sw          $0, %lo(DngMesStb + 0x16B8)($1)
/* 0011D4 01DACED4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0011D8 01DACED8 EC01013C */  lui         $1, %hi(DngMesStb + 0x16BC)
/* 0011DC 01DACEDC 5CAA22AC */  sw          $2, %lo(DngMesStb + 0x16BC)($1)
/* 0011E0 01DACEE0 80000224 */  addiu       $2, $0, 0x80
/* 0011E4 01DACEE4 EC01013C */  lui         $1, %hi(DngMesStb + 0x16D4)
/* 0011E8 01DACEE8 74AA22AC */  sw          $2, %lo(DngMesStb + 0x16D4)($1)
/* 0011EC 01DACEEC 282E0070 */  paddub      $5, $0, $0
/* 0011F0 01DACEF0 08000010 */  b           .L01DACF14_2E8514
/* 0011F4 01DACEF4 00000000 */   nop
.L01DACEF8_2E84F8:
/* 0011F8 01DACEF8 FFFF0424 */  addiu       $4, $0, -0x1
/* 0011FC 01DACEFC 80180500 */  sll         $3, $5, 2
/* 001200 01DACF00 EC01023C */  lui         $2, %hi(DngMesStb + 0x16E0)
/* 001204 01DACF04 80AA4224 */  addiu       $2, $2, %lo(DngMesStb + 0x16E0)
/* 001208 01DACF08 21104300 */  addu        $2, $2, $3
/* 00120C 01DACF0C 000044AC */  sw          $4, 0x0($2)
/* 001210 01DACF10 0100A524 */  addiu       $5, $5, 0x1
.L01DACF14_2E8514:
/* 001214 01DACF14 0A00A228 */  slti        $2, $5, 0xA
/* 001218 01DACF18 F7FF4014 */  bnez        $2, .L01DACEF8_2E84F8
/* 00121C 01DACF1C 00000000 */   nop
/* 001220 01DACF20 28260070 */  paddub      $4, $0, $0
/* 001224 01DACF24 07000010 */  b           .L01DACF44_2E8544
/* 001228 01DACF28 00000000 */   nop
.L01DACF2C_2E852C:
/* 00122C 01DACF2C 80180400 */  sll         $3, $4, 2
/* 001230 01DACF30 EC01023C */  lui         $2, %hi(DngMesStb + 0x1708)
/* 001234 01DACF34 A8AA4224 */  addiu       $2, $2, %lo(DngMesStb + 0x1708)
/* 001238 01DACF38 21104300 */  addu        $2, $2, $3
/* 00123C 01DACF3C 000040AC */  sw          $0, 0x0($2)
/* 001240 01DACF40 01008424 */  addiu       $4, $4, 0x1
.L01DACF44_2E8544:
/* 001244 01DACF44 08008228 */  slti        $2, $4, 0x8
/* 001248 01DACF48 F8FF4014 */  bnez        $2, .L01DACF2C_2E852C
/* 00124C 01DACF4C 00000000 */   nop
/* 001250 01DACF50 EC01013C */  lui         $1, %hi(DngMesStb + 0x1728)
/* 001254 01DACF54 C8AA20AC */  sw          $0, %lo(DngMesStb + 0x1728)($1)
/* 001258 01DACF58 EC01013C */  lui         $1, %hi(DngMesStb + 0x172C)
/* 00125C 01DACF5C CCAA20AC */  sw          $0, %lo(DngMesStb + 0x172C)($1)
/* 001260 01DACF60 01000224 */  addiu       $2, $0, 0x1
/* 001264 01DACF64 EC01013C */  lui         $1, %hi(DngMesStb + 0x1730)
/* 001268 01DACF68 D0AA22AC */  sw          $2, %lo(DngMesStb + 0x1730)($1)
/* 00126C 01DACF6C EC01013C */  lui         $1, %hi(DngMesStb + 0x1734)
/* 001270 01DACF70 D4AA20AC */  sw          $0, %lo(DngMesStb + 0x1734)($1)
/* 001274 01DACF74 FFFF0224 */  addiu       $2, $0, -0x1
/* 001278 01DACF78 EC01013C */  lui         $1, %hi(DngMesStb + 0x1738)
/* 00127C 01DACF7C D8AA22AC */  sw          $2, %lo(DngMesStb + 0x1738)($1)
/* 001280 01DACF80 EC01013C */  lui         $1, %hi(DngMesStb + 0x173C)
/* 001284 01DACF84 DCAA22AC */  sw          $2, %lo(DngMesStb + 0x173C)($1)
/* 001288 01DACF88 EC01013C */  lui         $1, %hi(DngMesStb + 0x1740)
/* 00128C 01DACF8C E0AA22AC */  sw          $2, %lo(DngMesStb + 0x1740)($1)
/* 001290 01DACF90 EC01013C */  lui         $1, %hi(DngMesStb + 0x1744)
/* 001294 01DACF94 E4AA20AC */  sw          $0, %lo(DngMesStb + 0x1744)($1)
/* 001298 01DACF98 EC01013C */  lui         $1, %hi(DngMesStb + 0x1748)
/* 00129C 01DACF9C E8AA20AC */  sw          $0, %lo(DngMesStb + 0x1748)($1)
/* 0012A0 01DACFA0 28260070 */  paddub      $4, $0, $0
/* 0012A4 01DACFA4 0C000010 */  b           .L01DACFD8_2E85D8
/* 0012A8 01DACFA8 00000000 */   nop
.L01DACFAC_2E85AC:
/* 0012AC 01DACFAC FFFF0324 */  addiu       $3, $0, -0x1
/* 0012B0 01DACFB0 C0280400 */  sll         $5, $4, 3
/* 0012B4 01DACFB4 EC01023C */  lui         $2, %hi(DngMesStb + 0x1750)
/* 0012B8 01DACFB8 F0AA4224 */  addiu       $2, $2, %lo(DngMesStb + 0x1750)
/* 0012BC 01DACFBC 21104500 */  addu        $2, $2, $5
/* 0012C0 01DACFC0 000043AC */  sw          $3, 0x0($2)
/* 0012C4 01DACFC4 EC01023C */  lui         $2, %hi(DngMesStb + 0x1754)
/* 0012C8 01DACFC8 F4AA4224 */  addiu       $2, $2, %lo(DngMesStb + 0x1754)
/* 0012CC 01DACFCC 21104500 */  addu        $2, $2, $5
/* 0012D0 01DACFD0 000043AC */  sw          $3, 0x0($2)
/* 0012D4 01DACFD4 01008424 */  addiu       $4, $4, 0x1
.L01DACFD8_2E85D8:
/* 0012D8 01DACFD8 0A008228 */  slti        $2, $4, 0xA
/* 0012DC 01DACFDC F3FF4014 */  bnez        $2, .L01DACFAC_2E85AC
/* 0012E0 01DACFE0 00000000 */   nop
/* 0012E4 01DACFE4 EC01023C */  lui         $2, %hi(DngMesStb)
/* 0012E8 01DACFE8 A0934424 */  addiu       $4, $2, %lo(DngMesStb)
/* 0012EC 01DACFEC 04000524 */  addiu       $5, $0, 0x4
/* 0012F0 01DACFF0 9836050C */  jal         Preset__6ClsMesFi
/* 0012F4 01DACFF4 00000000 */   nop
/* 0012F8 01DACFF8 15000224 */  addiu       $2, $0, 0x15
/* 0012FC 01DACFFC EC01013C */  lui         $1, %hi(DngMesStb + 0x10)
/* 001300 01DAD000 B09322AC */  sw          $2, %lo(DngMesStb + 0x10)($1)
/* 001304 01DAD004 04000224 */  addiu       $2, $0, 0x4
/* 001308 01DAD008 EC01013C */  lui         $1, %hi(DngMesStb + 0x14)
/* 00130C 01DAD00C B49322AC */  sw          $2, %lo(DngMesStb + 0x14)($1)
/* 001310 01DAD010 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 001314 01DAD014 EC01013C */  lui         $1, %hi(DngMesStb + 0xA4)
/* 001318 01DAD018 449422AC */  sw          $2, %lo(DngMesStb + 0xA4)($1)
/* 00131C 01DAD01C EC01013C */  lui         $1, %hi(DngMesStb + 0xA8)
/* 001320 01DAD020 489422AC */  sw          $2, %lo(DngMesStb + 0xA8)($1)
/* 001324 01DAD024 EC01013C */  lui         $1, %hi(DngMesStb + 0x8C)
/* 001328 01DAD028 2C9422AC */  sw          $2, %lo(DngMesStb + 0x8C)($1)
/* 00132C 01DAD02C EC01013C */  lui         $1, %hi(DngMesStb + 0x16C4)
/* 001330 01DAD030 64AA20AC */  sw          $0, %lo(DngMesStb + 0x16C4)($1)
/* 001334 01DAD034 1A000224 */  addiu       $2, $0, 0x1A
/* 001338 01DAD038 EC01013C */  lui         $1, %hi(DngMesStb + 0x174C)
/* 00133C 01DAD03C ECAA22AC */  sw          $2, %lo(DngMesStb + 0x174C)($1)
/* 001340 01DAD040 EC01013C */  lui         $1, %hi(DngMesStb + 0x58)
/* 001344 01DAD044 F89320AC */  sw          $0, %lo(DngMesStb + 0x58)($1)
/* 001348 01DAD048 BF80023C */  lui         $2, (0x80BFBFBF >> 16)
/* 00134C 01DAD04C BFBF4434 */  ori         $4, $2, (0x80BFBFBF & 0xFFFF)
/* 001350 01DAD050 8432050C */  jal         Color2Clut__FUi
/* 001354 01DAD054 00000000 */   nop
/* 001358 01DAD058 FF004230 */  andi        $2, $2, 0xFF
/* 00135C 01DAD05C EC01013C */  lui         $1, %hi(DngMesStb + 0x16AC)
/* 001360 01DAD060 4CAA22AC */  sw          $2, %lo(DngMesStb + 0x16AC)($1)
/* 001364 01DAD064 0F000224 */  addiu       $2, $0, 0xF
/* 001368 01DAD068 EC01013C */  lui         $1, %hi(DngMesStb + 0x10)
/* 00136C 01DAD06C B09322AC */  sw          $2, %lo(DngMesStb + 0x10)($1)
/* 001370 01DAD070 0C000624 */  addiu       $6, $0, 0xC
/* 001374 01DAD074 EC01013C */  lui         $1, %hi(DngMesStb + 0x8)
/* 001378 01DAD078 A89326AC */  sw          $6, %lo(DngMesStb + 0x8)($1)
/* 00137C 01DAD07C 18000524 */  addiu       $5, $0, 0x18
/* 001380 01DAD080 EC01013C */  lui         $1, %hi(DngMesStb + 0xC)
/* 001384 01DAD084 AC9325AC */  sw          $5, %lo(DngMesStb + 0xC)($1)
/* 001388 01DAD088 D001023C */  lui         $2, %hi(MesWinTexBuff_11)
/* 00138C 01DAD08C 408D4224 */  addiu       $2, $2, %lo(MesWinTexBuff_11)
/* 001390 01DAD090 EC01013C */  lui         $1, %hi(DngMesStb + 0x17B0)
/* 001394 01DAD094 50AB22AC */  sw          $2, %lo(DngMesStb + 0x17B0)($1)
/* 001398 01DAD098 EC01013C */  lui         $1, %hi(BtEventMes0 + 0x8)
/* 00139C 01DAD09C 68AB26AC */  sw          $6, %lo(BtEventMes0 + 0x8)($1)
/* 0013A0 01DAD0A0 14000224 */  addiu       $2, $0, 0x14
/* 0013A4 01DAD0A4 EC01013C */  lui         $1, %hi(BtEventMes0 + 0xC)
/* 0013A8 01DAD0A8 6CAB22AC */  sw          $2, %lo(BtEventMes0 + 0xC)($1)
/* 0013AC 01DAD0AC 15000224 */  addiu       $2, $0, 0x15
/* 0013B0 01DAD0B0 EC01013C */  lui         $1, %hi(BtEventMes0 + 0x10)
/* 0013B4 01DAD0B4 70AB22AC */  sw          $2, %lo(BtEventMes0 + 0x10)($1)
/* 0013B8 01DAD0B8 04000224 */  addiu       $2, $0, 0x4
/* 0013BC 01DAD0BC EC01013C */  lui         $1, %hi(BtEventMes0 + 0x14)
/* 0013C0 01DAD0C0 74AB22AC */  sw          $2, %lo(BtEventMes0 + 0x14)($1)
/* 0013C4 01DAD0C4 7C8081C7 */  lwc1        $f1, -0x7F84($28)
/* 0013C8 01DAD0C8 EC01013C */  lui         $1, %hi(BtEventMes0 + 0xA4)
/* 0013CC 01DAD0CC 04AC21E4 */  swc1        $f1, %lo(BtEventMes0 + 0xA4)($1)
/* 0013D0 01DAD0D0 EC01013C */  lui         $1, %hi(BtEventMes0 + 0xA8)
/* 0013D4 01DAD0D4 08AC21E4 */  swc1        $f1, %lo(BtEventMes0 + 0xA8)($1)
/* 0013D8 01DAD0D8 1A000424 */  addiu       $4, $0, 0x1A
/* 0013DC 01DAD0DC EC01013C */  lui         $1, %hi(BtEventMes0 + 0x174C)
/* 0013E0 01DAD0E0 ACC224AC */  sw          $4, %lo(BtEventMes0 + 0x174C)($1)
/* 0013E4 01DAD0E4 EC01013C */  lui         $1, %hi(BtEventMes0 + 0x16C0)
/* 0013E8 01DAD0E8 20C220AC */  sw          $0, %lo(BtEventMes0 + 0x16C0)($1)
/* 0013EC 01DAD0EC EC01013C */  lui         $1, %hi(BtEventMes0 + 0x16C4)
/* 0013F0 01DAD0F0 24C220AC */  sw          $0, %lo(BtEventMes0 + 0x16C4)($1)
/* 0013F4 01DAD0F4 01000324 */  addiu       $3, $0, 0x1
/* 0013F8 01DAD0F8 EC01013C */  lui         $1, %hi(BtEventMes0 + 0x16CC)
/* 0013FC 01DAD0FC 2CC223AC */  sw          $3, %lo(BtEventMes0 + 0x16CC)($1)
/* 001400 01DAD100 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 001404 01DAD104 EC01013C */  lui         $1, %hi(BtEventMes0 + 0x8C)
/* 001408 01DAD108 ECAB20E4 */  swc1        $f0, %lo(BtEventMes0 + 0x8C)($1)
/* 00140C 01DAD10C EC01013C */  lui         $1, %hi(BtEventMes0 + 0x16C4)
/* 001410 01DAD110 24C223AC */  sw          $3, %lo(BtEventMes0 + 0x16C4)($1)
/* 001414 01DAD114 D001023C */  lui         $2, %hi(MesWinTexBuff_01)
/* 001418 01DAD118 408B4224 */  addiu       $2, $2, %lo(MesWinTexBuff_01)
/* 00141C 01DAD11C EC01013C */  lui         $1, %hi(BtEventMes0 + 0x17B0)
/* 001420 01DAD120 10C322AC */  sw          $2, %lo(BtEventMes0 + 0x17B0)($1)
/* 001424 01DAD124 16000224 */  addiu       $2, $0, 0x16
/* 001428 01DAD128 EC01013C */  lui         $1, %hi(BtEventMes1 + 0x10)
/* 00142C 01DAD12C 30C322AC */  sw          $2, %lo(BtEventMes1 + 0x10)($1)
/* 001430 01DAD130 05000224 */  addiu       $2, $0, 0x5
/* 001434 01DAD134 EC01013C */  lui         $1, %hi(BtEventMes1 + 0x14)
/* 001438 01DAD138 34C322AC */  sw          $2, %lo(BtEventMes1 + 0x14)($1)
/* 00143C 01DAD13C EC01013C */  lui         $1, %hi(BtEventMes1 + 0x8)
/* 001440 01DAD140 28C326AC */  sw          $6, %lo(BtEventMes1 + 0x8)($1)
/* 001444 01DAD144 EC01013C */  lui         $1, %hi(BtEventMes1 + 0xC)
/* 001448 01DAD148 2CC325AC */  sw          $5, %lo(BtEventMes1 + 0xC)($1)
/* 00144C 01DAD14C EC01013C */  lui         $1, %hi(BtEventMes1 + 0xA4)
/* 001450 01DAD150 C4C321E4 */  swc1        $f1, %lo(BtEventMes1 + 0xA4)($1)
/* 001454 01DAD154 EC01013C */  lui         $1, %hi(BtEventMes1 + 0xA8)
/* 001458 01DAD158 C8C321E4 */  swc1        $f1, %lo(BtEventMes1 + 0xA8)($1)
/* 00145C 01DAD15C EC01013C */  lui         $1, %hi(BtEventMes1 + 0x174C)
/* 001460 01DAD160 6CDA24AC */  sw          $4, %lo(BtEventMes1 + 0x174C)($1)
/* 001464 01DAD164 EC01013C */  lui         $1, %hi(BtEventMes1 + 0x16C0)
/* 001468 01DAD168 E0D920AC */  sw          $0, %lo(BtEventMes1 + 0x16C0)($1)
/* 00146C 01DAD16C EC01013C */  lui         $1, %hi(BtEventMes1 + 0x16C4)
/* 001470 01DAD170 E4D920AC */  sw          $0, %lo(BtEventMes1 + 0x16C4)($1)
/* 001474 01DAD174 EC01013C */  lui         $1, %hi(BtEventMes1 + 0x16CC)
/* 001478 01DAD178 ECD923AC */  sw          $3, %lo(BtEventMes1 + 0x16CC)($1)
/* 00147C 01DAD17C EC01013C */  lui         $1, %hi(BtEventMes1 + 0x8C)
/* 001480 01DAD180 ACC320E4 */  swc1        $f0, %lo(BtEventMes1 + 0x8C)($1)
/* 001484 01DAD184 EC01013C */  lui         $1, %hi(BtEventMes1 + 0x16C4)
/* 001488 01DAD188 E4D923AC */  sw          $3, %lo(BtEventMes1 + 0x16C4)($1)
/* 00148C 01DAD18C D001023C */  lui         $2, %hi(MesWinTexBuff_02)
/* 001490 01DAD190 408C4224 */  addiu       $2, $2, %lo(MesWinTexBuff_02)
/* 001494 01DAD194 EC01013C */  lui         $1, %hi(BtEventMes1 + 0x17B0)
/* 001498 01DAD198 D0DA22AC */  sw          $2, %lo(BtEventMes1 + 0x17B0)($1)
/* 00149C 01DAD19C F001013C */  lui         $1, %hi(BtMesBuffer + 0x8)
/* 0014A0 01DAD1A0 A866228C */  lw          $2, %lo(BtMesBuffer + 0x8)($1)
/* 0014A4 01DAD1A4 00190200 */  sll         $3, $2, 4
/* 0014A8 01DAD1A8 F001013C */  lui         $1, %hi(BtMesBuffer)
/* 0014AC 01DAD1AC A066228C */  lw          $2, %lo(BtMesBuffer)($1)
/* 0014B0 01DAD1B0 21804300 */  addu        $16, $2, $3
/* 0014B4 01DAD1B4 2000A427 */  addiu       $4, $29, 0x20
/* 0014B8 01DAD1B8 DC01023C */  lui         $2, %hi(LIT_914__5)
/* 0014BC 01DAD1BC A02D4524 */  addiu       $5, $2, %lo(LIT_914__5)
/* 0014C0 01DAD1C0 9886868F */  lw          $6, -0x7968($28)
/* 0014C4 01DAD1C4 1614040C */  jal         sprintf
/* 0014C8 01DAD1C8 00000000 */   nop
/* 0014CC 01DAD1CC 2000A427 */  addiu       $4, $29, 0x20
/* 0014D0 01DAD1D0 282E0072 */  paddub      $5, $16, $0
/* 0014D4 01DAD1D4 8C00A627 */  addiu       $6, $29, 0x8C
/* 0014D8 01DAD1D8 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0014DC 01DAD1DC 00000000 */   nop
/* 0014E0 01DAD1E0 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0014E4 01DAD1E4 00000000 */   nop
/* 0014E8 01DAD1E8 EB01023C */  lui         $2, %hi(DngMes1)
/* 0014EC 01DAD1EC 20644424 */  addiu       $4, $2, %lo(DngMes1)
/* 0014F0 01DAD1F0 282E0072 */  paddub      $5, $16, $0
/* 0014F4 01DAD1F4 8036050C */  jal         SetBuff__6ClsMesFPs
/* 0014F8 01DAD1F8 00000000 */   nop
/* 0014FC 01DAD1FC EB01023C */  lui         $2, %hi(DngMes2)
/* 001500 01DAD200 E07B4424 */  addiu       $4, $2, %lo(DngMes2)
/* 001504 01DAD204 282E0072 */  paddub      $5, $16, $0
/* 001508 01DAD208 8036050C */  jal         SetBuff__6ClsMesFPs
/* 00150C 01DAD20C 00000000 */   nop
/* 001510 01DAD210 EB01023C */  lui         $2, %hi(DngMes2)
/* 001514 01DAD214 E07B4424 */  addiu       $4, $2, %lo(DngMes2)
/* 001518 01DAD218 282E0072 */  paddub      $5, $16, $0
/* 00151C 01DAD21C D001023C */  lui         $2, %hi(MesWinTexBuff_02)
/* 001520 01DAD220 408C4624 */  addiu       $6, $2, %lo(MesWinTexBuff_02)
/* 001524 01DAD224 E03A080C */  jal         MonsterNameInit__FP6ClsMesPsPUc
/* 001528 01DAD228 00000000 */   nop
/* 00152C 01DAD22C EC01023C */  lui         $2, %hi(BtEventMes0)
/* 001530 01DAD230 60AB4424 */  addiu       $4, $2, %lo(BtEventMes0)
/* 001534 01DAD234 282E0072 */  paddub      $5, $16, $0
/* 001538 01DAD238 8036050C */  jal         SetBuff__6ClsMesFPs
/* 00153C 01DAD23C 00000000 */   nop
/* 001540 01DAD240 8C00A28F */  lw          $2, 0x8C($29)
/* 001544 01DAD244 83110200 */  sra         $2, $2, 6
/* 001548 01DAD248 01004224 */  addiu       $2, $2, 0x1
/* 00154C 01DAD24C 80110200 */  sll         $2, $2, 6
/* 001550 01DAD250 03290200 */  sra         $5, $2, 4
/* 001554 01DAD254 F001023C */  lui         $2, %hi(BtMesBuffer)
/* 001558 01DAD258 A0664424 */  addiu       $4, $2, %lo(BtMesBuffer)
/* 00155C 01DAD25C 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 001560 01DAD260 00000000 */   nop
/* 001564 01DAD264 F001023C */  lui         $2, %hi(BtMesBuffer)
/* 001568 01DAD268 A0664424 */  addiu       $4, $2, %lo(BtMesBuffer)
/* 00156C 01DAD26C 609E040C */  jal         Align64__14CDataAlloc2_1_Fv
/* 001570 01DAD270 00000000 */   nop
/* 001574 01DAD274 F001013C */  lui         $1, %hi(BtMesBuffer + 0x8)
/* 001578 01DAD278 A866228C */  lw          $2, %lo(BtMesBuffer + 0x8)($1)
/* 00157C 01DAD27C 00190200 */  sll         $3, $2, 4
/* 001580 01DAD280 F001013C */  lui         $1, %hi(BtMesBuffer)
/* 001584 01DAD284 A066228C */  lw          $2, %lo(BtMesBuffer)($1)
/* 001588 01DAD288 21804300 */  addu        $16, $2, $3
/* 00158C 01DAD28C 2000A427 */  addiu       $4, $29, 0x20
/* 001590 01DAD290 DC01023C */  lui         $2, %hi(LIT_915__4)
/* 001594 01DAD294 D02D4524 */  addiu       $5, $2, %lo(LIT_915__4)
/* 001598 01DAD298 9886868F */  lw          $6, -0x7968($28)
/* 00159C 01DAD29C 1614040C */  jal         sprintf
/* 0015A0 01DAD2A0 00000000 */   nop
/* 0015A4 01DAD2A4 2000A427 */  addiu       $4, $29, 0x20
/* 0015A8 01DAD2A8 282E0072 */  paddub      $5, $16, $0
/* 0015AC 01DAD2AC 8C00A627 */  addiu       $6, $29, 0x8C
/* 0015B0 01DAD2B0 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0015B4 01DAD2B4 00000000 */   nop
/* 0015B8 01DAD2B8 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0015BC 01DAD2BC 00000000 */   nop
/* 0015C0 01DAD2C0 EC01023C */  lui         $2, %hi(BtEventMes1)
/* 0015C4 01DAD2C4 20C34424 */  addiu       $4, $2, %lo(BtEventMes1)
/* 0015C8 01DAD2C8 282E0072 */  paddub      $5, $16, $0
/* 0015CC 01DAD2CC 8036050C */  jal         SetBuff__6ClsMesFPs
/* 0015D0 01DAD2D0 00000000 */   nop
/* 0015D4 01DAD2D4 8C00A28F */  lw          $2, 0x8C($29)
/* 0015D8 01DAD2D8 83110200 */  sra         $2, $2, 6
/* 0015DC 01DAD2DC 01004224 */  addiu       $2, $2, 0x1
/* 0015E0 01DAD2E0 80110200 */  sll         $2, $2, 6
/* 0015E4 01DAD2E4 03290200 */  sra         $5, $2, 4
/* 0015E8 01DAD2E8 F001023C */  lui         $2, %hi(BtMesBuffer)
/* 0015EC 01DAD2EC A0664424 */  addiu       $4, $2, %lo(BtMesBuffer)
/* 0015F0 01DAD2F0 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0015F4 01DAD2F4 00000000 */   nop
/* 0015F8 01DAD2F8 F001023C */  lui         $2, %hi(BtMesBuffer)
/* 0015FC 01DAD2FC A0664424 */  addiu       $4, $2, %lo(BtMesBuffer)
/* 001600 01DAD300 609E040C */  jal         Align64__14CDataAlloc2_1_Fv
/* 001604 01DAD304 00000000 */   nop
/* 001608 01DAD308 F001013C */  lui         $1, %hi(BtMesBuffer + 0x8)
/* 00160C 01DAD30C A866228C */  lw          $2, %lo(BtMesBuffer + 0x8)($1)
/* 001610 01DAD310 00190200 */  sll         $3, $2, 4
/* 001614 01DAD314 F001013C */  lui         $1, %hi(BtMesBuffer)
/* 001618 01DAD318 A066228C */  lw          $2, %lo(BtMesBuffer)($1)
/* 00161C 01DAD31C 21804300 */  addu        $16, $2, $3
/* 001620 01DAD320 DC01023C */  lui         $2, %hi(LIT_916__3)
/* 001624 01DAD324 002E4424 */  addiu       $4, $2, %lo(LIT_916__3)
/* 001628 01DAD328 282E0072 */  paddub      $5, $16, $0
/* 00162C 01DAD32C 8C00A627 */  addiu       $6, $29, 0x8C
/* 001630 01DAD330 D8FC040C */  jal         LoadFile__FPcPvPi
/* 001634 01DAD334 00000000 */   nop
/* 001638 01DAD338 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 00163C 01DAD33C 00000000 */   nop
/* 001640 01DAD340 8C00A28F */  lw          $2, 0x8C($29)
/* 001644 01DAD344 03110200 */  sra         $2, $2, 4
/* 001648 01DAD348 01004524 */  addiu       $5, $2, 0x1
/* 00164C 01DAD34C F001023C */  lui         $2, %hi(BtMesBuffer)
/* 001650 01DAD350 A0664424 */  addiu       $4, $2, %lo(BtMesBuffer)
/* 001654 01DAD354 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 001658 01DAD358 00000000 */   nop
/* 00165C 01DAD35C EB01023C */  lui         $2, %hi(DngMes1)
/* 001660 01DAD360 20644424 */  addiu       $4, $2, %lo(DngMes1)
/* 001664 01DAD364 388D858F */  lw          $5, -0x72C8($28)
/* 001668 01DAD368 8C36050C */  jal         SetBuff_system__6ClsMesFPs
/* 00166C 01DAD36C 00000000 */   nop
/* 001670 01DAD370 EB01023C */  lui         $2, %hi(DngMes2)
/* 001674 01DAD374 E07B4424 */  addiu       $4, $2, %lo(DngMes2)
/* 001678 01DAD378 388D858F */  lw          $5, -0x72C8($28)
/* 00167C 01DAD37C 8C36050C */  jal         SetBuff_system__6ClsMesFPs
/* 001680 01DAD380 00000000 */   nop
/* 001684 01DAD384 EC01023C */  lui         $2, %hi(BtEventMes0)
/* 001688 01DAD388 60AB4424 */  addiu       $4, $2, %lo(BtEventMes0)
/* 00168C 01DAD38C 282E0072 */  paddub      $5, $16, $0
/* 001690 01DAD390 8C36050C */  jal         SetBuff_system__6ClsMesFPs
/* 001694 01DAD394 00000000 */   nop
/* 001698 01DAD398 3480050C */  jal         ClearSystemMes__Fv
/* 00169C 01DAD39C 00000000 */   nop
/* 0016A0 01DAD3A0 FFFF0324 */  addiu       $3, $0, -0x1
/* 0016A4 01DAD3A4 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 0016A8 01DAD3A8 B47623AC */  sw          $3, %lo(DngMessMan + 0x24)($1)
/* 0016AC 01DAD3AC EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 0016B0 01DAD3B0 947620AC */  sw          $0, %lo(DngMessMan + 0x4)($1)
/* 0016B4 01DAD3B4 01000224 */  addiu       $2, $0, 0x1
/* 0016B8 01DAD3B8 EA01013C */  lui         $1, %hi(DngMessMan)
/* 0016BC 01DAD3BC 907622AC */  sw          $2, %lo(DngMessMan)($1)
/* 0016C0 01DAD3C0 909C83AF */  sw          $3, -0x6370($28)
/* 0016C4 01DAD3C4 949C83AF */  sw          $3, -0x636C($28)
/* 0016C8 01DAD3C8 EA01023C */  lui         $2, %hi(MainWeapon)
/* 0016CC 01DAD3CC 80404424 */  addiu       $4, $2, %lo(MainWeapon)
/* 0016D0 01DAD3D0 74E6040C */  jal         Initialize__10CCharacterFv
/* 0016D4 01DAD3D4 00000000 */   nop
/* 0016D8 01DAD3D8 EA01023C */  lui         $2, %hi(DefaultWeapon)
/* 0016DC 01DAD3DC 30524424 */  addiu       $4, $2, %lo(DefaultWeapon)
/* 0016E0 01DAD3E0 74E6040C */  jal         Initialize__10CCharacterFv
/* 0016E4 01DAD3E4 00000000 */   nop
/* 0016E8 01DAD3E8 EA01023C */  lui         $2, %hi(CrashWeapon)
/* 0016EC 01DAD3EC E0634424 */  addiu       $4, $2, %lo(CrashWeapon)
/* 0016F0 01DAD3F0 74E6040C */  jal         Initialize__10CCharacterFv
/* 0016F4 01DAD3F4 00000000 */   nop
/* 0016F8 01DAD3F8 28260070 */  paddub      $4, $0, $0
/* 0016FC 01DAD3FC 07000010 */  b           .L01DAD41C_2E8A1C
/* 001700 01DAD400 00000000 */   nop
.L01DAD404_2E8A04:
/* 001704 01DAD404 80180400 */  sll         $3, $4, 2
/* 001708 01DAD408 E601023C */  lui         $2, %hi(CWeaponFx + 0x490)
/* 00170C 01DAD40C D0934224 */  addiu       $2, $2, %lo(CWeaponFx + 0x490)
/* 001710 01DAD410 21104300 */  addu        $2, $2, $3
/* 001714 01DAD414 000040AC */  sw          $0, 0x0($2)
/* 001718 01DAD418 01008424 */  addiu       $4, $4, 0x1
.L01DAD41C_2E8A1C:
/* 00171C 01DAD41C 20008228 */  slti        $2, $4, 0x20
/* 001720 01DAD420 F8FF4014 */  bnez        $2, .L01DAD404_2E8A04
/* 001724 01DAD424 00000000 */   nop
/* 001728 01DAD428 40000224 */  addiu       $2, $0, 0x40
/* 00172C 01DAD42C E601013C */  lui         $1, %hi(CWeaponFx + 0x518)
/* 001730 01DAD430 589422A0 */  sb          $2, %lo(CWeaponFx + 0x518)($1)
/* 001734 01DAD434 E601013C */  lui         $1, %hi(CWeaponFx + 0x510)
/* 001738 01DAD438 509422A0 */  sb          $2, %lo(CWeaponFx + 0x510)($1)
/* 00173C 01DAD43C E601013C */  lui         $1, %hi(CWeaponFx + 0x519)
/* 001740 01DAD440 599422A0 */  sb          $2, %lo(CWeaponFx + 0x519)($1)
/* 001744 01DAD444 E601013C */  lui         $1, %hi(CWeaponFx + 0x511)
/* 001748 01DAD448 519422A0 */  sb          $2, %lo(CWeaponFx + 0x511)($1)
/* 00174C 01DAD44C E601013C */  lui         $1, %hi(CWeaponFx + 0x51A)
/* 001750 01DAD450 5A9422A0 */  sb          $2, %lo(CWeaponFx + 0x51A)($1)
/* 001754 01DAD454 E601013C */  lui         $1, %hi(CWeaponFx + 0x512)
/* 001758 01DAD458 529422A0 */  sb          $2, %lo(CWeaponFx + 0x512)($1)
/* 00175C 01DAD45C 06000224 */  addiu       $2, $0, 0x6
/* 001760 01DAD460 E601013C */  lui         $1, %hi(CWeaponFx + 0x51C)
/* 001764 01DAD464 5C9422A0 */  sb          $2, %lo(CWeaponFx + 0x51C)($1)
/* 001768 01DAD468 E601013C */  lui         $1, %hi(CWeaponFx + 0x514)
/* 00176C 01DAD46C 549422A0 */  sb          $2, %lo(CWeaponFx + 0x514)($1)
/* 001770 01DAD470 E601013C */  lui         $1, %hi(CWeaponFx + 0x51D)
/* 001774 01DAD474 5D9422A0 */  sb          $2, %lo(CWeaponFx + 0x51D)($1)
/* 001778 01DAD478 E601013C */  lui         $1, %hi(CWeaponFx + 0x515)
/* 00177C 01DAD47C 559422A0 */  sb          $2, %lo(CWeaponFx + 0x515)($1)
/* 001780 01DAD480 E601013C */  lui         $1, %hi(CWeaponFx + 0x51E)
/* 001784 01DAD484 5E9422A0 */  sb          $2, %lo(CWeaponFx + 0x51E)($1)
/* 001788 01DAD488 E601013C */  lui         $1, %hi(CWeaponFx + 0x516)
/* 00178C 01DAD48C 569422A0 */  sb          $2, %lo(CWeaponFx + 0x516)($1)
/* 001790 01DAD490 E601013C */  lui         $1, %hi(CWeaponFx + 0x520)
/* 001794 01DAD494 609420AC */  sw          $0, %lo(CWeaponFx + 0x520)($1)
/* 001798 01DAD498 E601013C */  lui         $1, %hi(CWeaponFx + 0x524)
/* 00179C 01DAD49C 649420AC */  sw          $0, %lo(CWeaponFx + 0x524)($1)
/* 0017A0 01DAD4A0 28860070 */  paddub      $16, $0, $0
/* 0017A4 01DAD4A4 0A000010 */  b           .L01DAD4D0_2E8AD0
/* 0017A8 01DAD4A8 00000000 */   nop
.L01DAD4AC_2E8AAC:
/* 0017AC 01DAD4AC 40111000 */  sll         $2, $16, 5
/* 0017B0 01DAD4B0 23105000 */  subu        $2, $2, $16
/* 0017B4 01DAD4B4 80190200 */  sll         $3, $2, 6
/* 0017B8 01DAD4B8 E601023C */  lui         $2, %hi(CWeaponElFx)
/* 0017BC 01DAD4BC 80944224 */  addiu       $2, $2, %lo(CWeaponElFx)
/* 0017C0 01DAD4C0 21204300 */  addu        $4, $2, $3
/* 0017C4 01DAD4C4 00DE060C */  jal         Initialize__14CWeaponElementFv
/* 0017C8 01DAD4C8 00000000 */   nop
/* 0017CC 01DAD4CC 01001026 */  addiu       $16, $16, 0x1
.L01DAD4D0_2E8AD0:
/* 0017D0 01DAD4D0 0400022A */  slti        $2, $16, 0x4
/* 0017D4 01DAD4D4 F5FF4014 */  bnez        $2, .L01DAD4AC_2E8AAC
/* 0017D8 01DAD4D8 00000000 */   nop
/* 0017DC 01DAD4DC 948B848F */  lw          $4, -0x746C($28)
/* 0017E0 01DAD4E0 8C65050C */  jal         SndSetReadBuffer__FPUi
/* 0017E4 01DAD4E4 00000000 */   nop
/* 0017E8 01DAD4E8 D401013C */  lui         $1, %hi(EdEventInfo + 0x34)
/* 0017EC 01DAD4EC 04D2228C */  lw          $2, %lo(EdEventInfo + 0x34)($1)
/* 0017F0 01DAD4F0 08004010 */  beqz        $2, .L01DAD514_2E8B14
/* 0017F4 01DAD4F4 00000000 */   nop
/* 0017F8 01DAD4F8 A49D828F */  lw          $2, -0x625C($28)
/* 0017FC 01DAD4FC 64004424 */  addiu       $4, $2, 0x64
/* 001800 01DAD500 5866050C */  jal         SndBgmLoad__Fi
/* 001804 01DAD504 00000000 */   nop
/* 001808 01DAD508 28260070 */  paddub      $4, $0, $0
/* 00180C 01DAD50C CC66050C */  jal         SndBgmPlay__Fi
/* 001810 01DAD510 00000000 */   nop
.L01DAD514_2E8B14:
/* 001814 01DAD514 A49D828F */  lw          $2, -0x625C($28)
/* 001818 01DAD518 64004424 */  addiu       $4, $2, 0x64
/* 00181C 01DAD51C 3C69050C */  jal         SndSoundLoad__Fi
/* 001820 01DAD520 00000000 */   nop
/* 001824 01DAD524 A49D838F */  lw          $3, -0x625C($28)
/* 001828 01DAD528 06000224 */  addiu       $2, $0, 0x6
/* 00182C 01DAD52C 06006214 */  bne         $3, $2, .L01DAD548_2E8B48
/* 001830 01DAD530 00000000 */   nop
/* 001834 01DAD534 3D000424 */  addiu       $4, $0, 0x3D
/* 001838 01DAD538 282E0070 */  paddub      $5, $0, $0
/* 00183C 01DAD53C 28360070 */  paddub      $6, $0, $0
/* 001840 01DAD540 AC69050C */  jal         SndSePlay__Fiii
/* 001844 01DAD544 00000000 */   nop
.L01DAD548_2E8B48:
/* 001848 01DAD548 A49D828F */  lw          $2, -0x625C($28)
/* 00184C 01DAD54C 0B004014 */  bnez        $2, .L01DAD57C_2E8B7C
/* 001850 01DAD550 00000000 */   nop
/* 001854 01DAD554 3D000424 */  addiu       $4, $0, 0x3D
/* 001858 01DAD558 282E0070 */  paddub      $5, $0, $0
/* 00185C 01DAD55C 28360070 */  paddub      $6, $0, $0
/* 001860 01DAD560 AC69050C */  jal         SndSePlay__Fiii
/* 001864 01DAD564 00000000 */   nop
/* 001868 01DAD568 35000424 */  addiu       $4, $0, 0x35
/* 00186C 01DAD56C 282E0070 */  paddub      $5, $0, $0
/* 001870 01DAD570 28360070 */  paddub      $6, $0, $0
/* 001874 01DAD574 AC69050C */  jal         SndSePlay__Fiii
/* 001878 01DAD578 00000000 */   nop
.L01DAD57C_2E8B7C:
/* 00187C 01DAD57C A49D838F */  lw          $3, -0x625C($28)
/* 001880 01DAD580 02000224 */  addiu       $2, $0, 0x2
/* 001884 01DAD584 06006214 */  bne         $3, $2, .L01DAD5A0_2E8BA0
/* 001888 01DAD588 00000000 */   nop
/* 00188C 01DAD58C 41000424 */  addiu       $4, $0, 0x41
/* 001890 01DAD590 282E0070 */  paddub      $5, $0, $0
/* 001894 01DAD594 28360070 */  paddub      $6, $0, $0
/* 001898 01DAD598 AC69050C */  jal         SndSePlay__Fiii
/* 00189C 01DAD59C 00000000 */   nop
.L01DAD5A0_2E8BA0:
/* 0018A0 01DAD5A0 A49D828F */  lw          $2, -0x625C($28)
/* 0018A4 01DAD5A4 03004228 */  slti        $2, $2, 0x3
/* 0018A8 01DAD5A8 06004014 */  bnez        $2, .L01DAD5C4_2E8BC4
/* 0018AC 01DAD5AC 00000000 */   nop
/* 0018B0 01DAD5B0 42000424 */  addiu       $4, $0, 0x42
/* 0018B4 01DAD5B4 282E0070 */  paddub      $5, $0, $0
/* 0018B8 01DAD5B8 28360070 */  paddub      $6, $0, $0
/* 0018BC 01DAD5BC AC69050C */  jal         SndSePlay__Fiii
/* 0018C0 01DAD5C0 00000000 */   nop
.L01DAD5C4_2E8BC4:
/* 0018C4 01DAD5C4 28260070 */  paddub      $4, $0, $0
/* 0018C8 01DAD5C8 446C050C */  jal         SndAmbientPlay__Fi
/* 0018CC 01DAD5CC 00000000 */   nop
/* 0018D0 01DAD5D0 28260070 */  paddub      $4, $0, $0
/* 0018D4 01DAD5D4 786C050C */  jal         SndAmbientSetVol__Fi
/* 0018D8 01DAD5D8 00000000 */   nop
/* 0018DC 01DAD5DC 88DD060C */  jal         BtBattleMusic_Init__Fv
/* 0018E0 01DAD5E0 00000000 */   nop
/* 0018E4 01DAD5E4 4CEA760C */  jal         LoadData__Fv__3
/* 0018E8 01DAD5E8 00000000 */   nop
/* 0018EC 01DAD5EC A49D848F */  lw          $4, -0x625C($28)
/* 0018F0 01DAD5F0 6004770C */  jal         LoadStartLogo__Fi
/* 0018F4 01DAD5F4 00000000 */   nop
/* 0018F8 01DAD5F8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0018FC 01DAD5FC 00608244 */  mtc1        $2, $f12
/* 001900 01DAD600 08000424 */  addiu       $4, $0, 0x8
/* 001904 01DAD604 308B050C */  jal         initBlendCnt__Fif
/* 001908 01DAD608 00000000 */   nop
/* 00190C 01DAD60C 349D80AF */  sw          $0, -0x62CC($28)
/* 001910 01DAD610 309D80AF */  sw          $0, -0x62D0($28)
/* 001914 01DAD614 389D80AF */  sw          $0, -0x62C8($28)
/* 001918 01DAD618 EC9C80AF */  sw          $0, -0x6314($28)
/* 00191C 01DAD61C F09C80AF */  sw          $0, -0x6310($28)
/* 001920 01DAD620 E49C80AF */  sw          $0, -0x631C($28)
/* 001924 01DAD624 E89C80AF */  sw          $0, -0x6318($28)
/* 001928 01DAD628 489D80AF */  sw          $0, -0x62B8($28)
/* 00192C 01DAD62C 609D80AF */  sw          $0, -0x62A0($28)
/* 001930 01DAD630 689480AF */  sw          $0, -0x6B98($28)
/* 001934 01DAD634 749D80AF */  sw          $0, -0x628C($28)
/* 001938 01DAD638 7C9D80AF */  sw          $0, -0x6284($28)
/* 00193C 01DAD63C A49D848F */  lw          $4, -0x625C($28)
/* 001940 01DAD640 789C828F */  lw          $2, -0x6388($28)
/* 001944 01DAD644 21108200 */  addu        $2, $4, $2
/* 001948 01DAD648 BF424380 */  lb          $3, 0x42BF($2)
/* 00194C 01DAD64C FFFF0224 */  addiu       $2, $0, -0x1
/* 001950 01DAD650 03006214 */  bne         $3, $2, .L01DAD660_2E8C60
/* 001954 01DAD654 00000000 */   nop
/* 001958 01DAD658 7002070C */  jal         BtAtraListMake__Fi
/* 00195C 01DAD65C 00000000 */   nop
.L01DAD660_2E8C60:
/* 001960 01DAD660 789C828F */  lw          $2, -0x6388($28)
/* 001964 01DAD664 0100013C */  lui         $1, (0x10000 >> 16)
/* 001968 01DAD668 21084100 */  addu        $1, $2, $1
/* 00196C 01DAD66C 088B20AC */  sw          $0, -0x74F8($1)
/* 001970 01DAD670 789C828F */  lw          $2, -0x6388($28)
/* 001974 01DAD674 0100013C */  lui         $1, (0x10000 >> 16)
/* 001978 01DAD678 21084100 */  addu        $1, $2, $1
/* 00197C 01DAD67C 0C8B20AC */  sw          $0, -0x74F4($1)
/* 001980 01DAD680 789C828F */  lw          $2, -0x6388($28)
/* 001984 01DAD684 04004280 */  lb          $2, 0x4($2)
/* 001988 01DAD688 809D82AF */  sw          $2, -0x6280($28)
/* 00198C 01DAD68C 20000224 */  addiu       $2, $0, 0x20
/* 001990 01DAD690 249D82AF */  sw          $2, -0x62DC($28)
/* 001994 01DAD694 98C0060C */  jal         BtStatusAlarmInit__Fv
/* 001998 01DAD698 00000000 */   nop
/* 00199C 01DAD69C 28860070 */  paddub      $16, $0, $0
/* 0019A0 01DAD6A0 0A000010 */  b           .L01DAD6CC_2E8CCC
/* 0019A4 01DAD6A4 00000000 */   nop
.L01DAD6A8_2E8CA8:
/* 0019A8 01DAD6A8 40101000 */  sll         $2, $16, 1
/* 0019AC 01DAD6AC 21105000 */  addu        $2, $2, $16
/* 0019B0 01DAD6B0 80190200 */  sll         $3, $2, 6
/* 0019B4 01DAD6B4 F001023C */  lui         $2, %hi(CBomb__2)
/* 0019B8 01DAD6B8 D0FE4224 */  addiu       $2, $2, %lo(CBomb__2)
/* 0019BC 01DAD6BC 21204300 */  addu        $4, $2, $3
/* 0019C0 01DAD6C0 6C58070C */  jal         Initialize__15CItemBombEffectFv
/* 0019C4 01DAD6C4 00000000 */   nop
/* 0019C8 01DAD6C8 01001026 */  addiu       $16, $16, 0x1
.L01DAD6CC_2E8CCC:
/* 0019CC 01DAD6CC 0300022A */  slti        $2, $16, 0x3
/* 0019D0 01DAD6D0 F5FF4014 */  bnez        $2, .L01DAD6A8_2E8CA8
/* 0019D4 01DAD6D4 00000000 */   nop
/* 0019D8 01DAD6D8 F001023C */  lui         $2, %hi(CBomb__2)
/* 0019DC 01DAD6DC D0FE4224 */  addiu       $2, $2, %lo(CBomb__2)
/* 0019E0 01DAD6E0 F49D82AF */  sw          $2, -0x620C($28)
/* 0019E4 01DAD6E4 F001013C */  lui         $1, %hi(ShockWave + 0x28)
/* 0019E8 01DAD6E8 380120AC */  sw          $0, %lo(ShockWave + 0x28)($1)
/* 0019EC 01DAD6EC F001023C */  lui         $2, %hi(ShockWave)
/* 0019F0 01DAD6F0 10014224 */  addiu       $2, $2, %lo(ShockWave)
/* 0019F4 01DAD6F4 F89D82AF */  sw          $2, -0x6208($28)
/* 0019F8 01DAD6F8 EB01013C */  lui         $1, %hi(BombInfo + 0x14)
/* 0019FC 01DAD6FC 046320AC */  sw          $0, %lo(BombInfo + 0x14)($1)
/* 001A00 01DAD700 789D80AF */  sw          $0, -0x6288($28)
/* 001A04 01DAD704 01000324 */  addiu       $3, $0, 0x1
/* 001A08 01DAD708 DC01013C */  lui         $1, %hi(BtActStatus)
/* 001A0C 01DAD70C 804423AC */  sw          $3, %lo(BtActStatus)($1)
/* 001A10 01DAD710 B49C80AF */  sw          $0, -0x634C($28)
/* 001A14 01DAD714 A89D83AF */  sw          $3, -0x6258($28)
/* 001A18 01DAD718 FFFF0224 */  addiu       $2, $0, -0x1
/* 001A1C 01DAD71C B49D82AF */  sw          $2, -0x624C($28)
/* 001A20 01DAD720 B89D80AF */  sw          $0, -0x6248($28)
/* 001A24 01DAD724 789C828F */  lw          $2, -0x6388($28)
/* 001A28 01DAD728 3C43448C */  lw          $4, 0x433C($2)
/* 001A2C 01DAD72C 03000224 */  addiu       $2, $0, 0x3
/* 001A30 01DAD730 05008210 */  beq         $4, $2, .L01DAD748_2E8D48
/* 001A34 01DAD734 00000000 */   nop
/* 001A38 01DAD738 C09D83AF */  sw          $3, -0x6240($28)
/* 001A3C 01DAD73C C49D83AF */  sw          $3, -0x623C($28)
/* 001A40 01DAD740 03000010 */  b           .L01DAD750_2E8D50
/* 001A44 01DAD744 00000000 */   nop
.L01DAD748_2E8D48:
/* 001A48 01DAD748 C09D80AF */  sw          $0, -0x6240($28)
/* 001A4C 01DAD74C C49D80AF */  sw          $0, -0x623C($28)
.L01DAD750_2E8D50:
/* 001A50 01DAD750 01000224 */  addiu       $2, $0, 0x1
/* 001A54 01DAD754 DC01013C */  lui         $1, %hi(BtActStatus)
/* 001A58 01DAD758 804422AC */  sw          $2, %lo(BtActStatus)($1)
/* 001A5C 01DAD75C F49C80AF */  sw          $0, -0x630C($28)
/* 001A60 01DAD760 F89C82AF */  sw          $2, -0x6308($28)
/* 001A64 01DAD764 FC03770C */  jal         RsetUnitAmbientAnime__Fv
/* 001A68 01DAD768 00000000 */   nop
/* 001A6C 01DAD76C CC01023C */  lui         $2, %hi(GamePad)
/* 001A70 01DAD770 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 001A74 01DAD774 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 001A78 01DAD778 00000000 */   nop
/* 001A7C 01DAD77C CC01023C */  lui         $2, %hi(GamePad)
/* 001A80 01DAD780 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 001A84 01DAD784 4CAE040C */  jal         MenuModeOff__8CGamePadFv
/* 001A88 01DAD788 00000000 */   nop
/* 001A8C 01DAD78C 989D80AF */  sw          $0, -0x6268($28)
/* 001A90 01DAD790 FFFF0624 */  addiu       $6, $0, -0x1
/* 001A94 01DAD794 949D86AF */  sw          $6, -0x626C($28)
/* 001A98 01DAD798 E601013C */  lui         $1, %hi(EnemyLifeGage + 0x10)
/* 001A9C 01DAD79C 308F20AC */  sw          $0, %lo(EnemyLifeGage + 0x10)($1)
/* 001AA0 01DAD7A0 01000224 */  addiu       $2, $0, 0x1
/* 001AA4 01DAD7A4 E601013C */  lui         $1, %hi(EnemyLifeGage + 0x14)
/* 001AA8 01DAD7A8 348F22AC */  sw          $2, %lo(EnemyLifeGage + 0x14)($1)
/* 001AAC 01DAD7AC 009E80AF */  sw          $0, -0x6200($28)
/* 001AB0 01DAD7B0 049E80AF */  sw          $0, -0x61FC($28)
/* 001AB4 01DAD7B4 7C9C80AF */  sw          $0, -0x6384($28)
/* 001AB8 01DAD7B8 C701023C */  lui         $2, %hi(TexManager)
/* 001ABC 01DAD7BC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 001AC0 01DAD7C0 DC01023C */  lui         $2, %hi(LIT_917)
/* 001AC4 01DAD7C4 182E4524 */  addiu       $5, $2, %lo(LIT_917)
/* 001AC8 01DAD7C8 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 001ACC 01DAD7CC 00000000 */   nop
/* 001AD0 01DAD7D0 209E82AF */  sw          $2, -0x61E0($28)
/* 001AD4 01DAD7D4 C701023C */  lui         $2, %hi(TexManager)
/* 001AD8 01DAD7D8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 001ADC 01DAD7DC DC01023C */  lui         $2, %hi(LIT_918)
/* 001AE0 01DAD7E0 282E4524 */  addiu       $5, $2, %lo(LIT_918)
/* 001AE4 01DAD7E4 FFFF0624 */  addiu       $6, $0, -0x1
/* 001AE8 01DAD7E8 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 001AEC 01DAD7EC 00000000 */   nop
/* 001AF0 01DAD7F0 249E82AF */  sw          $2, -0x61DC($28)
/* 001AF4 01DAD7F4 C701023C */  lui         $2, %hi(TexManager)
/* 001AF8 01DAD7F8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 001AFC 01DAD7FC DC01023C */  lui         $2, %hi(LIT_919__3)
/* 001B00 01DAD800 382E4524 */  addiu       $5, $2, %lo(LIT_919__3)
/* 001B04 01DAD804 FFFF0624 */  addiu       $6, $0, -0x1
/* 001B08 01DAD808 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 001B0C 01DAD80C 00000000 */   nop
/* 001B10 01DAD810 289E82AF */  sw          $2, -0x61D8($28)
/* 001B14 01DAD814 A49D828F */  lw          $2, -0x625C($28)
/* 001B18 01DAD818 01004624 */  addiu       $6, $2, 0x1
/* 001B1C 01DAD81C 6000A427 */  addiu       $4, $29, 0x60
/* 001B20 01DAD820 DC01023C */  lui         $2, %hi(LIT_920__4)
/* 001B24 01DAD824 482E4524 */  addiu       $5, $2, %lo(LIT_920__4)
/* 001B28 01DAD828 1614040C */  jal         sprintf
/* 001B2C 01DAD82C 00000000 */   nop
/* 001B30 01DAD830 C701023C */  lui         $2, %hi(TexManager)
/* 001B34 01DAD834 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 001B38 01DAD838 6000A527 */  addiu       $5, $29, 0x60
/* 001B3C 01DAD83C FFFF0624 */  addiu       $6, $0, -0x1
/* 001B40 01DAD840 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 001B44 01DAD844 00000000 */   nop
/* 001B48 01DAD848 2C9E82AF */  sw          $2, -0x61D4($28)
/* 001B4C 01DAD84C 2C9E828F */  lw          $2, -0x61D4($28)
/* 001B50 01DAD850 05004014 */  bnez        $2, .L01DAD868_2E8E68
/* 001B54 01DAD854 00000000 */   nop
/* 001B58 01DAD858 DC01023C */  lui         $2, %hi(LIT_921__3)
/* 001B5C 01DAD85C 582E4424 */  addiu       $4, $2, %lo(LIT_921__3)
/* 001B60 01DAD860 A611040C */  jal         printf
/* 001B64 01DAD864 00000000 */   nop
.L01DAD868_2E8E68:
/* 001B68 01DAD868 30C8060C */  jal         BtMapJumpCashClear__Fv
/* 001B6C 01DAD86C 00000000 */   nop
/* 001B70 01DAD870 C89C838F */  lw          $3, -0x6338($28)
/* 001B74 01DAD874 8040023C */  lui         $2, (0x40800000 >> 16)
/* 001B78 01DAD878 B00362AC */  sw          $2, 0x3B0($3)
/* 001B7C 01DAD87C 789C848F */  lw          $4, -0x6388($28)
/* 001B80 01DAD880 282E0070 */  paddub      $5, $0, $0
/* 001B84 01DAD884 40F6060C */  jal         SetNowFloor__14CDngStatusDataFi
/* 001B88 01DAD888 00000000 */   nop
/* 001B8C 01DAD88C 789C838F */  lw          $3, -0x6388($28)
/* 001B90 01DAD890 FFFF0224 */  addiu       $2, $0, -0x1
/* 001B94 01DAD894 030062A0 */  sb          $2, 0x3($3)
/* 001B98 01DAD898 DC01023C */  lui         $2, %hi(LIT_922__2)
/* 001B9C 01DAD89C 682E4224 */  addiu       $2, $2, %lo(LIT_922__2)
/* 001BA0 01DAD8A0 EB01013C */  lui         $1, %hi(DbgMsg + 0x10)
/* 001BA4 01DAD8A4 E06022AC */  sw          $2, %lo(DbgMsg + 0x10)($1)
/* 001BA8 01DAD8A8 20000224 */  addiu       $2, $0, 0x20
/* 001BAC 01DAD8AC EB01013C */  lui         $1, %hi(DbgMsg)
/* 001BB0 01DAD8B0 D06022AC */  sw          $2, %lo(DbgMsg)($1)
/* 001BB4 01DAD8B4 50000224 */  addiu       $2, $0, 0x50
/* 001BB8 01DAD8B8 EB01013C */  lui         $1, %hi(DbgMsg + 0x4)
/* 001BBC 01DAD8BC D46022AC */  sw          $2, %lo(DbgMsg + 0x4)($1)
/* 001BC0 01DAD8C0 00010224 */  addiu       $2, $0, 0x100
/* 001BC4 01DAD8C4 EB01013C */  lui         $1, %hi(DbgMsg + 0x8)
/* 001BC8 01DAD8C8 D86022AC */  sw          $2, %lo(DbgMsg + 0x8)($1)
/* 001BCC 01DAD8CC E0000224 */  addiu       $2, $0, 0xE0
/* 001BD0 01DAD8D0 EB01013C */  lui         $1, %hi(DbgMsg + 0xC)
/* 001BD4 01DAD8D4 DC6022AC */  sw          $2, %lo(DbgMsg + 0xC)($1)
/* 001BD8 01DAD8D8 60000224 */  addiu       $2, $0, 0x60
/* 001BDC 01DAD8DC EB01013C */  lui         $1, %hi(DbgMsg + 0x14)
/* 001BE0 01DAD8E0 E46022AC */  sw          $2, %lo(DbgMsg + 0x14)($1)
/* 001BE4 01DAD8E4 BCD1060C */  jal         DebugInfomationInit__Fv
/* 001BE8 01DAD8E8 00000000 */   nop
/* 001BEC 01DAD8EC EB01023C */  lui         $2, %hi(DbgMsg)
/* 001BF0 01DAD8F0 D0604424 */  addiu       $4, $2, %lo(DbgMsg)
/* 001BF4 01DAD8F4 98C0050C */  jal         EdDSetFont__FP10CDebugFont
/* 001BF8 01DAD8F8 00000000 */   nop
/* 001BFC 01DAD8FC EB01023C */  lui         $2, %hi(StealItem)
/* 001C00 01DAD900 00834424 */  addiu       $4, $2, %lo(StealItem)
/* 001C04 01DAD904 0C9D858F */  lw          $5, -0x62F4($28)
/* 001C08 01DAD908 385D070C */  jal         Initialize__10CStealItemFP9CFrameVu1
/* 001C0C 01DAD90C 00000000 */   nop
/* 001C10 01DAD910 D89D80AF */  sw          $0, -0x6228($28)
/* 001C14 01DAD914 309E80AF */  sw          $0, -0x61D0($28)
/* 001C18 01DAD918 349E80AF */  sw          $0, -0x61CC($28)
/* 001C1C 01DAD91C 18EC060C */  jal         BtSystemScriptEventInfoInit__Fv
/* 001C20 01DAD920 00000000 */   nop
/* 001C24 01DAD924 C4EC060C */  jal         BtSystemScriptInit__Fv
/* 001C28 01DAD928 00000000 */   nop
/* 001C2C 01DAD92C A49D848F */  lw          $4, -0x625C($28)
/* 001C30 01DAD930 98EC060C */  jal         BtSystemScriptLoad__Fi
/* 001C34 01DAD934 00000000 */   nop
/* 001C38 01DAD938 1CB0760C */  jal         MemoryMapDump__Fv
/* 001C3C 01DAD93C 00000000 */   nop
/* 001C40 01DAD940 01000324 */  addiu       $3, $0, 0x1
/* 001C44 01DAD944 6C9D83AF */  sw          $3, -0x6294($28)
/* 001C48 01DAD948 64000324 */  addiu       $3, $0, 0x64
/* 001C4C 01DAD94C D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 001C50 01DAD950 6C6723AC */  sw          $3, %lo(BtEventInfo + 0x2C)($1)
/* 001C54 01DAD954 D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 001C58 01DAD958 746720AC */  sw          $0, %lo(BtEventInfo + 0x34)($1)
/* 001C5C 01DAD95C 90010324 */  addiu       $3, $0, 0x190
/* 001C60 01DAD960 FC9D83AF */  sw          $3, -0x6204($28)
/* 001C64 01DAD964 1000BF7B */  lq          $31, 0x10($29)
/* 001C68 01DAD968 0000B07B */  lq          $16, 0x0($29)
/* 001C6C 01DAD96C 9000BD27 */  addiu       $29, $29, 0x90
/* 001C70 01DAD970 0800E003 */  jr          $31
/* 001C74 01DAD974 00000000 */   nop
/* 001C78 01DAD978 00000000 */  nop
/* 001C7C 01DAD97C 00000000 */  nop
