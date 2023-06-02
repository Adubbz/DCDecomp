.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MainEditMode__Fv
/* 7DFA0 0017DEA0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 7DFA4 0017DEA4 5000BF7F */  sq         $31, 0x50($sp)
/* 7DFA8 0017DEA8 4000B37F */  sq         $19, 0x40($sp)
/* 7DFAC 0017DEAC 3000B27F */  sq         $18, 0x30($sp)
/* 7DFB0 0017DEB0 2000B17F */  sq         $17, 0x20($sp)
/* 7DFB4 0017DEB4 1000B07F */  sq         $16, 0x10($sp)
/* 7DFB8 0017DEB8 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* 7DFBC 0017DEBC 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 7DFC0 0017DEC0 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 7DFC4 0017DEC4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 7DFC8 0017DEC8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 7DFCC 0017DECC F0D4228C */  lw         $2, -0x2B10($at)
/* 7DFD0 0017DED0 0D004010 */  beqz       $2, .L0017DF08
/* 7DFD4 0017DED4 00000000 */   nop
/* 7DFD8 0017DED8 D401023C */  lui        $2, %hi(D_1D3D500)
/* 7DFDC 0017DEDC 00D54424 */  addiu      $4, $2, %lo(D_1D3D500)
/* 7DFE0 0017DEE0 D401023C */  lui        $2, %hi(D_1D3D540)
/* 7DFE4 0017DEE4 40D54524 */  addiu      $5, $2, %lo(D_1D3D540)
/* 7DFE8 0017DEE8 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* 7DFEC 0017DEEC 00000000 */   nop
/* 7DFF0 0017DEF0 D401023C */  lui        $2, %hi(D_1D3D580)
/* 7DFF4 0017DEF4 80D54424 */  addiu      $4, $2, %lo(D_1D3D580)
/* 7DFF8 0017DEF8 40B7040C */  jal        MGSetAmbient__FPf
/* 7DFFC 0017DEFC 00000000 */   nop
/* 7E000 0017DF00 07000010 */  b          .L0017DF20
/* 7E004 0017DF04 00000000 */   nop
.L0017DF08:
/* 7E008 0017DF08 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7E00C 0017DF0C C890848F */  lw         $4, -0x6F38($gp)
/* 7E010 0017DF10 6090858F */  lw         $5, -0x6FA0($gp)
/* 7E014 0017DF14 0891868F */  lw         $6, -0x6EF8($gp)
/* 7E018 0017DF18 5423060C */  jal        EdSetLightParam__FfiP13EDIT_MAP_INFOP9CFrameVu1
/* 7E01C 0017DF1C 00000000 */   nop
.L0017DF20:
/* 7E020 0017DF20 E890848F */  lw         $4, -0x6F18($gp)
/* 7E024 0017DF24 548C060C */  jal        StepWater__11CEditGroundFv
/* 7E028 0017DF28 00000000 */   nop
/* 7E02C 0017DF2C 6090828F */  lw         $2, -0x6FA0($gp)
/* 7E030 0017DF30 6000A427 */  addiu      $4, $sp, 0x60
/* 7E034 0017DF34 60004524 */  addiu      $5, $2, 0x60
/* 7E038 0017DF38 0C86040C */  jal        sceVu0CopyVector
/* 7E03C 0017DF3C 00000000 */   nop
/* 7E040 0017DF40 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 7E044 0017DF44 0CD421C4 */  lwc1       $f1, -0x2BF4($at)
/* 7E048 0017DF48 00008044 */  mtc1       $0, $f0
/* 7E04C 0017DF4C 00000000 */  nop
/* 7E050 0017DF50 36080046 */  c.le.s     $f1, $f0
/* 7E054 0017DF54 00000000 */  nop
/* 7E058 0017DF58 06000145 */  bc1t       .L0017DF74
/* 7E05C 0017DF5C 00000000 */   nop
/* 7E060 0017DF60 6000A427 */  addiu      $4, $sp, 0x60
/* 7E064 0017DF64 D401023C */  lui        $2, %hi(D_1D3D400)
/* 7E068 0017DF68 00D44524 */  addiu      $5, $2, %lo(D_1D3D400)
/* 7E06C 0017DF6C 0C86040C */  jal        sceVu0CopyVector
/* 7E070 0017DF70 00000000 */   nop
.L0017DF74:
/* 7E074 0017DF74 CC01023C */  lui        $2, %hi(GamePad)
/* 7E078 0017DF78 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7E07C 0017DF7C E4AD040C */  jal        GetLXf2__8CGamePadFv
/* 7E080 0017DF80 00000000 */   nop
/* 7E084 0017DF84 46050046 */  mov.s      $f21, $f0
/* 7E088 0017DF88 CC01023C */  lui        $2, %hi(GamePad)
/* 7E08C 0017DF8C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7E090 0017DF90 F4AD040C */  jal        GetLYf2__8CGamePadFv
/* 7E094 0017DF94 00000000 */   nop
/* 7E098 0017DF98 86050046 */  mov.s      $f22, $f0
/* 7E09C 0017DF9C D301023C */  lui        $2, %hi(MainCamera)
/* 7E0A0 0017DFA0 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7E0A4 0017DFA4 D092040C */  jal        GetAngle__13CCameraFollowFv
/* 7E0A8 0017DFA8 00000000 */   nop
/* 7E0AC 0017DFAC C6050046 */  mov.s      $f23, $f0
/* 7E0B0 0017DFB0 06BB0046 */  mov.s      $f12, $f23
/* 7E0B4 0017DFB4 AC75040C */  jal        cosf
/* 7E0B8 0017DFB8 00000000 */   nop
/* 7E0BC 0017DFBC 02AD0046 */  mul.s      $f20, $f21, $f0
/* 7E0C0 0017DFC0 06BB0046 */  mov.s      $f12, $f23
/* 7E0C4 0017DFC4 2876040C */  jal        sinf
/* 7E0C8 0017DFC8 00000000 */   nop
/* 7E0CC 0017DFCC 02B00046 */  mul.s      $f0, $f22, $f0
/* 7E0D0 0017DFD0 40A00046 */  add.s      $f1, $f20, $f0
/* 7E0D4 0017DFD4 6000A0C7 */  lwc1       $f0, 0x60($sp)
/* 7E0D8 0017DFD8 00000146 */  add.s      $f0, $f0, $f1
/* 7E0DC 0017DFDC 7000A0E7 */  swc1       $f0, 0x70($sp)
/* 7E0E0 0017DFE0 06BB0046 */  mov.s      $f12, $f23
/* 7E0E4 0017DFE4 AC75040C */  jal        cosf
/* 7E0E8 0017DFE8 00000000 */   nop
/* 7E0EC 0017DFEC 02B50046 */  mul.s      $f20, $f22, $f0
/* 7E0F0 0017DFF0 06BB0046 */  mov.s      $f12, $f23
/* 7E0F4 0017DFF4 2876040C */  jal        sinf
/* 7E0F8 0017DFF8 00000000 */   nop
/* 7E0FC 0017DFFC 02A80046 */  mul.s      $f0, $f21, $f0
/* 7E100 0017E000 41A00046 */  sub.s      $f1, $f20, $f0
/* 7E104 0017E004 6800A0C7 */  lwc1       $f0, 0x68($sp)
/* 7E108 0017E008 00000146 */  add.s      $f0, $f0, $f1
/* 7E10C 0017E00C 7800A0E7 */  swc1       $f0, 0x78($sp)
/* 7E110 0017E010 6400A0C7 */  lwc1       $f0, 0x64($sp)
/* 7E114 0017E014 7400A0E7 */  swc1       $f0, 0x74($sp)
/* 7E118 0017E018 7C00A0AF */  sw         $0, 0x7C($sp)
/* 7E11C 0017E01C D201023C */  lui        $2, %hi(EdWind)
/* 7E120 0017E020 20B54424 */  addiu      $4, $2, %lo(EdWind)
/* 7E124 0017E024 7000A527 */  addiu      $5, $sp, 0x70
/* 7E128 0017E028 20ED040C */  jal        SetDir__5CWindFPf
/* 7E12C 0017E02C 00000000 */   nop
/* 7E130 0017E030 D201023C */  lui        $2, %hi(EdWind)
/* 7E134 0017E034 20B54424 */  addiu      $4, $2, %lo(EdWind)
/* 7E138 0017E038 6C00ACC7 */  lwc1       $f12, 0x6C($sp)
/* 7E13C 0017E03C 2CED040C */  jal        SetVelocity__5CWindFf
/* 7E140 0017E040 00000000 */   nop
/* 7E144 0017E044 D201023C */  lui        $2, %hi(EdWind)
/* 7E148 0017E048 20B54424 */  addiu      $4, $2, %lo(EdWind)
/* 7E14C 0017E04C 4CED040C */  jal        Step__5CWindFv
/* 7E150 0017E050 00000000 */   nop
/* 7E154 0017E054 D201023C */  lui        $2, %hi(EdWind)
/* 7E158 0017E058 20B54324 */  addiu      $3, $2, %lo(EdWind)
/* 7E15C 0017E05C 6487828F */  lw         $2, -0x789C($gp)
/* 7E160 0017E060 980C43AC */  sw         $3, 0xC98($2)
/* 7E164 0017E064 28860070 */  paddub     $16, $0, $0
/* 7E168 0017E068 0A000010 */  b          .L0017E094
/* 7E16C 0017E06C 00000000 */   nop
.L0017E070:
/* 7E170 0017E070 B0110224 */  addiu      $2, $0, 0x11B0
/* 7E174 0017E074 18180202 */  mult       $3, $16, $2
/* 7E178 0017E078 FC90828F */  lw         $2, -0x6F04($gp)
/* 7E17C 0017E07C 21204300 */  addu       $4, $2, $3
/* 7E180 0017E080 A000998C */  lw         $25, 0xA0($4)
/* 7E184 0017E084 0800398F */  lw         $25, 0x8($25)
/* 7E188 0017E088 09F82003 */  jalr       $25
/* 7E18C 0017E08C 00000000 */   nop
/* 7E190 0017E090 01001026 */  addiu      $16, $16, 0x1
.L0017E094:
/* 7E194 0017E094 0400022A */  slti       $2, $16, 0x4
/* 7E198 0017E098 F5FF4014 */  bnez       $2, .L0017E070
/* 7E19C 0017E09C 00000000 */   nop
/* 7E1A0 0017E0A0 28860070 */  paddub     $16, $0, $0
/* 7E1A4 0017E0A4 13000010 */  b          .L0017E0F4
/* 7E1A8 0017E0A8 00000000 */   nop
.L0017E0AC:
/* 7E1AC 0017E0AC C0101000 */  sll        $2, $16, 3
/* 7E1B0 0017E0B0 21105000 */  addu       $2, $2, $16
/* 7E1B4 0017E0B4 00110200 */  sll        $2, $2, 4
/* 7E1B8 0017E0B8 21106200 */  addu       $2, $3, $2
/* 7E1BC 0017E0BC 0100013C */  lui        $at, (0x1A260 >> 16)
/* 7E1C0 0017E0C0 60A22134 */  ori        $at, $at, (0x1A260 & 0xFFFF)
/* 7E1C4 0017E0C4 21884100 */  addu       $17, $2, $at
/* 7E1C8 0017E0C8 8800248E */  lw         $4, 0x88($17)
/* 7E1CC 0017E0CC 05008018 */  blez       $4, .L0017E0E4
/* 7E1D0 0017E0D0 00000000 */   nop
/* 7E1D4 0017E0D4 14E0050C */  jal        EdGetMapFlag__Fi
/* 7E1D8 0017E0D8 00000000 */   nop
/* 7E1DC 0017E0DC 04004014 */  bnez       $2, .L0017E0F0
/* 7E1E0 0017E0E0 00000000 */   nop
.L0017E0E4:
/* 7E1E4 0017E0E4 28262072 */  paddub     $4, $17, $0
/* 7E1E8 0017E0E8 7898050C */  jal        ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 7E1EC 0017E0EC 00000000 */   nop
.L0017E0F0:
/* 7E1F0 0017E0F0 01001026 */  addiu      $16, $16, 0x1
.L0017E0F4:
/* 7E1F4 0017E0F4 6090838F */  lw         $3, -0x6FA0($gp)
/* 7E1F8 0017E0F8 0200013C */  lui        $at, (0x20000 >> 16)
/* 7E1FC 0017E0FC 21086100 */  addu       $at, $3, $at
/* 7E200 0017E100 40A2228C */  lw         $2, -0x5DC0($at)
/* 7E204 0017E104 2A100202 */  slt        $2, $16, $2
/* 7E208 0017E108 E8FF4014 */  bnez       $2, .L0017E0AC
/* 7E20C 0017E10C 00000000 */   nop
/* 7E210 0017E110 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7E214 0017E114 F45E050C */  jal        GetNowTime__9CSaveDataFv
/* 7E218 0017E118 00000000 */   nop
/* 7E21C 0017E11C 06050046 */  mov.s      $f20, $f0
/* 7E220 0017E120 01001024 */  addiu      $16, $0, 0x1
/* 7E224 0017E124 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7E228 0017E128 981F060C */  jal        EdGetTime__Ff
/* 7E22C 0017E12C 00000000 */   nop
/* 7E230 0017E130 288E4070 */  paddub     $17, $2, $0
/* 7E234 0017E134 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7E238 0017E138 F45E050C */  jal        GetNowTime__9CSaveDataFv
/* 7E23C 0017E13C 00000000 */   nop
/* 7E240 0017E140 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7E244 0017E144 32600046 */  c.eq.s     $f12, $f0
/* 7E248 0017E148 00000000 */  nop
/* 7E24C 0017E14C 02000145 */  bc1t       .L0017E158
/* 7E250 0017E150 00000000 */   nop
/* 7E254 0017E154 28860070 */  paddub     $16, $0, $0
.L0017E158:
/* 7E258 0017E158 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7E25C 0017E15C F05E050C */  jal        SetNowTime__9CSaveDataFf
/* 7E260 0017E160 00000000 */   nop
/* 7E264 0017E164 C0918283 */  lb         $2, -0x6E40($gp)
/* 7E268 0017E168 04004014 */  bnez       $2, .L0017E17C
/* 7E26C 0017E16C 00000000 */   nop
/* 7E270 0017E170 01000224 */  addiu      $2, $0, 0x1
/* 7E274 0017E174 BC9182AF */  sw         $2, -0x6E44($gp)
/* 7E278 0017E178 C09182A3 */  sb         $2, -0x6E40($gp)
.L0017E17C:
/* 7E27C 0017E17C 4C8395C7 */  lwc1       $f21, -0x7CB4($gp)
/* 7E280 0017E180 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7E284 0017E184 CC5E050C */  jal        GetConfigData__9CSaveDataFv
/* 7E288 0017E188 00000000 */   nop
/* 7E28C 0017E18C 0C00428C */  lw         $2, 0xC($2)
/* 7E290 0017E190 05004014 */  bnez       $2, .L0017E1A8
/* 7E294 0017E194 00000000 */   nop
/* 7E298 0017E198 0040023C */  lui        $2, (0x40000000 >> 16)
/* 7E29C 0017E19C 00008244 */  mtc1       $2, $f0
/* 7E2A0 0017E1A0 00000000 */  nop
/* 7E2A4 0017E1A4 43AD0046 */  div.s      $f21, $f21, $f0
.L0017E1A8:
/* 7E2A8 0017E1A8 B090828F */  lw         $2, -0x6F50($gp)
/* 7E2AC 0017E1AC 02004010 */  beqz       $2, .L0017E1B8
/* 7E2B0 0017E1B0 00000000 */   nop
/* 7E2B4 0017E1B4 00A88044 */  mtc1       $0, $f21
.L0017E1B8:
/* 7E2B8 0017E1B8 BC91828F */  lw         $2, -0x6E44($gp)
/* 7E2BC 0017E1BC 09004010 */  beqz       $2, .L0017E1E4
/* 7E2C0 0017E1C0 00000000 */   nop
/* 7E2C4 0017E1C4 6087838F */  lw         $3, -0x78A0($gp)
/* 7E2C8 0017E1C8 01000224 */  addiu      $2, $0, 0x1
/* 7E2CC 0017E1CC 05006214 */  bne        $3, $2, .L0017E1E4
/* 7E2D0 0017E1D0 00000000 */   nop
/* 7E2D4 0017E1D4 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7E2D8 0017E1D8 06AB0046 */  mov.s      $f12, $f21
/* 7E2DC 0017E1DC F85E050C */  jal        AddNowTime__9CSaveDataFf
/* 7E2E0 0017E1E0 00000000 */   nop
.L0017E1E4:
/* 7E2E4 0017E1E4 CC01023C */  lui        $2, %hi(GamePad)
/* 7E2E8 0017E1E8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7E2EC 0017E1EC 00400524 */  addiu      $5, $0, 0x4000
/* 7E2F0 0017E1F0 2CAE040C */  jal        Down2__8CGamePadFi
/* 7E2F4 0017E1F4 00000000 */   nop
/* 7E2F8 0017E1F8 06004010 */  beqz       $2, .L0017E214
/* 7E2FC 0017E1FC 00000000 */   nop
/* 7E300 0017E200 BC91828F */  lw         $2, -0x6E44($gp)
/* 7E304 0017E204 2B100200 */  sltu       $2, $0, $2
/* 7E308 0017E208 01004238 */  xori       $2, $2, 0x1
/* 7E30C 0017E20C FF004230 */  andi       $2, $2, 0xFF
/* 7E310 0017E210 BC9182AF */  sw         $2, -0x6E44($gp)
.L0017E214:
/* 7E314 0017E214 049181C7 */  lwc1       $f1, -0x6EFC($gp)
/* 7E318 0017E218 4041023C */  lui        $2, (0x41400000 >> 16)
/* 7E31C 0017E21C 00008244 */  mtc1       $2, $f0
/* 7E320 0017E220 00000000 */  nop
/* 7E324 0017E224 34080046 */  c.lt.s     $f1, $f0
/* 7E328 0017E228 00000000 */  nop
/* 7E32C 0017E22C 02000145 */  bc1t       .L0017E238
/* 7E330 0017E230 00000000 */   nop
/* 7E334 0017E234 049180AF */  sw         $0, -0x6EFC($gp)
.L0017E238:
/* 7E338 0017E238 CC01023C */  lui        $2, %hi(GamePad)
/* 7E33C 0017E23C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7E340 0017E240 00200524 */  addiu      $5, $0, 0x2000
/* 7E344 0017E244 10AE040C */  jal        On2__8CGamePadFi
/* 7E348 0017E248 00000000 */   nop
/* 7E34C 0017E24C 05004010 */  beqz       $2, .L0017E264
/* 7E350 0017E250 00000000 */   nop
/* 7E354 0017E254 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7E358 0017E258 50838CC7 */  lwc1       $f12, -0x7CB0($gp)
/* 7E35C 0017E25C F85E050C */  jal        AddNowTime__9CSaveDataFf
/* 7E360 0017E260 00000000 */   nop
.L0017E264:
/* 7E364 0017E264 CC01023C */  lui        $2, %hi(GamePad)
/* 7E368 0017E268 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7E36C 0017E26C 00800534 */  ori        $5, $0, 0x8000
/* 7E370 0017E270 10AE040C */  jal        On2__8CGamePadFi
/* 7E374 0017E274 00000000 */   nop
/* 7E378 0017E278 05004010 */  beqz       $2, .L0017E290
/* 7E37C 0017E27C 00000000 */   nop
/* 7E380 0017E280 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7E384 0017E284 54838CC7 */  lwc1       $f12, -0x7CAC($gp)
/* 7E388 0017E288 F85E050C */  jal        AddNowTime__9CSaveDataFf
/* 7E38C 0017E28C 00000000 */   nop
.L0017E290:
/* 7E390 0017E290 28960070 */  paddub     $18, $0, $0
/* 7E394 0017E294 CC01023C */  lui        $2, %hi(GamePad)
/* 7E398 0017E298 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7E39C 0017E29C 00100524 */  addiu      $5, $0, 0x1000
/* 7E3A0 0017E2A0 2CAE040C */  jal        Down2__8CGamePadFi
/* 7E3A4 0017E2A4 00000000 */   nop
/* 7E3A8 0017E2A8 19004010 */  beqz       $2, .L0017E310
/* 7E3AC 0017E2AC 00000000 */   nop
/* 7E3B0 0017E2B0 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7E3B4 0017E2B4 2C44040C */  jal        fptosi
/* 7E3B8 0017E2B8 00000000 */   nop
/* 7E3BC 0017E2BC 00008244 */  mtc1       $2, $f0
/* 7E3C0 0017E2C0 00000000 */  nop
/* 7E3C4 0017E2C4 60008046 */  cvt.s.w    $f1, $f0
/* 7E3C8 0017E2C8 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 7E3CC 0017E2CC 00008244 */  mtc1       $2, $f0
/* 7E3D0 0017E2D0 00000000 */  nop
/* 7E3D4 0017E2D4 40000146 */  add.s      $f1, $f0, $f1
/* 7E3D8 0017E2D8 049181E7 */  swc1       $f1, -0x6EFC($gp)
/* 7E3DC 0017E2DC 4041023C */  lui        $2, (0x41400000 >> 16)
/* 7E3E0 0017E2E0 00008244 */  mtc1       $2, $f0
/* 7E3E4 0017E2E4 00000000 */  nop
/* 7E3E8 0017E2E8 34080046 */  c.lt.s     $f1, $f0
/* 7E3EC 0017E2EC 00000000 */  nop
/* 7E3F0 0017E2F0 02000145 */  bc1t       .L0017E2FC
/* 7E3F4 0017E2F4 00000000 */   nop
/* 7E3F8 0017E2F8 049180AF */  sw         $0, -0x6EFC($gp)
.L0017E2FC:
/* 7E3FC 0017E2FC 01001224 */  addiu      $18, $0, 0x1
/* 7E400 0017E300 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7E404 0017E304 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7E408 0017E308 F05E050C */  jal        SetNowTime__9CSaveDataFf
/* 7E40C 0017E30C 00000000 */   nop
.L0017E310:
/* 7E410 0017E310 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7E414 0017E314 F45E050C */  jal        GetNowTime__9CSaveDataFv
/* 7E418 0017E318 00000000 */   nop
/* 7E41C 0017E31C 049180E7 */  swc1       $f0, -0x6EFC($gp)
/* 7E420 0017E320 6090828F */  lw         $2, -0x6FA0($gp)
/* 7E424 0017E324 4000428C */  lw         $2, 0x40($2)
/* 7E428 0017E328 06004010 */  beqz       $2, .L0017E344
/* 7E42C 0017E32C 00000000 */   nop
/* 7E430 0017E330 049180AF */  sw         $0, -0x6EFC($gp)
/* 7E434 0017E334 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7E438 0017E338 06A30046 */  mov.s      $f12, $f20
/* 7E43C 0017E33C F05E050C */  jal        SetNowTime__9CSaveDataFf
/* 7E440 0017E340 00000000 */   nop
.L0017E344:
/* 7E444 0017E344 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7E448 0017E348 981F060C */  jal        EdGetTime__Ff
/* 7E44C 0017E34C 00000000 */   nop
/* 7E450 0017E350 12000012 */  beqz       $16, .L0017E39C
/* 7E454 0017E354 00000000 */   nop
/* 7E458 0017E358 BC91838F */  lw         $3, -0x6E44($gp)
/* 7E45C 0017E35C 0F006010 */  beqz       $3, .L0017E39C
/* 7E460 0017E360 00000000 */   nop
/* 7E464 0017E364 0D002212 */  beq        $17, $2, .L0017E39C
/* 7E468 0017E368 00000000 */   nop
/* 7E46C 0017E36C 0B004016 */  bnez       $18, .L0017E39C
/* 7E470 0017E370 00000000 */   nop
/* 7E474 0017E374 288D828F */  lw         $2, -0x72D8($gp)
/* 7E478 0017E378 04004128 */  slti       $at, $2, 0x4
/* 7E47C 0017E37C 05002010 */  beqz       $at, .L0017E394
/* 7E480 0017E380 00000000 */   nop
/* 7E484 0017E384 01000224 */  addiu      $2, $0, 0x1
/* 7E488 0017E388 B09082AF */  sw         $2, -0x6F50($gp)
/* 7E48C 0017E38C 03000010 */  b          .L0017E39C
/* 7E490 0017E390 00000000 */   nop
.L0017E394:
/* 7E494 0017E394 04F4050C */  jal        EdStartDrawDay__Fv
/* 7E498 0017E398 00000000 */   nop
.L0017E39C:
/* 7E49C 0017E39C 6087838F */  lw         $3, -0x78A0($gp)
/* 7E4A0 0017E3A0 01000224 */  addiu      $2, $0, 0x1
/* 7E4A4 0017E3A4 18006214 */  bne        $3, $2, .L0017E408
/* 7E4A8 0017E3A8 00000000 */   nop
/* 7E4AC 0017E3AC DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* 7E4B0 0017E3B0 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* 7E4B4 0017E3B4 3C000524 */  addiu      $5, $0, 0x3C
/* 7E4B8 0017E3B8 B4D5080C */  jal        LoopStep__13CMenuItemStepFi
/* 7E4BC 0017E3BC 00000000 */   nop
/* 7E4C0 0017E3C0 A090828F */  lw         $2, -0x6F60($gp)
/* 7E4C4 0017E3C4 1000401C */  bgtz       $2, .L0017E408
/* 7E4C8 0017E3C8 00000000 */   nop
/* 7E4CC 0017E3CC 6090828F */  lw         $2, -0x6FA0($gp)
/* 7E4D0 0017E3D0 4000428C */  lw         $2, 0x40($2)
/* 7E4D4 0017E3D4 06004014 */  bnez       $2, .L0017E3F0
/* 7E4D8 0017E3D8 00000000 */   nop
/* 7E4DC 0017E3DC 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7E4E0 0017E3E0 20C5050C */  jal        EdSetBgmVol__Ff
/* 7E4E4 0017E3E4 00000000 */   nop
/* 7E4E8 0017E3E8 04000010 */  b          .L0017E3FC
/* 7E4EC 0017E3EC 00000000 */   nop
.L0017E3F0:
/* 7E4F0 0017E3F0 28260070 */  paddub     $4, $0, $0
/* 7E4F4 0017E3F4 CC66050C */  jal        SndBgmPlay__Fi
/* 7E4F8 0017E3F8 00000000 */   nop
.L0017E3FC:
/* 7E4FC 0017E3FC 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7E500 0017E400 C8DD050C */  jal        PlayAmbient__Ff
/* 7E504 0017E404 00000000 */   nop
.L0017E408:
/* 7E508 0017E408 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7E50C 0017E40C 981F060C */  jal        EdGetTime__Ff
/* 7E510 0017E410 00000000 */   nop
/* 7E514 0017E414 02004338 */  xori       $3, $2, 0x2
/* 7E518 0017E418 0100642C */  sltiu      $4, $3, 0x1
/* 7E51C 0017E41C C8918383 */  lb         $3, -0x6E38($gp)
/* 7E520 0017E420 04006014 */  bnez       $3, .L0017E434
/* 7E524 0017E424 00000000 */   nop
/* 7E528 0017E428 C49180AF */  sw         $0, -0x6E3C($gp)
/* 7E52C 0017E42C 01000324 */  addiu      $3, $0, 0x1
/* 7E530 0017E430 C89183A3 */  sb         $3, -0x6E38($gp)
.L0017E434:
/* 7E534 0017E434 01001124 */  addiu      $17, $0, 0x1
/* 7E538 0017E438 02001224 */  addiu      $18, $0, 0x2
/* 7E53C 0017E43C 03008010 */  beqz       $4, .L0017E44C
/* 7E540 0017E440 00000000 */   nop
/* 7E544 0017E444 288E4072 */  paddub     $17, $18, $0
/* 7E548 0017E448 01001224 */  addiu      $18, $0, 0x1
.L0017E44C:
/* 7E54C 0017E44C 2700033C */  lui        $3, %hi(_2232)
/* 7E550 0017E450 60946324 */  addiu      $3, $3, %lo(_2232)
/* 7E554 0017E454 8000A527 */  addiu      $5, $sp, 0x80
/* 7E558 0017E458 000064DC */  ld         $4, 0x0($3)
/* 7E55C 0017E45C 08006384 */  lh         $3, 0x8($3)
/* 7E560 0017E460 0000A4FC */  sd         $4, 0x0($5)
/* 7E564 0017E464 0800A3A4 */  sh         $3, 0x8($5)
/* 7E568 0017E468 2700033C */  lui        $3, %hi(_2233)
/* 7E56C 0017E46C 70946324 */  addiu      $3, $3, %lo(_2233)
/* 7E570 0017E470 9000A527 */  addiu      $5, $sp, 0x90
/* 7E574 0017E474 000064DC */  ld         $4, 0x0($3)
/* 7E578 0017E478 08006384 */  lh         $3, 0x8($3)
/* 7E57C 0017E47C 0000A4FC */  sd         $4, 0x0($5)
/* 7E580 0017E480 0800A3A4 */  sh         $3, 0x8($5)
/* 7E584 0017E484 28860070 */  paddub     $16, $0, $0
/* 7E588 0017E488 17000010 */  b          .L0017E4E8
/* 7E58C 0017E48C 00000000 */   nop
.L0017E490:
/* 7E590 0017E490 C491838F */  lw         $3, -0x6E3C($gp)
/* 7E594 0017E494 C0100300 */  sll        $2, $3, 3
/* 7E598 0017E498 23184300 */  subu       $3, $2, $3
/* 7E59C 0017E49C 80100300 */  sll        $2, $3, 2
/* 7E5A0 0017E4A0 23104300 */  subu       $2, $2, $3
/* 7E5A4 0017E4A4 40190200 */  sll        $3, $2, 5
/* 7E5A8 0017E4A8 F090828F */  lw         $2, -0x6F10($gp)
/* 7E5AC 0017E4AC 21184300 */  addu       $3, $2, $3
/* 7E5B0 0017E4B0 80101000 */  sll        $2, $16, 2
/* 7E5B4 0017E4B4 21104300 */  addu       $2, $2, $3
/* 7E5B8 0017E4B8 B000538C */  lw         $19, 0xB0($2)
/* 7E5BC 0017E4BC 28266072 */  paddub     $4, $19, $0
/* 7E5C0 0017E4C0 8000A527 */  addiu      $5, $sp, 0x80
/* 7E5C4 0017E4C4 28362072 */  paddub     $6, $17, $0
/* 7E5C8 0017E4C8 50F7050C */  jal        FrameOnOff__FP6CFramePci
/* 7E5CC 0017E4CC 00000000 */   nop
/* 7E5D0 0017E4D0 28266072 */  paddub     $4, $19, $0
/* 7E5D4 0017E4D4 9000A527 */  addiu      $5, $sp, 0x90
/* 7E5D8 0017E4D8 28364072 */  paddub     $6, $18, $0
/* 7E5DC 0017E4DC 50F7050C */  jal        FrameOnOff__FP6CFramePci
/* 7E5E0 0017E4E0 00000000 */   nop
/* 7E5E4 0017E4E4 01001026 */  addiu      $16, $16, 0x1
.L0017E4E8:
/* 7E5E8 0017E4E8 0400032A */  slti       $3, $16, 0x4
/* 7E5EC 0017E4EC E8FF6014 */  bnez       $3, .L0017E490
/* 7E5F0 0017E4F0 00000000 */   nop
/* 7E5F4 0017E4F4 C491838F */  lw         $3, -0x6E3C($gp)
/* 7E5F8 0017E4F8 01006324 */  addiu      $3, $3, 0x1
/* 7E5FC 0017E4FC C49183AF */  sw         $3, -0x6E3C($gp)
/* 7E600 0017E500 C491838F */  lw         $3, -0x6E3C($gp)
/* 7E604 0017E504 18006328 */  slti       $3, $3, 0x18
/* 7E608 0017E508 02006014 */  bnez       $3, .L0017E514
/* 7E60C 0017E50C 00000000 */   nop
/* 7E610 0017E510 C49180AF */  sw         $0, -0x6E3C($gp)
.L0017E514:
/* 7E614 0017E514 D0918383 */  lb         $3, -0x6E30($gp)
/* 7E618 0017E518 04006014 */  bnez       $3, .L0017E52C
/* 7E61C 0017E51C 00000000 */   nop
/* 7E620 0017E520 CC9180AF */  sw         $0, -0x6E34($gp)
/* 7E624 0017E524 01000324 */  addiu      $3, $0, 0x1
/* 7E628 0017E528 D09183A3 */  sb         $3, -0x6E30($gp)
.L0017E52C:
/* 7E62C 0017E52C 6090838F */  lw         $3, -0x6FA0($gp)
/* 7E630 0017E530 0200013C */  lui        $at, (0x22260 >> 16)
/* 7E634 0017E534 60222134 */  ori        $at, $at, (0x22260 & 0xFFFF)
/* 7E638 0017E538 21806100 */  addu       $16, $3, $at
/* 7E63C 0017E53C 288E0070 */  paddub     $17, $0, $0
/* 7E640 0017E540 31000010 */  b          .L0017E608
/* 7E644 0017E544 00000000 */   nop
.L0017E548:
/* 7E648 0017E548 CC91848F */  lw         $4, -0x6E34($gp)
/* 7E64C 0017E54C 6090838F */  lw         $3, -0x6FA0($gp)
/* 7E650 0017E550 0200013C */  lui        $at, (0x20000 >> 16)
/* 7E654 0017E554 21086100 */  addu       $at, $3, $at
/* 7E658 0017E558 4CA2238C */  lw         $3, -0x5DB4($at)
/* 7E65C 0017E55C 2A188300 */  slt        $3, $4, $3
/* 7E660 0017E560 02006014 */  bnez       $3, .L0017E56C
/* 7E664 0017E564 00000000 */   nop
/* 7E668 0017E568 CC9180AF */  sw         $0, -0x6E34($gp)
.L0017E56C:
/* 7E66C 0017E56C CC91838F */  lw         $3, -0x6E34($gp)
/* 7E670 0017E570 40190300 */  sll        $3, $3, 5
/* 7E674 0017E574 21900302 */  addu       $18, $16, $3
/* 7E678 0017E578 00004382 */  lb         $3, 0x0($18)
/* 7E67C 0017E57C 1E006010 */  beqz       $3, .L0017E5F8
/* 7E680 0017E580 00000000 */   nop
/* 7E684 0017E584 01001324 */  addiu      $19, $0, 0x1
/* 7E688 0017E588 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7E68C 0017E58C 18004DC6 */  lwc1       $f13, 0x18($18)
/* 7E690 0017E590 1C004EC6 */  lwc1       $f14, 0x1C($18)
/* 7E694 0017E594 741F060C */  jal        EdCheckTime__Ffff
/* 7E698 0017E598 00000000 */   nop
/* 7E69C 0017E59C 02004014 */  bnez       $2, .L0017E5A8
/* 7E6A0 0017E5A0 00000000 */   nop
/* 7E6A4 0017E5A4 02001324 */  addiu      $19, $0, 0x2
.L0017E5A8:
/* 7E6A8 0017E5A8 1000448E */  lw         $4, 0x10($18)
/* 7E6AC 0017E5AC 09008010 */  beqz       $4, .L0017E5D4
/* 7E6B0 0017E5B0 00000000 */   nop
/* 7E6B4 0017E5B4 282E4072 */  paddub     $5, $18, $0
/* 7E6B8 0017E5B8 28366072 */  paddub     $6, $19, $0
/* 7E6BC 0017E5BC A000998C */  lw         $25, 0xA0($4)
/* 7E6C0 0017E5C0 9000398F */  lw         $25, 0x90($25)
/* 7E6C4 0017E5C4 09F82003 */  jalr       $25
/* 7E6C8 0017E5C8 00000000 */   nop
/* 7E6CC 0017E5CC 0A000010 */  b          .L0017E5F8
/* 7E6D0 0017E5D0 00000000 */   nop
.L0017E5D4:
/* 7E6D4 0017E5D4 1400448E */  lw         $4, 0x14($18)
/* 7E6D8 0017E5D8 07008010 */  beqz       $4, .L0017E5F8
/* 7E6DC 0017E5DC 00000000 */   nop
/* 7E6E0 0017E5E0 282E4072 */  paddub     $5, $18, $0
/* 7E6E4 0017E5E4 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 7E6E8 0017E5E8 00000000 */   nop
/* 7E6EC 0017E5EC 02004010 */  beqz       $2, .L0017E5F8
/* 7E6F0 0017E5F0 00000000 */   nop
/* 7E6F4 0017E5F4 B00053A4 */  sh         $19, 0xB0($2)
.L0017E5F8:
/* 7E6F8 0017E5F8 01003126 */  addiu      $17, $17, 0x1
/* 7E6FC 0017E5FC CC91838F */  lw         $3, -0x6E34($gp)
/* 7E700 0017E600 01006324 */  addiu      $3, $3, 0x1
/* 7E704 0017E604 CC9183AF */  sw         $3, -0x6E34($gp)
.L0017E608:
/* 7E708 0017E608 0200232A */  slti       $3, $17, 0x2
/* 7E70C 0017E60C CEFF6014 */  bnez       $3, .L0017E548
/* 7E710 0017E610 00000000 */   nop
/* 7E714 0017E614 5000BF7B */  lq         $31, 0x50($sp)
/* 7E718 0017E618 4000B37B */  lq         $19, 0x40($sp)
/* 7E71C 0017E61C 3000B27B */  lq         $18, 0x30($sp)
/* 7E720 0017E620 2000B17B */  lq         $17, 0x20($sp)
/* 7E724 0017E624 1000B07B */  lq         $16, 0x10($sp)
/* 7E728 0017E628 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* 7E72C 0017E62C 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 7E730 0017E630 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 7E734 0017E634 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 7E738 0017E638 A000BD27 */  addiu      $sp, $sp, 0xA0
/* 7E73C 0017E63C 0800E003 */  jr         $31
/* 7E740 0017E640 00000000 */   nop
/* 7E744 0017E644 00000000 */  nop
/* 7E748 0017E648 00000000 */  nop
/* 7E74C 0017E64C 00000000 */  nop
