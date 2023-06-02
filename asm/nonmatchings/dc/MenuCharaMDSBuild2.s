.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuCharaMDSBuild2__Fii
/* 10E380 0020E280 60FEBD27 */  addiu      $sp, $sp, -0x1A0
/* 10E384 0020E284 3000BF7F */  sq         $31, 0x30($sp)
/* 10E388 0020E288 2000B27F */  sq         $18, 0x20($sp)
/* 10E38C 0020E28C 1000B17F */  sq         $17, 0x10($sp)
/* 10E390 0020E290 0000B07F */  sq         $16, 0x0($sp)
/* 10E394 0020E294 288E8070 */  paddub     $17, $4, $0
/* 10E398 0020E298 2886A070 */  paddub     $16, $5, $0
/* 10E39C 0020E29C 01002626 */  addiu      $6, $17, 0x1
/* 10E3A0 0020E2A0 4000A427 */  addiu      $4, $sp, 0x40
/* 10E3A4 0020E2A4 2A00023C */  lui        $2, %hi(_1199_2)
/* 10E3A8 0020E2A8 90E04524 */  addiu      $5, $2, %lo(_1199_2)
/* 10E3AC 0020E2AC 1614040C */  jal        sprintf
/* 10E3B0 0020E2B0 00000000 */   nop
/* 10E3B4 0020E2B4 2900023C */  lui        $2, %hi(_1179)
/* 10E3B8 0020E2B8 B03A4524 */  addiu      $5, $2, %lo(_1179)
/* 10E3BC 0020E2BC 6000A427 */  addiu      $4, $sp, 0x60
/* 10E3C0 0020E2C0 02000324 */  addiu      $3, $0, 0x2
.L0020E2C4:
/* 10E3C4 0020E2C4 0000A278 */  lq         $2, 0x0($5)
/* 10E3C8 0020E2C8 1000A524 */  addiu      $5, $5, 0x10
/* 10E3CC 0020E2CC FFFF6324 */  addiu      $3, $3, -0x1
/* 10E3D0 0020E2D0 0000827C */  sq         $2, 0x0($4)
/* 10E3D4 0020E2D4 10008424 */  addiu      $4, $4, 0x10
/* 10E3D8 0020E2D8 FAFF601C */  bgtz       $3, .L0020E2C4
/* 10E3DC 0020E2DC 00000000 */   nop
/* 10E3E0 0020E2E0 0000A2C4 */  lwc1       $f2, 0x0($5)
/* 10E3E4 0020E2E4 000082E4 */  swc1       $f2, 0x0($4)
/* 10E3E8 0020E2E8 6400B0AF */  sw         $16, 0x64($sp)
/* 10E3EC 0020E2EC 7000B0AF */  sw         $16, 0x70($sp)
/* 10E3F0 0020E2F0 F495848F */  lw         $4, -0x6A0C($gp)
/* 10E3F4 0020E2F4 18FB040C */  jal        GetReadBGFile__Fi
/* 10E3F8 0020E2F8 00000000 */   nop
/* 10E3FC 0020E2FC 28964070 */  paddub     $18, $2, $0
/* 10E400 0020E300 8C00448C */  lw         $4, 0x8C($2)
/* 10E404 0020E304 4000A527 */  addiu      $5, $sp, 0x40
/* 10E408 0020E308 9C01A627 */  addiu      $6, $sp, 0x19C
/* 10E40C 0020E30C C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 10E410 0020E310 00000000 */   nop
/* 10E414 0020E314 6C00A2AF */  sw         $2, 0x6C($sp)
/* 10E418 0020E318 C701023C */  lui        $2, %hi(TexManager)
/* 10E41C 0020E31C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10E420 0020E320 282E0072 */  paddub     $5, $16, $0
/* 10E424 0020E324 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 10E428 0020E328 00000000 */   nop
/* 10E42C 0020E32C C701023C */  lui        $2, %hi(TexManager)
/* 10E430 0020E330 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10E434 0020E334 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 10E438 0020E338 00000000 */   nop
/* 10E43C 0020E33C C701023C */  lui        $2, %hi(TexManager)
/* 10E440 0020E340 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10E444 0020E344 FFFF0524 */  addiu      $5, $0, -0x1
/* 10E448 0020E348 6000A627 */  addiu      $6, $sp, 0x60
/* 10E44C 0020E34C 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 10E450 0020E350 00000000 */   nop
/* 10E454 0020E354 8C00508E */  lw         $16, 0x8C($18)
/* 10E458 0020E358 9000428E */  lw         $2, 0x90($18)
/* 10E45C 0020E35C 03110200 */  sra        $2, $2, 4
/* 10E460 0020E360 00110200 */  sll        $2, $2, 4
/* 10E464 0020E364 21100202 */  addu       $2, $16, $2
/* 10E468 0020E368 10005224 */  addiu      $18, $2, 0x10
/* 10E46C 0020E36C 01002626 */  addiu      $6, $17, 0x1
/* 10E470 0020E370 4000A427 */  addiu      $4, $sp, 0x40
/* 10E474 0020E374 2A00023C */  lui        $2, %hi(_1200)
/* 10E478 0020E378 A0E04524 */  addiu      $5, $2, %lo(_1200)
/* 10E47C 0020E37C 1614040C */  jal        sprintf
/* 10E480 0020E380 00000000 */   nop
/* 10E484 0020E384 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10E488 0020E388 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10E48C 0020E38C 74E6040C */  jal        Initialize__10CCharacterFv
/* 10E490 0020E390 00000000 */   nop
/* 10E494 0020E394 D901013C */  lui        $at, (0x1D90410 >> 16)
/* 10E498 0020E398 100432AC */  sw         $18, (0x1D90410 & 0xFFFF)($at)
/* 10E49C 0020E39C 00DC0234 */  ori        $2, $0, 0xDC00
/* 10E4A0 0020E3A0 D901013C */  lui        $at, (0x1D9041C >> 16)
/* 10E4A4 0020E3A4 1C0422AC */  sw         $2, (0x1D9041C & 0xFFFF)($at)
/* 10E4A8 0020E3A8 D901013C */  lui        $at, (0x1D90418 >> 16)
/* 10E4AC 0020E3AC 180420AC */  sw         $0, (0x1D90418 & 0xFFFF)($at)
/* 10E4B0 0020E3B0 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10E4B4 0020E3B4 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10E4B8 0020E3B8 282E0072 */  paddub     $5, $16, $0
/* 10E4BC 0020E3BC 4000A627 */  addiu      $6, $sp, 0x40
/* 10E4C0 0020E3C0 D901023C */  lui        $2, %hi(MenuExCashBuffer)
/* 10E4C4 0020E3C4 10044724 */  addiu      $7, $2, %lo(MenuExCashBuffer)
/* 10E4C8 0020E3C8 D901023C */  lui        $2, %hi(MenuExCashBuffer)
/* 10E4CC 0020E3CC 10044824 */  addiu      $8, $2, %lo(MenuExCashBuffer)
/* 10E4D0 0020E3D0 284E0070 */  paddub     $9, $0, $0
/* 10E4D4 0020E3D4 08E6040C */  jal        LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
/* 10E4D8 0020E3D8 00000000 */   nop
/* 10E4DC 0020E3DC 9000A427 */  addiu      $4, $sp, 0x90
/* 10E4E0 0020E3E0 509F040C */  jal        __ct__10CFrameAttrFv
/* 10E4E4 0020E3E4 00000000 */   nop
/* 10E4E8 0020E3E8 01000624 */  addiu      $6, $0, 0x1
/* 10E4EC 0020E3EC 9C00A6A3 */  sb         $6, 0x9C($sp)
/* 10E4F0 0020E3F0 9800A0A3 */  sb         $0, 0x98($sp)
/* 10E4F4 0020E3F4 9B00A0A3 */  sb         $0, 0x9B($sp)
/* 10E4F8 0020E3F8 D901013C */  lui        $at, (0x1D9053C >> 16)
/* 10E4FC 0020E3FC 3C05248C */  lw         $4, (0x1D9053C & 0xFFFF)($at)
/* 10E500 0020E400 05008010 */  beqz       $4, .L0020E418
/* 10E504 0020E404 00000000 */   nop
/* 10E508 0020E408 9000A527 */  addiu      $5, $sp, 0x90
/* 10E50C 0020E40C 04000724 */  addiu      $7, $0, 0x4
/* 10E510 0020E410 D4A2040C */  jal        SetAttr__6CFrameFR10CFrameAttrii
/* 10E514 0020E414 00000000 */   nop
.L0020E418:
/* 10E518 0020E418 2900023C */  lui        $2, %hi(_1182_2)
/* 10E51C 0020E41C E03A4624 */  addiu      $6, $2, %lo(_1182_2)
/* 10E520 0020E420 F000A527 */  addiu      $5, $sp, 0xF0
/* 10E524 0020E424 03000424 */  addiu      $4, $0, 0x3
.L0020E428:
/* 10E528 0020E428 0000C378 */  lq         $3, 0x0($6)
/* 10E52C 0020E42C 1000C278 */  lq         $2, 0x10($6)
/* 10E530 0020E430 2000C624 */  addiu      $6, $6, 0x20
/* 10E534 0020E434 FFFF8424 */  addiu      $4, $4, -0x1
/* 10E538 0020E438 0000A37C */  sq         $3, 0x0($5)
/* 10E53C 0020E43C 1000A27C */  sq         $2, 0x10($5)
/* 10E540 0020E440 2000A524 */  addiu      $5, $5, 0x20
/* 10E544 0020E444 F8FF801C */  bgtz       $4, .L0020E428
/* 10E548 0020E448 00000000 */   nop
/* 10E54C 0020E44C 2900023C */  lui        $2, %hi(_1183_2)
/* 10E550 0020E450 403B4524 */  addiu      $5, $2, %lo(_1183_2)
/* 10E554 0020E454 5001A427 */  addiu      $4, $sp, 0x150
/* 10E558 0020E458 04000324 */  addiu      $3, $0, 0x4
.L0020E45C:
/* 10E55C 0020E45C 0000A278 */  lq         $2, 0x0($5)
/* 10E560 0020E460 1000A524 */  addiu      $5, $5, 0x10
/* 10E564 0020E464 FFFF6324 */  addiu      $3, $3, -0x1
/* 10E568 0020E468 0000827C */  sq         $2, 0x0($4)
/* 10E56C 0020E46C 10008424 */  addiu      $4, $4, 0x10
/* 10E570 0020E470 FAFF601C */  bgtz       $3, .L0020E45C
/* 10E574 0020E474 00000000 */   nop
/* 10E578 0020E478 0000A2DC */  ld         $2, 0x0($5)
/* 10E57C 0020E47C 000082FC */  sd         $2, 0x0($4)
/* 10E580 0020E480 00111100 */  sll        $2, $17, 4
/* 10E584 0020E484 21185D00 */  addu       $3, $2, $sp
/* 10E588 0020E488 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10E58C 0020E48C 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10E590 0020E490 F0006524 */  addiu      $5, $3, 0xF0
/* 10E594 0020E494 38E4040C */  jal        SetPosition__10CCharacterFPf
/* 10E598 0020E498 00000000 */   nop
/* 10E59C 0020E49C 28262072 */  paddub     $4, $17, $0
/* 10E5A0 0020E4A0 BC37080C */  jal        SetNowCharaMotionNo__Fi
/* 10E5A4 0020E4A4 00000000 */   nop
/* 10E5A8 0020E4A8 40101100 */  sll        $2, $17, 1
/* 10E5AC 0020E4AC 21105100 */  addu       $2, $2, $17
/* 10E5B0 0020E4B0 80100200 */  sll        $2, $2, 2
/* 10E5B4 0020E4B4 21185D00 */  addu       $3, $2, $sp
/* 10E5B8 0020E4B8 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10E5BC 0020E4BC 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10E5C0 0020E4C0 50016524 */  addiu      $5, $3, 0x150
/* 10E5C4 0020E4C4 B8E4040C */  jal        SetScale__10CCharacterFPf
/* 10E5C8 0020E4C8 00000000 */   nop
/* 10E5CC 0020E4CC D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10E5D0 0020E4D0 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10E5D4 0020E4D4 4CE1040C */  jal        Step__10CCharacterFv
/* 10E5D8 0020E4D8 00000000 */   nop
/* 10E5DC 0020E4DC 0B002016 */  bnez       $17, .L0020E50C
/* 10E5E0 0020E4E0 00000000 */   nop
/* 10E5E4 0020E4E4 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10E5E8 0020E4E8 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10E5EC 0020E4EC FFFF0524 */  addiu      $5, $0, -0x1
/* 10E5F0 0020E4F0 94E3040C */  jal        ClothStep__10CCharacterFi
/* 10E5F4 0020E4F4 00000000 */   nop
/* 10E5F8 0020E4F8 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10E5FC 0020E4FC 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10E600 0020E500 282E0070 */  paddub     $5, $0, $0
/* 10E604 0020E504 94E3040C */  jal        ClothStep__10CCharacterFi
/* 10E608 0020E508 00000000 */   nop
.L0020E50C:
/* 10E60C 0020E50C 3000BF7B */  lq         $31, 0x30($sp)
/* 10E610 0020E510 2000B27B */  lq         $18, 0x20($sp)
/* 10E614 0020E514 1000B17B */  lq         $17, 0x10($sp)
/* 10E618 0020E518 0000B07B */  lq         $16, 0x0($sp)
/* 10E61C 0020E51C A001BD27 */  addiu      $sp, $sp, 0x1A0
/* 10E620 0020E520 0800E003 */  jr         $31
/* 10E624 0020E524 00000000 */   nop
/* 10E628 0020E528 00000000 */  nop
/* 10E62C 0020E52C 00000000 */  nop
