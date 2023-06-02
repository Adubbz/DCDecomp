.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DngEscapeMsgInit__FP6ClsMesP6ClsMesi
/* 10F090 0020EF90 F0FEBD27 */  addiu      $sp, $sp, -0x110
/* 10F094 0020EF94 5000BF7F */  sq         $31, 0x50($sp)
/* 10F098 0020EF98 4000B47F */  sq         $20, 0x40($sp)
/* 10F09C 0020EF9C 3000B37F */  sq         $19, 0x30($sp)
/* 10F0A0 0020EFA0 2000B27F */  sq         $18, 0x20($sp)
/* 10F0A4 0020EFA4 1000B17F */  sq         $17, 0x10($sp)
/* 10F0A8 0020EFA8 0000B07F */  sq         $16, 0x0($sp)
/* 10F0AC 0020EFAC 28A68070 */  paddub     $20, $4, $0
/* 10F0B0 0020EFB0 289EA070 */  paddub     $19, $5, $0
/* 10F0B4 0020EFB4 2896C070 */  paddub     $18, $6, $0
/* 10F0B8 0020EFB8 03008012 */  beqz       $20, .L0020EFC8
/* 10F0BC 0020EFBC 00000000 */   nop
/* 10F0C0 0020EFC0 03006016 */  bnez       $19, .L0020EFD0
/* 10F0C4 0020EFC4 00000000 */   nop
.L0020EFC8:
/* 10F0C8 0020EFC8 93000010 */  b          .L0020F218
/* 10F0CC 0020EFCC 00000000 */   nop
.L0020EFD0:
/* 10F0D0 0020EFD0 789C838F */  lw         $3, -0x6388($gp)
/* 10F0D4 0020EFD4 90006010 */  beqz       $3, .L0020F218
/* 10F0D8 0020EFD8 00000000 */   nop
/* 10F0DC 0020EFDC 00006280 */  lb         $2, 0x0($3)
/* 10F0E0 0020EFE0 01005024 */  addiu      $16, $2, 0x1
/* 10F0E4 0020EFE4 7CAE080C */  jal        GetMenuTextureDir__Fv
/* 10F0E8 0020EFE8 00000000 */   nop
/* 10F0EC 0020EFEC 6000A427 */  addiu      $4, $sp, 0x60
/* 10F0F0 0020EFF0 282E4070 */  paddub     $5, $2, $0
/* 10F0F4 0020EFF4 5A15040C */  jal        strcpy
/* 10F0F8 0020EFF8 00000000 */   nop
/* 10F0FC 0020EFFC 6000A427 */  addiu      $4, $sp, 0x60
/* 10F100 0020F000 2A00023C */  lui        $2, %hi(_1341)
/* 10F104 0020F004 B8E14524 */  addiu      $5, $2, %lo(_1341)
/* 10F108 0020F008 BC14040C */  jal        strcat
/* 10F10C 0020F00C 00000000 */   nop
/* 10F110 0020F010 6000A427 */  addiu      $4, $sp, 0x60
/* 10F114 0020F014 282E8070 */  paddub     $5, $4, $0
/* 10F118 0020F018 28360072 */  paddub     $6, $16, $0
/* 10F11C 0020F01C 1614040C */  jal        sprintf
/* 10F120 0020F020 00000000 */   nop
/* 10F124 0020F024 6000A427 */  addiu      $4, $sp, 0x60
/* 10F128 0020F028 948B858F */  lw         $5, -0x746C($gp)
/* 10F12C 0020F02C 0C01A627 */  addiu      $6, $sp, 0x10C
/* 10F130 0020F030 D8FC040C */  jal        LoadFile__FPcPvPi
/* 10F134 0020F034 00000000 */   nop
/* 10F138 0020F038 17001124 */  addiu      $17, $0, 0x17
/* 10F13C 0020F03C 948B868F */  lw         $6, -0x746C($gp)
/* 10F140 0020F040 2900023C */  lui        $2, %hi(_1333)
/* 10F144 0020F044 203C4524 */  addiu      $5, $2, %lo(_1333)
/* 10F148 0020F048 A000A427 */  addiu      $4, $sp, 0xA0
/* 10F14C 0020F04C 02000324 */  addiu      $3, $0, 0x2
.L0020F050:
/* 10F150 0020F050 0000A278 */  lq         $2, 0x0($5)
/* 10F154 0020F054 1000A524 */  addiu      $5, $5, 0x10
/* 10F158 0020F058 FFFF6324 */  addiu      $3, $3, -0x1
/* 10F15C 0020F05C 0000827C */  sq         $2, 0x0($4)
/* 10F160 0020F060 10008424 */  addiu      $4, $4, 0x10
/* 10F164 0020F064 FAFF601C */  bgtz       $3, .L0020F050
/* 10F168 0020F068 00000000 */   nop
/* 10F16C 0020F06C 0000A2C4 */  lwc1       $f2, 0x0($5)
/* 10F170 0020F070 000082E4 */  swc1       $f2, 0x0($4)
/* 10F174 0020F074 17000524 */  addiu      $5, $0, 0x17
/* 10F178 0020F078 A400A5AF */  sw         $5, 0xA4($sp)
/* 10F17C 0020F07C AC00A6AF */  sw         $6, 0xAC($sp)
/* 10F180 0020F080 B000A5AF */  sw         $5, 0xB0($sp)
/* 10F184 0020F084 C701023C */  lui        $2, %hi(TexManager)
/* 10F188 0020F088 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10F18C 0020F08C C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 10F190 0020F090 00000000 */   nop
/* 10F194 0020F094 C701023C */  lui        $2, %hi(TexManager)
/* 10F198 0020F098 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10F19C 0020F09C 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 10F1A0 0020F0A0 00000000 */   nop
/* 10F1A4 0020F0A4 C701023C */  lui        $2, %hi(TexManager)
/* 10F1A8 0020F0A8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10F1AC 0020F0AC FFFF0524 */  addiu      $5, $0, -0x1
/* 10F1B0 0020F0B0 A000A627 */  addiu      $6, $sp, 0xA0
/* 10F1B4 0020F0B4 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 10F1B8 0020F0B8 00000000 */   nop
/* 10F1BC 0020F0BC CC01023C */  lui        $2, %hi(GamePad)
/* 10F1C0 0020F0C0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 10F1C4 0020F0C4 78000524 */  addiu      $5, $0, 0x78
/* 10F1C8 0020F0C8 48AE040C */  jal        MenuModeOn__8CGamePadFi
/* 10F1CC 0020F0CC 00000000 */   nop
/* 10F1D0 0020F0D0 CC01023C */  lui        $2, %hi(GamePad)
/* 10F1D4 0020F0D4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 10F1D8 0020F0D8 00F00534 */  ori        $5, $0, 0xF000
/* 10F1DC 0020F0DC 1E000624 */  addiu      $6, $0, 0x1E
/* 10F1E0 0020F0E0 05000724 */  addiu      $7, $0, 0x5
/* 10F1E4 0020F0E4 58AD040C */  jal        SetAutoRepeat__8CGamePadFiii
/* 10F1E8 0020F0E8 00000000 */   nop
/* 10F1EC 0020F0EC E800A427 */  addiu      $4, $sp, 0xE8
/* 10F1F0 0020F0F0 F88882DF */  ld         $2, -0x7708($gp)
/* 10F1F4 0020F0F4 000082FC */  sd         $2, 0x0($4)
/* 10F1F8 0020F0F8 282E8070 */  paddub     $5, $4, $0
/* 10F1FC 0020F0FC 28360072 */  paddub     $6, $16, $0
/* 10F200 0020F100 1614040C */  jal        sprintf
/* 10F204 0020F104 00000000 */   nop
/* 10F208 0020F108 C701023C */  lui        $2, %hi(TexManager)
/* 10F20C 0020F10C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10F210 0020F110 E800A527 */  addiu      $5, $sp, 0xE8
/* 10F214 0020F114 FFFF0624 */  addiu      $6, $0, -0x1
/* 10F218 0020F118 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 10F21C 0020F11C 00000000 */   nop
/* 10F220 0020F120 289682AF */  sw         $2, -0x69D8($gp)
/* 10F224 0020F124 189694AF */  sw         $20, -0x69E8($gp)
/* 10F228 0020F128 1C9693AF */  sw         $19, -0x69E4($gp)
/* 10F22C 0020F12C 80AE080C */  jal        GetMenuLangFlag__Fv
/* 10F230 0020F130 00000000 */   nop
/* 10F234 0020F134 F000A527 */  addiu      $5, $sp, 0xF0
/* 10F238 0020F138 008980C7 */  lwc1       $f0, -0x7700($gp)
/* 10F23C 0020F13C 04898487 */  lh         $4, -0x76FC($gp)
/* 10F240 0020F140 06898393 */  lbu        $3, -0x76FA($gp)
/* 10F244 0020F144 0000A0E4 */  swc1       $f0, 0x0($5)
/* 10F248 0020F148 0400A4A4 */  sh         $4, 0x4($5)
/* 10F24C 0020F14C 0600A3A0 */  sb         $3, 0x6($5)
/* 10F250 0020F150 21105D00 */  addu       $2, $2, $sp
/* 10F254 0020F154 F0004390 */  lbu        $3, 0xF0($2)
/* 10F258 0020F158 1896828F */  lw         $2, -0x69E8($gp)
/* 10F25C 0020F15C 000043AC */  sw         $3, 0x0($2)
/* 10F260 0020F160 8C000324 */  addiu      $3, $0, 0x8C
/* 10F264 0020F164 1896828F */  lw         $2, -0x69E8($gp)
/* 10F268 0020F168 040043AC */  sw         $3, 0x4($2)
/* 10F26C 0020F16C FFFF0324 */  addiu      $3, $0, -0x1
/* 10F270 0020F170 1896828F */  lw         $2, -0x69E8($gp)
/* 10F274 0020F174 BC1643AC */  sw         $3, 0x16BC($2)
/* 10F278 0020F178 14004526 */  addiu      $5, $18, 0x14
/* 10F27C 0020F17C 1896848F */  lw         $4, -0x69E8($gp)
/* 10F280 0020F180 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 10F284 0020F184 00000000 */   nop
/* 10F288 0020F188 2900023C */  lui        $2, %hi(_1336)
/* 10F28C 0020F18C 483C4224 */  addiu      $2, $2, %lo(_1336)
/* 10F290 0020F190 F800A427 */  addiu      $4, $sp, 0xF8
/* 10F294 0020F194 000043DC */  ld         $3, 0x0($2)
/* 10F298 0020F198 080040C4 */  lwc1       $f0, 0x8($2)
/* 10F29C 0020F19C 0C004284 */  lh         $2, 0xC($2)
/* 10F2A0 0020F1A0 000083FC */  sd         $3, 0x0($4)
/* 10F2A4 0020F1A4 080080E4 */  swc1       $f0, 0x8($4)
/* 10F2A8 0020F1A8 0C0082A4 */  sh         $2, 0xC($4)
/* 10F2AC 0020F1AC 80021024 */  addiu      $16, $0, 0x280
/* 10F2B0 0020F1B0 FFFF0324 */  addiu      $3, $0, -0x1
/* 10F2B4 0020F1B4 1C96828F */  lw         $2, -0x69E4($gp)
/* 10F2B8 0020F1B8 BC1643AC */  sw         $3, 0x16BC($2)
/* 10F2BC 0020F1BC 1C96848F */  lw         $4, -0x69E4($gp)
/* 10F2C0 0020F1C0 0C000524 */  addiu      $5, $0, 0xC
/* 10F2C4 0020F1C4 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 10F2C8 0020F1C8 00000000 */   nop
/* 10F2CC 0020F1CC 1C96848F */  lw         $4, -0x69E4($gp)
/* 10F2D0 0020F1D0 BC16858C */  lw         $5, 0x16BC($4)
/* 10F2D4 0020F1D4 D000A627 */  addiu      $6, $sp, 0xD0
/* 10F2D8 0020F1D8 583F050C */  jal        NeedMesWinWH__6ClsMesFiPi
/* 10F2DC 0020F1DC 00000000 */   nop
/* 10F2E0 0020F1E0 D800A38F */  lw         $3, 0xD8($sp)
/* 10F2E4 0020F1E4 23800302 */  subu       $16, $16, $3
/* 10F2E8 0020F1E8 DAFF0426 */  addiu      $4, $16, -0x26
/* 10F2EC 0020F1EC 1C96838F */  lw         $3, -0x69E4($gp)
/* 10F2F0 0020F1F0 000064AC */  sw         $4, 0x0($3)
/* 10F2F4 0020F1F4 40010424 */  addiu      $4, $0, 0x140
/* 10F2F8 0020F1F8 1C96838F */  lw         $3, -0x69E4($gp)
/* 10F2FC 0020F1FC 040064AC */  sw         $4, 0x4($3)
/* 10F300 0020F200 01000324 */  addiu      $3, $0, 0x1
/* 10F304 0020F204 F08883A7 */  sh         $3, -0x7710($gp)
/* 10F308 0020F208 309680A7 */  sh         $0, -0x69D0($gp)
/* 10F30C 0020F20C 80000324 */  addiu      $3, $0, 0x80
/* 10F310 0020F210 EC8883A7 */  sh         $3, -0x7714($gp)
/* 10F314 0020F214 2C9691A7 */  sh         $17, -0x69D4($gp)
.L0020F218:
/* 10F318 0020F218 5000BF7B */  lq         $31, 0x50($sp)
/* 10F31C 0020F21C 4000B47B */  lq         $20, 0x40($sp)
/* 10F320 0020F220 3000B37B */  lq         $19, 0x30($sp)
/* 10F324 0020F224 2000B27B */  lq         $18, 0x20($sp)
/* 10F328 0020F228 1000B17B */  lq         $17, 0x10($sp)
/* 10F32C 0020F22C 0000B07B */  lq         $16, 0x0($sp)
/* 10F330 0020F230 1001BD27 */  addiu      $sp, $sp, 0x110
/* 10F334 0020F234 0800E003 */  jr         $31
/* 10F338 0020F238 00000000 */   nop
/* 10F33C 0020F23C 00000000 */  nop
