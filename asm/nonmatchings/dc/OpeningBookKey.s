.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OpeningBookKey__Fv
/* 13D010 0023CF10 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 13D014 0023CF14 3000BF7F */  sq         $31, 0x30($sp)
/* 13D018 0023CF18 2000B27F */  sq         $18, 0x20($sp)
/* 13D01C 0023CF1C 1000B17F */  sq         $17, 0x10($sp)
/* 13D020 0023CF20 0000B07F */  sq         $16, 0x0($sp)
/* 13D024 0023CF24 38FB040C */  jal        ReadBG__Fv
/* 13D028 0023CF28 00000000 */   nop
/* 13D02C 0023CF2C 28860070 */  paddub     $16, $0, $0
/* 13D030 0023CF30 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D034 0023CF34 78BC2484 */  lh         $4, -0x4388($at)
/* 13D038 0023CF38 0600812C */  sltiu      $at, $4, 0x6
/* 13D03C 0023CF3C 85012010 */  beqz       $at, .L0023D554
/* 13D040 0023CF40 00000000 */   nop
/* 13D044 0023CF44 2A00023C */  lui        $2, %hi(_1560_2)
/* 13D048 0023CF48 20F74324 */  addiu      $3, $2, %lo(_1560_2)
/* 13D04C 0023CF4C 80100400 */  sll        $2, $4, 2
/* 13D050 0023CF50 21104300 */  addu       $2, $2, $3
/* 13D054 0023CF54 0000428C */  lw         $2, 0x0($2)
/* 13D058 0023CF58 08004000 */  jr         $2
/* 13D05C 0023CF5C 00000000 */   nop
/* 13D060 0023CF60 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D064 0023CF64 70BC2284 */  lh         $2, -0x4390($at)
/* 13D068 0023CF68 FC004014 */  bnez       $2, .L0023D35C
/* 13D06C 0023CF6C 00000000 */   nop
/* 13D070 0023CF70 8CFB040C */  jal        ReadBGSync__Fv
/* 13D074 0023CF74 00000000 */   nop
/* 13D078 0023CF78 F8004014 */  bnez       $2, .L0023D35C
/* 13D07C 0023CF7C 00000000 */   nop
/* 13D080 0023CF80 2900023C */  lui        $2, %hi(_1512_4)
/* 13D084 0023CF84 C05F4524 */  addiu      $5, $2, %lo(_1512_4)
/* 13D088 0023CF88 4000A427 */  addiu      $4, $sp, 0x40
/* 13D08C 0023CF8C 02000324 */  addiu      $3, $0, 0x2
.L0023CF90:
/* 13D090 0023CF90 0000A278 */  lq         $2, 0x0($5)
/* 13D094 0023CF94 1000A524 */  addiu      $5, $5, 0x10
/* 13D098 0023CF98 FFFF6324 */  addiu      $3, $3, -0x1
/* 13D09C 0023CF9C 0000827C */  sq         $2, 0x0($4)
/* 13D0A0 0023CFA0 10008424 */  addiu      $4, $4, 0x10
/* 13D0A4 0023CFA4 FAFF601C */  bgtz       $3, .L0023CF90
/* 13D0A8 0023CFA8 00000000 */   nop
/* 13D0AC 0023CFAC 0000A2C4 */  lwc1       $f2, 0x0($5)
/* 13D0B0 0023CFB0 000082E4 */  swc1       $f2, 0x0($4)
/* 13D0B4 0023CFB4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D0B8 0023CFB8 72BC2284 */  lh         $2, -0x438E($at)
/* 13D0BC 0023CFBC 4400A2AF */  sw         $2, 0x44($sp)
/* 13D0C0 0023CFC0 5000A2AF */  sw         $2, 0x50($sp)
/* 13D0C4 0023CFC4 28260070 */  paddub     $4, $0, $0
/* 13D0C8 0023CFC8 18FB040C */  jal        GetReadBGFile__Fi
/* 13D0CC 0023CFCC 00000000 */   nop
/* 13D0D0 0023CFD0 288E4070 */  paddub     $17, $2, $0
/* 13D0D4 0023CFD4 8C00448C */  lw         $4, 0x8C($2)
/* 13D0D8 0023CFD8 2A00023C */  lui        $2, %hi(_1558_2)
/* 13D0DC 0023CFDC F8F64524 */  addiu      $5, $2, %lo(_1558_2)
/* 13D0E0 0023CFE0 28360070 */  paddub     $6, $0, $0
/* 13D0E4 0023CFE4 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 13D0E8 0023CFE8 00000000 */   nop
/* 13D0EC 0023CFEC 4C00A2AF */  sw         $2, 0x4C($sp)
/* 13D0F0 0023CFF0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D0F4 0023CFF4 72BC2584 */  lh         $5, -0x438E($at)
/* 13D0F8 0023CFF8 C701023C */  lui        $2, %hi(TexManager)
/* 13D0FC 0023CFFC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 13D100 0023D000 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 13D104 0023D004 00000000 */   nop
/* 13D108 0023D008 C701023C */  lui        $2, %hi(TexManager)
/* 13D10C 0023D00C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 13D110 0023D010 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 13D114 0023D014 00000000 */   nop
/* 13D118 0023D018 C701023C */  lui        $2, %hi(TexManager)
/* 13D11C 0023D01C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 13D120 0023D020 FFFF0524 */  addiu      $5, $0, -0x1
/* 13D124 0023D024 4000A627 */  addiu      $6, $sp, 0x40
/* 13D128 0023D028 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 13D12C 0023D02C 00000000 */   nop
/* 13D130 0023D030 9000228E */  lw         $2, 0x90($17)
/* 13D134 0023D034 03110200 */  sra        $2, $2, 4
/* 13D138 0023D038 00190200 */  sll        $3, $2, 4
/* 13D13C 0023D03C 8C00228E */  lw         $2, 0x8C($17)
/* 13D140 0023D040 21104300 */  addu       $2, $2, $3
/* 13D144 0023D044 10004224 */  addiu      $2, $2, 0x10
/* 13D148 0023D048 DC9782AF */  sw         $2, -0x6824($gp)
/* 13D14C 0023D04C DC97848F */  lw         $4, -0x6824($gp)
/* 13D150 0023D050 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 13D154 0023D054 00000000 */   nop
/* 13D158 0023D058 DC9782AF */  sw         $2, -0x6824($gp)
/* 13D15C 0023D05C 8C00248E */  lw         $4, 0x8C($17)
/* 13D160 0023D060 2A00023C */  lui        $2, %hi(_1559_3)
/* 13D164 0023D064 08F74524 */  addiu      $5, $2, %lo(_1559_3)
/* 13D168 0023D068 28360070 */  paddub     $6, $0, $0
/* 13D16C 0023D06C C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 13D170 0023D070 00000000 */   nop
/* 13D174 0023D074 288E4070 */  paddub     $17, $2, $0
/* 13D178 0023D078 46000224 */  addiu      $2, $0, 0x46
/* 13D17C 0023D07C DA01013C */  lui        $at, (0x1DA2368 >> 16)
/* 13D180 0023D080 682322AC */  sw         $2, (0x1DA2368 & 0xFFFF)($at)
/* 13D184 0023D084 0A000224 */  addiu      $2, $0, 0xA
/* 13D188 0023D088 DA01013C */  lui        $at, (0x1DA236C >> 16)
/* 13D18C 0023D08C 6C2322AC */  sw         $2, (0x1DA236C & 0xFFFF)($at)
/* 13D190 0023D090 DA01013C */  lui        $at, (0x1DA2370 >> 16)
/* 13D194 0023D094 702320AC */  sw         $0, (0x1DA2370 & 0xFFFF)($at)
/* 13D198 0023D098 DA01013C */  lui        $at, (0x1DA2374 >> 16)
/* 13D19C 0023D09C 742320AC */  sw         $0, (0x1DA2374 & 0xFFFF)($at)
/* 13D1A0 0023D0A0 DA01013C */  lui        $at, (0x1DA2378 >> 16)
/* 13D1A4 0023D0A4 782320AC */  sw         $0, (0x1DA2378 & 0xFFFF)($at)
/* 13D1A8 0023D0A8 DA01013C */  lui        $at, (0x1DA23E0 >> 16)
/* 13D1AC 0023D0AC E02320AC */  sw         $0, (0x1DA23E0 & 0xFFFF)($at)
/* 13D1B0 0023D0B0 01000224 */  addiu      $2, $0, 0x1
/* 13D1B4 0023D0B4 DA01013C */  lui        $at, (0x1DA23E4 >> 16)
/* 13D1B8 0023D0B8 E42322AC */  sw         $2, (0x1DA23E4 & 0xFFFF)($at)
/* 13D1BC 0023D0BC DA01013C */  lui        $at, (0x1DA23F8 >> 16)
/* 13D1C0 0023D0C0 F82320C4 */  lwc1       $f0, (0x1DA23F8 & 0xFFFF)($at)
/* 13D1C4 0023D0C4 DA01013C */  lui        $at, (0x1DA23F4 >> 16)
/* 13D1C8 0023D0C8 F42320E4 */  swc1       $f0, (0x1DA23F4 & 0xFFFF)($at)
/* 13D1CC 0023D0CC DA01013C */  lui        $at, (0x1DA23FC >> 16)
/* 13D1D0 0023D0D0 FC2320AC */  sw         $0, (0x1DA23FC & 0xFFFF)($at)
/* 13D1D4 0023D0D4 DA01013C */  lui        $at, (0x1DA2404 >> 16)
/* 13D1D8 0023D0D8 042420AC */  sw         $0, (0x1DA2404 & 0xFFFF)($at)
/* 13D1DC 0023D0DC DA01013C */  lui        $at, (0x1DA2408 >> 16)
/* 13D1E0 0023D0E0 082420AC */  sw         $0, (0x1DA2408 & 0xFFFF)($at)
/* 13D1E4 0023D0E4 DA01013C */  lui        $at, (0x1DA240C >> 16)
/* 13D1E8 0023D0E8 0C2420AC */  sw         $0, (0x1DA240C & 0xFFFF)($at)
/* 13D1EC 0023D0EC DA01013C */  lui        $at, (0x1DA2410 >> 16)
/* 13D1F0 0023D0F0 102420AC */  sw         $0, (0x1DA2410 & 0xFFFF)($at)
/* 13D1F4 0023D0F4 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 13D1F8 0023D0F8 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 13D1FC 0023D0FC 643D050C */  jal        InitMesWinTbl__6ClsMesFv
/* 13D200 0023D100 00000000 */   nop
/* 13D204 0023D104 DA01013C */  lui        $at, (0x1DA39F8 >> 16)
/* 13D208 0023D108 F839228C */  lw         $2, (0x1DA39F8 & 0xFFFF)($at)
/* 13D20C 0023D10C DA01013C */  lui        $at, (0x1DA39FC >> 16)
/* 13D210 0023D110 FC3922AC */  sw         $2, (0x1DA39FC & 0xFFFF)($at)
/* 13D214 0023D114 DA01013C */  lui        $at, (0x1DA3A00 >> 16)
/* 13D218 0023D118 003A20AC */  sw         $0, (0x1DA3A00 & 0xFFFF)($at)
/* 13D21C 0023D11C DA01013C */  lui        $at, (0x1DA3A04 >> 16)
/* 13D220 0023D120 043A20AC */  sw         $0, (0x1DA3A04 & 0xFFFF)($at)
/* 13D224 0023D124 DA01013C */  lui        $at, (0x1DA3A08 >> 16)
/* 13D228 0023D128 083A20AC */  sw         $0, (0x1DA3A08 & 0xFFFF)($at)
/* 13D22C 0023D12C FFFF0224 */  addiu      $2, $0, -0x1
/* 13D230 0023D130 DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* 13D234 0023D134 0C3A22AC */  sw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* 13D238 0023D138 80000224 */  addiu      $2, $0, 0x80
/* 13D23C 0023D13C DA01013C */  lui        $at, (0x1DA3A24 >> 16)
/* 13D240 0023D140 243A22AC */  sw         $2, (0x1DA3A24 & 0xFFFF)($at)
/* 13D244 0023D144 282E0070 */  paddub     $5, $0, $0
/* 13D248 0023D148 08000010 */  b          .L0023D16C
/* 13D24C 0023D14C 00000000 */   nop
.L0023D150:
/* 13D250 0023D150 FFFF0424 */  addiu      $4, $0, -0x1
/* 13D254 0023D154 80180500 */  sll        $3, $5, 2
/* 13D258 0023D158 DA01023C */  lui        $2, %hi(D_1DA3A30)
/* 13D25C 0023D15C 303A4224 */  addiu      $2, $2, %lo(D_1DA3A30)
/* 13D260 0023D160 21104300 */  addu       $2, $2, $3
/* 13D264 0023D164 000044AC */  sw         $4, 0x0($2)
/* 13D268 0023D168 0100A524 */  addiu      $5, $5, 0x1
.L0023D16C:
/* 13D26C 0023D16C 0A00A228 */  slti       $2, $5, 0xA
/* 13D270 0023D170 F7FF4014 */  bnez       $2, .L0023D150
/* 13D274 0023D174 00000000 */   nop
/* 13D278 0023D178 28260070 */  paddub     $4, $0, $0
/* 13D27C 0023D17C 07000010 */  b          .L0023D19C
/* 13D280 0023D180 00000000 */   nop
.L0023D184:
/* 13D284 0023D184 80180400 */  sll        $3, $4, 2
/* 13D288 0023D188 DA01023C */  lui        $2, %hi(D_1DA3A58)
/* 13D28C 0023D18C 583A4224 */  addiu      $2, $2, %lo(D_1DA3A58)
/* 13D290 0023D190 21104300 */  addu       $2, $2, $3
/* 13D294 0023D194 000040AC */  sw         $0, 0x0($2)
/* 13D298 0023D198 01008424 */  addiu      $4, $4, 0x1
.L0023D19C:
/* 13D29C 0023D19C 08008228 */  slti       $2, $4, 0x8
/* 13D2A0 0023D1A0 F8FF4014 */  bnez       $2, .L0023D184
/* 13D2A4 0023D1A4 00000000 */   nop
/* 13D2A8 0023D1A8 DA01013C */  lui        $at, (0x1DA3A78 >> 16)
/* 13D2AC 0023D1AC 783A20AC */  sw         $0, (0x1DA3A78 & 0xFFFF)($at)
/* 13D2B0 0023D1B0 DA01013C */  lui        $at, (0x1DA3A7C >> 16)
/* 13D2B4 0023D1B4 7C3A20AC */  sw         $0, (0x1DA3A7C & 0xFFFF)($at)
/* 13D2B8 0023D1B8 01000224 */  addiu      $2, $0, 0x1
/* 13D2BC 0023D1BC DA01013C */  lui        $at, (0x1DA3A80 >> 16)
/* 13D2C0 0023D1C0 803A22AC */  sw         $2, (0x1DA3A80 & 0xFFFF)($at)
/* 13D2C4 0023D1C4 DA01013C */  lui        $at, (0x1DA3A84 >> 16)
/* 13D2C8 0023D1C8 843A20AC */  sw         $0, (0x1DA3A84 & 0xFFFF)($at)
/* 13D2CC 0023D1CC FFFF0224 */  addiu      $2, $0, -0x1
/* 13D2D0 0023D1D0 DA01013C */  lui        $at, (0x1DA3A88 >> 16)
/* 13D2D4 0023D1D4 883A22AC */  sw         $2, (0x1DA3A88 & 0xFFFF)($at)
/* 13D2D8 0023D1D8 DA01013C */  lui        $at, (0x1DA3A8C >> 16)
/* 13D2DC 0023D1DC 8C3A22AC */  sw         $2, (0x1DA3A8C & 0xFFFF)($at)
/* 13D2E0 0023D1E0 DA01013C */  lui        $at, (0x1DA3A90 >> 16)
/* 13D2E4 0023D1E4 903A22AC */  sw         $2, (0x1DA3A90 & 0xFFFF)($at)
/* 13D2E8 0023D1E8 DA01013C */  lui        $at, (0x1DA3A94 >> 16)
/* 13D2EC 0023D1EC 943A20AC */  sw         $0, (0x1DA3A94 & 0xFFFF)($at)
/* 13D2F0 0023D1F0 DA01013C */  lui        $at, (0x1DA3A98 >> 16)
/* 13D2F4 0023D1F4 983A20AC */  sw         $0, (0x1DA3A98 & 0xFFFF)($at)
/* 13D2F8 0023D1F8 28260070 */  paddub     $4, $0, $0
/* 13D2FC 0023D1FC 0C000010 */  b          .L0023D230
/* 13D300 0023D200 00000000 */   nop
.L0023D204:
/* 13D304 0023D204 FFFF0324 */  addiu      $3, $0, -0x1
/* 13D308 0023D208 C0280400 */  sll        $5, $4, 3
/* 13D30C 0023D20C DA01023C */  lui        $2, %hi(D_1DA3AA0)
/* 13D310 0023D210 A03A4224 */  addiu      $2, $2, %lo(D_1DA3AA0)
/* 13D314 0023D214 21104500 */  addu       $2, $2, $5
/* 13D318 0023D218 000043AC */  sw         $3, 0x0($2)
/* 13D31C 0023D21C DA01023C */  lui        $2, %hi(D_1DA3AA4)
/* 13D320 0023D220 A43A4224 */  addiu      $2, $2, %lo(D_1DA3AA4)
/* 13D324 0023D224 21104500 */  addu       $2, $2, $5
/* 13D328 0023D228 000043AC */  sw         $3, 0x0($2)
/* 13D32C 0023D22C 01008424 */  addiu      $4, $4, 0x1
.L0023D230:
/* 13D330 0023D230 0A008228 */  slti       $2, $4, 0xA
/* 13D334 0023D234 F3FF4014 */  bnez       $2, .L0023D204
/* 13D338 0023D238 00000000 */   nop
/* 13D33C 0023D23C DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 13D340 0023D240 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 13D344 0023D244 04000524 */  addiu      $5, $0, 0x4
/* 13D348 0023D248 EC36050C */  jal        SetMesFukidashi__6ClsMesFi
/* 13D34C 0023D24C 00000000 */   nop
/* 13D350 0023D250 DA01013C */  lui        $at, (0x1DA23F4 >> 16)
/* 13D354 0023D254 F42320AC */  sw         $0, (0x1DA23F4 & 0xFFFF)($at)
/* 13D358 0023D258 DA01013C */  lui        $at, (0x1DA23F8 >> 16)
/* 13D35C 0023D25C F82320AC */  sw         $0, (0x1DA23F8 & 0xFFFF)($at)
/* 13D360 0023D260 01000224 */  addiu      $2, $0, 0x1
/* 13D364 0023D264 DA01013C */  lui        $at, (0x1DA3A14 >> 16)
/* 13D368 0023D268 143A22AC */  sw         $2, (0x1DA3A14 & 0xFFFF)($at)
/* 13D36C 0023D26C DA01013C */  lui        $at, (0x1DA3A1C >> 16)
/* 13D370 0023D270 1C3A22AC */  sw         $2, (0x1DA3A1C & 0xFFFF)($at)
/* 13D374 0023D274 28000224 */  addiu      $2, $0, 0x28
/* 13D378 0023D278 DA01013C */  lui        $at, (0x1DA2360 >> 16)
/* 13D37C 0023D27C 602322AC */  sw         $2, (0x1DA2360 & 0xFFFF)($at)
/* 13D380 0023D280 03000224 */  addiu      $2, $0, 0x3
/* 13D384 0023D284 DA01013C */  lui        $at, (0x1DA2364 >> 16)
/* 13D388 0023D288 642322AC */  sw         $2, (0x1DA2364 & 0xFFFF)($at)
/* 13D38C 0023D28C 80AE080C */  jal        GetMenuLangFlag__Fv
/* 13D390 0023D290 00000000 */   nop
/* 13D394 0023D294 28964070 */  paddub     $18, $2, $0
/* 13D398 0023D298 0600401A */  blez       $18, .L0023D2B4
/* 13D39C 0023D29C 00000000 */   nop
/* 13D3A0 0023D2A0 DA01013C */  lui        $at, (0x1DA2358 >> 16)
/* 13D3A4 0023D2A4 5823228C */  lw         $2, (0x1DA2358 & 0xFFFF)($at)
/* 13D3A8 0023D2A8 FFFF4224 */  addiu      $2, $2, -0x1
/* 13D3AC 0023D2AC DA01013C */  lui        $at, (0x1DA2358 >> 16)
/* 13D3B0 0023D2B0 582322AC */  sw         $2, (0x1DA2358 & 0xFFFF)($at)
.L0023D2B4:
/* 13D3B4 0023D2B4 1A000224 */  addiu      $2, $0, 0x1A
/* 13D3B8 0023D2B8 DA01013C */  lui        $at, (0x1DA3A9C >> 16)
/* 13D3BC 0023D2BC 9C3A22AC */  sw         $2, (0x1DA3A9C & 0xFFFF)($at)
/* 13D3C0 0023D2C0 D001023C */  lui        $2, %hi(MesWinTexBuff_02)
/* 13D3C4 0023D2C4 408C4224 */  addiu      $2, $2, %lo(MesWinTexBuff_02)
/* 13D3C8 0023D2C8 DA01013C */  lui        $at, (0x1DA3B00 >> 16)
/* 13D3CC 0023D2CC 003B22AC */  sw         $2, (0x1DA3B00 & 0xFFFF)($at)
/* 13D3D0 0023D2D0 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 13D3D4 0023D2D4 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 13D3D8 0023D2D8 282E2072 */  paddub     $5, $17, $0
/* 13D3DC 0023D2DC 8036050C */  jal        SetBuff__6ClsMesFPs
/* 13D3E0 0023D2E0 00000000 */   nop
/* 13D3E4 0023D2E4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D3E8 0023D2E8 7CBC2284 */  lh         $2, -0x4384($at)
/* 13D3EC 0023D2EC DA01013C */  lui        $at, (0x1DA3A24 >> 16)
/* 13D3F0 0023D2F0 243A22AC */  sw         $2, (0x1DA3A24 & 0xFFFF)($at)
/* 13D3F4 0023D2F4 01000224 */  addiu      $2, $0, 0x1
/* 13D3F8 0023D2F8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D3FC 0023D2FC 70BC22A4 */  sh         $2, -0x4390($at)
/* 13D400 0023D300 80000224 */  addiu      $2, $0, 0x80
/* 13D404 0023D304 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D408 0023D308 7ABC22A4 */  sh         $2, -0x4386($at)
/* 13D40C 0023D30C 6800A427 */  addiu      $4, $sp, 0x68
/* 13D410 0023D310 208A80C7 */  lwc1       $f0, -0x75E0($gp)
/* 13D414 0023D314 248A8387 */  lh         $3, -0x75DC($gp)
/* 13D418 0023D318 268A8293 */  lbu        $2, -0x75DA($gp)
/* 13D41C 0023D31C 000080E4 */  swc1       $f0, 0x0($4)
/* 13D420 0023D320 040083A4 */  sh         $3, 0x4($4)
/* 13D424 0023D324 060082A0 */  sb         $2, 0x6($4)
/* 13D428 0023D328 21105D02 */  addu       $2, $18, $sp
/* 13D42C 0023D32C 68004280 */  lb         $2, 0x68($2)
/* 13D430 0023D330 2C014224 */  addiu      $2, $2, 0x12C
/* 13D434 0023D334 DA01013C */  lui        $at, (0x1DA2354 >> 16)
/* 13D438 0023D338 542322AC */  sw         $2, (0x1DA2354 & 0xFFFF)($at)
/* 13D43C 0023D33C FFFF0224 */  addiu      $2, $0, -0x1
/* 13D440 0023D340 DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* 13D444 0023D344 0C3A22AC */  sw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* 13D448 0023D348 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 13D44C 0023D34C 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 13D450 0023D350 64000524 */  addiu      $5, $0, 0x64
/* 13D454 0023D354 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 13D458 0023D358 00000000 */   nop
.L0023D35C:
/* 13D45C 0023D35C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D460 0023D360 70BC2284 */  lh         $2, -0x4390($at)
/* 13D464 0023D364 0C004010 */  beqz       $2, .L0023D398
/* 13D468 0023D368 00000000 */   nop
/* 13D46C 0023D36C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D470 0023D370 7ABC2284 */  lh         $2, -0x4386($at)
/* 13D474 0023D374 FFFF4224 */  addiu      $2, $2, -0x1
/* 13D478 0023D378 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D47C 0023D37C 7ABC22A4 */  sh         $2, -0x4386($at)
/* 13D480 0023D380 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D484 0023D384 7ABC2284 */  lh         $2, -0x4386($at)
/* 13D488 0023D388 0300401C */  bgtz       $2, .L0023D398
/* 13D48C 0023D38C 00000000 */   nop
/* 13D490 0023D390 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D494 0023D394 7ABC20A4 */  sh         $0, -0x4386($at)
.L0023D398:
/* 13D498 0023D398 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D49C 0023D39C 7ABC2284 */  lh         $2, -0x4386($at)
/* 13D4A0 0023D3A0 6C00401C */  bgtz       $2, .L0023D554
/* 13D4A4 0023D3A4 00000000 */   nop
/* 13D4A8 0023D3A8 01000224 */  addiu      $2, $0, 0x1
/* 13D4AC 0023D3AC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D4B0 0023D3B0 78BC22A4 */  sh         $2, -0x4388($at)
/* 13D4B4 0023D3B4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D4B8 0023D3B8 7CBC20A4 */  sh         $0, -0x4384($at)
/* 13D4BC 0023D3BC 65000010 */  b          .L0023D554
/* 13D4C0 0023D3C0 00000000 */   nop
/* 13D4C4 0023D3C4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D4C8 0023D3C8 7CBC2284 */  lh         $2, -0x4384($at)
/* 13D4CC 0023D3CC 02004224 */  addiu      $2, $2, 0x2
/* 13D4D0 0023D3D0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D4D4 0023D3D4 7CBC22A4 */  sh         $2, -0x4384($at)
/* 13D4D8 0023D3D8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D4DC 0023D3DC 7CBC2284 */  lh         $2, -0x4384($at)
/* 13D4E0 0023D3E0 80004228 */  slti       $2, $2, 0x80
/* 13D4E4 0023D3E4 5B004014 */  bnez       $2, .L0023D554
/* 13D4E8 0023D3E8 00000000 */   nop
/* 13D4EC 0023D3EC 80000224 */  addiu      $2, $0, 0x80
/* 13D4F0 0023D3F0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D4F4 0023D3F4 7CBC22A4 */  sh         $2, -0x4384($at)
/* 13D4F8 0023D3F8 02000224 */  addiu      $2, $0, 0x2
/* 13D4FC 0023D3FC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D500 0023D400 78BC22A4 */  sh         $2, -0x4388($at)
/* 13D504 0023D404 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D508 0023D408 7ABC20A4 */  sh         $0, -0x4386($at)
/* 13D50C 0023D40C 51000010 */  b          .L0023D554
/* 13D510 0023D410 00000000 */   nop
/* 13D514 0023D414 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D518 0023D418 7CBC2284 */  lh         $2, -0x4384($at)
/* 13D51C 0023D41C FEFF4224 */  addiu      $2, $2, -0x2
/* 13D520 0023D420 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D524 0023D424 7CBC22A4 */  sh         $2, -0x4384($at)
/* 13D528 0023D428 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D52C 0023D42C 7CBC2284 */  lh         $2, -0x4384($at)
/* 13D530 0023D430 4800401C */  bgtz       $2, .L0023D554
/* 13D534 0023D434 00000000 */   nop
/* 13D538 0023D438 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D53C 0023D43C 7CBC20A4 */  sh         $0, -0x4384($at)
/* 13D540 0023D440 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D544 0023D444 76BC2284 */  lh         $2, -0x438A($at)
/* 13D548 0023D448 01004224 */  addiu      $2, $2, 0x1
/* 13D54C 0023D44C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D550 0023D450 76BC22A4 */  sh         $2, -0x438A($at)
/* 13D554 0023D454 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D558 0023D458 76BC2284 */  lh         $2, -0x438A($at)
/* 13D55C 0023D45C 64004524 */  addiu      $5, $2, 0x64
/* 13D560 0023D460 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 13D564 0023D464 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 13D568 0023D468 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 13D56C 0023D46C 00000000 */   nop
/* 13D570 0023D470 01000224 */  addiu      $2, $0, 0x1
/* 13D574 0023D474 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D578 0023D478 78BC22A4 */  sh         $2, -0x4388($at)
/* 13D57C 0023D47C 35000010 */  b          .L0023D554
/* 13D580 0023D480 00000000 */   nop
/* 13D584 0023D484 CC01023C */  lui        $2, %hi(GamePad)
/* 13D588 0023D488 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 13D58C 0023D48C 40000524 */  addiu      $5, $0, 0x40
/* 13D590 0023D490 1CAE040C */  jal        Down__8CGamePadFi
/* 13D594 0023D494 00000000 */   nop
/* 13D598 0023D498 2E004010 */  beqz       $2, .L0023D554
/* 13D59C 0023D49C 00000000 */   nop
/* 13D5A0 0023D4A0 03000224 */  addiu      $2, $0, 0x3
/* 13D5A4 0023D4A4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D5A8 0023D4A8 78BC22A4 */  sh         $2, -0x4388($at)
/* 13D5AC 0023D4AC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D5B0 0023D4B0 76BC2284 */  lh         $2, -0x438A($at)
/* 13D5B4 0023D4B4 0B004228 */  slti       $2, $2, 0xB
/* 13D5B8 0023D4B8 26004014 */  bnez       $2, .L0023D554
/* 13D5BC 0023D4BC 00000000 */   nop
/* 13D5C0 0023D4C0 04000224 */  addiu      $2, $0, 0x4
/* 13D5C4 0023D4C4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D5C8 0023D4C8 78BC22A4 */  sh         $2, -0x4388($at)
/* 13D5CC 0023D4CC 21000010 */  b          .L0023D554
/* 13D5D0 0023D4D0 00000000 */   nop
/* 13D5D4 0023D4D4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D5D8 0023D4D8 7CBC2284 */  lh         $2, -0x4384($at)
/* 13D5DC 0023D4DC FFFF4224 */  addiu      $2, $2, -0x1
/* 13D5E0 0023D4E0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D5E4 0023D4E4 7CBC22A4 */  sh         $2, -0x4384($at)
/* 13D5E8 0023D4E8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D5EC 0023D4EC 7CBC2484 */  lh         $4, -0x4384($at)
/* 13D5F0 0023D4F0 1800801C */  bgtz       $4, .L0023D554
/* 13D5F4 0023D4F4 00000000 */   nop
/* 13D5F8 0023D4F8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D5FC 0023D4FC 78BC2384 */  lh         $3, -0x4388($at)
/* 13D600 0023D500 04000224 */  addiu      $2, $0, 0x4
/* 13D604 0023D504 13006214 */  bne        $3, $2, .L0023D554
/* 13D608 0023D508 00000000 */   nop
/* 13D60C 0023D50C 1100801C */  bgtz       $4, .L0023D554
/* 13D610 0023D510 00000000 */   nop
/* 13D614 0023D514 DA01013C */  lui        $at, (0x1DA3A14 >> 16)
/* 13D618 0023D518 143A20AC */  sw         $0, (0x1DA3A14 & 0xFFFF)($at)
/* 13D61C 0023D51C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D620 0023D520 74BC2584 */  lh         $5, -0x438C($at)
/* 13D624 0023D524 28260070 */  paddub     $4, $0, $0
/* 13D628 0023D528 DC97868F */  lw         $6, -0x6824($gp)
/* 13D62C 0023D52C 28E1080C */  jal        InitNameRegist__FiiP1
/* 13D630 0023D530 00000000 */   nop
/* 13D634 0023D534 05000224 */  addiu      $2, $0, 0x5
/* 13D638 0023D538 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D63C 0023D53C 78BC22A4 */  sh         $2, -0x4388($at)
/* 13D640 0023D540 04000010 */  b          .L0023D554
/* 13D644 0023D544 00000000 */   nop
/* 13D648 0023D548 10EA080C */  jal        NameEnterKey__Fv
/* 13D64C 0023D54C 00000000 */   nop
/* 13D650 0023D550 28864070 */  paddub     $16, $2, $0
.L0023D554:
/* 13D654 0023D554 28160072 */  paddub     $2, $16, $0
/* 13D658 0023D558 3000BF7B */  lq         $31, 0x30($sp)
/* 13D65C 0023D55C 2000B27B */  lq         $18, 0x20($sp)
/* 13D660 0023D560 1000B17B */  lq         $17, 0x10($sp)
/* 13D664 0023D564 0000B07B */  lq         $16, 0x0($sp)
/* 13D668 0023D568 7000BD27 */  addiu      $sp, $sp, 0x70
/* 13D66C 0023D56C 0800E003 */  jr         $31
/* 13D670 0023D570 00000000 */   nop
/* 13D674 0023D574 00000000 */  nop
/* 13D678 0023D578 00000000 */  nop
/* 13D67C 0023D57C 00000000 */  nop
