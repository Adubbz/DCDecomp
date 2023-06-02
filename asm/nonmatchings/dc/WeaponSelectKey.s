.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponSelectKey__Fv
/* FE020 001FDF20 80FEBD27 */  addiu      $sp, $sp, -0x180
/* FE024 001FDF24 5000BF7F */  sq         $31, 0x50($sp)
/* FE028 001FDF28 4000B47F */  sq         $20, 0x40($sp)
/* FE02C 001FDF2C 3000B37F */  sq         $19, 0x30($sp)
/* FE030 001FDF30 2000B27F */  sq         $18, 0x20($sp)
/* FE034 001FDF34 1000B17F */  sq         $17, 0x10($sp)
/* FE038 001FDF38 0000B07F */  sq         $16, 0x0($sp)
/* FE03C 001FDF3C 28860070 */  paddub     $16, $0, $0
/* FE040 001FDF40 06001124 */  addiu      $17, $0, 0x6
/* FE044 001FDF44 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE048 001FDF48 75EA3280 */  lb         $18, -0x158B($at)
/* FE04C 001FDF4C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE050 001FDF50 72EA2484 */  lh         $4, -0x158E($at)
/* FE054 001FDF54 0800812C */  sltiu      $at, $4, 0x8
/* FE058 001FDF58 4C052010 */  beqz       $at, .L001FF48C
/* FE05C 001FDF5C 00000000 */   nop
/* FE060 001FDF60 2A00023C */  lui        $2, %hi(_3606_2)
/* FE064 001FDF64 C0D94324 */  addiu      $3, $2, %lo(_3606_2)
/* FE068 001FDF68 80100400 */  sll        $2, $4, 2
/* FE06C 001FDF6C 21104300 */  addu       $2, $2, $3
/* FE070 001FDF70 0000428C */  lw         $2, 0x0($2)
/* FE074 001FDF74 08004000 */  jr         $2
/* FE078 001FDF78 00000000 */   nop
/* FE07C 001FDF7C 289E0070 */  paddub     $19, $0, $0
/* FE080 001FDF80 CC01023C */  lui        $2, %hi(GamePad)
/* FE084 001FDF84 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FE088 001FDF88 00800534 */  ori        $5, $0, 0x8000
/* FE08C 001FDF8C 1CAE040C */  jal        Down__8CGamePadFi
/* FE090 001FDF90 00000000 */   nop
/* FE094 001FDF94 09004010 */  beqz       $2, .L001FDFBC
/* FE098 001FDF98 00000000 */   nop
/* FE09C 001FDF9C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE0A0 001FDFA0 74EA2280 */  lb         $2, -0x158C($at)
/* FE0A4 001FDFA4 2A080200 */  slt        $at, $0, $2
/* FE0A8 001FDFA8 04002010 */  beqz       $at, .L001FDFBC
/* FE0AC 001FDFAC 00000000 */   nop
/* FE0B0 001FDFB0 FFFF4224 */  addiu      $2, $2, -0x1
/* FE0B4 001FDFB4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE0B8 001FDFB8 74EA22A0 */  sb         $2, -0x158C($at)
.L001FDFBC:
/* FE0BC 001FDFBC CC01023C */  lui        $2, %hi(GamePad)
/* FE0C0 001FDFC0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FE0C4 001FDFC4 00200524 */  addiu      $5, $0, 0x2000
/* FE0C8 001FDFC8 1CAE040C */  jal        Down__8CGamePadFi
/* FE0CC 001FDFCC 00000000 */   nop
/* FE0D0 001FDFD0 09004010 */  beqz       $2, .L001FDFF8
/* FE0D4 001FDFD4 00000000 */   nop
/* FE0D8 001FDFD8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE0DC 001FDFDC 74EA2280 */  lb         $2, -0x158C($at)
/* FE0E0 001FDFE0 09004128 */  slti       $at, $2, 0x9
/* FE0E4 001FDFE4 04002010 */  beqz       $at, .L001FDFF8
/* FE0E8 001FDFE8 00000000 */   nop
/* FE0EC 001FDFEC 01004224 */  addiu      $2, $2, 0x1
/* FE0F0 001FDFF0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE0F4 001FDFF4 74EA22A0 */  sb         $2, -0x158C($at)
.L001FDFF8:
/* FE0F8 001FDFF8 CC01023C */  lui        $2, %hi(GamePad)
/* FE0FC 001FDFFC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FE100 001FE000 20000524 */  addiu      $5, $0, 0x20
/* FE104 001FE004 1CAE040C */  jal        Down__8CGamePadFi
/* FE108 001FE008 00000000 */   nop
/* FE10C 001FE00C 1F004010 */  beqz       $2, .L001FE08C
/* FE110 001FE010 00000000 */   nop
/* FE114 001FE014 02000424 */  addiu      $4, $0, 0x2
/* FE118 001FE018 BCB3080C */  jal        ComMenuSePlay__Fi
/* FE11C 001FE01C 00000000 */   nop
/* FE120 001FE020 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE124 001FE024 70EA2384 */  lh         $3, -0x1590($at)
/* FE128 001FE028 06006010 */  beqz       $3, .L001FE044
/* FE12C 001FE02C 00000000 */   nop
/* FE130 001FE030 02000224 */  addiu      $2, $0, 0x2
/* FE134 001FE034 12006210 */  beq        $3, $2, .L001FE080
/* FE138 001FE038 00000000 */   nop
/* FE13C 001FE03C 10000010 */  b          .L001FE080
/* FE140 001FE040 00000000 */   nop
.L001FE044:
/* FE144 001FE044 D894828F */  lw         $2, -0x6B28($gp)
/* FE148 001FE048 06004014 */  bnez       $2, .L001FE064
/* FE14C 001FE04C 00000000 */   nop
/* FE150 001FE050 F494848F */  lw         $4, -0x6B0C($gp)
/* FE154 001FE054 38B4080C */  jal        MenuTextureReload__Fi
/* FE158 001FE058 00000000 */   nop
/* FE15C 001FE05C ACA9080C */  jal        DngActiveWeaponTextureCopy__Fv
/* FE160 001FE060 00000000 */   nop
.L001FE064:
/* FE164 001FE064 12000224 */  addiu      $2, $0, 0x12
/* FE168 001FE068 208882AF */  sw         $2, -0x77E0($gp)
/* FE16C 001FE06C 02000224 */  addiu      $2, $0, 0x2
/* FE170 001FE070 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE174 001FE074 7CEA22A4 */  sh         $2, -0x1584($at)
/* FE178 001FE078 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE17C 001FE07C 80EA20AC */  sw         $0, -0x1580($at)
.L001FE080:
/* FE180 001FE080 01001324 */  addiu      $19, $0, 0x1
/* FE184 001FE084 2A000010 */  b          .L001FE130
/* FE188 001FE088 00000000 */   nop
.L001FE08C:
/* FE18C 001FE08C CC01023C */  lui        $2, %hi(GamePad)
/* FE190 001FE090 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FE194 001FE094 40000524 */  addiu      $5, $0, 0x40
/* FE198 001FE098 1CAE040C */  jal        Down__8CGamePadFi
/* FE19C 001FE09C 00000000 */   nop
/* FE1A0 001FE0A0 23004010 */  beqz       $2, .L001FE130
/* FE1A4 001FE0A4 00000000 */   nop
/* FE1A8 001FE0A8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE1AC 001FE0AC 70EA2284 */  lh         $2, -0x1590($at)
/* FE1B0 001FE0B0 03004010 */  beqz       $2, .L001FE0C0
/* FE1B4 001FE0B4 00000000 */   nop
/* FE1B8 001FE0B8 1C000010 */  b          .L001FE12C
/* FE1BC 001FE0BC 00000000 */   nop
.L001FE0C0:
/* FE1C0 001FE0C0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE1C4 001FE0C4 75EA2480 */  lb         $4, -0x158B($at)
/* FE1C8 001FE0C8 68CF070C */  jal        GetDefaultWeaponNo__Fi
/* FE1CC 001FE0CC 00000000 */   nop
/* FE1D0 001FE0D0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE1D4 001FE0D4 74EA2480 */  lb         $4, -0x158C($at)
/* FE1D8 001FE0D8 40190400 */  sll        $3, $4, 5
/* FE1DC 001FE0DC 23186400 */  subu       $3, $3, $4
/* FE1E0 001FE0E0 C0200300 */  sll        $4, $3, 3
/* FE1E4 001FE0E4 1495838F */  lw         $3, -0x6AEC($gp)
/* FE1E8 001FE0E8 21186400 */  addu       $3, $3, $4
/* FE1EC 001FE0EC 00006384 */  lh         $3, 0x0($3)
/* FE1F0 001FE0F0 2A086200 */  slt        $at, $3, $2
/* FE1F4 001FE0F4 06002010 */  beqz       $at, .L001FE110
/* FE1F8 001FE0F8 00000000 */   nop
/* FE1FC 001FE0FC 02000424 */  addiu      $4, $0, 0x2
/* FE200 001FE100 BCB3080C */  jal        ComMenuSePlay__Fi
/* FE204 001FE104 00000000 */   nop
/* FE208 001FE108 08000010 */  b          .L001FE12C
/* FE20C 001FE10C 00000000 */   nop
.L001FE110:
/* FE210 001FE110 01000424 */  addiu      $4, $0, 0x1
/* FE214 001FE114 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE218 001FE118 72EA24A4 */  sh         $4, -0x158E($at)
/* FE21C 001FE11C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE220 001FE120 90EA20AC */  sw         $0, -0x1570($at)
/* FE224 001FE124 BCB3080C */  jal        ComMenuSePlay__Fi
/* FE228 001FE128 00000000 */   nop
.L001FE12C:
/* FE22C 001FE12C 01001324 */  addiu      $19, $0, 0x1
.L001FE130:
/* FE230 001FE130 D6046016 */  bnez       $19, .L001FF48C
/* FE234 001FE134 00000000 */   nop
/* FE238 001FE138 CC01023C */  lui        $2, %hi(GamePad)
/* FE23C 001FE13C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FE240 001FE140 0A000524 */  addiu      $5, $0, 0xA
/* FE244 001FE144 1CAE040C */  jal        Down__8CGamePadFi
/* FE248 001FE148 00000000 */   nop
/* FE24C 001FE14C 0D004010 */  beqz       $2, .L001FE184
/* FE250 001FE150 00000000 */   nop
/* FE254 001FE154 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE258 001FE158 75EA2280 */  lb         $2, -0x158B($at)
/* FE25C 001FE15C 01004224 */  addiu      $2, $2, 0x1
/* FE260 001FE160 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE264 001FE164 75EA22A0 */  sb         $2, -0x158B($at)
/* FE268 001FE168 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE26C 001FE16C 75EA2280 */  lb         $2, -0x158B($at)
/* FE270 001FE170 06004228 */  slti       $2, $2, 0x6
/* FE274 001FE174 03004014 */  bnez       $2, .L001FE184
/* FE278 001FE178 00000000 */   nop
/* FE27C 001FE17C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE280 001FE180 75EA20A0 */  sb         $0, -0x158B($at)
.L001FE184:
/* FE284 001FE184 CC01023C */  lui        $2, %hi(GamePad)
/* FE288 001FE188 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FE28C 001FE18C 05000524 */  addiu      $5, $0, 0x5
/* FE290 001FE190 1CAE040C */  jal        Down__8CGamePadFi
/* FE294 001FE194 00000000 */   nop
/* FE298 001FE198 BC044010 */  beqz       $2, .L001FF48C
/* FE29C 001FE19C 00000000 */   nop
/* FE2A0 001FE1A0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE2A4 001FE1A4 75EA2280 */  lb         $2, -0x158B($at)
/* FE2A8 001FE1A8 FFFF4224 */  addiu      $2, $2, -0x1
/* FE2AC 001FE1AC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE2B0 001FE1B0 75EA22A0 */  sb         $2, -0x158B($at)
/* FE2B4 001FE1B4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE2B8 001FE1B8 75EA2280 */  lb         $2, -0x158B($at)
/* FE2BC 001FE1BC B3044104 */  bgez       $2, .L001FF48C
/* FE2C0 001FE1C0 00000000 */   nop
/* FE2C4 001FE1C4 FFFF2226 */  addiu      $2, $17, -0x1
/* FE2C8 001FE1C8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE2CC 001FE1CC 75EA22A0 */  sb         $2, -0x158B($at)
/* FE2D0 001FE1D0 AE040010 */  b          .L001FF48C
/* FE2D4 001FE1D4 00000000 */   nop
/* FE2D8 001FE1D8 C0CF070C */  jal        GetNowSelectWeapon__Fv
/* FE2DC 001FE1DC 00000000 */   nop
/* FE2E0 001FE1E0 288E4070 */  paddub     $17, $2, $0
/* FE2E4 001FE1E4 28262072 */  paddub     $4, $17, $0
/* FE2E8 001FE1E8 ACEF070C */  jal        NowWeaponStatusValue__FP11WEAPON_HAVE
/* FE2EC 001FE1EC 00000000 */   nop
/* FE2F0 001FE1F0 289E4070 */  paddub     $19, $2, $0
/* FE2F4 001FE1F4 CC01023C */  lui        $2, %hi(GamePad)
/* FE2F8 001FE1F8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FE2FC 001FE1FC 00100524 */  addiu      $5, $0, 0x1000
/* FE300 001FE200 1CAE040C */  jal        Down__8CGamePadFi
/* FE304 001FE204 00000000 */   nop
/* FE308 001FE208 13004010 */  beqz       $2, .L001FE258
/* FE30C 001FE20C 00000000 */   nop
/* FE310 001FE210 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE314 001FE214 90EA248C */  lw         $4, -0x1570($at)
/* FE318 001FE218 2A080400 */  slt        $at, $0, $4
/* FE31C 001FE21C 09002010 */  beqz       $at, .L001FE244
/* FE320 001FE220 00000000 */   nop
/* FE324 001FE224 05008128 */  slti       $at, $4, 0x5
/* FE328 001FE228 06002010 */  beqz       $at, .L001FE244
/* FE32C 001FE22C 00000000 */   nop
/* FE330 001FE230 FFFF8224 */  addiu      $2, $4, -0x1
/* FE334 001FE234 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE338 001FE238 90EA22AC */  sw         $2, -0x1570($at)
/* FE33C 001FE23C 06000010 */  b          .L001FE258
/* FE340 001FE240 00000000 */   nop
.L001FE244:
/* FE344 001FE244 282E6072 */  paddub     $5, $19, $0
/* FE348 001FE248 9CF7070C */  jal        WeaponMenuKastumSelectUp__Fii
/* FE34C 001FE24C 00000000 */   nop
/* FE350 001FE250 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE354 001FE254 90EA22AC */  sw         $2, -0x1570($at)
.L001FE258:
/* FE358 001FE258 CC01023C */  lui        $2, %hi(GamePad)
/* FE35C 001FE25C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FE360 001FE260 00400524 */  addiu      $5, $0, 0x4000
/* FE364 001FE264 1CAE040C */  jal        Down__8CGamePadFi
/* FE368 001FE268 00000000 */   nop
/* FE36C 001FE26C 11004010 */  beqz       $2, .L001FE2B4
/* FE370 001FE270 00000000 */   nop
/* FE374 001FE274 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE378 001FE278 90EA238C */  lw         $3, -0x1570($at)
/* FE37C 001FE27C 03006228 */  slti       $2, $3, 0x3
/* FE380 001FE280 09004014 */  bnez       $2, .L001FE2A8
/* FE384 001FE284 00000000 */   nop
/* FE388 001FE288 01006424 */  addiu      $4, $3, 0x1
/* FE38C 001FE28C 282E6072 */  paddub     $5, $19, $0
/* FE390 001FE290 B4F7070C */  jal        WeaponMenuKastumSelectDown__Fii
/* FE394 001FE294 00000000 */   nop
/* FE398 001FE298 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE39C 001FE29C 90EA22AC */  sw         $2, -0x1570($at)
/* FE3A0 001FE2A0 04000010 */  b          .L001FE2B4
/* FE3A4 001FE2A4 00000000 */   nop
.L001FE2A8:
/* FE3A8 001FE2A8 01006224 */  addiu      $2, $3, 0x1
/* FE3AC 001FE2AC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE3B0 001FE2B0 90EA22AC */  sw         $2, -0x1570($at)
.L001FE2B4:
/* FE3B4 001FE2B4 CC01023C */  lui        $2, %hi(GamePad)
/* FE3B8 001FE2B8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FE3BC 001FE2BC 00200524 */  addiu      $5, $0, 0x2000
/* FE3C0 001FE2C0 1CAE040C */  jal        Down__8CGamePadFi
/* FE3C4 001FE2C4 00000000 */   nop
/* FE3C8 001FE2C8 10004010 */  beqz       $2, .L001FE30C
/* FE3CC 001FE2CC 00000000 */   nop
/* FE3D0 001FE2D0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE3D4 001FE2D4 90EA228C */  lw         $2, -0x1570($at)
/* FE3D8 001FE2D8 0C004014 */  bnez       $2, .L001FE30C
/* FE3DC 001FE2DC 00000000 */   nop
/* FE3E0 001FE2E0 0C000224 */  addiu      $2, $0, 0xC
/* FE3E4 001FE2E4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE3E8 001FE2E8 7CEA22A4 */  sh         $2, -0x1584($at)
/* FE3EC 001FE2EC 01000224 */  addiu      $2, $0, 0x1
/* FE3F0 001FE2F0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE3F4 001FE2F4 79EA22A0 */  sb         $2, -0x1587($at)
/* FE3F8 001FE2F8 28260070 */  paddub     $4, $0, $0
/* FE3FC 001FE2FC BCB3080C */  jal        ComMenuSePlay__Fi
/* FE400 001FE300 00000000 */   nop
/* FE404 001FE304 61040010 */  b          .L001FF48C
/* FE408 001FE308 00000000 */   nop
.L001FE30C:
/* FE40C 001FE30C CC01023C */  lui        $2, %hi(GamePad)
/* FE410 001FE310 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FE414 001FE314 40000524 */  addiu      $5, $0, 0x40
/* FE418 001FE318 1CAE040C */  jal        Down__8CGamePadFi
/* FE41C 001FE31C 00000000 */   nop
/* FE420 001FE320 0A024010 */  beqz       $2, .L001FEB4C
/* FE424 001FE324 00000000 */   nop
/* FE428 001FE328 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE42C 001FE32C 74EA3380 */  lb         $19, -0x158C($at)
/* FE430 001FE330 28262072 */  paddub     $4, $17, $0
/* FE434 001FE334 ACEF070C */  jal        NowWeaponStatusValue__FP11WEAPON_HAVE
/* FE438 001FE338 00000000 */   nop
/* FE43C 001FE33C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE440 001FE340 90EA248C */  lw         $4, -0x1570($at)
/* FE444 001FE344 0700812C */  sltiu      $at, $4, 0x7
/* FE448 001FE348 50042010 */  beqz       $at, .L001FF48C
/* FE44C 001FE34C 00000000 */   nop
/* FE450 001FE350 2A00023C */  lui        $2, %hi(_3607)
/* FE454 001FE354 A0D94324 */  addiu      $3, $2, %lo(_3607)
/* FE458 001FE358 80100400 */  sll        $2, $4, 2
/* FE45C 001FE35C 21104300 */  addu       $2, $2, $3
/* FE460 001FE360 0000428C */  lw         $2, 0x0($2)
/* FE464 001FE364 08004000 */  jr         $2
/* FE468 001FE368 00000000 */   nop
/* FE46C 001FE36C D494858F */  lw         $5, -0x6B2C($gp)
/* FE470 001FE370 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE474 001FE374 75EA2380 */  lb         $3, -0x158B($at)
/* FE478 001FE378 80100300 */  sll        $2, $3, 2
/* FE47C 001FE37C 21104500 */  addu       $2, $2, $5
/* FE480 001FE380 C842428C */  lw         $2, 0x42C8($2)
/* FE484 001FE384 20004230 */  andi       $2, $2, 0x20
/* FE488 001FE388 0C004010 */  beqz       $2, .L001FE3BC
/* FE48C 001FE38C 00000000 */   nop
/* FE490 001FE390 02000424 */  addiu      $4, $0, 0x2
/* FE494 001FE394 BCB3080C */  jal        ComMenuSePlay__Fi
/* FE498 001FE398 00000000 */   nop
/* FE49C 001FE39C 0B000224 */  addiu      $2, $0, 0xB
/* FE4A0 001FE3A0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE4A4 001FE3A4 7CEA22A4 */  sh         $2, -0x1584($at)
/* FE4A8 001FE3A8 03000224 */  addiu      $2, $0, 0x3
/* FE4AC 001FE3AC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE4B0 001FE3B0 78EA22A0 */  sb         $2, -0x1588($at)
/* FE4B4 001FE3B4 35040010 */  b          .L001FF48C
/* FE4B8 001FE3B8 00000000 */   nop
.L001FE3BC:
/* FE4BC 001FE3BC 0100013C */  lui        $at, (0x10000 >> 16)
/* FE4C0 001FE3C0 2108A100 */  addu       $at, $5, $at
/* FE4C4 001FE3C4 108B248C */  lw         $4, -0x74F0($at)
/* FE4C8 001FE3C8 0A000224 */  addiu      $2, $0, 0xA
/* FE4CC 001FE3CC 0C008214 */  bne        $4, $2, .L001FE400
/* FE4D0 001FE3D0 00000000 */   nop
/* FE4D4 001FE3D4 0B000224 */  addiu      $2, $0, 0xB
/* FE4D8 001FE3D8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE4DC 001FE3DC 7CEA22A4 */  sh         $2, -0x1584($at)
/* FE4E0 001FE3E0 04000224 */  addiu      $2, $0, 0x4
/* FE4E4 001FE3E4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE4E8 001FE3E8 78EA22A0 */  sb         $2, -0x1588($at)
/* FE4EC 001FE3EC 02000424 */  addiu      $4, $0, 0x2
/* FE4F0 001FE3F0 BCB3080C */  jal        ComMenuSePlay__Fi
/* FE4F4 001FE3F4 00000000 */   nop
/* FE4F8 001FE3F8 24040010 */  b          .L001FF48C
/* FE4FC 001FE3FC 00000000 */   nop
.L001FE400:
/* FE500 001FE400 0500A280 */  lb         $2, 0x5($5)
/* FE504 001FE404 2A086200 */  slt        $at, $3, $2
/* FE508 001FE408 0B002014 */  bnez       $at, .L001FE438
/* FE50C 001FE40C 00000000 */   nop
/* FE510 001FE410 0B000224 */  addiu      $2, $0, 0xB
/* FE514 001FE414 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE518 001FE418 7CEA22A4 */  sh         $2, -0x1584($at)
/* FE51C 001FE41C 02000424 */  addiu      $4, $0, 0x2
/* FE520 001FE420 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE524 001FE424 78EA24A0 */  sb         $4, -0x1588($at)
/* FE528 001FE428 BCB3080C */  jal        ComMenuSePlay__Fi
/* FE52C 001FE42C 00000000 */   nop
/* FE530 001FE430 16040010 */  b          .L001FF48C
/* FE534 001FE434 00000000 */   nop
.L001FE438:
/* FE538 001FE438 21106500 */  addu       $2, $3, $5
/* FE53C 001FE43C 404353A0 */  sb         $19, 0x4340($2)
/* FE540 001FE440 789580AF */  sw         $0, -0x6A88($gp)
/* FE544 001FE444 05000324 */  addiu      $3, $0, 0x5
/* FE548 001FE448 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE54C 001FE44C 7CEA23A4 */  sh         $3, -0x1584($at)
/* FE550 001FE450 D494828F */  lw         $2, -0x6B2C($gp)
/* FE554 001FE454 04004480 */  lb         $4, 0x4($2)
/* FE558 001FE458 D894828F */  lw         $2, -0x6B28($gp)
/* FE55C 001FE45C 12004014 */  bnez       $2, .L001FE4A8
/* FE560 001FE460 00000000 */   nop
/* FE564 001FE464 05008314 */  bne        $4, $3, .L001FE47C
/* FE568 001FE468 00000000 */   nop
/* FE56C 001FE46C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE570 001FE470 75EA2280 */  lb         $2, -0x158B($at)
/* FE574 001FE474 08004310 */  beq        $2, $3, .L001FE498
/* FE578 001FE478 00000000 */   nop
.L001FE47C:
/* FE57C 001FE47C 03000324 */  addiu      $3, $0, 0x3
/* FE580 001FE480 09008314 */  bne        $4, $3, .L001FE4A8
/* FE584 001FE484 00000000 */   nop
/* FE588 001FE488 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE58C 001FE48C 75EA2280 */  lb         $2, -0x158B($at)
/* FE590 001FE490 05004314 */  bne        $2, $3, .L001FE4A8
/* FE594 001FE494 00000000 */   nop
.L001FE498:
/* FE598 001FE498 30FB040C */  jal        StartReadBG__Fv
/* FE59C 001FE49C 00000000 */   nop
/* FE5A0 001FE4A0 2C34080C */  jal        DngWepEffectReadStart__Fv
/* FE5A4 001FE4A4 00000000 */   nop
.L001FE4A8:
/* FE5A8 001FE4A8 17000424 */  addiu      $4, $0, 0x17
/* FE5AC 001FE4AC BCB3080C */  jal        ComMenuSePlay__Fi
/* FE5B0 001FE4B0 00000000 */   nop
/* FE5B4 001FE4B4 F5030010 */  b          .L001FF48C
/* FE5B8 001FE4B8 00000000 */   nop
/* FE5BC 001FE4BC 0A000224 */  addiu      $2, $0, 0xA
/* FE5C0 001FE4C0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE5C4 001FE4C4 72EA22A4 */  sh         $2, -0x158E($at)
/* FE5C8 001FE4C8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE5CC 001FE4CC 90EA20AC */  sw         $0, -0x1570($at)
/* FE5D0 001FE4D0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE5D4 001FE4D4 E8EB20A0 */  sb         $0, -0x1418($at)
/* FE5D8 001FE4D8 16002482 */  lb         $4, 0x16($17)
/* FE5DC 001FE4DC 2434080C */  jal        SetOldEffectKind__Fi
/* FE5E0 001FE4E0 00000000 */   nop
/* FE5E4 001FE4E4 00002486 */  lh         $4, 0x0($17)
/* FE5E8 001FE4E8 C4C7080C */  jal        GetWeaponHoleNum__Fi
/* FE5EC 001FE4EC 00000000 */   nop
/* FE5F0 001FE4F0 288E4070 */  paddub     $17, $2, $0
/* FE5F4 001FE4F4 1C8D848F */  lw         $4, -0x72E4($gp)
/* FE5F8 001FE4F8 D05E050C */  jal        GetMenuCursor__9CSaveDataFv
/* FE5FC 001FE4FC 00000000 */   nop
/* FE600 001FE500 289E4070 */  paddub     $19, $2, $0
/* FE604 001FE504 02000424 */  addiu      $4, $0, 0x2
/* FE608 001FE508 D8BD080C */  jal        PersonalRetMax__Fi
/* FE60C 001FE50C 00000000 */   nop
/* FE610 001FE510 00006386 */  lh         $3, 0x0($19)
/* FE614 001FE514 61006014 */  bnez       $3, .L001FE69C
/* FE618 001FE518 00000000 */   nop
/* FE61C 001FE51C 1A006386 */  lh         $3, 0x1A($19)
/* FE620 001FE520 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE624 001FE524 72EA23A4 */  sh         $3, -0x158E($at)
/* FE628 001FE528 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE62C 001FE52C 72EA2484 */  lh         $4, -0x158E($at)
/* FE630 001FE530 08008328 */  slti       $3, $4, 0x8
/* FE634 001FE534 04006014 */  bnez       $3, .L001FE548
/* FE638 001FE538 00000000 */   nop
/* FE63C 001FE53C 0C008128 */  slti       $at, $4, 0xC
/* FE640 001FE540 04002014 */  bnez       $at, .L001FE554
/* FE644 001FE544 00000000 */   nop
.L001FE548:
/* FE648 001FE548 0A000324 */  addiu      $3, $0, 0xA
/* FE64C 001FE54C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE650 001FE550 72EA23A4 */  sh         $3, -0x158E($at)
.L001FE554:
/* FE654 001FE554 06006386 */  lh         $3, 0x6($19)
/* FE658 001FE558 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE65C 001FE55C 90EA23AC */  sw         $3, -0x1570($at)
/* FE660 001FE560 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE664 001FE564 72EA2484 */  lh         $4, -0x158E($at)
/* FE668 001FE568 0B000324 */  addiu      $3, $0, 0xB
/* FE66C 001FE56C 7A008310 */  beq        $4, $3, .L001FE758
/* FE670 001FE570 00000000 */   nop
/* FE674 001FE574 08000324 */  addiu      $3, $0, 0x8
/* FE678 001FE578 44008310 */  beq        $4, $3, .L001FE68C
/* FE67C 001FE57C 00000000 */   nop
/* FE680 001FE580 0A000324 */  addiu      $3, $0, 0xA
/* FE684 001FE584 10008310 */  beq        $4, $3, .L001FE5C8
/* FE688 001FE588 00000000 */   nop
/* FE68C 001FE58C 09000324 */  addiu      $3, $0, 0x9
/* FE690 001FE590 03008310 */  beq        $4, $3, .L001FE5A0
/* FE694 001FE594 00000000 */   nop
/* FE698 001FE598 6F000010 */  b          .L001FE758
/* FE69C 001FE59C 00000000 */   nop
.L001FE5A0:
/* FE6A0 001FE5A0 FFFF2426 */  addiu      $4, $17, -0x1
/* FE6A4 001FE5A4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE6A8 001FE5A8 90EA238C */  lw         $3, -0x1570($at)
/* FE6AC 001FE5AC 2A088300 */  slt        $at, $4, $3
/* FE6B0 001FE5B0 69002010 */  beqz       $at, .L001FE758
/* FE6B4 001FE5B4 00000000 */   nop
/* FE6B8 001FE5B8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE6BC 001FE5BC 90EA24AC */  sw         $4, -0x1570($at)
/* FE6C0 001FE5C0 65000010 */  b          .L001FE758
/* FE6C4 001FE5C4 00000000 */   nop
.L001FE5C8:
/* FE6C8 001FE5C8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE6CC 001FE5CC 90EA248C */  lw         $4, -0x1570($at)
/* FE6D0 001FE5D0 05000324 */  addiu      $3, $0, 0x5
/* FE6D4 001FE5D4 1A008300 */  div        $0, $4, $3
/* FE6D8 001FE5D8 02006014 */  bnez       $3, .L001FE5E4
/* FE6DC 001FE5DC 00000000 */   nop
/* FE6E0 001FE5E0 CD010000 */  break      0, 7
.L001FE5E4:
/* FE6E4 001FE5E4 12180000 */  mflo       $3
/* FE6E8 001FE5E8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE6EC 001FE5EC 9CEA23AC */  sw         $3, -0x1564($at)
/* FE6F0 001FE5F0 05000324 */  addiu      $3, $0, 0x5
/* FE6F4 001FE5F4 1A004300 */  div        $0, $2, $3
/* FE6F8 001FE5F8 02006014 */  bnez       $3, .L001FE604
/* FE6FC 001FE5FC 00000000 */   nop
/* FE700 001FE600 CD010000 */  break      0, 7
.L001FE604:
/* FE704 001FE604 12180000 */  mflo       $3
/* FE708 001FE608 FCFF6424 */  addiu      $4, $3, -0x4
/* FE70C 001FE60C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE710 001FE610 9CEA238C */  lw         $3, -0x1564($at)
/* FE714 001FE614 2A088300 */  slt        $at, $4, $3
/* FE718 001FE618 4F002010 */  beqz       $at, .L001FE758
/* FE71C 001FE61C 00000000 */   nop
/* FE720 001FE620 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE724 001FE624 9CEA24AC */  sw         $4, -0x1564($at)
/* FE728 001FE628 06000010 */  b          .L001FE644
/* FE72C 001FE62C 00000000 */   nop
.L001FE630:
/* FE730 001FE630 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE734 001FE634 90EA238C */  lw         $3, -0x1570($at)
/* FE738 001FE638 FBFF6324 */  addiu      $3, $3, -0x5
/* FE73C 001FE63C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE740 001FE640 90EA23AC */  sw         $3, -0x1570($at)
.L001FE644:
/* FE744 001FE644 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE748 001FE648 90EA238C */  lw         $3, -0x1570($at)
/* FE74C 001FE64C 2A184300 */  slt        $3, $2, $3
/* FE750 001FE650 F7FF6014 */  bnez       $3, .L001FE630
/* FE754 001FE654 00000000 */   nop
/* FE758 001FE658 06000010 */  b          .L001FE674
/* FE75C 001FE65C 00000000 */   nop
.L001FE660:
/* FE760 001FE660 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE764 001FE664 90EA238C */  lw         $3, -0x1570($at)
/* FE768 001FE668 05006324 */  addiu      $3, $3, 0x5
/* FE76C 001FE66C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE770 001FE670 90EA23AC */  sw         $3, -0x1570($at)
.L001FE674:
/* FE774 001FE674 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE778 001FE678 90EA238C */  lw         $3, -0x1570($at)
/* FE77C 001FE67C F8FF6004 */  bltz       $3, .L001FE660
/* FE780 001FE680 00000000 */   nop
/* FE784 001FE684 34000010 */  b          .L001FE758
/* FE788 001FE688 00000000 */   nop
.L001FE68C:
/* FE78C 001FE68C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE790 001FE690 90EA20AC */  sw         $0, -0x1570($at)
/* FE794 001FE694 30000010 */  b          .L001FE758
/* FE798 001FE698 00000000 */   nop
.L001FE69C:
/* FE79C 001FE69C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE7A0 001FE6A0 90EA248C */  lw         $4, -0x1570($at)
/* FE7A4 001FE6A4 05000324 */  addiu      $3, $0, 0x5
/* FE7A8 001FE6A8 1A008300 */  div        $0, $4, $3
/* FE7AC 001FE6AC 02006014 */  bnez       $3, .L001FE6B8
/* FE7B0 001FE6B0 00000000 */   nop
/* FE7B4 001FE6B4 CD010000 */  break      0, 7
.L001FE6B8:
/* FE7B8 001FE6B8 12180000 */  mflo       $3
/* FE7BC 001FE6BC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE7C0 001FE6C0 9CEA23AC */  sw         $3, -0x1564($at)
/* FE7C4 001FE6C4 05000324 */  addiu      $3, $0, 0x5
/* FE7C8 001FE6C8 1A004300 */  div        $0, $2, $3
/* FE7CC 001FE6CC 02006014 */  bnez       $3, .L001FE6D8
/* FE7D0 001FE6D0 00000000 */   nop
/* FE7D4 001FE6D4 CD010000 */  break      0, 7
.L001FE6D8:
/* FE7D8 001FE6D8 12180000 */  mflo       $3
/* FE7DC 001FE6DC FCFF6424 */  addiu      $4, $3, -0x4
/* FE7E0 001FE6E0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE7E4 001FE6E4 9CEA238C */  lw         $3, -0x1564($at)
/* FE7E8 001FE6E8 2A088300 */  slt        $at, $4, $3
/* FE7EC 001FE6EC 1A002010 */  beqz       $at, .L001FE758
/* FE7F0 001FE6F0 00000000 */   nop
/* FE7F4 001FE6F4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE7F8 001FE6F8 9CEA24AC */  sw         $4, -0x1564($at)
/* FE7FC 001FE6FC 06000010 */  b          .L001FE718
/* FE800 001FE700 00000000 */   nop
.L001FE704:
/* FE804 001FE704 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE808 001FE708 90EA238C */  lw         $3, -0x1570($at)
/* FE80C 001FE70C FBFF6324 */  addiu      $3, $3, -0x5
/* FE810 001FE710 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE814 001FE714 90EA23AC */  sw         $3, -0x1570($at)
.L001FE718:
/* FE818 001FE718 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE81C 001FE71C 90EA238C */  lw         $3, -0x1570($at)
/* FE820 001FE720 2A184300 */  slt        $3, $2, $3
/* FE824 001FE724 F7FF6014 */  bnez       $3, .L001FE704
/* FE828 001FE728 00000000 */   nop
/* FE82C 001FE72C 06000010 */  b          .L001FE748
/* FE830 001FE730 00000000 */   nop
.L001FE734:
/* FE834 001FE734 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE838 001FE738 90EA238C */  lw         $3, -0x1570($at)
/* FE83C 001FE73C 05006324 */  addiu      $3, $3, 0x5
/* FE840 001FE740 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE844 001FE744 90EA23AC */  sw         $3, -0x1570($at)
.L001FE748:
/* FE848 001FE748 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE84C 001FE74C 90EA238C */  lw         $3, -0x1570($at)
/* FE850 001FE750 F8FF6004 */  bltz       $3, .L001FE734
/* FE854 001FE754 00000000 */   nop
.L001FE758:
/* FE858 001FE758 0500201E */  bgtz       $17, .L001FE770
/* FE85C 001FE75C 00000000 */   nop
/* FE860 001FE760 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE864 001FE764 76EA20A0 */  sb         $0, -0x158A($at)
/* FE868 001FE768 04000010 */  b          .L001FE77C
/* FE86C 001FE76C 00000000 */   nop
.L001FE770:
/* FE870 001FE770 01000324 */  addiu      $3, $0, 0x1
/* FE874 001FE774 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE878 001FE778 76EA23A0 */  sb         $3, -0x158A($at)
.L001FE77C:
/* FE87C 001FE77C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE880 001FE780 90EA238C */  lw         $3, -0x1570($at)
/* FE884 001FE784 03006104 */  bgez       $3, .L001FE794
/* FE888 001FE788 00000000 */   nop
/* FE88C 001FE78C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE890 001FE790 90EA20AC */  sw         $0, -0x1570($at)
.L001FE794:
/* FE894 001FE794 05000324 */  addiu      $3, $0, 0x5
/* FE898 001FE798 1A004300 */  div        $0, $2, $3
/* FE89C 001FE79C 02006014 */  bnez       $3, .L001FE7A8
/* FE8A0 001FE7A0 00000000 */   nop
/* FE8A4 001FE7A4 CD010000 */  break      0, 7
.L001FE7A8:
/* FE8A8 001FE7A8 12280000 */  mflo       $5
/* FE8AC 001FE7AC 7F000424 */  addiu      $4, $0, 0x7F
/* FE8B0 001FE7B0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE8B4 001FE7B4 9CEA238C */  lw         $3, -0x1564($at)
/* FE8B8 001FE7B8 80100300 */  sll        $2, $3, 2
/* FE8BC 001FE7BC 21104300 */  addu       $2, $2, $3
/* FE8C0 001FE7C0 C0100200 */  sll        $2, $2, 3
/* FE8C4 001FE7C4 23108200 */  subu       $2, $4, $2
/* FE8C8 001FE7C8 00008244 */  mtc1       $2, $f0
/* FE8CC 001FE7CC 00000000 */  nop
/* FE8D0 001FE7D0 20008046 */  cvt.s.w    $f0, $f0
/* FE8D4 001FE7D4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE8D8 001FE7D8 94EA20E4 */  swc1       $f0, -0x156C($at)
/* FE8DC 001FE7DC E442023C */  lui        $2, (0x42E40000 >> 16)
/* FE8E0 001FE7E0 00088244 */  mtc1       $2, $f1
/* FE8E4 001FE7E4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE8E8 001FE7E8 9CEA20C4 */  lwc1       $f0, -0x1564($at)
/* FE8EC 001FE7EC 20008046 */  cvt.s.w    $f0, $f0
/* FE8F0 001FE7F0 42080046 */  mul.s      $f1, $f1, $f0
/* FE8F4 001FE7F4 00008544 */  mtc1       $5, $f0
/* FE8F8 001FE7F8 00000000 */  nop
/* FE8FC 001FE7FC 20008046 */  cvt.s.w    $f0, $f0
/* FE900 001FE800 43080046 */  div.s      $f1, $f1, $f0
/* FE904 001FE804 0C43023C */  lui        $2, (0x430C0000 >> 16)
/* FE908 001FE808 00008244 */  mtc1       $2, $f0
/* FE90C 001FE80C 00000000 */  nop
/* FE910 001FE810 00000146 */  add.s      $f0, $f0, $f1
/* FE914 001FE814 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE918 001FE818 98EA20E4 */  swc1       $f0, -0x1568($at)
/* FE91C 001FE81C 01000424 */  addiu      $4, $0, 0x1
/* FE920 001FE820 BCB3080C */  jal        ComMenuSePlay__Fi
/* FE924 001FE824 00000000 */   nop
/* FE928 001FE828 18030010 */  b          .L001FF48C
/* FE92C 001FE82C 00000000 */   nop
/* FE930 001FE830 02000224 */  addiu      $2, $0, 0x2
/* FE934 001FE834 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE938 001FE838 72EA22A4 */  sh         $2, -0x158E($at)
/* FE93C 001FE83C 01000224 */  addiu      $2, $0, 0x1
/* FE940 001FE840 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE944 001FE844 E8EB22A0 */  sb         $2, -0x1418($at)
/* FE948 001FE848 16002282 */  lb         $2, 0x16($17)
/* FE94C 001FE84C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE950 001FE850 77EA22A0 */  sb         $2, -0x1589($at)
/* FE954 001FE854 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE958 001FE858 77EA2280 */  lb         $2, -0x1589($at)
/* FE95C 001FE85C 04004004 */  bltz       $2, .L001FE870
/* FE960 001FE860 00000000 */   nop
/* FE964 001FE864 05004128 */  slti       $at, $2, 0x5
/* FE968 001FE868 03002014 */  bnez       $at, .L001FE878
/* FE96C 001FE86C 00000000 */   nop
.L001FE870:
/* FE970 001FE870 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE974 001FE874 77EA20A0 */  sb         $0, -0x1589($at)
.L001FE878:
/* FE978 001FE878 01000424 */  addiu      $4, $0, 0x1
/* FE97C 001FE87C BCB3080C */  jal        ComMenuSePlay__Fi
/* FE980 001FE880 00000000 */   nop
/* FE984 001FE884 01030010 */  b          .L001FF48C
/* FE988 001FE888 00000000 */   nop
/* FE98C 001FE88C B1000424 */  addiu      $4, $0, 0xB1
/* FE990 001FE890 6095858F */  lw         $5, -0x6AA0($gp)
/* FE994 001FE894 4CC8080C */  jal        GetNowItemNum__FsP9ITEM_PACK
/* FE998 001FE898 00000000 */   nop
/* FE99C 001FE89C 0600401C */  bgtz       $2, .L001FE8B8
/* FE9A0 001FE8A0 00000000 */   nop
/* FE9A4 001FE8A4 02000424 */  addiu      $4, $0, 0x2
/* FE9A8 001FE8A8 BCB3080C */  jal        ComMenuSePlay__Fi
/* FE9AC 001FE8AC 00000000 */   nop
/* FE9B0 001FE8B0 F6020010 */  b          .L001FF48C
/* FE9B4 001FE8B4 00000000 */   nop
.L001FE8B8:
/* FE9B8 001FE8B8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FE9BC 001FE8BC 75EA2680 */  lb         $6, -0x158B($at)
/* FE9C0 001FE8C0 D494848F */  lw         $4, -0x6B2C($gp)
/* FE9C4 001FE8C4 B1000524 */  addiu      $5, $0, 0xB1
/* FE9C8 001FE8C8 04000724 */  addiu      $7, $0, 0x4
/* FE9CC 001FE8CC 28462072 */  paddub     $8, $17, $0
/* FE9D0 001FE8D0 F830080C */  jal        ItemUseFunc__FP11CUserStatusiiiP11WEAPON_HAVE
/* FE9D4 001FE8D4 00000000 */   nop
/* FE9D8 001FE8D8 02000424 */  addiu      $4, $0, 0x2
/* FE9DC 001FE8DC 26004414 */  bne        $2, $4, .L001FE978
/* FE9E0 001FE8E0 00000000 */   nop
/* FE9E4 001FE8E4 B1000424 */  addiu      $4, $0, 0xB1
/* FE9E8 001FE8E8 6095858F */  lw         $5, -0x6AA0($gp)
/* FE9EC 001FE8EC 70C8080C */  jal        DeleteItemAfterUseItem__FsP9ITEM_PACK
/* FE9F0 001FE8F0 00000000 */   nop
/* FE9F4 001FE8F4 18000424 */  addiu      $4, $0, 0x18
/* FE9F8 001FE8F8 BCB3080C */  jal        ComMenuSePlay__Fi
/* FE9FC 001FE8FC 00000000 */   nop
/* FEA00 001FE900 00002486 */  lh         $4, 0x0($17)
/* FEA04 001FE904 70CF070C */  jal        IsDefaultWeapon__Fi
/* FEA08 001FE908 00000000 */   nop
/* FEA0C 001FE90C 07004004 */  bltz       $2, .L001FE92C
/* FEA10 001FE910 00000000 */   nop
/* FEA14 001FE914 3C261300 */  dsll32     $4, $19, 24
/* FEA18 001FE918 3F260400 */  dsra32     $4, $4, 24
/* FEA1C 001FE91C 01000524 */  addiu      $5, $0, 0x1
/* FEA20 001FE920 2836A070 */  paddub     $6, $5, $0
/* FEA24 001FE924 1C35080C */  jal        SetMenuWeaponModelReference__Fiii
/* FEA28 001FE928 00000000 */   nop
.L001FE92C:
/* FEA2C 001FE92C 3C1E1300 */  dsll32     $3, $19, 24
/* FEA30 001FE930 3F1E0300 */  dsra32     $3, $3, 24
/* FEA34 001FE934 B0110224 */  addiu      $2, $0, 0x11B0
/* FEA38 001FE938 18186200 */  mult       $3, $3, $2
/* FEA3C 001FE93C D901023C */  lui        $2, %hi(DngWeaponFrm)
/* FEA40 001FE940 30164224 */  addiu      $2, $2, %lo(DngWeaponFrm)
/* FEA44 001FE944 21304300 */  addu       $6, $2, $3
/* FEA48 001FE948 DB01023C */  lui        $2, %hi(MenuWepLevelUp)
/* FEA4C 001FE94C E0A84424 */  addiu      $4, $2, %lo(MenuWepLevelUp)
/* FEA50 001FE950 282E2072 */  paddub     $5, $17, $0
/* FEA54 001FE954 1895878F */  lw         $7, -0x6AE8($gp)
/* FEA58 001FE958 F894888F */  lw         $8, -0x6B08($gp)
/* FEA5C 001FE95C 40DB080C */  jal        WepRecover__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
/* FEA60 001FE960 00000000 */   nop
/* FEA64 001FE964 0A000224 */  addiu      $2, $0, 0xA
/* FEA68 001FE968 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEA6C 001FE96C 7CEA22A4 */  sh         $2, -0x1584($at)
/* FEA70 001FE970 C6020010 */  b          .L001FF48C
/* FEA74 001FE974 00000000 */   nop
.L001FE978:
/* FEA78 001FE978 BCB3080C */  jal        ComMenuSePlay__Fi
/* FEA7C 001FE97C 00000000 */   nop
/* FEA80 001FE980 C2020010 */  b          .L001FF48C
/* FEA84 001FE984 00000000 */   nop
/* FEA88 001FE988 00003386 */  lh         $19, 0x0($17)
/* FEA8C 001FE98C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEA90 001FE990 75EA2480 */  lb         $4, -0x158B($at)
/* FEA94 001FE994 68CF070C */  jal        GetDefaultWeaponNo__Fi
/* FEA98 001FE998 00000000 */   nop
/* FEA9C 001FE99C 0C006216 */  bne        $19, $2, .L001FE9D0
/* FEAA0 001FE9A0 00000000 */   nop
/* FEAA4 001FE9A4 0B000224 */  addiu      $2, $0, 0xB
/* FEAA8 001FE9A8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEAAC 001FE9AC 7CEA22A4 */  sh         $2, -0x1584($at)
/* FEAB0 001FE9B0 07000224 */  addiu      $2, $0, 0x7
/* FEAB4 001FE9B4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEAB8 001FE9B8 78EA22A0 */  sb         $2, -0x1588($at)
/* FEABC 001FE9BC 02000424 */  addiu      $4, $0, 0x2
/* FEAC0 001FE9C0 BCB3080C */  jal        ComMenuSePlay__Fi
/* FEAC4 001FE9C4 00000000 */   nop
/* FEAC8 001FE9C8 B0020010 */  b          .L001FF48C
/* FEACC 001FE9CC 00000000 */   nop
.L001FE9D0:
/* FEAD0 001FE9D0 0C010224 */  addiu      $2, $0, 0x10C
/* FEAD4 001FE9D4 10006216 */  bne        $19, $2, .L001FEA18
/* FEAD8 001FE9D8 00000000 */   nop
/* FEADC 001FE9DC E02F080C */  jal        GetMenuHebikiriFlag__Fv
/* FEAE0 001FE9E0 00000000 */   nop
/* FEAE4 001FE9E4 0C004014 */  bnez       $2, .L001FEA18
/* FEAE8 001FE9E8 00000000 */   nop
/* FEAEC 001FE9EC 0B000224 */  addiu      $2, $0, 0xB
/* FEAF0 001FE9F0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEAF4 001FE9F4 7CEA22A4 */  sh         $2, -0x1584($at)
/* FEAF8 001FE9F8 05000224 */  addiu      $2, $0, 0x5
/* FEAFC 001FE9FC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEB00 001FEA00 78EA22A0 */  sb         $2, -0x1588($at)
/* FEB04 001FEA04 02000424 */  addiu      $4, $0, 0x2
/* FEB08 001FEA08 BCB3080C */  jal        ComMenuSePlay__Fi
/* FEB0C 001FEA0C 00000000 */   nop
/* FEB10 001FEA10 9E020010 */  b          .L001FF48C
/* FEB14 001FEA14 00000000 */   nop
.L001FEA18:
/* FEB18 001FEA18 02002286 */  lh         $2, 0x2($17)
/* FEB1C 001FEA1C 63004228 */  slti       $2, $2, 0x63
/* FEB20 001FEA20 0C004014 */  bnez       $2, .L001FEA54
/* FEB24 001FEA24 00000000 */   nop
/* FEB28 001FEA28 0B000224 */  addiu      $2, $0, 0xB
/* FEB2C 001FEA2C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEB30 001FEA30 7CEA22A4 */  sh         $2, -0x1584($at)
/* FEB34 001FEA34 08000224 */  addiu      $2, $0, 0x8
/* FEB38 001FEA38 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEB3C 001FEA3C 78EA22A0 */  sb         $2, -0x1588($at)
/* FEB40 001FEA40 02000424 */  addiu      $4, $0, 0x2
/* FEB44 001FEA44 BCB3080C */  jal        ComMenuSePlay__Fi
/* FEB48 001FEA48 00000000 */   nop
/* FEB4C 001FEA4C 8F020010 */  b          .L001FF48C
/* FEB50 001FEA50 00000000 */   nop
.L001FEA54:
/* FEB54 001FEA54 03000224 */  addiu      $2, $0, 0x3
/* FEB58 001FEA58 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEB5C 001FEA5C 72EA22A4 */  sh         $2, -0x158E($at)
/* FEB60 001FEA60 01000424 */  addiu      $4, $0, 0x1
/* FEB64 001FEA64 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEB68 001FEA68 90EA24AC */  sw         $4, -0x1570($at)
/* FEB6C 001FEA6C BCB3080C */  jal        ComMenuSePlay__Fi
/* FEB70 001FEA70 00000000 */   nop
/* FEB74 001FEA74 85020010 */  b          .L001FF48C
/* FEB78 001FEA78 00000000 */   nop
/* FEB7C 001FEA7C D494828F */  lw         $2, -0x6B2C($gp)
/* FEB80 001FEA80 04054524 */  addiu      $5, $2, 0x504
/* FEB84 001FEA84 F87FA524 */  addiu      $5, $5, 0x7FF8
/* FEB88 001FEA88 281E0070 */  paddub     $3, $0, $0
/* FEB8C 001FEA8C 28260070 */  paddub     $4, $0, $0
/* FEB90 001FEA90 09000010 */  b          .L001FEAB8
/* FEB94 001FEA94 00000000 */   nop
.L001FEA98:
/* FEB98 001FEA98 40110400 */  sll        $2, $4, 5
/* FEB9C 001FEA9C 2110A200 */  addu       $2, $5, $2
/* FEBA0 001FEAA0 00004284 */  lh         $2, 0x0($2)
/* FEBA4 001FEAA4 51004228 */  slti       $2, $2, 0x51
/* FEBA8 001FEAA8 02004014 */  bnez       $2, .L001FEAB4
/* FEBAC 001FEAAC 00000000 */   nop
/* FEBB0 001FEAB0 01006324 */  addiu      $3, $3, 0x1
.L001FEAB4:
/* FEBB4 001FEAB4 01008424 */  addiu      $4, $4, 0x1
.L001FEAB8:
/* FEBB8 001FEAB8 28008228 */  slti       $2, $4, 0x28
/* FEBBC 001FEABC F6FF4014 */  bnez       $2, .L001FEA98
/* FEBC0 001FEAC0 00000000 */   nop
/* FEBC4 001FEAC4 28006228 */  slti       $2, $3, 0x28
/* FEBC8 001FEAC8 0C004014 */  bnez       $2, .L001FEAFC
/* FEBCC 001FEACC 00000000 */   nop
/* FEBD0 001FEAD0 0B000224 */  addiu      $2, $0, 0xB
/* FEBD4 001FEAD4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEBD8 001FEAD8 7CEA22A4 */  sh         $2, -0x1584($at)
/* FEBDC 001FEADC 01000224 */  addiu      $2, $0, 0x1
/* FEBE0 001FEAE0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEBE4 001FEAE4 78EA22A0 */  sb         $2, -0x1588($at)
/* FEBE8 001FEAE8 02000424 */  addiu      $4, $0, 0x2
/* FEBEC 001FEAEC BCB3080C */  jal        ComMenuSePlay__Fi
/* FEBF0 001FEAF0 00000000 */   nop
/* FEBF4 001FEAF4 65020010 */  b          .L001FF48C
/* FEBF8 001FEAF8 00000000 */   nop
.L001FEAFC:
/* FEBFC 001FEAFC 04000224 */  addiu      $2, $0, 0x4
/* FEC00 001FEB00 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEC04 001FEB04 72EA22A4 */  sh         $2, -0x158E($at)
/* FEC08 001FEB08 01000424 */  addiu      $4, $0, 0x1
/* FEC0C 001FEB0C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEC10 001FEB10 90EA24AC */  sw         $4, -0x1570($at)
/* FEC14 001FEB14 BCB3080C */  jal        ComMenuSePlay__Fi
/* FEC18 001FEB18 00000000 */   nop
/* FEC1C 001FEB1C 5B020010 */  b          .L001FF48C
/* FEC20 001FEB20 00000000 */   nop
/* FEC24 001FEB24 05000224 */  addiu      $2, $0, 0x5
/* FEC28 001FEB28 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEC2C 001FEB2C 72EA22A4 */  sh         $2, -0x158E($at)
/* FEC30 001FEB30 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEC34 001FEB34 90EA20AC */  sw         $0, -0x1570($at)
/* FEC38 001FEB38 01000424 */  addiu      $4, $0, 0x1
/* FEC3C 001FEB3C BCB3080C */  jal        ComMenuSePlay__Fi
/* FEC40 001FEB40 00000000 */   nop
/* FEC44 001FEB44 51020010 */  b          .L001FF48C
/* FEC48 001FEB48 00000000 */   nop
.L001FEB4C:
/* FEC4C 001FEB4C CC01023C */  lui        $2, %hi(GamePad)
/* FEC50 001FEB50 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FEC54 001FEB54 20000524 */  addiu      $5, $0, 0x20
/* FEC58 001FEB58 1CAE040C */  jal        Down__8CGamePadFi
/* FEC5C 001FEB5C 00000000 */   nop
/* FEC60 001FEB60 4A024010 */  beqz       $2, .L001FF48C
/* FEC64 001FEB64 00000000 */   nop
/* FEC68 001FEB68 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEC6C 001FEB6C 72EA20A4 */  sh         $0, -0x158E($at)
/* FEC70 001FEB70 02000424 */  addiu      $4, $0, 0x2
/* FEC74 001FEB74 BCB3080C */  jal        ComMenuSePlay__Fi
/* FEC78 001FEB78 00000000 */   nop
/* FEC7C 001FEB7C 43020010 */  b          .L001FF48C
/* FEC80 001FEB80 00000000 */   nop
/* FEC84 001FEB84 01000224 */  addiu      $2, $0, 0x1
/* FEC88 001FEB88 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEC8C 001FEB8C E8EB22A0 */  sb         $2, -0x1418($at)
/* FEC90 001FEB90 CC01023C */  lui        $2, %hi(GamePad)
/* FEC94 001FEB94 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FEC98 001FEB98 0F000524 */  addiu      $5, $0, 0xF
/* FEC9C 001FEB9C 1CAE040C */  jal        Down__8CGamePadFi
/* FECA0 001FEBA0 00000000 */   nop
/* FECA4 001FEBA4 04004010 */  beqz       $2, .L001FEBB8
/* FECA8 001FEBA8 00000000 */   nop
/* FECAC 001FEBAC 02000424 */  addiu      $4, $0, 0x2
/* FECB0 001FEBB0 BCB3080C */  jal        ComMenuSePlay__Fi
/* FECB4 001FEBB4 00000000 */   nop
.L001FEBB8:
/* FECB8 001FEBB8 CC01023C */  lui        $2, %hi(GamePad)
/* FECBC 001FEBBC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FECC0 001FEBC0 00100524 */  addiu      $5, $0, 0x1000
/* FECC4 001FEBC4 1CAE040C */  jal        Down__8CGamePadFi
/* FECC8 001FEBC8 00000000 */   nop
/* FECCC 001FEBCC 09004010 */  beqz       $2, .L001FEBF4
/* FECD0 001FEBD0 00000000 */   nop
/* FECD4 001FEBD4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FECD8 001FEBD8 77EA2280 */  lb         $2, -0x1589($at)
/* FECDC 001FEBDC 2A080200 */  slt        $at, $0, $2
/* FECE0 001FEBE0 04002010 */  beqz       $at, .L001FEBF4
/* FECE4 001FEBE4 00000000 */   nop
/* FECE8 001FEBE8 FFFF4224 */  addiu      $2, $2, -0x1
/* FECEC 001FEBEC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FECF0 001FEBF0 77EA22A0 */  sb         $2, -0x1589($at)
.L001FEBF4:
/* FECF4 001FEBF4 CC01023C */  lui        $2, %hi(GamePad)
/* FECF8 001FEBF8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FECFC 001FEBFC 00400524 */  addiu      $5, $0, 0x4000
/* FED00 001FEC00 1CAE040C */  jal        Down__8CGamePadFi
/* FED04 001FEC04 00000000 */   nop
/* FED08 001FEC08 09004010 */  beqz       $2, .L001FEC30
/* FED0C 001FEC0C 00000000 */   nop
/* FED10 001FEC10 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FED14 001FEC14 77EA2280 */  lb         $2, -0x1589($at)
/* FED18 001FEC18 04004128 */  slti       $at, $2, 0x4
/* FED1C 001FEC1C 04002010 */  beqz       $at, .L001FEC30
/* FED20 001FEC20 00000000 */   nop
/* FED24 001FEC24 01004224 */  addiu      $2, $2, 0x1
/* FED28 001FEC28 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FED2C 001FEC2C 77EA22A0 */  sb         $2, -0x1589($at)
.L001FEC30:
/* FED30 001FEC30 CC01023C */  lui        $2, %hi(GamePad)
/* FED34 001FEC34 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FED38 001FEC38 40000524 */  addiu      $5, $0, 0x40
/* FED3C 001FEC3C 1CAE040C */  jal        Down__8CGamePadFi
/* FED40 001FEC40 00000000 */   nop
/* FED44 001FEC44 1B004010 */  beqz       $2, .L001FECB4
/* FED48 001FEC48 00000000 */   nop
/* FED4C 001FEC4C C0CF070C */  jal        GetNowSelectWeapon__Fv
/* FED50 001FEC50 00000000 */   nop
/* FED54 001FEC54 288E4070 */  paddub     $17, $2, $0
/* FED58 001FEC58 28262072 */  paddub     $4, $17, $0
/* FED5C 001FEC5C 6000A527 */  addiu      $5, $sp, 0x60
/* FED60 001FEC60 28360070 */  paddub     $6, $0, $0
/* FED64 001FEC64 D896080C */  jal        WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi
/* FED68 001FEC68 00000000 */   nop
/* FED6C 001FEC6C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FED70 001FEC70 77EA2680 */  lb         $6, -0x1589($at)
/* FED74 001FEC74 28262072 */  paddub     $4, $17, $0
/* FED78 001FEC78 6000A527 */  addiu      $5, $sp, 0x60
/* FED7C 001FEC7C 44F0070C */  jal        WeaponMenuCheckEnableSetElem__FP11WEAPON_HAVEP11WEAPON_HAVEi
/* FED80 001FEC80 00000000 */   nop
/* FED84 001FEC84 06004010 */  beqz       $2, .L001FECA0
/* FED88 001FEC88 00000000 */   nop
/* FED8C 001FEC8C 02000424 */  addiu      $4, $0, 0x2
/* FED90 001FEC90 BCB3080C */  jal        ComMenuSePlay__Fi
/* FED94 001FEC94 00000000 */   nop
/* FED98 001FEC98 FC010010 */  b          .L001FF48C
/* FED9C 001FEC9C 00000000 */   nop
.L001FECA0:
/* FEDA0 001FECA0 01000424 */  addiu      $4, $0, 0x1
/* FEDA4 001FECA4 BCB3080C */  jal        ComMenuSePlay__Fi
/* FEDA8 001FECA8 00000000 */   nop
/* FEDAC 001FECAC F7010010 */  b          .L001FF48C
/* FEDB0 001FECB0 00000000 */   nop
.L001FECB4:
/* FEDB4 001FECB4 CC01023C */  lui        $2, %hi(GamePad)
/* FEDB8 001FECB8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FEDBC 001FECBC 20000524 */  addiu      $5, $0, 0x20
/* FEDC0 001FECC0 1CAE040C */  jal        Down__8CGamePadFi
/* FEDC4 001FECC4 00000000 */   nop
/* FEDC8 001FECC8 F0014010 */  beqz       $2, .L001FF48C
/* FEDCC 001FECCC 00000000 */   nop
/* FEDD0 001FECD0 01000224 */  addiu      $2, $0, 0x1
/* FEDD4 001FECD4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEDD8 001FECD8 72EA22A4 */  sh         $2, -0x158E($at)
/* FEDDC 001FECDC D894828F */  lw         $2, -0x6B28($gp)
/* FEDE0 001FECE0 0E004014 */  bnez       $2, .L001FED1C
/* FEDE4 001FECE4 00000000 */   nop
/* FEDE8 001FECE8 D494828F */  lw         $2, -0x6B2C($gp)
/* FEDEC 001FECEC 04004280 */  lb         $2, 0x4($2)
/* FEDF0 001FECF0 03000324 */  addiu      $3, $0, 0x3
/* FEDF4 001FECF4 09004314 */  bne        $2, $3, .L001FED1C
/* FEDF8 001FECF8 00000000 */   nop
/* FEDFC 001FECFC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEE00 001FED00 75EA2280 */  lb         $2, -0x158B($at)
/* FEE04 001FED04 05004314 */  bne        $2, $3, .L001FED1C
/* FEE08 001FED08 00000000 */   nop
/* FEE0C 001FED0C 30FB040C */  jal        StartReadBG__Fv
/* FEE10 001FED10 00000000 */   nop
/* FEE14 001FED14 2C34080C */  jal        DngWepEffectReadStart__Fv
/* FEE18 001FED18 00000000 */   nop
.L001FED1C:
/* FEE1C 001FED1C 02000424 */  addiu      $4, $0, 0x2
/* FEE20 001FED20 BCB3080C */  jal        ComMenuSePlay__Fi
/* FEE24 001FED24 00000000 */   nop
/* FEE28 001FED28 D8010010 */  b          .L001FF48C
/* FEE2C 001FED2C 00000000 */   nop
/* FEE30 001FED30 CC01023C */  lui        $2, %hi(GamePad)
/* FEE34 001FED34 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FEE38 001FED38 00500524 */  addiu      $5, $0, 0x5000
/* FEE3C 001FED3C 1CAE040C */  jal        Down__8CGamePadFi
/* FEE40 001FED40 00000000 */   nop
/* FEE44 001FED44 0C004010 */  beqz       $2, .L001FED78
/* FEE48 001FED48 00000000 */   nop
/* FEE4C 001FED4C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEE50 001FED50 90EA228C */  lw         $2, -0x1570($at)
/* FEE54 001FED54 05004010 */  beqz       $2, .L001FED6C
/* FEE58 001FED58 00000000 */   nop
/* FEE5C 001FED5C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEE60 001FED60 90EA20AC */  sw         $0, -0x1570($at)
/* FEE64 001FED64 04000010 */  b          .L001FED78
/* FEE68 001FED68 00000000 */   nop
.L001FED6C:
/* FEE6C 001FED6C 01000224 */  addiu      $2, $0, 0x1
/* FEE70 001FED70 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEE74 001FED74 90EA22AC */  sw         $2, -0x1570($at)
.L001FED78:
/* FEE78 001FED78 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEE7C 001FED7C 90EA228C */  lw         $2, -0x1570($at)
/* FEE80 001FED80 34004014 */  bnez       $2, .L001FEE54
/* FEE84 001FED84 00000000 */   nop
/* FEE88 001FED88 CC01023C */  lui        $2, %hi(GamePad)
/* FEE8C 001FED8C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FEE90 001FED90 40000524 */  addiu      $5, $0, 0x40
/* FEE94 001FED94 1CAE040C */  jal        Down__8CGamePadFi
/* FEE98 001FED98 00000000 */   nop
/* FEE9C 001FED9C 2D004010 */  beqz       $2, .L001FEE54
/* FEEA0 001FEDA0 00000000 */   nop
/* FEEA4 001FEDA4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEEA8 001FEDA8 74EA3380 */  lb         $19, -0x158C($at)
/* FEEAC 001FEDAC 40111300 */  sll        $2, $19, 5
/* FEEB0 001FEDB0 23105300 */  subu       $2, $2, $19
/* FEEB4 001FEDB4 C0880200 */  sll        $17, $2, 3
/* FEEB8 001FEDB8 1495828F */  lw         $2, -0x6AEC($gp)
/* FEEBC 001FEDBC 21205100 */  addu       $4, $2, $17
/* FEEC0 001FEDC0 20C8080C */  jal        GetWeaponMaxExp__FP11WEAPON_HAVE
/* FEEC4 001FEDC4 00000000 */   nop
/* FEEC8 001FEDC8 1495838F */  lw         $3, -0x6AEC($gp)
/* FEECC 001FEDCC 21182302 */  addu       $3, $17, $3
/* FEED0 001FEDD0 14006384 */  lh         $3, 0x14($3)
/* FEED4 001FEDD4 2A106200 */  slt        $2, $3, $2
/* FEED8 001FEDD8 05004010 */  beqz       $2, .L001FEDF0
/* FEEDC 001FEDDC 00000000 */   nop
/* FEEE0 001FEDE0 B2000424 */  addiu      $4, $0, 0xB2
/* FEEE4 001FEDE4 6095858F */  lw         $5, -0x6AA0($gp)
/* FEEE8 001FEDE8 70C8080C */  jal        DeleteItemAfterUseItem__FsP9ITEM_PACK
/* FEEEC 001FEDEC 00000000 */   nop
.L001FEDF0:
/* FEEF0 001FEDF0 1495828F */  lw         $2, -0x6AEC($gp)
/* FEEF4 001FEDF4 21285100 */  addu       $5, $2, $17
/* FEEF8 001FEDF8 B0110224 */  addiu      $2, $0, 0x11B0
/* FEEFC 001FEDFC 18186202 */  mult       $3, $19, $2
/* FEF00 001FEE00 D901023C */  lui        $2, %hi(DngWeaponFrm)
/* FEF04 001FEE04 30164224 */  addiu      $2, $2, %lo(DngWeaponFrm)
/* FEF08 001FEE08 21304300 */  addu       $6, $2, $3
/* FEF0C 001FEE0C DB01023C */  lui        $2, %hi(MenuWepLevelUp)
/* FEF10 001FEE10 E0A84424 */  addiu      $4, $2, %lo(MenuWepLevelUp)
/* FEF14 001FEE14 1895878F */  lw         $7, -0x6AE8($gp)
/* FEF18 001FEE18 F894888F */  lw         $8, -0x6B08($gp)
/* FEF1C 001FEE1C A0D8080C */  jal        SetLevelUpValue__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
/* FEF20 001FEE20 00000000 */   nop
/* FEF24 001FEE24 07000224 */  addiu      $2, $0, 0x7
/* FEF28 001FEE28 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEF2C 001FEE2C 7CEA22A4 */  sh         $2, -0x1584($at)
/* FEF30 001FEE30 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEF34 001FEE34 72EA20A4 */  sh         $0, -0x158E($at)
/* FEF38 001FEE38 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEF3C 001FEE3C 90EA20AC */  sw         $0, -0x1570($at)
/* FEF40 001FEE40 01000424 */  addiu      $4, $0, 0x1
/* FEF44 001FEE44 BCB3080C */  jal        ComMenuSePlay__Fi
/* FEF48 001FEE48 00000000 */   nop
/* FEF4C 001FEE4C 8F010010 */  b          .L001FF48C
/* FEF50 001FEE50 00000000 */   nop
.L001FEE54:
/* FEF54 001FEE54 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEF58 001FEE58 90EA238C */  lw         $3, -0x1570($at)
/* FEF5C 001FEE5C 01000224 */  addiu      $2, $0, 0x1
/* FEF60 001FEE60 08006214 */  bne        $3, $2, .L001FEE84
/* FEF64 001FEE64 00000000 */   nop
/* FEF68 001FEE68 CC01023C */  lui        $2, %hi(GamePad)
/* FEF6C 001FEE6C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FEF70 001FEE70 40000524 */  addiu      $5, $0, 0x40
/* FEF74 001FEE74 1CAE040C */  jal        Down__8CGamePadFi
/* FEF78 001FEE78 00000000 */   nop
/* FEF7C 001FEE7C 08004014 */  bnez       $2, .L001FEEA0
/* FEF80 001FEE80 00000000 */   nop
.L001FEE84:
/* FEF84 001FEE84 CC01023C */  lui        $2, %hi(GamePad)
/* FEF88 001FEE88 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FEF8C 001FEE8C 20000524 */  addiu      $5, $0, 0x20
/* FEF90 001FEE90 1CAE040C */  jal        Down__8CGamePadFi
/* FEF94 001FEE94 00000000 */   nop
/* FEF98 001FEE98 7C014010 */  beqz       $2, .L001FF48C
/* FEF9C 001FEE9C 00000000 */   nop
.L001FEEA0:
/* FEFA0 001FEEA0 01000224 */  addiu      $2, $0, 0x1
/* FEFA4 001FEEA4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEFA8 001FEEA8 72EA22A4 */  sh         $2, -0x158E($at)
/* FEFAC 001FEEAC 04000224 */  addiu      $2, $0, 0x4
/* FEFB0 001FEEB0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEFB4 001FEEB4 90EA22AC */  sw         $2, -0x1570($at)
/* FEFB8 001FEEB8 02000424 */  addiu      $4, $0, 0x2
/* FEFBC 001FEEBC BCB3080C */  jal        ComMenuSePlay__Fi
/* FEFC0 001FEEC0 00000000 */   nop
/* FEFC4 001FEEC4 71010010 */  b          .L001FF48C
/* FEFC8 001FEEC8 00000000 */   nop
/* FEFCC 001FEECC CC01023C */  lui        $2, %hi(GamePad)
/* FEFD0 001FEED0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FEFD4 001FEED4 00500524 */  addiu      $5, $0, 0x5000
/* FEFD8 001FEED8 1CAE040C */  jal        Down__8CGamePadFi
/* FEFDC 001FEEDC 00000000 */   nop
/* FEFE0 001FEEE0 0C004010 */  beqz       $2, .L001FEF14
/* FEFE4 001FEEE4 00000000 */   nop
/* FEFE8 001FEEE8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEFEC 001FEEEC 90EA228C */  lw         $2, -0x1570($at)
/* FEFF0 001FEEF0 05004010 */  beqz       $2, .L001FEF08
/* FEFF4 001FEEF4 00000000 */   nop
/* FEFF8 001FEEF8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FEFFC 001FEEFC 90EA20AC */  sw         $0, -0x1570($at)
/* FF000 001FEF00 04000010 */  b          .L001FEF14
/* FF004 001FEF04 00000000 */   nop
.L001FEF08:
/* FF008 001FEF08 01000224 */  addiu      $2, $0, 0x1
/* FF00C 001FEF0C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF010 001FEF10 90EA22AC */  sw         $2, -0x1570($at)
.L001FEF14:
/* FF014 001FEF14 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF018 001FEF18 90EA238C */  lw         $3, -0x1570($at)
/* FF01C 001FEF1C 01000224 */  addiu      $2, $0, 0x1
/* FF020 001FEF20 08006214 */  bne        $3, $2, .L001FEF44
/* FF024 001FEF24 00000000 */   nop
/* FF028 001FEF28 CC01023C */  lui        $2, %hi(GamePad)
/* FF02C 001FEF2C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF030 001FEF30 40000524 */  addiu      $5, $0, 0x40
/* FF034 001FEF34 1CAE040C */  jal        Down__8CGamePadFi
/* FF038 001FEF38 00000000 */   nop
/* FF03C 001FEF3C 08004014 */  bnez       $2, .L001FEF60
/* FF040 001FEF40 00000000 */   nop
.L001FEF44:
/* FF044 001FEF44 CC01023C */  lui        $2, %hi(GamePad)
/* FF048 001FEF48 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF04C 001FEF4C 20000524 */  addiu      $5, $0, 0x20
/* FF050 001FEF50 1CAE040C */  jal        Down__8CGamePadFi
/* FF054 001FEF54 00000000 */   nop
/* FF058 001FEF58 0C004010 */  beqz       $2, .L001FEF8C
/* FF05C 001FEF5C 00000000 */   nop
.L001FEF60:
/* FF060 001FEF60 01000224 */  addiu      $2, $0, 0x1
/* FF064 001FEF64 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF068 001FEF68 72EA22A4 */  sh         $2, -0x158E($at)
/* FF06C 001FEF6C 05000224 */  addiu      $2, $0, 0x5
/* FF070 001FEF70 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF074 001FEF74 90EA22AC */  sw         $2, -0x1570($at)
/* FF078 001FEF78 02000424 */  addiu      $4, $0, 0x2
/* FF07C 001FEF7C BCB3080C */  jal        ComMenuSePlay__Fi
/* FF080 001FEF80 00000000 */   nop
/* FF084 001FEF84 41010010 */  b          .L001FF48C
/* FF088 001FEF88 00000000 */   nop
.L001FEF8C:
/* FF08C 001FEF8C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF090 001FEF90 90EA228C */  lw         $2, -0x1570($at)
/* FF094 001FEF94 3D014014 */  bnez       $2, .L001FF48C
/* FF098 001FEF98 00000000 */   nop
/* FF09C 001FEF9C CC01023C */  lui        $2, %hi(GamePad)
/* FF0A0 001FEFA0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF0A4 001FEFA4 40000524 */  addiu      $5, $0, 0x40
/* FF0A8 001FEFA8 1CAE040C */  jal        Down__8CGamePadFi
/* FF0AC 001FEFAC 00000000 */   nop
/* FF0B0 001FEFB0 36014010 */  beqz       $2, .L001FF48C
/* FF0B4 001FEFB4 00000000 */   nop
/* FF0B8 001FEFB8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF0BC 001FEFBC 74EA2480 */  lb         $4, -0x158C($at)
/* FF0C0 001FEFC0 D901013C */  lui        $at, (0x1D90418 >> 16)
/* FF0C4 001FEFC4 1804228C */  lw         $2, (0x1D90418 & 0xFFFF)($at)
/* FF0C8 001FEFC8 00190200 */  sll        $3, $2, 4
/* FF0CC 001FEFCC D901013C */  lui        $at, (0x1D90410 >> 16)
/* FF0D0 001FEFD0 1004228C */  lw         $2, (0x1D90410 & 0xFFFF)($at)
/* FF0D4 001FEFD4 21384300 */  addu       $7, $2, $3
/* FF0D8 001FEFD8 40110400 */  sll        $2, $4, 5
/* FF0DC 001FEFDC 23104400 */  subu       $2, $2, $4
/* FF0E0 001FEFE0 C0180200 */  sll        $3, $2, 3
/* FF0E4 001FEFE4 1495828F */  lw         $2, -0x6AEC($gp)
/* FF0E8 001FEFE8 21284300 */  addu       $5, $2, $3
/* FF0EC 001FEFEC B0110224 */  addiu      $2, $0, 0x11B0
/* FF0F0 001FEFF0 18188200 */  mult       $3, $4, $2
/* FF0F4 001FEFF4 D901023C */  lui        $2, %hi(DngWeaponFrm)
/* FF0F8 001FEFF8 30164224 */  addiu      $2, $2, %lo(DngWeaponFrm)
/* FF0FC 001FEFFC 21304300 */  addu       $6, $2, $3
/* FF100 001FF000 DB01023C */  lui        $2, %hi(MenuWepLevelUp)
/* FF104 001FF004 E0A84424 */  addiu      $4, $2, %lo(MenuWepLevelUp)
/* FF108 001FF008 F894888F */  lw         $8, -0x6B08($gp)
/* FF10C 001FF00C 34DA080C */  jal        SetStatusBreak__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
/* FF110 001FF010 00000000 */   nop
/* FF114 001FF014 08000224 */  addiu      $2, $0, 0x8
/* FF118 001FF018 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF11C 001FF01C 7CEA22A4 */  sh         $2, -0x1584($at)
/* FF120 001FF020 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF124 001FF024 72EA20A4 */  sh         $0, -0x158E($at)
/* FF128 001FF028 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF12C 001FF02C 90EA20AC */  sw         $0, -0x1570($at)
/* FF130 001FF030 01000424 */  addiu      $4, $0, 0x1
/* FF134 001FF034 BCB3080C */  jal        ComMenuSePlay__Fi
/* FF138 001FF038 00000000 */   nop
/* FF13C 001FF03C 13010010 */  b          .L001FF48C
/* FF140 001FF040 00000000 */   nop
/* FF144 001FF044 C0CF070C */  jal        GetNowSelectWeapon__Fv
/* FF148 001FF048 00000000 */   nop
/* FF14C 001FF04C 288E4070 */  paddub     $17, $2, $0
/* FF150 001FF050 6001A427 */  addiu      $4, $sp, 0x160
/* FF154 001FF054 282E2072 */  paddub     $5, $17, $0
/* FF158 001FF058 20D5080C */  jal        EnableBuildUpModel__FP16WEP_BUILDUP_INFOP11WEAPON_HAVE
/* FF15C 001FF05C 00000000 */   nop
/* FF160 001FF060 28262072 */  paddub     $4, $17, $0
/* FF164 001FF064 7C01A527 */  addiu      $5, $sp, 0x17C
/* FF168 001FF068 9C33080C */  jal        WeaponStatusBuildUp__FP11WEAPON_HAVERi
/* FF16C 001FF06C 00000000 */   nop
/* FF170 001FF070 289E4070 */  paddub     $19, $2, $0
/* FF174 001FF074 CC01023C */  lui        $2, %hi(GamePad)
/* FF178 001FF078 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF17C 001FF07C 00100524 */  addiu      $5, $0, 0x1000
/* FF180 001FF080 1CAE040C */  jal        Down__8CGamePadFi
/* FF184 001FF084 00000000 */   nop
/* FF188 001FF088 06004010 */  beqz       $2, .L001FF0A4
/* FF18C 001FF08C 00000000 */   nop
/* FF190 001FF090 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF194 001FF094 90EA228C */  lw         $2, -0x1570($at)
/* FF198 001FF098 FFFF4224 */  addiu      $2, $2, -0x1
/* FF19C 001FF09C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF1A0 001FF0A0 90EA22AC */  sw         $2, -0x1570($at)
.L001FF0A4:
/* FF1A4 001FF0A4 CC01023C */  lui        $2, %hi(GamePad)
/* FF1A8 001FF0A8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF1AC 001FF0AC 00400524 */  addiu      $5, $0, 0x4000
/* FF1B0 001FF0B0 1CAE040C */  jal        Down__8CGamePadFi
/* FF1B4 001FF0B4 00000000 */   nop
/* FF1B8 001FF0B8 06004010 */  beqz       $2, .L001FF0D4
/* FF1BC 001FF0BC 00000000 */   nop
/* FF1C0 001FF0C0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF1C4 001FF0C4 90EA228C */  lw         $2, -0x1570($at)
/* FF1C8 001FF0C8 01004224 */  addiu      $2, $2, 0x1
/* FF1CC 001FF0CC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF1D0 001FF0D0 90EA22AC */  sw         $2, -0x1570($at)
.L001FF0D4:
/* FF1D4 001FF0D4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF1D8 001FF0D8 90EA228C */  lw         $2, -0x1570($at)
/* FF1DC 001FF0DC 04004104 */  bgez       $2, .L001FF0F0
/* FF1E0 001FF0E0 00000000 */   nop
/* FF1E4 001FF0E4 FFFF6226 */  addiu      $2, $19, -0x1
/* FF1E8 001FF0E8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF1EC 001FF0EC 90EA22AC */  sw         $2, -0x1570($at)
.L001FF0F0:
/* FF1F0 001FF0F0 FFFF6326 */  addiu      $3, $19, -0x1
/* FF1F4 001FF0F4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF1F8 001FF0F8 90EA228C */  lw         $2, -0x1570($at)
/* FF1FC 001FF0FC 2A086200 */  slt        $at, $3, $2
/* FF200 001FF100 03002010 */  beqz       $at, .L001FF110
/* FF204 001FF104 00000000 */   nop
/* FF208 001FF108 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF20C 001FF10C 90EA20AC */  sw         $0, -0x1570($at)
.L001FF110:
/* FF210 001FF110 CC01023C */  lui        $2, %hi(GamePad)
/* FF214 001FF114 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF218 001FF118 20000524 */  addiu      $5, $0, 0x20
/* FF21C 001FF11C 1CAE040C */  jal        Down__8CGamePadFi
/* FF220 001FF120 00000000 */   nop
/* FF224 001FF124 09004010 */  beqz       $2, .L001FF14C
/* FF228 001FF128 00000000 */   nop
/* FF22C 001FF12C 06000224 */  addiu      $2, $0, 0x6
/* FF230 001FF130 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF234 001FF134 90EA22AC */  sw         $2, -0x1570($at)
/* FF238 001FF138 01000224 */  addiu      $2, $0, 0x1
/* FF23C 001FF13C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF240 001FF140 72EA22A4 */  sh         $2, -0x158E($at)
/* FF244 001FF144 D1000010 */  b          .L001FF48C
/* FF248 001FF148 00000000 */   nop
.L001FF14C:
/* FF24C 001FF14C CC01023C */  lui        $2, %hi(GamePad)
/* FF250 001FF150 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF254 001FF154 40000524 */  addiu      $5, $0, 0x40
/* FF258 001FF158 1CAE040C */  jal        Down__8CGamePadFi
/* FF25C 001FF15C 00000000 */   nop
/* FF260 001FF160 CA004010 */  beqz       $2, .L001FF48C
/* FF264 001FF164 00000000 */   nop
/* FF268 001FF168 289E0070 */  paddub     $19, $0, $0
/* FF26C 001FF16C 28A60070 */  paddub     $20, $0, $0
/* FF270 001FF170 09000010 */  b          .L001FF198
/* FF274 001FF174 00000000 */   nop
.L001FF178:
/* FF278 001FF178 40111400 */  sll        $2, $20, 5
/* FF27C 001FF17C 21105100 */  addu       $2, $2, $17
/* FF280 001FF180 28004284 */  lh         $2, 0x28($2)
/* FF284 001FF184 51004228 */  slti       $2, $2, 0x51
/* FF288 001FF188 02004014 */  bnez       $2, .L001FF194
/* FF28C 001FF18C 00000000 */   nop
/* FF290 001FF190 01007326 */  addiu      $19, $19, 0x1
.L001FF194:
/* FF294 001FF194 01009426 */  addiu      $20, $20, 0x1
.L001FF198:
/* FF298 001FF198 00002486 */  lh         $4, 0x0($17)
/* FF29C 001FF19C C4C7080C */  jal        GetWeaponHoleNum__Fi
/* FF2A0 001FF1A0 00000000 */   nop
/* FF2A4 001FF1A4 2A108202 */  slt        $2, $20, $2
/* FF2A8 001FF1A8 F3FF4014 */  bnez       $2, .L001FF178
/* FF2AC 001FF1AC 00000000 */   nop
/* FF2B0 001FF1B0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF2B4 001FF1B4 90EA228C */  lw         $2, -0x1570($at)
/* FF2B8 001FF1B8 80100200 */  sll        $2, $2, 2
/* FF2BC 001FF1BC 21185D00 */  addu       $3, $2, $sp
/* FF2C0 001FF1C0 60016284 */  lh         $2, 0x160($3)
/* FF2C4 001FF1C4 62016484 */  lh         $4, 0x162($3)
/* FF2C8 001FF1C8 01000324 */  addiu      $3, $0, 0x1
/* FF2CC 001FF1CC 0C008314 */  bne        $4, $3, .L001FF200
/* FF2D0 001FF1D0 00000000 */   nop
/* FF2D4 001FF1D4 0A006016 */  bnez       $19, .L001FF200
/* FF2D8 001FF1D8 00000000 */   nop
/* FF2DC 001FF1DC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FF2E0 001FF1E0 BEBB22A4 */  sh         $2, -0x4442($at)
/* FF2E4 001FF1E4 06000224 */  addiu      $2, $0, 0x6
/* FF2E8 001FF1E8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF2EC 001FF1EC 72EA22A4 */  sh         $2, -0x158E($at)
/* FF2F0 001FF1F0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF2F4 001FF1F4 90EA23AC */  sw         $3, -0x1570($at)
/* FF2F8 001FF1F8 A4000010 */  b          .L001FF48C
/* FF2FC 001FF1FC 00000000 */   nop
.L001FF200:
/* FF300 001FF200 08008014 */  bnez       $4, .L001FF224
/* FF304 001FF204 00000000 */   nop
/* FF308 001FF208 07000224 */  addiu      $2, $0, 0x7
/* FF30C 001FF20C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF310 001FF210 72EA22A4 */  sh         $2, -0x158E($at)
/* FF314 001FF214 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF318 001FF218 E8EB20A0 */  sb         $0, -0x1418($at)
/* FF31C 001FF21C 9B000010 */  b          .L001FF48C
/* FF320 001FF220 00000000 */   nop
.L001FF224:
/* FF324 001FF224 0B000224 */  addiu      $2, $0, 0xB
/* FF328 001FF228 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF32C 001FF22C 7CEA22A4 */  sh         $2, -0x1584($at)
/* FF330 001FF230 06000224 */  addiu      $2, $0, 0x6
/* FF334 001FF234 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF338 001FF238 78EA22A0 */  sb         $2, -0x1588($at)
/* FF33C 001FF23C 93000010 */  b          .L001FF48C
/* FF340 001FF240 00000000 */   nop
/* FF344 001FF244 CC01023C */  lui        $2, %hi(GamePad)
/* FF348 001FF248 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF34C 001FF24C 00500524 */  addiu      $5, $0, 0x5000
/* FF350 001FF250 1CAE040C */  jal        Down__8CGamePadFi
/* FF354 001FF254 00000000 */   nop
/* FF358 001FF258 0C004010 */  beqz       $2, .L001FF28C
/* FF35C 001FF25C 00000000 */   nop
/* FF360 001FF260 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF364 001FF264 90EA228C */  lw         $2, -0x1570($at)
/* FF368 001FF268 05004010 */  beqz       $2, .L001FF280
/* FF36C 001FF26C 00000000 */   nop
/* FF370 001FF270 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF374 001FF274 90EA20AC */  sw         $0, -0x1570($at)
/* FF378 001FF278 04000010 */  b          .L001FF28C
/* FF37C 001FF27C 00000000 */   nop
.L001FF280:
/* FF380 001FF280 01000224 */  addiu      $2, $0, 0x1
/* FF384 001FF284 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF388 001FF288 90EA22AC */  sw         $2, -0x1570($at)
.L001FF28C:
/* FF38C 001FF28C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF390 001FF290 90EA238C */  lw         $3, -0x1570($at)
/* FF394 001FF294 01000224 */  addiu      $2, $0, 0x1
/* FF398 001FF298 08006214 */  bne        $3, $2, .L001FF2BC
/* FF39C 001FF29C 00000000 */   nop
/* FF3A0 001FF2A0 CC01023C */  lui        $2, %hi(GamePad)
/* FF3A4 001FF2A4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF3A8 001FF2A8 40000524 */  addiu      $5, $0, 0x40
/* FF3AC 001FF2AC 1CAE040C */  jal        Down__8CGamePadFi
/* FF3B0 001FF2B0 00000000 */   nop
/* FF3B4 001FF2B4 08004014 */  bnez       $2, .L001FF2D8
/* FF3B8 001FF2B8 00000000 */   nop
.L001FF2BC:
/* FF3BC 001FF2BC CC01023C */  lui        $2, %hi(GamePad)
/* FF3C0 001FF2C0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF3C4 001FF2C4 20000524 */  addiu      $5, $0, 0x20
/* FF3C8 001FF2C8 1CAE040C */  jal        Down__8CGamePadFi
/* FF3CC 001FF2CC 00000000 */   nop
/* FF3D0 001FF2D0 0C004010 */  beqz       $2, .L001FF304
/* FF3D4 001FF2D4 00000000 */   nop
.L001FF2D8:
/* FF3D8 001FF2D8 01000224 */  addiu      $2, $0, 0x1
/* FF3DC 001FF2DC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF3E0 001FF2E0 72EA22A4 */  sh         $2, -0x158E($at)
/* FF3E4 001FF2E4 06000224 */  addiu      $2, $0, 0x6
/* FF3E8 001FF2E8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF3EC 001FF2EC 90EA22AC */  sw         $2, -0x1570($at)
/* FF3F0 001FF2F0 02000424 */  addiu      $4, $0, 0x2
/* FF3F4 001FF2F4 BCB3080C */  jal        ComMenuSePlay__Fi
/* FF3F8 001FF2F8 00000000 */   nop
/* FF3FC 001FF2FC 63000010 */  b          .L001FF48C
/* FF400 001FF300 00000000 */   nop
.L001FF304:
/* FF404 001FF304 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF408 001FF308 90EA228C */  lw         $2, -0x1570($at)
/* FF40C 001FF30C 5F004014 */  bnez       $2, .L001FF48C
/* FF410 001FF310 00000000 */   nop
/* FF414 001FF314 CC01023C */  lui        $2, %hi(GamePad)
/* FF418 001FF318 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF41C 001FF31C 40000524 */  addiu      $5, $0, 0x40
/* FF420 001FF320 1CAE040C */  jal        Down__8CGamePadFi
/* FF424 001FF324 00000000 */   nop
/* FF428 001FF328 58004010 */  beqz       $2, .L001FF48C
/* FF42C 001FF32C 00000000 */   nop
/* FF430 001FF330 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF434 001FF334 74EA2480 */  lb         $4, -0x158C($at)
/* FF438 001FF338 40110400 */  sll        $2, $4, 5
/* FF43C 001FF33C 23104400 */  subu       $2, $2, $4
/* FF440 001FF340 C0180200 */  sll        $3, $2, 3
/* FF444 001FF344 1495828F */  lw         $2, -0x6AEC($gp)
/* FF448 001FF348 21284300 */  addu       $5, $2, $3
/* FF44C 001FF34C B0110224 */  addiu      $2, $0, 0x11B0
/* FF450 001FF350 18188200 */  mult       $3, $4, $2
/* FF454 001FF354 D901023C */  lui        $2, %hi(DngWeaponFrm)
/* FF458 001FF358 30164224 */  addiu      $2, $2, %lo(DngWeaponFrm)
/* FF45C 001FF35C 21304300 */  addu       $6, $2, $3
/* FF460 001FF360 DB01023C */  lui        $2, %hi(MenuWepLevelUp)
/* FF464 001FF364 E0A84424 */  addiu      $4, $2, %lo(MenuWepLevelUp)
/* FF468 001FF368 1895878F */  lw         $7, -0x6AE8($gp)
/* FF46C 001FF36C F894888F */  lw         $8, -0x6B08($gp)
/* FF470 001FF370 0CDB080C */  jal        SetBuildUp__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
/* FF474 001FF374 00000000 */   nop
/* FF478 001FF378 09000224 */  addiu      $2, $0, 0x9
/* FF47C 001FF37C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF480 001FF380 7CEA22A4 */  sh         $2, -0x1584($at)
/* FF484 001FF384 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF488 001FF388 72EA20A4 */  sh         $0, -0x158E($at)
/* FF48C 001FF38C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF490 001FF390 90EA20AC */  sw         $0, -0x1570($at)
/* FF494 001FF394 01000424 */  addiu      $4, $0, 0x1
/* FF498 001FF398 BCB3080C */  jal        ComMenuSePlay__Fi
/* FF49C 001FF39C 00000000 */   nop
/* FF4A0 001FF3A0 3A000010 */  b          .L001FF48C
/* FF4A4 001FF3A4 00000000 */   nop
/* FF4A8 001FF3A8 CC01023C */  lui        $2, %hi(GamePad)
/* FF4AC 001FF3AC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF4B0 001FF3B0 05000524 */  addiu      $5, $0, 0x5
/* FF4B4 001FF3B4 1CAE040C */  jal        Down__8CGamePadFi
/* FF4B8 001FF3B8 00000000 */   nop
/* FF4BC 001FF3BC 10004010 */  beqz       $2, .L001FF400
/* FF4C0 001FF3C0 00000000 */   nop
/* FF4C4 001FF3C4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF4C8 001FF3C8 E8EB2280 */  lb         $2, -0x1418($at)
/* FF4CC 001FF3CC FFFF4224 */  addiu      $2, $2, -0x1
/* FF4D0 001FF3D0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF4D4 001FF3D4 E8EB22A0 */  sb         $2, -0x1418($at)
/* FF4D8 001FF3D8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF4DC 001FF3DC E8EB2280 */  lb         $2, -0x1418($at)
/* FF4E0 001FF3E0 04004104 */  bgez       $2, .L001FF3F4
/* FF4E4 001FF3E4 00000000 */   nop
/* FF4E8 001FF3E8 02000224 */  addiu      $2, $0, 0x2
/* FF4EC 001FF3EC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF4F0 001FF3F0 E8EB22A0 */  sb         $2, -0x1418($at)
.L001FF3F4:
/* FF4F4 001FF3F4 28260070 */  paddub     $4, $0, $0
/* FF4F8 001FF3F8 BCB3080C */  jal        ComMenuSePlay__Fi
/* FF4FC 001FF3FC 00000000 */   nop
.L001FF400:
/* FF500 001FF400 CC01023C */  lui        $2, %hi(GamePad)
/* FF504 001FF404 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF508 001FF408 0A000524 */  addiu      $5, $0, 0xA
/* FF50C 001FF40C 1CAE040C */  jal        Down__8CGamePadFi
/* FF510 001FF410 00000000 */   nop
/* FF514 001FF414 10004010 */  beqz       $2, .L001FF458
/* FF518 001FF418 00000000 */   nop
/* FF51C 001FF41C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF520 001FF420 E8EB2280 */  lb         $2, -0x1418($at)
/* FF524 001FF424 01004224 */  addiu      $2, $2, 0x1
/* FF528 001FF428 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF52C 001FF42C E8EB22A0 */  sb         $2, -0x1418($at)
/* FF530 001FF430 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF534 001FF434 E8EB2280 */  lb         $2, -0x1418($at)
/* FF538 001FF438 03004128 */  slti       $at, $2, 0x3
/* FF53C 001FF43C 03002014 */  bnez       $at, .L001FF44C
/* FF540 001FF440 00000000 */   nop
/* FF544 001FF444 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF548 001FF448 E8EB20A0 */  sb         $0, -0x1418($at)
.L001FF44C:
/* FF54C 001FF44C 28260070 */  paddub     $4, $0, $0
/* FF550 001FF450 BCB3080C */  jal        ComMenuSePlay__Fi
/* FF554 001FF454 00000000 */   nop
.L001FF458:
/* FF558 001FF458 CC01023C */  lui        $2, %hi(GamePad)
/* FF55C 001FF45C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF560 001FF460 20000524 */  addiu      $5, $0, 0x20
/* FF564 001FF464 1CAE040C */  jal        Down__8CGamePadFi
/* FF568 001FF468 00000000 */   nop
/* FF56C 001FF46C 07004010 */  beqz       $2, .L001FF48C
/* FF570 001FF470 00000000 */   nop
/* FF574 001FF474 05000224 */  addiu      $2, $0, 0x5
/* FF578 001FF478 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF57C 001FF47C 72EA22A4 */  sh         $2, -0x158E($at)
/* FF580 001FF480 02000424 */  addiu      $4, $0, 0x2
/* FF584 001FF484 BCB3080C */  jal        ComMenuSePlay__Fi
/* FF588 001FF488 00000000 */   nop
.L001FF48C:
/* FF58C 001FF48C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF590 001FF490 75EA2280 */  lb         $2, -0x158B($at)
/* FF594 001FF494 7B004212 */  beq        $18, $2, .L001FF684
/* FF598 001FF498 00000000 */   nop
/* FF59C 001FF49C D494828F */  lw         $2, -0x6B2C($gp)
/* FF5A0 001FF4A0 04004480 */  lb         $4, 0x4($2)
/* FF5A4 001FF4A4 D894828F */  lw         $2, -0x6B28($gp)
/* FF5A8 001FF4A8 07004014 */  bnez       $2, .L001FF4C8
/* FF5AC 001FF4AC 00000000 */   nop
/* FF5B0 001FF4B0 05009214 */  bne        $4, $18, .L001FF4C8
/* FF5B4 001FF4B4 00000000 */   nop
/* FF5B8 001FF4B8 0095858F */  lw         $5, -0x6B00($gp)
/* FF5BC 001FF4BC E494868F */  lw         $6, -0x6B1C($gp)
/* FF5C0 001FF4C0 5837080C */  jal        DngWeaponEquipModelBuild__FiiP1
/* FF5C4 001FF4C4 00000000 */   nop
.L001FF4C8:
/* FF5C8 001FF4C8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF5CC 001FF4CC 75EA2580 */  lb         $5, -0x158B($at)
/* FF5D0 001FF4D0 D494838F */  lw         $3, -0x6B2C($gp)
/* FF5D4 001FF4D4 A80A0224 */  addiu      $2, $0, 0xAA8
/* FF5D8 001FF4D8 1810A200 */  mult       $2, $5, $2
/* FF5DC 001FF4DC 21106200 */  addu       $2, $3, $2
/* FF5E0 001FF4E0 0C454224 */  addiu      $2, $2, 0x450C
/* FF5E4 001FF4E4 149582AF */  sw         $2, -0x6AEC($gp)
/* FF5E8 001FF4E8 E494848F */  lw         $4, -0x6B1C($gp)
/* FF5EC 001FF4EC 7434080C */  jal        StartReadWepMDS__FP1i
/* FF5F0 001FF4F0 00000000 */   nop
/* FF5F4 001FF4F4 60004010 */  beqz       $2, .L001FF678
/* FF5F8 001FF4F8 00000000 */   nop
/* FF5FC 001FF4FC 049580AF */  sw         $0, -0x6AFC($gp)
/* FF600 001FF500 04000224 */  addiu      $2, $0, 0x4
/* FF604 001FF504 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF608 001FF508 7CEA22A4 */  sh         $2, -0x1584($at)
/* FF60C 001FF50C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF610 001FF510 80EA20AC */  sw         $0, -0x1580($at)
/* FF614 001FF514 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF618 001FF518 75EA2280 */  lb         $2, -0x158B($at)
/* FF61C 001FF51C 23204202 */  subu       $4, $18, $2
/* FF620 001FF520 7200040C */  jal        abs
/* FF624 001FF524 00000000 */   nop
/* FF628 001FF528 02004128 */  slti       $at, $2, 0x2
/* FF62C 001FF52C 1F002014 */  bnez       $at, .L001FF5AC
/* FF630 001FF530 00000000 */   nop
/* FF634 001FF534 28260070 */  paddub     $4, $0, $0
/* FF638 001FF538 19000010 */  b          .L001FF5A0
/* FF63C 001FF53C 00000000 */   nop
.L001FF540:
/* FF640 001FF540 40100400 */  sll        $2, $4, 1
/* FF644 001FF544 21104400 */  addu       $2, $2, $4
/* FF648 001FF548 80280200 */  sll        $5, $2, 2
/* FF64C 001FF54C 2900023C */  lui        $2, %hi(SysChara)
/* FF650 001FF550 502B4224 */  addiu      $2, $2, %lo(SysChara)
/* FF654 001FF554 21104500 */  addu       $2, $2, $5
/* FF658 001FF558 00004380 */  lb         $3, 0x0($2)
/* FF65C 001FF55C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF660 001FF560 75EA2280 */  lb         $2, -0x158B($at)
/* FF664 001FF564 23186200 */  subu       $3, $3, $2
/* FF668 001FF568 C0100300 */  sll        $2, $3, 3
/* FF66C 001FF56C 23104300 */  subu       $2, $2, $3
/* FF670 001FF570 C0100200 */  sll        $2, $2, 3
/* FF674 001FF574 23104300 */  subu       $2, $2, $3
/* FF678 001FF578 40100200 */  sll        $2, $2, 1
/* FF67C 001FF57C 0E014224 */  addiu      $2, $2, 0x10E
/* FF680 001FF580 00008244 */  mtc1       $2, $f0
/* FF684 001FF584 00000000 */  nop
/* FF688 001FF588 20008046 */  cvt.s.w    $f0, $f0
/* FF68C 001FF58C 2900023C */  lui        $2, %hi(SysChara + 0x4)
/* FF690 001FF590 542B4224 */  addiu      $2, $2, %lo(SysChara + 0x4)
/* FF694 001FF594 21104500 */  addu       $2, $2, $5
/* FF698 001FF598 000040E4 */  swc1       $f0, 0x0($2)
/* FF69C 001FF59C 01008424 */  addiu      $4, $4, 0x1
.L001FF5A0:
/* FF6A0 001FF5A0 06008228 */  slti       $2, $4, 0x6
/* FF6A4 001FF5A4 E6FF4014 */  bnez       $2, .L001FF540
/* FF6A8 001FF5A8 00000000 */   nop
.L001FF5AC:
/* FF6AC 001FF5AC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF6B0 001FF5B0 75EA2380 */  lb         $3, -0x158B($at)
/* FF6B4 001FF5B4 D494848F */  lw         $4, -0x6B2C($gp)
/* FF6B8 001FF5B8 A80A0224 */  addiu      $2, $0, 0xAA8
/* FF6BC 001FF5BC 18106200 */  mult       $2, $3, $2
/* FF6C0 001FF5C0 21108200 */  addu       $2, $4, $2
/* FF6C4 001FF5C4 0C454224 */  addiu      $2, $2, 0x450C
/* FF6C8 001FF5C8 149582AF */  sw         $2, -0x6AEC($gp)
/* FF6CC 001FF5CC 21106400 */  addu       $2, $3, $4
/* FF6D0 001FF5D0 40434280 */  lb         $2, 0x4340($2)
/* FF6D4 001FF5D4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF6D8 001FF5D8 74EA22A0 */  sb         $2, -0x158C($at)
/* FF6DC 001FF5DC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF6E0 001FF5E0 74EA2280 */  lb         $2, -0x158C($at)
/* FF6E4 001FF5E4 04004004 */  bltz       $2, .L001FF5F8
/* FF6E8 001FF5E8 00000000 */   nop
/* FF6EC 001FF5EC 0A004228 */  slti       $2, $2, 0xA
/* FF6F0 001FF5F0 03004014 */  bnez       $2, .L001FF600
/* FF6F4 001FF5F4 00000000 */   nop
.L001FF5F8:
/* FF6F8 001FF5F8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF6FC 001FF5FC 74EA20A0 */  sb         $0, -0x158C($at)
.L001FF600:
/* FF700 001FF600 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF704 001FF604 74EA2480 */  lb         $4, -0x158C($at)
/* FF708 001FF608 D6000224 */  addiu      $2, $0, 0xD6
/* FF70C 001FF60C 18188200 */  mult       $3, $4, $2
/* FF710 001FF610 E8000224 */  addiu      $2, $0, 0xE8
/* FF714 001FF614 23104300 */  subu       $2, $2, $3
/* FF718 001FF618 00008244 */  mtc1       $2, $f0
/* FF71C 001FF61C 00000000 */  nop
/* FF720 001FF620 20008046 */  cvt.s.w    $f0, $f0
/* FF724 001FF624 7C9580E7 */  swc1       $f0, -0x6A84($gp)
/* FF728 001FF628 23100400 */  negu       $2, $4
/* FF72C 001FF62C 00008244 */  mtc1       $2, $f0
/* FF730 001FF630 00000000 */  nop
/* FF734 001FF634 60008046 */  cvt.s.w    $f1, $f0
/* FF738 001FF638 8041023C */  lui        $2, (0x41800000 >> 16)
/* FF73C 001FF63C 00008244 */  mtc1       $2, $f0
/* FF740 001FF640 00000000 */  nop
/* FF744 001FF644 42000146 */  mul.s      $f1, $f0, $f1
/* FF748 001FF648 0040023C */  lui        $2, (0x40000000 >> 16)
/* FF74C 001FF64C 00008244 */  mtc1       $2, $f0
/* FF750 001FF650 00000000 */  nop
/* FF754 001FF654 00000146 */  add.s      $f0, $f0, $f1
/* FF758 001FF658 809580E7 */  swc1       $f0, -0x6A80($gp)
/* FF75C 001FF65C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF760 001FF660 7CEA20A4 */  sh         $0, -0x1584($at)
/* FF764 001FF664 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF768 001FF668 80EA20AC */  sw         $0, -0x1580($at)
/* FF76C 001FF66C 28860070 */  paddub     $16, $0, $0
/* FF770 001FF670 04000010 */  b          .L001FF684
/* FF774 001FF674 00000000 */   nop
.L001FF678:
/* FF778 001FF678 02000424 */  addiu      $4, $0, 0x2
/* FF77C 001FF67C BCB3080C */  jal        ComMenuSePlay__Fi
/* FF780 001FF680 00000000 */   nop
.L001FF684:
/* FF784 001FF684 28160072 */  paddub     $2, $16, $0
/* FF788 001FF688 5000BF7B */  lq         $31, 0x50($sp)
/* FF78C 001FF68C 4000B47B */  lq         $20, 0x40($sp)
/* FF790 001FF690 3000B37B */  lq         $19, 0x30($sp)
/* FF794 001FF694 2000B27B */  lq         $18, 0x20($sp)
/* FF798 001FF698 1000B17B */  lq         $17, 0x10($sp)
/* FF79C 001FF69C 0000B07B */  lq         $16, 0x0($sp)
/* FF7A0 001FF6A0 8001BD27 */  addiu      $sp, $sp, 0x180
/* FF7A4 001FF6A4 0800E003 */  jr         $31
/* FF7A8 001FF6A8 00000000 */   nop
/* FF7AC 001FF6AC 00000000 */  nop
