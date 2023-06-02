.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitMenuSave__FiiP1
/* 11FC10 0021FB10 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 11FC14 0021FB14 3000BF7F */  sq         $31, 0x30($sp)
/* 11FC18 0021FB18 2000B27F */  sq         $18, 0x20($sp)
/* 11FC1C 0021FB1C 1000B17F */  sq         $17, 0x10($sp)
/* 11FC20 0021FB20 0000B07F */  sq         $16, 0x0($sp)
/* 11FC24 0021FB24 28968070 */  paddub     $18, $4, $0
/* 11FC28 0021FB28 288EA070 */  paddub     $17, $5, $0
/* 11FC2C 0021FB2C 2886C070 */  paddub     $16, $6, $0
/* 11FC30 0021FB30 0300C014 */  bnez       $6, .L0021FB40
/* 11FC34 0021FB34 00000000 */   nop
/* 11FC38 0021FB38 948B908F */  lw         $16, -0x746C($gp)
/* 11FC3C 0021FB3C 00000000 */  nop
.L0021FB40:
/* 11FC40 0021FB40 28260072 */  paddub     $4, $16, $0
/* 11FC44 0021FB44 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 11FC48 0021FB48 00000000 */   nop
/* 11FC4C 0021FB4C 28864070 */  paddub     $16, $2, $0
/* 11FC50 0021FB50 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FC54 0021FB54 D08A32AC */  sw         $18, -0x7530($at)
/* 11FC58 0021FB58 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FC5C 0021FB5C FC8A31AC */  sw         $17, -0x7504($at)
/* 11FC60 0021FB60 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FC64 0021FB64 E48A20A0 */  sb         $0, -0x751C($at)
/* 11FC68 0021FB68 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FC6C 0021FB6C F88A20AC */  sw         $0, -0x7508($at)
/* 11FC70 0021FB70 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FC74 0021FB74 008B20AC */  sw         $0, -0x7500($at)
/* 11FC78 0021FB78 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FC7C 0021FB7C DC8A20AC */  sw         $0, -0x7524($at)
/* 11FC80 0021FB80 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FC84 0021FB84 E88A20AC */  sw         $0, -0x7518($at)
/* 11FC88 0021FB88 30FB040C */  jal        StartReadBG__Fv
/* 11FC8C 0021FB8C 00000000 */   nop
/* 11FC90 0021FB90 2A00023C */  lui        $2, %hi(_2503)
/* 11FC94 0021FB94 28EB4424 */  addiu      $4, $2, %lo(_2503)
/* 11FC98 0021FB98 282E0072 */  paddub     $5, $16, $0
/* 11FC9C 0021FB9C ACAE080C */  jal        LoadFileBGMenuData__FPcP1
/* 11FCA0 0021FBA0 00000000 */   nop
/* 11FCA4 0021FBA4 DB01023C */  lui        $2, %hi(McAccess)
/* 11FCA8 0021FBA8 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 11FCAC 0021FBAC D44D080C */  jal        InitForMC__17CMemoryCardAccessFv
/* 11FCB0 0021FBB0 00000000 */   nop
/* 11FCB4 0021FBB4 04004010 */  beqz       $2, .L0021FBC8
/* 11FCB8 0021FBB8 00000000 */   nop
/* 11FCBC 0021FBBC 28160070 */  paddub     $2, $0, $0
/* 11FCC0 0021FBC0 66000010 */  b          .L0021FD5C
/* 11FCC4 0021FBC4 00000000 */   nop
.L0021FBC8:
/* 11FCC8 0021FBC8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FCCC 0021FBCC D08A258C */  lw         $5, -0x7530($at)
/* 11FCD0 0021FBD0 03000424 */  addiu      $4, $0, 0x3
/* 11FCD4 0021FBD4 2700A410 */  beq        $5, $4, .L0021FC74
/* 11FCD8 0021FBD8 00000000 */   nop
/* 11FCDC 0021FBDC 02000324 */  addiu      $3, $0, 0x2
/* 11FCE0 0021FBE0 2400A310 */  beq        $5, $3, .L0021FC74
/* 11FCE4 0021FBE4 00000000 */   nop
/* 11FCE8 0021FBE8 01000224 */  addiu      $2, $0, 0x1
/* 11FCEC 0021FBEC 1900A210 */  beq        $5, $2, .L0021FC54
/* 11FCF0 0021FBF0 00000000 */   nop
/* 11FCF4 0021FBF4 0300A010 */  beqz       $5, .L0021FC04
/* 11FCF8 0021FBF8 00000000 */   nop
/* 11FCFC 0021FBFC 45000010 */  b          .L0021FD14
/* 11FD00 0021FC00 00000000 */   nop
.L0021FC04:
/* 11FD04 0021FC04 CC01023C */  lui        $2, %hi(GamePad)
/* 11FD08 0021FC08 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11FD0C 0021FC0C 00A00534 */  ori        $5, $0, 0xA000
/* 11FD10 0021FC10 1E000624 */  addiu      $6, $0, 0x1E
/* 11FD14 0021FC14 05000724 */  addiu      $7, $0, 0x5
/* 11FD18 0021FC18 58AD040C */  jal        SetAutoRepeat__8CGamePadFiii
/* 11FD1C 0021FC1C 00000000 */   nop
/* 11FD20 0021FC20 CC01023C */  lui        $2, %hi(GamePad)
/* 11FD24 0021FC24 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11FD28 0021FC28 78000524 */  addiu      $5, $0, 0x78
/* 11FD2C 0021FC2C 48AE040C */  jal        MenuModeOn__8CGamePadFi
/* 11FD30 0021FC30 00000000 */   nop
/* 11FD34 0021FC34 03000224 */  addiu      $2, $0, 0x3
/* 11FD38 0021FC38 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FD3C 0021FC3C D48A22AC */  sw         $2, -0x752C($at)
/* 11FD40 0021FC40 01000224 */  addiu      $2, $0, 0x1
/* 11FD44 0021FC44 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FD48 0021FC48 EC8A22AC */  sw         $2, -0x7514($at)
/* 11FD4C 0021FC4C 31000010 */  b          .L0021FD14
/* 11FD50 0021FC50 00000000 */   nop
.L0021FC54:
/* 11FD54 0021FC54 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FD58 0021FC58 D48A24AC */  sw         $4, -0x752C($at)
/* 11FD5C 0021FC5C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FD60 0021FC60 EC8A23AC */  sw         $3, -0x7514($at)
/* 11FD64 0021FC64 FCDE050C */  jal        EditSave__Fv
/* 11FD68 0021FC68 00000000 */   nop
/* 11FD6C 0021FC6C 29000010 */  b          .L0021FD14
/* 11FD70 0021FC70 00000000 */   nop
.L0021FC74:
/* 11FD74 0021FC74 0200A238 */  xori       $2, $5, 0x2
/* 11FD78 0021FC78 0100502C */  sltiu      $16, $2, 0x1
/* 11FD7C 0021FC7C 1C8D848F */  lw         $4, -0x72E4($gp)
/* 11FD80 0021FC80 CC5E050C */  jal        GetConfigData__9CSaveDataFv
/* 11FD84 0021FC84 00000000 */   nop
/* 11FD88 0021FC88 380050AC */  sw         $16, 0x38($2)
/* 11FD8C 0021FC8C 1C8D848F */  lw         $4, -0x72E4($gp)
/* 11FD90 0021FC90 CC5E050C */  jal        GetConfigData__9CSaveDataFv
/* 11FD94 0021FC94 00000000 */   nop
/* 11FD98 0021FC98 2A00033C */  lui        $3, %hi(_2504)
/* 11FD9C 0021FC9C 40EB6424 */  addiu      $4, $3, %lo(_2504)
/* 11FDA0 0021FCA0 3800458C */  lw         $5, 0x38($2)
/* 11FDA4 0021FCA4 A611040C */  jal        printf
/* 11FDA8 0021FCA8 00000000 */   nop
/* 11FDAC 0021FCAC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FDB0 0021FCB0 D08A228C */  lw         $2, -0x7530($at)
/* 11FDB4 0021FCB4 02004238 */  xori       $2, $2, 0x2
/* 11FDB8 0021FCB8 0100422C */  sltiu      $2, $2, 0x1
/* 11FDBC 0021FCBC 208D82AF */  sw         $2, -0x72E0($gp)
/* 11FDC0 0021FCC0 02000224 */  addiu      $2, $0, 0x2
/* 11FDC4 0021FCC4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FDC8 0021FCC8 D08A22AC */  sw         $2, -0x7530($at)
/* 11FDCC 0021FCCC CC01023C */  lui        $2, %hi(GamePad)
/* 11FDD0 0021FCD0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11FDD4 0021FCD4 00A00534 */  ori        $5, $0, 0xA000
/* 11FDD8 0021FCD8 1E000624 */  addiu      $6, $0, 0x1E
/* 11FDDC 0021FCDC 05000724 */  addiu      $7, $0, 0x5
/* 11FDE0 0021FCE0 58AD040C */  jal        SetAutoRepeat__8CGamePadFiii
/* 11FDE4 0021FCE4 00000000 */   nop
/* 11FDE8 0021FCE8 CC01023C */  lui        $2, %hi(GamePad)
/* 11FDEC 0021FCEC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11FDF0 0021FCF0 78000524 */  addiu      $5, $0, 0x78
/* 11FDF4 0021FCF4 48AE040C */  jal        MenuModeOn__8CGamePadFi
/* 11FDF8 0021FCF8 00000000 */   nop
/* 11FDFC 0021FCFC 16000224 */  addiu      $2, $0, 0x16
/* 11FE00 0021FD00 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FE04 0021FD04 D48A22AC */  sw         $2, -0x752C($at)
/* 11FE08 0021FD08 02000224 */  addiu      $2, $0, 0x2
/* 11FE0C 0021FD0C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FE10 0021FD10 EC8A22AC */  sw         $2, -0x7514($at)
.L0021FD14:
/* 11FE14 0021FD14 FFFF0224 */  addiu      $2, $0, -0x1
/* 11FE18 0021FD18 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FE1C 0021FD1C D88A22AC */  sw         $2, -0x7528($at)
/* 11FE20 0021FD20 01000524 */  addiu      $5, $0, 0x1
/* 11FE24 0021FD24 DA01013C */  lui        $at, (0x1DA23E8 >> 16)
/* 11FE28 0021FD28 E82325AC */  sw         $5, (0x1DA23E8 & 0xFFFF)($at)
/* 11FE2C 0021FD2C DA01013C */  lui        $at, (0x1DA3A80 >> 16)
/* 11FE30 0021FD30 803A25AC */  sw         $5, (0x1DA3A80 & 0xFFFF)($at)
/* 11FE34 0021FD34 05000224 */  addiu      $2, $0, 0x5
/* 11FE38 0021FD38 DA01013C */  lui        $at, (0x1DA23A4 >> 16)
/* 11FE3C 0021FD3C A42322AC */  sw         $2, (0x1DA23A4 & 0xFFFF)($at)
/* 11FE40 0021FD40 DB01023C */  lui        $2, %hi(McAccess)
/* 11FE44 0021FD44 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 11FE48 0021FD48 E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 11FE4C 0021FD4C 00000000 */   nop
/* 11FE50 0021FD50 01000224 */  addiu      $2, $0, 0x1
/* 11FE54 0021FD54 DA01013C */  lui        $at, (0x1DA3A98 >> 16)
/* 11FE58 0021FD58 983A22AC */  sw         $2, (0x1DA3A98 & 0xFFFF)($at)
.L0021FD5C:
/* 11FE5C 0021FD5C 3000BF7B */  lq         $31, 0x30($sp)
/* 11FE60 0021FD60 2000B27B */  lq         $18, 0x20($sp)
/* 11FE64 0021FD64 1000B17B */  lq         $17, 0x10($sp)
/* 11FE68 0021FD68 0000B07B */  lq         $16, 0x0($sp)
/* 11FE6C 0021FD6C 4000BD27 */  addiu      $sp, $sp, 0x40
/* 11FE70 0021FD70 0800E003 */  jr         $31
/* 11FE74 0021FD74 00000000 */   nop
/* 11FE78 0021FD78 00000000 */  nop
/* 11FE7C 0021FD7C 00000000 */  nop
