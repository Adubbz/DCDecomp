.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel WeaponSelectKey__Fv
/* 0FE020 001FDF20 80FEBD27 */  addiu       $29, $29, -0x180
/* 0FE024 001FDF24 5000BF7F */  sq          $31, 0x50($29)
/* 0FE028 001FDF28 4000B47F */  sq          $20, 0x40($29)
/* 0FE02C 001FDF2C 3000B37F */  sq          $19, 0x30($29)
/* 0FE030 001FDF30 2000B27F */  sq          $18, 0x20($29)
/* 0FE034 001FDF34 1000B17F */  sq          $17, 0x10($29)
/* 0FE038 001FDF38 0000B07F */  sq          $16, 0x0($29)
/* 0FE03C 001FDF3C 28860070 */  paddub      $16, $0, $0
/* 0FE040 001FDF40 06001124 */  addiu       $17, $0, 0x6
/* 0FE044 001FDF44 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE048 001FDF48 75EA3280 */  lb          $18, %lo(WepMenu + 0x5)($1)
/* 0FE04C 001FDF4C DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FE050 001FDF50 72EA2484 */  lh          $4, %lo(WepMenu + 0x2)($1)
/* 0FE054 001FDF54 0800812C */  sltiu       $1, $4, 0x8
/* 0FE058 001FDF58 4C052010 */  beqz        $1, .L001FF48C
/* 0FE05C 001FDF5C 00000000 */   nop
/* 0FE060 001FDF60 2A00023C */  lui         $2, %hi(LIT_3606__2)
/* 0FE064 001FDF64 C0D94324 */  addiu       $3, $2, %lo(LIT_3606__2)
/* 0FE068 001FDF68 80100400 */  sll         $2, $4, 2
/* 0FE06C 001FDF6C 21104300 */  addu        $2, $2, $3
/* 0FE070 001FDF70 0000428C */  lw          $2, 0x0($2)
/* 0FE074 001FDF74 08004000 */  jr          $2
/* 0FE078 001FDF78 00000000 */   nop
jlabel .L001FDF7C
.L001FDF7C$b:
/* 0FE07C 001FDF7C 289E0070 */  paddub      $19, $0, $0
/* 0FE080 001FDF80 CC01023C */  lui         $2, %hi(GamePad)
/* 0FE084 001FDF84 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FE088 001FDF88 00800534 */  ori         $5, $0, 0x8000
/* 0FE08C 001FDF8C 1CAE040C */  jal         Down__8CGamePadFi
/* 0FE090 001FDF90 00000000 */   nop
/* 0FE094 001FDF94 09004010 */  beqz        $2, .L001FDFBC
/* 0FE098 001FDF98 00000000 */   nop
/* 0FE09C 001FDF9C DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FE0A0 001FDFA0 74EA2280 */  lb          $2, %lo(WepMenu + 0x4)($1)
/* 0FE0A4 001FDFA4 2A080200 */  slt         $1, $0, $2
/* 0FE0A8 001FDFA8 04002010 */  beqz        $1, .L001FDFBC
/* 0FE0AC 001FDFAC 00000000 */   nop
/* 0FE0B0 001FDFB0 FFFF4224 */  addiu       $2, $2, -0x1
/* 0FE0B4 001FDFB4 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FE0B8 001FDFB8 74EA22A0 */  sb          $2, %lo(WepMenu + 0x4)($1)
.L001FDFBC:
/* 0FE0BC 001FDFBC CC01023C */  lui         $2, %hi(GamePad)
/* 0FE0C0 001FDFC0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FE0C4 001FDFC4 00200524 */  addiu       $5, $0, 0x2000
/* 0FE0C8 001FDFC8 1CAE040C */  jal         Down__8CGamePadFi
/* 0FE0CC 001FDFCC 00000000 */   nop
/* 0FE0D0 001FDFD0 09004010 */  beqz        $2, .L001FDFF8
/* 0FE0D4 001FDFD4 00000000 */   nop
/* 0FE0D8 001FDFD8 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FE0DC 001FDFDC 74EA2280 */  lb          $2, %lo(WepMenu + 0x4)($1)
/* 0FE0E0 001FDFE0 09004128 */  slti        $1, $2, 0x9
/* 0FE0E4 001FDFE4 04002010 */  beqz        $1, .L001FDFF8
/* 0FE0E8 001FDFE8 00000000 */   nop
/* 0FE0EC 001FDFEC 01004224 */  addiu       $2, $2, 0x1
/* 0FE0F0 001FDFF0 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FE0F4 001FDFF4 74EA22A0 */  sb          $2, %lo(WepMenu + 0x4)($1)
.L001FDFF8:
/* 0FE0F8 001FDFF8 CC01023C */  lui         $2, %hi(GamePad)
/* 0FE0FC 001FDFFC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FE100 001FE000 20000524 */  addiu       $5, $0, 0x20
/* 0FE104 001FE004 1CAE040C */  jal         Down__8CGamePadFi
/* 0FE108 001FE008 00000000 */   nop
/* 0FE10C 001FE00C 1F004010 */  beqz        $2, .L001FE08C
/* 0FE110 001FE010 00000000 */   nop
/* 0FE114 001FE014 02000424 */  addiu       $4, $0, 0x2
/* 0FE118 001FE018 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FE11C 001FE01C 00000000 */   nop
/* 0FE120 001FE020 DA01013C */  lui         $1, %hi(WepMenu)
/* 0FE124 001FE024 70EA2384 */  lh          $3, %lo(WepMenu)($1)
/* 0FE128 001FE028 06006010 */  beqz        $3, .L001FE044
/* 0FE12C 001FE02C 00000000 */   nop
/* 0FE130 001FE030 02000224 */  addiu       $2, $0, 0x2
/* 0FE134 001FE034 12006210 */  beq         $3, $2, .L001FE080
/* 0FE138 001FE038 00000000 */   nop
/* 0FE13C 001FE03C 10000010 */  b           .L001FE080
/* 0FE140 001FE040 00000000 */   nop
.L001FE044:
/* 0FE144 001FE044 D894828F */  lw          $2, -0x6B28($28)
/* 0FE148 001FE048 06004014 */  bnez        $2, .L001FE064
/* 0FE14C 001FE04C 00000000 */   nop
/* 0FE150 001FE050 F494848F */  lw          $4, -0x6B0C($28)
/* 0FE154 001FE054 38B4080C */  jal         MenuTextureReload__Fi
/* 0FE158 001FE058 00000000 */   nop
/* 0FE15C 001FE05C ACA9080C */  jal         DngActiveWeaponTextureCopy__Fv
/* 0FE160 001FE060 00000000 */   nop
.L001FE064:
/* 0FE164 001FE064 12000224 */  addiu       $2, $0, 0x12
/* 0FE168 001FE068 208882AF */  sw          $2, -0x77E0($28)
/* 0FE16C 001FE06C 02000224 */  addiu       $2, $0, 0x2
/* 0FE170 001FE070 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FE174 001FE074 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FE178 001FE078 DA01013C */  lui         $1, %hi(WepMenu + 0x10)
/* 0FE17C 001FE07C 80EA20AC */  sw          $0, %lo(WepMenu + 0x10)($1)
.L001FE080:
/* 0FE180 001FE080 01001324 */  addiu       $19, $0, 0x1
/* 0FE184 001FE084 2A000010 */  b           .L001FE130
/* 0FE188 001FE088 00000000 */   nop
.L001FE08C:
/* 0FE18C 001FE08C CC01023C */  lui         $2, %hi(GamePad)
/* 0FE190 001FE090 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FE194 001FE094 40000524 */  addiu       $5, $0, 0x40
/* 0FE198 001FE098 1CAE040C */  jal         Down__8CGamePadFi
/* 0FE19C 001FE09C 00000000 */   nop
/* 0FE1A0 001FE0A0 23004010 */  beqz        $2, .L001FE130
/* 0FE1A4 001FE0A4 00000000 */   nop
/* 0FE1A8 001FE0A8 DA01013C */  lui         $1, %hi(WepMenu)
/* 0FE1AC 001FE0AC 70EA2284 */  lh          $2, %lo(WepMenu)($1)
/* 0FE1B0 001FE0B0 03004010 */  beqz        $2, .L001FE0C0
/* 0FE1B4 001FE0B4 00000000 */   nop
/* 0FE1B8 001FE0B8 1C000010 */  b           .L001FE12C
/* 0FE1BC 001FE0BC 00000000 */   nop
.L001FE0C0:
/* 0FE1C0 001FE0C0 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE1C4 001FE0C4 75EA2480 */  lb          $4, %lo(WepMenu + 0x5)($1)
/* 0FE1C8 001FE0C8 68CF070C */  jal         GetDefaultWeaponNo__Fi
/* 0FE1CC 001FE0CC 00000000 */   nop
/* 0FE1D0 001FE0D0 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FE1D4 001FE0D4 74EA2480 */  lb          $4, %lo(WepMenu + 0x4)($1)
/* 0FE1D8 001FE0D8 40190400 */  sll         $3, $4, 5
/* 0FE1DC 001FE0DC 23186400 */  subu        $3, $3, $4
/* 0FE1E0 001FE0E0 C0200300 */  sll         $4, $3, 3
/* 0FE1E4 001FE0E4 1495838F */  lw          $3, -0x6AEC($28)
/* 0FE1E8 001FE0E8 21186400 */  addu        $3, $3, $4
/* 0FE1EC 001FE0EC 00006384 */  lh          $3, 0x0($3)
/* 0FE1F0 001FE0F0 2A086200 */  slt         $1, $3, $2
/* 0FE1F4 001FE0F4 06002010 */  beqz        $1, .L001FE110
/* 0FE1F8 001FE0F8 00000000 */   nop
/* 0FE1FC 001FE0FC 02000424 */  addiu       $4, $0, 0x2
/* 0FE200 001FE100 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FE204 001FE104 00000000 */   nop
/* 0FE208 001FE108 08000010 */  b           .L001FE12C
/* 0FE20C 001FE10C 00000000 */   nop
.L001FE110:
/* 0FE210 001FE110 01000424 */  addiu       $4, $0, 0x1
/* 0FE214 001FE114 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FE218 001FE118 72EA24A4 */  sh          $4, %lo(WepMenu + 0x2)($1)
/* 0FE21C 001FE11C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE220 001FE120 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
/* 0FE224 001FE124 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FE228 001FE128 00000000 */   nop
.L001FE12C:
/* 0FE22C 001FE12C 01001324 */  addiu       $19, $0, 0x1
.L001FE130:
/* 0FE230 001FE130 D6046016 */  bnez        $19, .L001FF48C
/* 0FE234 001FE134 00000000 */   nop
/* 0FE238 001FE138 CC01023C */  lui         $2, %hi(GamePad)
/* 0FE23C 001FE13C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FE240 001FE140 0A000524 */  addiu       $5, $0, 0xA
/* 0FE244 001FE144 1CAE040C */  jal         Down__8CGamePadFi
/* 0FE248 001FE148 00000000 */   nop
/* 0FE24C 001FE14C 0D004010 */  beqz        $2, .L001FE184
/* 0FE250 001FE150 00000000 */   nop
/* 0FE254 001FE154 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE258 001FE158 75EA2280 */  lb          $2, %lo(WepMenu + 0x5)($1)
/* 0FE25C 001FE15C 01004224 */  addiu       $2, $2, 0x1
/* 0FE260 001FE160 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE264 001FE164 75EA22A0 */  sb          $2, %lo(WepMenu + 0x5)($1)
/* 0FE268 001FE168 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE26C 001FE16C 75EA2280 */  lb          $2, %lo(WepMenu + 0x5)($1)
/* 0FE270 001FE170 06004228 */  slti        $2, $2, 0x6
/* 0FE274 001FE174 03004014 */  bnez        $2, .L001FE184
/* 0FE278 001FE178 00000000 */   nop
/* 0FE27C 001FE17C DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE280 001FE180 75EA20A0 */  sb          $0, %lo(WepMenu + 0x5)($1)
.L001FE184:
/* 0FE284 001FE184 CC01023C */  lui         $2, %hi(GamePad)
/* 0FE288 001FE188 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FE28C 001FE18C 05000524 */  addiu       $5, $0, 0x5
/* 0FE290 001FE190 1CAE040C */  jal         Down__8CGamePadFi
/* 0FE294 001FE194 00000000 */   nop
/* 0FE298 001FE198 BC044010 */  beqz        $2, .L001FF48C
/* 0FE29C 001FE19C 00000000 */   nop
/* 0FE2A0 001FE1A0 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE2A4 001FE1A4 75EA2280 */  lb          $2, %lo(WepMenu + 0x5)($1)
/* 0FE2A8 001FE1A8 FFFF4224 */  addiu       $2, $2, -0x1
/* 0FE2AC 001FE1AC DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE2B0 001FE1B0 75EA22A0 */  sb          $2, %lo(WepMenu + 0x5)($1)
/* 0FE2B4 001FE1B4 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE2B8 001FE1B8 75EA2280 */  lb          $2, %lo(WepMenu + 0x5)($1)
/* 0FE2BC 001FE1BC B3044104 */  bgez        $2, .L001FF48C
/* 0FE2C0 001FE1C0 00000000 */   nop
/* 0FE2C4 001FE1C4 FFFF2226 */  addiu       $2, $17, -0x1
/* 0FE2C8 001FE1C8 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE2CC 001FE1CC 75EA22A0 */  sb          $2, %lo(WepMenu + 0x5)($1)
/* 0FE2D0 001FE1D0 AE040010 */  b           .L001FF48C
/* 0FE2D4 001FE1D4 00000000 */   nop
jlabel .L001FE1D8
.L001FE1D8$b:
/* 0FE2D8 001FE1D8 C0CF070C */  jal         GetNowSelectWeapon__Fv
/* 0FE2DC 001FE1DC 00000000 */   nop
/* 0FE2E0 001FE1E0 288E4070 */  paddub      $17, $2, $0
/* 0FE2E4 001FE1E4 28262072 */  paddub      $4, $17, $0
/* 0FE2E8 001FE1E8 ACEF070C */  jal         NowWeaponStatusValue__FP11WEAPON_HAVE
/* 0FE2EC 001FE1EC 00000000 */   nop
/* 0FE2F0 001FE1F0 289E4070 */  paddub      $19, $2, $0
/* 0FE2F4 001FE1F4 CC01023C */  lui         $2, %hi(GamePad)
/* 0FE2F8 001FE1F8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FE2FC 001FE1FC 00100524 */  addiu       $5, $0, 0x1000
/* 0FE300 001FE200 1CAE040C */  jal         Down__8CGamePadFi
/* 0FE304 001FE204 00000000 */   nop
/* 0FE308 001FE208 13004010 */  beqz        $2, .L001FE258
/* 0FE30C 001FE20C 00000000 */   nop
/* 0FE310 001FE210 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE314 001FE214 90EA248C */  lw          $4, %lo(WepMenu + 0x20)($1)
/* 0FE318 001FE218 2A080400 */  slt         $1, $0, $4
/* 0FE31C 001FE21C 09002010 */  beqz        $1, .L001FE244
/* 0FE320 001FE220 00000000 */   nop
/* 0FE324 001FE224 05008128 */  slti        $1, $4, 0x5
/* 0FE328 001FE228 06002010 */  beqz        $1, .L001FE244
/* 0FE32C 001FE22C 00000000 */   nop
/* 0FE330 001FE230 FFFF8224 */  addiu       $2, $4, -0x1
/* 0FE334 001FE234 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE338 001FE238 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
/* 0FE33C 001FE23C 06000010 */  b           .L001FE258
/* 0FE340 001FE240 00000000 */   nop
.L001FE244:
/* 0FE344 001FE244 282E6072 */  paddub      $5, $19, $0
/* 0FE348 001FE248 9CF7070C */  jal         WeaponMenuKastumSelectUp__Fii
/* 0FE34C 001FE24C 00000000 */   nop
/* 0FE350 001FE250 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE354 001FE254 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
.L001FE258:
/* 0FE358 001FE258 CC01023C */  lui         $2, %hi(GamePad)
/* 0FE35C 001FE25C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FE360 001FE260 00400524 */  addiu       $5, $0, 0x4000
/* 0FE364 001FE264 1CAE040C */  jal         Down__8CGamePadFi
/* 0FE368 001FE268 00000000 */   nop
/* 0FE36C 001FE26C 11004010 */  beqz        $2, .L001FE2B4
/* 0FE370 001FE270 00000000 */   nop
/* 0FE374 001FE274 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE378 001FE278 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FE37C 001FE27C 03006228 */  slti        $2, $3, 0x3
/* 0FE380 001FE280 09004014 */  bnez        $2, .L001FE2A8
/* 0FE384 001FE284 00000000 */   nop
/* 0FE388 001FE288 01006424 */  addiu       $4, $3, 0x1
/* 0FE38C 001FE28C 282E6072 */  paddub      $5, $19, $0
/* 0FE390 001FE290 B4F7070C */  jal         WeaponMenuKastumSelectDown__Fii
/* 0FE394 001FE294 00000000 */   nop
/* 0FE398 001FE298 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE39C 001FE29C 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
/* 0FE3A0 001FE2A0 04000010 */  b           .L001FE2B4
/* 0FE3A4 001FE2A4 00000000 */   nop
.L001FE2A8:
/* 0FE3A8 001FE2A8 01006224 */  addiu       $2, $3, 0x1
/* 0FE3AC 001FE2AC DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE3B0 001FE2B0 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
.L001FE2B4:
/* 0FE3B4 001FE2B4 CC01023C */  lui         $2, %hi(GamePad)
/* 0FE3B8 001FE2B8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FE3BC 001FE2BC 00200524 */  addiu       $5, $0, 0x2000
/* 0FE3C0 001FE2C0 1CAE040C */  jal         Down__8CGamePadFi
/* 0FE3C4 001FE2C4 00000000 */   nop
/* 0FE3C8 001FE2C8 10004010 */  beqz        $2, .L001FE30C
/* 0FE3CC 001FE2CC 00000000 */   nop
/* 0FE3D0 001FE2D0 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE3D4 001FE2D4 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FE3D8 001FE2D8 0C004014 */  bnez        $2, .L001FE30C
/* 0FE3DC 001FE2DC 00000000 */   nop
/* 0FE3E0 001FE2E0 0C000224 */  addiu       $2, $0, 0xC
/* 0FE3E4 001FE2E4 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FE3E8 001FE2E8 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FE3EC 001FE2EC 01000224 */  addiu       $2, $0, 0x1
/* 0FE3F0 001FE2F0 DA01013C */  lui         $1, %hi(WepMenu + 0x9)
/* 0FE3F4 001FE2F4 79EA22A0 */  sb          $2, %lo(WepMenu + 0x9)($1)
/* 0FE3F8 001FE2F8 28260070 */  paddub      $4, $0, $0
/* 0FE3FC 001FE2FC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FE400 001FE300 00000000 */   nop
/* 0FE404 001FE304 61040010 */  b           .L001FF48C
/* 0FE408 001FE308 00000000 */   nop
.L001FE30C:
/* 0FE40C 001FE30C CC01023C */  lui         $2, %hi(GamePad)
/* 0FE410 001FE310 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FE414 001FE314 40000524 */  addiu       $5, $0, 0x40
/* 0FE418 001FE318 1CAE040C */  jal         Down__8CGamePadFi
/* 0FE41C 001FE31C 00000000 */   nop
/* 0FE420 001FE320 0A024010 */  beqz        $2, .L001FEB4C
/* 0FE424 001FE324 00000000 */   nop
/* 0FE428 001FE328 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FE42C 001FE32C 74EA3380 */  lb          $19, %lo(WepMenu + 0x4)($1)
/* 0FE430 001FE330 28262072 */  paddub      $4, $17, $0
/* 0FE434 001FE334 ACEF070C */  jal         NowWeaponStatusValue__FP11WEAPON_HAVE
/* 0FE438 001FE338 00000000 */   nop
/* 0FE43C 001FE33C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE440 001FE340 90EA248C */  lw          $4, %lo(WepMenu + 0x20)($1)
/* 0FE444 001FE344 0700812C */  sltiu       $1, $4, 0x7
/* 0FE448 001FE348 50042010 */  beqz        $1, .L001FF48C
/* 0FE44C 001FE34C 00000000 */   nop
/* 0FE450 001FE350 2A00023C */  lui         $2, %hi(LIT_3607)
/* 0FE454 001FE354 A0D94324 */  addiu       $3, $2, %lo(LIT_3607)
/* 0FE458 001FE358 80100400 */  sll         $2, $4, 2
/* 0FE45C 001FE35C 21104300 */  addu        $2, $2, $3
/* 0FE460 001FE360 0000428C */  lw          $2, 0x0($2)
/* 0FE464 001FE364 08004000 */  jr          $2
/* 0FE468 001FE368 00000000 */   nop
jlabel .L001FE36C
.L001FE36C$b:
/* 0FE46C 001FE36C D494858F */  lw          $5, -0x6B2C($28)
/* 0FE470 001FE370 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE474 001FE374 75EA2380 */  lb          $3, %lo(WepMenu + 0x5)($1)
/* 0FE478 001FE378 80100300 */  sll         $2, $3, 2
/* 0FE47C 001FE37C 21104500 */  addu        $2, $2, $5
/* 0FE480 001FE380 C842428C */  lw          $2, 0x42C8($2)
/* 0FE484 001FE384 20004230 */  andi        $2, $2, 0x20
/* 0FE488 001FE388 0C004010 */  beqz        $2, .L001FE3BC
/* 0FE48C 001FE38C 00000000 */   nop
/* 0FE490 001FE390 02000424 */  addiu       $4, $0, 0x2
/* 0FE494 001FE394 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FE498 001FE398 00000000 */   nop
/* 0FE49C 001FE39C 0B000224 */  addiu       $2, $0, 0xB
/* 0FE4A0 001FE3A0 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FE4A4 001FE3A4 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FE4A8 001FE3A8 03000224 */  addiu       $2, $0, 0x3
/* 0FE4AC 001FE3AC DA01013C */  lui         $1, %hi(WepMenu + 0x8)
/* 0FE4B0 001FE3B0 78EA22A0 */  sb          $2, %lo(WepMenu + 0x8)($1)
/* 0FE4B4 001FE3B4 35040010 */  b           .L001FF48C
/* 0FE4B8 001FE3B8 00000000 */   nop
.L001FE3BC:
/* 0FE4BC 001FE3BC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0FE4C0 001FE3C0 2108A100 */  addu        $1, $5, $1
/* 0FE4C4 001FE3C4 108B248C */  lw          $4, -0x74F0($1)
/* 0FE4C8 001FE3C8 0A000224 */  addiu       $2, $0, 0xA
/* 0FE4CC 001FE3CC 0C008214 */  bne         $4, $2, .L001FE400
/* 0FE4D0 001FE3D0 00000000 */   nop
/* 0FE4D4 001FE3D4 0B000224 */  addiu       $2, $0, 0xB
/* 0FE4D8 001FE3D8 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FE4DC 001FE3DC 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FE4E0 001FE3E0 04000224 */  addiu       $2, $0, 0x4
/* 0FE4E4 001FE3E4 DA01013C */  lui         $1, %hi(WepMenu + 0x8)
/* 0FE4E8 001FE3E8 78EA22A0 */  sb          $2, %lo(WepMenu + 0x8)($1)
/* 0FE4EC 001FE3EC 02000424 */  addiu       $4, $0, 0x2
/* 0FE4F0 001FE3F0 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FE4F4 001FE3F4 00000000 */   nop
/* 0FE4F8 001FE3F8 24040010 */  b           .L001FF48C
/* 0FE4FC 001FE3FC 00000000 */   nop
.L001FE400:
/* 0FE500 001FE400 0500A280 */  lb          $2, 0x5($5)
/* 0FE504 001FE404 2A086200 */  slt         $1, $3, $2
/* 0FE508 001FE408 0B002014 */  bnez        $1, .L001FE438
/* 0FE50C 001FE40C 00000000 */   nop
/* 0FE510 001FE410 0B000224 */  addiu       $2, $0, 0xB
/* 0FE514 001FE414 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FE518 001FE418 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FE51C 001FE41C 02000424 */  addiu       $4, $0, 0x2
/* 0FE520 001FE420 DA01013C */  lui         $1, %hi(WepMenu + 0x8)
/* 0FE524 001FE424 78EA24A0 */  sb          $4, %lo(WepMenu + 0x8)($1)
/* 0FE528 001FE428 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FE52C 001FE42C 00000000 */   nop
/* 0FE530 001FE430 16040010 */  b           .L001FF48C
/* 0FE534 001FE434 00000000 */   nop
.L001FE438:
/* 0FE538 001FE438 21106500 */  addu        $2, $3, $5
/* 0FE53C 001FE43C 404353A0 */  sb          $19, 0x4340($2)
/* 0FE540 001FE440 789580AF */  sw          $0, -0x6A88($28)
/* 0FE544 001FE444 05000324 */  addiu       $3, $0, 0x5
/* 0FE548 001FE448 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FE54C 001FE44C 7CEA23A4 */  sh          $3, %lo(WepMenu + 0xC)($1)
/* 0FE550 001FE450 D494828F */  lw          $2, -0x6B2C($28)
/* 0FE554 001FE454 04004480 */  lb          $4, 0x4($2)
/* 0FE558 001FE458 D894828F */  lw          $2, -0x6B28($28)
/* 0FE55C 001FE45C 12004014 */  bnez        $2, .L001FE4A8
/* 0FE560 001FE460 00000000 */   nop
/* 0FE564 001FE464 05008314 */  bne         $4, $3, .L001FE47C
/* 0FE568 001FE468 00000000 */   nop
/* 0FE56C 001FE46C DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE570 001FE470 75EA2280 */  lb          $2, %lo(WepMenu + 0x5)($1)
/* 0FE574 001FE474 08004310 */  beq         $2, $3, .L001FE498
/* 0FE578 001FE478 00000000 */   nop
.L001FE47C:
/* 0FE57C 001FE47C 03000324 */  addiu       $3, $0, 0x3
/* 0FE580 001FE480 09008314 */  bne         $4, $3, .L001FE4A8
/* 0FE584 001FE484 00000000 */   nop
/* 0FE588 001FE488 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE58C 001FE48C 75EA2280 */  lb          $2, %lo(WepMenu + 0x5)($1)
/* 0FE590 001FE490 05004314 */  bne         $2, $3, .L001FE4A8
/* 0FE594 001FE494 00000000 */   nop
.L001FE498:
/* 0FE598 001FE498 30FB040C */  jal         StartReadBG__Fv
/* 0FE59C 001FE49C 00000000 */   nop
/* 0FE5A0 001FE4A0 2C34080C */  jal         DngWepEffectReadStart__Fv
/* 0FE5A4 001FE4A4 00000000 */   nop
.L001FE4A8:
/* 0FE5A8 001FE4A8 17000424 */  addiu       $4, $0, 0x17
/* 0FE5AC 001FE4AC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FE5B0 001FE4B0 00000000 */   nop
/* 0FE5B4 001FE4B4 F5030010 */  b           .L001FF48C
/* 0FE5B8 001FE4B8 00000000 */   nop
jlabel .L001FE4BC
.L001FE4BC$b:
/* 0FE5BC 001FE4BC 0A000224 */  addiu       $2, $0, 0xA
/* 0FE5C0 001FE4C0 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FE5C4 001FE4C4 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FE5C8 001FE4C8 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE5CC 001FE4CC 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
/* 0FE5D0 001FE4D0 DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FE5D4 001FE4D4 E8EB20A0 */  sb          $0, %lo(WepMenu + 0x178)($1)
/* 0FE5D8 001FE4D8 16002482 */  lb          $4, 0x16($17)
/* 0FE5DC 001FE4DC 2434080C */  jal         SetOldEffectKind__Fi
/* 0FE5E0 001FE4E0 00000000 */   nop
/* 0FE5E4 001FE4E4 00002486 */  lh          $4, 0x0($17)
/* 0FE5E8 001FE4E8 C4C7080C */  jal         GetWeaponHoleNum__Fi
/* 0FE5EC 001FE4EC 00000000 */   nop
/* 0FE5F0 001FE4F0 288E4070 */  paddub      $17, $2, $0
/* 0FE5F4 001FE4F4 1C8D848F */  lw          $4, -0x72E4($28)
/* 0FE5F8 001FE4F8 D05E050C */  jal         GetMenuCursor__9CSaveDataFv
/* 0FE5FC 001FE4FC 00000000 */   nop
/* 0FE600 001FE500 289E4070 */  paddub      $19, $2, $0
/* 0FE604 001FE504 02000424 */  addiu       $4, $0, 0x2
/* 0FE608 001FE508 D8BD080C */  jal         PersonalRetMax__Fi
/* 0FE60C 001FE50C 00000000 */   nop
/* 0FE610 001FE510 00006386 */  lh          $3, 0x0($19)
/* 0FE614 001FE514 61006014 */  bnez        $3, .L001FE69C
/* 0FE618 001FE518 00000000 */   nop
/* 0FE61C 001FE51C 1A006386 */  lh          $3, 0x1A($19)
/* 0FE620 001FE520 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FE624 001FE524 72EA23A4 */  sh          $3, %lo(WepMenu + 0x2)($1)
/* 0FE628 001FE528 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FE62C 001FE52C 72EA2484 */  lh          $4, %lo(WepMenu + 0x2)($1)
/* 0FE630 001FE530 08008328 */  slti        $3, $4, 0x8
/* 0FE634 001FE534 04006014 */  bnez        $3, .L001FE548
/* 0FE638 001FE538 00000000 */   nop
/* 0FE63C 001FE53C 0C008128 */  slti        $1, $4, 0xC
/* 0FE640 001FE540 04002014 */  bnez        $1, .L001FE554
/* 0FE644 001FE544 00000000 */   nop
.L001FE548:
/* 0FE648 001FE548 0A000324 */  addiu       $3, $0, 0xA
/* 0FE64C 001FE54C DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FE650 001FE550 72EA23A4 */  sh          $3, %lo(WepMenu + 0x2)($1)
.L001FE554:
/* 0FE654 001FE554 06006386 */  lh          $3, 0x6($19)
/* 0FE658 001FE558 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE65C 001FE55C 90EA23AC */  sw          $3, %lo(WepMenu + 0x20)($1)
/* 0FE660 001FE560 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FE664 001FE564 72EA2484 */  lh          $4, %lo(WepMenu + 0x2)($1)
/* 0FE668 001FE568 0B000324 */  addiu       $3, $0, 0xB
/* 0FE66C 001FE56C 7A008310 */  beq         $4, $3, .L001FE758
/* 0FE670 001FE570 00000000 */   nop
/* 0FE674 001FE574 08000324 */  addiu       $3, $0, 0x8
/* 0FE678 001FE578 44008310 */  beq         $4, $3, .L001FE68C
/* 0FE67C 001FE57C 00000000 */   nop
/* 0FE680 001FE580 0A000324 */  addiu       $3, $0, 0xA
/* 0FE684 001FE584 10008310 */  beq         $4, $3, .L001FE5C8
/* 0FE688 001FE588 00000000 */   nop
/* 0FE68C 001FE58C 09000324 */  addiu       $3, $0, 0x9
/* 0FE690 001FE590 03008310 */  beq         $4, $3, .L001FE5A0
/* 0FE694 001FE594 00000000 */   nop
/* 0FE698 001FE598 6F000010 */  b           .L001FE758
/* 0FE69C 001FE59C 00000000 */   nop
.L001FE5A0:
/* 0FE6A0 001FE5A0 FFFF2426 */  addiu       $4, $17, -0x1
/* 0FE6A4 001FE5A4 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE6A8 001FE5A8 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FE6AC 001FE5AC 2A088300 */  slt         $1, $4, $3
/* 0FE6B0 001FE5B0 69002010 */  beqz        $1, .L001FE758
/* 0FE6B4 001FE5B4 00000000 */   nop
/* 0FE6B8 001FE5B8 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE6BC 001FE5BC 90EA24AC */  sw          $4, %lo(WepMenu + 0x20)($1)
/* 0FE6C0 001FE5C0 65000010 */  b           .L001FE758
/* 0FE6C4 001FE5C4 00000000 */   nop
.L001FE5C8:
/* 0FE6C8 001FE5C8 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE6CC 001FE5CC 90EA248C */  lw          $4, %lo(WepMenu + 0x20)($1)
/* 0FE6D0 001FE5D0 05000324 */  addiu       $3, $0, 0x5
/* 0FE6D4 001FE5D4 1A008300 */  div         $0, $4, $3
/* 0FE6D8 001FE5D8 02006014 */  bnez        $3, .L001FE5E4
/* 0FE6DC 001FE5DC 00000000 */   nop
/* 0FE6E0 001FE5E0 CD010000 */  break       0, 7
.L001FE5E4:
/* 0FE6E4 001FE5E4 12180000 */  mflo        $3
/* 0FE6E8 001FE5E8 DA01013C */  lui         $1, %hi(WepMenu + 0x2C)
/* 0FE6EC 001FE5EC 9CEA23AC */  sw          $3, %lo(WepMenu + 0x2C)($1)
/* 0FE6F0 001FE5F0 05000324 */  addiu       $3, $0, 0x5
/* 0FE6F4 001FE5F4 1A004300 */  div         $0, $2, $3
/* 0FE6F8 001FE5F8 02006014 */  bnez        $3, .L001FE604
/* 0FE6FC 001FE5FC 00000000 */   nop
/* 0FE700 001FE600 CD010000 */  break       0, 7
.L001FE604:
/* 0FE704 001FE604 12180000 */  mflo        $3
/* 0FE708 001FE608 FCFF6424 */  addiu       $4, $3, -0x4
/* 0FE70C 001FE60C DA01013C */  lui         $1, %hi(WepMenu + 0x2C)
/* 0FE710 001FE610 9CEA238C */  lw          $3, %lo(WepMenu + 0x2C)($1)
/* 0FE714 001FE614 2A088300 */  slt         $1, $4, $3
/* 0FE718 001FE618 4F002010 */  beqz        $1, .L001FE758
/* 0FE71C 001FE61C 00000000 */   nop
/* 0FE720 001FE620 DA01013C */  lui         $1, %hi(WepMenu + 0x2C)
/* 0FE724 001FE624 9CEA24AC */  sw          $4, %lo(WepMenu + 0x2C)($1)
/* 0FE728 001FE628 06000010 */  b           .L001FE644
/* 0FE72C 001FE62C 00000000 */   nop
.L001FE630:
/* 0FE730 001FE630 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE734 001FE634 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FE738 001FE638 FBFF6324 */  addiu       $3, $3, -0x5
/* 0FE73C 001FE63C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE740 001FE640 90EA23AC */  sw          $3, %lo(WepMenu + 0x20)($1)
.L001FE644:
/* 0FE744 001FE644 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE748 001FE648 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FE74C 001FE64C 2A184300 */  slt         $3, $2, $3
/* 0FE750 001FE650 F7FF6014 */  bnez        $3, .L001FE630
/* 0FE754 001FE654 00000000 */   nop
/* 0FE758 001FE658 06000010 */  b           .L001FE674
/* 0FE75C 001FE65C 00000000 */   nop
.L001FE660:
/* 0FE760 001FE660 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE764 001FE664 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FE768 001FE668 05006324 */  addiu       $3, $3, 0x5
/* 0FE76C 001FE66C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE770 001FE670 90EA23AC */  sw          $3, %lo(WepMenu + 0x20)($1)
.L001FE674:
/* 0FE774 001FE674 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE778 001FE678 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FE77C 001FE67C F8FF6004 */  bltz        $3, .L001FE660
/* 0FE780 001FE680 00000000 */   nop
/* 0FE784 001FE684 34000010 */  b           .L001FE758
/* 0FE788 001FE688 00000000 */   nop
.L001FE68C:
/* 0FE78C 001FE68C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE790 001FE690 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
/* 0FE794 001FE694 30000010 */  b           .L001FE758
/* 0FE798 001FE698 00000000 */   nop
.L001FE69C:
/* 0FE79C 001FE69C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE7A0 001FE6A0 90EA248C */  lw          $4, %lo(WepMenu + 0x20)($1)
/* 0FE7A4 001FE6A4 05000324 */  addiu       $3, $0, 0x5
/* 0FE7A8 001FE6A8 1A008300 */  div         $0, $4, $3
/* 0FE7AC 001FE6AC 02006014 */  bnez        $3, .L001FE6B8
/* 0FE7B0 001FE6B0 00000000 */   nop
/* 0FE7B4 001FE6B4 CD010000 */  break       0, 7
.L001FE6B8:
/* 0FE7B8 001FE6B8 12180000 */  mflo        $3
/* 0FE7BC 001FE6BC DA01013C */  lui         $1, %hi(WepMenu + 0x2C)
/* 0FE7C0 001FE6C0 9CEA23AC */  sw          $3, %lo(WepMenu + 0x2C)($1)
/* 0FE7C4 001FE6C4 05000324 */  addiu       $3, $0, 0x5
/* 0FE7C8 001FE6C8 1A004300 */  div         $0, $2, $3
/* 0FE7CC 001FE6CC 02006014 */  bnez        $3, .L001FE6D8
/* 0FE7D0 001FE6D0 00000000 */   nop
/* 0FE7D4 001FE6D4 CD010000 */  break       0, 7
.L001FE6D8:
/* 0FE7D8 001FE6D8 12180000 */  mflo        $3
/* 0FE7DC 001FE6DC FCFF6424 */  addiu       $4, $3, -0x4
/* 0FE7E0 001FE6E0 DA01013C */  lui         $1, %hi(WepMenu + 0x2C)
/* 0FE7E4 001FE6E4 9CEA238C */  lw          $3, %lo(WepMenu + 0x2C)($1)
/* 0FE7E8 001FE6E8 2A088300 */  slt         $1, $4, $3
/* 0FE7EC 001FE6EC 1A002010 */  beqz        $1, .L001FE758
/* 0FE7F0 001FE6F0 00000000 */   nop
/* 0FE7F4 001FE6F4 DA01013C */  lui         $1, %hi(WepMenu + 0x2C)
/* 0FE7F8 001FE6F8 9CEA24AC */  sw          $4, %lo(WepMenu + 0x2C)($1)
/* 0FE7FC 001FE6FC 06000010 */  b           .L001FE718
/* 0FE800 001FE700 00000000 */   nop
.L001FE704:
/* 0FE804 001FE704 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE808 001FE708 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FE80C 001FE70C FBFF6324 */  addiu       $3, $3, -0x5
/* 0FE810 001FE710 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE814 001FE714 90EA23AC */  sw          $3, %lo(WepMenu + 0x20)($1)
.L001FE718:
/* 0FE818 001FE718 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE81C 001FE71C 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FE820 001FE720 2A184300 */  slt         $3, $2, $3
/* 0FE824 001FE724 F7FF6014 */  bnez        $3, .L001FE704
/* 0FE828 001FE728 00000000 */   nop
/* 0FE82C 001FE72C 06000010 */  b           .L001FE748
/* 0FE830 001FE730 00000000 */   nop
.L001FE734:
/* 0FE834 001FE734 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE838 001FE738 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FE83C 001FE73C 05006324 */  addiu       $3, $3, 0x5
/* 0FE840 001FE740 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE844 001FE744 90EA23AC */  sw          $3, %lo(WepMenu + 0x20)($1)
.L001FE748:
/* 0FE848 001FE748 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE84C 001FE74C 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FE850 001FE750 F8FF6004 */  bltz        $3, .L001FE734
/* 0FE854 001FE754 00000000 */   nop
.L001FE758:
/* 0FE858 001FE758 0500201E */  bgtz        $17, .L001FE770
/* 0FE85C 001FE75C 00000000 */   nop
/* 0FE860 001FE760 DA01013C */  lui         $1, %hi(WepMenu + 0x6)
/* 0FE864 001FE764 76EA20A0 */  sb          $0, %lo(WepMenu + 0x6)($1)
/* 0FE868 001FE768 04000010 */  b           .L001FE77C
/* 0FE86C 001FE76C 00000000 */   nop
.L001FE770:
/* 0FE870 001FE770 01000324 */  addiu       $3, $0, 0x1
/* 0FE874 001FE774 DA01013C */  lui         $1, %hi(WepMenu + 0x6)
/* 0FE878 001FE778 76EA23A0 */  sb          $3, %lo(WepMenu + 0x6)($1)
.L001FE77C:
/* 0FE87C 001FE77C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE880 001FE780 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FE884 001FE784 03006104 */  bgez        $3, .L001FE794
/* 0FE888 001FE788 00000000 */   nop
/* 0FE88C 001FE78C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FE890 001FE790 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
.L001FE794:
/* 0FE894 001FE794 05000324 */  addiu       $3, $0, 0x5
/* 0FE898 001FE798 1A004300 */  div         $0, $2, $3
/* 0FE89C 001FE79C 02006014 */  bnez        $3, .L001FE7A8
/* 0FE8A0 001FE7A0 00000000 */   nop
/* 0FE8A4 001FE7A4 CD010000 */  break       0, 7
.L001FE7A8:
/* 0FE8A8 001FE7A8 12280000 */  mflo        $5
/* 0FE8AC 001FE7AC 7F000424 */  addiu       $4, $0, 0x7F
/* 0FE8B0 001FE7B0 DA01013C */  lui         $1, %hi(WepMenu + 0x2C)
/* 0FE8B4 001FE7B4 9CEA238C */  lw          $3, %lo(WepMenu + 0x2C)($1)
/* 0FE8B8 001FE7B8 80100300 */  sll         $2, $3, 2
/* 0FE8BC 001FE7BC 21104300 */  addu        $2, $2, $3
/* 0FE8C0 001FE7C0 C0100200 */  sll         $2, $2, 3
/* 0FE8C4 001FE7C4 23108200 */  subu        $2, $4, $2
/* 0FE8C8 001FE7C8 00008244 */  mtc1        $2, $f0
/* 0FE8CC 001FE7CC 00000000 */  nop
/* 0FE8D0 001FE7D0 20008046 */  cvt.s.w     $f0, $f0
/* 0FE8D4 001FE7D4 DA01013C */  lui         $1, %hi(WepMenu + 0x24)
/* 0FE8D8 001FE7D8 94EA20E4 */  swc1        $f0, %lo(WepMenu + 0x24)($1)
/* 0FE8DC 001FE7DC E442023C */  lui         $2, (0x42E40000 >> 16)
/* 0FE8E0 001FE7E0 00088244 */  mtc1        $2, $f1
/* 0FE8E4 001FE7E4 DA01013C */  lui         $1, %hi(WepMenu + 0x2C)
/* 0FE8E8 001FE7E8 9CEA20C4 */  lwc1        $f0, %lo(WepMenu + 0x2C)($1)
/* 0FE8EC 001FE7EC 20008046 */  cvt.s.w     $f0, $f0
/* 0FE8F0 001FE7F0 42080046 */  mul.s       $f1, $f1, $f0
/* 0FE8F4 001FE7F4 00008544 */  mtc1        $5, $f0
/* 0FE8F8 001FE7F8 00000000 */  nop
/* 0FE8FC 001FE7FC 20008046 */  cvt.s.w     $f0, $f0
/* 0FE900 001FE800 43080046 */  div.s       $f1, $f1, $f0
/* 0FE904 001FE804 0C43023C */  lui         $2, (0x430C0000 >> 16)
/* 0FE908 001FE808 00008244 */  mtc1        $2, $f0
/* 0FE90C 001FE80C 00000000 */  nop
/* 0FE910 001FE810 00000146 */  add.s       $f0, $f0, $f1
/* 0FE914 001FE814 DA01013C */  lui         $1, %hi(WepMenu + 0x28)
/* 0FE918 001FE818 98EA20E4 */  swc1        $f0, %lo(WepMenu + 0x28)($1)
/* 0FE91C 001FE81C 01000424 */  addiu       $4, $0, 0x1
/* 0FE920 001FE820 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FE924 001FE824 00000000 */   nop
/* 0FE928 001FE828 18030010 */  b           .L001FF48C
/* 0FE92C 001FE82C 00000000 */   nop
jlabel .L001FE830
.L001FE830$b:
/* 0FE930 001FE830 02000224 */  addiu       $2, $0, 0x2
/* 0FE934 001FE834 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FE938 001FE838 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FE93C 001FE83C 01000224 */  addiu       $2, $0, 0x1
/* 0FE940 001FE840 DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FE944 001FE844 E8EB22A0 */  sb          $2, %lo(WepMenu + 0x178)($1)
/* 0FE948 001FE848 16002282 */  lb          $2, 0x16($17)
/* 0FE94C 001FE84C DA01013C */  lui         $1, %hi(WepMenu + 0x7)
/* 0FE950 001FE850 77EA22A0 */  sb          $2, %lo(WepMenu + 0x7)($1)
/* 0FE954 001FE854 DA01013C */  lui         $1, %hi(WepMenu + 0x7)
/* 0FE958 001FE858 77EA2280 */  lb          $2, %lo(WepMenu + 0x7)($1)
/* 0FE95C 001FE85C 04004004 */  bltz        $2, .L001FE870
/* 0FE960 001FE860 00000000 */   nop
/* 0FE964 001FE864 05004128 */  slti        $1, $2, 0x5
/* 0FE968 001FE868 03002014 */  bnez        $1, .L001FE878
/* 0FE96C 001FE86C 00000000 */   nop
.L001FE870:
/* 0FE970 001FE870 DA01013C */  lui         $1, %hi(WepMenu + 0x7)
/* 0FE974 001FE874 77EA20A0 */  sb          $0, %lo(WepMenu + 0x7)($1)
.L001FE878:
/* 0FE978 001FE878 01000424 */  addiu       $4, $0, 0x1
/* 0FE97C 001FE87C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FE980 001FE880 00000000 */   nop
/* 0FE984 001FE884 01030010 */  b           .L001FF48C
/* 0FE988 001FE888 00000000 */   nop
jlabel .L001FE88C
.L001FE88C$b:
/* 0FE98C 001FE88C B1000424 */  addiu       $4, $0, 0xB1
/* 0FE990 001FE890 6095858F */  lw          $5, -0x6AA0($28)
/* 0FE994 001FE894 4CC8080C */  jal         GetNowItemNum__FsP9ITEM_PACK
/* 0FE998 001FE898 00000000 */   nop
/* 0FE99C 001FE89C 0600401C */  bgtz        $2, .L001FE8B8
/* 0FE9A0 001FE8A0 00000000 */   nop
/* 0FE9A4 001FE8A4 02000424 */  addiu       $4, $0, 0x2
/* 0FE9A8 001FE8A8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FE9AC 001FE8AC 00000000 */   nop
/* 0FE9B0 001FE8B0 F6020010 */  b           .L001FF48C
/* 0FE9B4 001FE8B4 00000000 */   nop
.L001FE8B8:
/* 0FE9B8 001FE8B8 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FE9BC 001FE8BC 75EA2680 */  lb          $6, %lo(WepMenu + 0x5)($1)
/* 0FE9C0 001FE8C0 D494848F */  lw          $4, -0x6B2C($28)
/* 0FE9C4 001FE8C4 B1000524 */  addiu       $5, $0, 0xB1
/* 0FE9C8 001FE8C8 04000724 */  addiu       $7, $0, 0x4
/* 0FE9CC 001FE8CC 28462072 */  paddub      $8, $17, $0
/* 0FE9D0 001FE8D0 F830080C */  jal         ItemUseFunc__FP11CUserStatusiiiP11WEAPON_HAVE
/* 0FE9D4 001FE8D4 00000000 */   nop
/* 0FE9D8 001FE8D8 02000424 */  addiu       $4, $0, 0x2
/* 0FE9DC 001FE8DC 26004414 */  bne         $2, $4, .L001FE978
/* 0FE9E0 001FE8E0 00000000 */   nop
/* 0FE9E4 001FE8E4 B1000424 */  addiu       $4, $0, 0xB1
/* 0FE9E8 001FE8E8 6095858F */  lw          $5, -0x6AA0($28)
/* 0FE9EC 001FE8EC 70C8080C */  jal         DeleteItemAfterUseItem__FsP9ITEM_PACK
/* 0FE9F0 001FE8F0 00000000 */   nop
/* 0FE9F4 001FE8F4 18000424 */  addiu       $4, $0, 0x18
/* 0FE9F8 001FE8F8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FE9FC 001FE8FC 00000000 */   nop
/* 0FEA00 001FE900 00002486 */  lh          $4, 0x0($17)
/* 0FEA04 001FE904 70CF070C */  jal         IsDefaultWeapon__Fi
/* 0FEA08 001FE908 00000000 */   nop
/* 0FEA0C 001FE90C 07004004 */  bltz        $2, .L001FE92C
/* 0FEA10 001FE910 00000000 */   nop
/* 0FEA14 001FE914 3C261300 */  dsll32      $4, $19, 24
/* 0FEA18 001FE918 3F260400 */  dsra32      $4, $4, 24
/* 0FEA1C 001FE91C 01000524 */  addiu       $5, $0, 0x1
/* 0FEA20 001FE920 2836A070 */  paddub      $6, $5, $0
/* 0FEA24 001FE924 1C35080C */  jal         SetMenuWeaponModelReference__Fiii
/* 0FEA28 001FE928 00000000 */   nop
.L001FE92C:
/* 0FEA2C 001FE92C 3C1E1300 */  dsll32      $3, $19, 24
/* 0FEA30 001FE930 3F1E0300 */  dsra32      $3, $3, 24
/* 0FEA34 001FE934 B0110224 */  addiu       $2, $0, 0x11B0
/* 0FEA38 001FE938 18186200 */  mult        $3, $3, $2
/* 0FEA3C 001FE93C D901023C */  lui         $2, %hi(DngWeaponFrm)
/* 0FEA40 001FE940 30164224 */  addiu       $2, $2, %lo(DngWeaponFrm)
/* 0FEA44 001FE944 21304300 */  addu        $6, $2, $3
/* 0FEA48 001FE948 DB01023C */  lui         $2, %hi(MenuWepLevelUp)
/* 0FEA4C 001FE94C E0A84424 */  addiu       $4, $2, %lo(MenuWepLevelUp)
/* 0FEA50 001FE950 282E2072 */  paddub      $5, $17, $0
/* 0FEA54 001FE954 1895878F */  lw          $7, -0x6AE8($28)
/* 0FEA58 001FE958 F894888F */  lw          $8, -0x6B08($28)
/* 0FEA5C 001FE95C 40DB080C */  jal         WepRecover__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
/* 0FEA60 001FE960 00000000 */   nop
/* 0FEA64 001FE964 0A000224 */  addiu       $2, $0, 0xA
/* 0FEA68 001FE968 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FEA6C 001FE96C 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FEA70 001FE970 C6020010 */  b           .L001FF48C
/* 0FEA74 001FE974 00000000 */   nop
.L001FE978:
/* 0FEA78 001FE978 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FEA7C 001FE97C 00000000 */   nop
/* 0FEA80 001FE980 C2020010 */  b           .L001FF48C
/* 0FEA84 001FE984 00000000 */   nop
jlabel .L001FE988
.L001FE988$b:
/* 0FEA88 001FE988 00003386 */  lh          $19, 0x0($17)
/* 0FEA8C 001FE98C DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FEA90 001FE990 75EA2480 */  lb          $4, %lo(WepMenu + 0x5)($1)
/* 0FEA94 001FE994 68CF070C */  jal         GetDefaultWeaponNo__Fi
/* 0FEA98 001FE998 00000000 */   nop
/* 0FEA9C 001FE99C 0C006216 */  bne         $19, $2, .L001FE9D0
/* 0FEAA0 001FE9A0 00000000 */   nop
/* 0FEAA4 001FE9A4 0B000224 */  addiu       $2, $0, 0xB
/* 0FEAA8 001FE9A8 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FEAAC 001FE9AC 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FEAB0 001FE9B0 07000224 */  addiu       $2, $0, 0x7
/* 0FEAB4 001FE9B4 DA01013C */  lui         $1, %hi(WepMenu + 0x8)
/* 0FEAB8 001FE9B8 78EA22A0 */  sb          $2, %lo(WepMenu + 0x8)($1)
/* 0FEABC 001FE9BC 02000424 */  addiu       $4, $0, 0x2
/* 0FEAC0 001FE9C0 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FEAC4 001FE9C4 00000000 */   nop
/* 0FEAC8 001FE9C8 B0020010 */  b           .L001FF48C
/* 0FEACC 001FE9CC 00000000 */   nop
.L001FE9D0:
/* 0FEAD0 001FE9D0 0C010224 */  addiu       $2, $0, 0x10C
/* 0FEAD4 001FE9D4 10006216 */  bne         $19, $2, .L001FEA18
/* 0FEAD8 001FE9D8 00000000 */   nop
/* 0FEADC 001FE9DC E02F080C */  jal         GetMenuHebikiriFlag__Fv
/* 0FEAE0 001FE9E0 00000000 */   nop
/* 0FEAE4 001FE9E4 0C004014 */  bnez        $2, .L001FEA18
/* 0FEAE8 001FE9E8 00000000 */   nop
/* 0FEAEC 001FE9EC 0B000224 */  addiu       $2, $0, 0xB
/* 0FEAF0 001FE9F0 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FEAF4 001FE9F4 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FEAF8 001FE9F8 05000224 */  addiu       $2, $0, 0x5
/* 0FEAFC 001FE9FC DA01013C */  lui         $1, %hi(WepMenu + 0x8)
/* 0FEB00 001FEA00 78EA22A0 */  sb          $2, %lo(WepMenu + 0x8)($1)
/* 0FEB04 001FEA04 02000424 */  addiu       $4, $0, 0x2
/* 0FEB08 001FEA08 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FEB0C 001FEA0C 00000000 */   nop
/* 0FEB10 001FEA10 9E020010 */  b           .L001FF48C
/* 0FEB14 001FEA14 00000000 */   nop
.L001FEA18:
/* 0FEB18 001FEA18 02002286 */  lh          $2, 0x2($17)
/* 0FEB1C 001FEA1C 63004228 */  slti        $2, $2, 0x63
/* 0FEB20 001FEA20 0C004014 */  bnez        $2, .L001FEA54
/* 0FEB24 001FEA24 00000000 */   nop
/* 0FEB28 001FEA28 0B000224 */  addiu       $2, $0, 0xB
/* 0FEB2C 001FEA2C DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FEB30 001FEA30 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FEB34 001FEA34 08000224 */  addiu       $2, $0, 0x8
/* 0FEB38 001FEA38 DA01013C */  lui         $1, %hi(WepMenu + 0x8)
/* 0FEB3C 001FEA3C 78EA22A0 */  sb          $2, %lo(WepMenu + 0x8)($1)
/* 0FEB40 001FEA40 02000424 */  addiu       $4, $0, 0x2
/* 0FEB44 001FEA44 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FEB48 001FEA48 00000000 */   nop
/* 0FEB4C 001FEA4C 8F020010 */  b           .L001FF48C
/* 0FEB50 001FEA50 00000000 */   nop
.L001FEA54:
/* 0FEB54 001FEA54 03000224 */  addiu       $2, $0, 0x3
/* 0FEB58 001FEA58 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FEB5C 001FEA5C 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FEB60 001FEA60 01000424 */  addiu       $4, $0, 0x1
/* 0FEB64 001FEA64 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FEB68 001FEA68 90EA24AC */  sw          $4, %lo(WepMenu + 0x20)($1)
/* 0FEB6C 001FEA6C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FEB70 001FEA70 00000000 */   nop
/* 0FEB74 001FEA74 85020010 */  b           .L001FF48C
/* 0FEB78 001FEA78 00000000 */   nop
jlabel .L001FEA7C
.L001FEA7C$b:
/* 0FEB7C 001FEA7C D494828F */  lw          $2, -0x6B2C($28)
/* 0FEB80 001FEA80 04054524 */  addiu       $5, $2, 0x504
/* 0FEB84 001FEA84 F87FA524 */  addiu       $5, $5, 0x7FF8
/* 0FEB88 001FEA88 281E0070 */  paddub      $3, $0, $0
/* 0FEB8C 001FEA8C 28260070 */  paddub      $4, $0, $0
/* 0FEB90 001FEA90 09000010 */  b           .L001FEAB8
/* 0FEB94 001FEA94 00000000 */   nop
.L001FEA98:
/* 0FEB98 001FEA98 40110400 */  sll         $2, $4, 5
/* 0FEB9C 001FEA9C 2110A200 */  addu        $2, $5, $2
/* 0FEBA0 001FEAA0 00004284 */  lh          $2, 0x0($2)
/* 0FEBA4 001FEAA4 51004228 */  slti        $2, $2, 0x51
/* 0FEBA8 001FEAA8 02004014 */  bnez        $2, .L001FEAB4
/* 0FEBAC 001FEAAC 00000000 */   nop
/* 0FEBB0 001FEAB0 01006324 */  addiu       $3, $3, 0x1
.L001FEAB4:
/* 0FEBB4 001FEAB4 01008424 */  addiu       $4, $4, 0x1
.L001FEAB8:
/* 0FEBB8 001FEAB8 28008228 */  slti        $2, $4, 0x28
/* 0FEBBC 001FEABC F6FF4014 */  bnez        $2, .L001FEA98
/* 0FEBC0 001FEAC0 00000000 */   nop
/* 0FEBC4 001FEAC4 28006228 */  slti        $2, $3, 0x28
/* 0FEBC8 001FEAC8 0C004014 */  bnez        $2, .L001FEAFC
/* 0FEBCC 001FEACC 00000000 */   nop
/* 0FEBD0 001FEAD0 0B000224 */  addiu       $2, $0, 0xB
/* 0FEBD4 001FEAD4 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FEBD8 001FEAD8 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FEBDC 001FEADC 01000224 */  addiu       $2, $0, 0x1
/* 0FEBE0 001FEAE0 DA01013C */  lui         $1, %hi(WepMenu + 0x8)
/* 0FEBE4 001FEAE4 78EA22A0 */  sb          $2, %lo(WepMenu + 0x8)($1)
/* 0FEBE8 001FEAE8 02000424 */  addiu       $4, $0, 0x2
/* 0FEBEC 001FEAEC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FEBF0 001FEAF0 00000000 */   nop
/* 0FEBF4 001FEAF4 65020010 */  b           .L001FF48C
/* 0FEBF8 001FEAF8 00000000 */   nop
.L001FEAFC:
/* 0FEBFC 001FEAFC 04000224 */  addiu       $2, $0, 0x4
/* 0FEC00 001FEB00 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FEC04 001FEB04 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FEC08 001FEB08 01000424 */  addiu       $4, $0, 0x1
/* 0FEC0C 001FEB0C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FEC10 001FEB10 90EA24AC */  sw          $4, %lo(WepMenu + 0x20)($1)
/* 0FEC14 001FEB14 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FEC18 001FEB18 00000000 */   nop
/* 0FEC1C 001FEB1C 5B020010 */  b           .L001FF48C
/* 0FEC20 001FEB20 00000000 */   nop
jlabel .L001FEB24
.L001FEB24$b:
/* 0FEC24 001FEB24 05000224 */  addiu       $2, $0, 0x5
/* 0FEC28 001FEB28 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FEC2C 001FEB2C 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FEC30 001FEB30 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FEC34 001FEB34 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
/* 0FEC38 001FEB38 01000424 */  addiu       $4, $0, 0x1
/* 0FEC3C 001FEB3C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FEC40 001FEB40 00000000 */   nop
/* 0FEC44 001FEB44 51020010 */  b           .L001FF48C
/* 0FEC48 001FEB48 00000000 */   nop
.L001FEB4C:
/* 0FEC4C 001FEB4C CC01023C */  lui         $2, %hi(GamePad)
/* 0FEC50 001FEB50 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FEC54 001FEB54 20000524 */  addiu       $5, $0, 0x20
/* 0FEC58 001FEB58 1CAE040C */  jal         Down__8CGamePadFi
/* 0FEC5C 001FEB5C 00000000 */   nop
/* 0FEC60 001FEB60 4A024010 */  beqz        $2, .L001FF48C
/* 0FEC64 001FEB64 00000000 */   nop
/* 0FEC68 001FEB68 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FEC6C 001FEB6C 72EA20A4 */  sh          $0, %lo(WepMenu + 0x2)($1)
/* 0FEC70 001FEB70 02000424 */  addiu       $4, $0, 0x2
/* 0FEC74 001FEB74 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FEC78 001FEB78 00000000 */   nop
/* 0FEC7C 001FEB7C 43020010 */  b           .L001FF48C
/* 0FEC80 001FEB80 00000000 */   nop
jlabel .L001FEB84
.L001FEB84$b:
/* 0FEC84 001FEB84 01000224 */  addiu       $2, $0, 0x1
/* 0FEC88 001FEB88 DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FEC8C 001FEB8C E8EB22A0 */  sb          $2, %lo(WepMenu + 0x178)($1)
/* 0FEC90 001FEB90 CC01023C */  lui         $2, %hi(GamePad)
/* 0FEC94 001FEB94 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FEC98 001FEB98 0F000524 */  addiu       $5, $0, 0xF
/* 0FEC9C 001FEB9C 1CAE040C */  jal         Down__8CGamePadFi
/* 0FECA0 001FEBA0 00000000 */   nop
/* 0FECA4 001FEBA4 04004010 */  beqz        $2, .L001FEBB8
/* 0FECA8 001FEBA8 00000000 */   nop
/* 0FECAC 001FEBAC 02000424 */  addiu       $4, $0, 0x2
/* 0FECB0 001FEBB0 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FECB4 001FEBB4 00000000 */   nop
.L001FEBB8:
/* 0FECB8 001FEBB8 CC01023C */  lui         $2, %hi(GamePad)
/* 0FECBC 001FEBBC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FECC0 001FEBC0 00100524 */  addiu       $5, $0, 0x1000
/* 0FECC4 001FEBC4 1CAE040C */  jal         Down__8CGamePadFi
/* 0FECC8 001FEBC8 00000000 */   nop
/* 0FECCC 001FEBCC 09004010 */  beqz        $2, .L001FEBF4
/* 0FECD0 001FEBD0 00000000 */   nop
/* 0FECD4 001FEBD4 DA01013C */  lui         $1, %hi(WepMenu + 0x7)
/* 0FECD8 001FEBD8 77EA2280 */  lb          $2, %lo(WepMenu + 0x7)($1)
/* 0FECDC 001FEBDC 2A080200 */  slt         $1, $0, $2
/* 0FECE0 001FEBE0 04002010 */  beqz        $1, .L001FEBF4
/* 0FECE4 001FEBE4 00000000 */   nop
/* 0FECE8 001FEBE8 FFFF4224 */  addiu       $2, $2, -0x1
/* 0FECEC 001FEBEC DA01013C */  lui         $1, %hi(WepMenu + 0x7)
/* 0FECF0 001FEBF0 77EA22A0 */  sb          $2, %lo(WepMenu + 0x7)($1)
.L001FEBF4:
/* 0FECF4 001FEBF4 CC01023C */  lui         $2, %hi(GamePad)
/* 0FECF8 001FEBF8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FECFC 001FEBFC 00400524 */  addiu       $5, $0, 0x4000
/* 0FED00 001FEC00 1CAE040C */  jal         Down__8CGamePadFi
/* 0FED04 001FEC04 00000000 */   nop
/* 0FED08 001FEC08 09004010 */  beqz        $2, .L001FEC30
/* 0FED0C 001FEC0C 00000000 */   nop
/* 0FED10 001FEC10 DA01013C */  lui         $1, %hi(WepMenu + 0x7)
/* 0FED14 001FEC14 77EA2280 */  lb          $2, %lo(WepMenu + 0x7)($1)
/* 0FED18 001FEC18 04004128 */  slti        $1, $2, 0x4
/* 0FED1C 001FEC1C 04002010 */  beqz        $1, .L001FEC30
/* 0FED20 001FEC20 00000000 */   nop
/* 0FED24 001FEC24 01004224 */  addiu       $2, $2, 0x1
/* 0FED28 001FEC28 DA01013C */  lui         $1, %hi(WepMenu + 0x7)
/* 0FED2C 001FEC2C 77EA22A0 */  sb          $2, %lo(WepMenu + 0x7)($1)
.L001FEC30:
/* 0FED30 001FEC30 CC01023C */  lui         $2, %hi(GamePad)
/* 0FED34 001FEC34 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FED38 001FEC38 40000524 */  addiu       $5, $0, 0x40
/* 0FED3C 001FEC3C 1CAE040C */  jal         Down__8CGamePadFi
/* 0FED40 001FEC40 00000000 */   nop
/* 0FED44 001FEC44 1B004010 */  beqz        $2, .L001FECB4
/* 0FED48 001FEC48 00000000 */   nop
/* 0FED4C 001FEC4C C0CF070C */  jal         GetNowSelectWeapon__Fv
/* 0FED50 001FEC50 00000000 */   nop
/* 0FED54 001FEC54 288E4070 */  paddub      $17, $2, $0
/* 0FED58 001FEC58 28262072 */  paddub      $4, $17, $0
/* 0FED5C 001FEC5C 6000A527 */  addiu       $5, $29, 0x60
/* 0FED60 001FEC60 28360070 */  paddub      $6, $0, $0
/* 0FED64 001FEC64 D896080C */  jal         WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi
/* 0FED68 001FEC68 00000000 */   nop
/* 0FED6C 001FEC6C DA01013C */  lui         $1, %hi(WepMenu + 0x7)
/* 0FED70 001FEC70 77EA2680 */  lb          $6, %lo(WepMenu + 0x7)($1)
/* 0FED74 001FEC74 28262072 */  paddub      $4, $17, $0
/* 0FED78 001FEC78 6000A527 */  addiu       $5, $29, 0x60
/* 0FED7C 001FEC7C 44F0070C */  jal         WeaponMenuCheckEnableSetElem__FP11WEAPON_HAVEP11WEAPON_HAVEi
/* 0FED80 001FEC80 00000000 */   nop
/* 0FED84 001FEC84 06004010 */  beqz        $2, .L001FECA0
/* 0FED88 001FEC88 00000000 */   nop
/* 0FED8C 001FEC8C 02000424 */  addiu       $4, $0, 0x2
/* 0FED90 001FEC90 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FED94 001FEC94 00000000 */   nop
/* 0FED98 001FEC98 FC010010 */  b           .L001FF48C
/* 0FED9C 001FEC9C 00000000 */   nop
.L001FECA0:
/* 0FEDA0 001FECA0 01000424 */  addiu       $4, $0, 0x1
/* 0FEDA4 001FECA4 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FEDA8 001FECA8 00000000 */   nop
/* 0FEDAC 001FECAC F7010010 */  b           .L001FF48C
/* 0FEDB0 001FECB0 00000000 */   nop
.L001FECB4:
/* 0FEDB4 001FECB4 CC01023C */  lui         $2, %hi(GamePad)
/* 0FEDB8 001FECB8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FEDBC 001FECBC 20000524 */  addiu       $5, $0, 0x20
/* 0FEDC0 001FECC0 1CAE040C */  jal         Down__8CGamePadFi
/* 0FEDC4 001FECC4 00000000 */   nop
/* 0FEDC8 001FECC8 F0014010 */  beqz        $2, .L001FF48C
/* 0FEDCC 001FECCC 00000000 */   nop
/* 0FEDD0 001FECD0 01000224 */  addiu       $2, $0, 0x1
/* 0FEDD4 001FECD4 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FEDD8 001FECD8 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FEDDC 001FECDC D894828F */  lw          $2, -0x6B28($28)
/* 0FEDE0 001FECE0 0E004014 */  bnez        $2, .L001FED1C
/* 0FEDE4 001FECE4 00000000 */   nop
/* 0FEDE8 001FECE8 D494828F */  lw          $2, -0x6B2C($28)
/* 0FEDEC 001FECEC 04004280 */  lb          $2, 0x4($2)
/* 0FEDF0 001FECF0 03000324 */  addiu       $3, $0, 0x3
/* 0FEDF4 001FECF4 09004314 */  bne         $2, $3, .L001FED1C
/* 0FEDF8 001FECF8 00000000 */   nop
/* 0FEDFC 001FECFC DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FEE00 001FED00 75EA2280 */  lb          $2, %lo(WepMenu + 0x5)($1)
/* 0FEE04 001FED04 05004314 */  bne         $2, $3, .L001FED1C
/* 0FEE08 001FED08 00000000 */   nop
/* 0FEE0C 001FED0C 30FB040C */  jal         StartReadBG__Fv
/* 0FEE10 001FED10 00000000 */   nop
/* 0FEE14 001FED14 2C34080C */  jal         DngWepEffectReadStart__Fv
/* 0FEE18 001FED18 00000000 */   nop
.L001FED1C:
/* 0FEE1C 001FED1C 02000424 */  addiu       $4, $0, 0x2
/* 0FEE20 001FED20 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FEE24 001FED24 00000000 */   nop
/* 0FEE28 001FED28 D8010010 */  b           .L001FF48C
/* 0FEE2C 001FED2C 00000000 */   nop
jlabel .L001FED30
.L001FED30$b:
/* 0FEE30 001FED30 CC01023C */  lui         $2, %hi(GamePad)
/* 0FEE34 001FED34 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FEE38 001FED38 00500524 */  addiu       $5, $0, 0x5000
/* 0FEE3C 001FED3C 1CAE040C */  jal         Down__8CGamePadFi
/* 0FEE40 001FED40 00000000 */   nop
/* 0FEE44 001FED44 0C004010 */  beqz        $2, .L001FED78
/* 0FEE48 001FED48 00000000 */   nop
/* 0FEE4C 001FED4C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FEE50 001FED50 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FEE54 001FED54 05004010 */  beqz        $2, .L001FED6C
/* 0FEE58 001FED58 00000000 */   nop
/* 0FEE5C 001FED5C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FEE60 001FED60 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
/* 0FEE64 001FED64 04000010 */  b           .L001FED78
/* 0FEE68 001FED68 00000000 */   nop
.L001FED6C:
/* 0FEE6C 001FED6C 01000224 */  addiu       $2, $0, 0x1
/* 0FEE70 001FED70 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FEE74 001FED74 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
.L001FED78:
/* 0FEE78 001FED78 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FEE7C 001FED7C 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FEE80 001FED80 34004014 */  bnez        $2, .L001FEE54
/* 0FEE84 001FED84 00000000 */   nop
/* 0FEE88 001FED88 CC01023C */  lui         $2, %hi(GamePad)
/* 0FEE8C 001FED8C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FEE90 001FED90 40000524 */  addiu       $5, $0, 0x40
/* 0FEE94 001FED94 1CAE040C */  jal         Down__8CGamePadFi
/* 0FEE98 001FED98 00000000 */   nop
/* 0FEE9C 001FED9C 2D004010 */  beqz        $2, .L001FEE54
/* 0FEEA0 001FEDA0 00000000 */   nop
/* 0FEEA4 001FEDA4 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FEEA8 001FEDA8 74EA3380 */  lb          $19, %lo(WepMenu + 0x4)($1)
/* 0FEEAC 001FEDAC 40111300 */  sll         $2, $19, 5
/* 0FEEB0 001FEDB0 23105300 */  subu        $2, $2, $19
/* 0FEEB4 001FEDB4 C0880200 */  sll         $17, $2, 3
/* 0FEEB8 001FEDB8 1495828F */  lw          $2, -0x6AEC($28)
/* 0FEEBC 001FEDBC 21205100 */  addu        $4, $2, $17
/* 0FEEC0 001FEDC0 20C8080C */  jal         GetWeaponMaxExp__FP11WEAPON_HAVE
/* 0FEEC4 001FEDC4 00000000 */   nop
/* 0FEEC8 001FEDC8 1495838F */  lw          $3, -0x6AEC($28)
/* 0FEECC 001FEDCC 21182302 */  addu        $3, $17, $3
/* 0FEED0 001FEDD0 14006384 */  lh          $3, 0x14($3)
/* 0FEED4 001FEDD4 2A106200 */  slt         $2, $3, $2
/* 0FEED8 001FEDD8 05004010 */  beqz        $2, .L001FEDF0
/* 0FEEDC 001FEDDC 00000000 */   nop
/* 0FEEE0 001FEDE0 B2000424 */  addiu       $4, $0, 0xB2
/* 0FEEE4 001FEDE4 6095858F */  lw          $5, -0x6AA0($28)
/* 0FEEE8 001FEDE8 70C8080C */  jal         DeleteItemAfterUseItem__FsP9ITEM_PACK
/* 0FEEEC 001FEDEC 00000000 */   nop
.L001FEDF0:
/* 0FEEF0 001FEDF0 1495828F */  lw          $2, -0x6AEC($28)
/* 0FEEF4 001FEDF4 21285100 */  addu        $5, $2, $17
/* 0FEEF8 001FEDF8 B0110224 */  addiu       $2, $0, 0x11B0
/* 0FEEFC 001FEDFC 18186202 */  mult        $3, $19, $2
/* 0FEF00 001FEE00 D901023C */  lui         $2, %hi(DngWeaponFrm)
/* 0FEF04 001FEE04 30164224 */  addiu       $2, $2, %lo(DngWeaponFrm)
/* 0FEF08 001FEE08 21304300 */  addu        $6, $2, $3
/* 0FEF0C 001FEE0C DB01023C */  lui         $2, %hi(MenuWepLevelUp)
/* 0FEF10 001FEE10 E0A84424 */  addiu       $4, $2, %lo(MenuWepLevelUp)
/* 0FEF14 001FEE14 1895878F */  lw          $7, -0x6AE8($28)
/* 0FEF18 001FEE18 F894888F */  lw          $8, -0x6B08($28)
/* 0FEF1C 001FEE1C A0D8080C */  jal         SetLevelUpValue__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
/* 0FEF20 001FEE20 00000000 */   nop
/* 0FEF24 001FEE24 07000224 */  addiu       $2, $0, 0x7
/* 0FEF28 001FEE28 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FEF2C 001FEE2C 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FEF30 001FEE30 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FEF34 001FEE34 72EA20A4 */  sh          $0, %lo(WepMenu + 0x2)($1)
/* 0FEF38 001FEE38 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FEF3C 001FEE3C 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
/* 0FEF40 001FEE40 01000424 */  addiu       $4, $0, 0x1
/* 0FEF44 001FEE44 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FEF48 001FEE48 00000000 */   nop
/* 0FEF4C 001FEE4C 8F010010 */  b           .L001FF48C
/* 0FEF50 001FEE50 00000000 */   nop
.L001FEE54:
/* 0FEF54 001FEE54 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FEF58 001FEE58 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FEF5C 001FEE5C 01000224 */  addiu       $2, $0, 0x1
/* 0FEF60 001FEE60 08006214 */  bne         $3, $2, .L001FEE84
/* 0FEF64 001FEE64 00000000 */   nop
/* 0FEF68 001FEE68 CC01023C */  lui         $2, %hi(GamePad)
/* 0FEF6C 001FEE6C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FEF70 001FEE70 40000524 */  addiu       $5, $0, 0x40
/* 0FEF74 001FEE74 1CAE040C */  jal         Down__8CGamePadFi
/* 0FEF78 001FEE78 00000000 */   nop
/* 0FEF7C 001FEE7C 08004014 */  bnez        $2, .L001FEEA0
/* 0FEF80 001FEE80 00000000 */   nop
.L001FEE84:
/* 0FEF84 001FEE84 CC01023C */  lui         $2, %hi(GamePad)
/* 0FEF88 001FEE88 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FEF8C 001FEE8C 20000524 */  addiu       $5, $0, 0x20
/* 0FEF90 001FEE90 1CAE040C */  jal         Down__8CGamePadFi
/* 0FEF94 001FEE94 00000000 */   nop
/* 0FEF98 001FEE98 7C014010 */  beqz        $2, .L001FF48C
/* 0FEF9C 001FEE9C 00000000 */   nop
.L001FEEA0:
/* 0FEFA0 001FEEA0 01000224 */  addiu       $2, $0, 0x1
/* 0FEFA4 001FEEA4 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FEFA8 001FEEA8 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FEFAC 001FEEAC 04000224 */  addiu       $2, $0, 0x4
/* 0FEFB0 001FEEB0 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FEFB4 001FEEB4 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
/* 0FEFB8 001FEEB8 02000424 */  addiu       $4, $0, 0x2
/* 0FEFBC 001FEEBC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FEFC0 001FEEC0 00000000 */   nop
/* 0FEFC4 001FEEC4 71010010 */  b           .L001FF48C
/* 0FEFC8 001FEEC8 00000000 */   nop
jlabel .L001FEECC
.L001FEECC$b:
/* 0FEFCC 001FEECC CC01023C */  lui         $2, %hi(GamePad)
/* 0FEFD0 001FEED0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FEFD4 001FEED4 00500524 */  addiu       $5, $0, 0x5000
/* 0FEFD8 001FEED8 1CAE040C */  jal         Down__8CGamePadFi
/* 0FEFDC 001FEEDC 00000000 */   nop
/* 0FEFE0 001FEEE0 0C004010 */  beqz        $2, .L001FEF14
/* 0FEFE4 001FEEE4 00000000 */   nop
/* 0FEFE8 001FEEE8 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FEFEC 001FEEEC 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FEFF0 001FEEF0 05004010 */  beqz        $2, .L001FEF08
/* 0FEFF4 001FEEF4 00000000 */   nop
/* 0FEFF8 001FEEF8 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FEFFC 001FEEFC 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
/* 0FF000 001FEF00 04000010 */  b           .L001FEF14
/* 0FF004 001FEF04 00000000 */   nop
.L001FEF08:
/* 0FF008 001FEF08 01000224 */  addiu       $2, $0, 0x1
/* 0FF00C 001FEF0C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF010 001FEF10 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
.L001FEF14:
/* 0FF014 001FEF14 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF018 001FEF18 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FF01C 001FEF1C 01000224 */  addiu       $2, $0, 0x1
/* 0FF020 001FEF20 08006214 */  bne         $3, $2, .L001FEF44
/* 0FF024 001FEF24 00000000 */   nop
/* 0FF028 001FEF28 CC01023C */  lui         $2, %hi(GamePad)
/* 0FF02C 001FEF2C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF030 001FEF30 40000524 */  addiu       $5, $0, 0x40
/* 0FF034 001FEF34 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF038 001FEF38 00000000 */   nop
/* 0FF03C 001FEF3C 08004014 */  bnez        $2, .L001FEF60
/* 0FF040 001FEF40 00000000 */   nop
.L001FEF44:
/* 0FF044 001FEF44 CC01023C */  lui         $2, %hi(GamePad)
/* 0FF048 001FEF48 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF04C 001FEF4C 20000524 */  addiu       $5, $0, 0x20
/* 0FF050 001FEF50 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF054 001FEF54 00000000 */   nop
/* 0FF058 001FEF58 0C004010 */  beqz        $2, .L001FEF8C
/* 0FF05C 001FEF5C 00000000 */   nop
.L001FEF60:
/* 0FF060 001FEF60 01000224 */  addiu       $2, $0, 0x1
/* 0FF064 001FEF64 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FF068 001FEF68 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FF06C 001FEF6C 05000224 */  addiu       $2, $0, 0x5
/* 0FF070 001FEF70 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF074 001FEF74 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
/* 0FF078 001FEF78 02000424 */  addiu       $4, $0, 0x2
/* 0FF07C 001FEF7C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FF080 001FEF80 00000000 */   nop
/* 0FF084 001FEF84 41010010 */  b           .L001FF48C
/* 0FF088 001FEF88 00000000 */   nop
.L001FEF8C:
/* 0FF08C 001FEF8C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF090 001FEF90 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FF094 001FEF94 3D014014 */  bnez        $2, .L001FF48C
/* 0FF098 001FEF98 00000000 */   nop
/* 0FF09C 001FEF9C CC01023C */  lui         $2, %hi(GamePad)
/* 0FF0A0 001FEFA0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF0A4 001FEFA4 40000524 */  addiu       $5, $0, 0x40
/* 0FF0A8 001FEFA8 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF0AC 001FEFAC 00000000 */   nop
/* 0FF0B0 001FEFB0 36014010 */  beqz        $2, .L001FF48C
/* 0FF0B4 001FEFB4 00000000 */   nop
/* 0FF0B8 001FEFB8 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FF0BC 001FEFBC 74EA2480 */  lb          $4, %lo(WepMenu + 0x4)($1)
/* 0FF0C0 001FEFC0 D901013C */  lui         $1, %hi(MenuExCashBuffer + 0x8)
/* 0FF0C4 001FEFC4 1804228C */  lw          $2, %lo(MenuExCashBuffer + 0x8)($1)
/* 0FF0C8 001FEFC8 00190200 */  sll         $3, $2, 4
/* 0FF0CC 001FEFCC D901013C */  lui         $1, %hi(MenuExCashBuffer)
/* 0FF0D0 001FEFD0 1004228C */  lw          $2, %lo(MenuExCashBuffer)($1)
/* 0FF0D4 001FEFD4 21384300 */  addu        $7, $2, $3
/* 0FF0D8 001FEFD8 40110400 */  sll         $2, $4, 5
/* 0FF0DC 001FEFDC 23104400 */  subu        $2, $2, $4
/* 0FF0E0 001FEFE0 C0180200 */  sll         $3, $2, 3
/* 0FF0E4 001FEFE4 1495828F */  lw          $2, -0x6AEC($28)
/* 0FF0E8 001FEFE8 21284300 */  addu        $5, $2, $3
/* 0FF0EC 001FEFEC B0110224 */  addiu       $2, $0, 0x11B0
/* 0FF0F0 001FEFF0 18188200 */  mult        $3, $4, $2
/* 0FF0F4 001FEFF4 D901023C */  lui         $2, %hi(DngWeaponFrm)
/* 0FF0F8 001FEFF8 30164224 */  addiu       $2, $2, %lo(DngWeaponFrm)
/* 0FF0FC 001FEFFC 21304300 */  addu        $6, $2, $3
/* 0FF100 001FF000 DB01023C */  lui         $2, %hi(MenuWepLevelUp)
/* 0FF104 001FF004 E0A84424 */  addiu       $4, $2, %lo(MenuWepLevelUp)
/* 0FF108 001FF008 F894888F */  lw          $8, -0x6B08($28)
/* 0FF10C 001FF00C 34DA080C */  jal         SetStatusBreak__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
/* 0FF110 001FF010 00000000 */   nop
/* 0FF114 001FF014 08000224 */  addiu       $2, $0, 0x8
/* 0FF118 001FF018 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FF11C 001FF01C 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FF120 001FF020 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FF124 001FF024 72EA20A4 */  sh          $0, %lo(WepMenu + 0x2)($1)
/* 0FF128 001FF028 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF12C 001FF02C 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
/* 0FF130 001FF030 01000424 */  addiu       $4, $0, 0x1
/* 0FF134 001FF034 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FF138 001FF038 00000000 */   nop
/* 0FF13C 001FF03C 13010010 */  b           .L001FF48C
/* 0FF140 001FF040 00000000 */   nop
jlabel .L001FF044
.L001FF044$b:
/* 0FF144 001FF044 C0CF070C */  jal         GetNowSelectWeapon__Fv
/* 0FF148 001FF048 00000000 */   nop
/* 0FF14C 001FF04C 288E4070 */  paddub      $17, $2, $0
/* 0FF150 001FF050 6001A427 */  addiu       $4, $29, 0x160
/* 0FF154 001FF054 282E2072 */  paddub      $5, $17, $0
/* 0FF158 001FF058 20D5080C */  jal         EnableBuildUpModel__FP16WEP_BUILDUP_INFOP11WEAPON_HAVE
/* 0FF15C 001FF05C 00000000 */   nop
/* 0FF160 001FF060 28262072 */  paddub      $4, $17, $0
/* 0FF164 001FF064 7C01A527 */  addiu       $5, $29, 0x17C
/* 0FF168 001FF068 9C33080C */  jal         WeaponStatusBuildUp__FP11WEAPON_HAVERi
/* 0FF16C 001FF06C 00000000 */   nop
/* 0FF170 001FF070 289E4070 */  paddub      $19, $2, $0
/* 0FF174 001FF074 CC01023C */  lui         $2, %hi(GamePad)
/* 0FF178 001FF078 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF17C 001FF07C 00100524 */  addiu       $5, $0, 0x1000
/* 0FF180 001FF080 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF184 001FF084 00000000 */   nop
/* 0FF188 001FF088 06004010 */  beqz        $2, .L001FF0A4
/* 0FF18C 001FF08C 00000000 */   nop
/* 0FF190 001FF090 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF194 001FF094 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FF198 001FF098 FFFF4224 */  addiu       $2, $2, -0x1
/* 0FF19C 001FF09C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF1A0 001FF0A0 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
.L001FF0A4:
/* 0FF1A4 001FF0A4 CC01023C */  lui         $2, %hi(GamePad)
/* 0FF1A8 001FF0A8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF1AC 001FF0AC 00400524 */  addiu       $5, $0, 0x4000
/* 0FF1B0 001FF0B0 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF1B4 001FF0B4 00000000 */   nop
/* 0FF1B8 001FF0B8 06004010 */  beqz        $2, .L001FF0D4
/* 0FF1BC 001FF0BC 00000000 */   nop
/* 0FF1C0 001FF0C0 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF1C4 001FF0C4 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FF1C8 001FF0C8 01004224 */  addiu       $2, $2, 0x1
/* 0FF1CC 001FF0CC DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF1D0 001FF0D0 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
.L001FF0D4:
/* 0FF1D4 001FF0D4 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF1D8 001FF0D8 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FF1DC 001FF0DC 04004104 */  bgez        $2, .L001FF0F0
/* 0FF1E0 001FF0E0 00000000 */   nop
/* 0FF1E4 001FF0E4 FFFF6226 */  addiu       $2, $19, -0x1
/* 0FF1E8 001FF0E8 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF1EC 001FF0EC 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
.L001FF0F0:
/* 0FF1F0 001FF0F0 FFFF6326 */  addiu       $3, $19, -0x1
/* 0FF1F4 001FF0F4 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF1F8 001FF0F8 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FF1FC 001FF0FC 2A086200 */  slt         $1, $3, $2
/* 0FF200 001FF100 03002010 */  beqz        $1, .L001FF110
/* 0FF204 001FF104 00000000 */   nop
/* 0FF208 001FF108 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF20C 001FF10C 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
.L001FF110:
/* 0FF210 001FF110 CC01023C */  lui         $2, %hi(GamePad)
/* 0FF214 001FF114 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF218 001FF118 20000524 */  addiu       $5, $0, 0x20
/* 0FF21C 001FF11C 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF220 001FF120 00000000 */   nop
/* 0FF224 001FF124 09004010 */  beqz        $2, .L001FF14C
/* 0FF228 001FF128 00000000 */   nop
/* 0FF22C 001FF12C 06000224 */  addiu       $2, $0, 0x6
/* 0FF230 001FF130 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF234 001FF134 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
/* 0FF238 001FF138 01000224 */  addiu       $2, $0, 0x1
/* 0FF23C 001FF13C DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FF240 001FF140 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FF244 001FF144 D1000010 */  b           .L001FF48C
/* 0FF248 001FF148 00000000 */   nop
.L001FF14C:
/* 0FF24C 001FF14C CC01023C */  lui         $2, %hi(GamePad)
/* 0FF250 001FF150 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF254 001FF154 40000524 */  addiu       $5, $0, 0x40
/* 0FF258 001FF158 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF25C 001FF15C 00000000 */   nop
/* 0FF260 001FF160 CA004010 */  beqz        $2, .L001FF48C
/* 0FF264 001FF164 00000000 */   nop
/* 0FF268 001FF168 289E0070 */  paddub      $19, $0, $0
/* 0FF26C 001FF16C 28A60070 */  paddub      $20, $0, $0
/* 0FF270 001FF170 09000010 */  b           .L001FF198
/* 0FF274 001FF174 00000000 */   nop
.L001FF178:
/* 0FF278 001FF178 40111400 */  sll         $2, $20, 5
/* 0FF27C 001FF17C 21105100 */  addu        $2, $2, $17
/* 0FF280 001FF180 28004284 */  lh          $2, 0x28($2)
/* 0FF284 001FF184 51004228 */  slti        $2, $2, 0x51
/* 0FF288 001FF188 02004014 */  bnez        $2, .L001FF194
/* 0FF28C 001FF18C 00000000 */   nop
/* 0FF290 001FF190 01007326 */  addiu       $19, $19, 0x1
.L001FF194:
/* 0FF294 001FF194 01009426 */  addiu       $20, $20, 0x1
.L001FF198:
/* 0FF298 001FF198 00002486 */  lh          $4, 0x0($17)
/* 0FF29C 001FF19C C4C7080C */  jal         GetWeaponHoleNum__Fi
/* 0FF2A0 001FF1A0 00000000 */   nop
/* 0FF2A4 001FF1A4 2A108202 */  slt         $2, $20, $2
/* 0FF2A8 001FF1A8 F3FF4014 */  bnez        $2, .L001FF178
/* 0FF2AC 001FF1AC 00000000 */   nop
/* 0FF2B0 001FF1B0 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF2B4 001FF1B4 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FF2B8 001FF1B8 80100200 */  sll         $2, $2, 2
/* 0FF2BC 001FF1BC 21185D00 */  addu        $3, $2, $29
/* 0FF2C0 001FF1C0 60016284 */  lh          $2, 0x160($3)
/* 0FF2C4 001FF1C4 62016484 */  lh          $4, 0x162($3)
/* 0FF2C8 001FF1C8 01000324 */  addiu       $3, $0, 0x1
/* 0FF2CC 001FF1CC 0C008314 */  bne         $4, $3, .L001FF200
/* 0FF2D0 001FF1D0 00000000 */   nop
/* 0FF2D4 001FF1D4 0A006016 */  bnez        $19, .L001FF200
/* 0FF2D8 001FF1D8 00000000 */   nop
/* 0FF2DC 001FF1DC DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x12DE)
/* 0FF2E0 001FF1E0 BEBB22A4 */  sh          $2, %lo(MenuWepLevelUp + 0x12DE)($1)
/* 0FF2E4 001FF1E4 06000224 */  addiu       $2, $0, 0x6
/* 0FF2E8 001FF1E8 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FF2EC 001FF1EC 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FF2F0 001FF1F0 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF2F4 001FF1F4 90EA23AC */  sw          $3, %lo(WepMenu + 0x20)($1)
/* 0FF2F8 001FF1F8 A4000010 */  b           .L001FF48C
/* 0FF2FC 001FF1FC 00000000 */   nop
.L001FF200:
/* 0FF300 001FF200 08008014 */  bnez        $4, .L001FF224
/* 0FF304 001FF204 00000000 */   nop
/* 0FF308 001FF208 07000224 */  addiu       $2, $0, 0x7
/* 0FF30C 001FF20C DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FF310 001FF210 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FF314 001FF214 DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FF318 001FF218 E8EB20A0 */  sb          $0, %lo(WepMenu + 0x178)($1)
/* 0FF31C 001FF21C 9B000010 */  b           .L001FF48C
/* 0FF320 001FF220 00000000 */   nop
.L001FF224:
/* 0FF324 001FF224 0B000224 */  addiu       $2, $0, 0xB
/* 0FF328 001FF228 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FF32C 001FF22C 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FF330 001FF230 06000224 */  addiu       $2, $0, 0x6
/* 0FF334 001FF234 DA01013C */  lui         $1, %hi(WepMenu + 0x8)
/* 0FF338 001FF238 78EA22A0 */  sb          $2, %lo(WepMenu + 0x8)($1)
/* 0FF33C 001FF23C 93000010 */  b           .L001FF48C
/* 0FF340 001FF240 00000000 */   nop
jlabel .L001FF244
.L001FF244$b:
/* 0FF344 001FF244 CC01023C */  lui         $2, %hi(GamePad)
/* 0FF348 001FF248 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF34C 001FF24C 00500524 */  addiu       $5, $0, 0x5000
/* 0FF350 001FF250 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF354 001FF254 00000000 */   nop
/* 0FF358 001FF258 0C004010 */  beqz        $2, .L001FF28C
/* 0FF35C 001FF25C 00000000 */   nop
/* 0FF360 001FF260 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF364 001FF264 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FF368 001FF268 05004010 */  beqz        $2, .L001FF280
/* 0FF36C 001FF26C 00000000 */   nop
/* 0FF370 001FF270 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF374 001FF274 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
/* 0FF378 001FF278 04000010 */  b           .L001FF28C
/* 0FF37C 001FF27C 00000000 */   nop
.L001FF280:
/* 0FF380 001FF280 01000224 */  addiu       $2, $0, 0x1
/* 0FF384 001FF284 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF388 001FF288 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
.L001FF28C:
/* 0FF38C 001FF28C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF390 001FF290 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FF394 001FF294 01000224 */  addiu       $2, $0, 0x1
/* 0FF398 001FF298 08006214 */  bne         $3, $2, .L001FF2BC
/* 0FF39C 001FF29C 00000000 */   nop
/* 0FF3A0 001FF2A0 CC01023C */  lui         $2, %hi(GamePad)
/* 0FF3A4 001FF2A4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF3A8 001FF2A8 40000524 */  addiu       $5, $0, 0x40
/* 0FF3AC 001FF2AC 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF3B0 001FF2B0 00000000 */   nop
/* 0FF3B4 001FF2B4 08004014 */  bnez        $2, .L001FF2D8
/* 0FF3B8 001FF2B8 00000000 */   nop
.L001FF2BC:
/* 0FF3BC 001FF2BC CC01023C */  lui         $2, %hi(GamePad)
/* 0FF3C0 001FF2C0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF3C4 001FF2C4 20000524 */  addiu       $5, $0, 0x20
/* 0FF3C8 001FF2C8 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF3CC 001FF2CC 00000000 */   nop
/* 0FF3D0 001FF2D0 0C004010 */  beqz        $2, .L001FF304
/* 0FF3D4 001FF2D4 00000000 */   nop
.L001FF2D8:
/* 0FF3D8 001FF2D8 01000224 */  addiu       $2, $0, 0x1
/* 0FF3DC 001FF2DC DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FF3E0 001FF2E0 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FF3E4 001FF2E4 06000224 */  addiu       $2, $0, 0x6
/* 0FF3E8 001FF2E8 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF3EC 001FF2EC 90EA22AC */  sw          $2, %lo(WepMenu + 0x20)($1)
/* 0FF3F0 001FF2F0 02000424 */  addiu       $4, $0, 0x2
/* 0FF3F4 001FF2F4 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FF3F8 001FF2F8 00000000 */   nop
/* 0FF3FC 001FF2FC 63000010 */  b           .L001FF48C
/* 0FF400 001FF300 00000000 */   nop
.L001FF304:
/* 0FF404 001FF304 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF408 001FF308 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FF40C 001FF30C 5F004014 */  bnez        $2, .L001FF48C
/* 0FF410 001FF310 00000000 */   nop
/* 0FF414 001FF314 CC01023C */  lui         $2, %hi(GamePad)
/* 0FF418 001FF318 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF41C 001FF31C 40000524 */  addiu       $5, $0, 0x40
/* 0FF420 001FF320 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF424 001FF324 00000000 */   nop
/* 0FF428 001FF328 58004010 */  beqz        $2, .L001FF48C
/* 0FF42C 001FF32C 00000000 */   nop
/* 0FF430 001FF330 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FF434 001FF334 74EA2480 */  lb          $4, %lo(WepMenu + 0x4)($1)
/* 0FF438 001FF338 40110400 */  sll         $2, $4, 5
/* 0FF43C 001FF33C 23104400 */  subu        $2, $2, $4
/* 0FF440 001FF340 C0180200 */  sll         $3, $2, 3
/* 0FF444 001FF344 1495828F */  lw          $2, -0x6AEC($28)
/* 0FF448 001FF348 21284300 */  addu        $5, $2, $3
/* 0FF44C 001FF34C B0110224 */  addiu       $2, $0, 0x11B0
/* 0FF450 001FF350 18188200 */  mult        $3, $4, $2
/* 0FF454 001FF354 D901023C */  lui         $2, %hi(DngWeaponFrm)
/* 0FF458 001FF358 30164224 */  addiu       $2, $2, %lo(DngWeaponFrm)
/* 0FF45C 001FF35C 21304300 */  addu        $6, $2, $3
/* 0FF460 001FF360 DB01023C */  lui         $2, %hi(MenuWepLevelUp)
/* 0FF464 001FF364 E0A84424 */  addiu       $4, $2, %lo(MenuWepLevelUp)
/* 0FF468 001FF368 1895878F */  lw          $7, -0x6AE8($28)
/* 0FF46C 001FF36C F894888F */  lw          $8, -0x6B08($28)
/* 0FF470 001FF370 0CDB080C */  jal         SetBuildUp__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
/* 0FF474 001FF374 00000000 */   nop
/* 0FF478 001FF378 09000224 */  addiu       $2, $0, 0x9
/* 0FF47C 001FF37C DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FF480 001FF380 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FF484 001FF384 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FF488 001FF388 72EA20A4 */  sh          $0, %lo(WepMenu + 0x2)($1)
/* 0FF48C 001FF38C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FF490 001FF390 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
/* 0FF494 001FF394 01000424 */  addiu       $4, $0, 0x1
/* 0FF498 001FF398 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FF49C 001FF39C 00000000 */   nop
/* 0FF4A0 001FF3A0 3A000010 */  b           .L001FF48C
/* 0FF4A4 001FF3A4 00000000 */   nop
jlabel .L001FF3A8
.L001FF3A8$b:
/* 0FF4A8 001FF3A8 CC01023C */  lui         $2, %hi(GamePad)
/* 0FF4AC 001FF3AC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF4B0 001FF3B0 05000524 */  addiu       $5, $0, 0x5
/* 0FF4B4 001FF3B4 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF4B8 001FF3B8 00000000 */   nop
/* 0FF4BC 001FF3BC 10004010 */  beqz        $2, .L001FF400
/* 0FF4C0 001FF3C0 00000000 */   nop
/* 0FF4C4 001FF3C4 DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FF4C8 001FF3C8 E8EB2280 */  lb          $2, %lo(WepMenu + 0x178)($1)
/* 0FF4CC 001FF3CC FFFF4224 */  addiu       $2, $2, -0x1
/* 0FF4D0 001FF3D0 DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FF4D4 001FF3D4 E8EB22A0 */  sb          $2, %lo(WepMenu + 0x178)($1)
/* 0FF4D8 001FF3D8 DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FF4DC 001FF3DC E8EB2280 */  lb          $2, %lo(WepMenu + 0x178)($1)
/* 0FF4E0 001FF3E0 04004104 */  bgez        $2, .L001FF3F4
/* 0FF4E4 001FF3E4 00000000 */   nop
/* 0FF4E8 001FF3E8 02000224 */  addiu       $2, $0, 0x2
/* 0FF4EC 001FF3EC DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FF4F0 001FF3F0 E8EB22A0 */  sb          $2, %lo(WepMenu + 0x178)($1)
.L001FF3F4:
/* 0FF4F4 001FF3F4 28260070 */  paddub      $4, $0, $0
/* 0FF4F8 001FF3F8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FF4FC 001FF3FC 00000000 */   nop
.L001FF400:
/* 0FF500 001FF400 CC01023C */  lui         $2, %hi(GamePad)
/* 0FF504 001FF404 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF508 001FF408 0A000524 */  addiu       $5, $0, 0xA
/* 0FF50C 001FF40C 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF510 001FF410 00000000 */   nop
/* 0FF514 001FF414 10004010 */  beqz        $2, .L001FF458
/* 0FF518 001FF418 00000000 */   nop
/* 0FF51C 001FF41C DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FF520 001FF420 E8EB2280 */  lb          $2, %lo(WepMenu + 0x178)($1)
/* 0FF524 001FF424 01004224 */  addiu       $2, $2, 0x1
/* 0FF528 001FF428 DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FF52C 001FF42C E8EB22A0 */  sb          $2, %lo(WepMenu + 0x178)($1)
/* 0FF530 001FF430 DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FF534 001FF434 E8EB2280 */  lb          $2, %lo(WepMenu + 0x178)($1)
/* 0FF538 001FF438 03004128 */  slti        $1, $2, 0x3
/* 0FF53C 001FF43C 03002014 */  bnez        $1, .L001FF44C
/* 0FF540 001FF440 00000000 */   nop
/* 0FF544 001FF444 DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FF548 001FF448 E8EB20A0 */  sb          $0, %lo(WepMenu + 0x178)($1)
.L001FF44C:
/* 0FF54C 001FF44C 28260070 */  paddub      $4, $0, $0
/* 0FF550 001FF450 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FF554 001FF454 00000000 */   nop
.L001FF458:
/* 0FF558 001FF458 CC01023C */  lui         $2, %hi(GamePad)
/* 0FF55C 001FF45C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FF560 001FF460 20000524 */  addiu       $5, $0, 0x20
/* 0FF564 001FF464 1CAE040C */  jal         Down__8CGamePadFi
/* 0FF568 001FF468 00000000 */   nop
/* 0FF56C 001FF46C 07004010 */  beqz        $2, .L001FF48C
/* 0FF570 001FF470 00000000 */   nop
/* 0FF574 001FF474 05000224 */  addiu       $2, $0, 0x5
/* 0FF578 001FF478 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FF57C 001FF47C 72EA22A4 */  sh          $2, %lo(WepMenu + 0x2)($1)
/* 0FF580 001FF480 02000424 */  addiu       $4, $0, 0x2
/* 0FF584 001FF484 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FF588 001FF488 00000000 */   nop
.L001FF48C:
/* 0FF58C 001FF48C DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FF590 001FF490 75EA2280 */  lb          $2, %lo(WepMenu + 0x5)($1)
/* 0FF594 001FF494 7B004212 */  beq         $18, $2, .L001FF684
/* 0FF598 001FF498 00000000 */   nop
/* 0FF59C 001FF49C D494828F */  lw          $2, -0x6B2C($28)
/* 0FF5A0 001FF4A0 04004480 */  lb          $4, 0x4($2)
/* 0FF5A4 001FF4A4 D894828F */  lw          $2, -0x6B28($28)
/* 0FF5A8 001FF4A8 07004014 */  bnez        $2, .L001FF4C8
/* 0FF5AC 001FF4AC 00000000 */   nop
/* 0FF5B0 001FF4B0 05009214 */  bne         $4, $18, .L001FF4C8
/* 0FF5B4 001FF4B4 00000000 */   nop
/* 0FF5B8 001FF4B8 0095858F */  lw          $5, -0x6B00($28)
/* 0FF5BC 001FF4BC E494868F */  lw          $6, -0x6B1C($28)
/* 0FF5C0 001FF4C0 5837080C */  jal         DngWeaponEquipModelBuild__FiiP1
/* 0FF5C4 001FF4C4 00000000 */   nop
.L001FF4C8:
/* 0FF5C8 001FF4C8 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FF5CC 001FF4CC 75EA2580 */  lb          $5, %lo(WepMenu + 0x5)($1)
/* 0FF5D0 001FF4D0 D494838F */  lw          $3, -0x6B2C($28)
/* 0FF5D4 001FF4D4 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0FF5D8 001FF4D8 1810A200 */  mult        $2, $5, $2
/* 0FF5DC 001FF4DC 21106200 */  addu        $2, $3, $2
/* 0FF5E0 001FF4E0 0C454224 */  addiu       $2, $2, 0x450C
/* 0FF5E4 001FF4E4 149582AF */  sw          $2, -0x6AEC($28)
/* 0FF5E8 001FF4E8 E494848F */  lw          $4, -0x6B1C($28)
/* 0FF5EC 001FF4EC 7434080C */  jal         StartReadWepMDS__FP1i
/* 0FF5F0 001FF4F0 00000000 */   nop
/* 0FF5F4 001FF4F4 60004010 */  beqz        $2, .L001FF678
/* 0FF5F8 001FF4F8 00000000 */   nop
/* 0FF5FC 001FF4FC 049580AF */  sw          $0, -0x6AFC($28)
/* 0FF600 001FF500 04000224 */  addiu       $2, $0, 0x4
/* 0FF604 001FF504 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FF608 001FF508 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FF60C 001FF50C DA01013C */  lui         $1, %hi(WepMenu + 0x10)
/* 0FF610 001FF510 80EA20AC */  sw          $0, %lo(WepMenu + 0x10)($1)
/* 0FF614 001FF514 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FF618 001FF518 75EA2280 */  lb          $2, %lo(WepMenu + 0x5)($1)
/* 0FF61C 001FF51C 23204202 */  subu        $4, $18, $2
/* 0FF620 001FF520 7200040C */  jal         abs
/* 0FF624 001FF524 00000000 */   nop
/* 0FF628 001FF528 02004128 */  slti        $1, $2, 0x2
/* 0FF62C 001FF52C 1F002014 */  bnez        $1, .L001FF5AC
/* 0FF630 001FF530 00000000 */   nop
/* 0FF634 001FF534 28260070 */  paddub      $4, $0, $0
/* 0FF638 001FF538 19000010 */  b           .L001FF5A0
/* 0FF63C 001FF53C 00000000 */   nop
.L001FF540:
/* 0FF640 001FF540 40100400 */  sll         $2, $4, 1
/* 0FF644 001FF544 21104400 */  addu        $2, $2, $4
/* 0FF648 001FF548 80280200 */  sll         $5, $2, 2
/* 0FF64C 001FF54C 2900023C */  lui         $2, %hi(SysChara)
/* 0FF650 001FF550 502B4224 */  addiu       $2, $2, %lo(SysChara)
/* 0FF654 001FF554 21104500 */  addu        $2, $2, $5
/* 0FF658 001FF558 00004380 */  lb          $3, 0x0($2)
/* 0FF65C 001FF55C DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FF660 001FF560 75EA2280 */  lb          $2, %lo(WepMenu + 0x5)($1)
/* 0FF664 001FF564 23186200 */  subu        $3, $3, $2
/* 0FF668 001FF568 C0100300 */  sll         $2, $3, 3
/* 0FF66C 001FF56C 23104300 */  subu        $2, $2, $3
/* 0FF670 001FF570 C0100200 */  sll         $2, $2, 3
/* 0FF674 001FF574 23104300 */  subu        $2, $2, $3
/* 0FF678 001FF578 40100200 */  sll         $2, $2, 1
/* 0FF67C 001FF57C 0E014224 */  addiu       $2, $2, 0x10E
/* 0FF680 001FF580 00008244 */  mtc1        $2, $f0
/* 0FF684 001FF584 00000000 */  nop
/* 0FF688 001FF588 20008046 */  cvt.s.w     $f0, $f0
/* 0FF68C 001FF58C 2900023C */  lui         $2, %hi(SysChara + 0x4)
/* 0FF690 001FF590 542B4224 */  addiu       $2, $2, %lo(SysChara + 0x4)
/* 0FF694 001FF594 21104500 */  addu        $2, $2, $5
/* 0FF698 001FF598 000040E4 */  swc1        $f0, 0x0($2)
/* 0FF69C 001FF59C 01008424 */  addiu       $4, $4, 0x1
.L001FF5A0:
/* 0FF6A0 001FF5A0 06008228 */  slti        $2, $4, 0x6
/* 0FF6A4 001FF5A4 E6FF4014 */  bnez        $2, .L001FF540
/* 0FF6A8 001FF5A8 00000000 */   nop
.L001FF5AC:
/* 0FF6AC 001FF5AC DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FF6B0 001FF5B0 75EA2380 */  lb          $3, %lo(WepMenu + 0x5)($1)
/* 0FF6B4 001FF5B4 D494848F */  lw          $4, -0x6B2C($28)
/* 0FF6B8 001FF5B8 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0FF6BC 001FF5BC 18106200 */  mult        $2, $3, $2
/* 0FF6C0 001FF5C0 21108200 */  addu        $2, $4, $2
/* 0FF6C4 001FF5C4 0C454224 */  addiu       $2, $2, 0x450C
/* 0FF6C8 001FF5C8 149582AF */  sw          $2, -0x6AEC($28)
/* 0FF6CC 001FF5CC 21106400 */  addu        $2, $3, $4
/* 0FF6D0 001FF5D0 40434280 */  lb          $2, 0x4340($2)
/* 0FF6D4 001FF5D4 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FF6D8 001FF5D8 74EA22A0 */  sb          $2, %lo(WepMenu + 0x4)($1)
/* 0FF6DC 001FF5DC DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FF6E0 001FF5E0 74EA2280 */  lb          $2, %lo(WepMenu + 0x4)($1)
/* 0FF6E4 001FF5E4 04004004 */  bltz        $2, .L001FF5F8
/* 0FF6E8 001FF5E8 00000000 */   nop
/* 0FF6EC 001FF5EC 0A004228 */  slti        $2, $2, 0xA
/* 0FF6F0 001FF5F0 03004014 */  bnez        $2, .L001FF600
/* 0FF6F4 001FF5F4 00000000 */   nop
.L001FF5F8:
/* 0FF6F8 001FF5F8 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FF6FC 001FF5FC 74EA20A0 */  sb          $0, %lo(WepMenu + 0x4)($1)
.L001FF600:
/* 0FF700 001FF600 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FF704 001FF604 74EA2480 */  lb          $4, %lo(WepMenu + 0x4)($1)
/* 0FF708 001FF608 D6000224 */  addiu       $2, $0, 0xD6
/* 0FF70C 001FF60C 18188200 */  mult        $3, $4, $2
/* 0FF710 001FF610 E8000224 */  addiu       $2, $0, 0xE8
/* 0FF714 001FF614 23104300 */  subu        $2, $2, $3
/* 0FF718 001FF618 00008244 */  mtc1        $2, $f0
/* 0FF71C 001FF61C 00000000 */  nop
/* 0FF720 001FF620 20008046 */  cvt.s.w     $f0, $f0
/* 0FF724 001FF624 7C9580E7 */  swc1        $f0, -0x6A84($28)
/* 0FF728 001FF628 23100400 */  negu        $2, $4
/* 0FF72C 001FF62C 00008244 */  mtc1        $2, $f0
/* 0FF730 001FF630 00000000 */  nop
/* 0FF734 001FF634 60008046 */  cvt.s.w     $f1, $f0
/* 0FF738 001FF638 8041023C */  lui         $2, (0x41800000 >> 16)
/* 0FF73C 001FF63C 00008244 */  mtc1        $2, $f0
/* 0FF740 001FF640 00000000 */  nop
/* 0FF744 001FF644 42000146 */  mul.s       $f1, $f0, $f1
/* 0FF748 001FF648 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0FF74C 001FF64C 00008244 */  mtc1        $2, $f0
/* 0FF750 001FF650 00000000 */  nop
/* 0FF754 001FF654 00000146 */  add.s       $f0, $f0, $f1
/* 0FF758 001FF658 809580E7 */  swc1        $f0, -0x6A80($28)
/* 0FF75C 001FF65C DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FF760 001FF660 7CEA20A4 */  sh          $0, %lo(WepMenu + 0xC)($1)
/* 0FF764 001FF664 DA01013C */  lui         $1, %hi(WepMenu + 0x10)
/* 0FF768 001FF668 80EA20AC */  sw          $0, %lo(WepMenu + 0x10)($1)
/* 0FF76C 001FF66C 28860070 */  paddub      $16, $0, $0
/* 0FF770 001FF670 04000010 */  b           .L001FF684
/* 0FF774 001FF674 00000000 */   nop
.L001FF678:
/* 0FF778 001FF678 02000424 */  addiu       $4, $0, 0x2
/* 0FF77C 001FF67C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FF780 001FF680 00000000 */   nop
.L001FF684:
/* 0FF784 001FF684 28160072 */  paddub      $2, $16, $0
/* 0FF788 001FF688 5000BF7B */  lq          $31, 0x50($29)
/* 0FF78C 001FF68C 4000B47B */  lq          $20, 0x40($29)
/* 0FF790 001FF690 3000B37B */  lq          $19, 0x30($29)
/* 0FF794 001FF694 2000B27B */  lq          $18, 0x20($29)
/* 0FF798 001FF698 1000B17B */  lq          $17, 0x10($29)
/* 0FF79C 001FF69C 0000B07B */  lq          $16, 0x0($29)
/* 0FF7A0 001FF6A0 8001BD27 */  addiu       $29, $29, 0x180
/* 0FF7A4 001FF6A4 0800E003 */  jr          $31
/* 0FF7A8 001FF6A8 00000000 */   nop
/* 0FF7AC 001FF6AC 00000000 */  nop
