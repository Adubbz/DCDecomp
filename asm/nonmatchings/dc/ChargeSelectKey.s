.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ChargeSelectKey__Fv
/* E9FE0 001E9EE0 70FEBD27 */  addiu      $sp, $sp, -0x190
/* E9FE4 001E9EE4 3000BF7F */  sq         $31, 0x30($sp)
/* E9FE8 001E9EE8 2000B27F */  sq         $18, 0x20($sp)
/* E9FEC 001E9EEC 1000B17F */  sq         $17, 0x10($sp)
/* E9FF0 001E9EF0 0000B07F */  sq         $16, 0x0($sp)
/* E9FF4 001E9EF4 B894828F */  lw         $2, -0x6B48($gp)
/* E9FF8 001E9EF8 10004284 */  lh         $2, 0x10($2)
/* E9FFC 001E9EFC 51004128 */  slti       $at, $2, 0x51
/* EA000 001E9F00 09002010 */  beqz       $at, .L001E9F28
/* EA004 001E9F04 00000000 */   nop
/* EA008 001E9F08 6CBA080C */  jal        BoardModeChangeKey__Fv
/* EA00C 001E9F0C 00000000 */   nop
/* EA010 001E9F10 05004010 */  beqz       $2, .L001E9F28
/* EA014 001E9F14 00000000 */   nop
/* EA018 001E9F18 B8BA080C */  jal        PersonalBoardLimmitCheck__Fv
/* EA01C 001E9F1C 00000000 */   nop
/* EA020 001E9F20 88A1070C */  jal        ChargeShopLimmitCheck__Fv
/* EA024 001E9F24 00000000 */   nop
.L001E9F28:
/* EA028 001E9F28 D901013C */  lui        $at, (0x1D900DC >> 16)
/* EA02C 001E9F2C DC00228C */  lw         $2, (0x1D900DC & 0xFFFF)($at)
/* EA030 001E9F30 40180200 */  sll        $3, $2, 1
/* EA034 001E9F34 00888227 */  addiu      $2, $gp, -0x7800
/* EA038 001E9F38 21104300 */  addu       $2, $2, $3
/* EA03C 001E9F3C 00005084 */  lh         $16, 0x0($2)
/* EA040 001E9F40 CC01023C */  lui        $2, %hi(GamePad)
/* EA044 001E9F44 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EA048 001E9F48 00100524 */  addiu      $5, $0, 0x1000
/* EA04C 001E9F4C 1CAE040C */  jal        Down__8CGamePadFi
/* EA050 001E9F50 00000000 */   nop
/* EA054 001E9F54 1D004010 */  beqz       $2, .L001E9FCC
/* EA058 001E9F58 00000000 */   nop
/* EA05C 001E9F5C D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA060 001E9F60 E400228C */  lw         $2, (0x1D900E4 & 0xFFFF)($at)
/* EA064 001E9F64 FBFF4224 */  addiu      $2, $2, -0x5
/* EA068 001E9F68 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA06C 001E9F6C E40022AC */  sw         $2, (0x1D900E4 & 0xFFFF)($at)
/* EA070 001E9F70 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA074 001E9F74 E400228C */  lw         $2, (0x1D900E4 & 0xFFFF)($at)
/* EA078 001E9F78 04004104 */  bgez       $2, .L001E9F8C
/* EA07C 001E9F7C 00000000 */   nop
/* EA080 001E9F80 05004224 */  addiu      $2, $2, 0x5
/* EA084 001E9F84 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA088 001E9F88 E40022AC */  sw         $2, (0x1D900E4 & 0xFFFF)($at)
.L001E9F8C:
/* EA08C 001E9F8C D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA090 001E9F90 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EA094 001E9F94 05000224 */  addiu      $2, $0, 0x5
/* EA098 001E9F98 1A006200 */  div        $0, $3, $2
/* EA09C 001E9F9C 02004014 */  bnez       $2, .L001E9FA8
/* EA0A0 001E9FA0 00000000 */   nop
/* EA0A4 001E9FA4 CD010000 */  break      0, 7
.L001E9FA8:
/* EA0A8 001E9FA8 12180000 */  mflo       $3
/* EA0AC 001E9FAC D901013C */  lui        $at, (0x1D90246 >> 16)
/* EA0B0 001E9FB0 46022290 */  lbu        $2, (0x1D90246 & 0xFFFF)($at)
/* EA0B4 001E9FB4 2A086200 */  slt        $at, $3, $2
/* EA0B8 001E9FB8 04002010 */  beqz       $at, .L001E9FCC
/* EA0BC 001E9FBC 00000000 */   nop
/* EA0C0 001E9FC0 FFFF4224 */  addiu      $2, $2, -0x1
/* EA0C4 001E9FC4 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EA0C8 001E9FC8 460222A0 */  sb         $2, (0x1D90246 & 0xFFFF)($at)
.L001E9FCC:
/* EA0CC 001E9FCC CC01023C */  lui        $2, %hi(GamePad)
/* EA0D0 001E9FD0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EA0D4 001E9FD4 00400524 */  addiu      $5, $0, 0x4000
/* EA0D8 001E9FD8 1CAE040C */  jal        Down__8CGamePadFi
/* EA0DC 001E9FDC 00000000 */   nop
/* EA0E0 001E9FE0 1D004010 */  beqz       $2, .L001EA058
/* EA0E4 001E9FE4 00000000 */   nop
/* EA0E8 001E9FE8 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA0EC 001E9FEC E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EA0F0 001E9FF0 FBFF0226 */  addiu      $2, $16, -0x5
/* EA0F4 001E9FF4 2A086200 */  slt        $at, $3, $2
/* EA0F8 001E9FF8 04002010 */  beqz       $at, .L001EA00C
/* EA0FC 001E9FFC 00000000 */   nop
/* EA100 001EA000 05006224 */  addiu      $2, $3, 0x5
/* EA104 001EA004 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA108 001EA008 E40022AC */  sw         $2, (0x1D900E4 & 0xFFFF)($at)
.L001EA00C:
/* EA10C 001EA00C D901013C */  lui        $at, (0x1D90246 >> 16)
/* EA110 001EA010 46022290 */  lbu        $2, (0x1D90246 & 0xFFFF)($at)
/* EA114 001EA014 03004424 */  addiu      $4, $2, 0x3
/* EA118 001EA018 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA11C 001EA01C E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EA120 001EA020 05000224 */  addiu      $2, $0, 0x5
/* EA124 001EA024 1A006200 */  div        $0, $3, $2
/* EA128 001EA028 02004014 */  bnez       $2, .L001EA034
/* EA12C 001EA02C 00000000 */   nop
/* EA130 001EA030 CD010000 */  break      0, 7
.L001EA034:
/* EA134 001EA034 12100000 */  mflo       $2
/* EA138 001EA038 2A088200 */  slt        $at, $4, $2
/* EA13C 001EA03C 06002010 */  beqz       $at, .L001EA058
/* EA140 001EA040 00000000 */   nop
/* EA144 001EA044 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EA148 001EA048 46022290 */  lbu        $2, (0x1D90246 & 0xFFFF)($at)
/* EA14C 001EA04C 01004224 */  addiu      $2, $2, 0x1
/* EA150 001EA050 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EA154 001EA054 460222A0 */  sb         $2, (0x1D90246 & 0xFFFF)($at)
.L001EA058:
/* EA158 001EA058 CC01023C */  lui        $2, %hi(GamePad)
/* EA15C 001EA05C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EA160 001EA060 00800534 */  ori        $5, $0, 0x8000
/* EA164 001EA064 1CAE040C */  jal        Down__8CGamePadFi
/* EA168 001EA068 00000000 */   nop
/* EA16C 001EA06C 0D004010 */  beqz       $2, .L001EA0A4
/* EA170 001EA070 00000000 */   nop
/* EA174 001EA074 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA178 001EA078 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EA17C 001EA07C 05000224 */  addiu      $2, $0, 0x5
/* EA180 001EA080 1A006200 */  div        $0, $3, $2
/* EA184 001EA084 00000000 */  nop
/* EA188 001EA088 00000000 */  nop
/* EA18C 001EA08C 10100000 */  mfhi       $2
/* EA190 001EA090 04004010 */  beqz       $2, .L001EA0A4
/* EA194 001EA094 00000000 */   nop
/* EA198 001EA098 FFFF6224 */  addiu      $2, $3, -0x1
/* EA19C 001EA09C D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA1A0 001EA0A0 E40022AC */  sw         $2, (0x1D900E4 & 0xFFFF)($at)
.L001EA0A4:
/* EA1A4 001EA0A4 CC01023C */  lui        $2, %hi(GamePad)
/* EA1A8 001EA0A8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EA1AC 001EA0AC 00200524 */  addiu      $5, $0, 0x2000
/* EA1B0 001EA0B0 1CAE040C */  jal        Down__8CGamePadFi
/* EA1B4 001EA0B4 00000000 */   nop
/* EA1B8 001EA0B8 24004010 */  beqz       $2, .L001EA14C
/* EA1BC 001EA0BC 00000000 */   nop
/* EA1C0 001EA0C0 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA1C4 001EA0C4 E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* EA1C8 001EA0C8 05000424 */  addiu      $4, $0, 0x5
/* EA1CC 001EA0CC 1A00A400 */  div        $0, $5, $4
/* EA1D0 001EA0D0 00000000 */  nop
/* EA1D4 001EA0D4 00000000 */  nop
/* EA1D8 001EA0D8 10180000 */  mfhi       $3
/* EA1DC 001EA0DC 04000224 */  addiu      $2, $0, 0x4
/* EA1E0 001EA0E0 17006214 */  bne        $3, $2, .L001EA140
/* EA1E4 001EA0E4 00000000 */   nop
/* EA1E8 001EA0E8 01000224 */  addiu      $2, $0, 0x1
/* EA1EC 001EA0EC D901013C */  lui        $at, (0x1D900D2 >> 16)
/* EA1F0 001EA0F0 D20022A4 */  sh         $2, (0x1D900D2 & 0xFFFF)($at)
/* EA1F4 001EA0F4 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA1F8 001EA0F8 E400228C */  lw         $2, (0x1D900E4 & 0xFFFF)($at)
/* EA1FC 001EA0FC 1A004400 */  div        $0, $2, $4
/* EA200 001EA100 02008014 */  bnez       $4, .L001EA10C
/* EA204 001EA104 00000000 */   nop
/* EA208 001EA108 CD010000 */  break      0, 7
.L001EA10C:
/* EA20C 001EA10C 12180000 */  mflo       $3
/* EA210 001EA110 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EA214 001EA114 46022290 */  lbu        $2, (0x1D90246 & 0xFFFF)($at)
/* EA218 001EA118 23186200 */  subu       $3, $3, $2
/* EA21C 001EA11C D901013C */  lui        $at, (0x1D900F0 >> 16)
/* EA220 001EA120 F000228C */  lw         $2, (0x1D900F0 & 0xFFFF)($at)
/* EA224 001EA124 21184300 */  addu       $3, $2, $3
/* EA228 001EA128 80100300 */  sll        $2, $3, 2
/* EA22C 001EA12C 21104300 */  addu       $2, $2, $3
/* EA230 001EA130 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA234 001EA134 E40022AC */  sw         $2, (0x1D900E4 & 0xFFFF)($at)
/* EA238 001EA138 04000010 */  b          .L001EA14C
/* EA23C 001EA13C 00000000 */   nop
.L001EA140:
/* EA240 001EA140 0100A224 */  addiu      $2, $5, 0x1
/* EA244 001EA144 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA248 001EA148 E40022AC */  sw         $2, (0x1D900E4 & 0xFFFF)($at)
.L001EA14C:
/* EA24C 001EA14C D901013C */  lui        $at, (0x1D900D2 >> 16)
/* EA250 001EA150 D2002284 */  lh         $2, (0x1D900D2 & 0xFFFF)($at)
/* EA254 001EA154 03004010 */  beqz       $2, .L001EA164
/* EA258 001EA158 00000000 */   nop
/* EA25C 001EA15C 88010010 */  b          .L001EA780
/* EA260 001EA160 00000000 */   nop
.L001EA164:
/* EA264 001EA164 02001024 */  addiu      $16, $0, 0x2
/* EA268 001EA168 4000A427 */  addiu      $4, $sp, 0x40
/* EA26C 001EA16C B894858F */  lw         $5, -0x6B48($gp)
/* EA270 001EA170 14000624 */  addiu      $6, $0, 0x14
/* EA274 001EA174 EC0C040C */  jal        memcpy
/* EA278 001EA178 00000000 */   nop
/* EA27C 001EA17C CC01023C */  lui        $2, %hi(GamePad)
/* EA280 001EA180 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EA284 001EA184 40000524 */  addiu      $5, $0, 0x40
/* EA288 001EA188 1CAE040C */  jal        Down__8CGamePadFi
/* EA28C 001EA18C 00000000 */   nop
/* EA290 001EA190 90004010 */  beqz       $2, .L001EA3D4
/* EA294 001EA194 00000000 */   nop
/* EA298 001EA198 B894828F */  lw         $2, -0x6B48($gp)
/* EA29C 001EA19C 10004484 */  lh         $4, 0x10($2)
/* EA2A0 001EA1A0 51008228 */  slti       $2, $4, 0x51
/* EA2A4 001EA1A4 0F004014 */  bnez       $2, .L001EA1E4
/* EA2A8 001EA1A8 00000000 */   nop
/* EA2AC 001EA1AC 109E070C */  jal        IsEnableCharge__Fi
/* EA2B0 001EA1B0 00000000 */   nop
/* EA2B4 001EA1B4 0B004014 */  bnez       $2, .L001EA1E4
/* EA2B8 001EA1B8 00000000 */   nop
/* EA2BC 001EA1BC 28260072 */  paddub     $4, $16, $0
/* EA2C0 001EA1C0 BCB3080C */  jal        ComMenuSePlay__Fi
/* EA2C4 001EA1C4 00000000 */   nop
/* EA2C8 001EA1C8 07000424 */  addiu      $4, $0, 0x7
/* EA2CC 001EA1CC 01000524 */  addiu      $5, $0, 0x1
/* EA2D0 001EA1D0 749C070C */  jal        SetItemShopTalkMode__Fii
/* EA2D4 001EA1D4 00000000 */   nop
/* EA2D8 001EA1D8 28160070 */  paddub     $2, $0, $0
/* EA2DC 001EA1DC 69010010 */  b          .L001EA784
/* EA2E0 001EA1E0 00000000 */   nop
.L001EA1E4:
/* EA2E4 001EA1E4 D901013C */  lui        $at, (0x1D900DC >> 16)
/* EA2E8 001EA1E8 DC00318C */  lw         $17, (0x1D900DC & 0xFFFF)($at)
/* EA2EC 001EA1EC B894828F */  lw         $2, -0x6B48($gp)
/* EA2F0 001EA1F0 10004484 */  lh         $4, 0x10($2)
/* EA2F4 001EA1F4 88C7080C */  jal        WhatIsKindofItem__Fi
/* EA2F8 001EA1F8 00000000 */   nop
/* EA2FC 001EA1FC 07002212 */  beq        $17, $2, .L001EA21C
/* EA300 001EA200 00000000 */   nop
/* EA304 001EA204 FFFF0324 */  addiu      $3, $0, -0x1
/* EA308 001EA208 04004310 */  beq        $2, $3, .L001EA21C
/* EA30C 001EA20C 00000000 */   nop
/* EA310 001EA210 02001024 */  addiu      $16, $0, 0x2
/* EA314 001EA214 49000010 */  b          .L001EA33C
/* EA318 001EA218 00000000 */   nop
.L001EA21C:
/* EA31C 001EA21C 02000224 */  addiu      $2, $0, 0x2
/* EA320 001EA220 2C002212 */  beq        $17, $2, .L001EA2D4
/* EA324 001EA224 00000000 */   nop
/* EA328 001EA228 01000224 */  addiu      $2, $0, 0x1
/* EA32C 001EA22C 0F002212 */  beq        $17, $2, .L001EA26C
/* EA330 001EA230 00000000 */   nop
/* EA334 001EA234 03002012 */  beqz       $17, .L001EA244
/* EA338 001EA238 00000000 */   nop
/* EA33C 001EA23C 3D000010 */  b          .L001EA334
/* EA340 001EA240 00000000 */   nop
.L001EA244:
/* EA344 001EA244 B894828F */  lw         $2, -0x6B48($gp)
/* EA348 001EA248 8C94848F */  lw         $4, -0x6B74($gp)
/* EA34C 001EA24C D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA350 001EA250 E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* EA354 001EA254 10004624 */  addiu      $6, $2, 0x10
/* EA358 001EA258 12004724 */  addiu      $7, $2, 0x12
/* EA35C 001EA25C B0FD080C */  jal        SetItemToPos__10CStockItemFiPsPs
/* EA360 001EA260 00000000 */   nop
/* EA364 001EA264 33000010 */  b          .L001EA334
/* EA368 001EA268 00000000 */   nop
.L001EA26C:
/* EA36C 001EA26C 8C94848F */  lw         $4, -0x6B74($gp)
/* EA370 001EA270 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA374 001EA274 E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* EA378 001EA278 BC94868F */  lw         $6, -0x6B44($gp)
/* EA37C 001EA27C C4FD080C */  jal        SetWepToPos__10CStockItemFiP11WEAPON_HAVE
/* EA380 001EA280 00000000 */   nop
/* EA384 001EA284 BC94828F */  lw         $2, -0x6B44($gp)
/* EA388 001EA288 00004384 */  lh         $3, 0x0($2)
/* EA38C 001EA28C 51006128 */  slti       $at, $3, 0x51
/* EA390 001EA290 0C002010 */  beqz       $at, .L001EA2C4
/* EA394 001EA294 00000000 */   nop
/* EA398 001EA298 FFFF0324 */  addiu      $3, $0, -0x1
/* EA39C 001EA29C B894828F */  lw         $2, -0x6B48($gp)
/* EA3A0 001EA2A0 100043A4 */  sh         $3, 0x10($2)
/* EA3A4 001EA2A4 BC94848F */  lw         $4, -0x6B44($gp)
/* EA3A8 001EA2A8 1CB9080C */  jal        InitHaveWep__FP11WEAPON_HAVE
/* EA3AC 001EA2AC 00000000 */   nop
/* EA3B0 001EA2B0 FFFF0224 */  addiu      $2, $0, -0x1
/* EA3B4 001EA2B4 D901013C */  lui        $at, (0x1D90234 >> 16)
/* EA3B8 001EA2B8 340222AC */  sw         $2, (0x1D90234 & 0xFFFF)($at)
/* EA3BC 001EA2BC 1D000010 */  b          .L001EA334
/* EA3C0 001EA2C0 00000000 */   nop
.L001EA2C4:
/* EA3C4 001EA2C4 B894828F */  lw         $2, -0x6B48($gp)
/* EA3C8 001EA2C8 100043A4 */  sh         $3, 0x10($2)
/* EA3CC 001EA2CC 19000010 */  b          .L001EA334
/* EA3D0 001EA2D0 00000000 */   nop
.L001EA2D4:
/* EA3D4 001EA2D4 8C94848F */  lw         $4, -0x6B74($gp)
/* EA3D8 001EA2D8 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA3DC 001EA2DC E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* EA3E0 001EA2E0 C094868F */  lw         $6, -0x6B40($gp)
/* EA3E4 001EA2E4 F4FD080C */  jal        SetAttachToPos__10CStockItemFiP11ATTACH_LIST
/* EA3E8 001EA2E8 00000000 */   nop
/* EA3EC 001EA2EC C094828F */  lw         $2, -0x6B40($gp)
/* EA3F0 001EA2F0 00004384 */  lh         $3, 0x0($2)
/* EA3F4 001EA2F4 51006128 */  slti       $at, $3, 0x51
/* EA3F8 001EA2F8 0C002010 */  beqz       $at, .L001EA32C
/* EA3FC 001EA2FC 00000000 */   nop
/* EA400 001EA300 FFFF0324 */  addiu      $3, $0, -0x1
/* EA404 001EA304 B894828F */  lw         $2, -0x6B48($gp)
/* EA408 001EA308 100043A4 */  sh         $3, 0x10($2)
/* EA40C 001EA30C C094848F */  lw         $4, -0x6B40($gp)
/* EA410 001EA310 2CB9080C */  jal        InitHaveAttach__FP11ATTACH_LIST
/* EA414 001EA314 00000000 */   nop
/* EA418 001EA318 FFFF0224 */  addiu      $2, $0, -0x1
/* EA41C 001EA31C D901013C */  lui        $at, (0x1D90234 >> 16)
/* EA420 001EA320 340222AC */  sw         $2, (0x1D90234 & 0xFFFF)($at)
/* EA424 001EA324 03000010 */  b          .L001EA334
/* EA428 001EA328 00000000 */   nop
.L001EA32C:
/* EA42C 001EA32C B894828F */  lw         $2, -0x6B48($gp)
/* EA430 001EA330 100043A4 */  sh         $3, 0x10($2)
.L001EA334:
/* EA434 001EA334 B894828F */  lw         $2, -0x6B48($gp)
/* EA438 001EA338 000040AC */  sw         $0, 0x0($2)
.L001EA33C:
/* EA43C 001EA33C B894838F */  lw         $3, -0x6B48($gp)
/* EA440 001EA340 10006284 */  lh         $2, 0x10($3)
/* EA444 001EA344 51004128 */  slti       $at, $2, 0x51
/* EA448 001EA348 05002010 */  beqz       $at, .L001EA360
/* EA44C 001EA34C 00000000 */   nop
/* EA450 001EA350 F49B070C */  jal        InitAllHaveData__Fv
/* EA454 001EA354 00000000 */   nop
/* EA458 001EA358 0B000010 */  b          .L001EA388
/* EA45C 001EA35C 00000000 */   nop
.L001EA360:
/* EA460 001EA360 000060AC */  sw         $0, 0x0($3)
/* EA464 001EA364 D901013C */  lui        $at, (0x1D900DC >> 16)
/* EA468 001EA368 DC00238C */  lw         $3, (0x1D900DC & 0xFFFF)($at)
/* EA46C 001EA36C B894828F */  lw         $2, -0x6B48($gp)
/* EA470 001EA370 040043AC */  sw         $3, 0x4($2)
/* EA474 001EA374 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA478 001EA378 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EA47C 001EA37C B894828F */  lw         $2, -0x6B48($gp)
/* EA480 001EA380 0C0043AC */  sw         $3, 0xC($2)
/* EA484 001EA384 01001024 */  addiu      $16, $0, 0x1
.L001EA388:
/* EA488 001EA388 4000A427 */  addiu      $4, $sp, 0x40
/* EA48C 001EA38C B894858F */  lw         $5, -0x6B48($gp)
/* EA490 001EA390 14000624 */  addiu      $6, $0, 0x14
/* EA494 001EA394 C60C040C */  jal        memcmp
/* EA498 001EA398 00000000 */   nop
/* EA49C 001EA39C 04004014 */  bnez       $2, .L001EA3B0
/* EA4A0 001EA3A0 00000000 */   nop
/* EA4A4 001EA3A4 02000424 */  addiu      $4, $0, 0x2
/* EA4A8 001EA3A8 06000412 */  beq        $16, $4, .L001EA3C4
/* EA4AC 001EA3AC 00000000 */   nop
.L001EA3B0:
/* EA4B0 001EA3B0 01000424 */  addiu      $4, $0, 0x1
/* EA4B4 001EA3B4 BCB3080C */  jal        ComMenuSePlay__Fi
/* EA4B8 001EA3B8 00000000 */   nop
/* EA4BC 001EA3BC F0000010 */  b          .L001EA780
/* EA4C0 001EA3C0 00000000 */   nop
.L001EA3C4:
/* EA4C4 001EA3C4 BCB3080C */  jal        ComMenuSePlay__Fi
/* EA4C8 001EA3C8 00000000 */   nop
/* EA4CC 001EA3CC EC000010 */  b          .L001EA780
/* EA4D0 001EA3D0 00000000 */   nop
.L001EA3D4:
/* EA4D4 001EA3D4 CC01023C */  lui        $2, %hi(GamePad)
/* EA4D8 001EA3D8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EA4DC 001EA3DC 10000524 */  addiu      $5, $0, 0x10
/* EA4E0 001EA3E0 1CAE040C */  jal        Down__8CGamePadFi
/* EA4E4 001EA3E4 00000000 */   nop
/* EA4E8 001EA3E8 C7004010 */  beqz       $2, .L001EA708
/* EA4EC 001EA3EC 00000000 */   nop
/* EA4F0 001EA3F0 B894828F */  lw         $2, -0x6B48($gp)
/* EA4F4 001EA3F4 10004284 */  lh         $2, 0x10($2)
/* EA4F8 001EA3F8 51004228 */  slti       $2, $2, 0x51
/* EA4FC 001EA3FC 07004014 */  bnez       $2, .L001EA41C
/* EA500 001EA400 00000000 */   nop
/* EA504 001EA404 28260072 */  paddub     $4, $16, $0
/* EA508 001EA408 BCB3080C */  jal        ComMenuSePlay__Fi
/* EA50C 001EA40C 00000000 */   nop
/* EA510 001EA410 28160070 */  paddub     $2, $0, $0
/* EA514 001EA414 DB000010 */  b          .L001EA784
/* EA518 001EA418 00000000 */   nop
.L001EA41C:
/* EA51C 001EA41C 01001024 */  addiu      $16, $0, 0x1
/* EA520 001EA420 D901013C */  lui        $at, (0x1D900DC >> 16)
/* EA524 001EA424 DC00238C */  lw         $3, (0x1D900DC & 0xFFFF)($at)
/* EA528 001EA428 1B007010 */  beq        $3, $16, .L001EA498
/* EA52C 001EA42C 00000000 */   nop
/* EA530 001EA430 02000224 */  addiu      $2, $0, 0x2
/* EA534 001EA434 0E006210 */  beq        $3, $2, .L001EA470
/* EA538 001EA438 00000000 */   nop
/* EA53C 001EA43C 03006010 */  beqz       $3, .L001EA44C
/* EA540 001EA440 00000000 */   nop
/* EA544 001EA444 1C000010 */  b          .L001EA4B8
/* EA548 001EA448 00000000 */   nop
.L001EA44C:
/* EA54C 001EA44C 8C94848F */  lw         $4, -0x6B74($gp)
/* EA550 001EA450 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA554 001EA454 E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* EA558 001EA458 8C01A627 */  addiu      $6, $sp, 0x18C
/* EA55C 001EA45C 8E01A727 */  addiu      $7, $sp, 0x18E
/* EA560 001EA460 BCFD080C */  jal        GetItemInfo__10CStockItemFiPsPs
/* EA564 001EA464 00000000 */   nop
/* EA568 001EA468 13000010 */  b          .L001EA4B8
/* EA56C 001EA46C 00000000 */   nop
.L001EA470:
/* EA570 001EA470 8C94848F */  lw         $4, -0x6B74($gp)
/* EA574 001EA474 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA578 001EA478 E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* EA57C 001EA47C 6000A627 */  addiu      $6, $sp, 0x60
/* EA580 001EA480 14FE080C */  jal        GetAttachInfo__10CStockItemFiP11ATTACH_LIST
/* EA584 001EA484 00000000 */   nop
/* EA588 001EA488 6000A287 */  lh         $2, 0x60($sp)
/* EA58C 001EA48C 8C01A2A7 */  sh         $2, 0x18C($sp)
/* EA590 001EA490 09000010 */  b          .L001EA4B8
/* EA594 001EA494 00000000 */   nop
.L001EA498:
/* EA598 001EA498 8C94848F */  lw         $4, -0x6B74($gp)
/* EA59C 001EA49C D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EA5A0 001EA4A0 E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* EA5A4 001EA4A4 8000A627 */  addiu      $6, $sp, 0x80
/* EA5A8 001EA4A8 E4FD080C */  jal        GetWeaponInfo__10CStockItemFiP11WEAPON_HAVE
/* EA5AC 001EA4AC 00000000 */   nop
/* EA5B0 001EA4B0 8000A287 */  lh         $2, 0x80($sp)
/* EA5B4 001EA4B4 8C01A2A7 */  sh         $2, 0x18C($sp)
.L001EA4B8:
/* EA5B8 001EA4B8 8C01A487 */  lh         $4, 0x18C($sp)
/* EA5BC 001EA4BC 8401A527 */  addiu      $5, $sp, 0x184
/* EA5C0 001EA4C0 70C5080C */  jal        GetBoardSpace__FiPi
/* EA5C4 001EA4C4 00000000 */   nop
/* EA5C8 001EA4C8 8801A0AF */  sw         $0, 0x188($sp)
/* EA5CC 001EA4CC 288E0070 */  paddub     $17, $0, $0
/* EA5D0 001EA4D0 28960070 */  paddub     $18, $0, $0
/* EA5D4 001EA4D4 D901013C */  lui        $at, (0x1D900DC >> 16)
/* EA5D8 001EA4D8 DC00248C */  lw         $4, (0x1D900DC & 0xFFFF)($at)
/* EA5DC 001EA4DC 8801A527 */  addiu      $5, $sp, 0x188
/* EA5E0 001EA4E0 A4C8080C */  jal        GetNowModeMaxNum__FiPi
/* EA5E4 001EA4E4 00000000 */   nop
/* EA5E8 001EA4E8 8401A38F */  lw         $3, 0x184($sp)
/* EA5EC 001EA4EC 02000224 */  addiu      $2, $0, 0x2
/* EA5F0 001EA4F0 45006210 */  beq        $3, $2, .L001EA608
/* EA5F4 001EA4F4 00000000 */   nop
/* EA5F8 001EA4F8 01000224 */  addiu      $2, $0, 0x1
/* EA5FC 001EA4FC 27006210 */  beq        $3, $2, .L001EA59C
/* EA600 001EA500 00000000 */   nop
/* EA604 001EA504 03006010 */  beqz       $3, .L001EA514
/* EA608 001EA508 00000000 */   nop
/* EA60C 001EA50C 50000010 */  b          .L001EA650
/* EA610 001EA510 00000000 */   nop
.L001EA514:
/* EA614 001EA514 8494828F */  lw         $2, -0x6B7C($gp)
/* EA618 001EA518 60434524 */  addiu      $5, $2, 0x4360
/* EA61C 001EA51C 60435280 */  lb         $18, 0x4360($2)
/* EA620 001EA520 28260070 */  paddub     $4, $0, $0
/* EA624 001EA524 0A000010 */  b          .L001EA550
/* EA628 001EA528 00000000 */   nop
.L001EA52C:
/* EA62C 001EA52C 40100400 */  sll        $2, $4, 1
/* EA630 001EA530 21184500 */  addu       $3, $2, $5
/* EA634 001EA534 02006284 */  lh         $2, 0x2($3)
/* EA638 001EA538 84004228 */  slti       $2, $2, 0x84
/* EA63C 001EA53C 03004014 */  bnez       $2, .L001EA54C
/* EA640 001EA540 00000000 */   nop
/* EA644 001EA544 08006284 */  lh         $2, 0x8($3)
/* EA648 001EA548 21882202 */  addu       $17, $17, $2
.L001EA54C:
/* EA64C 001EA54C 01008424 */  addiu      $4, $4, 0x1
.L001EA550:
/* EA650 001EA550 03008228 */  slti       $2, $4, 0x3
/* EA654 001EA554 F5FF4014 */  bnez       $2, .L001EA52C
/* EA658 001EA558 00000000 */   nop
/* EA65C 001EA55C 281E0070 */  paddub     $3, $0, $0
/* EA660 001EA560 09000010 */  b          .L001EA588
/* EA664 001EA564 00000000 */   nop
.L001EA568:
/* EA668 001EA568 40100300 */  sll        $2, $3, 1
/* EA66C 001EA56C 21104500 */  addu       $2, $2, $5
/* EA670 001EA570 0E004284 */  lh         $2, 0xE($2)
/* EA674 001EA574 84004228 */  slti       $2, $2, 0x84
/* EA678 001EA578 02004014 */  bnez       $2, .L001EA584
/* EA67C 001EA57C 00000000 */   nop
/* EA680 001EA580 01003126 */  addiu      $17, $17, 0x1
.L001EA584:
/* EA684 001EA584 01006324 */  addiu      $3, $3, 0x1
.L001EA588:
/* EA688 001EA588 2A107200 */  slt        $2, $3, $18
/* EA68C 001EA58C F6FF4014 */  bnez       $2, .L001EA568
/* EA690 001EA590 00000000 */   nop
/* EA694 001EA594 2E000010 */  b          .L001EA650
/* EA698 001EA598 00000000 */   nop
.L001EA59C:
/* EA69C 001EA59C 0A001224 */  addiu      $18, $0, 0xA
/* EA6A0 001EA5A0 8C01A487 */  lh         $4, 0x18C($sp)
/* EA6A4 001EA5A4 A4C7080C */  jal        WhoIsWeaponEquip__Fi
/* EA6A8 001EA5A8 00000000 */   nop
/* EA6AC 001EA5AC 8494848F */  lw         $4, -0x6B7C($gp)
/* EA6B0 001EA5B0 A80A0324 */  addiu      $3, $0, 0xAA8
/* EA6B4 001EA5B4 18104300 */  mult       $2, $2, $3
/* EA6B8 001EA5B8 21108200 */  addu       $2, $4, $2
/* EA6BC 001EA5BC 0C454424 */  addiu      $4, $2, 0x450C
/* EA6C0 001EA5C0 281E0070 */  paddub     $3, $0, $0
/* EA6C4 001EA5C4 0B000010 */  b          .L001EA5F4
/* EA6C8 001EA5C8 00000000 */   nop
.L001EA5CC:
/* EA6CC 001EA5CC 40110300 */  sll        $2, $3, 5
/* EA6D0 001EA5D0 23104300 */  subu       $2, $2, $3
/* EA6D4 001EA5D4 C0100200 */  sll        $2, $2, 3
/* EA6D8 001EA5D8 21108200 */  addu       $2, $4, $2
/* EA6DC 001EA5DC 00004284 */  lh         $2, 0x0($2)
/* EA6E0 001EA5E0 01014228 */  slti       $2, $2, 0x101
/* EA6E4 001EA5E4 02004014 */  bnez       $2, .L001EA5F0
/* EA6E8 001EA5E8 00000000 */   nop
/* EA6EC 001EA5EC 01003126 */  addiu      $17, $17, 0x1
.L001EA5F0:
/* EA6F0 001EA5F0 01006324 */  addiu      $3, $3, 0x1
.L001EA5F4:
/* EA6F4 001EA5F4 0A006228 */  slti       $2, $3, 0xA
/* EA6F8 001EA5F8 F4FF4014 */  bnez       $2, .L001EA5CC
/* EA6FC 001EA5FC 00000000 */   nop
/* EA700 001EA600 13000010 */  b          .L001EA650
/* EA704 001EA604 00000000 */   nop
.L001EA608:
/* EA708 001EA608 28001224 */  addiu      $18, $0, 0x28
/* EA70C 001EA60C 8494828F */  lw         $2, -0x6B7C($gp)
/* EA710 001EA610 04054424 */  addiu      $4, $2, 0x504
/* EA714 001EA614 F87F8424 */  addiu      $4, $4, 0x7FF8
/* EA718 001EA618 281E0070 */  paddub     $3, $0, $0
/* EA71C 001EA61C 09000010 */  b          .L001EA644
/* EA720 001EA620 00000000 */   nop
.L001EA624:
/* EA724 001EA624 40110300 */  sll        $2, $3, 5
/* EA728 001EA628 21108200 */  addu       $2, $4, $2
/* EA72C 001EA62C 00004284 */  lh         $2, 0x0($2)
/* EA730 001EA630 51004228 */  slti       $2, $2, 0x51
/* EA734 001EA634 02004014 */  bnez       $2, .L001EA640
/* EA738 001EA638 00000000 */   nop
/* EA73C 001EA63C 01003126 */  addiu      $17, $17, 0x1
.L001EA640:
/* EA740 001EA640 01006324 */  addiu      $3, $3, 0x1
.L001EA644:
/* EA744 001EA644 28006228 */  slti       $2, $3, 0x28
/* EA748 001EA648 F6FF4014 */  bnez       $2, .L001EA624
/* EA74C 001EA64C 00000000 */   nop
.L001EA650:
/* EA750 001EA650 D901013C */  lui        $at, (0x1D90290 >> 16)
/* EA754 001EA654 90022284 */  lh         $2, (0x1D90290 & 0xFFFF)($at)
/* EA758 001EA658 02004018 */  blez       $2, .L001EA664
/* EA75C 001EA65C 00000000 */   nop
/* EA760 001EA660 01003126 */  addiu      $17, $17, 0x1
.L001EA664:
/* EA764 001EA664 2A103202 */  slt        $2, $17, $18
/* EA768 001EA668 03004014 */  bnez       $2, .L001EA678
/* EA76C 001EA66C 00000000 */   nop
/* EA770 001EA670 01000224 */  addiu      $2, $0, 0x1
/* EA774 001EA674 8801A2AF */  sw         $2, 0x188($sp)
.L001EA678:
/* EA778 001EA678 8801A28F */  lw         $2, 0x188($sp)
/* EA77C 001EA67C 0A004010 */  beqz       $2, .L001EA6A8
/* EA780 001EA680 00000000 */   nop
/* EA784 001EA684 8C01A287 */  lh         $2, 0x18C($sp)
/* EA788 001EA688 51004228 */  slti       $2, $2, 0x51
/* EA78C 001EA68C 06004014 */  bnez       $2, .L001EA6A8
/* EA790 001EA690 00000000 */   nop
/* EA794 001EA694 28860070 */  paddub     $16, $0, $0
/* EA798 001EA698 0A000424 */  addiu      $4, $0, 0xA
/* EA79C 001EA69C 01000524 */  addiu      $5, $0, 0x1
/* EA7A0 001EA6A0 749C070C */  jal        SetItemShopTalkMode__Fii
/* EA7A4 001EA6A4 00000000 */   nop
.L001EA6A8:
/* EA7A8 001EA6A8 8C01A287 */  lh         $2, 0x18C($sp)
/* EA7AC 001EA6AC 51004128 */  slti       $at, $2, 0x51
/* EA7B0 001EA6B0 06002010 */  beqz       $at, .L001EA6CC
/* EA7B4 001EA6B4 00000000 */   nop
/* EA7B8 001EA6B8 28860070 */  paddub     $16, $0, $0
/* EA7BC 001EA6BC 28260070 */  paddub     $4, $0, $0
/* EA7C0 001EA6C0 282E0070 */  paddub     $5, $0, $0
/* EA7C4 001EA6C4 749C070C */  jal        SetItemShopTalkMode__Fii
/* EA7C8 001EA6C8 00000000 */   nop
.L001EA6CC:
/* EA7CC 001EA6CC 09000012 */  beqz       $16, .L001EA6F4
/* EA7D0 001EA6D0 00000000 */   nop
/* EA7D4 001EA6D4 12000224 */  addiu      $2, $0, 0x12
/* EA7D8 001EA6D8 D901013C */  lui        $at, (0x1D90250 >> 16)
/* EA7DC 001EA6DC 500222A4 */  sh         $2, (0x1D90250 & 0xFFFF)($at)
/* EA7E0 001EA6E0 01000424 */  addiu      $4, $0, 0x1
/* EA7E4 001EA6E4 BCB3080C */  jal        ComMenuSePlay__Fi
/* EA7E8 001EA6E8 00000000 */   nop
/* EA7EC 001EA6EC 24000010 */  b          .L001EA780
/* EA7F0 001EA6F0 00000000 */   nop
.L001EA6F4:
/* EA7F4 001EA6F4 02000424 */  addiu      $4, $0, 0x2
/* EA7F8 001EA6F8 BCB3080C */  jal        ComMenuSePlay__Fi
/* EA7FC 001EA6FC 00000000 */   nop
/* EA800 001EA700 1F000010 */  b          .L001EA780
/* EA804 001EA704 00000000 */   nop
.L001EA708:
/* EA808 001EA708 CC01023C */  lui        $2, %hi(GamePad)
/* EA80C 001EA70C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EA810 001EA710 80000524 */  addiu      $5, $0, 0x80
/* EA814 001EA714 1CAE040C */  jal        Down__8CGamePadFi
/* EA818 001EA718 00000000 */   nop
/* EA81C 001EA71C 18004010 */  beqz       $2, .L001EA780
/* EA820 001EA720 00000000 */   nop
/* EA824 001EA724 D901013C */  lui        $at, (0x1D900DC >> 16)
/* EA828 001EA728 DC00238C */  lw         $3, (0x1D900DC & 0xFFFF)($at)
/* EA82C 001EA72C 28160072 */  paddub     $2, $16, $0
/* EA830 001EA730 0D006210 */  beq        $3, $2, .L001EA768
/* EA834 001EA734 00000000 */   nop
/* EA838 001EA738 01000224 */  addiu      $2, $0, 0x1
/* EA83C 001EA73C 0D006210 */  beq        $3, $2, .L001EA774
/* EA840 001EA740 00000000 */   nop
/* EA844 001EA744 03006010 */  beqz       $3, .L001EA754
/* EA848 001EA748 00000000 */   nop
/* EA84C 001EA74C 09000010 */  b          .L001EA774
/* EA850 001EA750 00000000 */   nop
.L001EA754:
/* EA854 001EA754 8C94848F */  lw         $4, -0x6B74($gp)
/* EA858 001EA758 1CFF080C */  jal        SeitonItem__10CStockItemFv
/* EA85C 001EA75C 00000000 */   nop
/* EA860 001EA760 04000010 */  b          .L001EA774
/* EA864 001EA764 00000000 */   nop
.L001EA768:
/* EA868 001EA768 8C94848F */  lw         $4, -0x6B74($gp)
/* EA86C 001EA76C C4FF080C */  jal        SeitonAttach__10CStockItemFv
/* EA870 001EA770 00000000 */   nop
.L001EA774:
/* EA874 001EA774 01000424 */  addiu      $4, $0, 0x1
/* EA878 001EA778 BCB3080C */  jal        ComMenuSePlay__Fi
/* EA87C 001EA77C 00000000 */   nop
.L001EA780:
/* EA880 001EA780 28160070 */  paddub     $2, $0, $0
.L001EA784:
/* EA884 001EA784 3000BF7B */  lq         $31, 0x30($sp)
/* EA888 001EA788 2000B27B */  lq         $18, 0x20($sp)
/* EA88C 001EA78C 1000B17B */  lq         $17, 0x10($sp)
/* EA890 001EA790 0000B07B */  lq         $16, 0x0($sp)
/* EA894 001EA794 9001BD27 */  addiu      $sp, $sp, 0x190
/* EA898 001EA798 0800E003 */  jr         $31
/* EA89C 001EA79C 00000000 */   nop
