.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MainDraw__Fv__3
/* 0025A0 01DAE2A0 60F9BD27 */  addiu       $29, $29, -0x6A0
/* 0025A4 01DAE2A4 4000BF7F */  sq          $31, 0x40($29)
/* 0025A8 01DAE2A8 3000B27F */  sq          $18, 0x30($29)
/* 0025AC 01DAE2AC 2000B17F */  sq          $17, 0x20($29)
/* 0025B0 01DAE2B0 1000B07F */  sq          $16, 0x10($29)
/* 0025B4 01DAE2B4 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0025B8 01DAE2B8 D401013C */  lui         $1, %hi(EdEventInfo + 0x50)
/* 0025BC 01DAE2BC 20D220AC */  sw          $0, %lo(EdEventInfo + 0x50)($1)
/* 0025C0 01DAE2C0 A89C848F */  lw          $4, -0x6358($28)
/* 0025C4 01DAE2C4 9000A527 */  addiu       $5, $29, 0x90
/* 0025C8 01DAE2C8 9C91040C */  jal         GetPos__7CCameraFPf
/* 0025CC 01DAE2CC 00000000 */   nop
/* 0025D0 01DAE2D0 A89C848F */  lw          $4, -0x6358($28)
/* 0025D4 01DAE2D4 5000A527 */  addiu       $5, $29, 0x50
/* 0025D8 01DAE2D8 F890040C */  jal         GetCameraMatrix__7CCameraFPA4_f
/* 0025DC 01DAE2DC 00000000 */   nop
/* 0025E0 01DAE2E0 E000A427 */  addiu       $4, $29, 0xE0
/* 0025E4 01DAE2E4 2A86040C */  jal         sceVu0UnitMatrix
/* 0025E8 01DAE2E8 00000000 */   nop
/* 0025EC 01DAE2EC A000A427 */  addiu       $4, $29, 0xA0
/* 0025F0 01DAE2F0 E000A527 */  addiu       $5, $29, 0xE0
/* 0025F4 01DAE2F4 5000A627 */  addiu       $6, $29, 0x50
/* 0025F8 01DAE2F8 6E85040C */  jal         sceVu0MulMatrix
/* 0025FC 01DAE2FC 00000000 */   nop
/* 002600 01DAE300 A000A427 */  addiu       $4, $29, 0xA0
/* 002604 01DAE304 9000A527 */  addiu       $5, $29, 0x90
/* 002608 01DAE308 E8B7040C */  jal         MGSetViewMatrix__FPA4_fPf
/* 00260C 01DAE30C 00000000 */   nop
/* 002610 01DAE310 A89C848F */  lw          $4, -0x6358($28)
/* 002614 01DAE314 BC65050C */  jal         SndSetCamera__FP7CCamera
/* 002618 01DAE318 00000000 */   nop
/* 00261C 01DAE31C 2400023C */  lui         $2, %hi(Vu_prog0f)
/* 002620 01DAE320 00614524 */  addiu       $5, $2, %lo(Vu_prog0f)
/* 002624 01DAE324 D48B848F */  lw          $4, -0x742C($28)
/* 002628 01DAE328 28360070 */  paddub      $6, $0, $0
/* 00262C 01DAE32C 5C83040C */  jal         sceVif1PkCall
/* 002630 01DAE330 00000000 */   nop
/* 002634 01DAE334 709D828F */  lw          $2, -0x6290($28)
/* 002638 01DAE338 13004014 */  bnez        $2, .L01DAE388_2E9988
/* 00263C 01DAE33C 00000000 */   nop
/* 002640 01DAE340 D89D828F */  lw          $2, -0x6228($28)
/* 002644 01DAE344 0C004010 */  beqz        $2, .L01DAE378_2E9978
/* 002648 01DAE348 00000000 */   nop
/* 00264C 01DAE34C C701023C */  lui         $2, %hi(TexManager)
/* 002650 01DAE350 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002654 01DAE354 D48B858F */  lw          $5, -0x742C($28)
/* 002658 01DAE358 28000624 */  addiu       $6, $0, 0x28
/* 00265C 01DAE35C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002660 01DAE360 00000000 */   nop
/* 002664 01DAE364 68A9080C */  jal         DngActiveItemTextureCopy__Fv
/* 002668 01DAE368 00000000 */   nop
/* 00266C 01DAE36C ACA9080C */  jal         DngActiveWeaponTextureCopy__Fv
/* 002670 01DAE370 00000000 */   nop
/* 002674 01DAE374 D89D80AF */  sw          $0, -0x6228($28)
.L01DAE378_2E9978:
/* 002678 01DAE378 1826060C */  jal         EdFadeInOut__Fv
/* 00267C 01DAE37C 00000000 */   nop
/* 002680 01DAE380 3D090010 */  b           .L01DB0878_2EBE78
/* 002684 01DAE384 00000000 */   nop
.L01DAE388_2E9988:
/* 002688 01DAE388 DC9C828F */  lw          $2, -0x6324($28)
/* 00268C 01DAE38C 4B004014 */  bnez        $2, .L01DAE4BC_2E9ABC
/* 002690 01DAE390 00000000 */   nop
/* 002694 01DAE394 E001023C */  lui         $2, %hi(main_light)
/* 002698 01DAE398 B0864424 */  addiu       $4, $2, %lo(main_light)
/* 00269C 01DAE39C E001023C */  lui         $2, %hi(main_lightcolor)
/* 0026A0 01DAE3A0 F0864524 */  addiu       $5, $2, %lo(main_lightcolor)
/* 0026A4 01DAE3A4 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 0026A8 01DAE3A8 00000000 */   nop
/* 0026AC 01DAE3AC E001023C */  lui         $2, %hi(main_ambientlight)
/* 0026B0 01DAE3B0 30874424 */  addiu       $4, $2, %lo(main_ambientlight)
/* 0026B4 01DAE3B4 40B7040C */  jal         MGSetAmbient__FPf
/* 0026B8 01DAE3B8 00000000 */   nop
/* 0026BC 01DAE3BC D49C8293 */  lbu         $2, -0x632C($28)
/* 0026C0 01DAE3C0 06004004 */  bltz        $2, .L01DAE3DC_2E99DC
/* 0026C4 01DAE3C4 00000000 */   nop
/* 0026C8 01DAE3C8 00008244 */  mtc1        $2, $f0
/* 0026CC 01DAE3CC 00000000 */  nop
/* 0026D0 01DAE3D0 20038046 */  cvt.s.w     $f12, $f0
/* 0026D4 01DAE3D4 08000010 */  b           .L01DAE3F8_2E99F8
/* 0026D8 01DAE3D8 00000000 */   nop
.L01DAE3DC_2E99DC:
/* 0026DC 01DAE3DC 42180200 */  srl         $3, $2, 1
/* 0026E0 01DAE3E0 01004230 */  andi        $2, $2, 0x1
/* 0026E4 01DAE3E4 25186200 */  or          $3, $3, $2
/* 0026E8 01DAE3E8 00008344 */  mtc1        $3, $f0
/* 0026EC 01DAE3EC 00000000 */  nop
/* 0026F0 01DAE3F0 20038046 */  cvt.s.w     $f12, $f0
/* 0026F4 01DAE3F4 00630C46 */  add.s       $f12, $f12, $f12
.L01DAE3F8_2E99F8:
/* 0026F8 01DAE3F8 D59C8293 */  lbu         $2, -0x632B($28)
/* 0026FC 01DAE3FC 06004004 */  bltz        $2, .L01DAE418_2E9A18
/* 002700 01DAE400 00000000 */   nop
/* 002704 01DAE404 00008244 */  mtc1        $2, $f0
/* 002708 01DAE408 00000000 */  nop
/* 00270C 01DAE40C 60038046 */  cvt.s.w     $f13, $f0
/* 002710 01DAE410 08000010 */  b           .L01DAE434_2E9A34
/* 002714 01DAE414 00000000 */   nop
.L01DAE418_2E9A18:
/* 002718 01DAE418 42180200 */  srl         $3, $2, 1
/* 00271C 01DAE41C 01004230 */  andi        $2, $2, 0x1
/* 002720 01DAE420 25186200 */  or          $3, $3, $2
/* 002724 01DAE424 00008344 */  mtc1        $3, $f0
/* 002728 01DAE428 00000000 */  nop
/* 00272C 01DAE42C 60038046 */  cvt.s.w     $f13, $f0
/* 002730 01DAE430 406B0D46 */  add.s       $f13, $f13, $f13
.L01DAE434_2E9A34:
/* 002734 01DAE434 D69C8293 */  lbu         $2, -0x632A($28)
/* 002738 01DAE438 06004004 */  bltz        $2, .L01DAE454_2E9A54
/* 00273C 01DAE43C 00000000 */   nop
/* 002740 01DAE440 00008244 */  mtc1        $2, $f0
/* 002744 01DAE444 00000000 */  nop
/* 002748 01DAE448 A0038046 */  cvt.s.w     $f14, $f0
/* 00274C 01DAE44C 08000010 */  b           .L01DAE470_2E9A70
/* 002750 01DAE450 00000000 */   nop
.L01DAE454_2E9A54:
/* 002754 01DAE454 42180200 */  srl         $3, $2, 1
/* 002758 01DAE458 01004230 */  andi        $2, $2, 0x1
/* 00275C 01DAE45C 25186200 */  or          $3, $3, $2
/* 002760 01DAE460 00008344 */  mtc1        $3, $f0
/* 002764 01DAE464 00000000 */  nop
/* 002768 01DAE468 A0038046 */  cvt.s.w     $f14, $f0
/* 00276C 01DAE46C 80730E46 */  add.s       $f14, $f14, $f14
.L01DAE470_2E9A70:
/* 002770 01DAE470 0043023C */  lui         $2, (0x43000000 >> 16)
/* 002774 01DAE474 00788244 */  mtc1        $2, $f15
/* 002778 01DAE478 24B8040C */  jal         MGSetBGColor__Fffff
/* 00277C 01DAE47C 00000000 */   nop
/* 002780 01DAE480 DC01013C */  lui         $1, %hi(main_fogRate)
/* 002784 01DAE484 A0242CC4 */  lwc1        $f12, %lo(main_fogRate)($1)
/* 002788 01DAE488 DC01013C */  lui         $1, %hi(main_fogRate + 0x4)
/* 00278C 01DAE48C A4242DC4 */  lwc1        $f13, %lo(main_fogRate + 0x4)($1)
/* 002790 01DAE490 F48A8493 */  lbu         $4, -0x750C($28)
/* 002794 01DAE494 F58A8593 */  lbu         $5, -0x750B($28)
/* 002798 01DAE498 F68A8693 */  lbu         $6, -0x750A($28)
/* 00279C 01DAE49C DC01013C */  lui         $1, %hi(main_fogRate + 0x8)
/* 0027A0 01DAE4A0 A8242EC4 */  lwc1        $f14, %lo(main_fogRate + 0x8)($1)
/* 0027A4 01DAE4A4 DC01013C */  lui         $1, %hi(main_fogRate + 0xC)
/* 0027A8 01DAE4A8 AC242FC4 */  lwc1        $f15, %lo(main_fogRate + 0xC)($1)
/* 0027AC 01DAE4AC 04B8040C */  jal         MGSetFogParm__FffUcUcUcff
/* 0027B0 01DAE4B0 00000000 */   nop
/* 0027B4 01DAE4B4 49000010 */  b           .L01DAE5DC_2E9BDC
/* 0027B8 01DAE4B8 00000000 */   nop
.L01DAE4BC_2E9ABC:
/* 0027BC 01DAE4BC E001023C */  lui         $2, %hi(sub_light)
/* 0027C0 01DAE4C0 40874424 */  addiu       $4, $2, %lo(sub_light)
/* 0027C4 01DAE4C4 E001023C */  lui         $2, %hi(sub_lightcolor)
/* 0027C8 01DAE4C8 80874524 */  addiu       $5, $2, %lo(sub_lightcolor)
/* 0027CC 01DAE4CC 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 0027D0 01DAE4D0 00000000 */   nop
/* 0027D4 01DAE4D4 E001023C */  lui         $2, %hi(sub_ambientlight)
/* 0027D8 01DAE4D8 C0874424 */  addiu       $4, $2, %lo(sub_ambientlight)
/* 0027DC 01DAE4DC 40B7040C */  jal         MGSetAmbient__FPf
/* 0027E0 01DAE4E0 00000000 */   nop
/* 0027E4 01DAE4E4 D89C8293 */  lbu         $2, -0x6328($28)
/* 0027E8 01DAE4E8 06004004 */  bltz        $2, .L01DAE504_2E9B04
/* 0027EC 01DAE4EC 00000000 */   nop
/* 0027F0 01DAE4F0 00008244 */  mtc1        $2, $f0
/* 0027F4 01DAE4F4 00000000 */  nop
/* 0027F8 01DAE4F8 20038046 */  cvt.s.w     $f12, $f0
/* 0027FC 01DAE4FC 08000010 */  b           .L01DAE520_2E9B20
/* 002800 01DAE500 00000000 */   nop
.L01DAE504_2E9B04:
/* 002804 01DAE504 42180200 */  srl         $3, $2, 1
/* 002808 01DAE508 01004230 */  andi        $2, $2, 0x1
/* 00280C 01DAE50C 25186200 */  or          $3, $3, $2
/* 002810 01DAE510 00008344 */  mtc1        $3, $f0
/* 002814 01DAE514 00000000 */  nop
/* 002818 01DAE518 20038046 */  cvt.s.w     $f12, $f0
/* 00281C 01DAE51C 00630C46 */  add.s       $f12, $f12, $f12
.L01DAE520_2E9B20:
/* 002820 01DAE520 D99C8293 */  lbu         $2, -0x6327($28)
/* 002824 01DAE524 06004004 */  bltz        $2, .L01DAE540_2E9B40
/* 002828 01DAE528 00000000 */   nop
/* 00282C 01DAE52C 00008244 */  mtc1        $2, $f0
/* 002830 01DAE530 00000000 */  nop
/* 002834 01DAE534 60038046 */  cvt.s.w     $f13, $f0
/* 002838 01DAE538 08000010 */  b           .L01DAE55C_2E9B5C
/* 00283C 01DAE53C 00000000 */   nop
.L01DAE540_2E9B40:
/* 002840 01DAE540 42180200 */  srl         $3, $2, 1
/* 002844 01DAE544 01004230 */  andi        $2, $2, 0x1
/* 002848 01DAE548 25186200 */  or          $3, $3, $2
/* 00284C 01DAE54C 00008344 */  mtc1        $3, $f0
/* 002850 01DAE550 00000000 */  nop
/* 002854 01DAE554 60038046 */  cvt.s.w     $f13, $f0
/* 002858 01DAE558 406B0D46 */  add.s       $f13, $f13, $f13
.L01DAE55C_2E9B5C:
/* 00285C 01DAE55C DA9C8293 */  lbu         $2, -0x6326($28)
/* 002860 01DAE560 06004004 */  bltz        $2, .L01DAE57C_2E9B7C
/* 002864 01DAE564 00000000 */   nop
/* 002868 01DAE568 00008244 */  mtc1        $2, $f0
/* 00286C 01DAE56C 00000000 */  nop
/* 002870 01DAE570 A0038046 */  cvt.s.w     $f14, $f0
/* 002874 01DAE574 08000010 */  b           .L01DAE598_2E9B98
/* 002878 01DAE578 00000000 */   nop
.L01DAE57C_2E9B7C:
/* 00287C 01DAE57C 42180200 */  srl         $3, $2, 1
/* 002880 01DAE580 01004230 */  andi        $2, $2, 0x1
/* 002884 01DAE584 25186200 */  or          $3, $3, $2
/* 002888 01DAE588 00008344 */  mtc1        $3, $f0
/* 00288C 01DAE58C 00000000 */  nop
/* 002890 01DAE590 A0038046 */  cvt.s.w     $f14, $f0
/* 002894 01DAE594 80730E46 */  add.s       $f14, $f14, $f14
.L01DAE598_2E9B98:
/* 002898 01DAE598 0043023C */  lui         $2, (0x43000000 >> 16)
/* 00289C 01DAE59C 00788244 */  mtc1        $2, $f15
/* 0028A0 01DAE5A0 24B8040C */  jal         MGSetBGColor__Fffff
/* 0028A4 01DAE5A4 00000000 */   nop
/* 0028A8 01DAE5A8 DC01013C */  lui         $1, %hi(sub_fogRate)
/* 0028AC 01DAE5AC B0242CC4 */  lwc1        $f12, %lo(sub_fogRate)($1)
/* 0028B0 01DAE5B0 DC01013C */  lui         $1, %hi(sub_fogRate + 0x4)
/* 0028B4 01DAE5B4 B4242DC4 */  lwc1        $f13, %lo(sub_fogRate + 0x4)($1)
/* 0028B8 01DAE5B8 F88A8493 */  lbu         $4, -0x7508($28)
/* 0028BC 01DAE5BC F98A8593 */  lbu         $5, -0x7507($28)
/* 0028C0 01DAE5C0 FA8A8693 */  lbu         $6, -0x7506($28)
/* 0028C4 01DAE5C4 DC01013C */  lui         $1, %hi(sub_fogRate + 0x8)
/* 0028C8 01DAE5C8 B8242EC4 */  lwc1        $f14, %lo(sub_fogRate + 0x8)($1)
/* 0028CC 01DAE5CC DC01013C */  lui         $1, %hi(sub_fogRate + 0xC)
/* 0028D0 01DAE5D0 BC242FC4 */  lwc1        $f15, %lo(sub_fogRate + 0xC)($1)
/* 0028D4 01DAE5D4 04B8040C */  jal         MGSetFogParm__FffUcUcUcff
/* 0028D8 01DAE5D8 00000000 */   nop
.L01DAE5DC_2E9BDC:
/* 0028DC 01DAE5DC D89D828F */  lw          $2, -0x6228($28)
/* 0028E0 01DAE5E0 0C004010 */  beqz        $2, .L01DAE614_2E9C14
/* 0028E4 01DAE5E4 00000000 */   nop
/* 0028E8 01DAE5E8 C701023C */  lui         $2, %hi(TexManager)
/* 0028EC 01DAE5EC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0028F0 01DAE5F0 D48B858F */  lw          $5, -0x742C($28)
/* 0028F4 01DAE5F4 28000624 */  addiu       $6, $0, 0x28
/* 0028F8 01DAE5F8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0028FC 01DAE5FC 00000000 */   nop
/* 002900 01DAE600 68A9080C */  jal         DngActiveItemTextureCopy__Fv
/* 002904 01DAE604 00000000 */   nop
/* 002908 01DAE608 ACA9080C */  jal         DngActiveWeaponTextureCopy__Fv
/* 00290C 01DAE60C 00000000 */   nop
/* 002910 01DAE610 D89D80AF */  sw          $0, -0x6228($28)
.L01DAE614_2E9C14:
/* 002914 01DAE614 C701023C */  lui         $2, %hi(TexManager)
/* 002918 01DAE618 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00291C 01DAE61C D48B858F */  lw          $5, -0x742C($28)
/* 002920 01DAE620 03000624 */  addiu       $6, $0, 0x3
/* 002924 01DAE624 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002928 01DAE628 00000000 */   nop
/* 00292C 01DAE62C F001023C */  lui         $2, %hi(BtTexAnime)
/* 002930 01DAE630 50014424 */  addiu       $4, $2, %lo(BtTexAnime)
/* 002934 01DAE634 03000524 */  addiu       $5, $0, 0x3
/* 002938 01DAE638 5C9C050C */  jal         TexAnime__13CTextureAnimeFi
/* 00293C 01DAE63C 00000000 */   nop
/* 002940 01DAE640 C89C848F */  lw          $4, -0x6338($28)
/* 002944 01DAE644 A89C858F */  lw          $5, -0x6358($28)
/* 002948 01DAE648 F00B070C */  jal         DrawBGModel__11CDungeonMapFP7CCamera
/* 00294C 01DAE64C 00000000 */   nop
/* 002950 01DAE650 C89C848F */  lw          $4, -0x6338($28)
/* 002954 01DAE654 A89C858F */  lw          $5, -0x6358($28)
/* 002958 01DAE658 180C070C */  jal         DrawDummyModel__11CDungeonMapFP7CCamera
/* 00295C 01DAE65C 00000000 */   nop
/* 002960 01DAE660 C89C848F */  lw          $4, -0x6338($28)
/* 002964 01DAE664 0100013C */  lui         $1, (0x10000 >> 16)
/* 002968 01DAE668 21088100 */  addu        $1, $4, $1
/* 00296C 01DAE66C ECBD238C */  lw          $3, -0x4214($1)
/* 002970 01DAE670 01000224 */  addiu       $2, $0, 0x1
/* 002974 01DAE674 07006214 */  bne         $3, $2, .L01DAE694_2E9C94
/* 002978 01DAE678 00000000 */   nop
/* 00297C 01DAE67C A89C858F */  lw          $5, -0x6358($28)
/* 002980 01DAE680 109D868F */  lw          $6, -0x62F0($28)
/* 002984 01DAE684 A409070C */  jal         DrawMap__11CDungeonMapFP13CCameraFollowP9CFrameVu1
/* 002988 01DAE688 00000000 */   nop
/* 00298C 01DAE68C 03000010 */  b           .L01DAE69C_2E9C9C
/* 002990 01DAE690 00000000 */   nop
.L01DAE694_2E9C94:
/* 002994 01DAE694 F008070C */  jal         DrawMapFreeStyle__11CDungeonMapFv
/* 002998 01DAE698 00000000 */   nop
.L01DAE69C_2E9C9C:
/* 00299C 01DAE69C CC9C848F */  lw          $4, -0x6334($28)
/* 0029A0 01DAE6A0 C835070C */  jal         Draw__13CDranMapFieldFv
/* 0029A4 01DAE6A4 00000000 */   nop
/* 0029A8 01DAE6A8 489D838F */  lw          $3, -0x62B8($28)
/* 0029AC 01DAE6AC 0F006014 */  bnez        $3, .L01DAE6EC_2E9CEC
/* 0029B0 01DAE6B0 00000000 */   nop
/* 0029B4 01DAE6B4 609D828F */  lw          $2, -0x62A0($28)
/* 0029B8 01DAE6B8 0C004014 */  bnez        $2, .L01DAE6EC_2E9CEC
/* 0029BC 01DAE6BC 00000000 */   nop
/* 0029C0 01DAE6C0 109D828F */  lw          $2, -0x62F0($28)
/* 0029C4 01DAE6C4 2001A427 */  addiu       $4, $29, 0x120
/* 0029C8 01DAE6C8 20024524 */  addiu       $5, $2, 0x220
/* 0029CC 01DAE6CC 0C86040C */  jal         sceVu0CopyVector
/* 0029D0 01DAE6D0 00000000 */   nop
/* 0029D4 01DAE6D4 C89C848F */  lw          $4, -0x6338($28)
/* 0029D8 01DAE6D8 2001A527 */  addiu       $5, $29, 0x120
/* 0029DC 01DAE6DC 7813070C */  jal         DrawItemBox__11CDungeonMapFPf
/* 0029E0 01DAE6E0 00000000 */   nop
/* 0029E4 01DAE6E4 0E000010 */  b           .L01DAE720_2E9D20
/* 0029E8 01DAE6E8 00000000 */   nop
.L01DAE6EC_2E9CEC:
/* 0029EC 01DAE6EC 05006010 */  beqz        $3, .L01DAE704_2E9D04
/* 0029F0 01DAE6F0 00000000 */   nop
/* 0029F4 01DAE6F4 EB01023C */  lui         $2, %hi(itemOpenSmall)
/* 0029F8 01DAE6F8 505E4424 */  addiu       $4, $2, %lo(itemOpenSmall)
/* 0029FC 01DAE6FC 50DB060C */  jal         Draw__12CMotionModelFv
/* 002A00 01DAE700 00000000 */   nop
.L01DAE704_2E9D04:
/* 002A04 01DAE704 609D828F */  lw          $2, -0x62A0($28)
/* 002A08 01DAE708 05004010 */  beqz        $2, .L01DAE720_2E9D20
/* 002A0C 01DAE70C 00000000 */   nop
/* 002A10 01DAE710 EB01023C */  lui         $2, %hi(itemOpenBig)
/* 002A14 01DAE714 905F4424 */  addiu       $4, $2, %lo(itemOpenBig)
/* 002A18 01DAE718 50DB060C */  jal         Draw__12CMotionModelFv
/* 002A1C 01DAE71C 00000000 */   nop
.L01DAE720_2E9D20:
/* 002A20 01DAE720 189E828F */  lw          $2, -0x61E8($28)
/* 002A24 01DAE724 0B004010 */  beqz        $2, .L01DAE754_2E9D54
/* 002A28 01DAE728 00000000 */   nop
/* 002A2C 01DAE72C DC01023C */  lui         $2, %hi(LIT_1084__3)
/* 002A30 01DAE730 50274224 */  addiu       $2, $2, %lo(LIT_1084__3)
/* 002A34 01DAE734 3001A427 */  addiu       $4, $29, 0x130
/* 002A38 01DAE738 00004278 */  lq          $2, 0x0($2)
/* 002A3C 01DAE73C 0000827C */  sq          $2, 0x0($4)
/* 002A40 01DAE740 03000524 */  addiu       $5, $0, 0x3
/* 002A44 01DAE744 40000624 */  addiu       $6, $0, 0x40
/* 002A48 01DAE748 283E0070 */  paddub      $7, $0, $0
/* 002A4C 01DAE74C B094050C */  jal         DepthOfField__FPfiii
/* 002A50 01DAE750 00000000 */   nop
.L01DAE754_2E9D54:
/* 002A54 01DAE754 349D828F */  lw          $2, -0x62CC($28)
/* 002A58 01DAE758 10004014 */  bnez        $2, .L01DAE79C_2E9D9C
/* 002A5C 01DAE75C 00000000 */   nop
/* 002A60 01DAE760 C701023C */  lui         $2, %hi(TexManager)
/* 002A64 01DAE764 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002A68 01DAE768 D48B858F */  lw          $5, -0x742C($28)
/* 002A6C 01DAE76C 16000624 */  addiu       $6, $0, 0x16
/* 002A70 01DAE770 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002A74 01DAE774 00000000 */   nop
/* 002A78 01DAE778 109D828F */  lw          $2, -0x62F0($28)
/* 002A7C 01DAE77C 4001A427 */  addiu       $4, $29, 0x140
/* 002A80 01DAE780 20024524 */  addiu       $5, $2, 0x220
/* 002A84 01DAE784 0C86040C */  jal         sceVu0CopyVector
/* 002A88 01DAE788 00000000 */   nop
/* 002A8C 01DAE78C C89C848F */  lw          $4, -0x6338($28)
/* 002A90 01DAE790 4001A527 */  addiu       $5, $29, 0x140
/* 002A94 01DAE794 4014070C */  jal         DrawAtraBoll__11CDungeonMapFPf
/* 002A98 01DAE798 00000000 */   nop
.L01DAE79C_2E9D9C:
/* 002A9C 01DAE79C 10B7760C */  jal         Draw_MainUnitShadow__Fv
/* 002AA0 01DAE7A0 00000000 */   nop
/* 002AA4 01DAE7A4 DC01013C */  lui         $1, %hi(BtActStatus)
/* 002AA8 01DAE7A8 8044228C */  lw          $2, %lo(BtActStatus)($1)
/* 002AAC 01DAE7AC 07004010 */  beqz        $2, .L01DAE7CC_2E9DCC
/* 002AB0 01DAE7B0 00000000 */   nop
/* 002AB4 01DAE7B4 D401013C */  lui         $1, %hi(EdEventInfo + 0x60)
/* 002AB8 01DAE7B8 30D2228C */  lw          $2, %lo(EdEventInfo + 0x60)($1)
/* 002ABC 01DAE7BC 03004010 */  beqz        $2, .L01DAE7CC_2E9DCC
/* 002AC0 01DAE7C0 00000000 */   nop
/* 002AC4 01DAE7C4 84B7760C */  jal         Draw_MainUnit__Fv
/* 002AC8 01DAE7C8 00000000 */   nop
.L01DAE7CC_2E9DCC:
/* 002ACC 01DAE7CC F09C828F */  lw          $2, -0x6310($28)
/* 002AD0 01DAE7D0 07004014 */  bnez        $2, .L01DAE7F0_2E9DF0
/* 002AD4 01DAE7D4 00000000 */   nop
/* 002AD8 01DAE7D8 189E828F */  lw          $2, -0x61E8($28)
/* 002ADC 01DAE7DC 04004014 */  bnez        $2, .L01DAE7F0_2E9DF0
/* 002AE0 01DAE7E0 00000000 */   nop
/* 002AE4 01DAE7E4 E09C848F */  lw          $4, -0x6320($28)
/* 002AE8 01DAE7E8 3463070C */  jal         DrawMonstor__12CMonstorUnitFv
/* 002AEC 01DAE7EC 00000000 */   nop
.L01DAE7F0_2E9DF0:
/* 002AF0 01DAE7F0 F49C828F */  lw          $2, -0x630C($28)
/* 002AF4 01DAE7F4 2A004010 */  beqz        $2, .L01DAE8A0_2E9EA0
/* 002AF8 01DAE7F8 00000000 */   nop
/* 002AFC 01DAE7FC C701023C */  lui         $2, %hi(TexManager)
/* 002B00 01DAE800 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002B04 01DAE804 D48B858F */  lw          $5, -0x742C($28)
/* 002B08 01DAE808 11000624 */  addiu       $6, $0, 0x11
/* 002B0C 01DAE80C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002B10 01DAE810 00000000 */   nop
/* 002B14 01DAE814 789C828F */  lw          $2, -0x6388($28)
/* 002B18 01DAE818 04004380 */  lb          $3, 0x4($2)
/* 002B1C 01DAE81C 01000224 */  addiu       $2, $0, 0x1
/* 002B20 01DAE820 05006214 */  bne         $3, $2, .L01DAE838_2E9E38
/* 002B24 01DAE824 00000000 */   nop
/* 002B28 01DAE828 EA01023C */  lui         $2, %hi(CharaHand)
/* 002B2C 01DAE82C D02E4424 */  addiu       $4, $2, %lo(CharaHand)
/* 002B30 01DAE830 C4E4040C */  jal         Draw__10CCharacterFv
/* 002B34 01DAE834 00000000 */   nop
.L01DAE838_2E9E38:
/* 002B38 01DAE838 009D848F */  lw          $4, -0x6300($28)
/* 002B3C 01DAE83C 18008010 */  beqz        $4, .L01DAE8A0_2E9EA0
/* 002B40 01DAE840 00000000 */   nop
/* 002B44 01DAE844 789C828F */  lw          $2, -0x6388($28)
/* 002B48 01DAE848 04004380 */  lb          $3, 0x4($2)
/* 002B4C 01DAE84C 01000224 */  addiu       $2, $0, 0x1
/* 002B50 01DAE850 13006214 */  bne         $3, $2, .L01DAE8A0_2E9EA0
/* 002B54 01DAE854 00000000 */   nop
/* 002B58 01DAE858 BC00828C */  lw          $2, 0xBC($4)
/* 002B5C 01DAE85C 10004010 */  beqz        $2, .L01DAE8A0_2E9EA0
/* 002B60 01DAE860 00000000 */   nop
/* 002B64 01DAE864 DC01013C */  lui         $1, %hi(BtActStatus + 0x58)
/* 002B68 01DAE868 D844228C */  lw          $2, %lo(BtActStatus + 0x58)($1)
/* 002B6C 01DAE86C 0C004010 */  beqz        $2, .L01DAE8A0_2E9EA0
/* 002B70 01DAE870 00000000 */   nop
/* 002B74 01DAE874 C701023C */  lui         $2, %hi(TexManager)
/* 002B78 01DAE878 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002B7C 01DAE87C D48B858F */  lw          $5, -0x742C($28)
/* 002B80 01DAE880 1D000624 */  addiu       $6, $0, 0x1D
/* 002B84 01DAE884 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002B88 01DAE888 00000000 */   nop
/* 002B8C 01DAE88C 009D848F */  lw          $4, -0x6300($28)
/* 002B90 01DAE890 A000998C */  lw          $25, 0xA0($4)
/* 002B94 01DAE894 AC00398F */  lw          $25, 0xAC($25)
/* 002B98 01DAE898 09F82003 */  jalr        $25
/* 002B9C 01DAE89C 00000000 */   nop
.L01DAE8A0_2E9EA0:
/* 002BA0 01DAE8A0 189E828F */  lw          $2, -0x61E8($28)
/* 002BA4 01DAE8A4 37004010 */  beqz        $2, .L01DAE984_2E9F84
/* 002BA8 01DAE8A8 00000000 */   nop
/* 002BAC 01DAE8AC 28860070 */  paddub      $16, $0, $0
/* 002BB0 01DAE8B0 31000010 */  b           .L01DAE978_2E9F78
/* 002BB4 01DAE8B4 00000000 */   nop
.L01DAE8B8_2E9EB8:
/* 002BB8 01DAE8B8 80181000 */  sll         $3, $16, 2
/* 002BBC 01DAE8BC D401023C */  lui         $2, %hi(EdEventInfo + 0xB4)
/* 002BC0 01DAE8C0 84D24224 */  addiu       $2, $2, %lo(EdEventInfo + 0xB4)
/* 002BC4 01DAE8C4 21104300 */  addu        $2, $2, $3
/* 002BC8 01DAE8C8 0000428C */  lw          $2, 0x0($2)
/* 002BCC 01DAE8CC 29004010 */  beqz        $2, .L01DAE974_2E9F74
/* 002BD0 01DAE8D0 00000000 */   nop
/* 002BD4 01DAE8D4 20000626 */  addiu       $6, $16, 0x20
/* 002BD8 01DAE8D8 C701023C */  lui         $2, %hi(TexManager)
/* 002BDC 01DAE8DC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002BE0 01DAE8E0 D48B858F */  lw          $5, -0x742C($28)
/* 002BE4 01DAE8E4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002BE8 01DAE8E8 00000000 */   nop
/* 002BEC 01DAE8EC 40111000 */  sll         $2, $16, 5
/* 002BF0 01DAE8F0 21185000 */  addu        $3, $2, $16
/* 002BF4 01DAE8F4 80100300 */  sll         $2, $3, 2
/* 002BF8 01DAE8F8 21106200 */  addu        $2, $3, $2
/* 002BFC 01DAE8FC 40190200 */  sll         $3, $2, 5
/* 002C00 01DAE900 EB01023C */  lui         $2, %hi(NPCUnit)
/* 002C04 01DAE904 60844224 */  addiu       $2, $2, %lo(NPCUnit)
/* 002C08 01DAE908 21884300 */  addu        $17, $2, $3
/* 002C0C 01DAE90C EB01023C */  lui         $2, %hi(NPCUnit + 0x148C)
/* 002C10 01DAE910 EC984224 */  addiu       $2, $2, %lo(NPCUnit + 0x148C)
/* 002C14 01DAE914 21104300 */  addu        $2, $2, $3
/* 002C18 01DAE918 28262072 */  paddub      $4, $17, $0
/* 002C1C 01DAE91C 0000458C */  lw          $5, 0x0($2)
/* 002C20 01DAE920 14E0040C */  jal         TextureAnime__10CCharacterFi
/* 002C24 01DAE924 00000000 */   nop
/* 002C28 01DAE928 28262072 */  paddub      $4, $17, $0
/* 002C2C 01DAE92C 5059050C */  jal         Draw__12CNPCharacterFv
/* 002C30 01DAE930 00000000 */   nop
/* 002C34 01DAE934 D501013C */  lui         $1, %hi(BtEventInfo + 0x94)
/* 002C38 01DAE938 D467238C */  lw          $3, %lo(BtEventInfo + 0x94)($1)
/* 002C3C 01DAE93C 0D000316 */  bne         $16, $3, .L01DAE974_2E9F74
/* 002C40 01DAE940 00000000 */   nop
/* 002C44 01DAE944 40110300 */  sll         $2, $3, 5
/* 002C48 01DAE948 21184300 */  addu        $3, $2, $3
/* 002C4C 01DAE94C 80100300 */  sll         $2, $3, 2
/* 002C50 01DAE950 21106200 */  addu        $2, $3, $2
/* 002C54 01DAE954 40190200 */  sll         $3, $2, 5
/* 002C58 01DAE958 EB01023C */  lui         $2, %hi(NPCUnit + 0xBC)
/* 002C5C 01DAE95C 1C854224 */  addiu       $2, $2, %lo(NPCUnit + 0xBC)
/* 002C60 01DAE960 21104300 */  addu        $2, $2, $3
/* 002C64 01DAE964 0000448C */  lw          $4, 0x0($2)
/* 002C68 01DAE968 0F000524 */  addiu       $5, $0, 0xF
/* 002C6C 01DAE96C 6465070C */  jal         DrawBee__FP6CFramei
/* 002C70 01DAE970 00000000 */   nop
.L01DAE974_2E9F74:
/* 002C74 01DAE974 01001026 */  addiu       $16, $16, 0x1
.L01DAE978_2E9F78:
/* 002C78 01DAE978 0600022A */  slti        $2, $16, 0x6
/* 002C7C 01DAE97C CEFF4014 */  bnez        $2, .L01DAE8B8_2E9EB8
/* 002C80 01DAE980 00000000 */   nop
.L01DAE984_2E9F84:
/* 002C84 01DAE984 C89C848F */  lw          $4, -0x6338($28)
/* 002C88 01DAE988 E007070C */  jal         DrawNPCDraw__11CDungeonMapFv
/* 002C8C 01DAE98C 00000000 */   nop
/* 002C90 01DAE990 EC01023C */  lui         $2, %hi(mainItemModel)
/* 002C94 01DAE994 60504424 */  addiu       $4, $2, %lo(mainItemModel)
/* 002C98 01DAE998 B452070C */  jal         Draw__14CMainItemModelFv
/* 002C9C 01DAE99C 00000000 */   nop
/* 002CA0 01DAE9A0 C701023C */  lui         $2, %hi(TexManager)
/* 002CA4 01DAE9A4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002CA8 01DAE9A8 D48B858F */  lw          $5, -0x742C($28)
/* 002CAC 01DAE9AC 06000624 */  addiu       $6, $0, 0x6
/* 002CB0 01DAE9B0 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002CB4 01DAE9B4 00000000 */   nop
/* 002CB8 01DAE9B8 B8BE060C */  jal         DrawWaterLing__Fv
/* 002CBC 01DAE9BC 00000000 */   nop
/* 002CC0 01DAE9C0 149D828F */  lw          $2, -0x62EC($28)
/* 002CC4 01DAE9C4 05004010 */  beqz        $2, .L01DAE9DC_2E9FDC
/* 002CC8 01DAE9C8 00000000 */   nop
/* 002CCC 01DAE9CC EB01023C */  lui         $2, %hi(Water_Splash)
/* 002CD0 01DAE9D0 20004424 */  addiu       $4, $2, %lo(Water_Splash)
/* 002CD4 01DAE9D4 C4E4040C */  jal         Draw__10CCharacterFv
/* 002CD8 01DAE9D8 00000000 */   nop
.L01DAE9DC_2E9FDC:
/* 002CDC 01DAE9DC C89C828F */  lw          $2, -0x6338($28)
/* 002CE0 01DAE9E0 0100013C */  lui         $1, (0x10000 >> 16)
/* 002CE4 01DAE9E4 21084100 */  addu        $1, $2, $1
/* 002CE8 01DAE9E8 ECBD238C */  lw          $3, -0x4214($1)
/* 002CEC 01DAE9EC 01000224 */  addiu       $2, $0, 0x1
/* 002CF0 01DAE9F0 2B006214 */  bne         $3, $2, .L01DAEAA0_2EA0A0
/* 002CF4 01DAE9F4 00000000 */   nop
/* 002CF8 01DAE9F8 C701023C */  lui         $2, %hi(TexManager)
/* 002CFC 01DAE9FC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002D00 01DAEA00 D48B858F */  lw          $5, -0x742C($28)
/* 002D04 01DAEA04 0D000624 */  addiu       $6, $0, 0xD
/* 002D08 01DAEA08 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002D0C 01DAEA0C 00000000 */   nop
/* 002D10 01DAEA10 8006A427 */  addiu       $4, $29, 0x680
/* 002D14 01DAEA14 4CBC040C */  jal         MGGetFBuffTex__FP9sceGsTex0
/* 002D18 01DAEA18 00000000 */   nop
/* 002D1C 01DAEA1C 5001A0AF */  sw          $0, 0x150($29)
/* 002D20 01DAEA20 5401A0AF */  sw          $0, 0x154($29)
/* 002D24 01DAEA24 80020224 */  addiu       $2, $0, 0x280
/* 002D28 01DAEA28 5801A2AF */  sw          $2, 0x158($29)
/* 002D2C 01DAEA2C E0000224 */  addiu       $2, $0, 0xE0
/* 002D30 01DAEA30 5C01A2AF */  sw          $2, 0x15C($29)
/* 002D34 01DAEA34 C701023C */  lui         $2, %hi(TexManager)
/* 002D38 01DAEA38 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002D3C 01DAEA3C DC01023C */  lui         $2, %hi(LIT_1797)
/* 002D40 01DAEA40 982E4524 */  addiu       $5, $2, %lo(LIT_1797)
/* 002D44 01DAEA44 FFFF0624 */  addiu       $6, $0, -0x1
/* 002D48 01DAEA48 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 002D4C 01DAEA4C 00000000 */   nop
/* 002D50 01DAEA50 8806A627 */  addiu       $6, $29, 0x688
/* 002D54 01DAEA54 280042DC */  ld          $2, 0x28($2)
/* 002D58 01DAEA58 0000C2FC */  sd          $2, 0x0($6)
/* 002D5C 01DAEA5C 8006A427 */  addiu       $4, $29, 0x680
/* 002D60 01DAEA60 5001A527 */  addiu       $5, $29, 0x150
/* 002D64 01DAEA64 283E0070 */  paddub      $7, $0, $0
/* 002D68 01DAEA68 28460070 */  paddub      $8, $0, $0
/* 002D6C 01DAEA6C 284E0070 */  paddub      $9, $0, $0
/* 002D70 01DAEA70 84BC040C */  jal         MGMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0iii
/* 002D74 01DAEA74 00000000 */   nop
/* 002D78 01DAEA78 109D828F */  lw          $2, -0x62F0($28)
/* 002D7C 01DAEA7C 6001A427 */  addiu       $4, $29, 0x160
/* 002D80 01DAEA80 20024524 */  addiu       $5, $2, 0x220
/* 002D84 01DAEA84 0C86040C */  jal         sceVu0CopyVector
/* 002D88 01DAEA88 00000000 */   nop
/* 002D8C 01DAEA8C C89C848F */  lw          $4, -0x6338($28)
/* 002D90 01DAEA90 6001A527 */  addiu       $5, $29, 0x160
/* 002D94 01DAEA94 749D868F */  lw          $6, -0x628C($28)
/* 002D98 01DAEA98 5012070C */  jal         DrawWater__11CDungeonMapFPfi
/* 002D9C 01DAEA9C 00000000 */   nop
.L01DAEAA0_2EA0A0:
/* 002DA0 01DAEAA0 E89C828F */  lw          $2, -0x6318($28)
/* 002DA4 01DAEAA4 3C004014 */  bnez        $2, .L01DAEB98_2EA198
/* 002DA8 01DAEAA8 00000000 */   nop
/* 002DAC 01DAEAAC 189E828F */  lw          $2, -0x61E8($28)
/* 002DB0 01DAEAB0 39004014 */  bnez        $2, .L01DAEB98_2EA198
/* 002DB4 01DAEAB4 00000000 */   nop
/* 002DB8 01DAEAB8 C701023C */  lui         $2, %hi(TexManager)
/* 002DBC 01DAEABC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002DC0 01DAEAC0 D48B858F */  lw          $5, -0x742C($28)
/* 002DC4 01DAEAC4 13000624 */  addiu       $6, $0, 0x13
/* 002DC8 01DAEAC8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002DCC 01DAEACC 00000000 */   nop
/* 002DD0 01DAEAD0 F89D848F */  lw          $4, -0x6208($28)
/* 002DD4 01DAEAD4 A89C858F */  lw          $5, -0x6358($28)
/* 002DD8 01DAEAD8 7858070C */  jal         Draw__10CShockWaveFP7CCamera
/* 002DDC 01DAEADC 00000000 */   nop
/* 002DE0 01DAEAE0 28860070 */  paddub      $16, $0, $0
/* 002DE4 01DAEAE4 0B000010 */  b           .L01DAEB14_2EA114
/* 002DE8 01DAEAE8 00000000 */   nop
.L01DAEAEC_2EA0EC:
/* 002DEC 01DAEAEC 40101000 */  sll         $2, $16, 1
/* 002DF0 01DAEAF0 21105000 */  addu        $2, $2, $16
/* 002DF4 01DAEAF4 80190200 */  sll         $3, $2, 6
/* 002DF8 01DAEAF8 F001023C */  lui         $2, %hi(CBomb__2)
/* 002DFC 01DAEAFC D0FE4224 */  addiu       $2, $2, %lo(CBomb__2)
/* 002E00 01DAEB00 21204300 */  addu        $4, $2, $3
/* 002E04 01DAEB04 A89C858F */  lw          $5, -0x6358($28)
/* 002E08 01DAEB08 CC56070C */  jal         Draw__15CItemBombEffectFP7CCamera
/* 002E0C 01DAEB0C 00000000 */   nop
/* 002E10 01DAEB10 01001026 */  addiu       $16, $16, 0x1
.L01DAEB14_2EA114:
/* 002E14 01DAEB14 0300022A */  slti        $2, $16, 0x3
/* 002E18 01DAEB18 F4FF4014 */  bnez        $2, .L01DAEAEC_2EA0EC
/* 002E1C 01DAEB1C 00000000 */   nop
/* 002E20 01DAEB20 28860070 */  paddub      $16, $0, $0
/* 002E24 01DAEB24 09000010 */  b           .L01DAEB4C_2EA14C
/* 002E28 01DAEB28 00000000 */   nop
.L01DAEB2C_2EA12C:
/* 002E2C 01DAEB2C 60A10234 */  ori         $2, $0, 0xA160
/* 002E30 01DAEB30 18180202 */  mult        $3, $16, $2
/* 002E34 01DAEB34 E601023C */  lui         $2, %hi(MasekiEffect)
/* 002E38 01DAEB38 80B34224 */  addiu       $2, $2, %lo(MasekiEffect)
/* 002E3C 01DAEB3C 21204300 */  addu        $4, $2, $3
/* 002E40 01DAEB40 C8AF060C */  jal         Draw__12CSHOT_EFFECTFv
/* 002E44 01DAEB44 00000000 */   nop
/* 002E48 01DAEB48 01001026 */  addiu       $16, $16, 0x1
.L01DAEB4C_2EA14C:
/* 002E4C 01DAEB4C 0500022A */  slti        $2, $16, 0x5
/* 002E50 01DAEB50 F6FF4014 */  bnez        $2, .L01DAEB2C_2EA12C
/* 002E54 01DAEB54 00000000 */   nop
/* 002E58 01DAEB58 E89D918F */  lw          $17, -0x6218($28)
/* 002E5C 01DAEB5C 28860070 */  paddub      $16, $0, $0
/* 002E60 01DAEB60 07000010 */  b           .L01DAEB80_2EA180
/* 002E64 01DAEB64 00000000 */   nop
.L01DAEB68_2EA168:
/* 002E68 01DAEB68 60A10234 */  ori         $2, $0, 0xA160
/* 002E6C 01DAEB6C 18100202 */  mult        $2, $16, $2
/* 002E70 01DAEB70 21202202 */  addu        $4, $17, $2
/* 002E74 01DAEB74 C8AF060C */  jal         Draw__12CSHOT_EFFECTFv
/* 002E78 01DAEB78 00000000 */   nop
/* 002E7C 01DAEB7C 01001026 */  addiu       $16, $16, 0x1
.L01DAEB80_2EA180:
/* 002E80 01DAEB80 0500022A */  slti        $2, $16, 0x5
/* 002E84 01DAEB84 F8FF4014 */  bnez        $2, .L01DAEB68_2EA168
/* 002E88 01DAEB88 00000000 */   nop
/* 002E8C 01DAEB8C FC9C848F */  lw          $4, -0x6304($28)
/* 002E90 01DAEB90 C8AF060C */  jal         Draw__12CSHOT_EFFECTFv
/* 002E94 01DAEB94 00000000 */   nop
.L01DAEB98_2EA198:
/* 002E98 01DAEB98 109D828F */  lw          $2, -0x62F0($28)
/* 002E9C 01DAEB9C 7001A427 */  addiu       $4, $29, 0x170
/* 002EA0 01DAEBA0 20024524 */  addiu       $5, $2, 0x220
/* 002EA4 01DAEBA4 0C86040C */  jal         sceVu0CopyVector
/* 002EA8 01DAEBA8 00000000 */   nop
/* 002EAC 01DAEBAC C701023C */  lui         $2, %hi(TexManager)
/* 002EB0 01DAEBB0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002EB4 01DAEBB4 D48B858F */  lw          $5, -0x742C($28)
/* 002EB8 01DAEBB8 0E000624 */  addiu       $6, $0, 0xE
/* 002EBC 01DAEBBC 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002EC0 01DAEBC0 00000000 */   nop
/* 002EC4 01DAEBC4 C89C848F */  lw          $4, -0x6338($28)
/* 002EC8 01DAEBC8 109D858F */  lw          $5, -0x62F0($28)
/* 002ECC 01DAEBCC 8411070C */  jal         DrawRaster__11CDungeonMapFP9CFrameVu1
/* 002ED0 01DAEBD0 00000000 */   nop
/* 002ED4 01DAEBD4 C89C848F */  lw          $4, -0x6338($28)
/* 002ED8 01DAEBD8 0100013C */  lui         $1, (0x10000 >> 16)
/* 002EDC 01DAEBDC 21088100 */  addu        $1, $4, $1
/* 002EE0 01DAEBE0 ECBD238C */  lw          $3, -0x4214($1)
/* 002EE4 01DAEBE4 01000224 */  addiu       $2, $0, 0x1
/* 002EE8 01DAEBE8 07006214 */  bne         $3, $2, .L01DAEC08_2EA208
/* 002EEC 01DAEBEC 00000000 */   nop
/* 002EF0 01DAEBF0 109D858F */  lw          $5, -0x62F0($28)
/* 002EF4 01DAEBF4 A89C868F */  lw          $6, -0x6358($28)
/* 002EF8 01DAEBF8 3010070C */  jal         DrawFire__11CDungeonMapFP9CFrameVu1P13CCameraFollow
/* 002EFC 01DAEBFC 00000000 */   nop
/* 002F00 01DAEC00 05000010 */  b           .L01DAEC18_2EA218
/* 002F04 01DAEC04 00000000 */   nop
.L01DAEC08_2EA208:
/* 002F08 01DAEC08 109D858F */  lw          $5, -0x62F0($28)
/* 002F0C 01DAEC0C A89C868F */  lw          $6, -0x6358($28)
/* 002F10 01DAEC10 300F070C */  jal         DrawFireFreeStyle__11CDungeonMapFP9CFrameVu1P13CCameraFollow
/* 002F14 01DAEC14 00000000 */   nop
.L01DAEC18_2EA218:
/* 002F18 01DAEC18 349D828F */  lw          $2, -0x62CC($28)
/* 002F1C 01DAEC1C 0E004010 */  beqz        $2, .L01DAEC58_2EA258
/* 002F20 01DAEC20 00000000 */   nop
/* 002F24 01DAEC24 2C9D828F */  lw          $2, -0x62D4($28)
/* 002F28 01DAEC28 0B004010 */  beqz        $2, .L01DAEC58_2EA258
/* 002F2C 01DAEC2C 00000000 */   nop
/* 002F30 01DAEC30 C701023C */  lui         $2, %hi(TexManager)
/* 002F34 01DAEC34 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002F38 01DAEC38 D48B858F */  lw          $5, -0x742C($28)
/* 002F3C 01DAEC3C 1C000624 */  addiu       $6, $0, 0x1C
/* 002F40 01DAEC40 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002F44 01DAEC44 00000000 */   nop
/* 002F48 01DAEC48 EB01023C */  lui         $2, %hi(shortAtraEffect)
/* 002F4C 01DAEC4C A04C4424 */  addiu       $4, $2, %lo(shortAtraEffect)
/* 002F50 01DAEC50 C4E4040C */  jal         Draw__10CCharacterFv
/* 002F54 01DAEC54 00000000 */   nop
.L01DAEC58_2EA258:
/* 002F58 01DAEC58 6894828F */  lw          $2, -0x6B98($28)
/* 002F5C 01DAEC5C 0A004010 */  beqz        $2, .L01DAEC88_2EA288
/* 002F60 01DAEC60 00000000 */   nop
/* 002F64 01DAEC64 C701023C */  lui         $2, %hi(TexManager)
/* 002F68 01DAEC68 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002F6C 01DAEC6C D48B858F */  lw          $5, -0x742C($28)
/* 002F70 01DAEC70 1C000624 */  addiu       $6, $0, 0x1C
/* 002F74 01DAEC74 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002F78 01DAEC78 00000000 */   nop
/* 002F7C 01DAEC7C 589D848F */  lw          $4, -0x62A8($28)
/* 002F80 01DAEC80 60BB040C */  jal         MGDraw__FP6CFrame
/* 002F84 01DAEC84 00000000 */   nop
.L01DAEC88_2EA288:
/* 002F88 01DAEC88 489D828F */  lw          $2, -0x62B8($28)
/* 002F8C 01DAEC8C 49004010 */  beqz        $2, .L01DAEDB4_2EA3B4
/* 002F90 01DAEC90 00000000 */   nop
/* 002F94 01DAEC94 8001A427 */  addiu       $4, $29, 0x180
/* 002F98 01DAEC98 4CB7040C */  jal         MGGetAmbient__FPf
/* 002F9C 01DAEC9C 00000000 */   nop
/* 002FA0 01DAECA0 C701023C */  lui         $2, %hi(TexManager)
/* 002FA4 01DAECA4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002FA8 01DAECA8 D48B858F */  lw          $5, -0x742C($28)
/* 002FAC 01DAECAC 16000624 */  addiu       $6, $0, 0x16
/* 002FB0 01DAECB0 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002FB4 01DAECB4 00000000 */   nop
/* 002FB8 01DAECB8 EB01023C */  lui         $2, %hi(itemOpenSmallFx)
/* 002FBC 01DAECBC F05E4424 */  addiu       $4, $2, %lo(itemOpenSmallFx)
/* 002FC0 01DAECC0 50DB060C */  jal         Draw__12CMotionModelFv
/* 002FC4 01DAECC4 00000000 */   nop
/* 002FC8 01DAECC8 C701023C */  lui         $2, %hi(TexManager)
/* 002FCC 01DAECCC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002FD0 01DAECD0 D48B858F */  lw          $5, -0x742C($28)
/* 002FD4 01DAECD4 1C000624 */  addiu       $6, $0, 0x1C
/* 002FD8 01DAECD8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 002FDC 01DAECDC 00000000 */   nop
/* 002FE0 01DAECE0 589D828F */  lw          $2, -0x62A8($28)
/* 002FE4 01DAECE4 9001A427 */  addiu       $4, $29, 0x190
/* 002FE8 01DAECE8 20024524 */  addiu       $5, $2, 0x220
/* 002FEC 01DAECEC 0C86040C */  jal         sceVu0CopyVector
/* 002FF0 01DAECF0 00000000 */   nop
/* 002FF4 01DAECF4 A001A427 */  addiu       $4, $29, 0x1A0
/* 002FF8 01DAECF8 9001A527 */  addiu       $5, $29, 0x190
/* 002FFC 01DAECFC 0C86040C */  jal         sceVu0CopyVector
/* 003000 01DAED00 00000000 */   nop
/* 003004 01DAED04 449E8283 */  lb          $2, -0x61BC($28)
/* 003008 01DAED08 05004014 */  bnez        $2, .L01DAED20_2EA320
/* 00300C 01DAED0C 00000000 */   nop
/* 003010 01DAED10 EC8580C7 */  lwc1        $f0, -0x7A14($28)
/* 003014 01DAED14 409E80E7 */  swc1        $f0, -0x61C0($28)
/* 003018 01DAED18 01000224 */  addiu       $2, $0, 0x1
/* 00301C 01DAED1C 449E82A3 */  sb          $2, -0x61BC($28)
.L01DAED20_2EA320:
/* 003020 01DAED20 409E81C7 */  lwc1        $f1, -0x61C0($28)
/* 003024 01DAED24 A88580C7 */  lwc1        $f0, -0x7A58($28)
/* 003028 01DAED28 40080046 */  add.s       $f1, $f1, $f0
/* 00302C 01DAED2C 409E81E7 */  swc1        $f1, -0x61C0($28)
/* 003030 01DAED30 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 003034 01DAED34 34080046 */  c.lt.s      $f1, $f0
/* 003038 01DAED38 00000000 */  nop
/* 00303C 01DAED3C 05000145 */  bc1t        .L01DAED54_2EA354
/* 003040 01DAED40 00000000 */   nop
/* 003044 01DAED44 409E81C7 */  lwc1        $f1, -0x61C0($28)
/* 003048 01DAED48 F08580C7 */  lwc1        $f0, -0x7A10($28)
/* 00304C 01DAED4C 01080046 */  sub.s       $f0, $f1, $f0
/* 003050 01DAED50 409E80E7 */  swc1        $f0, -0x61C0($28)
.L01DAED54_2EA354:
/* 003054 01DAED54 409E8CC7 */  lwc1        $f12, -0x61C0($28)
/* 003058 01DAED58 2876040C */  jal         sinf
/* 00305C 01DAED5C 00000000 */   nop
/* 003060 01DAED60 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 003064 01DAED64 00088244 */  mtc1        $2, $f1
/* 003068 01DAED68 00000000 */  nop
/* 00306C 01DAED6C 42080046 */  mul.s       $f1, $f1, $f0
/* 003070 01DAED70 9401A0C7 */  lwc1        $f0, 0x194($29)
/* 003074 01DAED74 00000146 */  add.s       $f0, $f0, $f1
/* 003078 01DAED78 9401A0E7 */  swc1        $f0, 0x194($29)
/* 00307C 01DAED7C 589D848F */  lw          $4, -0x62A8($28)
/* 003080 01DAED80 9001A527 */  addiu       $5, $29, 0x190
/* 003084 01DAED84 B89F040C */  jal         SetPosition__6CFrameFPf
/* 003088 01DAED88 00000000 */   nop
/* 00308C 01DAED8C 589D848F */  lw          $4, -0x62A8($28)
/* 003090 01DAED90 60BB040C */  jal         MGDraw__FP6CFrame
/* 003094 01DAED94 00000000 */   nop
/* 003098 01DAED98 8001A427 */  addiu       $4, $29, 0x180
/* 00309C 01DAED9C 40B7040C */  jal         MGSetAmbient__FPf
/* 0030A0 01DAEDA0 00000000 */   nop
/* 0030A4 01DAEDA4 589D848F */  lw          $4, -0x62A8($28)
/* 0030A8 01DAEDA8 A001A527 */  addiu       $5, $29, 0x1A0
/* 0030AC 01DAEDAC B89F040C */  jal         SetPosition__6CFrameFPf
/* 0030B0 01DAEDB0 00000000 */   nop
.L01DAEDB4_2EA3B4:
/* 0030B4 01DAEDB4 609D828F */  lw          $2, -0x62A0($28)
/* 0030B8 01DAEDB8 3D004010 */  beqz        $2, .L01DAEEB0_2EA4B0
/* 0030BC 01DAEDBC 00000000 */   nop
/* 0030C0 01DAEDC0 C701023C */  lui         $2, %hi(TexManager)
/* 0030C4 01DAEDC4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0030C8 01DAEDC8 D48B858F */  lw          $5, -0x742C($28)
/* 0030CC 01DAEDCC 16000624 */  addiu       $6, $0, 0x16
/* 0030D0 01DAEDD0 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0030D4 01DAEDD4 00000000 */   nop
/* 0030D8 01DAEDD8 EB01013C */  lui         $1, %hi(itemOpenBigFx)
/* 0030DC 01DAEDDC 3060248C */  lw          $4, %lo(itemOpenBigFx)($1)
/* 0030E0 01DAEDE0 60BB040C */  jal         MGDraw__FP6CFrame
/* 0030E4 01DAEDE4 00000000 */   nop
/* 0030E8 01DAEDE8 589D828F */  lw          $2, -0x62A8($28)
/* 0030EC 01DAEDEC B001A427 */  addiu       $4, $29, 0x1B0
/* 0030F0 01DAEDF0 20024524 */  addiu       $5, $2, 0x220
/* 0030F4 01DAEDF4 0C86040C */  jal         sceVu0CopyVector
/* 0030F8 01DAEDF8 00000000 */   nop
/* 0030FC 01DAEDFC C001A427 */  addiu       $4, $29, 0x1C0
/* 003100 01DAEE00 B001A527 */  addiu       $5, $29, 0x1B0
/* 003104 01DAEE04 0C86040C */  jal         sceVu0CopyVector
/* 003108 01DAEE08 00000000 */   nop
/* 00310C 01DAEE0C 4C9E8283 */  lb          $2, -0x61B4($28)
/* 003110 01DAEE10 05004014 */  bnez        $2, .L01DAEE28_2EA428
/* 003114 01DAEE14 00000000 */   nop
/* 003118 01DAEE18 F48580C7 */  lwc1        $f0, -0x7A0C($28)
/* 00311C 01DAEE1C 489E80E7 */  swc1        $f0, -0x61B8($28)
/* 003120 01DAEE20 01000224 */  addiu       $2, $0, 0x1
/* 003124 01DAEE24 4C9E82A3 */  sb          $2, -0x61B4($28)
.L01DAEE28_2EA428:
/* 003128 01DAEE28 489E81C7 */  lwc1        $f1, -0x61B8($28)
/* 00312C 01DAEE2C A88580C7 */  lwc1        $f0, -0x7A58($28)
/* 003130 01DAEE30 40080046 */  add.s       $f1, $f1, $f0
/* 003134 01DAEE34 489E81E7 */  swc1        $f1, -0x61B8($28)
/* 003138 01DAEE38 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 00313C 01DAEE3C 34080046 */  c.lt.s      $f1, $f0
/* 003140 01DAEE40 00000000 */  nop
/* 003144 01DAEE44 05000145 */  bc1t        .L01DAEE5C_2EA45C
/* 003148 01DAEE48 00000000 */   nop
/* 00314C 01DAEE4C 489E81C7 */  lwc1        $f1, -0x61B8($28)
/* 003150 01DAEE50 F88580C7 */  lwc1        $f0, -0x7A08($28)
/* 003154 01DAEE54 01080046 */  sub.s       $f0, $f1, $f0
/* 003158 01DAEE58 489E80E7 */  swc1        $f0, -0x61B8($28)
.L01DAEE5C_2EA45C:
/* 00315C 01DAEE5C 489E8CC7 */  lwc1        $f12, -0x61B8($28)
/* 003160 01DAEE60 2876040C */  jal         sinf
/* 003164 01DAEE64 00000000 */   nop
/* 003168 01DAEE68 F08181C7 */  lwc1        $f1, -0x7E10($28)
/* 00316C 01DAEE6C 42080046 */  mul.s       $f1, $f1, $f0
/* 003170 01DAEE70 B401A0C7 */  lwc1        $f0, 0x1B4($29)
/* 003174 01DAEE74 00000146 */  add.s       $f0, $f0, $f1
/* 003178 01DAEE78 B401A0E7 */  swc1        $f0, 0x1B4($29)
/* 00317C 01DAEE7C 589D848F */  lw          $4, -0x62A8($28)
/* 003180 01DAEE80 B001A527 */  addiu       $5, $29, 0x1B0
/* 003184 01DAEE84 B89F040C */  jal         SetPosition__6CFrameFPf
/* 003188 01DAEE88 00000000 */   nop
/* 00318C 01DAEE8C C701023C */  lui         $2, %hi(TexManager)
/* 003190 01DAEE90 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 003194 01DAEE94 D48B858F */  lw          $5, -0x742C($28)
/* 003198 01DAEE98 1C000624 */  addiu       $6, $0, 0x1C
/* 00319C 01DAEE9C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0031A0 01DAEEA0 00000000 */   nop
/* 0031A4 01DAEEA4 589D848F */  lw          $4, -0x62A8($28)
/* 0031A8 01DAEEA8 60BB040C */  jal         MGDraw__FP6CFrame
/* 0031AC 01DAEEAC 00000000 */   nop
.L01DAEEB0_2EA4B0:
/* 0031B0 01DAEEB0 289D828F */  lw          $2, -0x62D8($28)
/* 0031B4 01DAEEB4 1F004010 */  beqz        $2, .L01DAEF34_2EA534
/* 0031B8 01DAEEB8 00000000 */   nop
/* 0031BC 01DAEEBC C701023C */  lui         $2, %hi(TexManager)
/* 0031C0 01DAEEC0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0031C4 01DAEEC4 D48B858F */  lw          $5, -0x742C($28)
/* 0031C8 01DAEEC8 0B000624 */  addiu       $6, $0, 0xB
/* 0031CC 01DAEECC 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0031D0 01DAEED0 00000000 */   nop
/* 0031D4 01DAEED4 D001A427 */  addiu       $4, $29, 0x1D0
/* 0031D8 01DAEED8 EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0031DC 01DAEEDC 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0031E0 01DAEEE0 0C86040C */  jal         sceVu0CopyVector
/* 0031E4 01DAEEE4 00000000 */   nop
/* 0031E8 01DAEEE8 EA01023C */  lui         $2, %hi(CharaMain)
/* 0031EC 01DAEEEC 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0031F0 01DAEEF0 E001A527 */  addiu       $5, $29, 0x1E0
/* 0031F4 01DAEEF4 BC5B050C */  jal         GetRotation__7CObjectFPf
/* 0031F8 01DAEEF8 00000000 */   nop
/* 0031FC 01DAEEFC EB01023C */  lui         $2, %hi(NewChangeFx)
/* 003200 01DAEF00 D03A4424 */  addiu       $4, $2, %lo(NewChangeFx)
/* 003204 01DAEF04 D001A527 */  addiu       $5, $29, 0x1D0
/* 003208 01DAEF08 38E4040C */  jal         SetPosition__10CCharacterFPf
/* 00320C 01DAEF0C 00000000 */   nop
/* 003210 01DAEF10 EB01023C */  lui         $2, %hi(NewChangeFx)
/* 003214 01DAEF14 D03A4424 */  addiu       $4, $2, %lo(NewChangeFx)
/* 003218 01DAEF18 E001A527 */  addiu       $5, $29, 0x1E0
/* 00321C 01DAEF1C 78E4040C */  jal         SetRotation__10CCharacterFPf
/* 003220 01DAEF20 00000000 */   nop
/* 003224 01DAEF24 EB01023C */  lui         $2, %hi(NewChangeFx)
/* 003228 01DAEF28 D03A4424 */  addiu       $4, $2, %lo(NewChangeFx)
/* 00322C 01DAEF2C C4E4040C */  jal         Draw__10CCharacterFv
/* 003230 01DAEF30 00000000 */   nop
.L01DAEF34_2EA534:
/* 003234 01DAEF34 189D828F */  lw          $2, -0x62E8($28)
/* 003238 01DAEF38 0B004010 */  beqz        $2, .L01DAEF68_2EA568
/* 00323C 01DAEF3C 00000000 */   nop
/* 003240 01DAEF40 C701023C */  lui         $2, %hi(TexManager)
/* 003244 01DAEF44 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 003248 01DAEF48 D48B858F */  lw          $5, -0x742C($28)
/* 00324C 01DAEF4C 1C000624 */  addiu       $6, $0, 0x1C
/* 003250 01DAEF50 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 003254 01DAEF54 00000000 */   nop
/* 003258 01DAEF58 EB01023C */  lui         $2, %hi(EscapeEffect)
/* 00325C 01DAEF5C 00294424 */  addiu       $4, $2, %lo(EscapeEffect)
/* 003260 01DAEF60 C4E4040C */  jal         Draw__10CCharacterFv
/* 003264 01DAEF64 00000000 */   nop
.L01DAEF68_2EA568:
/* 003268 01DAEF68 C89C848F */  lw          $4, -0x6338($28)
/* 00326C 01DAEF6C F41E070C */  jal         DrawTrapCircle__11CDungeonMapFv
/* 003270 01DAEF70 00000000 */   nop
/* 003274 01DAEF74 C701023C */  lui         $2, %hi(TexManager)
/* 003278 01DAEF78 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00327C 01DAEF7C D48B858F */  lw          $5, -0x742C($28)
/* 003280 01DAEF80 01000624 */  addiu       $6, $0, 0x1
/* 003284 01DAEF84 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 003288 01DAEF88 00000000 */   nop
/* 00328C 01DAEF8C F09C828F */  lw          $2, -0x6310($28)
/* 003290 01DAEF90 07004014 */  bnez        $2, .L01DAEFB0_2EA5B0
/* 003294 01DAEF94 00000000 */   nop
/* 003298 01DAEF98 189E828F */  lw          $2, -0x61E8($28)
/* 00329C 01DAEF9C 04004014 */  bnez        $2, .L01DAEFB0_2EA5B0
/* 0032A0 01DAEFA0 00000000 */   nop
/* 0032A4 01DAEFA4 E09C848F */  lw          $4, -0x6320($28)
/* 0032A8 01DAEFA8 8464070C */  jal         DrawMonstorCursor__12CMonstorUnitFv
/* 0032AC 01DAEFAC 00000000 */   nop
.L01DAEFB0_2EA5B0:
/* 0032B0 01DAEFB0 D501013C */  lui         $1, %hi(BtEventInfo + 0x38)
/* 0032B4 01DAEFB4 7867228C */  lw          $2, %lo(BtEventInfo + 0x38)($1)
/* 0032B8 01DAEFB8 47004010 */  beqz        $2, .L01DAF0D8_2EA6D8
/* 0032BC 01DAEFBC 00000000 */   nop
/* 0032C0 01DAEFC0 F001A427 */  addiu       $4, $29, 0x1F0
/* 0032C4 01DAEFC4 EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0032C8 01DAEFC8 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0032CC 01DAEFCC 0C86040C */  jal         sceVu0CopyVector
/* 0032D0 01DAEFD0 00000000 */   nop
/* 0032D4 01DAEFD4 F401B027 */  addiu       $16, $29, 0x1F4
/* 0032D8 01DAEFD8 000001C6 */  lwc1        $f1, 0x0($16)
/* 0032DC 01DAEFDC B041023C */  lui         $2, (0x41B00000 >> 16)
/* 0032E0 01DAEFE0 00008244 */  mtc1        $2, $f0
/* 0032E4 01DAEFE4 00000000 */  nop
/* 0032E8 01DAEFE8 00080046 */  add.s       $f0, $f1, $f0
/* 0032EC 01DAEFEC 000000E6 */  swc1        $f0, 0x0($16)
/* 0032F0 01DAEFF0 549E8283 */  lb          $2, -0x61AC($28)
/* 0032F4 01DAEFF4 05004014 */  bnez        $2, .L01DAF00C_2EA60C
/* 0032F8 01DAEFF8 00000000 */   nop
/* 0032FC 01DAEFFC FC8580C7 */  lwc1        $f0, -0x7A04($28)
/* 003300 01DAF000 509E80E7 */  swc1        $f0, -0x61B0($28)
/* 003304 01DAF004 01000224 */  addiu       $2, $0, 0x1
/* 003308 01DAF008 549E82A3 */  sb          $2, -0x61AC($28)
.L01DAF00C_2EA60C:
/* 00330C 01DAF00C 509E81C7 */  lwc1        $f1, -0x61B0($28)
/* 003310 01DAF010 008680C7 */  lwc1        $f0, -0x7A00($28)
/* 003314 01DAF014 40080046 */  add.s       $f1, $f1, $f0
/* 003318 01DAF018 509E81E7 */  swc1        $f1, -0x61B0($28)
/* 00331C 01DAF01C 448480C7 */  lwc1        $f0, -0x7BBC($28)
/* 003320 01DAF020 34080046 */  c.lt.s      $f1, $f0
/* 003324 01DAF024 00000000 */  nop
/* 003328 01DAF028 05000145 */  bc1t        .L01DAF040_2EA640
/* 00332C 01DAF02C 00000000 */   nop
/* 003330 01DAF030 509E81C7 */  lwc1        $f1, -0x61B0($28)
/* 003334 01DAF034 048680C7 */  lwc1        $f0, -0x79FC($28)
/* 003338 01DAF038 01080046 */  sub.s       $f0, $f1, $f0
/* 00333C 01DAF03C 509E80E7 */  swc1        $f0, -0x61B0($28)
.L01DAF040_2EA640:
/* 003340 01DAF040 509E8CC7 */  lwc1        $f12, -0x61B0($28)
/* 003344 01DAF044 2876040C */  jal         sinf
/* 003348 01DAF048 00000000 */   nop
/* 00334C 01DAF04C 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 003350 01DAF050 00088244 */  mtc1        $2, $f1
/* 003354 01DAF054 00000000 */  nop
/* 003358 01DAF058 42080046 */  mul.s       $f1, $f1, $f0
/* 00335C 01DAF05C 000000C6 */  lwc1        $f0, 0x0($16)
/* 003360 01DAF060 00000146 */  add.s       $f0, $f0, $f1
/* 003364 01DAF064 000000E6 */  swc1        $f0, 0x0($16)
/* 003368 01DAF068 789C858F */  lw          $5, -0x6388($28)
/* 00336C 01DAF06C DC01023C */  lui         $2, %hi(LIT_345__11)
/* 003370 01DAF070 401B4224 */  addiu       $2, $2, %lo(LIT_345__11)
/* 003374 01DAF074 4006A427 */  addiu       $4, $29, 0x640
/* 003378 01DAF078 00004378 */  lq          $3, 0x0($2)
/* 00337C 01DAF07C 100042DC */  ld          $2, 0x10($2)
/* 003380 01DAF080 0000837C */  sq          $3, 0x0($4)
/* 003384 01DAF084 100082FC */  sd          $2, 0x10($4)
/* 003388 01DAF088 0400A280 */  lb          $2, 0x4($5)
/* 00338C 01DAF08C 80100200 */  sll         $2, $2, 2
/* 003390 01DAF090 21105D00 */  addu        $2, $2, $29
/* 003394 01DAF094 400642C4 */  lwc1        $f2, 0x640($2)
/* 003398 01DAF098 000001C6 */  lwc1        $f1, 0x0($16)
/* 00339C 01DAF09C 7041023C */  lui         $2, (0x41700000 >> 16)
/* 0033A0 01DAF0A0 00008244 */  mtc1        $2, $f0
/* 0033A4 01DAF0A4 00000000 */  nop
/* 0033A8 01DAF0A8 01100046 */  sub.s       $f0, $f2, $f0
/* 0033AC 01DAF0AC 00080046 */  add.s       $f0, $f1, $f0
/* 0033B0 01DAF0B0 000000E6 */  swc1        $f0, 0x0($16)
/* 0033B4 01DAF0B4 8C9D848F */  lw          $4, -0x6274($28)
/* 0033B8 01DAF0B8 F001A527 */  addiu       $5, $29, 0x1F0
/* 0033BC 01DAF0BC B89F040C */  jal         SetPosition__6CFrameFPf
/* 0033C0 01DAF0C0 00000000 */   nop
/* 0033C4 01DAF0C4 8C9D848F */  lw          $4, -0x6274($28)
/* 0033C8 01DAF0C8 60BB040C */  jal         MGDraw__FP6CFrame
/* 0033CC 01DAF0CC 00000000 */   nop
/* 0033D0 01DAF0D0 D501013C */  lui         $1, %hi(BtEventInfo + 0x38)
/* 0033D4 01DAF0D4 786720AC */  sw          $0, %lo(BtEventInfo + 0x38)($1)
.L01DAF0D8_2EA6D8:
/* 0033D8 01DAF0D8 8C9C828F */  lw          $2, -0x6374($28)
/* 0033DC 01DAF0DC D7044014 */  bnez        $2, .L01DB043C_2EBA3C
/* 0033E0 01DAF0E0 00000000 */   nop
/* 0033E4 01DAF0E4 D501013C */  lui         $1, %hi(DebugStatus + 0x28)
/* 0033E8 01DAF0E8 8864228C */  lw          $2, %lo(DebugStatus + 0x28)($1)
/* 0033EC 01DAF0EC D3044014 */  bnez        $2, .L01DB043C_2EBA3C
/* 0033F0 01DAF0F0 00000000 */   nop
/* 0033F4 01DAF0F4 28260070 */  paddub      $4, $0, $0
/* 0033F8 01DAF0F8 046F050C */  jal         setbilinear__Fi
/* 0033FC 01DAF0FC 00000000 */   nop
/* 003400 01DAF100 889C828F */  lw          $2, -0x6378($28)
/* 003404 01DAF104 11004014 */  bnez        $2, .L01DAF14C_2EA74C
/* 003408 01DAF108 00000000 */   nop
/* 00340C 01DAF10C F09C828F */  lw          $2, -0x6310($28)
/* 003410 01DAF110 0E004014 */  bnez        $2, .L01DAF14C_2EA74C
/* 003414 01DAF114 00000000 */   nop
/* 003418 01DAF118 989D848F */  lw          $4, -0x6268($28)
/* 00341C 01DAF11C E801770C */  jal         setTargetCursor__Fi
/* 003420 01DAF120 00000000 */   nop
/* 003424 01DAF124 909D828F */  lw          $2, -0x6270($28)
/* 003428 01DAF128 05004010 */  beqz        $2, .L01DAF140_2EA740
/* 00342C 01DAF12C 00000000 */   nop
/* 003430 01DAF130 849D848F */  lw          $4, -0x627C($28)
/* 003434 01DAF134 60BB040C */  jal         MGDraw__FP6CFrame
/* 003438 01DAF138 00000000 */   nop
/* 00343C 01DAF13C 909D80AF */  sw          $0, -0x6270($28)
.L01DAF140_2EA740:
/* 003440 01DAF140 28260070 */  paddub      $4, $0, $0
/* 003444 01DAF144 046F050C */  jal         setbilinear__Fi
/* 003448 01DAF148 00000000 */   nop
.L01DAF14C_2EA74C:
/* 00344C 01DAF14C B49D838F */  lw          $3, -0x624C($28)
/* 003450 01DAF150 FFFF0224 */  addiu       $2, $0, -0x1
/* 003454 01DAF154 4C006210 */  beq         $3, $2, .L01DAF288_2EA888
/* 003458 01DAF158 00000000 */   nop
/* 00345C 01DAF15C B89D828F */  lw          $2, -0x6248($28)
/* 003460 01DAF160 49004010 */  beqz        $2, .L01DAF288_2EA888
/* 003464 01DAF164 00000000 */   nop
/* 003468 01DAF168 EB01023C */  lui         $2, %hi(iventPos)
/* 00346C 01DAF16C 10644424 */  addiu       $4, $2, %lo(iventPos)
/* 003470 01DAF170 EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 003474 01DAF174 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 003478 01DAF178 0C86040C */  jal         sceVu0CopyVector
/* 00347C 01DAF17C 00000000 */   nop
/* 003480 01DAF180 EB01013C */  lui         $1, %hi(iventPos + 0x4)
/* 003484 01DAF184 146421C4 */  lwc1        $f1, %lo(iventPos + 0x4)($1)
/* 003488 01DAF188 B041023C */  lui         $2, (0x41B00000 >> 16)
/* 00348C 01DAF18C 00008244 */  mtc1        $2, $f0
/* 003490 01DAF190 00000000 */  nop
/* 003494 01DAF194 00080046 */  add.s       $f0, $f1, $f0
/* 003498 01DAF198 EB01013C */  lui         $1, %hi(iventPos + 0x4)
/* 00349C 01DAF19C 146420E4 */  swc1        $f0, %lo(iventPos + 0x4)($1)
/* 0034A0 01DAF1A0 5C9E8283 */  lb          $2, -0x61A4($28)
/* 0034A4 01DAF1A4 05004014 */  bnez        $2, .L01DAF1BC_2EA7BC
/* 0034A8 01DAF1A8 00000000 */   nop
/* 0034AC 01DAF1AC 088680C7 */  lwc1        $f0, -0x79F8($28)
/* 0034B0 01DAF1B0 589E80E7 */  swc1        $f0, -0x61A8($28)
/* 0034B4 01DAF1B4 01000224 */  addiu       $2, $0, 0x1
/* 0034B8 01DAF1B8 5C9E82A3 */  sb          $2, -0x61A4($28)
.L01DAF1BC_2EA7BC:
/* 0034BC 01DAF1BC 589E81C7 */  lwc1        $f1, -0x61A8($28)
/* 0034C0 01DAF1C0 008680C7 */  lwc1        $f0, -0x7A00($28)
/* 0034C4 01DAF1C4 40080046 */  add.s       $f1, $f1, $f0
/* 0034C8 01DAF1C8 589E81E7 */  swc1        $f1, -0x61A8($28)
/* 0034CC 01DAF1CC 448480C7 */  lwc1        $f0, -0x7BBC($28)
/* 0034D0 01DAF1D0 34080046 */  c.lt.s      $f1, $f0
/* 0034D4 01DAF1D4 00000000 */  nop
/* 0034D8 01DAF1D8 05000145 */  bc1t        .L01DAF1F0_2EA7F0
/* 0034DC 01DAF1DC 00000000 */   nop
/* 0034E0 01DAF1E0 589E81C7 */  lwc1        $f1, -0x61A8($28)
/* 0034E4 01DAF1E4 0C8680C7 */  lwc1        $f0, -0x79F4($28)
/* 0034E8 01DAF1E8 01080046 */  sub.s       $f0, $f1, $f0
/* 0034EC 01DAF1EC 589E80E7 */  swc1        $f0, -0x61A8($28)
.L01DAF1F0_2EA7F0:
/* 0034F0 01DAF1F0 589E8CC7 */  lwc1        $f12, -0x61A8($28)
/* 0034F4 01DAF1F4 2876040C */  jal         sinf
/* 0034F8 01DAF1F8 00000000 */   nop
/* 0034FC 01DAF1FC 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 003500 01DAF200 00088244 */  mtc1        $2, $f1
/* 003504 01DAF204 00000000 */  nop
/* 003508 01DAF208 42080046 */  mul.s       $f1, $f1, $f0
/* 00350C 01DAF20C EB01013C */  lui         $1, %hi(iventPos + 0x4)
/* 003510 01DAF210 146420C4 */  lwc1        $f0, %lo(iventPos + 0x4)($1)
/* 003514 01DAF214 00000146 */  add.s       $f0, $f0, $f1
/* 003518 01DAF218 EB01013C */  lui         $1, %hi(iventPos + 0x4)
/* 00351C 01DAF21C 146420E4 */  swc1        $f0, %lo(iventPos + 0x4)($1)
/* 003520 01DAF220 789C858F */  lw          $5, -0x6388($28)
/* 003524 01DAF224 DC01023C */  lui         $2, %hi(LIT_345__11)
/* 003528 01DAF228 401B4224 */  addiu       $2, $2, %lo(LIT_345__11)
/* 00352C 01DAF22C 6006A427 */  addiu       $4, $29, 0x660
/* 003530 01DAF230 00004378 */  lq          $3, 0x0($2)
/* 003534 01DAF234 100042DC */  ld          $2, 0x10($2)
/* 003538 01DAF238 0000837C */  sq          $3, 0x0($4)
/* 00353C 01DAF23C 100082FC */  sd          $2, 0x10($4)
/* 003540 01DAF240 0400A280 */  lb          $2, 0x4($5)
/* 003544 01DAF244 80100200 */  sll         $2, $2, 2
/* 003548 01DAF248 21105D00 */  addu        $2, $2, $29
/* 00354C 01DAF24C 600642C4 */  lwc1        $f2, 0x660($2)
/* 003550 01DAF250 EB01013C */  lui         $1, %hi(iventPos + 0x4)
/* 003554 01DAF254 146421C4 */  lwc1        $f1, %lo(iventPos + 0x4)($1)
/* 003558 01DAF258 7041023C */  lui         $2, (0x41700000 >> 16)
/* 00355C 01DAF25C 00008244 */  mtc1        $2, $f0
/* 003560 01DAF260 00000000 */  nop
/* 003564 01DAF264 01100046 */  sub.s       $f0, $f2, $f0
/* 003568 01DAF268 00080046 */  add.s       $f0, $f1, $f0
/* 00356C 01DAF26C EB01013C */  lui         $1, %hi(iventPos + 0x4)
/* 003570 01DAF270 146420E4 */  swc1        $f0, %lo(iventPos + 0x4)($1)
/* 003574 01DAF274 8C9D848F */  lw          $4, -0x6274($28)
/* 003578 01DAF278 EB01023C */  lui         $2, %hi(iventPos)
/* 00357C 01DAF27C 10644524 */  addiu       $5, $2, %lo(iventPos)
/* 003580 01DAF280 B89F040C */  jal         SetPosition__6CFrameFPf
/* 003584 01DAF284 00000000 */   nop
.L01DAF288_2EA888:
/* 003588 01DAF288 EB01013C */  lui         $1, %hi(BombInfo + 0x14)
/* 00358C 01DAF28C 0463228C */  lw          $2, %lo(BombInfo + 0x14)($1)
/* 003590 01DAF290 09004010 */  beqz        $2, .L01DAF2B8_2EA8B8
/* 003594 01DAF294 00000000 */   nop
/* 003598 01DAF298 889D848F */  lw          $4, -0x6278($28)
/* 00359C 01DAF29C EB01023C */  lui         $2, %hi(BombInfo)
/* 0035A0 01DAF2A0 F0624524 */  addiu       $5, $2, %lo(BombInfo)
/* 0035A4 01DAF2A4 B89F040C */  jal         SetPosition__6CFrameFPf
/* 0035A8 01DAF2A8 00000000 */   nop
/* 0035AC 01DAF2AC 889D848F */  lw          $4, -0x6278($28)
/* 0035B0 01DAF2B0 60BB040C */  jal         MGDraw__FP6CFrame
/* 0035B4 01DAF2B4 00000000 */   nop
.L01DAF2B8_2EA8B8:
/* 0035B8 01DAF2B8 E89C828F */  lw          $2, -0x6318($28)
/* 0035BC 01DAF2BC 0E004014 */  bnez        $2, .L01DAF2F8_2EA8F8
/* 0035C0 01DAF2C0 00000000 */   nop
/* 0035C4 01DAF2C4 189E828F */  lw          $2, -0x61E8($28)
/* 0035C8 01DAF2C8 0B004014 */  bnez        $2, .L01DAF2F8_2EA8F8
/* 0035CC 01DAF2CC 00000000 */   nop
/* 0035D0 01DAF2D0 28260070 */  paddub      $4, $0, $0
/* 0035D4 01DAF2D4 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 0035D8 01DAF2D8 00000000 */   nop
/* 0035DC 01DAF2DC 089D848F */  lw          $4, -0x62F8($28)
/* 0035E0 01DAF2E0 F85A070C */  jal         Draw__11CRandomItemFv
/* 0035E4 01DAF2E4 00000000 */   nop
/* 0035E8 01DAF2E8 EB01023C */  lui         $2, %hi(StealItem)
/* 0035EC 01DAF2EC 00834424 */  addiu       $4, $2, %lo(StealItem)
/* 0035F0 01DAF2F0 505E070C */  jal         Draw__10CStealItemFv
/* 0035F4 01DAF2F4 00000000 */   nop
.L01DAF2F8_2EA8F8:
/* 0035F8 01DAF2F8 889C828F */  lw          $2, -0x6378($28)
/* 0035FC 01DAF2FC 85004014 */  bnez        $2, .L01DAF514_2EAB14
/* 003600 01DAF300 00000000 */   nop
/* 003604 01DAF304 C701023C */  lui         $2, %hi(TexManager)
/* 003608 01DAF308 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00360C 01DAF30C D48B858F */  lw          $5, -0x742C($28)
/* 003610 01DAF310 12000624 */  addiu       $6, $0, 0x12
/* 003614 01DAF314 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 003618 01DAF318 00000000 */   nop
/* 00361C 01DAF31C 9006A427 */  addiu       $4, $29, 0x690
/* 003620 01DAF320 F88B82DF */  ld          $2, -0x7408($28)
/* 003624 01DAF324 000082FC */  sd          $2, 0x0($4)
/* 003628 01DAF328 9006A393 */  lbu         $3, 0x690($29)
/* 00362C 01DAF32C 03000630 */  andi        $6, $0, 0x3
/* 003630 01DAF330 FCFF0224 */  addiu       $2, $0, -0x4
/* 003634 01DAF334 24106200 */  and         $2, $3, $2
/* 003638 01DAF338 25104600 */  or          $2, $2, $6
/* 00363C 01DAF33C 9006A2A3 */  sb          $2, 0x690($29)
/* 003640 01DAF340 9006A593 */  lbu         $5, 0x690($29)
/* 003644 01DAF344 08000364 */  daddiu      $3, $0, 0x8
/* 003648 01DAF348 F3FF0224 */  addiu       $2, $0, -0xD
/* 00364C 01DAF34C 2410A200 */  and         $2, $5, $2
/* 003650 01DAF350 25104300 */  or          $2, $2, $3
/* 003654 01DAF354 9006A2A3 */  sb          $2, 0x690($29)
/* 003658 01DAF358 9006A593 */  lbu         $5, 0x690($29)
/* 00365C 01DAF35C 00190600 */  sll         $3, $6, 4
/* 003660 01DAF360 CFFF0224 */  addiu       $2, $0, -0x31
/* 003664 01DAF364 2410A200 */  and         $2, $5, $2
/* 003668 01DAF368 25104300 */  or          $2, $2, $3
/* 00366C 01DAF36C 9006A2A3 */  sb          $2, 0x690($29)
/* 003670 01DAF370 9006A593 */  lbu         $5, 0x690($29)
/* 003674 01DAF374 40000364 */  daddiu      $3, $0, 0x40
/* 003678 01DAF378 3FFF0224 */  addiu       $2, $0, -0xC1
/* 00367C 01DAF37C 2410A200 */  and         $2, $5, $2
/* 003680 01DAF380 25104300 */  or          $2, $2, $3
/* 003684 01DAF384 9006A2A3 */  sb          $2, 0x690($29)
/* 003688 01DAF388 E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 00368C 01DAF38C 00000000 */   nop
/* 003690 01DAF390 9806A427 */  addiu       $4, $29, 0x698
/* 003694 01DAF394 F08B82DF */  ld          $2, -0x7410($28)
/* 003698 01DAF398 000082FC */  sd          $2, 0x0($4)
/* 00369C 01DAF39C 9C06A593 */  lbu         $5, 0x69C($29)
/* 0036A0 01DAF3A0 01000364 */  daddiu      $3, $0, 0x1
/* 0036A4 01DAF3A4 FEFF0224 */  addiu       $2, $0, -0x2
/* 0036A8 01DAF3A8 2410A200 */  and         $2, $5, $2
/* 0036AC 01DAF3AC 25104300 */  or          $2, $2, $3
/* 0036B0 01DAF3B0 9C06A2A3 */  sb          $2, 0x69C($29)
/* 0036B4 01DAF3B4 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 0036B8 01DAF3B8 00000000 */   nop
/* 0036BC 01DAF3BC 28860070 */  paddub      $16, $0, $0
/* 0036C0 01DAF3C0 0A000010 */  b           .L01DAF3EC_2EA9EC
/* 0036C4 01DAF3C4 00000000 */   nop
.L01DAF3C8_2EA9C8:
/* 0036C8 01DAF3C8 40111000 */  sll         $2, $16, 5
/* 0036CC 01DAF3CC 23105000 */  subu        $2, $2, $16
/* 0036D0 01DAF3D0 80190200 */  sll         $3, $2, 6
/* 0036D4 01DAF3D4 E601023C */  lui         $2, %hi(CWeaponElFx)
/* 0036D8 01DAF3D8 80944224 */  addiu       $2, $2, %lo(CWeaponElFx)
/* 0036DC 01DAF3DC 21204300 */  addu        $4, $2, $3
/* 0036E0 01DAF3E0 7CDE060C */  jal         Draw__14CWeaponElementFv
/* 0036E4 01DAF3E4 00000000 */   nop
/* 0036E8 01DAF3E8 01001026 */  addiu       $16, $16, 0x1
.L01DAF3EC_2EA9EC:
/* 0036EC 01DAF3EC 0400022A */  slti        $2, $16, 0x4
/* 0036F0 01DAF3F0 F5FF4014 */  bnez        $2, .L01DAF3C8_2EA9C8
/* 0036F4 01DAF3F4 00000000 */   nop
/* 0036F8 01DAF3F8 EC01023C */  lui         $2, %hi(WeaponCrashEffect)
/* 0036FC 01DAF3FC E0DA4424 */  addiu       $4, $2, %lo(WeaponCrashEffect)
/* 003700 01DAF400 68CC060C */  jal         Draw__8CHitMarkFv
/* 003704 01DAF404 00000000 */   nop
/* 003708 01DAF408 28860070 */  paddub      $16, $0, $0
/* 00370C 01DAF40C 17000010 */  b           .L01DAF46C_2EAA6C
/* 003710 01DAF410 00000000 */   nop
.L01DAF414_2EAA14:
/* 003714 01DAF414 00111000 */  sll         $2, $16, 4
/* 003718 01DAF418 21185000 */  addu        $3, $2, $16
/* 00371C 01DAF41C 80100300 */  sll         $2, $3, 2
/* 003720 01DAF420 23104300 */  subu        $2, $2, $3
/* 003724 01DAF424 40190200 */  sll         $3, $2, 5
/* 003728 01DAF428 EC01023C */  lui         $2, %hi(HitMark)
/* 00372C 01DAF42C 40E14224 */  addiu       $2, $2, %lo(HitMark)
/* 003730 01DAF430 21204300 */  addu        $4, $2, $3
/* 003734 01DAF434 68CC060C */  jal         Draw__8CHitMarkFv
/* 003738 01DAF438 00000000 */   nop
/* 00373C 01DAF43C 40891000 */  sll         $17, $16, 5
/* 003740 01DAF440 EC01023C */  lui         $2, %hi(HitPointMark)
/* 003744 01DAF444 40474224 */  addiu       $2, $2, %lo(HitPointMark)
/* 003748 01DAF448 21205100 */  addu        $4, $2, $17
/* 00374C 01DAF44C 84CD060C */  jal         Draw__13CHitPointMarkFv
/* 003750 01DAF450 00000000 */   nop
/* 003754 01DAF454 EC01023C */  lui         $2, %hi(MyHitPointMark)
/* 003758 01DAF458 40494224 */  addiu       $2, $2, %lo(MyHitPointMark)
/* 00375C 01DAF45C 21205100 */  addu        $4, $2, $17
/* 003760 01DAF460 84CD060C */  jal         Draw__13CHitPointMarkFv
/* 003764 01DAF464 00000000 */   nop
/* 003768 01DAF468 01001026 */  addiu       $16, $16, 0x1
.L01DAF46C_2EAA6C:
/* 00376C 01DAF46C 1000022A */  slti        $2, $16, 0x10
/* 003770 01DAF470 E8FF4014 */  bnez        $2, .L01DAF414_2EAA14
/* 003774 01DAF474 00000000 */   nop
/* 003778 01DAF478 EC01023C */  lui         $2, %hi(HealEffect)
/* 00377C 01DAF47C 404B4424 */  addiu       $4, $2, %lo(HealEffect)
/* 003780 01DAF480 54CB060C */  jal         Draw__11CHealEffectFv
/* 003784 01DAF484 00000000 */   nop
/* 003788 01DAF488 E89C828F */  lw          $2, -0x6318($28)
/* 00378C 01DAF48C 0F004014 */  bnez        $2, .L01DAF4CC_2EAACC
/* 003790 01DAF490 00000000 */   nop
/* 003794 01DAF494 189E828F */  lw          $2, -0x61E8($28)
/* 003798 01DAF498 0C004014 */  bnez        $2, .L01DAF4CC_2EAACC
/* 00379C 01DAF49C 00000000 */   nop
/* 0037A0 01DAF4A0 E49D848F */  lw          $4, -0x621C($28)
/* 0037A4 01DAF4A4 10AF060C */  jal         draw__5CSHOTFv
/* 0037A8 01DAF4A8 00000000 */   nop
/* 0037AC 01DAF4AC F001023C */  lui         $2, %hi(OzumondShotEffect)
/* 0037B0 01DAF4B0 00C04424 */  addiu       $4, $2, %lo(OzumondShotEffect)
/* 0037B4 01DAF4B4 88BA060C */  jal         Draw__21CHIT_MACHINGUN_EFFECTFv
/* 0037B8 01DAF4B8 00000000 */   nop
/* 0037BC 01DAF4BC F001023C */  lui         $2, %hi(OzumondFire)
/* 0037C0 01DAF4C0 F0B24424 */  addiu       $4, $2, %lo(OzumondFire)
/* 0037C4 01DAF4C4 78BC060C */  jal         Draw__13CSHOT_FIREBARFv
/* 0037C8 01DAF4C8 00000000 */   nop
.L01DAF4CC_2EAACC:
/* 0037CC 01DAF4CC E601023C */  lui         $2, %hi(CWeaponFx)
/* 0037D0 01DAF4D0 408F4424 */  addiu       $4, $2, %lo(CWeaponFx)
/* 0037D4 01DAF4D4 505A070C */  jal         Draw__13CWeaponEffectFv
/* 0037D8 01DAF4D8 00000000 */   nop
/* 0037DC 01DAF4DC EB01023C */  lui         $2, %hi(CRunFx__2)
/* 0037E0 01DAF4E0 10634424 */  addiu       $4, $2, %lo(CRunFx__2)
/* 0037E4 01DAF4E4 608E050C */  jal         Step__10CRunEffectFv
/* 0037E8 01DAF4E8 00000000 */   nop
/* 0037EC 01DAF4EC EB01023C */  lui         $2, %hi(CRunFx__2)
/* 0037F0 01DAF4F0 10634424 */  addiu       $4, $2, %lo(CRunFx__2)
/* 0037F4 01DAF4F4 208D050C */  jal         Draw__10CRunEffectFv
/* 0037F8 01DAF4F8 00000000 */   nop
/* 0037FC 01DAF4FC 28260070 */  paddub      $4, $0, $0
/* 003800 01DAF500 E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 003804 01DAF504 00000000 */   nop
/* 003808 01DAF508 28260070 */  paddub      $4, $0, $0
/* 00380C 01DAF50C B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 003810 01DAF510 00000000 */   nop
.L01DAF514_2EAB14:
/* 003814 01DAF514 1C9D838F */  lw          $3, -0x62E4($28)
/* 003818 01DAF518 01000224 */  addiu       $2, $0, 0x1
/* 00381C 01DAF51C F9026214 */  bne         $3, $2, .L01DB0104_2EB704
/* 003820 01DAF520 00000000 */   nop
/* 003824 01DAF524 D501013C */  lui         $1, %hi(BtEventInfo + 0x8C)
/* 003828 01DAF528 CC67228C */  lw          $2, %lo(BtEventInfo + 0x8C)($1)
/* 00382C 01DAF52C F5024014 */  bnez        $2, .L01DB0104_2EB704
/* 003830 01DAF530 00000000 */   nop
/* 003834 01DAF534 C701023C */  lui         $2, %hi(TexManager)
/* 003838 01DAF538 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00383C 01DAF53C F001023C */  lui         $2, %hi(floor_name)
/* 003840 01DAF540 80684524 */  addiu       $5, $2, %lo(floor_name)
/* 003844 01DAF544 FFFF0624 */  addiu       $6, $0, -0x1
/* 003848 01DAF548 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00384C 01DAF54C 00000000 */   nop
/* 003850 01DAF550 1C9E82AF */  sw          $2, -0x61E4($28)
/* 003854 01DAF554 28860070 */  paddub      $16, $0, $0
/* 003858 01DAF558 288E0070 */  paddub      $17, $0, $0
/* 00385C 01DAF55C 789C828F */  lw          $2, -0x6388($28)
/* 003860 01DAF560 02004280 */  lb          $2, 0x2($2)
/* 003864 01DAF564 09004228 */  slti        $2, $2, 0x9
/* 003868 01DAF568 02004014 */  bnez        $2, .L01DAF574_2EAB74
/* 00386C 01DAF56C 00000000 */   nop
/* 003870 01DAF570 DCFF1124 */  addiu       $17, $0, -0x24
.L01DAF574_2EAB74:
/* 003874 01DAF574 C701023C */  lui         $2, %hi(TexManager)
/* 003878 01DAF578 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00387C 01DAF57C D48B858F */  lw          $5, -0x742C($28)
/* 003880 01DAF580 08000624 */  addiu       $6, $0, 0x8
/* 003884 01DAF584 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 003888 01DAF588 00000000 */   nop
/* 00388C 01DAF58C 9886828F */  lw          $2, -0x7968($28)
/* 003890 01DAF590 06014014 */  bnez        $2, .L01DAF9AC_2EAFAC
/* 003894 01DAF594 00000000 */   nop
/* 003898 01DAF598 A49D848F */  lw          $4, -0x625C($28)
/* 00389C 01DAF59C 0600812C */  sltiu       $1, $4, 0x6
/* 0038A0 01DAF5A0 CC002010 */  beqz        $1, .L01DAF8D4_2EAED4
/* 0038A4 01DAF5A4 00000000 */   nop
/* 0038A8 01DAF5A8 DC01023C */  lui         $2, %hi(LIT_1820)
/* 0038AC 01DAF5AC E02E4324 */  addiu       $3, $2, %lo(LIT_1820)
/* 0038B0 01DAF5B0 80100400 */  sll         $2, $4, 2
/* 0038B4 01DAF5B4 21104300 */  addu        $2, $2, $3
/* 0038B8 01DAF5B8 0000428C */  lw          $2, 0x0($2)
/* 0038BC 01DAF5BC 08004000 */  jr          $2
/* 0038C0 01DAF5C0 00000000 */   nop
jlabel .L01DAF5C4_2EABC4
.L01DAF5C4_2EABC4$b:
/* 0038C4 01DAF5C4 5002A0AF */  sw          $0, 0x250($29)
/* 0038C8 01DAF5C8 5402A0AF */  sw          $0, 0x254($29)
/* 0038CC 01DAF5CC 72000424 */  addiu       $4, $0, 0x72
/* 0038D0 01DAF5D0 5802A4AF */  sw          $4, 0x258($29)
/* 0038D4 01DAF5D4 32000324 */  addiu       $3, $0, 0x32
/* 0038D8 01DAF5D8 5C02A3AF */  sw          $3, 0x25C($29)
/* 0038DC 01DAF5DC E2002226 */  addiu       $2, $17, 0xE2
/* 0038E0 01DAF5E0 4002A2AF */  sw          $2, 0x240($29)
/* 0038E4 01DAF5E4 AA000224 */  addiu       $2, $0, 0xAA
/* 0038E8 01DAF5E8 4402A2AF */  sw          $2, 0x244($29)
/* 0038EC 01DAF5EC 4802A4AF */  sw          $4, 0x248($29)
/* 0038F0 01DAF5F0 4C02A3AF */  sw          $3, 0x24C($29)
/* 0038F4 01DAF5F4 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 0038F8 01DAF5F8 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 0038FC 01DAF5FC D48B848F */  lw          $4, -0x742C($28)
/* 003900 01DAF600 1C9E858F */  lw          $5, -0x61E4($28)
/* 003904 01DAF604 4002A627 */  addiu       $6, $29, 0x240
/* 003908 01DAF608 5002A727 */  addiu       $7, $29, 0x250
/* 00390C 01DAF60C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003910 01DAF610 00000000 */   nop
/* 003914 01DAF614 72000224 */  addiu       $2, $0, 0x72
/* 003918 01DAF618 7002A2AF */  sw          $2, 0x270($29)
/* 00391C 01DAF61C 7402A0AF */  sw          $0, 0x274($29)
/* 003920 01DAF620 4C000424 */  addiu       $4, $0, 0x4C
/* 003924 01DAF624 7802A4AF */  sw          $4, 0x278($29)
/* 003928 01DAF628 32000324 */  addiu       $3, $0, 0x32
/* 00392C 01DAF62C 7C02A3AF */  sw          $3, 0x27C($29)
/* 003930 01DAF630 7D010224 */  addiu       $2, $0, 0x17D
/* 003934 01DAF634 6002A2AF */  sw          $2, 0x260($29)
/* 003938 01DAF638 AA000224 */  addiu       $2, $0, 0xAA
/* 00393C 01DAF63C 6402A2AF */  sw          $2, 0x264($29)
/* 003940 01DAF640 6802A4AF */  sw          $4, 0x268($29)
/* 003944 01DAF644 6C02A3AF */  sw          $3, 0x26C($29)
/* 003948 01DAF648 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 00394C 01DAF64C B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003950 01DAF650 D48B848F */  lw          $4, -0x742C($28)
/* 003954 01DAF654 1C9E858F */  lw          $5, -0x61E4($28)
/* 003958 01DAF658 6002A627 */  addiu       $6, $29, 0x260
/* 00395C 01DAF65C 7002A727 */  addiu       $7, $29, 0x270
/* 003960 01DAF660 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003964 01DAF664 00000000 */   nop
/* 003968 01DAF668 9A000010 */  b           .L01DAF8D4_2EAED4
/* 00396C 01DAF66C 00000000 */   nop
jlabel .L01DAF670_2EAC70
.L01DAF670_2EAC70$b:
/* 003970 01DAF670 9002A0AF */  sw          $0, 0x290($29)
/* 003974 01DAF674 9402A0AF */  sw          $0, 0x294($29)
/* 003978 01DAF678 BE000424 */  addiu       $4, $0, 0xBE
/* 00397C 01DAF67C 9802A4AF */  sw          $4, 0x298($29)
/* 003980 01DAF680 32000324 */  addiu       $3, $0, 0x32
/* 003984 01DAF684 9C02A3AF */  sw          $3, 0x29C($29)
/* 003988 01DAF688 8002A4AF */  sw          $4, 0x280($29)
/* 00398C 01DAF68C AA000224 */  addiu       $2, $0, 0xAA
/* 003990 01DAF690 8402A2AF */  sw          $2, 0x284($29)
/* 003994 01DAF694 8802A4AF */  sw          $4, 0x288($29)
/* 003998 01DAF698 8C02A3AF */  sw          $3, 0x28C($29)
/* 00399C 01DAF69C EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 0039A0 01DAF6A0 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 0039A4 01DAF6A4 D48B848F */  lw          $4, -0x742C($28)
/* 0039A8 01DAF6A8 1C9E858F */  lw          $5, -0x61E4($28)
/* 0039AC 01DAF6AC 8002A627 */  addiu       $6, $29, 0x280
/* 0039B0 01DAF6B0 9002A727 */  addiu       $7, $29, 0x290
/* 0039B4 01DAF6B4 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0039B8 01DAF6B8 00000000 */   nop
/* 0039BC 01DAF6BC 40001024 */  addiu       $16, $0, 0x40
/* 0039C0 01DAF6C0 84000010 */  b           .L01DAF8D4_2EAED4
/* 0039C4 01DAF6C4 00000000 */   nop
jlabel .L01DAF6C8_2EACC8
.L01DAF6C8_2EACC8$b:
/* 0039C8 01DAF6C8 B002A0AF */  sw          $0, 0x2B0($29)
/* 0039CC 01DAF6CC B402A0AF */  sw          $0, 0x2B4($29)
/* 0039D0 01DAF6D0 4C000424 */  addiu       $4, $0, 0x4C
/* 0039D4 01DAF6D4 B802A4AF */  sw          $4, 0x2B8($29)
/* 0039D8 01DAF6D8 32000324 */  addiu       $3, $0, 0x32
/* 0039DC 01DAF6DC BC02A3AF */  sw          $3, 0x2BC($29)
/* 0039E0 01DAF6E0 F5002226 */  addiu       $2, $17, 0xF5
/* 0039E4 01DAF6E4 A002A2AF */  sw          $2, 0x2A0($29)
/* 0039E8 01DAF6E8 AA000224 */  addiu       $2, $0, 0xAA
/* 0039EC 01DAF6EC A402A2AF */  sw          $2, 0x2A4($29)
/* 0039F0 01DAF6F0 A802A4AF */  sw          $4, 0x2A8($29)
/* 0039F4 01DAF6F4 AC02A3AF */  sw          $3, 0x2AC($29)
/* 0039F8 01DAF6F8 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 0039FC 01DAF6FC B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003A00 01DAF700 D48B848F */  lw          $4, -0x742C($28)
/* 003A04 01DAF704 1C9E858F */  lw          $5, -0x61E4($28)
/* 003A08 01DAF708 A002A627 */  addiu       $6, $29, 0x2A0
/* 003A0C 01DAF70C B002A727 */  addiu       $7, $29, 0x2B0
/* 003A10 01DAF710 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003A14 01DAF714 00000000 */   nop
/* 003A18 01DAF718 4C000424 */  addiu       $4, $0, 0x4C
/* 003A1C 01DAF71C D002A4AF */  sw          $4, 0x2D0($29)
/* 003A20 01DAF720 D402A0AF */  sw          $0, 0x2D4($29)
/* 003A24 01DAF724 D802A4AF */  sw          $4, 0x2D8($29)
/* 003A28 01DAF728 32000324 */  addiu       $3, $0, 0x32
/* 003A2C 01DAF72C DC02A3AF */  sw          $3, 0x2DC($29)
/* 003A30 01DAF730 59010224 */  addiu       $2, $0, 0x159
/* 003A34 01DAF734 C002A2AF */  sw          $2, 0x2C0($29)
/* 003A38 01DAF738 AA000224 */  addiu       $2, $0, 0xAA
/* 003A3C 01DAF73C C402A2AF */  sw          $2, 0x2C4($29)
/* 003A40 01DAF740 C802A4AF */  sw          $4, 0x2C8($29)
/* 003A44 01DAF744 CC02A3AF */  sw          $3, 0x2CC($29)
/* 003A48 01DAF748 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003A4C 01DAF74C B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003A50 01DAF750 D48B848F */  lw          $4, -0x742C($28)
/* 003A54 01DAF754 1C9E858F */  lw          $5, -0x61E4($28)
/* 003A58 01DAF758 C002A627 */  addiu       $6, $29, 0x2C0
/* 003A5C 01DAF75C D002A727 */  addiu       $7, $29, 0x2D0
/* 003A60 01DAF760 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003A64 01DAF764 00000000 */   nop
/* 003A68 01DAF768 DCFF1024 */  addiu       $16, $0, -0x24
/* 003A6C 01DAF76C 59000010 */  b           .L01DAF8D4_2EAED4
/* 003A70 01DAF770 00000000 */   nop
jlabel .L01DAF774_2EAD74
.L01DAF774_2EAD74$b:
/* 003A74 01DAF774 F002A0AF */  sw          $0, 0x2F0($29)
/* 003A78 01DAF778 F402A0AF */  sw          $0, 0x2F4($29)
/* 003A7C 01DAF77C 98000424 */  addiu       $4, $0, 0x98
/* 003A80 01DAF780 F802A4AF */  sw          $4, 0x2F8($29)
/* 003A84 01DAF784 32000324 */  addiu       $3, $0, 0x32
/* 003A88 01DAF788 FC02A3AF */  sw          $3, 0x2FC($29)
/* 003A8C 01DAF78C E8000224 */  addiu       $2, $0, 0xE8
/* 003A90 01DAF790 E002A2AF */  sw          $2, 0x2E0($29)
/* 003A94 01DAF794 AA000224 */  addiu       $2, $0, 0xAA
/* 003A98 01DAF798 E402A2AF */  sw          $2, 0x2E4($29)
/* 003A9C 01DAF79C E802A4AF */  sw          $4, 0x2E8($29)
/* 003AA0 01DAF7A0 EC02A3AF */  sw          $3, 0x2EC($29)
/* 003AA4 01DAF7A4 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003AA8 01DAF7A8 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003AAC 01DAF7AC D48B848F */  lw          $4, -0x742C($28)
/* 003AB0 01DAF7B0 1C9E858F */  lw          $5, -0x61E4($28)
/* 003AB4 01DAF7B4 E002A627 */  addiu       $6, $29, 0x2E0
/* 003AB8 01DAF7B8 F002A727 */  addiu       $7, $29, 0x2F0
/* 003ABC 01DAF7BC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003AC0 01DAF7C0 00000000 */   nop
/* 003AC4 01DAF7C4 40001024 */  addiu       $16, $0, 0x40
/* 003AC8 01DAF7C8 42000010 */  b           .L01DAF8D4_2EAED4
/* 003ACC 01DAF7CC 00000000 */   nop
jlabel .L01DAF7D0_2EADD0
.L01DAF7D0_2EADD0$b:
/* 003AD0 01DAF7D0 1003A0AF */  sw          $0, 0x310($29)
/* 003AD4 01DAF7D4 1403A0AF */  sw          $0, 0x314($29)
/* 003AD8 01DAF7D8 4C000424 */  addiu       $4, $0, 0x4C
/* 003ADC 01DAF7DC 1803A4AF */  sw          $4, 0x318($29)
/* 003AE0 01DAF7E0 32000324 */  addiu       $3, $0, 0x32
/* 003AE4 01DAF7E4 1C03A3AF */  sw          $3, 0x31C($29)
/* 003AE8 01DAF7E8 D7002226 */  addiu       $2, $17, 0xD7
/* 003AEC 01DAF7EC 0003A2AF */  sw          $2, 0x300($29)
/* 003AF0 01DAF7F0 AA000224 */  addiu       $2, $0, 0xAA
/* 003AF4 01DAF7F4 0403A2AF */  sw          $2, 0x304($29)
/* 003AF8 01DAF7F8 0803A4AF */  sw          $4, 0x308($29)
/* 003AFC 01DAF7FC 0C03A3AF */  sw          $3, 0x30C($29)
/* 003B00 01DAF800 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003B04 01DAF804 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003B08 01DAF808 D48B848F */  lw          $4, -0x742C($28)
/* 003B0C 01DAF80C 1C9E858F */  lw          $5, -0x61E4($28)
/* 003B10 01DAF810 0003A627 */  addiu       $6, $29, 0x300
/* 003B14 01DAF814 1003A727 */  addiu       $7, $29, 0x310
/* 003B18 01DAF818 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003B1C 01DAF81C 00000000 */   nop
/* 003B20 01DAF820 4C000224 */  addiu       $2, $0, 0x4C
/* 003B24 01DAF824 3003A2AF */  sw          $2, 0x330($29)
/* 003B28 01DAF828 3403A0AF */  sw          $0, 0x334($29)
/* 003B2C 01DAF82C BE000424 */  addiu       $4, $0, 0xBE
/* 003B30 01DAF830 3803A4AF */  sw          $4, 0x338($29)
/* 003B34 01DAF834 32000324 */  addiu       $3, $0, 0x32
/* 003B38 01DAF838 3C03A3AF */  sw          $3, 0x33C($29)
/* 003B3C 01DAF83C 3B010224 */  addiu       $2, $0, 0x13B
/* 003B40 01DAF840 2003A2AF */  sw          $2, 0x320($29)
/* 003B44 01DAF844 AA000224 */  addiu       $2, $0, 0xAA
/* 003B48 01DAF848 2403A2AF */  sw          $2, 0x324($29)
/* 003B4C 01DAF84C 2803A4AF */  sw          $4, 0x328($29)
/* 003B50 01DAF850 2C03A3AF */  sw          $3, 0x32C($29)
/* 003B54 01DAF854 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003B58 01DAF858 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003B5C 01DAF85C D48B848F */  lw          $4, -0x742C($28)
/* 003B60 01DAF860 1C9E858F */  lw          $5, -0x61E4($28)
/* 003B64 01DAF864 2003A627 */  addiu       $6, $29, 0x320
/* 003B68 01DAF868 3003A727 */  addiu       $7, $29, 0x330
/* 003B6C 01DAF86C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003B70 01DAF870 00000000 */   nop
/* 003B74 01DAF874 C0FF1024 */  addiu       $16, $0, -0x40
/* 003B78 01DAF878 16000010 */  b           .L01DAF8D4_2EAED4
/* 003B7C 01DAF87C 00000000 */   nop
jlabel .L01DAF880_2EAE80
.L01DAF880_2EAE80$b:
/* 003B80 01DAF880 5003A0AF */  sw          $0, 0x350($29)
/* 003B84 01DAF884 5403A0AF */  sw          $0, 0x354($29)
/* 003B88 01DAF888 98000424 */  addiu       $4, $0, 0x98
/* 003B8C 01DAF88C 5803A4AF */  sw          $4, 0x358($29)
/* 003B90 01DAF890 32000324 */  addiu       $3, $0, 0x32
/* 003B94 01DAF894 5C03A3AF */  sw          $3, 0x35C($29)
/* 003B98 01DAF898 35010224 */  addiu       $2, $0, 0x135
/* 003B9C 01DAF89C 4003A2AF */  sw          $2, 0x340($29)
/* 003BA0 01DAF8A0 AA000224 */  addiu       $2, $0, 0xAA
/* 003BA4 01DAF8A4 4403A2AF */  sw          $2, 0x344($29)
/* 003BA8 01DAF8A8 4803A4AF */  sw          $4, 0x348($29)
/* 003BAC 01DAF8AC 4C03A3AF */  sw          $3, 0x34C($29)
/* 003BB0 01DAF8B0 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003BB4 01DAF8B4 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003BB8 01DAF8B8 D48B848F */  lw          $4, -0x742C($28)
/* 003BBC 01DAF8BC 1C9E858F */  lw          $5, -0x61E4($28)
/* 003BC0 01DAF8C0 4003A627 */  addiu       $6, $29, 0x340
/* 003BC4 01DAF8C4 5003A727 */  addiu       $7, $29, 0x350
/* 003BC8 01DAF8C8 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003BCC 01DAF8CC 00000000 */   nop
/* 003BD0 01DAF8D0 C0FF1024 */  addiu       $16, $0, -0x40
.L01DAF8D4_2EAED4:
/* 003BD4 01DAF8D4 C49C828F */  lw          $2, -0x633C($28)
/* 003BD8 01DAF8D8 19004010 */  beqz        $2, .L01DAF940_2EAF40
/* 003BDC 01DAF8DC 00000000 */   nop
/* 003BE0 01DAF8E0 3A010224 */  addiu       $2, $0, 0x13A
/* 003BE4 01DAF8E4 7003A2AF */  sw          $2, 0x370($29)
/* 003BE8 01DAF8E8 78000224 */  addiu       $2, $0, 0x78
/* 003BEC 01DAF8EC 7403A2AF */  sw          $2, 0x374($29)
/* 003BF0 01DAF8F0 40000424 */  addiu       $4, $0, 0x40
/* 003BF4 01DAF8F4 7803A4AF */  sw          $4, 0x378($29)
/* 003BF8 01DAF8F8 38000324 */  addiu       $3, $0, 0x38
/* 003BFC 01DAF8FC 7C03A3AF */  sw          $3, 0x37C($29)
/* 003C00 01DAF900 20010224 */  addiu       $2, $0, 0x120
/* 003C04 01DAF904 6003A2AF */  sw          $2, 0x360($29)
/* 003C08 01DAF908 E6000224 */  addiu       $2, $0, 0xE6
/* 003C0C 01DAF90C 6403A2AF */  sw          $2, 0x364($29)
/* 003C10 01DAF910 6803A4AF */  sw          $4, 0x368($29)
/* 003C14 01DAF914 6C03A3AF */  sw          $3, 0x36C($29)
/* 003C18 01DAF918 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003C1C 01DAF91C B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003C20 01DAF920 D48B848F */  lw          $4, -0x742C($28)
/* 003C24 01DAF924 1C9E858F */  lw          $5, -0x61E4($28)
/* 003C28 01DAF928 6003A627 */  addiu       $6, $29, 0x360
/* 003C2C 01DAF92C 7003A727 */  addiu       $7, $29, 0x370
/* 003C30 01DAF930 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003C34 01DAF934 00000000 */   nop
/* 003C38 01DAF938 1C000010 */  b           .L01DAF9AC_2EAFAC
/* 003C3C 01DAF93C 00000000 */   nop
.L01DAF940_2EAF40:
/* 003C40 01DAF940 789C828F */  lw          $2, -0x6388($28)
/* 003C44 01DAF944 0100013C */  lui         $1, (0x10000 >> 16)
/* 003C48 01DAF948 21084100 */  addu        $1, $2, $1
/* 003C4C 01DAF94C 108B228C */  lw          $2, -0x74F0($1)
/* 003C50 01DAF950 16004004 */  bltz        $2, .L01DAF9AC_2EAFAC
/* 003C54 01DAF954 00000000 */   nop
/* 003C58 01DAF958 9003A0AF */  sw          $0, 0x390($29)
/* 003C5C 01DAF95C 78000224 */  addiu       $2, $0, 0x78
/* 003C60 01DAF960 9403A2AF */  sw          $2, 0x394($29)
/* 003C64 01DAF964 D8000424 */  addiu       $4, $0, 0xD8
/* 003C68 01DAF968 9803A4AF */  sw          $4, 0x398($29)
/* 003C6C 01DAF96C 30000324 */  addiu       $3, $0, 0x30
/* 003C70 01DAF970 9C03A3AF */  sw          $3, 0x39C($29)
/* 003C74 01DAF974 D4000224 */  addiu       $2, $0, 0xD4
/* 003C78 01DAF978 8003A2AF */  sw          $2, 0x380($29)
/* 003C7C 01DAF97C E6000224 */  addiu       $2, $0, 0xE6
/* 003C80 01DAF980 8403A2AF */  sw          $2, 0x384($29)
/* 003C84 01DAF984 8803A4AF */  sw          $4, 0x388($29)
/* 003C88 01DAF988 8C03A3AF */  sw          $3, 0x38C($29)
/* 003C8C 01DAF98C EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003C90 01DAF990 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003C94 01DAF994 D48B848F */  lw          $4, -0x742C($28)
/* 003C98 01DAF998 1C9E858F */  lw          $5, -0x61E4($28)
/* 003C9C 01DAF99C 8003A627 */  addiu       $6, $29, 0x380
/* 003CA0 01DAF9A0 9003A727 */  addiu       $7, $29, 0x390
/* 003CA4 01DAF9A4 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003CA8 01DAF9A8 00000000 */   nop
.L01DAF9AC_2EAFAC:
/* 003CAC 01DAF9AC 9886828F */  lw          $2, -0x7968($28)
/* 003CB0 01DAF9B0 00014018 */  blez        $2, .L01DAFDB4_2EB3B4
/* 003CB4 01DAF9B4 00000000 */   nop
/* 003CB8 01DAF9B8 A49D848F */  lw          $4, -0x625C($28)
/* 003CBC 01DAF9BC 0700812C */  sltiu       $1, $4, 0x7
/* 003CC0 01DAF9C0 C7002010 */  beqz        $1, .L01DAFCE0_2EB2E0
/* 003CC4 01DAF9C4 00000000 */   nop
/* 003CC8 01DAF9C8 DC01023C */  lui         $2, %hi(LIT_1821__2)
/* 003CCC 01DAF9CC C02E4324 */  addiu       $3, $2, %lo(LIT_1821__2)
/* 003CD0 01DAF9D0 80100400 */  sll         $2, $4, 2
/* 003CD4 01DAF9D4 21104300 */  addu        $2, $2, $3
/* 003CD8 01DAF9D8 0000428C */  lw          $2, 0x0($2)
/* 003CDC 01DAF9DC 08004000 */  jr          $2
/* 003CE0 01DAF9E0 00000000 */   nop
jlabel .L01DAF9E4_2EAFE4
.L01DAF9E4_2EAFE4$b:
/* 003CE4 01DAF9E4 B003A0AF */  sw          $0, 0x3B0($29)
/* 003CE8 01DAF9E8 B403A0AF */  sw          $0, 0x3B4($29)
/* 003CEC 01DAF9EC 2D000424 */  addiu       $4, $0, 0x2D
/* 003CF0 01DAF9F0 B803A4AF */  sw          $4, 0x3B8($29)
/* 003CF4 01DAF9F4 32000324 */  addiu       $3, $0, 0x32
/* 003CF8 01DAF9F8 BC03A3AF */  sw          $3, 0x3BC($29)
/* 003CFC 01DAF9FC 22012226 */  addiu       $2, $17, 0x122
/* 003D00 01DAFA00 A003A2AF */  sw          $2, 0x3A0($29)
/* 003D04 01DAFA04 AA000224 */  addiu       $2, $0, 0xAA
/* 003D08 01DAFA08 A403A2AF */  sw          $2, 0x3A4($29)
/* 003D0C 01DAFA0C A803A4AF */  sw          $4, 0x3A8($29)
/* 003D10 01DAFA10 AC03A3AF */  sw          $3, 0x3AC($29)
/* 003D14 01DAFA14 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003D18 01DAFA18 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003D1C 01DAFA1C D48B848F */  lw          $4, -0x742C($28)
/* 003D20 01DAFA20 1C9E858F */  lw          $5, -0x61E4($28)
/* 003D24 01DAFA24 A003A627 */  addiu       $6, $29, 0x3A0
/* 003D28 01DAFA28 B003A727 */  addiu       $7, $29, 0x3B0
/* 003D2C 01DAFA2C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003D30 01DAFA30 00000000 */   nop
/* 003D34 01DAFA34 ECFF1024 */  addiu       $16, $0, -0x14
/* 003D38 01DAFA38 A9000010 */  b           .L01DAFCE0_2EB2E0
/* 003D3C 01DAFA3C 00000000 */   nop
jlabel .L01DAFA40_2EB040
.L01DAFA40_2EB040$b:
/* 003D40 01DAFA40 D003A0AF */  sw          $0, 0x3D0($29)
/* 003D44 01DAFA44 D403A0AF */  sw          $0, 0x3D4($29)
/* 003D48 01DAFA48 DA000424 */  addiu       $4, $0, 0xDA
/* 003D4C 01DAFA4C D803A4AF */  sw          $4, 0x3D8($29)
/* 003D50 01DAFA50 32000324 */  addiu       $3, $0, 0x32
/* 003D54 01DAFA54 DC03A3AF */  sw          $3, 0x3DC($29)
/* 003D58 01DAFA58 A0000224 */  addiu       $2, $0, 0xA0
/* 003D5C 01DAFA5C C003A2AF */  sw          $2, 0x3C0($29)
/* 003D60 01DAFA60 AA000224 */  addiu       $2, $0, 0xAA
/* 003D64 01DAFA64 C403A2AF */  sw          $2, 0x3C4($29)
/* 003D68 01DAFA68 C803A4AF */  sw          $4, 0x3C8($29)
/* 003D6C 01DAFA6C CC03A3AF */  sw          $3, 0x3CC($29)
/* 003D70 01DAFA70 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003D74 01DAFA74 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003D78 01DAFA78 D48B848F */  lw          $4, -0x742C($28)
/* 003D7C 01DAFA7C 1C9E858F */  lw          $5, -0x61E4($28)
/* 003D80 01DAFA80 C003A627 */  addiu       $6, $29, 0x3C0
/* 003D84 01DAFA84 D003A727 */  addiu       $7, $29, 0x3D0
/* 003D88 01DAFA88 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003D8C 01DAFA8C 00000000 */   nop
/* 003D90 01DAFA90 40001024 */  addiu       $16, $0, 0x40
/* 003D94 01DAFA94 789C828F */  lw          $2, -0x6388($28)
/* 003D98 01DAFA98 02004280 */  lb          $2, 0x2($2)
/* 003D9C 01DAFA9C 09004128 */  slti        $1, $2, 0x9
/* 003DA0 01DAFAA0 8F002010 */  beqz        $1, .L01DAFCE0_2EB2E0
/* 003DA4 01DAFAA4 00000000 */   nop
/* 003DA8 01DAFAA8 20001024 */  addiu       $16, $0, 0x20
/* 003DAC 01DAFAAC 8C000010 */  b           .L01DAFCE0_2EB2E0
/* 003DB0 01DAFAB0 00000000 */   nop
jlabel .L01DAFAB4_2EB0B4
.L01DAFAB4_2EB0B4$b:
/* 003DB4 01DAFAB4 F003A0AF */  sw          $0, 0x3F0($29)
/* 003DB8 01DAFAB8 F403A0AF */  sw          $0, 0x3F4($29)
/* 003DBC 01DAFABC 91000424 */  addiu       $4, $0, 0x91
/* 003DC0 01DAFAC0 F803A4AF */  sw          $4, 0x3F8($29)
/* 003DC4 01DAFAC4 32000324 */  addiu       $3, $0, 0x32
/* 003DC8 01DAFAC8 FC03A3AF */  sw          $3, 0x3FC($29)
/* 003DCC 01DAFACC C8000224 */  addiu       $2, $0, 0xC8
/* 003DD0 01DAFAD0 E003A2AF */  sw          $2, 0x3E0($29)
/* 003DD4 01DAFAD4 AA000224 */  addiu       $2, $0, 0xAA
/* 003DD8 01DAFAD8 E403A2AF */  sw          $2, 0x3E4($29)
/* 003DDC 01DAFADC E803A4AF */  sw          $4, 0x3E8($29)
/* 003DE0 01DAFAE0 EC03A3AF */  sw          $3, 0x3EC($29)
/* 003DE4 01DAFAE4 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003DE8 01DAFAE8 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003DEC 01DAFAEC D48B848F */  lw          $4, -0x742C($28)
/* 003DF0 01DAFAF0 1C9E858F */  lw          $5, -0x61E4($28)
/* 003DF4 01DAFAF4 E003A627 */  addiu       $6, $29, 0x3E0
/* 003DF8 01DAFAF8 F003A727 */  addiu       $7, $29, 0x3F0
/* 003DFC 01DAFAFC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003E00 01DAFB00 00000000 */   nop
/* 003E04 01DAFB04 789C828F */  lw          $2, -0x6388($28)
/* 003E08 01DAFB08 02004280 */  lb          $2, 0x2($2)
/* 003E0C 01DAFB0C 09004228 */  slti        $2, $2, 0x9
/* 003E10 01DAFB10 73004014 */  bnez        $2, .L01DAFCE0_2EB2E0
/* 003E14 01DAFB14 00000000 */   nop
/* 003E18 01DAFB18 20001024 */  addiu       $16, $0, 0x20
/* 003E1C 01DAFB1C 70000010 */  b           .L01DAFCE0_2EB2E0
/* 003E20 01DAFB20 00000000 */   nop
jlabel .L01DAFB24_2EB124
.L01DAFB24_2EB124$b:
/* 003E24 01DAFB24 1004A0AF */  sw          $0, 0x410($29)
/* 003E28 01DAFB28 1404A0AF */  sw          $0, 0x414($29)
/* 003E2C 01DAFB2C 8E000424 */  addiu       $4, $0, 0x8E
/* 003E30 01DAFB30 1804A4AF */  sw          $4, 0x418($29)
/* 003E34 01DAFB34 32000324 */  addiu       $3, $0, 0x32
/* 003E38 01DAFB38 1C04A3AF */  sw          $3, 0x41C($29)
/* 003E3C 01DAFB3C DC002226 */  addiu       $2, $17, 0xDC
/* 003E40 01DAFB40 0004A2AF */  sw          $2, 0x400($29)
/* 003E44 01DAFB44 AA000224 */  addiu       $2, $0, 0xAA
/* 003E48 01DAFB48 0404A2AF */  sw          $2, 0x404($29)
/* 003E4C 01DAFB4C 0804A4AF */  sw          $4, 0x408($29)
/* 003E50 01DAFB50 0C04A3AF */  sw          $3, 0x40C($29)
/* 003E54 01DAFB54 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003E58 01DAFB58 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003E5C 01DAFB5C D48B848F */  lw          $4, -0x742C($28)
/* 003E60 01DAFB60 1C9E858F */  lw          $5, -0x61E4($28)
/* 003E64 01DAFB64 0004A627 */  addiu       $6, $29, 0x400
/* 003E68 01DAFB68 1004A727 */  addiu       $7, $29, 0x410
/* 003E6C 01DAFB6C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003E70 01DAFB70 00000000 */   nop
/* 003E74 01DAFB74 10001024 */  addiu       $16, $0, 0x10
/* 003E78 01DAFB78 59000010 */  b           .L01DAFCE0_2EB2E0
/* 003E7C 01DAFB7C 00000000 */   nop
jlabel .L01DAFB80_2EB180
.L01DAFB80_2EB180$b:
/* 003E80 01DAFB80 3004A0AF */  sw          $0, 0x430($29)
/* 003E84 01DAFB84 3404A0AF */  sw          $0, 0x434($29)
/* 003E88 01DAFB88 4B000424 */  addiu       $4, $0, 0x4B
/* 003E8C 01DAFB8C 3804A4AF */  sw          $4, 0x438($29)
/* 003E90 01DAFB90 32000324 */  addiu       $3, $0, 0x32
/* 003E94 01DAFB94 3C04A3AF */  sw          $3, 0x43C($29)
/* 003E98 01DAFB98 C3002226 */  addiu       $2, $17, 0xC3
/* 003E9C 01DAFB9C 2004A2AF */  sw          $2, 0x420($29)
/* 003EA0 01DAFBA0 AA000224 */  addiu       $2, $0, 0xAA
/* 003EA4 01DAFBA4 2404A2AF */  sw          $2, 0x424($29)
/* 003EA8 01DAFBA8 2804A4AF */  sw          $4, 0x428($29)
/* 003EAC 01DAFBAC 2C04A3AF */  sw          $3, 0x42C($29)
/* 003EB0 01DAFBB0 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003EB4 01DAFBB4 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003EB8 01DAFBB8 D48B848F */  lw          $4, -0x742C($28)
/* 003EBC 01DAFBBC 1C9E858F */  lw          $5, -0x61E4($28)
/* 003EC0 01DAFBC0 2004A627 */  addiu       $6, $29, 0x420
/* 003EC4 01DAFBC4 3004A727 */  addiu       $7, $29, 0x430
/* 003EC8 01DAFBC8 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003ECC 01DAFBCC 00000000 */   nop
/* 003ED0 01DAFBD0 60000224 */  addiu       $2, $0, 0x60
/* 003ED4 01DAFBD4 5004A2AF */  sw          $2, 0x450($29)
/* 003ED8 01DAFBD8 5404A0AF */  sw          $0, 0x454($29)
/* 003EDC 01DAFBDC C0000424 */  addiu       $4, $0, 0xC0
/* 003EE0 01DAFBE0 5804A4AF */  sw          $4, 0x458($29)
/* 003EE4 01DAFBE4 32000324 */  addiu       $3, $0, 0x32
/* 003EE8 01DAFBE8 5C04A3AF */  sw          $3, 0x45C($29)
/* 003EEC 01DAFBEC 3B010224 */  addiu       $2, $0, 0x13B
/* 003EF0 01DAFBF0 4004A2AF */  sw          $2, 0x440($29)
/* 003EF4 01DAFBF4 AA000224 */  addiu       $2, $0, 0xAA
/* 003EF8 01DAFBF8 4404A2AF */  sw          $2, 0x444($29)
/* 003EFC 01DAFBFC 4804A4AF */  sw          $4, 0x448($29)
/* 003F00 01DAFC00 4C04A3AF */  sw          $3, 0x44C($29)
/* 003F04 01DAFC04 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003F08 01DAFC08 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003F0C 01DAFC0C D48B848F */  lw          $4, -0x742C($28)
/* 003F10 01DAFC10 1C9E858F */  lw          $5, -0x61E4($28)
/* 003F14 01DAFC14 4004A627 */  addiu       $6, $29, 0x440
/* 003F18 01DAFC18 5004A727 */  addiu       $7, $29, 0x450
/* 003F1C 01DAFC1C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003F20 01DAFC20 00000000 */   nop
/* 003F24 01DAFC24 C0FF1024 */  addiu       $16, $0, -0x40
/* 003F28 01DAFC28 2D000010 */  b           .L01DAFCE0_2EB2E0
/* 003F2C 01DAFC2C 00000000 */   nop
jlabel .L01DAFC30_2EB230
.L01DAFC30_2EB230$b:
/* 003F30 01DAFC30 7004A0AF */  sw          $0, 0x470($29)
/* 003F34 01DAFC34 7404A0AF */  sw          $0, 0x474($29)
/* 003F38 01DAFC38 E1000424 */  addiu       $4, $0, 0xE1
/* 003F3C 01DAFC3C 7804A4AF */  sw          $4, 0x478($29)
/* 003F40 01DAFC40 32000324 */  addiu       $3, $0, 0x32
/* 003F44 01DAFC44 7C04A3AF */  sw          $3, 0x47C($29)
/* 003F48 01DAFC48 08010224 */  addiu       $2, $0, 0x108
/* 003F4C 01DAFC4C 6004A2AF */  sw          $2, 0x460($29)
/* 003F50 01DAFC50 AA000224 */  addiu       $2, $0, 0xAA
/* 003F54 01DAFC54 6404A2AF */  sw          $2, 0x464($29)
/* 003F58 01DAFC58 6804A4AF */  sw          $4, 0x468($29)
/* 003F5C 01DAFC5C 6C04A3AF */  sw          $3, 0x46C($29)
/* 003F60 01DAFC60 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003F64 01DAFC64 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003F68 01DAFC68 D48B848F */  lw          $4, -0x742C($28)
/* 003F6C 01DAFC6C 1C9E858F */  lw          $5, -0x61E4($28)
/* 003F70 01DAFC70 6004A627 */  addiu       $6, $29, 0x460
/* 003F74 01DAFC74 7004A727 */  addiu       $7, $29, 0x470
/* 003F78 01DAFC78 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003F7C 01DAFC7C 00000000 */   nop
/* 003F80 01DAFC80 80FF1024 */  addiu       $16, $0, -0x80
/* 003F84 01DAFC84 16000010 */  b           .L01DAFCE0_2EB2E0
/* 003F88 01DAFC88 00000000 */   nop
jlabel .L01DAFC8C_2EB28C
.L01DAFC8C_2EB28C$b:
/* 003F8C 01DAFC8C 9004A0AF */  sw          $0, 0x490($29)
/* 003F90 01DAFC90 9404A0AF */  sw          $0, 0x494($29)
/* 003F94 01DAFC94 8E000424 */  addiu       $4, $0, 0x8E
/* 003F98 01DAFC98 9804A4AF */  sw          $4, 0x498($29)
/* 003F9C 01DAFC9C 32000324 */  addiu       $3, $0, 0x32
/* 003FA0 01DAFCA0 9C04A3AF */  sw          $3, 0x49C($29)
/* 003FA4 01DAFCA4 DC002226 */  addiu       $2, $17, 0xDC
/* 003FA8 01DAFCA8 8004A2AF */  sw          $2, 0x480($29)
/* 003FAC 01DAFCAC AA000224 */  addiu       $2, $0, 0xAA
/* 003FB0 01DAFCB0 8404A2AF */  sw          $2, 0x484($29)
/* 003FB4 01DAFCB4 8804A4AF */  sw          $4, 0x488($29)
/* 003FB8 01DAFCB8 8C04A3AF */  sw          $3, 0x48C($29)
/* 003FBC 01DAFCBC EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 003FC0 01DAFCC0 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 003FC4 01DAFCC4 D48B848F */  lw          $4, -0x742C($28)
/* 003FC8 01DAFCC8 1C9E858F */  lw          $5, -0x61E4($28)
/* 003FCC 01DAFCCC 8004A627 */  addiu       $6, $29, 0x480
/* 003FD0 01DAFCD0 9004A727 */  addiu       $7, $29, 0x490
/* 003FD4 01DAFCD4 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 003FD8 01DAFCD8 00000000 */   nop
/* 003FDC 01DAFCDC 10001024 */  addiu       $16, $0, 0x10
.L01DAFCE0_2EB2E0:
/* 003FE0 01DAFCE0 C49C828F */  lw          $2, -0x633C($28)
/* 003FE4 01DAFCE4 18004010 */  beqz        $2, .L01DAFD48_2EB348
/* 003FE8 01DAFCE8 00000000 */   nop
/* 003FEC 01DAFCEC 10010524 */  addiu       $5, $0, 0x110
/* 003FF0 01DAFCF0 B004A5AF */  sw          $5, 0x4B0($29)
/* 003FF4 01DAFCF4 78000224 */  addiu       $2, $0, 0x78
/* 003FF8 01DAFCF8 B404A2AF */  sw          $2, 0x4B4($29)
/* 003FFC 01DAFCFC 60000424 */  addiu       $4, $0, 0x60
/* 004000 01DAFD00 B804A4AF */  sw          $4, 0x4B8($29)
/* 004004 01DAFD04 38000324 */  addiu       $3, $0, 0x38
/* 004008 01DAFD08 BC04A3AF */  sw          $3, 0x4BC($29)
/* 00400C 01DAFD0C A004A5AF */  sw          $5, 0x4A0($29)
/* 004010 01DAFD10 E6000224 */  addiu       $2, $0, 0xE6
/* 004014 01DAFD14 A404A2AF */  sw          $2, 0x4A4($29)
/* 004018 01DAFD18 A804A4AF */  sw          $4, 0x4A8($29)
/* 00401C 01DAFD1C AC04A3AF */  sw          $3, 0x4AC($29)
/* 004020 01DAFD20 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 004024 01DAFD24 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 004028 01DAFD28 D48B848F */  lw          $4, -0x742C($28)
/* 00402C 01DAFD2C 1C9E858F */  lw          $5, -0x61E4($28)
/* 004030 01DAFD30 A004A627 */  addiu       $6, $29, 0x4A0
/* 004034 01DAFD34 B004A727 */  addiu       $7, $29, 0x4B0
/* 004038 01DAFD38 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 00403C 01DAFD3C 00000000 */   nop
/* 004040 01DAFD40 1C000010 */  b           .L01DAFDB4_2EB3B4
/* 004044 01DAFD44 00000000 */   nop
.L01DAFD48_2EB348:
/* 004048 01DAFD48 789C828F */  lw          $2, -0x6388($28)
/* 00404C 01DAFD4C 0100013C */  lui         $1, (0x10000 >> 16)
/* 004050 01DAFD50 21084100 */  addu        $1, $2, $1
/* 004054 01DAFD54 108B228C */  lw          $2, -0x74F0($1)
/* 004058 01DAFD58 16004004 */  bltz        $2, .L01DAFDB4_2EB3B4
/* 00405C 01DAFD5C 00000000 */   nop
/* 004060 01DAFD60 D004A0AF */  sw          $0, 0x4D0($29)
/* 004064 01DAFD64 78000224 */  addiu       $2, $0, 0x78
/* 004068 01DAFD68 D404A2AF */  sw          $2, 0x4D4($29)
/* 00406C 01DAFD6C F0000424 */  addiu       $4, $0, 0xF0
/* 004070 01DAFD70 D804A4AF */  sw          $4, 0x4D8($29)
/* 004074 01DAFD74 30000324 */  addiu       $3, $0, 0x30
/* 004078 01DAFD78 DC04A3AF */  sw          $3, 0x4DC($29)
/* 00407C 01DAFD7C D4000224 */  addiu       $2, $0, 0xD4
/* 004080 01DAFD80 C004A2AF */  sw          $2, 0x4C0($29)
/* 004084 01DAFD84 E6000224 */  addiu       $2, $0, 0xE6
/* 004088 01DAFD88 C404A2AF */  sw          $2, 0x4C4($29)
/* 00408C 01DAFD8C C804A4AF */  sw          $4, 0x4C8($29)
/* 004090 01DAFD90 CC04A3AF */  sw          $3, 0x4CC($29)
/* 004094 01DAFD94 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 004098 01DAFD98 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 00409C 01DAFD9C D48B848F */  lw          $4, -0x742C($28)
/* 0040A0 01DAFDA0 1C9E858F */  lw          $5, -0x61E4($28)
/* 0040A4 01DAFDA4 C004A627 */  addiu       $6, $29, 0x4C0
/* 0040A8 01DAFDA8 D004A727 */  addiu       $7, $29, 0x4D0
/* 0040AC 01DAFDAC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0040B0 01DAFDB0 00000000 */   nop
.L01DAFDB4_2EB3B4:
/* 0040B4 01DAFDB4 789C828F */  lw          $2, -0x6388($28)
/* 0040B8 01DAFDB8 02004280 */  lb          $2, 0x2($2)
/* 0040BC 01DAFDBC 01005124 */  addiu       $17, $2, 0x1
/* 0040C0 01DAFDC0 A49D838F */  lw          $3, -0x625C($28)
/* 0040C4 01DAFDC4 05000224 */  addiu       $2, $0, 0x5
/* 0040C8 01DAFDC8 05006214 */  bne         $3, $2, .L01DAFDE0_2EB3E0
/* 0040CC 01DAFDCC 00000000 */   nop
/* 0040D0 01DAFDD0 FFFF2426 */  addiu       $4, $17, -0x1
/* 0040D4 01DAFDD4 F0DD060C */  jal         BtGetFloorLevel__Fi
/* 0040D8 01DAFDD8 00000000 */   nop
/* 0040DC 01DAFDDC 288E4070 */  paddub      $17, $2, $0
.L01DAFDE0_2EB3E0:
/* 0040E0 01DAFDE0 0A00212A */  slti        $1, $17, 0xA
/* 0040E4 01DAFDE4 1F002010 */  beqz        $1, .L01DAFE64_2EB464
/* 0040E8 01DAFDE8 00000000 */   nop
/* 0040EC 01DAFDEC 0A000224 */  addiu       $2, $0, 0xA
/* 0040F0 01DAFDF0 1A002202 */  div         $0, $17, $2
/* 0040F4 01DAFDF4 00000000 */  nop
/* 0040F8 01DAFDF8 00000000 */  nop
/* 0040FC 01DAFDFC 10180000 */  mfhi        $3
/* 004100 01DAFE00 C0100300 */  sll         $2, $3, 3
/* 004104 01DAFE04 21104300 */  addu        $2, $2, $3
/* 004108 01DAFE08 40100200 */  sll         $2, $2, 1
/* 00410C 01DAFE0C 21104300 */  addu        $2, $2, $3
/* 004110 01DAFE10 40200200 */  sll         $4, $2, 1
/* 004114 01DAFE14 F004A4AF */  sw          $4, 0x4F0($29)
/* 004118 01DAFE18 32000424 */  addiu       $4, $0, 0x32
/* 00411C 01DAFE1C F404A4AF */  sw          $4, 0x4F4($29)
/* 004120 01DAFE20 26000324 */  addiu       $3, $0, 0x26
/* 004124 01DAFE24 F804A3AF */  sw          $3, 0x4F8($29)
/* 004128 01DAFE28 FC04A4AF */  sw          $4, 0x4FC($29)
/* 00412C 01DAFE2C 5A010226 */  addiu       $2, $16, 0x15A
/* 004130 01DAFE30 E004A2AF */  sw          $2, 0x4E0($29)
/* 004134 01DAFE34 AA000224 */  addiu       $2, $0, 0xAA
/* 004138 01DAFE38 E404A2AF */  sw          $2, 0x4E4($29)
/* 00413C 01DAFE3C E804A3AF */  sw          $3, 0x4E8($29)
/* 004140 01DAFE40 EC04A4AF */  sw          $4, 0x4EC($29)
/* 004144 01DAFE44 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 004148 01DAFE48 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 00414C 01DAFE4C D48B848F */  lw          $4, -0x742C($28)
/* 004150 01DAFE50 1C9E858F */  lw          $5, -0x61E4($28)
/* 004154 01DAFE54 E004A627 */  addiu       $6, $29, 0x4E0
/* 004158 01DAFE58 F004A727 */  addiu       $7, $29, 0x4F0
/* 00415C 01DAFE5C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 004160 01DAFE60 00000000 */   nop
.L01DAFE64_2EB464:
/* 004164 01DAFE64 0A00222A */  slti        $2, $17, 0xA
/* 004168 01DAFE68 41004014 */  bnez        $2, .L01DAFF70_2EB570
/* 00416C 01DAFE6C 00000000 */   nop
/* 004170 01DAFE70 6400212A */  slti        $1, $17, 0x64
/* 004174 01DAFE74 3E002010 */  beqz        $1, .L01DAFF70_2EB570
/* 004178 01DAFE78 00000000 */   nop
/* 00417C 01DAFE7C 0A000224 */  addiu       $2, $0, 0xA
/* 004180 01DAFE80 1A002202 */  div         $0, $17, $2
/* 004184 01DAFE84 02004014 */  bnez        $2, .L01DAFE90_2EB490
/* 004188 01DAFE88 00000000 */   nop
/* 00418C 01DAFE8C CD010000 */  break       0, 7
.L01DAFE90_2EB490:
/* 004190 01DAFE90 12180000 */  mflo        $3
/* 004194 01DAFE94 C0100300 */  sll         $2, $3, 3
/* 004198 01DAFE98 21104300 */  addu        $2, $2, $3
/* 00419C 01DAFE9C 40100200 */  sll         $2, $2, 1
/* 0041A0 01DAFEA0 21104300 */  addu        $2, $2, $3
/* 0041A4 01DAFEA4 40200200 */  sll         $4, $2, 1
/* 0041A8 01DAFEA8 1005A4AF */  sw          $4, 0x510($29)
/* 0041AC 01DAFEAC 32000424 */  addiu       $4, $0, 0x32
/* 0041B0 01DAFEB0 1405A4AF */  sw          $4, 0x514($29)
/* 0041B4 01DAFEB4 26000324 */  addiu       $3, $0, 0x26
/* 0041B8 01DAFEB8 1805A3AF */  sw          $3, 0x518($29)
/* 0041BC 01DAFEBC 1C05A4AF */  sw          $4, 0x51C($29)
/* 0041C0 01DAFEC0 36010226 */  addiu       $2, $16, 0x136
/* 0041C4 01DAFEC4 0005A2AF */  sw          $2, 0x500($29)
/* 0041C8 01DAFEC8 AA000224 */  addiu       $2, $0, 0xAA
/* 0041CC 01DAFECC 0405A2AF */  sw          $2, 0x504($29)
/* 0041D0 01DAFED0 0805A3AF */  sw          $3, 0x508($29)
/* 0041D4 01DAFED4 0C05A4AF */  sw          $4, 0x50C($29)
/* 0041D8 01DAFED8 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 0041DC 01DAFEDC B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 0041E0 01DAFEE0 D48B848F */  lw          $4, -0x742C($28)
/* 0041E4 01DAFEE4 1C9E858F */  lw          $5, -0x61E4($28)
/* 0041E8 01DAFEE8 0005A627 */  addiu       $6, $29, 0x500
/* 0041EC 01DAFEEC 1005A727 */  addiu       $7, $29, 0x510
/* 0041F0 01DAFEF0 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0041F4 01DAFEF4 00000000 */   nop
/* 0041F8 01DAFEF8 0A000224 */  addiu       $2, $0, 0xA
/* 0041FC 01DAFEFC 1A002202 */  div         $0, $17, $2
/* 004200 01DAFF00 00000000 */  nop
/* 004204 01DAFF04 00000000 */  nop
/* 004208 01DAFF08 10180000 */  mfhi        $3
/* 00420C 01DAFF0C C0100300 */  sll         $2, $3, 3
/* 004210 01DAFF10 21104300 */  addu        $2, $2, $3
/* 004214 01DAFF14 40100200 */  sll         $2, $2, 1
/* 004218 01DAFF18 21104300 */  addu        $2, $2, $3
/* 00421C 01DAFF1C 40200200 */  sll         $4, $2, 1
/* 004220 01DAFF20 3005A4AF */  sw          $4, 0x530($29)
/* 004224 01DAFF24 32000424 */  addiu       $4, $0, 0x32
/* 004228 01DAFF28 3405A4AF */  sw          $4, 0x534($29)
/* 00422C 01DAFF2C 26000324 */  addiu       $3, $0, 0x26
/* 004230 01DAFF30 3805A3AF */  sw          $3, 0x538($29)
/* 004234 01DAFF34 3C05A4AF */  sw          $4, 0x53C($29)
/* 004238 01DAFF38 5A010226 */  addiu       $2, $16, 0x15A
/* 00423C 01DAFF3C 2005A2AF */  sw          $2, 0x520($29)
/* 004240 01DAFF40 AA000224 */  addiu       $2, $0, 0xAA
/* 004244 01DAFF44 2405A2AF */  sw          $2, 0x524($29)
/* 004248 01DAFF48 2805A3AF */  sw          $3, 0x528($29)
/* 00424C 01DAFF4C 2C05A4AF */  sw          $4, 0x52C($29)
/* 004250 01DAFF50 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 004254 01DAFF54 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 004258 01DAFF58 D48B848F */  lw          $4, -0x742C($28)
/* 00425C 01DAFF5C 1C9E858F */  lw          $5, -0x61E4($28)
/* 004260 01DAFF60 2005A627 */  addiu       $6, $29, 0x520
/* 004264 01DAFF64 3005A727 */  addiu       $7, $29, 0x530
/* 004268 01DAFF68 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 00426C 01DAFF6C 00000000 */   nop
.L01DAFF70_2EB570:
/* 004270 01DAFF70 6400222A */  slti        $2, $17, 0x64
/* 004274 01DAFF74 63004014 */  bnez        $2, .L01DB0104_2EB704
/* 004278 01DAFF78 00000000 */   nop
/* 00427C 01DAFF7C 64000224 */  addiu       $2, $0, 0x64
/* 004280 01DAFF80 1A002202 */  div         $0, $17, $2
/* 004284 01DAFF84 02004014 */  bnez        $2, .L01DAFF90_2EB590
/* 004288 01DAFF88 00000000 */   nop
/* 00428C 01DAFF8C CD010000 */  break       0, 7
.L01DAFF90_2EB590:
/* 004290 01DAFF90 12180000 */  mflo        $3
/* 004294 01DAFF94 C0100300 */  sll         $2, $3, 3
/* 004298 01DAFF98 21104300 */  addu        $2, $2, $3
/* 00429C 01DAFF9C 40100200 */  sll         $2, $2, 1
/* 0042A0 01DAFFA0 21104300 */  addu        $2, $2, $3
/* 0042A4 01DAFFA4 40200200 */  sll         $4, $2, 1
/* 0042A8 01DAFFA8 80100300 */  sll         $2, $3, 2
/* 0042AC 01DAFFAC 21184300 */  addu        $3, $2, $3
/* 0042B0 01DAFFB0 80100300 */  sll         $2, $3, 2
/* 0042B4 01DAFFB4 21106200 */  addu        $2, $3, $2
/* 0042B8 01DAFFB8 80100200 */  sll         $2, $2, 2
/* 0042BC 01DAFFBC 23882202 */  subu        $17, $17, $2
/* 0042C0 01DAFFC0 5005A4AF */  sw          $4, 0x550($29)
/* 0042C4 01DAFFC4 32000424 */  addiu       $4, $0, 0x32
/* 0042C8 01DAFFC8 5405A4AF */  sw          $4, 0x554($29)
/* 0042CC 01DAFFCC 26000324 */  addiu       $3, $0, 0x26
/* 0042D0 01DAFFD0 5805A3AF */  sw          $3, 0x558($29)
/* 0042D4 01DAFFD4 5C05A4AF */  sw          $4, 0x55C($29)
/* 0042D8 01DAFFD8 12010226 */  addiu       $2, $16, 0x112
/* 0042DC 01DAFFDC 4005A2AF */  sw          $2, 0x540($29)
/* 0042E0 01DAFFE0 AA000224 */  addiu       $2, $0, 0xAA
/* 0042E4 01DAFFE4 4405A2AF */  sw          $2, 0x544($29)
/* 0042E8 01DAFFE8 4805A3AF */  sw          $3, 0x548($29)
/* 0042EC 01DAFFEC 4C05A4AF */  sw          $4, 0x54C($29)
/* 0042F0 01DAFFF0 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 0042F4 01DAFFF4 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 0042F8 01DAFFF8 D48B848F */  lw          $4, -0x742C($28)
/* 0042FC 01DAFFFC 1C9E858F */  lw          $5, -0x61E4($28)
/* 004300 01DB0000 4005A627 */  addiu       $6, $29, 0x540
/* 004304 01DB0004 5005A727 */  addiu       $7, $29, 0x550
/* 004308 01DB0008 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 00430C 01DB000C 00000000 */   nop
/* 004310 01DB0010 0A000224 */  addiu       $2, $0, 0xA
/* 004314 01DB0014 1A002202 */  div         $0, $17, $2
/* 004318 01DB0018 02004014 */  bnez        $2, .L01DB0024_2EB624
/* 00431C 01DB001C 00000000 */   nop
/* 004320 01DB0020 CD010000 */  break       0, 7
.L01DB0024_2EB624:
/* 004324 01DB0024 12180000 */  mflo        $3
/* 004328 01DB0028 C0100300 */  sll         $2, $3, 3
/* 00432C 01DB002C 21104300 */  addu        $2, $2, $3
/* 004330 01DB0030 40100200 */  sll         $2, $2, 1
/* 004334 01DB0034 21104300 */  addu        $2, $2, $3
/* 004338 01DB0038 40200200 */  sll         $4, $2, 1
/* 00433C 01DB003C 7005A4AF */  sw          $4, 0x570($29)
/* 004340 01DB0040 32000424 */  addiu       $4, $0, 0x32
/* 004344 01DB0044 7405A4AF */  sw          $4, 0x574($29)
/* 004348 01DB0048 26000324 */  addiu       $3, $0, 0x26
/* 00434C 01DB004C 7805A3AF */  sw          $3, 0x578($29)
/* 004350 01DB0050 7C05A4AF */  sw          $4, 0x57C($29)
/* 004354 01DB0054 36010226 */  addiu       $2, $16, 0x136
/* 004358 01DB0058 6005A2AF */  sw          $2, 0x560($29)
/* 00435C 01DB005C AA000224 */  addiu       $2, $0, 0xAA
/* 004360 01DB0060 6405A2AF */  sw          $2, 0x564($29)
/* 004364 01DB0064 6805A3AF */  sw          $3, 0x568($29)
/* 004368 01DB0068 6C05A4AF */  sw          $4, 0x56C($29)
/* 00436C 01DB006C EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 004370 01DB0070 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 004374 01DB0074 D48B848F */  lw          $4, -0x742C($28)
/* 004378 01DB0078 1C9E858F */  lw          $5, -0x61E4($28)
/* 00437C 01DB007C 6005A627 */  addiu       $6, $29, 0x560
/* 004380 01DB0080 7005A727 */  addiu       $7, $29, 0x570
/* 004384 01DB0084 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 004388 01DB0088 00000000 */   nop
/* 00438C 01DB008C 0A000224 */  addiu       $2, $0, 0xA
/* 004390 01DB0090 1A002202 */  div         $0, $17, $2
/* 004394 01DB0094 00000000 */  nop
/* 004398 01DB0098 00000000 */  nop
/* 00439C 01DB009C 10180000 */  mfhi        $3
/* 0043A0 01DB00A0 C0100300 */  sll         $2, $3, 3
/* 0043A4 01DB00A4 21104300 */  addu        $2, $2, $3
/* 0043A8 01DB00A8 40100200 */  sll         $2, $2, 1
/* 0043AC 01DB00AC 21104300 */  addu        $2, $2, $3
/* 0043B0 01DB00B0 40200200 */  sll         $4, $2, 1
/* 0043B4 01DB00B4 9005A4AF */  sw          $4, 0x590($29)
/* 0043B8 01DB00B8 32000424 */  addiu       $4, $0, 0x32
/* 0043BC 01DB00BC 9405A4AF */  sw          $4, 0x594($29)
/* 0043C0 01DB00C0 26000324 */  addiu       $3, $0, 0x26
/* 0043C4 01DB00C4 9805A3AF */  sw          $3, 0x598($29)
/* 0043C8 01DB00C8 9C05A4AF */  sw          $4, 0x59C($29)
/* 0043CC 01DB00CC 5A010226 */  addiu       $2, $16, 0x15A
/* 0043D0 01DB00D0 8005A2AF */  sw          $2, 0x580($29)
/* 0043D4 01DB00D4 AA000224 */  addiu       $2, $0, 0xAA
/* 0043D8 01DB00D8 8405A2AF */  sw          $2, 0x584($29)
/* 0043DC 01DB00DC 8805A3AF */  sw          $3, 0x588($29)
/* 0043E0 01DB00E0 8C05A4AF */  sw          $4, 0x58C($29)
/* 0043E4 01DB00E4 EB01013C */  lui         $1, %hi(rogoAlphaA + 0x8)
/* 0043E8 01DB00E8 B83A2890 */  lbu         $8, %lo(rogoAlphaA + 0x8)($1)
/* 0043EC 01DB00EC D48B848F */  lw          $4, -0x742C($28)
/* 0043F0 01DB00F0 1C9E858F */  lw          $5, -0x61E4($28)
/* 0043F4 01DB00F4 8005A627 */  addiu       $6, $29, 0x580
/* 0043F8 01DB00F8 9005A727 */  addiu       $7, $29, 0x590
/* 0043FC 01DB00FC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 004400 01DB0100 00000000 */   nop
.L01DB0104_2EB704:
/* 004404 01DB0104 C701023C */  lui         $2, %hi(TexManager)
/* 004408 01DB0108 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00440C 01DB010C D48B858F */  lw          $5, -0x742C($28)
/* 004410 01DB0110 02000624 */  addiu       $6, $0, 0x2
/* 004414 01DB0114 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 004418 01DB0118 00000000 */   nop
/* 00441C 01DB011C 249D828F */  lw          $2, -0x62DC($28)
/* 004420 01DB0120 60005024 */  addiu       $16, $2, 0x60
/* 004424 01DB0124 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 004428 01DB0128 C8442CC4 */  lwc1        $f12, %lo(BtActStatus + 0x48)($1)
/* 00442C 01DB012C 2C44040C */  jal         fptosi
/* 004430 01DB0130 00000000 */   nop
/* 004434 01DB0134 64004228 */  slti        $2, $2, 0x64
/* 004438 01DB0138 2D004014 */  bnez        $2, .L01DB01F0_2EB7F0
/* 00443C 01DB013C 00000000 */   nop
/* 004440 01DB0140 DC01013C */  lui         $1, %hi(BtActStatus + 0x4C)
/* 004444 01DB0144 CC44228C */  lw          $2, %lo(BtActStatus + 0x4C)($1)
/* 004448 01DB0148 16004014 */  bnez        $2, .L01DB01A4_2EB7A4
/* 00444C 01DB014C 00000000 */   nop
/* 004450 01DB0150 B005A0AF */  sw          $0, 0x5B0($29)
/* 004454 01DB0154 B405A0AF */  sw          $0, 0x5B4($29)
/* 004458 01DB0158 80000424 */  addiu       $4, $0, 0x80
/* 00445C 01DB015C B805A4AF */  sw          $4, 0x5B8($29)
/* 004460 01DB0160 1C000324 */  addiu       $3, $0, 0x1C
/* 004464 01DB0164 BC05A3AF */  sw          $3, 0x5BC($29)
/* 004468 01DB0168 28000224 */  addiu       $2, $0, 0x28
/* 00446C 01DB016C A005A2AF */  sw          $2, 0x5A0($29)
/* 004470 01DB0170 8C010224 */  addiu       $2, $0, 0x18C
/* 004474 01DB0174 A405A2AF */  sw          $2, 0x5A4($29)
/* 004478 01DB0178 A805A4AF */  sw          $4, 0x5A8($29)
/* 00447C 01DB017C AC05A3AF */  sw          $3, 0x5AC($29)
/* 004480 01DB0180 FF000832 */  andi        $8, $16, 0xFF
/* 004484 01DB0184 D48B848F */  lw          $4, -0x742C($28)
/* 004488 01DB0188 209E858F */  lw          $5, -0x61E0($28)
/* 00448C 01DB018C A005A627 */  addiu       $6, $29, 0x5A0
/* 004490 01DB0190 B005A727 */  addiu       $7, $29, 0x5B0
/* 004494 01DB0194 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 004498 01DB0198 00000000 */   nop
/* 00449C 01DB019C 14000010 */  b           .L01DB01F0_2EB7F0
/* 0044A0 01DB01A0 00000000 */   nop
.L01DB01A4_2EB7A4:
/* 0044A4 01DB01A4 D005A0AF */  sw          $0, 0x5D0($29)
/* 0044A8 01DB01A8 1C000424 */  addiu       $4, $0, 0x1C
/* 0044AC 01DB01AC D405A4AF */  sw          $4, 0x5D4($29)
/* 0044B0 01DB01B0 80000324 */  addiu       $3, $0, 0x80
/* 0044B4 01DB01B4 D805A3AF */  sw          $3, 0x5D8($29)
/* 0044B8 01DB01B8 DC05A4AF */  sw          $4, 0x5DC($29)
/* 0044BC 01DB01BC 28000224 */  addiu       $2, $0, 0x28
/* 0044C0 01DB01C0 C005A2AF */  sw          $2, 0x5C0($29)
/* 0044C4 01DB01C4 8C010224 */  addiu       $2, $0, 0x18C
/* 0044C8 01DB01C8 C405A2AF */  sw          $2, 0x5C4($29)
/* 0044CC 01DB01CC C805A3AF */  sw          $3, 0x5C8($29)
/* 0044D0 01DB01D0 CC05A4AF */  sw          $4, 0x5CC($29)
/* 0044D4 01DB01D4 FF000832 */  andi        $8, $16, 0xFF
/* 0044D8 01DB01D8 D48B848F */  lw          $4, -0x742C($28)
/* 0044DC 01DB01DC 209E858F */  lw          $5, -0x61E0($28)
/* 0044E0 01DB01E0 C005A627 */  addiu       $6, $29, 0x5C0
/* 0044E4 01DB01E4 D005A727 */  addiu       $7, $29, 0x5D0
/* 0044E8 01DB01E8 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0044EC 01DB01EC 00000000 */   nop
.L01DB01F0_2EB7F0:
/* 0044F0 01DB01F0 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 0044F4 01DB01F4 C84434C4 */  lwc1        $f20, %lo(BtActStatus + 0x48)($1)
/* 0044F8 01DB01F8 06A30046 */  mov.s       $f12, $f20
/* 0044FC 01DB01FC 2C44040C */  jal         fptosi
/* 004500 01DB0200 00000000 */   nop
/* 004504 01DB0204 64004128 */  slti        $1, $2, 0x64
/* 004508 01DB0208 2D002010 */  beqz        $1, .L01DB02C0_2EB8C0
/* 00450C 01DB020C 00000000 */   nop
/* 004510 01DB0210 06A30046 */  mov.s       $f12, $f20
/* 004514 01DB0214 2C44040C */  jal         fptosi
/* 004518 01DB0218 00000000 */   nop
/* 00451C 01DB021C 288E4070 */  paddub      $17, $2, $0
/* 004520 01DB0220 F005A0AF */  sw          $0, 0x5F0($29)
/* 004524 01DB0224 54000224 */  addiu       $2, $0, 0x54
/* 004528 01DB0228 F405A2AF */  sw          $2, 0x5F4($29)
/* 00452C 01DB022C 80000424 */  addiu       $4, $0, 0x80
/* 004530 01DB0230 F805A4AF */  sw          $4, 0x5F8($29)
/* 004534 01DB0234 1C000324 */  addiu       $3, $0, 0x1C
/* 004538 01DB0238 FC05A3AF */  sw          $3, 0x5FC($29)
/* 00453C 01DB023C 28000224 */  addiu       $2, $0, 0x28
/* 004540 01DB0240 E005A2AF */  sw          $2, 0x5E0($29)
/* 004544 01DB0244 8C010224 */  addiu       $2, $0, 0x18C
/* 004548 01DB0248 E405A2AF */  sw          $2, 0x5E4($29)
/* 00454C 01DB024C E805A4AF */  sw          $4, 0x5E8($29)
/* 004550 01DB0250 EC05A3AF */  sw          $3, 0x5EC($29)
/* 004554 01DB0254 FF000832 */  andi        $8, $16, 0xFF
/* 004558 01DB0258 D48B848F */  lw          $4, -0x742C($28)
/* 00455C 01DB025C 209E858F */  lw          $5, -0x61E0($28)
/* 004560 01DB0260 E005A627 */  addiu       $6, $29, 0x5E0
/* 004564 01DB0264 F005A727 */  addiu       $7, $29, 0x5F0
/* 004568 01DB0268 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 00456C 01DB026C 00000000 */   nop
/* 004570 01DB0270 1A000224 */  addiu       $2, $0, 0x1A
/* 004574 01DB0274 1006A2AF */  sw          $2, 0x610($29)
/* 004578 01DB0278 38000224 */  addiu       $2, $0, 0x38
/* 00457C 01DB027C 1406A2AF */  sw          $2, 0x614($29)
/* 004580 01DB0280 1806B1AF */  sw          $17, 0x618($29)
/* 004584 01DB0284 1C000324 */  addiu       $3, $0, 0x1C
/* 004588 01DB0288 1C06A3AF */  sw          $3, 0x61C($29)
/* 00458C 01DB028C 42000224 */  addiu       $2, $0, 0x42
/* 004590 01DB0290 0006A2AF */  sw          $2, 0x600($29)
/* 004594 01DB0294 8C010224 */  addiu       $2, $0, 0x18C
/* 004598 01DB0298 0406A2AF */  sw          $2, 0x604($29)
/* 00459C 01DB029C 0806B1AF */  sw          $17, 0x608($29)
/* 0045A0 01DB02A0 0C06A3AF */  sw          $3, 0x60C($29)
/* 0045A4 01DB02A4 FF000832 */  andi        $8, $16, 0xFF
/* 0045A8 01DB02A8 D48B848F */  lw          $4, -0x742C($28)
/* 0045AC 01DB02AC 209E858F */  lw          $5, -0x61E0($28)
/* 0045B0 01DB02B0 0006A627 */  addiu       $6, $29, 0x600
/* 0045B4 01DB02B4 1006A727 */  addiu       $7, $29, 0x610
/* 0045B8 01DB02B8 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0045BC 01DB02BC 00000000 */   nop
.L01DB02C0_2EB8C0:
/* 0045C0 01DB02C0 C09D828F */  lw          $2, -0x6240($28)
/* 0045C4 01DB02C4 23004010 */  beqz        $2, .L01DB0354_2EB954
/* 0045C8 01DB02C8 00000000 */   nop
/* 0045CC 01DB02CC C89C828F */  lw          $2, -0x6338($28)
/* 0045D0 01DB02D0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0045D4 01DB02D4 21084100 */  addu        $1, $2, $1
/* 0045D8 01DB02D8 ECBD238C */  lw          $3, -0x4214($1)
/* 0045DC 01DB02DC 01000224 */  addiu       $2, $0, 0x1
/* 0045E0 01DB02E0 1C006214 */  bne         $3, $2, .L01DB0354_2EB954
/* 0045E4 01DB02E4 00000000 */   nop
/* 0045E8 01DB02E8 C701023C */  lui         $2, %hi(TexManager)
/* 0045EC 01DB02EC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0045F0 01DB02F0 D48B858F */  lw          $5, -0x742C($28)
/* 0045F4 01DB02F4 1F000624 */  addiu       $6, $0, 0x1F
/* 0045F8 01DB02F8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0045FC 01DB02FC 00000000 */   nop
/* 004600 01DB0300 109D828F */  lw          $2, -0x62F0($28)
/* 004604 01DB0304 0002A427 */  addiu       $4, $29, 0x200
/* 004608 01DB0308 20024524 */  addiu       $5, $2, 0x220
/* 00460C 01DB030C 0C86040C */  jal         sceVu0CopyVector
/* 004610 01DB0310 00000000 */   nop
/* 004614 01DB0314 109D848F */  lw          $4, -0x62F0($28)
/* 004618 01DB0318 1002A527 */  addiu       $5, $29, 0x210
/* 00461C 01DB031C 8CA3040C */  jal         GetRotation__6CFrameFPf
/* 004620 01DB0320 00000000 */   nop
/* 004624 01DB0324 C89C848F */  lw          $4, -0x6338($28)
/* 004628 01DB0328 0002A527 */  addiu       $5, $29, 0x200
/* 00462C 01DB032C 1402ACC7 */  lwc1        $f12, 0x214($29)
/* 004630 01DB0330 600C070C */  jal         DrawMiniMap__11CDungeonMapFPff
/* 004634 01DB0334 00000000 */   nop
/* 004638 01DB0338 E09C848F */  lw          $4, -0x6320($28)
/* 00463C 01DB033C 0002A527 */  addiu       $5, $29, 0x200
/* 004640 01DB0340 A85E070C */  jal         DrawMapSymbol__12CMonstorUnitFPf
/* 004644 01DB0344 00000000 */   nop
/* 004648 01DB0348 089D848F */  lw          $4, -0x62F8($28)
/* 00464C 01DB034C 685B070C */  jal         MapSymbolDraw__11CRandomItemFv
/* 004650 01DB0350 00000000 */   nop
.L01DB0354_2EB954:
/* 004654 01DB0354 789C828F */  lw          $2, -0x6388($28)
/* 004658 01DB0358 02004680 */  lb          $6, 0x2($2)
/* 00465C 01DB035C 249D848F */  lw          $4, -0x62DC($28)
/* 004660 01DB0360 A89D858F */  lw          $5, -0x6258($28)
/* 004664 01DB0364 3CC1060C */  jal         topStatusInfo__Fiii
/* 004668 01DB0368 00000000 */   nop
/* 00466C 01DB036C 249D848F */  lw          $4, -0x62DC($28)
/* 004670 01DB0370 60C7060C */  jal         BtStatusErrDraw__Fi
/* 004674 01DB0374 00000000 */   nop
/* 004678 01DB0378 28860070 */  paddub      $16, $0, $0
/* 00467C 01DB037C 0A000010 */  b           .L01DB03A8_2EB9A8
/* 004680 01DB0380 00000000 */   nop
.L01DB0384_2EB984:
/* 004684 01DB0384 40101000 */  sll         $2, $16, 1
/* 004688 01DB0388 21105000 */  addu        $2, $2, $16
/* 00468C 01DB038C 40190200 */  sll         $3, $2, 5
/* 004690 01DB0390 EC01023C */  lui         $2, %hi(HitValue)
/* 004694 01DB0394 40794224 */  addiu       $2, $2, %lo(HitValue)
/* 004698 01DB0398 21204300 */  addu        $4, $2, $3
/* 00469C 01DB039C 58D9060C */  jal         Draw__9CHitValueFv
/* 0046A0 01DB03A0 00000000 */   nop
/* 0046A4 01DB03A4 01001026 */  addiu       $16, $16, 0x1
.L01DB03A8_2EB9A8:
/* 0046A8 01DB03A8 2000022A */  slti        $2, $16, 0x20
/* 0046AC 01DB03AC F5FF4014 */  bnez        $2, .L01DB0384_2EB984
/* 0046B0 01DB03B0 00000000 */   nop
/* 0046B4 01DB03B4 D49D828F */  lw          $2, -0x622C($28)
/* 0046B8 01DB03B8 1D004010 */  beqz        $2, .L01DB0430_2EBA30
/* 0046BC 01DB03BC 00000000 */   nop
/* 0046C0 01DB03C0 C701023C */  lui         $2, %hi(TexManager)
/* 0046C4 01DB03C4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0046C8 01DB03C8 D48B858F */  lw          $5, -0x742C($28)
/* 0046CC 01DB03CC 07000624 */  addiu       $6, $0, 0x7
/* 0046D0 01DB03D0 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0046D4 01DB03D4 00000000 */   nop
/* 0046D8 01DB03D8 00010224 */  addiu       $2, $0, 0x100
/* 0046DC 01DB03DC 2006A2AF */  sw          $2, 0x620($29)
/* 0046E0 01DB03E0 CC000224 */  addiu       $2, $0, 0xCC
/* 0046E4 01DB03E4 2406A2AF */  sw          $2, 0x624($29)
/* 0046E8 01DB03E8 80000224 */  addiu       $2, $0, 0x80
/* 0046EC 01DB03EC 2806A2AF */  sw          $2, 0x628($29)
/* 0046F0 01DB03F0 28000224 */  addiu       $2, $0, 0x28
/* 0046F4 01DB03F4 2C06A2AF */  sw          $2, 0x62C($29)
/* 0046F8 01DB03F8 C701023C */  lui         $2, %hi(TexManager)
/* 0046FC 01DB03FC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 004700 01DB0400 DC01023C */  lui         $2, %hi(LIT_1806)
/* 004704 01DB0404 A02E4524 */  addiu       $5, $2, %lo(LIT_1806)
/* 004708 01DB0408 FFFF0624 */  addiu       $6, $0, -0x1
/* 00470C 01DB040C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 004710 01DB0410 00000000 */   nop
/* 004714 01DB0414 D48B848F */  lw          $4, -0x742C($28)
/* 004718 01DB0418 282E4070 */  paddub      $5, $2, $0
/* 00471C 01DB041C 2006A627 */  addiu       $6, $29, 0x620
/* 004720 01DB0420 283E0070 */  paddub      $7, $0, $0
/* 004724 01DB0424 28460070 */  paddub      $8, $0, $0
/* 004728 01DB0428 406F050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_ii
/* 00472C 01DB042C 00000000 */   nop
.L01DB0430_2EBA30:
/* 004730 01DB0430 01000424 */  addiu       $4, $0, 0x1
/* 004734 01DB0434 046F050C */  jal         setbilinear__Fi
/* 004738 01DB0438 00000000 */   nop
.L01DB043C_2EBA3C:
/* 00473C 01DB043C 349E828F */  lw          $2, -0x61CC($28)
/* 004740 01DB0440 03004014 */  bnez        $2, .L01DB0450_2EBA50
/* 004744 01DB0444 00000000 */   nop
/* 004748 01DB0448 9C3B080C */  jal         MonsterNameDraw__Fv
/* 00474C 01DB044C 00000000 */   nop
.L01DB0450_2EBA50:
/* 004750 01DB0450 28260070 */  paddub      $4, $0, $0
/* 004754 01DB0454 D83A080C */  jal         SetMonsterNameDrawFlag__Fi
/* 004758 01DB0458 00000000 */   nop
/* 00475C 01DB045C D401013C */  lui         $1, %hi(EdEventInfo + 0x300)
/* 004760 01DB0460 D0D4228C */  lw          $2, %lo(EdEventInfo + 0x300)($1)
/* 004764 01DB0464 22004010 */  beqz        $2, .L01DB04F0_2EBAF0
/* 004768 01DB0468 00000000 */   nop
/* 00476C 01DB046C 2002A427 */  addiu       $4, $29, 0x220
/* 004770 01DB0470 D401023C */  lui         $2, %hi(EdEventInfo + 0x310)
/* 004774 01DB0474 E0D44524 */  addiu       $5, $2, %lo(EdEventInfo + 0x310)
/* 004778 01DB0478 0C86040C */  jal         sceVu0CopyVector
/* 00477C 01DB047C 00000000 */   nop
/* 004780 01DB0480 3006A0AF */  sw          $0, 0x630($29)
/* 004784 01DB0484 3406A0AF */  sw          $0, 0x634($29)
/* 004788 01DB0488 00280224 */  addiu       $2, $0, 0x2800
/* 00478C 01DB048C 3806A2AF */  sw          $2, 0x638($29)
/* 004790 01DB0490 000E0224 */  addiu       $2, $0, 0xE00
/* 004794 01DB0494 3C06A2AF */  sw          $2, 0x63C($29)
/* 004798 01DB0498 2002ACC7 */  lwc1        $f12, 0x220($29)
/* 00479C 01DB049C 2C44040C */  jal         fptosi
/* 0047A0 01DB04A0 00000000 */   nop
/* 0047A4 01DB04A4 FF005230 */  andi        $18, $2, 0xFF
/* 0047A8 01DB04A8 2402ACC7 */  lwc1        $f12, 0x224($29)
/* 0047AC 01DB04AC 2C44040C */  jal         fptosi
/* 0047B0 01DB04B0 00000000 */   nop
/* 0047B4 01DB04B4 FF005130 */  andi        $17, $2, 0xFF
/* 0047B8 01DB04B8 2802ACC7 */  lwc1        $f12, 0x228($29)
/* 0047BC 01DB04BC 2C44040C */  jal         fptosi
/* 0047C0 01DB04C0 00000000 */   nop
/* 0047C4 01DB04C4 FF005030 */  andi        $16, $2, 0xFF
/* 0047C8 01DB04C8 2C02ACC7 */  lwc1        $f12, 0x22C($29)
/* 0047CC 01DB04CC 2C44040C */  jal         fptosi
/* 0047D0 01DB04D0 00000000 */   nop
/* 0047D4 01DB04D4 FF004830 */  andi        $8, $2, 0xFF
/* 0047D8 01DB04D8 3006A427 */  addiu       $4, $29, 0x630
/* 0047DC 01DB04DC 282E4072 */  paddub      $5, $18, $0
/* 0047E0 01DB04E0 28362072 */  paddub      $6, $17, $0
/* 0047E4 01DB04E4 283E0072 */  paddub      $7, $16, $0
/* 0047E8 01DB04E8 9CBE040C */  jal         MGFillBox__FRC8CRect_i_UcUcUcUc
/* 0047EC 01DB04EC 00000000 */   nop
.L01DB04F0_2EBAF0:
/* 0047F0 01DB04F0 189E828F */  lw          $2, -0x61E8($28)
/* 0047F4 01DB04F4 13004010 */  beqz        $2, .L01DB0544_2EBB44
/* 0047F8 01DB04F8 00000000 */   nop
/* 0047FC 01DB04FC 7462060C */  jal         EdEventSpriteDraw__Fv
/* 004800 01DB0500 00000000 */   nop
/* 004804 01DB0504 E0A2050C */  jal         EBDraw__Fv
/* 004808 01DB0508 00000000 */   nop
/* 00480C 01DB050C C701023C */  lui         $2, %hi(TexManager)
/* 004810 01DB0510 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 004814 01DB0514 D48B858F */  lw          $5, -0x742C($28)
/* 004818 01DB0518 1A000624 */  addiu       $6, $0, 0x1A
/* 00481C 01DB051C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 004820 01DB0520 00000000 */   nop
/* 004824 01DB0524 EC01023C */  lui         $2, %hi(BtEventMes0)
/* 004828 01DB0528 60AB4424 */  addiu       $4, $2, %lo(BtEventMes0)
/* 00482C 01DB052C C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 004830 01DB0530 00000000 */   nop
/* 004834 01DB0534 EC01023C */  lui         $2, %hi(BtEventMes1)
/* 004838 01DB0538 20C34424 */  addiu       $4, $2, %lo(BtEventMes1)
/* 00483C 01DB053C C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 004840 01DB0540 00000000 */   nop
.L01DB0544_2EBB44:
/* 004844 01DB0544 28860070 */  paddub      $16, $0, $0
/* 004848 01DB0548 12000010 */  b           .L01DB0594_2EBB94
/* 00484C 01DB054C 00000000 */   nop
.L01DB0550_2EBB50:
/* 004850 01DB0550 80181000 */  sll         $3, $16, 2
/* 004854 01DB0554 D401023C */  lui         $2, %hi(EdEventInfo + 0x25C)
/* 004858 01DB0558 2CD44224 */  addiu       $2, $2, %lo(EdEventInfo + 0x25C)
/* 00485C 01DB055C 21884300 */  addu        $17, $2, $3
/* 004860 01DB0560 0000228E */  lw          $2, 0x0($17)
/* 004864 01DB0564 0A004010 */  beqz        $2, .L01DB0590_2EBB90
/* 004868 01DB0568 00000000 */   nop
/* 00486C 01DB056C 28000626 */  addiu       $6, $16, 0x28
/* 004870 01DB0570 C701023C */  lui         $2, %hi(TexManager)
/* 004874 01DB0574 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 004878 01DB0578 D48B858F */  lw          $5, -0x742C($28)
/* 00487C 01DB057C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 004880 01DB0580 00000000 */   nop
/* 004884 01DB0584 0000248E */  lw          $4, 0x0($17)
/* 004888 01DB0588 60BB040C */  jal         MGDraw__FP6CFrame
/* 00488C 01DB058C 00000000 */   nop
.L01DB0590_2EBB90:
/* 004890 01DB0590 01001026 */  addiu       $16, $16, 0x1
.L01DB0594_2EBB94:
/* 004894 01DB0594 EEFF001A */  blez        $16, .L01DB0550_2EBB50
/* 004898 01DB0598 00000000 */   nop
/* 00489C 01DB059C 28260070 */  paddub      $4, $0, $0
/* 0048A0 01DB05A0 046F050C */  jal         setbilinear__Fi
/* 0048A4 01DB05A4 00000000 */   nop
/* 0048A8 01DB05A8 C701023C */  lui         $2, %hi(TexManager)
/* 0048AC 01DB05AC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0048B0 01DB05B0 D48B858F */  lw          $5, -0x742C($28)
/* 0048B4 01DB05B4 1A000624 */  addiu       $6, $0, 0x1A
/* 0048B8 01DB05B8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0048BC 01DB05BC 00000000 */   nop
/* 0048C0 01DB05C0 4880050C */  jal         SystemMesStep__Fv
/* 0048C4 01DB05C4 00000000 */   nop
/* 0048C8 01DB05C8 7880050C */  jal         SystemMesDraw__Fv
/* 0048CC 01DB05CC 00000000 */   nop
/* 0048D0 01DB05D0 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 0048D4 01DB05D4 9876228C */  lw          $2, %lo(DngMessMan + 0x8)($1)
/* 0048D8 01DB05D8 04004018 */  blez        $2, .L01DB05EC_2EBBEC
/* 0048DC 01DB05DC 00000000 */   nop
/* 0048E0 01DB05E0 28160070 */  paddub      $2, $0, $0
/* 0048E4 01DB05E4 04000010 */  b           .L01DB05F8_2EBBF8
/* 0048E8 01DB05E8 00000000 */   nop
.L01DB05EC_2EBBEC:
/* 0048EC 01DB05EC EA01013C */  lui         $1, %hi(DngMessMan)
/* 0048F0 01DB05F0 9076228C */  lw          $2, %lo(DngMessMan)($1)
/* 0048F4 01DB05F4 00000000 */  nop
.L01DB05F8_2EBBF8:
/* 0048F8 01DB05F8 60004010 */  beqz        $2, .L01DB077C_2EBD7C
/* 0048FC 01DB05FC 00000000 */   nop
/* 004900 01DB0600 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 004904 01DB0604 AC76228C */  lw          $2, %lo(DngMessMan + 0x1C)($1)
/* 004908 01DB0608 38004014 */  bnez        $2, .L01DB06EC_2EBCEC
/* 00490C 01DB060C 00000000 */   nop
/* 004910 01DB0610 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 004914 01DB0614 B476308C */  lw          $16, %lo(DngMessMan + 0x24)($1)
/* 004918 01DB0618 EA01013C */  lui         $1, %hi(DngMessMan + 0xC)
/* 00491C 01DB061C 9C76228C */  lw          $2, %lo(DngMessMan + 0xC)($1)
/* 004920 01DB0620 EB01013C */  lui         $1, %hi(DngMes1 + 0x16E0)
/* 004924 01DB0624 007B22AC */  sw          $2, %lo(DngMes1 + 0x16E0)($1)
/* 004928 01DB0628 EA01013C */  lui         $1, %hi(DngMessMan + 0x10)
/* 00492C 01DB062C A076228C */  lw          $2, %lo(DngMessMan + 0x10)($1)
/* 004930 01DB0630 EB01013C */  lui         $1, %hi(DngMes1 + 0x16E4)
/* 004934 01DB0634 047B22AC */  sw          $2, %lo(DngMes1 + 0x16E4)($1)
/* 004938 01DB0638 EA01013C */  lui         $1, %hi(DngMessMan + 0x14)
/* 00493C 01DB063C A476228C */  lw          $2, %lo(DngMessMan + 0x14)($1)
/* 004940 01DB0640 EB01013C */  lui         $1, %hi(DngMes1 + 0x1708)
/* 004944 01DB0644 287B22AC */  sw          $2, %lo(DngMes1 + 0x1708)($1)
/* 004948 01DB0648 EA01013C */  lui         $1, %hi(DngMessMan + 0x18)
/* 00494C 01DB064C A876228C */  lw          $2, %lo(DngMessMan + 0x18)($1)
/* 004950 01DB0650 EB01013C */  lui         $1, %hi(DngMes1 + 0x170C)
/* 004954 01DB0654 2C7B22AC */  sw          $2, %lo(DngMes1 + 0x170C)($1)
/* 004958 01DB0658 01000324 */  addiu       $3, $0, 0x1
/* 00495C 01DB065C EB01013C */  lui         $1, %hi(DngMes1 + 0x172C)
/* 004960 01DB0660 4C7B23AC */  sw          $3, %lo(DngMes1 + 0x172C)($1)
/* 004964 01DB0664 EB01013C */  lui         $1, %hi(DngMes1 + 0x1730)
/* 004968 01DB0668 507B20AC */  sw          $0, %lo(DngMes1 + 0x1730)($1)
/* 00496C 01DB066C 909C828F */  lw          $2, -0x6370($28)
/* 004970 01DB0670 03000212 */  beq         $16, $2, .L01DB0680_2EBC80
/* 004974 01DB0674 00000000 */   nop
/* 004978 01DB0678 909C90AF */  sw          $16, -0x6370($28)
/* 00497C 01DB067C C88683AF */  sw          $3, -0x7938($28)
.L01DB0680_2EBC80:
/* 004980 01DB0680 C886828F */  lw          $2, -0x7938($28)
/* 004984 01DB0684 07004010 */  beqz        $2, .L01DB06A4_2EBCA4
/* 004988 01DB0688 00000000 */   nop
/* 00498C 01DB068C EB01023C */  lui         $2, %hi(DngMes1)
/* 004990 01DB0690 20644424 */  addiu       $4, $2, %lo(DngMes1)
/* 004994 01DB0694 282E0072 */  paddub      $5, $16, $0
/* 004998 01DB0698 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 00499C 01DB069C 00000000 */   nop
/* 0049A0 01DB06A0 C88682AF */  sw          $2, -0x7938($28)
.L01DB06A4_2EBCA4:
/* 0049A4 01DB06A4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0049A8 01DB06A8 34000212 */  beq         $16, $2, .L01DB077C_2EBD7C
/* 0049AC 01DB06AC 00000000 */   nop
/* 0049B0 01DB06B0 36010224 */  addiu       $2, $0, 0x136
/* 0049B4 01DB06B4 EB01013C */  lui         $1, %hi(DngMes1)
/* 0049B8 01DB06B8 206422AC */  sw          $2, %lo(DngMes1)($1)
/* 0049BC 01DB06BC 54010224 */  addiu       $2, $0, 0x154
/* 0049C0 01DB06C0 EB01013C */  lui         $1, %hi(DngMes1 + 0x4)
/* 0049C4 01DB06C4 246422AC */  sw          $2, %lo(DngMes1 + 0x4)($1)
/* 0049C8 01DB06C8 09000224 */  addiu       $2, $0, 0x9
/* 0049CC 01DB06CC EB01013C */  lui         $1, %hi(DngMes1 + 0x54)
/* 0049D0 01DB06D0 746422AC */  sw          $2, %lo(DngMes1 + 0x54)($1)
/* 0049D4 01DB06D4 EB01023C */  lui         $2, %hi(DngMes1)
/* 0049D8 01DB06D8 20644424 */  addiu       $4, $2, %lo(DngMes1)
/* 0049DC 01DB06DC C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 0049E0 01DB06E0 00000000 */   nop
/* 0049E4 01DB06E4 25000010 */  b           .L01DB077C_2EBD7C
/* 0049E8 01DB06E8 00000000 */   nop
.L01DB06EC_2EBCEC:
/* 0049EC 01DB06EC EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 0049F0 01DB06F0 B476308C */  lw          $16, %lo(DngMessMan + 0x24)($1)
/* 0049F4 01DB06F4 01000324 */  addiu       $3, $0, 0x1
/* 0049F8 01DB06F8 EC01013C */  lui         $1, %hi(DngMesStb + 0x172C)
/* 0049FC 01DB06FC CCAA23AC */  sw          $3, %lo(DngMesStb + 0x172C)($1)
/* 004A00 01DB0700 EC01013C */  lui         $1, %hi(DngMesStb + 0x1730)
/* 004A04 01DB0704 D0AA20AC */  sw          $0, %lo(DngMesStb + 0x1730)($1)
/* 004A08 01DB0708 909C828F */  lw          $2, -0x6370($28)
/* 004A0C 01DB070C 03000212 */  beq         $16, $2, .L01DB071C_2EBD1C
/* 004A10 01DB0710 00000000 */   nop
/* 004A14 01DB0714 909C90AF */  sw          $16, -0x6370($28)
/* 004A18 01DB0718 C88683AF */  sw          $3, -0x7938($28)
.L01DB071C_2EBD1C:
/* 004A1C 01DB071C C886828F */  lw          $2, -0x7938($28)
/* 004A20 01DB0720 07004010 */  beqz        $2, .L01DB0740_2EBD40
/* 004A24 01DB0724 00000000 */   nop
/* 004A28 01DB0728 EC01023C */  lui         $2, %hi(DngMesStb)
/* 004A2C 01DB072C A0934424 */  addiu       $4, $2, %lo(DngMesStb)
/* 004A30 01DB0730 282E0072 */  paddub      $5, $16, $0
/* 004A34 01DB0734 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 004A38 01DB0738 00000000 */   nop
/* 004A3C 01DB073C C88682AF */  sw          $2, -0x7938($28)
.L01DB0740_2EBD40:
/* 004A40 01DB0740 FFFF0224 */  addiu       $2, $0, -0x1
/* 004A44 01DB0744 0D000212 */  beq         $16, $2, .L01DB077C_2EBD7C
/* 004A48 01DB0748 00000000 */   nop
/* 004A4C 01DB074C 08000224 */  addiu       $2, $0, 0x8
/* 004A50 01DB0750 EC01013C */  lui         $1, %hi(DngMesStb + 0x54)
/* 004A54 01DB0754 F49322AC */  sw          $2, %lo(DngMesStb + 0x54)($1)
/* 004A58 01DB0758 EC01023C */  lui         $2, %hi(DngMesStb)
/* 004A5C 01DB075C A0934424 */  addiu       $4, $2, %lo(DngMesStb)
/* 004A60 01DB0760 3002A527 */  addiu       $5, $29, 0x230
/* 004A64 01DB0764 0C34050C */  jal         AutoSet__6ClsMesFPi
/* 004A68 01DB0768 00000000 */   nop
/* 004A6C 01DB076C EC01023C */  lui         $2, %hi(DngMesStb)
/* 004A70 01DB0770 A0934424 */  addiu       $4, $2, %lo(DngMesStb)
/* 004A74 01DB0774 C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 004A78 01DB0778 00000000 */   nop
.L01DB077C_2EBD7C:
/* 004A7C 01DB077C 189E828F */  lw          $2, -0x61E8($28)
/* 004A80 01DB0780 0F004010 */  beqz        $2, .L01DB07C0_2EBDC0
/* 004A84 01DB0784 00000000 */   nop
/* 004A88 01DB0788 D501013C */  lui         $1, %hi(DebugStatus + 0x10)
/* 004A8C 01DB078C 7064228C */  lw          $2, %lo(DebugStatus + 0x10)($1)
/* 004A90 01DB0790 13004010 */  beqz        $2, .L01DB07E0_2EBDE0
/* 004A94 01DB0794 00000000 */   nop
/* 004A98 01DB0798 C701023C */  lui         $2, %hi(TexManager)
/* 004A9C 01DB079C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 004AA0 01DB07A0 D48B858F */  lw          $5, -0x742C($28)
/* 004AA4 01DB07A4 0C000624 */  addiu       $6, $0, 0xC
/* 004AA8 01DB07A8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 004AAC 01DB07AC 00000000 */   nop
/* 004AB0 01DB07B0 9CC0050C */  jal         EdDDrawFont__Fv
/* 004AB4 01DB07B4 00000000 */   nop
/* 004AB8 01DB07B8 09000010 */  b           .L01DB07E0_2EBDE0
/* 004ABC 01DB07BC 00000000 */   nop
.L01DB07C0_2EBDC0:
/* 004AC0 01DB07C0 C701023C */  lui         $2, %hi(TexManager)
/* 004AC4 01DB07C4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 004AC8 01DB07C8 D48B858F */  lw          $5, -0x742C($28)
/* 004ACC 01DB07CC 0C000624 */  addiu       $6, $0, 0xC
/* 004AD0 01DB07D0 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 004AD4 01DB07D4 00000000 */   nop
/* 004AD8 01DB07D8 E0CD060C */  jal         DebugInfomationDraw__Fv
/* 004ADC 01DB07DC 00000000 */   nop
.L01DB07E0_2EBDE0:
/* 004AE0 01DB07E0 DC01023C */  lui         $2, %hi(DispFade__3)
/* 004AE4 01DB07E4 D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 004AE8 01DB07E8 D48B858F */  lw          $5, -0x742C($28)
/* 004AEC 01DB07EC FCF9040C */  jal         FadeIn__9CDispCtrlFP13sceVif1Packet
/* 004AF0 01DB07F0 00000000 */   nop
/* 004AF4 01DB07F4 DC01023C */  lui         $2, %hi(DispFade__3)
/* 004AF8 01DB07F8 D04B4424 */  addiu       $4, $2, %lo(DispFade__3)
/* 004AFC 01DB07FC D48B858F */  lw          $5, -0x742C($28)
/* 004B00 01DB0800 A0F9040C */  jal         FadeOut__9CDispCtrlFP13sceVif1Packet
/* 004B04 01DB0804 00000000 */   nop
/* 004B08 01DB0808 1826060C */  jal         EdFadeInOut__Fv
/* 004B0C 01DB080C 00000000 */   nop
/* 004B10 01DB0810 789D838F */  lw          $3, -0x6288($28)
/* 004B14 01DB0814 18006010 */  beqz        $3, .L01DB0878_2EBE78
/* 004B18 01DB0818 00000000 */   nop
/* 004B1C 01DB081C 28260070 */  paddub      $4, $0, $0
/* 004B20 01DB0820 282E0070 */  paddub      $5, $0, $0
/* 004B24 01DB0824 E64B040C */  jal         sceGsSyncPath
/* 004B28 01DB0828 00000000 */   nop
/* 004B2C 01DB082C C701023C */  lui         $2, %hi(TexManager)
/* 004B30 01DB0830 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 004B34 01DB0834 D48B858F */  lw          $5, -0x742C($28)
/* 004B38 01DB0838 17000624 */  addiu       $6, $0, 0x17
/* 004B3C 01DB083C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 004B40 01DB0840 00000000 */   nop
/* 004B44 01DB0844 C701023C */  lui         $2, %hi(TexManager)
/* 004B48 01DB0848 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 004B4C 01DB084C DC01023C */  lui         $2, %hi(LIT_1807)
/* 004B50 01DB0850 A82E4524 */  addiu       $5, $2, %lo(LIT_1807)
/* 004B54 01DB0854 FFFF0624 */  addiu       $6, $0, -0x1
/* 004B58 01DB0858 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 004B5C 01DB085C 00000000 */   nop
/* 004B60 01DB0860 28004424 */  addiu       $4, $2, 0x28
/* 004B64 01DB0864 282E0070 */  paddub      $5, $0, $0
/* 004B68 01DB0868 28360070 */  paddub      $6, $0, $0
/* 004B6C 01DB086C 283E0070 */  paddub      $7, $0, $0
/* 004B70 01DB0870 5CBE040C */  jal         MGMoveFrameBuffImage__FP9sceGsTex0iii
/* 004B74 01DB0874 00000000 */   nop
.L01DB0878_2EBE78:
/* 004B78 01DB0878 4000BF7B */  lq          $31, 0x40($29)
/* 004B7C 01DB087C 3000B27B */  lq          $18, 0x30($29)
/* 004B80 01DB0880 2000B17B */  lq          $17, 0x20($29)
/* 004B84 01DB0884 1000B07B */  lq          $16, 0x10($29)
/* 004B88 01DB0888 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 004B8C 01DB088C A006BD27 */  addiu       $29, $29, 0x6A0
/* 004B90 01DB0890 0800E003 */  jr          $31
/* 004B94 01DB0894 00000000 */   nop
/* 004B98 01DB0898 00000000 */  nop
/* 004B9C 01DB089C 00000000 */  nop
