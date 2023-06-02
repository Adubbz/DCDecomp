.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BattleMenuInit__FPii
/* F5DF0 001F5CF0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* F5DF4 001F5CF4 1000BF7F */  sq         $31, 0x10($sp)
/* F5DF8 001F5CF8 0000B07F */  sq         $16, 0x0($sp)
/* F5DFC 001F5CFC D89485AF */  sw         $5, -0x6B28($gp)
/* F5E00 001F5D00 0000828C */  lw         $2, 0x0($4)
/* F5E04 001F5D04 E09482AF */  sw         $2, -0x6B20($gp)
/* F5E08 001F5D08 0400828C */  lw         $2, 0x4($4)
/* F5E0C 001F5D0C 009582AF */  sw         $2, -0x6B00($gp)
/* F5E10 001F5D10 0800828C */  lw         $2, 0x8($4)
/* F5E14 001F5D14 F89482AF */  sw         $2, -0x6B08($gp)
/* F5E18 001F5D18 0C00828C */  lw         $2, 0xC($4)
/* F5E1C 001F5D1C 109582AF */  sw         $2, -0x6AF0($gp)
/* F5E20 001F5D20 0C00828C */  lw         $2, 0xC($4)
/* F5E24 001F5D24 EC9482AF */  sw         $2, -0x6B14($gp)
/* F5E28 001F5D28 1000828C */  lw         $2, 0x10($4)
/* F5E2C 001F5D2C F49482AF */  sw         $2, -0x6B0C($gp)
/* F5E30 001F5D30 80AE080C */  jal        GetMenuLangFlag__Fv
/* F5E34 001F5D34 00000000 */   nop
/* F5E38 001F5D38 1C8882AF */  sw         $2, -0x77E4($gp)
/* F5E3C 001F5D3C CC01023C */  lui        $2, %hi(GamePad)
/* F5E40 001F5D40 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F5E44 001F5D44 00F00534 */  ori        $5, $0, 0xF000
/* F5E48 001F5D48 1E000624 */  addiu      $6, $0, 0x1E
/* F5E4C 001F5D4C 05000724 */  addiu      $7, $0, 0x5
/* F5E50 001F5D50 58AD040C */  jal        SetAutoRepeat__8CGamePadFiii
/* F5E54 001F5D54 00000000 */   nop
/* F5E58 001F5D58 CC01023C */  lui        $2, %hi(GamePad)
/* F5E5C 001F5D5C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F5E60 001F5D60 78000524 */  addiu      $5, $0, 0x78
/* F5E64 001F5D64 48AE040C */  jal        MenuModeOn__8CGamePadFi
/* F5E68 001F5D68 00000000 */   nop
/* F5E6C 001F5D6C D894828F */  lw         $2, -0x6B28($gp)
/* F5E70 001F5D70 03004010 */  beqz       $2, .L001F5D80
/* F5E74 001F5D74 00000000 */   nop
/* F5E78 001F5D78 2A000010 */  b          .L001F5E24
/* F5E7C 001F5D7C 00000000 */   nop
.L001F5D80:
/* F5E80 001F5D80 2900023C */  lui        $2, %hi(_969_2)
/* F5E84 001F5D84 202F4224 */  addiu      $2, $2, %lo(_969_2)
/* F5E88 001F5D88 2000A427 */  addiu      $4, $sp, 0x20
/* F5E8C 001F5D8C 00004378 */  lq         $3, 0x0($2)
/* F5E90 001F5D90 100042DC */  ld         $2, 0x10($2)
/* F5E94 001F5D94 0000837C */  sq         $3, 0x0($4)
/* F5E98 001F5D98 100082FC */  sd         $2, 0x10($4)
/* F5E9C 001F5D9C E094858F */  lw         $5, -0x6B20($gp)
/* F5EA0 001F5DA0 2400A5AF */  sw         $5, 0x24($sp)
/* F5EA4 001F5DA4 2900023C */  lui        $2, %hi(_970)
/* F5EA8 001F5DA8 402F4224 */  addiu      $2, $2, %lo(_970)
/* F5EAC 001F5DAC 4000A427 */  addiu      $4, $sp, 0x40
/* F5EB0 001F5DB0 00004378 */  lq         $3, 0x0($2)
/* F5EB4 001F5DB4 100042DC */  ld         $2, 0x10($2)
/* F5EB8 001F5DB8 0000837C */  sq         $3, 0x0($4)
/* F5EBC 001F5DBC 100082FC */  sd         $2, 0x10($4)
/* F5EC0 001F5DC0 4000A5AF */  sw         $5, 0x40($sp)
/* F5EC4 001F5DC4 0095828F */  lw         $2, -0x6B00($gp)
/* F5EC8 001F5DC8 4400A2AF */  sw         $2, 0x44($sp)
/* F5ECC 001F5DCC F894828F */  lw         $2, -0x6B08($gp)
/* F5ED0 001F5DD0 4800A2AF */  sw         $2, 0x48($sp)
/* F5ED4 001F5DD4 1095828F */  lw         $2, -0x6AF0($gp)
/* F5ED8 001F5DD8 4C00A2AF */  sw         $2, 0x4C($sp)
/* F5EDC 001F5DDC F494828F */  lw         $2, -0x6B0C($gp)
/* F5EE0 001F5DE0 5000A2AF */  sw         $2, 0x50($sp)
/* F5EE4 001F5DE4 4CB4080C */  jal        MenuTextureDelete__FPi
/* F5EE8 001F5DE8 00000000 */   nop
/* F5EEC 001F5DEC C701023C */  lui        $2, %hi(TexManager)
/* F5EF0 001F5DF0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F5EF4 001F5DF4 FCCD040C */  jal        CleanUpBuffer__15CTextureManagerFv
/* F5EF8 001F5DF8 00000000 */   nop
/* F5EFC 001F5DFC C701023C */  lui        $2, %hi(TexManager)
/* F5F00 001F5E00 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F5F04 001F5E04 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* F5F08 001F5E08 00000000 */   nop
/* F5F0C 001F5E0C C701023C */  lui        $2, %hi(TexManager)
/* F5F10 001F5E10 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F5F14 001F5E14 FFFF0524 */  addiu      $5, $0, -0x1
/* F5F18 001F5E18 2000A627 */  addiu      $6, $sp, 0x20
/* F5F1C 001F5E1C 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* F5F20 001F5E20 00000000 */   nop
.L001F5E24:
/* F5F24 001F5E24 D894848F */  lw         $4, -0x6B28($gp)
/* F5F28 001F5E28 ECAE080C */  jal        BtlMenuBufferSet__Fi
/* F5F2C 001F5E2C 00000000 */   nop
/* F5F30 001F5E30 E49482AF */  sw         $2, -0x6B1C($gp)
/* F5F34 001F5E34 E494848F */  lw         $4, -0x6B1C($gp)
/* F5F38 001F5E38 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* F5F3C 001F5E3C 00000000 */   nop
/* F5F40 001F5E40 E49482AF */  sw         $2, -0x6B1C($gp)
/* F5F44 001F5E44 30FB040C */  jal        StartReadBG__Fv
/* F5F48 001F5E48 00000000 */   nop
/* F5F4C 001F5E4C 2A00023C */  lui        $2, %hi(_1011_2)
/* F5F50 001F5E50 F0D54424 */  addiu      $4, $2, %lo(_1011_2)
/* F5F54 001F5E54 E494858F */  lw         $5, -0x6B1C($gp)
/* F5F58 001F5E58 ACAE080C */  jal        LoadFileBGMenuData__FPcP1
/* F5F5C 001F5E5C 00000000 */   nop
/* F5F60 001F5E60 28864070 */  paddub     $16, $2, $0
/* F5F64 001F5E64 38FB040C */  jal        ReadBG__Fv
/* F5F68 001F5E68 00000000 */   nop
/* F5F6C 001F5E6C 03111000 */  sra        $2, $16, 4
/* F5F70 001F5E70 01004224 */  addiu      $2, $2, 0x1
/* F5F74 001F5E74 00190200 */  sll        $3, $2, 4
/* F5F78 001F5E78 E494828F */  lw         $2, -0x6B1C($gp)
/* F5F7C 001F5E7C 21104300 */  addu       $2, $2, $3
/* F5F80 001F5E80 E49482AF */  sw         $2, -0x6B1C($gp)
/* F5F84 001F5E84 E494848F */  lw         $4, -0x6B1C($gp)
/* F5F88 001F5E88 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* F5F8C 001F5E8C 00000000 */   nop
/* F5F90 001F5E90 E49482AF */  sw         $2, -0x6B1C($gp)
/* F5F94 001F5E94 01000224 */  addiu      $2, $0, 0x1
/* F5F98 001F5E98 FC9482AF */  sw         $2, -0x6B04($gp)
/* F5F9C 001F5E9C E89480AF */  sw         $0, -0x6B18($gp)
/* F5FA0 001F5EA0 049580AF */  sw         $0, -0x6AFC($gp)
/* F5FA4 001F5EA4 D901023C */  lui        $2, %hi(MenuMes)
/* F5FA8 001F5EA8 F0034424 */  addiu      $4, $2, %lo(MenuMes)
/* F5FAC 001F5EAC 602D080C */  jal        InitMes__10MenuClsMesFv
/* F5FB0 001F5EB0 00000000 */   nop
/* F5FB4 001F5EB4 E494828F */  lw         $2, -0x6B1C($gp)
/* F5FB8 001F5EB8 D901013C */  lui        $at, (0x1D90408 >> 16)
/* F5FBC 001F5EBC 080422AC */  sw         $2, (0x1D90408 & 0xFFFF)($at)
/* F5FC0 001F5EC0 2A00023C */  lui        $2, %hi(_1012)
/* F5FC4 001F5EC4 08D64424 */  addiu      $4, $2, %lo(_1012)
/* F5FC8 001F5EC8 A611040C */  jal        printf
/* F5FCC 001F5ECC 00000000 */   nop
/* F5FD0 001F5ED0 E494828F */  lw         $2, -0x6B1C($gp)
/* F5FD4 001F5ED4 10014224 */  addiu      $2, $2, 0x110
/* F5FD8 001F5ED8 E49482AF */  sw         $2, -0x6B1C($gp)
/* F5FDC 001F5EDC E494848F */  lw         $4, -0x6B1C($gp)
/* F5FE0 001F5EE0 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* F5FE4 001F5EE4 00000000 */   nop
/* F5FE8 001F5EE8 E49482AF */  sw         $2, -0x6B1C($gp)
/* F5FEC 001F5EEC C701023C */  lui        $2, %hi(TexManager)
/* F5FF0 001F5EF0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F5FF4 001F5EF4 2A00023C */  lui        $2, %hi(_1013)
/* F5FF8 001F5EF8 18D64524 */  addiu      $5, $2, %lo(_1013)
/* F5FFC 001F5EFC FFFF0624 */  addiu      $6, $0, -0x1
/* F6000 001F5F00 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F6004 001F5F04 00000000 */   nop
/* F6008 001F5F08 A09682AF */  sw         $2, -0x6960($gp)
/* F600C 001F5F0C B09680AF */  sw         $0, -0x6950($gp)
/* F6010 001F5F10 A89680AF */  sw         $0, -0x6958($gp)
/* F6014 001F5F14 AC9680AF */  sw         $0, -0x6954($gp)
/* F6018 001F5F18 A49680AF */  sw         $0, -0x695C($gp)
/* F601C 001F5F1C 1C8D848F */  lw         $4, -0x72E4($gp)
/* F6020 001F5F20 D09484AF */  sw         $4, -0x6B30($gp)
/* F6024 001F5F24 D894838F */  lw         $3, -0x6B28($gp)
/* F6028 001F5F28 01000224 */  addiu      $2, $0, 0x1
/* F602C 001F5F2C 0F006210 */  beq        $3, $2, .L001F5F6C
/* F6030 001F5F30 00000000 */   nop
/* F6034 001F5F34 03006010 */  beqz       $3, .L001F5F44
/* F6038 001F5F38 00000000 */   nop
/* F603C 001F5F3C 13000010 */  b          .L001F5F8C
/* F6040 001F5F40 00000000 */   nop
.L001F5F44:
/* F6044 001F5F44 CC9480AF */  sw         $0, -0x6B34($gp)
/* F6048 001F5F48 789C828F */  lw         $2, -0x6388($gp)
/* F604C 001F5F4C D49482AF */  sw         $2, -0x6B2C($gp)
/* F6050 001F5F50 D0CF070C */  jal        EscapeDungeonMode__Fv
/* F6054 001F5F54 00000000 */   nop
/* F6058 001F5F58 28264070 */  paddub     $4, $2, $0
/* F605C 001F5F5C E8CF070C */  jal        SetEscapeDngFlag__Fi
/* F6060 001F5F60 00000000 */   nop
/* F6064 001F5F64 09000010 */  b          .L001F5F8C
/* F6068 001F5F68 00000000 */   nop
.L001F5F6C:
/* F606C 001F5F6C FFFF0224 */  addiu      $2, $0, -0x1
/* F6070 001F5F70 CC9482AF */  sw         $2, -0x6B34($gp)
/* F6074 001F5F74 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* F6078 001F5F78 00000000 */   nop
/* F607C 001F5F7C D49482AF */  sw         $2, -0x6B2C($gp)
/* F6080 001F5F80 28260070 */  paddub     $4, $0, $0
/* F6084 001F5F84 E8CF070C */  jal        SetEscapeDngFlag__Fi
/* F6088 001F5F88 00000000 */   nop
.L001F5F8C:
/* F608C 001F5F8C 28260070 */  paddub     $4, $0, $0
/* F6090 001F5F90 F0CF070C */  jal        SetInteriorOutFlag__Fi
/* F6094 001F5F94 00000000 */   nop
/* F6098 001F5F98 D494838F */  lw         $3, -0x6B2C($gp)
/* F609C 001F5F9C 0C456224 */  addiu      $2, $3, 0x450C
/* F60A0 001F5FA0 149582AF */  sw         $2, -0x6AEC($gp)
/* F60A4 001F5FA4 60436224 */  addiu      $2, $3, 0x4360
/* F60A8 001F5FA8 609582AF */  sw         $2, -0x6AA0($gp)
/* F60AC 001F5FAC 06000224 */  addiu      $2, $0, 0x6
/* F60B0 001F5FB0 D901013C */  lui        $at, (0x1D90472 >> 16)
/* F60B4 001F5FB4 720422A0 */  sb         $2, (0x1D90472 & 0xFFFF)($at)
/* F60B8 001F5FB8 D901013C */  lui        $at, (0x1D90472 >> 16)
/* F60BC 001F5FBC 72042280 */  lb         $2, (0x1D90472 & 0xFFFF)($at)
/* F60C0 001F5FC0 00008244 */  mtc1       $2, $f0
/* F60C4 001F5FC4 00000000 */  nop
/* F60C8 001F5FC8 60008046 */  cvt.s.w    $f1, $f0
/* F60CC 001F5FCC 988280C7 */  lwc1       $f0, -0x7D68($gp)
/* F60D0 001F5FD0 03000146 */  div.s      $f0, $f0, $f1
/* F60D4 001F5FD4 709580E7 */  swc1       $f0, -0x6A90($gp)
/* F60D8 001F5FD8 DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* F60DC 001F5FDC 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* F60E0 001F5FE0 C8D5080C */  jal        CheckItemVolume__13CMenuItemStepFv
/* F60E4 001F5FE4 00000000 */   nop
/* F60E8 001F5FE8 F89680AF */  sw         $0, -0x6908($gp)
/* F60EC 001F5FEC 4C9580AF */  sw         $0, -0x6AB4($gp)
/* F60F0 001F5FF0 40958427 */  addiu      $4, $gp, -0x6AC0
/* F60F4 001F5FF4 44958527 */  addiu      $5, $gp, -0x6ABC
/* F60F8 001F5FF8 50958627 */  addiu      $6, $gp, -0x6AB0
/* F60FC 001F5FFC 54958727 */  addiu      $7, $gp, -0x6AAC
/* F6100 001F6000 C4B8080C */  jal        GetMainMenuRightHelpWinLangOffset__FRfRfRfRf
/* F6104 001F6004 00000000 */   nop
/* F6108 001F6008 01000224 */  addiu      $2, $0, 0x1
/* F610C 001F600C 489582A3 */  sb         $2, -0x6AB8($gp)
/* F6110 001F6010 589582AF */  sw         $2, -0x6AA8($gp)
/* F6114 001F6014 5C9580AF */  sw         $0, -0x6AA4($gp)
/* F6118 001F6018 28260070 */  paddub     $4, $0, $0
/* F611C 001F601C 13000010 */  b          .L001F606C
/* F6120 001F6020 00000000 */   nop
.L001F6024:
/* F6124 001F6024 16C3033C */  lui        $3, (0xC3160000 >> 16)
/* F6128 001F6028 C0280400 */  sll        $5, $4, 3
/* F612C 001F602C D901023C */  lui        $2, %hi(NorMenuIcon)
/* F6130 001F6030 20044224 */  addiu      $2, $2, %lo(NorMenuIcon)
/* F6134 001F6034 21104500 */  addu       $2, $2, $5
/* F6138 001F6038 000043AC */  sw         $3, 0x0($2)
/* F613C 001F603C 80100400 */  sll        $2, $4, 2
/* F6140 001F6040 21104400 */  addu       $2, $2, $4
/* F6144 001F6044 C0100200 */  sll        $2, $2, 3
/* F6148 001F6048 30004224 */  addiu      $2, $2, 0x30
/* F614C 001F604C 00008244 */  mtc1       $2, $f0
/* F6150 001F6050 00000000 */  nop
/* F6154 001F6054 20008046 */  cvt.s.w    $f0, $f0
/* F6158 001F6058 D901023C */  lui        $2, %hi(D_1D90424)
/* F615C 001F605C 24044224 */  addiu      $2, $2, %lo(D_1D90424)
/* F6160 001F6060 21104500 */  addu       $2, $2, $5
/* F6164 001F6064 000040E4 */  swc1       $f0, 0x0($2)
/* F6168 001F6068 01008424 */  addiu      $4, $4, 0x1
.L001F606C:
/* F616C 001F606C 08008228 */  slti       $2, $4, 0x8
/* F6170 001F6070 ECFF4014 */  bnez       $2, .L001F6024
/* F6174 001F6074 00000000 */   nop
/* F6178 001F6078 28260070 */  paddub     $4, $0, $0
/* F617C 001F607C 282E0070 */  paddub     $5, $0, $0
/* F6180 001F6080 343D080C */  jal        CheckItemThrow__FPiPi
/* F6184 001F6084 00000000 */   nop
/* F6188 001F6088 1C004010 */  beqz       $2, .L001F60FC
/* F618C 001F608C 00000000 */   nop
/* F6190 001F6090 19000224 */  addiu      $2, $0, 0x19
/* F6194 001F6094 208882AF */  sw         $2, -0x77E0($gp)
/* F6198 001F6098 FFFF0224 */  addiu      $2, $0, -0x1
/* F619C 001F609C 308882AF */  sw         $2, -0x77D0($gp)
/* F61A0 001F60A0 01000524 */  addiu      $5, $0, 0x1
/* F61A4 001F60A4 D494828F */  lw         $2, -0x6B2C($gp)
/* F61A8 001F60A8 1C4345AC */  sw         $5, 0x431C($2)
/* F61AC 001F60AC 08000010 */  b          .L001F60D0
/* F61B0 001F60B0 00000000 */   nop
.L001F60B4:
/* F61B4 001F60B4 66C3043C */  lui        $4, (0xC3660000 >> 16)
/* F61B8 001F60B8 C0180500 */  sll        $3, $5, 3
/* F61BC 001F60BC D901023C */  lui        $2, %hi(NorMenuIcon)
/* F61C0 001F60C0 20044224 */  addiu      $2, $2, %lo(NorMenuIcon)
/* F61C4 001F60C4 21104300 */  addu       $2, $2, $3
/* F61C8 001F60C8 000044AC */  sw         $4, 0x0($2)
/* F61CC 001F60CC 0100A524 */  addiu      $5, $5, 0x1
.L001F60D0:
/* F61D0 001F60D0 0800A228 */  slti       $2, $5, 0x8
/* F61D4 001F60D4 F7FF4014 */  bnez       $2, .L001F60B4
/* F61D8 001F60D8 00000000 */   nop
/* F61DC 001F60DC 8C42023C */  lui        $2, (0x428C0000 >> 16)
/* F61E0 001F60E0 D901013C */  lui        $at, (0x1D90420 >> 16)
/* F61E4 001F60E4 200422AC */  sw         $2, (0x1D90420 & 0xFFFF)($at)
/* F61E8 001F60E8 E041023C */  lui        $2, (0x41E00000 >> 16)
/* F61EC 001F60EC D901013C */  lui        $at, (0x1D90424 >> 16)
/* F61F0 001F60F0 240422AC */  sw         $2, (0x1D90424 & 0xFFFF)($at)
/* F61F4 001F60F4 04000010 */  b          .L001F6108
/* F61F8 001F60F8 00000000 */   nop
.L001F60FC:
/* F61FC 001F60FC FFFF0224 */  addiu      $2, $0, -0x1
/* F6200 001F6100 208882AF */  sw         $2, -0x77E0($gp)
/* F6204 001F6104 308882AF */  sw         $2, -0x77D0($gp)
.L001F6108:
/* F6208 001F6108 01000224 */  addiu      $2, $0, 0x1
/* F620C 001F610C D901013C */  lui        $at, (0x1D90473 >> 16)
/* F6210 001F6110 730422A0 */  sb         $2, (0x1D90473 & 0xFFFF)($at)
/* F6214 001F6114 DB01023C */  lui        $2, %hi(MenuWepLevelUp)
/* F6218 001F6118 E0A84424 */  addiu      $4, $2, %lo(MenuWepLevelUp)
/* F621C 001F611C 7CD8080C */  jal        Initialize__14CWeaponLevelUpFv
/* F6220 001F6120 00000000 */   nop
/* F6224 001F6124 849580AF */  sw         $0, -0x6A7C($gp)
/* F6228 001F6128 889580AF */  sw         $0, -0x6A78($gp)
/* F622C 001F612C 7867050C */  jal        SndGetBgmVol__Fv
/* F6230 001F6130 00000000 */   nop
/* F6234 001F6134 DC9482AF */  sw         $2, -0x6B24($gp)
/* F6238 001F6138 1000BF7B */  lq         $31, 0x10($sp)
/* F623C 001F613C 0000B07B */  lq         $16, 0x0($sp)
/* F6240 001F6140 6000BD27 */  addiu      $sp, $sp, 0x60
/* F6244 001F6144 0800E003 */  jr         $31
/* F6248 001F6148 00000000 */   nop
/* F624C 001F614C 00000000 */  nop
