.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MainDraw__Fv_2
/* 9D3D0 0019D2D0 E0FEBD27 */  addiu      $sp, $sp, -0x120
/* 9D3D4 0019D2D4 4000BF7F */  sq         $31, 0x40($sp)
/* 9D3D8 0019D2D8 3000B37F */  sq         $19, 0x30($sp)
/* 9D3DC 0019D2DC 2000B27F */  sq         $18, 0x20($sp)
/* 9D3E0 0019D2E0 1000B17F */  sq         $17, 0x10($sp)
/* 9D3E4 0019D2E4 0000B07F */  sq         $16, 0x0($sp)
/* 9D3E8 0019D2E8 6C90838F */  lw         $3, -0x6F94($gp)
/* 9D3EC 0019D2EC 9B016014 */  bnez       $3, .L0019D95C
/* 9D3F0 0019D2F0 00000000 */   nop
/* 9D3F4 0019D2F4 9492838F */  lw         $3, -0x6D6C($gp)
/* 9D3F8 0019D2F8 05000224 */  addiu      $2, $0, 0x5
/* 9D3FC 0019D2FC 05006214 */  bne        $3, $2, .L0019D314
/* 9D400 0019D300 00000000 */   nop
/* 9D404 0019D304 01000224 */  addiu      $2, $0, 0x1
/* 9D408 0019D308 908E82AF */  sw         $2, -0x7170($gp)
/* 9D40C 0019D30C 02000010 */  b          .L0019D318
/* 9D410 0019D310 00000000 */   nop
.L0019D314:
/* 9D414 0019D314 908E80AF */  sw         $0, -0x7170($gp)
.L0019D318:
/* 9D418 0019D318 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9D41C 0019D31C ACD4228C */  lw         $2, -0x2B54($at)
/* 9D420 0019D320 709082AF */  sw         $2, -0x6F90($gp)
/* 9D424 0019D324 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9D428 0019D328 B0D4228C */  lw         $2, -0x2B50($at)
/* 9D42C 0019D32C 749082AF */  sw         $2, -0x6F8C($gp)
/* 9D430 0019D330 AC92848F */  lw         $4, -0x6D54($gp)
/* 9D434 0019D334 5000A527 */  addiu      $5, $sp, 0x50
/* 9D438 0019D338 A000998C */  lw         $25, 0xA0($4)
/* 9D43C 0019D33C A000398F */  lw         $25, 0xA0($25)
/* 9D440 0019D340 09F82003 */  jalr       $25
/* 9D444 0019D344 00000000 */   nop
/* 9D448 0019D348 4040023C */  lui        $2, (0x40400000 >> 16)
/* 9D44C 0019D34C 00088244 */  mtc1       $2, $f1
/* 9D450 0019D350 B09280C7 */  lwc1       $f0, -0x6D50($gp)
/* 9D454 0019D354 03030146 */  div.s      $f12, $f0, $f1
/* 9D458 0019D358 2C44040C */  jal        fptosi
/* 9D45C 0019D35C 00000000 */   nop
/* 9D460 0019D360 7090828F */  lw         $2, -0x6F90($gp)
/* 9D464 0019D364 2C004014 */  bnez       $2, .L0019D418
/* 9D468 0019D368 00000000 */   nop
/* 9D46C 0019D36C A0B8040C */  jal        GetVif1Packet__Fv
/* 9D470 0019D370 00000000 */   nop
/* 9D474 0019D374 C701033C */  lui        $3, %hi(TexManager)
/* 9D478 0019D378 70586424 */  addiu      $4, $3, %lo(TexManager)
/* 9D47C 0019D37C 282E4070 */  paddub     $5, $2, $0
/* 9D480 0019D380 0F000624 */  addiu      $6, $0, 0xF
/* 9D484 0019D384 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 9D488 0019D388 00000000 */   nop
/* 9D48C 0019D38C D501023C */  lui        $2, %hi(TexAnime_2)
/* 9D490 0019D390 A0BD4424 */  addiu      $4, $2, %lo(TexAnime_2)
/* 9D494 0019D394 0F000524 */  addiu      $5, $0, 0xF
/* 9D498 0019D398 5C9C050C */  jal        TexAnime__13CTextureAnimeFi
/* 9D49C 0019D39C 00000000 */   nop
/* 9D4A0 0019D3A0 6C7E060C */  jal        setTexAnim__Fv
/* 9D4A4 0019D3A4 00000000 */   nop
/* 9D4A8 0019D3A8 2700023C */  lui        $2, %hi(_909)
/* 9D4AC 0019D3AC 50A64224 */  addiu      $2, $2, %lo(_909)
/* 9D4B0 0019D3B0 6000A327 */  addiu      $3, $sp, 0x60
/* 9D4B4 0019D3B4 00004278 */  lq         $2, 0x0($2)
/* 9D4B8 0019D3B8 0000627C */  sq         $2, 0x0($3)
/* 9D4BC 0019D3BC 28860070 */  paddub     $16, $0, $0
/* 9D4C0 0019D3C0 11000010 */  b          .L0019D408
/* 9D4C4 0019D3C4 00000000 */   nop
.L0019D3C8:
/* 9D4C8 0019D3C8 C0101000 */  sll        $2, $16, 3
/* 9D4CC 0019D3CC 23185000 */  subu       $3, $2, $16
/* 9D4D0 0019D3D0 80100300 */  sll        $2, $3, 2
/* 9D4D4 0019D3D4 23104300 */  subu       $2, $2, $3
/* 9D4D8 0019D3D8 40190200 */  sll        $3, $2, 5
/* 9D4DC 0019D3DC D501023C */  lui        $2, %hi(InteriorParts)
/* 9D4E0 0019D3E0 F0D54224 */  addiu      $2, $2, %lo(InteriorParts)
/* 9D4E4 0019D3E4 21204300 */  addu       $4, $2, $3
/* 9D4E8 0019D3E8 B0928CC7 */  lwc1       $f12, -0x6D50($gp)
/* 9D4EC 0019D3EC 6000A527 */  addiu      $5, $sp, 0x60
/* 9D4F0 0019D3F0 28360070 */  paddub     $6, $0, $0
/* 9D4F4 0019D3F4 283E0070 */  paddub     $7, $0, $0
/* 9D4F8 0019D3F8 28460070 */  paddub     $8, $0, $0
/* 9D4FC 0019D3FC 986C060C */  jal        DrawParts__9CMapPartsFfPfiiPi
/* 9D500 0019D400 00000000 */   nop
/* 9D504 0019D404 01001026 */  addiu      $16, $16, 0x1
.L0019D408:
/* 9D508 0019D408 BC92828F */  lw         $2, -0x6D44($gp)
/* 9D50C 0019D40C 2A100202 */  slt        $2, $16, $2
/* 9D510 0019D410 EDFF4014 */  bnez       $2, .L0019D3C8
/* 9D514 0019D414 00000000 */   nop
.L0019D418:
/* 9D518 0019D418 0001A427 */  addiu      $4, $sp, 0x100
/* 9D51C 0019D41C 4CBC040C */  jal        MGGetFBuffTex__FP9sceGsTex0
/* 9D520 0019D420 00000000 */   nop
/* 9D524 0019D424 7000A0AF */  sw         $0, 0x70($sp)
/* 9D528 0019D428 7400A0AF */  sw         $0, 0x74($sp)
/* 9D52C 0019D42C 80020224 */  addiu      $2, $0, 0x280
/* 9D530 0019D430 7800A2AF */  sw         $2, 0x78($sp)
/* 9D534 0019D434 E0000224 */  addiu      $2, $0, 0xE0
/* 9D538 0019D438 7C00A2AF */  sw         $2, 0x7C($sp)
/* 9D53C 0019D43C C701023C */  lui        $2, %hi(TexManager)
/* 9D540 0019D440 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 9D544 0019D444 2A00023C */  lui        $2, %hi(_1082_2)
/* 9D548 0019D448 10B34524 */  addiu      $5, $2, %lo(_1082_2)
/* 9D54C 0019D44C FFFF0624 */  addiu      $6, $0, -0x1
/* 9D550 0019D450 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 9D554 0019D454 00000000 */   nop
/* 9D558 0019D458 0801A627 */  addiu      $6, $sp, 0x108
/* 9D55C 0019D45C 280042DC */  ld         $2, 0x28($2)
/* 9D560 0019D460 0000C2FC */  sd         $2, 0x0($6)
/* 9D564 0019D464 0001A427 */  addiu      $4, $sp, 0x100
/* 9D568 0019D468 7000A527 */  addiu      $5, $sp, 0x70
/* 9D56C 0019D46C 283E0070 */  paddub     $7, $0, $0
/* 9D570 0019D470 28460070 */  paddub     $8, $0, $0
/* 9D574 0019D474 284E0070 */  paddub     $9, $0, $0
/* 9D578 0019D478 84BC040C */  jal        MGMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0iii
/* 9D57C 0019D47C 00000000 */   nop
/* 9D580 0019D480 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9D584 0019D484 B03A4424 */  addiu      $4, $2, %lo(MainCamera_2)
/* 9D588 0019D488 8000A527 */  addiu      $5, $sp, 0x80
/* 9D58C 0019D48C A891040C */  jal        GetRef__7CCameraFPf
/* 9D590 0019D490 00000000 */   nop
/* 9D594 0019D494 1001A427 */  addiu      $4, $sp, 0x110
/* 9D598 0019D498 F08B82DF */  ld         $2, -0x7410($gp)
/* 9D59C 0019D49C 000082FC */  sd         $2, 0x0($4)
/* 9D5A0 0019D4A0 1401A593 */  lbu        $5, 0x114($sp)
/* 9D5A4 0019D4A4 01000364 */  daddiu     $3, $0, 0x1
/* 9D5A8 0019D4A8 FEFF0224 */  addiu      $2, $0, -0x2
/* 9D5AC 0019D4AC 2410A200 */  and        $2, $5, $2
/* 9D5B0 0019D4B0 25104300 */  or         $2, $2, $3
/* 9D5B4 0019D4B4 1401A2A3 */  sb         $2, 0x114($sp)
/* 9D5B8 0019D4B8 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* 9D5BC 0019D4BC 00000000 */   nop
/* 9D5C0 0019D4C0 A892848F */  lw         $4, -0x6D58($gp)
/* 9D5C4 0019D4C4 6076060C */  jal        DrawWaterSurface__FP7CCamera
/* 9D5C8 0019D4C8 00000000 */   nop
/* 9D5CC 0019D4CC F08B8427 */  addiu      $4, $gp, -0x7410
/* 9D5D0 0019D4D0 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* 9D5D4 0019D4D4 00000000 */   nop
/* 9D5D8 0019D4D8 9492838F */  lw         $3, -0x6D6C($gp)
/* 9D5DC 0019D4DC 04000224 */  addiu      $2, $0, 0x4
/* 9D5E0 0019D4E0 03006214 */  bne        $3, $2, .L0019D4F0
/* 9D5E4 0019D4E4 00000000 */   nop
/* 9D5E8 0019D4E8 1C63060C */  jal        EdEventBackSpriteDraw__Fv
/* 9D5EC 0019D4EC 00000000 */   nop
.L0019D4F0:
/* 9D5F0 0019D4F0 9492838F */  lw         $3, -0x6D6C($gp)
/* 9D5F4 0019D4F4 04000224 */  addiu      $2, $0, 0x4
/* 9D5F8 0019D4F8 03006214 */  bne        $3, $2, .L0019D508
/* 9D5FC 0019D4FC 00000000 */   nop
/* 9D600 0019D500 E0CC050C */  jal        EdDrawItem__Fv
/* 9D604 0019D504 00000000 */   nop
.L0019D508:
/* 9D608 0019D508 288E0070 */  paddub     $17, $0, $0
/* 9D60C 0019D50C 03001224 */  addiu      $18, $0, 0x3
/* 9D610 0019D510 9000B327 */  addiu      $19, $sp, 0x90
/* 9D614 0019D514 48A8050C */  jal        EdCheckViewMode__Fv
/* 9D618 0019D518 00000000 */   nop
/* 9D61C 0019D51C 02004010 */  beqz       $2, .L0019D528
/* 9D620 0019D520 00000000 */   nop
/* 9D624 0019D524 28960070 */  paddub     $18, $0, $0
.L0019D528:
/* 9D628 0019D528 9492848F */  lw         $4, -0x6D6C($gp)
/* 9D62C 0019D52C 02000224 */  addiu      $2, $0, 0x2
/* 9D630 0019D530 04008214 */  bne        $4, $2, .L0019D544
/* 9D634 0019D534 00000000 */   nop
/* 9D638 0019D538 289E0070 */  paddub     $19, $0, $0
/* 9D63C 0019D53C 0C000010 */  b          .L0019D570
/* 9D640 0019D540 00000000 */   nop
.L0019D544:
/* 9D644 0019D544 28860070 */  paddub     $16, $0, $0
/* 9D648 0019D548 06000010 */  b          .L0019D564
/* 9D64C 0019D54C 00000000 */   nop
.L0019D550:
/* 9D650 0019D550 03000324 */  addiu      $3, $0, 0x3
/* 9D654 0019D554 80101000 */  sll        $2, $16, 2
/* 9D658 0019D558 21105D00 */  addu       $2, $2, $sp
/* 9D65C 0019D55C 900043AC */  sw         $3, 0x90($2)
/* 9D660 0019D560 01001026 */  addiu      $16, $16, 0x1
.L0019D564:
/* 9D664 0019D564 0A00022A */  slti       $2, $16, 0xA
/* 9D668 0019D568 F9FF4014 */  bnez       $2, .L0019D550
/* 9D66C 0019D56C 00000000 */   nop
.L0019D570:
/* 9D670 0019D570 04000224 */  addiu      $2, $0, 0x4
/* 9D674 0019D574 04008214 */  bne        $4, $2, .L0019D588
/* 9D678 0019D578 00000000 */   nop
/* 9D67C 0019D57C D401023C */  lui        $2, %hi(EdEventInfo)
/* 9D680 0019D580 D0D15124 */  addiu      $17, $2, %lo(EdEventInfo)
/* 9D684 0019D584 03001224 */  addiu      $18, $0, 0x3
.L0019D588:
/* 9D688 0019D588 AC92848F */  lw         $4, -0x6D54($gp)
/* 9D68C 0019D58C 282E4072 */  paddub     $5, $18, $0
/* 9D690 0019D590 0A000624 */  addiu      $6, $0, 0xA
/* 9D694 0019D594 D201023C */  lui        $2, %hi(EdVillager)
/* 9D698 0019D598 905B4724 */  addiu      $7, $2, %lo(EdVillager)
/* 9D69C 0019D59C 28466072 */  paddub     $8, $19, $0
/* 9D6A0 0019D5A0 01000924 */  addiu      $9, $0, 0x1
/* 9D6A4 0019D5A4 28562072 */  paddub     $10, $17, $0
/* 9D6A8 0019D5A8 7CC9050C */  jal        EdDrawCharacter__FP10CCharacteriiP12CNPCharacterPiiP13ED_EVENT_INFO
/* 9D6AC 0019D5AC 00000000 */   nop
/* 9D6B0 0019D5B0 A0B8040C */  jal        GetVif1Packet__Fv
/* 9D6B4 0019D5B4 00000000 */   nop
/* 9D6B8 0019D5B8 C701033C */  lui        $3, %hi(TexManager)
/* 9D6BC 0019D5BC 70586424 */  addiu      $4, $3, %lo(TexManager)
/* 9D6C0 0019D5C0 282E4070 */  paddub     $5, $2, $0
/* 9D6C4 0019D5C4 18000624 */  addiu      $6, $0, 0x18
/* 9D6C8 0019D5C8 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 9D6CC 0019D5CC 00000000 */   nop
/* 9D6D0 0019D5D0 2700023C */  lui        $2, %hi(_931)
/* 9D6D4 0019D5D4 60A64224 */  addiu      $2, $2, %lo(_931)
/* 9D6D8 0019D5D8 C000A327 */  addiu      $3, $sp, 0xC0
/* 9D6DC 0019D5DC 00004278 */  lq         $2, 0x0($2)
/* 9D6E0 0019D5E0 0000627C */  sq         $2, 0x0($3)
/* 9D6E4 0019D5E4 9492838F */  lw         $3, -0x6D6C($gp)
/* 9D6E8 0019D5E8 05000224 */  addiu      $2, $0, 0x5
/* 9D6EC 0019D5EC 04006214 */  bne        $3, $2, .L0019D600
/* 9D6F0 0019D5F0 00000000 */   nop
/* 9D6F4 0019D5F4 7C90828F */  lw         $2, -0x6F84($gp)
/* 9D6F8 0019D5F8 18004014 */  bnez       $2, .L0019D65C
/* 9D6FC 0019D5FC 00000000 */   nop
.L0019D600:
/* 9D700 0019D600 449B050C */  jal        EditEffectStep__Fv
/* 9D704 0019D604 00000000 */   nop
/* 9D708 0019D608 C000A427 */  addiu      $4, $sp, 0xC0
/* 9D70C 0019D60C CC92050C */  jal        EffectMacroStep__FPf
/* 9D710 0019D610 00000000 */   nop
/* 9D714 0019D614 48908427 */  addiu      $4, $gp, -0x6FB8
/* 9D718 0019D618 01000524 */  addiu      $5, $0, 0x1
/* 9D71C 0019D61C 7C92050C */  jal        Step__12CEffectGroupFi
/* 9D720 0019D620 00000000 */   nop
/* 9D724 0019D624 28860070 */  paddub     $16, $0, $0
/* 9D728 0019D628 09000010 */  b          .L0019D650
/* 9D72C 0019D62C 00000000 */   nop
.L0019D630:
/* 9D730 0019D630 B0110224 */  addiu      $2, $0, 0x11B0
/* 9D734 0019D634 18180202 */  mult       $3, $16, $2
/* 9D738 0019D638 D501023C */  lui        $2, %hi(MotionParts_2)
/* 9D73C 0019D63C 30F04224 */  addiu      $2, $2, %lo(MotionParts_2)
/* 9D740 0019D640 21204300 */  addu       $4, $2, $3
/* 9D744 0019D644 4CE1040C */  jal        Step__10CCharacterFv
/* 9D748 0019D648 00000000 */   nop
/* 9D74C 0019D64C 01001026 */  addiu      $16, $16, 0x1
.L0019D650:
/* 9D750 0019D650 0400022A */  slti       $2, $16, 0x4
/* 9D754 0019D654 F6FF4014 */  bnez       $2, .L0019D630
/* 9D758 0019D658 00000000 */   nop
.L0019D65C:
/* 9D75C 0019D65C 789B050C */  jal        EditEffectStep2__Fv
/* 9D760 0019D660 00000000 */   nop
/* 9D764 0019D664 7090828F */  lw         $2, -0x6F90($gp)
/* 9D768 0019D668 17004014 */  bnez       $2, .L0019D6C8
/* 9D76C 0019D66C 00000000 */   nop
/* 9D770 0019D670 9092828F */  lw         $2, -0x6D70($gp)
/* 9D774 0019D674 301D5124 */  addiu      $17, $2, 0x1D30
/* 9D778 0019D678 28860070 */  paddub     $16, $0, $0
/* 9D77C 0019D67C 0E000010 */  b          .L0019D6B8
/* 9D780 0019D680 00000000 */   nop
.L0019D684:
/* 9D784 0019D684 28262072 */  paddub     $4, $17, $0
/* 9D788 0019D688 B0928CC7 */  lwc1       $f12, -0x6D50($gp)
/* 9D78C 0019D68C EC9A050C */  jal        CheckEditEffect__FP16EDIT_EFFECT_INFOf
/* 9D790 0019D690 00000000 */   nop
/* 9D794 0019D694 06004010 */  beqz       $2, .L0019D6B0
/* 9D798 0019D698 00000000 */   nop
/* 9D79C 0019D69C 28262072 */  paddub     $4, $17, $0
/* 9D7A0 0019D6A0 A892858F */  lw         $5, -0x6D58($gp)
/* 9D7A4 0019D6A4 48908627 */  addiu      $6, $gp, -0x6FB8
/* 9D7A8 0019D6A8 849B050C */  jal        DrawEditEffect__FP16EDIT_EFFECT_INFOP7CCameraP12CEffectGroup
/* 9D7AC 0019D6AC 00000000 */   nop
.L0019D6B0:
/* 9D7B0 0019D6B0 01001026 */  addiu      $16, $16, 0x1
/* 9D7B4 0019D6B4 70003126 */  addiu      $17, $17, 0x70
.L0019D6B8:
/* 9D7B8 0019D6B8 B892828F */  lw         $2, -0x6D48($gp)
/* 9D7BC 0019D6BC 2A100202 */  slt        $2, $16, $2
/* 9D7C0 0019D6C0 F0FF4014 */  bnez       $2, .L0019D684
/* 9D7C4 0019D6C4 00000000 */   nop
.L0019D6C8:
/* 9D7C8 0019D6C8 48908427 */  addiu      $4, $gp, -0x6FB8
/* 9D7CC 0019D6CC 9892050C */  jal        Draw__12CEffectGroupFv
/* 9D7D0 0019D6D0 00000000 */   nop
/* 9D7D4 0019D6D4 28860070 */  paddub     $16, $0, $0
/* 9D7D8 0019D6D8 11000010 */  b          .L0019D720
/* 9D7DC 0019D6DC 00000000 */   nop
.L0019D6E0:
/* 9D7E0 0019D6E0 A0B8040C */  jal        GetVif1Packet__Fv
/* 9D7E4 0019D6E4 00000000 */   nop
/* 9D7E8 0019D6E8 32000626 */  addiu      $6, $16, 0x32
/* 9D7EC 0019D6EC C701033C */  lui        $3, %hi(TexManager)
/* 9D7F0 0019D6F0 70586424 */  addiu      $4, $3, %lo(TexManager)
/* 9D7F4 0019D6F4 282E4070 */  paddub     $5, $2, $0
/* 9D7F8 0019D6F8 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 9D7FC 0019D6FC 00000000 */   nop
/* 9D800 0019D700 B0110224 */  addiu      $2, $0, 0x11B0
/* 9D804 0019D704 18180202 */  mult       $3, $16, $2
/* 9D808 0019D708 D501023C */  lui        $2, %hi(MotionParts_2)
/* 9D80C 0019D70C 30F04224 */  addiu      $2, $2, %lo(MotionParts_2)
/* 9D810 0019D710 21204300 */  addu       $4, $2, $3
/* 9D814 0019D714 C4E4040C */  jal        Draw__10CCharacterFv
/* 9D818 0019D718 00000000 */   nop
/* 9D81C 0019D71C 01001026 */  addiu      $16, $16, 0x1
.L0019D720:
/* 9D820 0019D720 0400022A */  slti       $2, $16, 0x4
/* 9D824 0019D724 EEFF4014 */  bnez       $2, .L0019D6E0
/* 9D828 0019D728 00000000 */   nop
/* 9D82C 0019D72C C701023C */  lui        $2, %hi(TexManager)
/* 9D830 0019D730 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 9D834 0019D734 D48B858F */  lw         $5, -0x742C($gp)
/* 9D838 0019D738 14000624 */  addiu      $6, $0, 0x14
/* 9D83C 0019D73C 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 9D840 0019D740 00000000 */   nop
/* 9D844 0019D744 9092828F */  lw         $2, -0x6D70($gp)
/* 9D848 0019D748 302B4424 */  addiu      $4, $2, 0x2B30
/* 9D84C 0019D74C 20000524 */  addiu      $5, $0, 0x20
/* 9D850 0019D750 FCF2050C */  jal        EdDrawSysCursor__FP14ED_EVENT_POINTi
/* 9D854 0019D754 00000000 */   nop
/* 9D858 0019D758 9492838F */  lw         $3, -0x6D6C($gp)
/* 9D85C 0019D75C 04000224 */  addiu      $2, $0, 0x4
/* 9D860 0019D760 03006214 */  bne        $3, $2, .L0019D770
/* 9D864 0019D764 00000000 */   nop
/* 9D868 0019D768 7462060C */  jal        EdEventSpriteDraw__Fv
/* 9D86C 0019D76C 00000000 */   nop
.L0019D770:
/* 9D870 0019D770 9492828F */  lw         $2, -0x6D6C($gp)
/* 9D874 0019D774 FDFF4224 */  addiu      $2, $2, -0x3
/* 9D878 0019D778 0200412C */  sltiu      $at, $2, 0x2
/* 9D87C 0019D77C 18002010 */  beqz       $at, .L0019D7E0
/* 9D880 0019D780 00000000 */   nop
/* 9D884 0019D784 C701023C */  lui        $2, %hi(TexManager)
/* 9D888 0019D788 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 9D88C 0019D78C D48B858F */  lw         $5, -0x742C($gp)
/* 9D890 0019D790 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9D894 0019D794 9CCC268C */  lw         $6, -0x3364($at)
/* 9D898 0019D798 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 9D89C 0019D79C 00000000 */   nop
/* 9D8A0 0019D7A0 D201023C */  lui        $2, %hi(EditMes1)
/* 9D8A4 0019D7A4 50B54424 */  addiu      $4, $2, %lo(EditMes1)
/* 9D8A8 0019D7A8 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 9D8AC 0019D7AC 00000000 */   nop
/* 9D8B0 0019D7B0 9492838F */  lw         $3, -0x6D6C($gp)
/* 9D8B4 0019D7B4 04000224 */  addiu      $2, $0, 0x4
/* 9D8B8 0019D7B8 09006214 */  bne        $3, $2, .L0019D7E0
/* 9D8BC 0019D7BC 00000000 */   nop
/* 9D8C0 0019D7C0 D201023C */  lui        $2, %hi(EditEventMes1)
/* 9D8C4 0019D7C4 D0E44424 */  addiu      $4, $2, %lo(EditEventMes1)
/* 9D8C8 0019D7C8 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 9D8CC 0019D7CC 00000000 */   nop
/* 9D8D0 0019D7D0 D201023C */  lui        $2, %hi(EditSystemMes)
/* 9D8D4 0019D7D4 102C4424 */  addiu      $4, $2, %lo(EditSystemMes)
/* 9D8D8 0019D7D8 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 9D8DC 0019D7DC 00000000 */   nop
.L0019D7E0:
/* 9D8E0 0019D7E0 9492828F */  lw         $2, -0x6D6C($gp)
/* 9D8E4 0019D7E4 05004014 */  bnez       $2, .L0019D7FC
/* 9D8E8 0019D7E8 00000000 */   nop
/* 9D8EC 0019D7EC 9C3B080C */  jal        MonsterNameDraw__Fv
/* 9D8F0 0019D7F0 00000000 */   nop
/* 9D8F4 0019D7F4 04000010 */  b          .L0019D808
/* 9D8F8 0019D7F8 00000000 */   nop
.L0019D7FC:
/* 9D8FC 0019D7FC FFFF0424 */  addiu      $4, $0, -0x1
/* 9D900 0019D800 643B080C */  jal        MonsterNameMake__Fi
/* 9D904 0019D804 00000000 */   nop
.L0019D808:
/* 9D908 0019D808 98CD050C */  jal        EdSystemMesStep__Fv
/* 9D90C 0019D80C 00000000 */   nop
/* 9D910 0019D810 D4CD050C */  jal        EdSystemMesDraw__Fv
/* 9D914 0019D814 00000000 */   nop
/* 9D918 0019D818 F8928283 */  lb         $2, -0x6D08($gp)
/* 9D91C 0019D81C 04004014 */  bnez       $2, .L0019D830
/* 9D920 0019D820 00000000 */   nop
/* 9D924 0019D824 F49280AF */  sw         $0, -0x6D0C($gp)
/* 9D928 0019D828 01000224 */  addiu      $2, $0, 0x1
/* 9D92C 0019D82C F89282A3 */  sb         $2, -0x6D08($gp)
.L0019D830:
/* 9D930 0019D830 00938283 */  lb         $2, -0x6D00($gp)
/* 9D934 0019D834 04004014 */  bnez       $2, .L0019D848
/* 9D938 0019D838 00000000 */   nop
/* 9D93C 0019D83C FC9280AF */  sw         $0, -0x6D04($gp)
/* 9D940 0019D840 01000224 */  addiu      $2, $0, 0x1
/* 9D944 0019D844 009382A3 */  sb         $2, -0x6D00($gp)
.L0019D848:
/* 9D948 0019D848 448F828F */  lw         $2, -0x70BC($gp)
/* 9D94C 0019D84C 41004014 */  bnez       $2, .L0019D954
/* 9D950 0019D850 00000000 */   nop
/* 9D954 0019D854 1801A327 */  addiu      $3, $sp, 0x118
/* 9D958 0019D858 A88780C7 */  lwc1       $f0, -0x7858($gp)
/* 9D95C 0019D85C AC878287 */  lh         $2, -0x7854($gp)
/* 9D960 0019D860 000060E4 */  swc1       $f0, 0x0($3)
/* 9D964 0019D864 040062A4 */  sh         $2, 0x4($3)
/* 9D968 0019D868 9492838F */  lw         $3, -0x6D6C($gp)
/* 9D96C 0019D86C 05000224 */  addiu      $2, $0, 0x5
/* 9D970 0019D870 04006210 */  beq        $3, $2, .L0019D884
/* 9D974 0019D874 00000000 */   nop
/* 9D978 0019D878 7C90828F */  lw         $2, -0x6F84($gp)
/* 9D97C 0019D87C 35004010 */  beqz       $2, .L0019D954
/* 9D980 0019D880 00000000 */   nop
.L0019D884:
/* 9D984 0019D884 A0B8040C */  jal        GetVif1Packet__Fv
/* 9D988 0019D888 00000000 */   nop
/* 9D98C 0019D88C C701033C */  lui        $3, %hi(TexManager)
/* 9D990 0019D890 70586424 */  addiu      $4, $3, %lo(TexManager)
/* 9D994 0019D894 282E4070 */  paddub     $5, $2, $0
/* 9D998 0019D898 14000624 */  addiu      $6, $0, 0x14
/* 9D99C 0019D89C 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 9D9A0 0019D8A0 00000000 */   nop
/* 9D9A4 0019D8A4 D000A0AF */  sw         $0, 0xD0($sp)
/* 9D9A8 0019D8A8 D400A0AF */  sw         $0, 0xD4($sp)
/* 9D9AC 0019D8AC 00280224 */  addiu      $2, $0, 0x2800
/* 9D9B0 0019D8B0 D800A2AF */  sw         $2, 0xD8($sp)
/* 9D9B4 0019D8B4 000E0224 */  addiu      $2, $0, 0xE00
/* 9D9B8 0019D8B8 DC00A2AF */  sw         $2, 0xDC($sp)
/* 9D9BC 0019D8BC D000A427 */  addiu      $4, $sp, 0xD0
/* 9D9C0 0019D8C0 282E0070 */  paddub     $5, $0, $0
/* 9D9C4 0019D8C4 28360070 */  paddub     $6, $0, $0
/* 9D9C8 0019D8C8 283E0070 */  paddub     $7, $0, $0
/* 9D9CC 0019D8CC 40000824 */  addiu      $8, $0, 0x40
/* 9D9D0 0019D8D0 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 9D9D4 0019D8D4 00000000 */   nop
/* 9D9D8 0019D8D8 28260070 */  paddub     $4, $0, $0
/* 9D9DC 0019D8DC 046F050C */  jal        setbilinear__Fi
/* 9D9E0 0019D8E0 00000000 */   nop
/* 9D9E4 0019D8E4 F000A0AF */  sw         $0, 0xF0($sp)
/* 9D9E8 0019D8E8 F400A0AF */  sw         $0, 0xF4($sp)
/* 9D9EC 0019D8EC 80000424 */  addiu      $4, $0, 0x80
/* 9D9F0 0019D8F0 F800A4AF */  sw         $4, 0xF8($sp)
/* 9D9F4 0019D8F4 28000324 */  addiu      $3, $0, 0x28
/* 9D9F8 0019D8F8 FC00A3AF */  sw         $3, 0xFC($sp)
/* 9D9FC 0019D8FC 00010224 */  addiu      $2, $0, 0x100
/* 9DA00 0019D900 E000A2AF */  sw         $2, 0xE0($sp)
/* 9DA04 0019D904 CC000224 */  addiu      $2, $0, 0xCC
/* 9DA08 0019D908 E400A2AF */  sw         $2, 0xE4($sp)
/* 9DA0C 0019D90C E800A4AF */  sw         $4, 0xE8($sp)
/* 9DA10 0019D910 EC00A3AF */  sw         $3, 0xEC($sp)
/* 9DA14 0019D914 A0B8040C */  jal        GetVif1Packet__Fv
/* 9DA18 0019D918 00000000 */   nop
/* 9DA1C 0019D91C 28864070 */  paddub     $16, $2, $0
/* 9DA20 0019D920 C701023C */  lui        $2, %hi(TexManager)
/* 9DA24 0019D924 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 9DA28 0019D928 1801A527 */  addiu      $5, $sp, 0x118
/* 9DA2C 0019D92C FFFF0624 */  addiu      $6, $0, -0x1
/* 9DA30 0019D930 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 9DA34 0019D934 00000000 */   nop
/* 9DA38 0019D938 28260072 */  paddub     $4, $16, $0
/* 9DA3C 0019D93C 282E4070 */  paddub     $5, $2, $0
/* 9DA40 0019D940 E000A627 */  addiu      $6, $sp, 0xE0
/* 9DA44 0019D944 F000A727 */  addiu      $7, $sp, 0xF0
/* 9DA48 0019D948 80000824 */  addiu      $8, $0, 0x80
/* 9DA4C 0019D94C C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 9DA50 0019D950 00000000 */   nop
.L0019D954:
/* 9DA54 0019D954 1826060C */  jal        EdFadeInOut__Fv
/* 9DA58 0019D958 00000000 */   nop
.L0019D95C:
/* 9DA5C 0019D95C 4000BF7B */  lq         $31, 0x40($sp)
/* 9DA60 0019D960 3000B37B */  lq         $19, 0x30($sp)
/* 9DA64 0019D964 2000B27B */  lq         $18, 0x20($sp)
/* 9DA68 0019D968 1000B17B */  lq         $17, 0x10($sp)
/* 9DA6C 0019D96C 0000B07B */  lq         $16, 0x0($sp)
/* 9DA70 0019D970 2001BD27 */  addiu      $sp, $sp, 0x120
/* 9DA74 0019D974 0800E003 */  jr         $31
/* 9DA78 0019D978 00000000 */   nop
/* 9DA7C 0019D97C 00000000 */  nop
