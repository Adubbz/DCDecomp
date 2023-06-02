.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel Step__14CWeaponLevelUpFv
/* 137110 00237010 B0FEBD27 */  addiu      $sp, $sp, -0x150
/* 137114 00237014 4000BF7F */  sq         $31, 0x40($sp)
/* 137118 00237018 3000B27F */  sq         $18, 0x30($sp)
/* 13711C 0023701C 2000B17F */  sq         $17, 0x20($sp)
/* 137120 00237020 1000B07F */  sq         $16, 0x10($sp)
/* 137124 00237024 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 137128 00237028 288E8070 */  paddub     $17, $4, $0
/* 13712C 0023702C 02138684 */  lh         $6, 0x1302($4)
/* 137130 00237030 FFFF0324 */  addiu      $3, $0, -0x1
/* 137134 00237034 3502C310 */  beq        $6, $3, .L0023790C
/* 137138 00237038 00000000 */   nop
/* 13713C 0023703C 28860070 */  paddub     $16, $0, $0
/* 137140 00237040 DC01238E */  lw         $3, 0x1DC($17)
/* 137144 00237044 03006010 */  beqz       $3, .L00237054
/* 137148 00237048 00000000 */   nop
/* 13714C 0023704C 900D308E */  lw         $16, 0xD90($17)
/* 137150 00237050 00000000 */  nop
.L00237054:
/* 137154 00237054 14132786 */  lh         $7, 0x1314($17)
/* 137158 00237058 2000E12C */  sltiu      $at, $7, 0x20
/* 13715C 0023705C 2B022010 */  beqz       $at, .L0023790C
/* 137160 00237060 00000000 */   nop
/* 137164 00237064 2A00033C */  lui        $3, %hi(_1354_2)
/* 137168 00237068 00F56624 */  addiu      $6, $3, %lo(_1354_2)
/* 13716C 0023706C 80180700 */  sll        $3, $7, 2
/* 137170 00237070 21186600 */  addu       $3, $3, $6
/* 137174 00237074 0000638C */  lw         $3, 0x0($3)
/* 137178 00237078 08006000 */  jr         $3
/* 13717C 0023707C 00000000 */   nop
/* 137180 00237080 22020010 */  b          .L0023790C
/* 137184 00237084 00000000 */   nop
/* 137188 00237088 38FB040C */  jal        ReadBG__Fv
/* 13718C 0023708C 00000000 */   nop
/* 137190 00237090 28860070 */  paddub     $16, $0, $0
/* 137194 00237094 8CFB040C */  jal        ReadBGSync__Fv
/* 137198 00237098 00000000 */   nop
/* 13719C 0023709C 02004014 */  bnez       $2, .L002370A8
/* 1371A0 002370A0 00000000 */   nop
/* 1371A4 002370A4 01001026 */  addiu      $16, $16, 0x1
.L002370A8:
/* 1371A8 002370A8 006E050C */  jal        SndSPSeSyncBG__Fv
/* 1371AC 002370AC 00000000 */   nop
/* 1371B0 002370B0 18004014 */  bnez       $2, .L00237114
/* 1371B4 002370B4 00000000 */   nop
/* 1371B8 002370B8 01001026 */  addiu      $16, $16, 0x1
/* 1371BC 002370BC 02132486 */  lh         $4, 0x1302($17)
/* 1371C0 002370C0 06000324 */  addiu      $3, $0, 0x6
/* 1371C4 002370C4 13008310 */  beq        $4, $3, .L00237114
/* 1371C8 002370C8 00000000 */   nop
/* 1371CC 002370CC 03000324 */  addiu      $3, $0, 0x3
/* 1371D0 002370D0 10008310 */  beq        $4, $3, .L00237114
/* 1371D4 002370D4 00000000 */   nop
/* 1371D8 002370D8 09000324 */  addiu      $3, $0, 0x9
/* 1371DC 002370DC 0D008310 */  beq        $4, $3, .L00237114
/* 1371E0 002370E0 00000000 */   nop
/* 1371E4 002370E4 04000324 */  addiu      $3, $0, 0x4
/* 1371E8 002370E8 0A008310 */  beq        $4, $3, .L00237114
/* 1371EC 002370EC 00000000 */   nop
/* 1371F0 002370F0 05000324 */  addiu      $3, $0, 0x5
/* 1371F4 002370F4 07008310 */  beq        $4, $3, .L00237114
/* 1371F8 002370F8 00000000 */   nop
/* 1371FC 002370FC DC94858F */  lw         $5, -0x6B24($gp)
/* 137200 00237100 83300500 */  sra        $6, $5, 2
/* 137204 00237104 28262072 */  paddub     $4, $17, $0
/* 137208 00237108 07000724 */  addiu      $7, $0, 0x7
/* 13720C 0023710C ACDB080C */  jal        SetSnd__14CWeaponLevelUpFiii
/* 137210 00237110 00000000 */   nop
.L00237114:
/* 137214 00237114 0200032A */  slti       $3, $16, 0x2
/* 137218 00237118 FC016014 */  bnez       $3, .L0023790C
/* 13721C 0023711C 00000000 */   nop
/* 137220 00237120 2900023C */  lui        $2, %hi(_1096)
/* 137224 00237124 E0584524 */  addiu      $5, $2, %lo(_1096)
/* 137228 00237128 5000A427 */  addiu      $4, $sp, 0x50
/* 13722C 0023712C 02000324 */  addiu      $3, $0, 0x2
.L00237130:
/* 137230 00237130 0000A278 */  lq         $2, 0x0($5)
/* 137234 00237134 1000A524 */  addiu      $5, $5, 0x10
/* 137238 00237138 FFFF6324 */  addiu      $3, $3, -0x1
/* 13723C 0023713C 0000827C */  sq         $2, 0x0($4)
/* 137240 00237140 10008424 */  addiu      $4, $4, 0x10
/* 137244 00237144 FAFF601C */  bgtz       $3, .L00237130
/* 137248 00237148 00000000 */   nop
/* 13724C 0023714C 0000A2C4 */  lwc1       $f2, 0x0($5)
/* 137250 00237150 000082E4 */  swc1       $f2, 0x0($4)
/* 137254 00237154 04132286 */  lh         $2, 0x1304($17)
/* 137258 00237158 5400A2AF */  sw         $2, 0x54($sp)
/* 13725C 0023715C 04132286 */  lh         $2, 0x1304($17)
/* 137260 00237160 6000A2AF */  sw         $2, 0x60($sp)
/* 137264 00237164 2900023C */  lui        $2, %hi(_1097)
/* 137268 00237168 08594224 */  addiu      $2, $2, %lo(_1097)
/* 13726C 0023716C 3001A427 */  addiu      $4, $sp, 0x130
/* 137270 00237170 000043DC */  ld         $3, 0x0($2)
/* 137274 00237174 080040C4 */  lwc1       $f0, 0x8($2)
/* 137278 00237178 0C004284 */  lh         $2, 0xC($2)
/* 13727C 0023717C 000083FC */  sd         $3, 0x0($4)
/* 137280 00237180 080080E4 */  swc1       $f0, 0x8($4)
/* 137284 00237184 0C0082A4 */  sh         $2, 0xC($4)
/* 137288 00237188 2900023C */  lui        $2, %hi(_1103)
/* 13728C 0023718C 20594224 */  addiu      $2, $2, %lo(_1103)
/* 137290 00237190 8000A427 */  addiu      $4, $sp, 0x80
/* 137294 00237194 00004378 */  lq         $3, 0x0($2)
/* 137298 00237198 100042C4 */  lwc1       $f2, 0x10($2)
/* 13729C 0023719C 0000837C */  sq         $3, 0x0($4)
/* 1372A0 002371A0 100082E4 */  swc1       $f2, 0x10($4)
/* 1372A4 002371A4 2900023C */  lui        $2, %hi(_1105_2)
/* 1372A8 002371A8 40594524 */  addiu      $5, $2, %lo(_1105_2)
/* 1372AC 002371AC A000A427 */  addiu      $4, $sp, 0xA0
/* 1372B0 002371B0 03000324 */  addiu      $3, $0, 0x3
.L002371B4:
/* 1372B4 002371B4 0000A278 */  lq         $2, 0x0($5)
/* 1372B8 002371B8 1000A524 */  addiu      $5, $5, 0x10
/* 1372BC 002371BC FFFF6324 */  addiu      $3, $3, -0x1
/* 1372C0 002371C0 0000827C */  sq         $2, 0x0($4)
/* 1372C4 002371C4 10008424 */  addiu      $4, $4, 0x10
/* 1372C8 002371C8 FAFF601C */  bgtz       $3, .L002371B4
/* 1372CC 002371CC 00000000 */   nop
/* 1372D0 002371D0 0000A2DC */  ld         $2, 0x0($5)
/* 1372D4 002371D4 000082FC */  sd         $2, 0x0($4)
/* 1372D8 002371D8 02132286 */  lh         $2, 0x1302($17)
/* 1372DC 002371DC 21105D00 */  addu       $2, $2, $sp
/* 1372E0 002371E0 30014280 */  lb         $2, 0x130($2)
/* 1372E4 002371E4 80800200 */  sll        $16, $2, 2
/* 1372E8 002371E8 21101D02 */  addu       $2, $16, $sp
/* 1372EC 002371EC E000A427 */  addiu      $4, $sp, 0xE0
/* 1372F0 002371F0 A000458C */  lw         $5, 0xA0($2)
/* 1372F4 002371F4 5A15040C */  jal        strcpy
/* 1372F8 002371F8 00000000 */   nop
/* 1372FC 002371FC 21101D02 */  addu       $2, $16, $sp
/* 137300 00237200 0001A427 */  addiu      $4, $sp, 0x100
/* 137304 00237204 8000458C */  lw         $5, 0x80($2)
/* 137308 00237208 5A15040C */  jal        strcpy
/* 13730C 0023720C 00000000 */   nop
/* 137310 00237210 0001A427 */  addiu      $4, $sp, 0x100
/* 137314 00237214 2A00023C */  lui        $2, %hi(_1349_2)
/* 137318 00237218 A0F44524 */  addiu      $5, $2, %lo(_1349_2)
/* 13731C 0023721C BC14040C */  jal        strcat
/* 137320 00237220 00000000 */   nop
/* 137324 00237224 E000A427 */  addiu      $4, $sp, 0xE0
/* 137328 00237228 2A00023C */  lui        $2, %hi(_1350_4)
/* 13732C 0023722C A8F44524 */  addiu      $5, $2, %lo(_1350_4)
/* 137330 00237230 BC14040C */  jal        strcat
/* 137334 00237234 00000000 */   nop
/* 137338 00237238 28260070 */  paddub     $4, $0, $0
/* 13733C 0023723C 18FB040C */  jal        GetReadBGFile__Fi
/* 137340 00237240 00000000 */   nop
/* 137344 00237244 28964070 */  paddub     $18, $2, $0
/* 137348 00237248 8C00448C */  lw         $4, 0x8C($2)
/* 13734C 0023724C 0001A527 */  addiu      $5, $sp, 0x100
/* 137350 00237250 4C01A627 */  addiu      $6, $sp, 0x14C
/* 137354 00237254 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 137358 00237258 00000000 */   nop
/* 13735C 0023725C 5C00A2AF */  sw         $2, 0x5C($sp)
/* 137360 00237260 04132586 */  lh         $5, 0x1304($17)
/* 137364 00237264 C701023C */  lui        $2, %hi(TexManager)
/* 137368 00237268 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 13736C 0023726C C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 137370 00237270 00000000 */   nop
/* 137374 00237274 C701023C */  lui        $2, %hi(TexManager)
/* 137378 00237278 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 13737C 0023727C 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 137380 00237280 00000000 */   nop
/* 137384 00237284 C701023C */  lui        $2, %hi(TexManager)
/* 137388 00237288 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 13738C 0023728C FFFF0524 */  addiu      $5, $0, -0x1
/* 137390 00237290 5000A627 */  addiu      $6, $sp, 0x50
/* 137394 00237294 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 137398 00237298 00000000 */   nop
/* 13739C 0023729C 8C00508E */  lw         $16, 0x8C($18)
/* 1373A0 002372A0 9000428E */  lw         $2, 0x90($18)
/* 1373A4 002372A4 03110200 */  sra        $2, $2, 4
/* 1373A8 002372A8 00110200 */  sll        $2, $2, 4
/* 1373AC 002372AC 21100202 */  addu       $2, $16, $2
/* 1373B0 002372B0 10005224 */  addiu      $18, $2, 0x10
/* 1373B4 002372B4 28264072 */  paddub     $4, $18, $0
/* 1373B8 002372B8 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 1373BC 002372BC 00000000 */   nop
/* 1373C0 002372C0 28964070 */  paddub     $18, $2, $0
/* 1373C4 002372C4 20012426 */  addiu      $4, $17, 0x120
/* 1373C8 002372C8 C001398E */  lw         $25, 0x1C0($17)
/* 1373CC 002372CC C400398F */  lw         $25, 0xC4($25)
/* 1373D0 002372D0 09F82003 */  jalr       $25
/* 1373D4 002372D4 00000000 */   nop
/* 1373D8 002372D8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1373DC 002372DC D0A832AC */  sw         $18, -0x5730($at)
/* 1373E0 002372E0 00910234 */  ori        $2, $0, 0x9100
/* 1373E4 002372E4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1373E8 002372E8 DCA822AC */  sw         $2, -0x5724($at)
/* 1373EC 002372EC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1373F0 002372F0 D8A820AC */  sw         $0, -0x5728($at)
/* 1373F4 002372F4 20012426 */  addiu      $4, $17, 0x120
/* 1373F8 002372F8 282E0072 */  paddub     $5, $16, $0
/* 1373FC 002372FC E000A627 */  addiu      $6, $sp, 0xE0
/* 137400 00237300 DB01023C */  lui        $2, %hi(MenuEffectCashBuffer)
/* 137404 00237304 D0A84724 */  addiu      $7, $2, %lo(MenuEffectCashBuffer)
/* 137408 00237308 DB01023C */  lui        $2, %hi(MenuEffectCashBuffer)
/* 13740C 0023730C D0A84824 */  addiu      $8, $2, %lo(MenuEffectCashBuffer)
/* 137410 00237310 C001398E */  lw         $25, 0x1C0($17)
/* 137414 00237314 B400398F */  lw         $25, 0xB4($25)
/* 137418 00237318 09F82003 */  jalr       $25
/* 13741C 0023731C 00000000 */   nop
/* 137420 00237320 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 137424 00237324 D8A8228C */  lw         $2, -0x5728($at)
/* 137428 00237328 00190200 */  sll        $3, $2, 4
/* 13742C 0023732C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 137430 00237330 D0A8228C */  lw         $2, -0x5730($at)
/* 137434 00237334 21104300 */  addu       $2, $2, $3
/* 137438 00237338 281322AE */  sw         $2, 0x1328($17)
/* 13743C 0023733C 14132286 */  lh         $2, 0x1314($17)
/* 137440 00237340 01004224 */  addiu      $2, $2, 0x1
/* 137444 00237344 141322A6 */  sh         $2, 0x1314($17)
/* 137448 00237348 101320AE */  sw         $0, 0x1310($17)
/* 13744C 0023734C 01000224 */  addiu      $2, $0, 0x1
/* 137450 00237350 001322A6 */  sh         $2, 0x1300($17)
/* 137454 00237354 2900023C */  lui        $2, %hi(_1106_2)
/* 137458 00237358 80594224 */  addiu      $2, $2, %lo(_1106_2)
/* 13745C 0023735C 2001A327 */  addiu      $3, $sp, 0x120
/* 137460 00237360 00004278 */  lq         $2, 0x0($2)
/* 137464 00237364 0000627C */  sq         $2, 0x0($3)
/* 137468 00237368 02132286 */  lh         $2, 0x1302($17)
/* 13746C 0023736C FCFF4420 */  addi       $4, $2, -0x4 # handwritten instruction
/* 137470 00237370 0A00812C */  sltiu      $at, $4, 0xA
/* 137474 00237374 0C002010 */  beqz       $at, .L002373A8
/* 137478 00237378 00000000 */   nop
/* 13747C 0023737C 2A00023C */  lui        $2, %hi(_1355_2)
/* 137480 00237380 D0F44324 */  addiu      $3, $2, %lo(_1355_2)
/* 137484 00237384 80100400 */  sll        $2, $4, 2
/* 137488 00237388 21104300 */  addu       $2, $2, $3
/* 13748C 0023738C 0000428C */  lw         $2, 0x0($2)
/* 137490 00237390 08004000 */  jr         $2
/* 137494 00237394 00000000 */   nop
/* 137498 00237398 081320C6 */  lwc1       $f0, 0x1308($17)
/* 13749C 0023739C 2001A0E7 */  swc1       $f0, 0x120($sp)
/* 1374A0 002373A0 0C1320C6 */  lwc1       $f0, 0x130C($17)
/* 1374A4 002373A4 2401A0E7 */  swc1       $f0, 0x124($sp)
.L002373A8:
/* 1374A8 002373A8 20012426 */  addiu      $4, $17, 0x120
/* 1374AC 002373AC 2001A527 */  addiu      $5, $sp, 0x120
/* 1374B0 002373B0 C001398E */  lw         $25, 0x1C0($17)
/* 1374B4 002373B4 1400398F */  lw         $25, 0x14($25)
/* 1374B8 002373B8 09F82003 */  jalr       $25
/* 1374BC 002373BC 00000000 */   nop
/* 1374C0 002373C0 2900023C */  lui        $2, %hi(_1118_2)
/* 1374C4 002373C4 90594424 */  addiu      $4, $2, %lo(_1118_2)
/* 1374C8 002373C8 4001A327 */  addiu      $3, $sp, 0x140
/* 1374CC 002373CC 000082DC */  ld         $2, 0x0($4)
/* 1374D0 002373D0 080080C4 */  lwc1       $f0, 0x8($4)
/* 1374D4 002373D4 000062FC */  sd         $2, 0x0($3)
/* 1374D8 002373D8 080060E4 */  swc1       $f0, 0x8($3)
/* 1374DC 002373DC 02132386 */  lh         $3, 0x1302($17)
/* 1374E0 002373E0 02000224 */  addiu      $2, $0, 0x2
/* 1374E4 002373E4 13006210 */  beq        $3, $2, .L00237434
/* 1374E8 002373E8 00000000 */   nop
/* 1374EC 002373EC 01000224 */  addiu      $2, $0, 0x1
/* 1374F0 002373F0 03006210 */  beq        $3, $2, .L00237400
/* 1374F4 002373F4 00000000 */   nop
/* 1374F8 002373F8 19000010 */  b          .L00237460
/* 1374FC 002373FC 00000000 */   nop
.L00237400:
/* 137500 00237400 281E0070 */  paddub     $3, $0, $0
/* 137504 00237404 06000010 */  b          .L00237420
/* 137508 00237408 00000000 */   nop
.L0023740C:
/* 13750C 0023740C 148380C7 */  lwc1       $f0, -0x7CEC($gp)
/* 137510 00237410 80100300 */  sll        $2, $3, 2
/* 137514 00237414 21105D00 */  addu       $2, $2, $sp
/* 137518 00237418 400140E4 */  swc1       $f0, 0x140($2)
/* 13751C 0023741C 01006324 */  addiu      $3, $3, 0x1
.L00237420:
/* 137520 00237420 03006228 */  slti       $2, $3, 0x3
/* 137524 00237424 F9FF4014 */  bnez       $2, .L0023740C
/* 137528 00237428 00000000 */   nop
/* 13752C 0023742C 0C000010 */  b          .L00237460
/* 137530 00237430 00000000 */   nop
.L00237434:
/* 137534 00237434 28260070 */  paddub     $4, $0, $0
/* 137538 00237438 06000010 */  b          .L00237454
/* 13753C 0023743C 00000000 */   nop
.L00237440:
/* 137540 00237440 0040033C */  lui        $3, (0x40000000 >> 16)
/* 137544 00237444 80100400 */  sll        $2, $4, 2
/* 137548 00237448 21105D00 */  addu       $2, $2, $sp
/* 13754C 0023744C 400143AC */  sw         $3, 0x140($2)
/* 137550 00237450 01008424 */  addiu      $4, $4, 0x1
.L00237454:
/* 137554 00237454 03008228 */  slti       $2, $4, 0x3
/* 137558 00237458 F9FF4014 */  bnez       $2, .L00237440
/* 13755C 0023745C 00000000 */   nop
.L00237460:
/* 137560 00237460 20012426 */  addiu      $4, $17, 0x120
/* 137564 00237464 4001A527 */  addiu      $5, $sp, 0x140
/* 137568 00237468 C001398E */  lw         $25, 0x1C0($17)
/* 13756C 0023746C 8800398F */  lw         $25, 0x88($25)
/* 137570 00237470 09F82003 */  jalr       $25
/* 137574 00237474 00000000 */   nop
/* 137578 00237478 DC122286 */  lh         $2, 0x12DC($17)
/* 13757C 0023747C 880D22AE */  sw         $2, 0xD88($17)
/* 137580 00237480 06000224 */  addiu      $2, $0, 0x6
/* 137584 00237484 840D22AE */  sw         $2, 0xD84($17)
/* 137588 00237488 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 13758C 0023748C 800D22AE */  sw         $2, 0xD80($17)
/* 137590 00237490 20012426 */  addiu      $4, $17, 0x120
/* 137594 00237494 C001398E */  lw         $25, 0x1C0($17)
/* 137598 00237498 0800398F */  lw         $25, 0x8($25)
/* 13759C 0023749C 09F82003 */  jalr       $25
/* 1375A0 002374A0 00000000 */   nop
/* 1375A4 002374A4 FFFF1024 */  addiu      $16, $0, -0x1
/* 1375A8 002374A8 02132486 */  lh         $4, 0x1302($17)
/* 1375AC 002374AC 0A000324 */  addiu      $3, $0, 0xA
/* 1375B0 002374B0 29008310 */  beq        $4, $3, .L00237558
/* 1375B4 002374B4 00000000 */   nop
/* 1375B8 002374B8 07000324 */  addiu      $3, $0, 0x7
/* 1375BC 002374BC 26008310 */  beq        $4, $3, .L00237558
/* 1375C0 002374C0 00000000 */   nop
/* 1375C4 002374C4 08000324 */  addiu      $3, $0, 0x8
/* 1375C8 002374C8 23008310 */  beq        $4, $3, .L00237558
/* 1375CC 002374CC 00000000 */   nop
/* 1375D0 002374D0 0D000324 */  addiu      $3, $0, 0xD
/* 1375D4 002374D4 20008310 */  beq        $4, $3, .L00237558
/* 1375D8 002374D8 00000000 */   nop
/* 1375DC 002374DC 0C000324 */  addiu      $3, $0, 0xC
/* 1375E0 002374E0 1D008310 */  beq        $4, $3, .L00237558
/* 1375E4 002374E4 00000000 */   nop
/* 1375E8 002374E8 0B000324 */  addiu      $3, $0, 0xB
/* 1375EC 002374EC 1A008310 */  beq        $4, $3, .L00237558
/* 1375F0 002374F0 00000000 */   nop
/* 1375F4 002374F4 02000324 */  addiu      $3, $0, 0x2
/* 1375F8 002374F8 0E008310 */  beq        $4, $3, .L00237534
/* 1375FC 002374FC 00000000 */   nop
/* 137600 00237500 09008010 */  beqz       $4, .L00237528
/* 137604 00237504 00000000 */   nop
/* 137608 00237508 01000324 */  addiu      $3, $0, 0x1
/* 13760C 0023750C 03008310 */  beq        $4, $3, .L0023751C
/* 137610 00237510 00000000 */   nop
/* 137614 00237514 11000010 */  b          .L0023755C
/* 137618 00237518 00000000 */   nop
.L0023751C:
/* 13761C 0023751C 1A001024 */  addiu      $16, $0, 0x1A
/* 137620 00237520 0E000010 */  b          .L0023755C
/* 137624 00237524 00000000 */   nop
.L00237528:
/* 137628 00237528 19001024 */  addiu      $16, $0, 0x19
/* 13762C 0023752C 0B000010 */  b          .L0023755C
/* 137630 00237530 00000000 */   nop
.L00237534:
/* 137634 00237534 1C001024 */  addiu      $16, $0, 0x1C
/* 137638 00237538 DE122486 */  lh         $4, 0x12DE($17)
/* 13763C 0023753C 84D4080C */  jal        IsLastWeapon__Fi
/* 137640 00237540 00000000 */   nop
/* 137644 00237544 05004010 */  beqz       $2, .L0023755C
/* 137648 00237548 00000000 */   nop
/* 13764C 0023754C 15001024 */  addiu      $16, $0, 0x15
/* 137650 00237550 02000010 */  b          .L0023755C
/* 137654 00237554 00000000 */   nop
.L00237558:
/* 137658 00237558 14001024 */  addiu      $16, $0, 0x14
.L0023755C:
/* 13765C 0023755C 05000006 */  bltz       $16, .L00237574
/* 137660 00237560 00000000 */   nop
/* 137664 00237564 28260072 */  paddub     $4, $16, $0
/* 137668 00237568 FFFF0524 */  addiu      $5, $0, -0x1
/* 13766C 0023756C 206E050C */  jal        SndSPSePlay__Fii
/* 137670 00237570 00000000 */   nop
.L00237574:
/* 137674 00237574 28360070 */  paddub     $6, $0, $0
/* 137678 00237578 16000010 */  b          .L002375D4
/* 13767C 0023757C 00000000 */   nop
.L00237580:
/* 137680 00237580 FFFF0524 */  addiu      $5, $0, -0x1
/* 137684 00237584 80200600 */  sll        $4, $6, 2
/* 137688 00237588 DA01033C */  lui        $3, %hi(D_1DA2270)
/* 13768C 0023758C 70226324 */  addiu      $3, $3, %lo(D_1DA2270)
/* 137690 00237590 21186400 */  addu       $3, $3, $4
/* 137694 00237594 000065AC */  sw         $5, 0x0($3)
/* 137698 00237598 0D00C004 */  bltz       $6, .L002375D0
/* 13769C 0023759C 00000000 */   nop
/* 1376A0 002375A0 0A00C128 */  slti       $at, $6, 0xA
/* 1376A4 002375A4 0A002010 */  beqz       $at, .L002375D0
/* 1376A8 002375A8 00000000 */   nop
/* 1376AC 002375AC C0200600 */  sll        $4, $6, 3
/* 1376B0 002375B0 DA01033C */  lui        $3, %hi(D_1DA22E0)
/* 1376B4 002375B4 E0226324 */  addiu      $3, $3, %lo(D_1DA22E0)
/* 1376B8 002375B8 21186400 */  addu       $3, $3, $4
/* 1376BC 002375BC 000065AC */  sw         $5, 0x0($3)
/* 1376C0 002375C0 DA01033C */  lui        $3, %hi(D_1DA22E4)
/* 1376C4 002375C4 E4226324 */  addiu      $3, $3, %lo(D_1DA22E4)
/* 1376C8 002375C8 21186400 */  addu       $3, $3, $4
/* 1376CC 002375CC 000065AC */  sw         $5, 0x0($3)
.L002375D0:
/* 1376D0 002375D0 0100C624 */  addiu      $6, $6, 0x1
.L002375D4:
/* 1376D4 002375D4 0400C328 */  slti       $3, $6, 0x4
/* 1376D8 002375D8 E9FF6014 */  bnez       $3, .L00237580
/* 1376DC 002375DC 00000000 */   nop
/* 1376E0 002375E0 CA000010 */  b          .L0023790C
/* 1376E4 002375E4 00000000 */   nop
/* 1376E8 002375E8 101321C6 */  lwc1       $f1, 0x1310($17)
/* 1376EC 002375EC 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 1376F0 002375F0 00008344 */  mtc1       $3, $f0
/* 1376F4 002375F4 00000000 */  nop
/* 1376F8 002375F8 40080046 */  add.s      $f1, $f1, $f0
/* 1376FC 002375FC 101321E6 */  swc1       $f1, 0x1310($17)
/* 137700 00237600 0C43033C */  lui        $3, (0x430C0000 >> 16)
/* 137704 00237604 00008344 */  mtc1       $3, $f0
/* 137708 00237608 00000000 */  nop
/* 13770C 0023760C 34080046 */  c.lt.s     $f1, $f0
/* 137710 00237610 00000000 */  nop
/* 137714 00237614 BD000145 */  bc1t       .L0023790C
/* 137718 00237618 00000000 */   nop
/* 13771C 0023761C 03000324 */  addiu      $3, $0, 0x3
/* 137720 00237620 141323A6 */  sh         $3, 0x1314($17)
/* 137724 00237624 B9000010 */  b          .L0023790C
/* 137728 00237628 00000000 */   nop
/* 13772C 0023762C 101321C6 */  lwc1       $f1, 0x1310($17)
/* 137730 00237630 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 137734 00237634 00008344 */  mtc1       $3, $f0
/* 137738 00237638 00000000 */  nop
/* 13773C 0023763C 00080046 */  add.s      $f0, $f1, $f0
/* 137740 00237640 101320E6 */  swc1       $f0, 0x1310($17)
/* 137744 00237644 03000324 */  addiu      $3, $0, 0x3
/* 137748 00237648 B0000316 */  bne        $16, $3, .L0023790C
/* 13774C 0023764C 00000000 */   nop
/* 137750 00237650 4843033C */  lui        $3, (0x43480000 >> 16)
/* 137754 00237654 101323AE */  sw         $3, 0x1310($17)
/* 137758 00237658 001320A6 */  sh         $0, 0x1300($17)
/* 13775C 0023765C AB000010 */  b          .L0023790C
/* 137760 00237660 00000000 */   nop
/* 137764 00237664 101321C6 */  lwc1       $f1, 0x1310($17)
/* 137768 00237668 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 13776C 0023766C 00008344 */  mtc1       $3, $f0
/* 137770 00237670 00000000 */  nop
/* 137774 00237674 00080046 */  add.s      $f0, $f1, $f0
/* 137778 00237678 101320E6 */  swc1       $f0, 0x1310($17)
/* 13777C 0023767C 03000324 */  addiu      $3, $0, 0x3
/* 137780 00237680 A2000316 */  bne        $16, $3, .L0023790C
/* 137784 00237684 00000000 */   nop
/* 137788 00237688 DC122286 */  lh         $2, 0x12DC($17)
/* 13778C 0023768C 01004224 */  addiu      $2, $2, 0x1
/* 137790 00237690 DC1222A6 */  sh         $2, 0x12DC($17)
/* 137794 00237694 DC122286 */  lh         $2, 0x12DC($17)
/* 137798 00237698 880D22AE */  sw         $2, 0xD88($17)
/* 13779C 0023769C 06000224 */  addiu      $2, $0, 0x6
/* 1377A0 002376A0 840D22AE */  sw         $2, 0xD84($17)
/* 1377A4 002376A4 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 1377A8 002376A8 800D22AE */  sw         $2, 0xD80($17)
/* 1377AC 002376AC 14132286 */  lh         $2, 0x1314($17)
/* 1377B0 002376B0 01004224 */  addiu      $2, $2, 0x1
/* 1377B4 002376B4 141322A6 */  sh         $2, 0x1314($17)
/* 1377B8 002376B8 101320AE */  sw         $0, 0x1310($17)
/* 1377BC 002376BC 01001024 */  addiu      $16, $0, 0x1
/* 1377C0 002376C0 D412228E */  lw         $2, 0x12D4($17)
/* 1377C4 002376C4 00004484 */  lh         $4, 0x0($2)
/* 1377C8 002376C8 70CF070C */  jal        IsDefaultWeapon__Fi
/* 1377CC 002376CC 00000000 */   nop
/* 1377D0 002376D0 06004004 */  bltz       $2, .L002376EC
/* 1377D4 002376D4 00000000 */   nop
/* 1377D8 002376D8 28860070 */  paddub     $16, $0, $0
/* 1377DC 002376DC D412228E */  lw         $2, 0x12D4($17)
/* 1377E0 002376E0 020040A4 */  sh         $0, 0x2($2)
/* 1377E4 002376E4 01000224 */  addiu      $2, $0, 0x1
/* 1377E8 002376E8 E11222A2 */  sb         $2, 0x12E1($17)
.L002376EC:
/* 1377EC 002376EC 0B000012 */  beqz       $16, .L0023771C
/* 1377F0 002376F0 00000000 */   nop
/* 1377F4 002376F4 D412248E */  lw         $4, 0x12D4($17)
/* 1377F8 002376F8 282E0070 */  paddub     $5, $0, $0
/* 1377FC 002376FC F8000624 */  addiu      $6, $0, 0xF8
/* 137800 00237700 5A0D040C */  jal        memset
/* 137804 00237704 00000000 */   nop
/* 137808 00237708 FFFF0424 */  addiu      $4, $0, -0x1
/* 13780C 0023770C D412238E */  lw         $3, 0x12D4($17)
/* 137810 00237710 000064A4 */  sh         $4, 0x0($3)
/* 137814 00237714 7D000010 */  b          .L0023790C
/* 137818 00237718 00000000 */   nop
.L0023771C:
/* 13781C 0023771C D412258E */  lw         $5, 0x12D4($17)
/* 137820 00237720 0000A484 */  lh         $4, 0x0($5)
/* 137824 00237724 24C9080C */  jal        WepDataListToHaveCopy__FiP11WEAPON_HAVE
/* 137828 00237728 00000000 */   nop
/* 13782C 0023772C 77000010 */  b          .L0023790C
/* 137830 00237730 00000000 */   nop
/* 137834 00237734 101321C6 */  lwc1       $f1, 0x1310($17)
/* 137838 00237738 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 13783C 0023773C 00008344 */  mtc1       $3, $f0
/* 137840 00237740 00000000 */  nop
/* 137844 00237744 00080046 */  add.s      $f0, $f1, $f0
/* 137848 00237748 101320E6 */  swc1       $f0, 0x1310($17)
/* 13784C 0023774C 03000324 */  addiu      $3, $0, 0x3
/* 137850 00237750 6E000316 */  bne        $16, $3, .L0023790C
/* 137854 00237754 00000000 */   nop
/* 137858 00237758 4041033C */  lui        $3, (0x41400000 >> 16)
/* 13785C 0023775C 101323AE */  sw         $3, 0x1310($17)
/* 137860 00237760 001320A6 */  sh         $0, 0x1300($17)
/* 137864 00237764 69000010 */  b          .L0023790C
/* 137868 00237768 00000000 */   nop
/* 13786C 0023776C 03000324 */  addiu      $3, $0, 0x3
/* 137870 00237770 66000316 */  bne        $16, $3, .L0023790C
/* 137874 00237774 00000000 */   nop
/* 137878 00237778 DC122286 */  lh         $2, 0x12DC($17)
/* 13787C 0023777C 01004224 */  addiu      $2, $2, 0x1
/* 137880 00237780 DC1222A6 */  sh         $2, 0x12DC($17)
/* 137884 00237784 DE122586 */  lh         $5, 0x12DE($17)
/* 137888 00237788 D412248E */  lw         $4, 0x12D4($17)
/* 13788C 0023778C C8D4080C */  jal        SetWeaponBuildValue__FP11WEAPON_HAVEi
/* 137890 00237790 00000000 */   nop
/* 137894 00237794 DE122386 */  lh         $3, 0x12DE($17)
/* 137898 00237798 D412228E */  lw         $2, 0x12D4($17)
/* 13789C 0023779C 000043A4 */  sh         $3, 0x0($2)
/* 1378A0 002377A0 D412228E */  lw         $2, 0x12D4($17)
/* 1378A4 002377A4 020040A4 */  sh         $0, 0x2($2)
/* 1378A8 002377A8 D412228E */  lw         $2, 0x12D4($17)
/* 1378AC 002377AC 140040A4 */  sh         $0, 0x14($2)
/* 1378B0 002377B0 DE122486 */  lh         $4, 0x12DE($17)
/* 1378B4 002377B4 EC3D080C */  jal        DefaultWeaponOptionSet__Fi
/* 1378B8 002377B8 00000000 */   nop
/* 1378BC 002377BC 01000324 */  addiu      $3, $0, 0x1
/* 1378C0 002377C0 08004310 */  beq        $2, $3, .L002377E4
/* 1378C4 002377C4 00000000 */   nop
/* 1378C8 002377C8 28264070 */  paddub     $4, $2, $0
/* 1378CC 002377CC B83D080C */  jal        CheckWeaponOptionStatus__Fi
/* 1378D0 002377D0 00000000 */   nop
/* 1378D4 002377D4 D412248E */  lw         $4, 0x12D4($17)
/* 1378D8 002377D8 EE008384 */  lh         $3, 0xEE($4)
/* 1378DC 002377DC 25106200 */  or         $2, $3, $2
/* 1378E0 002377E0 EE0082A4 */  sh         $2, 0xEE($4)
.L002377E4:
/* 1378E4 002377E4 049580AF */  sw         $0, -0x6AFC($gp)
/* 1378E8 002377E8 01000224 */  addiu      $2, $0, 0x1
/* 1378EC 002377EC E01222A2 */  sb         $2, 0x12E0($17)
/* 1378F0 002377F0 DC122286 */  lh         $2, 0x12DC($17)
/* 1378F4 002377F4 880D22AE */  sw         $2, 0xD88($17)
/* 1378F8 002377F8 06000224 */  addiu      $2, $0, 0x6
/* 1378FC 002377FC 840D22AE */  sw         $2, 0xD84($17)
/* 137900 00237800 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 137904 00237804 800D22AE */  sw         $2, 0xD80($17)
/* 137908 00237808 2A00023C */  lui        $2, %hi(_1352_3)
/* 13790C 0023780C B0F44424 */  addiu      $4, $2, %lo(_1352_3)
/* 137910 00237810 A611040C */  jal        printf
/* 137914 00237814 00000000 */   nop
/* 137918 00237818 14132386 */  lh         $3, 0x1314($17)
/* 13791C 0023781C 01006324 */  addiu      $3, $3, 0x1
/* 137920 00237820 141323A6 */  sh         $3, 0x1314($17)
/* 137924 00237824 39000010 */  b          .L0023790C
/* 137928 00237828 00000000 */   nop
/* 13792C 0023782C 03000324 */  addiu      $3, $0, 0x3
/* 137930 00237830 36000316 */  bne        $16, $3, .L0023790C
/* 137934 00237834 00000000 */   nop
/* 137938 00237838 001320A6 */  sh         $0, 0x1300($17)
/* 13793C 0023783C 33000010 */  b          .L0023790C
/* 137940 00237840 00000000 */   nop
/* 137944 00237844 03000324 */  addiu      $3, $0, 0x3
/* 137948 00237848 30000316 */  bne        $16, $3, .L0023790C
/* 13794C 0023784C 00000000 */   nop
/* 137950 00237850 001320A6 */  sh         $0, 0x1300($17)
/* 137954 00237854 2D000010 */  b          .L0023790C
/* 137958 00237858 00000000 */   nop
/* 13795C 0023785C 100434C6 */  lwc1       $f20, 0x410($17)
/* 137960 00237860 06A30046 */  mov.s      $f12, $f20
/* 137964 00237864 9044040C */  jal        fptodp
/* 137968 00237868 00000000 */   nop
/* 13796C 0023786C 4A40033C */  lui        $3, (0x404A0000 >> 16)
/* 137970 00237870 3C280300 */  dsll32     $5, $3, 0
/* 137974 00237874 28264070 */  paddub     $4, $2, $0
/* 137978 00237878 5800040C */  jal        _dpfgt
/* 13797C 0023787C 00000000 */   nop
/* 137980 00237880 0D004010 */  beqz       $2, .L002378B8
/* 137984 00237884 00000000 */   nop
/* 137988 00237888 06A30046 */  mov.s      $f12, $f20
/* 13798C 0023788C 9044040C */  jal        fptodp
/* 137990 00237890 00000000 */   nop
/* 137994 00237894 388085DF */  ld         $5, -0x7FC8($gp)
/* 137998 00237898 28264070 */  paddub     $4, $2, $0
/* 13799C 0023789C 4400040C */  jal        _dpflt
/* 1379A0 002378A0 00000000 */   nop
/* 1379A4 002378A4 04004010 */  beqz       $2, .L002378B8
/* 1379A8 002378A8 00000000 */   nop
/* 1379AC 002378AC 13000424 */  addiu      $4, $0, 0x13
/* 1379B0 002378B0 BCB3080C */  jal        ComMenuSePlay__Fi
/* 1379B4 002378B4 00000000 */   nop
.L002378B8:
/* 1379B8 002378B8 03000324 */  addiu      $3, $0, 0x3
/* 1379BC 002378BC 13000316 */  bne        $16, $3, .L0023790C
/* 1379C0 002378C0 00000000 */   nop
/* 1379C4 002378C4 E2122386 */  lh         $3, 0x12E2($17)
/* 1379C8 002378C8 90016328 */  slti       $3, $3, 0x190
/* 1379CC 002378CC 04006014 */  bnez       $3, .L002378E0
/* 1379D0 002378D0 00000000 */   nop
/* 1379D4 002378D4 001320A6 */  sh         $0, 0x1300($17)
/* 1379D8 002378D8 0C000010 */  b          .L0023790C
/* 1379DC 002378DC 00000000 */   nop
.L002378E0:
/* 1379E0 002378E0 01000224 */  addiu      $2, $0, 0x1
/* 1379E4 002378E4 001322A6 */  sh         $2, 0x1300($17)
/* 1379E8 002378E8 28262072 */  paddub     $4, $17, $0
/* 1379EC 002378EC 7CD8080C */  jal        Initialize__14CWeaponLevelUpFv
/* 1379F0 002378F0 00000000 */   nop
/* 1379F4 002378F4 05000010 */  b          .L0023790C
/* 1379F8 002378F8 00000000 */   nop
/* 1379FC 002378FC 03000324 */  addiu      $3, $0, 0x3
/* 137A00 00237900 02000316 */  bne        $16, $3, .L0023790C
/* 137A04 00237904 00000000 */   nop
/* 137A08 00237908 001320A6 */  sh         $0, 0x1300($17)
.L0023790C:
/* 137A0C 0023790C 4000BF7B */  lq         $31, 0x40($sp)
/* 137A10 00237910 3000B27B */  lq         $18, 0x30($sp)
/* 137A14 00237914 2000B17B */  lq         $17, 0x20($sp)
/* 137A18 00237918 1000B07B */  lq         $16, 0x10($sp)
/* 137A1C 0023791C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 137A20 00237920 5001BD27 */  addiu      $sp, $sp, 0x150
/* 137A24 00237924 0800E003 */  jr         $31
/* 137A28 00237928 00000000 */   nop
/* 137A2C 0023792C 00000000 */  nop
