.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawWeaponSelectDialog__Fiii
/* FC320 001FC220 A0FEBD27 */  addiu      $sp, $sp, -0x160
/* FC324 001FC224 9000BF7F */  sq         $31, 0x90($sp)
/* FC328 001FC228 8000BE7F */  sq         $fp, 0x80($sp)
/* FC32C 001FC22C 7000B77F */  sq         $23, 0x70($sp)
/* FC330 001FC230 6000B67F */  sq         $22, 0x60($sp)
/* FC334 001FC234 5000B57F */  sq         $21, 0x50($sp)
/* FC338 001FC238 4000B47F */  sq         $20, 0x40($sp)
/* FC33C 001FC23C 3000B37F */  sq         $19, 0x30($sp)
/* FC340 001FC240 2000B27F */  sq         $18, 0x20($sp)
/* FC344 001FC244 1000B17F */  sq         $17, 0x10($sp)
/* FC348 001FC248 0000B07F */  sq         $16, 0x0($sp)
/* FC34C 001FC24C 28BE8070 */  paddub     $23, $4, $0
/* FC350 001FC250 28F6A070 */  paddub     $fp, $5, $0
/* FC354 001FC254 28AEC070 */  paddub     $21, $6, $0
/* FC358 001FC258 281E0070 */  paddub     $3, $0, $0
/* FC35C 001FC25C 1C88828F */  lw         $2, -0x77E4($gp)
/* FC360 001FC260 02004018 */  blez       $2, .L001FC26C
/* FC364 001FC264 00000000 */   nop
/* FC368 001FC268 02000324 */  addiu      $3, $0, 0x2
.L001FC26C:
/* FC36C 001FC26C 3C160300 */  dsll32     $2, $3, 24
/* FC370 001FC270 3F160200 */  dsra32     $2, $2, 24
/* FC374 001FC274 2180E202 */  addu       $16, $23, $2
/* FC378 001FC278 2188C203 */  addu       $17, $fp, $2
/* FC37C 001FC27C C0CF070C */  jal        GetNowSelectWeapon__Fv
/* FC380 001FC280 00000000 */   nop
/* FC384 001FC284 289E4070 */  paddub     $19, $2, $0
/* FC388 001FC288 B1000424 */  addiu      $4, $0, 0xB1
/* FC38C 001FC28C 6095858F */  lw         $5, -0x6AA0($gp)
/* FC390 001FC290 4CC8080C */  jal        GetNowItemNum__FsP9ITEM_PACK
/* FC394 001FC294 00000000 */   nop
/* FC398 001FC298 28B64070 */  paddub     $22, $2, $0
/* FC39C 001FC29C 28266072 */  paddub     $4, $19, $0
/* FC3A0 001FC2A0 ACEF070C */  jal        NowWeaponStatusValue__FP11WEAPON_HAVE
/* FC3A4 001FC2A4 00000000 */   nop
/* FC3A8 001FC2A8 AC00A2AF */  sw         $2, 0xAC($sp)
/* FC3AC 001FC2AC 68000424 */  addiu      $4, $0, 0x68
/* FC3B0 001FC2B0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC3B4 001FC2B4 7CEA2384 */  lh         $3, -0x1584($at)
/* FC3B8 001FC2B8 05000224 */  addiu      $2, $0, 0x5
/* FC3BC 001FC2BC 03006210 */  beq        $3, $2, .L001FC2CC
/* FC3C0 001FC2C0 00000000 */   nop
/* FC3C4 001FC2C4 02000010 */  b          .L001FC2D0
/* FC3C8 001FC2C8 00000000 */   nop
.L001FC2CC:
/* FC3CC 001FC2CC A0008424 */  addiu      $4, $4, 0xA0
.L001FC2D0:
/* FC3D0 001FC2D0 20010224 */  addiu      $2, $0, 0x120
/* FC3D4 001FC2D4 E000A2AF */  sw         $2, 0xE0($sp)
/* FC3D8 001FC2D8 E400A4AF */  sw         $4, 0xE4($sp)
/* FC3DC 001FC2DC 60000324 */  addiu      $3, $0, 0x60
/* FC3E0 001FC2E0 E800A3AF */  sw         $3, 0xE8($sp)
/* FC3E4 001FC2E4 20000224 */  addiu      $2, $0, 0x20
/* FC3E8 001FC2E8 EC00A2AF */  sw         $2, 0xEC($sp)
/* FC3EC 001FC2EC D000B0AF */  sw         $16, 0xD0($sp)
/* FC3F0 001FC2F0 01002226 */  addiu      $2, $17, 0x1
/* FC3F4 001FC2F4 D400A2AF */  sw         $2, 0xD4($sp)
/* FC3F8 001FC2F8 D800A3AF */  sw         $3, 0xD8($sp)
/* FC3FC 001FC2FC 1F000224 */  addiu      $2, $0, 0x1F
/* FC400 001FC300 DC00A2AF */  sw         $2, 0xDC($sp)
/* FC404 001FC304 2C95848F */  lw         $4, -0x6AD4($gp)
/* FC408 001FC308 D000A527 */  addiu      $5, $sp, 0xD0
/* FC40C 001FC30C E000A627 */  addiu      $6, $sp, 0xE0
/* FC410 001FC310 283EA072 */  paddub     $7, $21, $0
/* FC414 001FC314 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* FC418 001FC318 00000000 */   nop
/* FC41C 001FC31C 20010224 */  addiu      $2, $0, 0x120
/* FC420 001FC320 B000A2AF */  sw         $2, 0xB0($sp)
/* FC424 001FC324 88000224 */  addiu      $2, $0, 0x88
/* FC428 001FC328 B400B427 */  addiu      $20, $sp, 0xB4
/* FC42C 001FC32C 000082AE */  sw         $2, 0x0($20)
/* FC430 001FC330 60000324 */  addiu      $3, $0, 0x60
/* FC434 001FC334 B800A3AF */  sw         $3, 0xB8($sp)
/* FC438 001FC338 20000224 */  addiu      $2, $0, 0x20
/* FC43C 001FC33C BC00A2AF */  sw         $2, 0xBC($sp)
/* FC440 001FC340 F000B0AF */  sw         $16, 0xF0($sp)
/* FC444 001FC344 1B002226 */  addiu      $2, $17, 0x1B
/* FC448 001FC348 F400A2AF */  sw         $2, 0xF4($sp)
/* FC44C 001FC34C F800A3AF */  sw         $3, 0xF8($sp)
/* FC450 001FC350 1F000224 */  addiu      $2, $0, 0x1F
/* FC454 001FC354 FC00A2AF */  sw         $2, 0xFC($sp)
/* FC458 001FC358 2C95848F */  lw         $4, -0x6AD4($gp)
/* FC45C 001FC35C F000A527 */  addiu      $5, $sp, 0xF0
/* FC460 001FC360 B000A627 */  addiu      $6, $sp, 0xB0
/* FC464 001FC364 283EA072 */  paddub     $7, $21, $0
/* FC468 001FC368 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* FC46C 001FC36C 00000000 */   nop
/* FC470 001FC370 0000828E */  lw         $2, 0x0($20)
/* FC474 001FC374 20004224 */  addiu      $2, $2, 0x20
/* FC478 001FC378 000082AE */  sw         $2, 0x0($20)
/* FC47C 001FC37C 28260072 */  paddub     $4, $16, $0
/* FC480 001FC380 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC484 001FC384 72EA2384 */  lh         $3, -0x158E($at)
/* FC488 001FC388 02000224 */  addiu      $2, $0, 0x2
/* FC48C 001FC38C 02006214 */  bne        $3, $2, .L001FC398
/* FC490 001FC390 00000000 */   nop
/* FC494 001FC394 28000426 */  addiu      $4, $16, 0x28
.L001FC398:
/* FC498 001FC398 20010224 */  addiu      $2, $0, 0x120
/* FC49C 001FC39C 1001A2AF */  sw         $2, 0x110($sp)
/* FC4A0 001FC3A0 48010224 */  addiu      $2, $0, 0x148
/* FC4A4 001FC3A4 1401A2AF */  sw         $2, 0x114($sp)
/* FC4A8 001FC3A8 60000324 */  addiu      $3, $0, 0x60
/* FC4AC 001FC3AC 1801A3AF */  sw         $3, 0x118($sp)
/* FC4B0 001FC3B0 20000224 */  addiu      $2, $0, 0x20
/* FC4B4 001FC3B4 1C01A2AF */  sw         $2, 0x11C($sp)
/* FC4B8 001FC3B8 0001A4AF */  sw         $4, 0x100($sp)
/* FC4BC 001FC3BC 35002226 */  addiu      $2, $17, 0x35
/* FC4C0 001FC3C0 0401A2AF */  sw         $2, 0x104($sp)
/* FC4C4 001FC3C4 0801A3AF */  sw         $3, 0x108($sp)
/* FC4C8 001FC3C8 1F000224 */  addiu      $2, $0, 0x1F
/* FC4CC 001FC3CC 0C01A2AF */  sw         $2, 0x10C($sp)
/* FC4D0 001FC3D0 2C95848F */  lw         $4, -0x6AD4($gp)
/* FC4D4 001FC3D4 0001A527 */  addiu      $5, $sp, 0x100
/* FC4D8 001FC3D8 1001A627 */  addiu      $6, $sp, 0x110
/* FC4DC 001FC3DC 283EA072 */  paddub     $7, $21, $0
/* FC4E0 001FC3E0 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* FC4E4 001FC3E4 00000000 */   nop
/* FC4E8 001FC3E8 80001224 */  addiu      $18, $0, 0x80
/* FC4EC 001FC3EC 0A00C01A */  blez       $22, .L001FC418
/* FC4F0 001FC3F0 00000000 */   nop
/* FC4F4 001FC3F4 100061C6 */  lwc1       $f1, 0x10($19)
/* FC4F8 001FC3F8 0C006286 */  lh         $2, 0xC($19)
/* FC4FC 001FC3FC 00008244 */  mtc1       $2, $f0
/* FC500 001FC400 00000000 */  nop
/* FC504 001FC404 20008046 */  cvt.s.w    $f0, $f0
/* FC508 001FC408 32080046 */  c.eq.s     $f1, $f0
/* FC50C 001FC40C 00000000 */  nop
/* FC510 001FC410 02000045 */  bc1f       .L001FC41C
/* FC514 001FC414 00000000 */   nop
.L001FC418:
/* FC518 001FC418 40001224 */  addiu      $18, $0, 0x40
.L001FC41C:
/* FC51C 001FC41C 9C958283 */  lb         $2, -0x6A64($gp)
/* FC520 001FC420 04004014 */  bnez       $2, .L001FC434
/* FC524 001FC424 00000000 */   nop
/* FC528 001FC428 989580AF */  sw         $0, -0x6A68($gp)
/* FC52C 001FC42C 01000224 */  addiu      $2, $0, 0x1
/* FC530 001FC430 9C9582A3 */  sb         $2, -0x6A64($gp)
.L001FC434:
/* FC534 001FC434 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC538 001FC438 75EA2480 */  lb         $4, -0x158B($at)
/* FC53C 001FC43C 68CF070C */  jal        GetDefaultWeaponNo__Fi
/* FC540 001FC440 00000000 */   nop
/* FC544 001FC444 0C006386 */  lh         $3, 0xC($19)
/* FC548 001FC448 00008344 */  mtc1       $3, $f0
/* FC54C 001FC44C 00000000 */  nop
/* FC550 001FC450 60008046 */  cvt.s.w    $f1, $f0
/* FC554 001FC454 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* FC558 001FC458 42000146 */  mul.s      $f1, $f0, $f1
/* FC55C 001FC45C 100060C6 */  lwc1       $f0, 0x10($19)
/* FC560 001FC460 36000146 */  c.le.s     $f0, $f1
/* FC564 001FC464 00000000 */  nop
/* FC568 001FC468 04000145 */  bc1t       .L001FC47C
/* FC56C 001FC46C 00000000 */   nop
/* FC570 001FC470 00006386 */  lh         $3, 0x0($19)
/* FC574 001FC474 1F006214 */  bne        $3, $2, .L001FC4F4
/* FC578 001FC478 00000000 */   nop
.L001FC47C:
/* FC57C 001FC47C 1D00C01A */  blez       $22, .L001FC4F4
/* FC580 001FC480 00000000 */   nop
/* FC584 001FC484 989580C7 */  lwc1       $f0, -0x6A68($gp)
/* FC588 001FC488 60008046 */  cvt.s.w    $f1, $f0
/* FC58C 001FC48C 4041023C */  lui        $2, (0x41400000 >> 16)
/* FC590 001FC490 00008244 */  mtc1       $2, $f0
/* FC594 001FC494 00000000 */  nop
/* FC598 001FC498 030B0046 */  div.s      $f12, $f1, $f0
/* FC59C 001FC49C 2876040C */  jal        sinf
/* FC5A0 001FC4A0 00000000 */   nop
/* FC5A4 001FC4A4 4842023C */  lui        $2, (0x42480000 >> 16)
/* FC5A8 001FC4A8 00088244 */  mtc1       $2, $f1
/* FC5AC 001FC4AC 00000000 */  nop
/* FC5B0 001FC4B0 020B0046 */  mul.s      $f12, $f1, $f0
/* FC5B4 001FC4B4 2C44040C */  jal        fptosi
/* FC5B8 001FC4B8 00000000 */   nop
/* FC5BC 001FC4BC 28264070 */  paddub     $4, $2, $0
/* FC5C0 001FC4C0 7200040C */  jal        abs
/* FC5C4 001FC4C4 00000000 */   nop
/* FC5C8 001FC4C8 78005224 */  addiu      $18, $2, 0x78
/* FC5CC 001FC4CC 9895828F */  lw         $2, -0x6A68($gp)
/* FC5D0 001FC4D0 01004224 */  addiu      $2, $2, 0x1
/* FC5D4 001FC4D4 989582AF */  sw         $2, -0x6A68($gp)
/* FC5D8 001FC4D8 9895828F */  lw         $2, -0x6A68($gp)
/* FC5DC 001FC4DC 0F00013C */  lui        $at, (0xF4241 >> 16)
/* FC5E0 001FC4E0 41422134 */  ori        $at, $at, (0xF4241 & 0xFFFF)
/* FC5E4 001FC4E4 2A084100 */  slt        $at, $2, $at
/* FC5E8 001FC4E8 02002014 */  bnez       $at, .L001FC4F4
/* FC5EC 001FC4EC 00000000 */   nop
/* FC5F0 001FC4F0 989580AF */  sw         $0, -0x6A68($gp)
.L001FC4F4:
/* FC5F4 001FC4F4 2001B0AF */  sw         $16, 0x120($sp)
/* FC5F8 001FC4F8 4F002226 */  addiu      $2, $17, 0x4F
/* FC5FC 001FC4FC 2401A2AF */  sw         $2, 0x124($sp)
/* FC600 001FC500 60000224 */  addiu      $2, $0, 0x60
/* FC604 001FC504 2801A2AF */  sw         $2, 0x128($sp)
/* FC608 001FC508 1F000224 */  addiu      $2, $0, 0x1F
/* FC60C 001FC50C 2C01A2AF */  sw         $2, 0x12C($sp)
/* FC610 001FC510 FF004732 */  andi       $7, $18, 0xFF
/* FC614 001FC514 2846E070 */  paddub     $8, $7, $0
/* FC618 001FC518 284EE070 */  paddub     $9, $7, $0
/* FC61C 001FC51C 2C95848F */  lw         $4, -0x6AD4($gp)
/* FC620 001FC520 2001A527 */  addiu      $5, $sp, 0x120
/* FC624 001FC524 B000A627 */  addiu      $6, $sp, 0xB0
/* FC628 001FC528 2856A072 */  paddub     $10, $21, $0
/* FC62C 001FC52C E4B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
/* FC630 001FC530 00000000 */   nop
/* FC634 001FC534 0000838E */  lw         $3, 0x0($20)
/* FC638 001FC538 20006324 */  addiu      $3, $3, 0x20
/* FC63C 001FC53C 000083AE */  sw         $3, 0x0($20)
/* FC640 001FC540 A4958383 */  lb         $3, -0x6A5C($gp)
/* FC644 001FC544 04006014 */  bnez       $3, .L001FC558
/* FC648 001FC548 00000000 */   nop
/* FC64C 001FC54C A09580AF */  sw         $0, -0x6A60($gp)
/* FC650 001FC550 01000324 */  addiu      $3, $0, 0x1
/* FC654 001FC554 A49583A3 */  sb         $3, -0x6A5C($gp)
.L001FC558:
/* FC658 001FC558 80001224 */  addiu      $18, $0, 0x80
/* FC65C 001FC55C A095838F */  lw         $3, -0x6A60($gp)
/* FC660 001FC560 01006324 */  addiu      $3, $3, 0x1
/* FC664 001FC564 A09583AF */  sw         $3, -0x6A60($gp)
/* FC668 001FC568 A095838F */  lw         $3, -0x6A60($gp)
/* FC66C 001FC56C 0F00013C */  lui        $at, (0xF4241 >> 16)
/* FC670 001FC570 41422134 */  ori        $at, $at, (0xF4241 & 0xFFFF)
/* FC674 001FC574 2A086100 */  slt        $at, $3, $at
/* FC678 001FC578 02002014 */  bnez       $at, .L001FC584
/* FC67C 001FC57C 00000000 */   nop
/* FC680 001FC580 A09580AF */  sw         $0, -0x6A60($gp)
.L001FC584:
/* FC684 001FC584 C000B0AF */  sw         $16, 0xC0($sp)
/* FC688 001FC588 69002326 */  addiu      $3, $17, 0x69
/* FC68C 001FC58C C400B127 */  addiu      $17, $sp, 0xC4
/* FC690 001FC590 000023AE */  sw         $3, 0x0($17)
/* FC694 001FC594 60000324 */  addiu      $3, $0, 0x60
/* FC698 001FC598 C800A3AF */  sw         $3, 0xC8($sp)
/* FC69C 001FC59C 1F000324 */  addiu      $3, $0, 0x1F
/* FC6A0 001FC5A0 CC00A3AF */  sw         $3, 0xCC($sp)
/* FC6A4 001FC5A4 01001024 */  addiu      $16, $0, 0x1
/* FC6A8 001FC5A8 3C000010 */  b          .L001FC69C
/* FC6AC 001FC5AC 00000000 */   nop
.L001FC5B0:
/* FC6B0 001FC5B0 01000324 */  addiu      $3, $0, 0x1
/* FC6B4 001FC5B4 04200302 */  sllv       $4, $3, $16
/* FC6B8 001FC5B8 AC00A38F */  lw         $3, 0xAC($sp)
/* FC6BC 001FC5BC 24186400 */  and        $3, $3, $4
/* FC6C0 001FC5C0 0D006010 */  beqz       $3, .L001FC5F8
/* FC6C4 001FC5C4 00000000 */   nop
/* FC6C8 001FC5C8 FF004732 */  andi       $7, $18, 0xFF
/* FC6CC 001FC5CC 2846E070 */  paddub     $8, $7, $0
/* FC6D0 001FC5D0 284EE070 */  paddub     $9, $7, $0
/* FC6D4 001FC5D4 2C95848F */  lw         $4, -0x6AD4($gp)
/* FC6D8 001FC5D8 C000A527 */  addiu      $5, $sp, 0xC0
/* FC6DC 001FC5DC B000A627 */  addiu      $6, $sp, 0xB0
/* FC6E0 001FC5E0 2856A072 */  paddub     $10, $21, $0
/* FC6E4 001FC5E4 E4B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
/* FC6E8 001FC5E8 00000000 */   nop
/* FC6EC 001FC5EC 0000238E */  lw         $3, 0x0($17)
/* FC6F0 001FC5F0 1A006324 */  addiu      $3, $3, 0x1A
/* FC6F4 001FC5F4 000023AE */  sw         $3, 0x0($17)
.L001FC5F8:
/* FC6F8 001FC5F8 0000838E */  lw         $3, 0x0($20)
/* FC6FC 001FC5FC 20006324 */  addiu      $3, $3, 0x20
/* FC700 001FC600 000083AE */  sw         $3, 0x0($20)
/* FC704 001FC604 02000324 */  addiu      $3, $0, 0x2
/* FC708 001FC608 23000316 */  bne        $16, $3, .L001FC698
/* FC70C 001FC60C 00000000 */   nop
/* FC710 001FC610 0000828E */  lw         $2, 0x0($20)
/* FC714 001FC614 20004224 */  addiu      $2, $2, 0x20
/* FC718 001FC618 000082AE */  sw         $2, 0x0($20)
/* FC71C 001FC61C 5C01A0AF */  sw         $0, 0x15C($sp)
/* FC720 001FC620 28266072 */  paddub     $4, $19, $0
/* FC724 001FC624 5C01A527 */  addiu      $5, $sp, 0x15C
/* FC728 001FC628 9C33080C */  jal        WeaponStatusBuildUp__FP11WEAPON_HAVERi
/* FC72C 001FC62C 00000000 */   nop
/* FC730 001FC630 28266072 */  paddub     $4, $19, $0
/* FC734 001FC634 F4C7080C */  jal        GetNowWeaponAttachNum__FP11WEAPON_HAVE
/* FC738 001FC638 00000000 */   nop
/* FC73C 001FC63C 5C01A38F */  lw         $3, 0x15C($sp)
/* FC740 001FC640 15006018 */  blez       $3, .L001FC698
/* FC744 001FC644 00000000 */   nop
/* FC748 001FC648 13004014 */  bnez       $2, .L001FC698
/* FC74C 001FC64C 00000000 */   nop
/* FC750 001FC650 A09580C7 */  lwc1       $f0, -0x6A60($gp)
/* FC754 001FC654 60008046 */  cvt.s.w    $f1, $f0
/* FC758 001FC658 4041023C */  lui        $2, (0x41400000 >> 16)
/* FC75C 001FC65C 00008244 */  mtc1       $2, $f0
/* FC760 001FC660 00000000 */  nop
/* FC764 001FC664 030B0046 */  div.s      $f12, $f1, $f0
/* FC768 001FC668 2876040C */  jal        sinf
/* FC76C 001FC66C 00000000 */   nop
/* FC770 001FC670 2042023C */  lui        $2, (0x42200000 >> 16)
/* FC774 001FC674 00088244 */  mtc1       $2, $f1
/* FC778 001FC678 00000000 */  nop
/* FC77C 001FC67C 020B0046 */  mul.s      $f12, $f1, $f0
/* FC780 001FC680 2C44040C */  jal        fptosi
/* FC784 001FC684 00000000 */   nop
/* FC788 001FC688 28264070 */  paddub     $4, $2, $0
/* FC78C 001FC68C 7200040C */  jal        abs
/* FC790 001FC690 00000000 */   nop
/* FC794 001FC694 21904202 */  addu       $18, $18, $2
.L001FC698:
/* FC798 001FC698 01001026 */  addiu      $16, $16, 0x1
.L001FC69C:
/* FC79C 001FC69C 0400012A */  slti       $at, $16, 0x4
/* FC7A0 001FC6A0 C3FF2014 */  bnez       $at, .L001FC5B0
/* FC7A4 001FC6A4 00000000 */   nop
/* FC7A8 001FC6A8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC7AC 001FC6AC 7CEA2484 */  lh         $4, -0x1584($at)
/* FC7B0 001FC6B0 0D000324 */  addiu      $3, $0, 0xD
/* FC7B4 001FC6B4 06008310 */  beq        $4, $3, .L001FC6D0
/* FC7B8 001FC6B8 00000000 */   nop
/* FC7BC 001FC6BC 0C000324 */  addiu      $3, $0, 0xC
/* FC7C0 001FC6C0 03008310 */  beq        $4, $3, .L001FC6D0
/* FC7C4 001FC6C4 00000000 */   nop
/* FC7C8 001FC6C8 14000010 */  b          .L001FC71C
/* FC7CC 001FC6CC 00000000 */   nop
.L001FC6D0:
/* FC7D0 001FC6D0 4001A0AF */  sw         $0, 0x140($sp)
/* FC7D4 001FC6D4 80000724 */  addiu      $7, $0, 0x80
/* FC7D8 001FC6D8 4401A7AF */  sw         $7, 0x144($sp)
/* FC7DC 001FC6DC 60000324 */  addiu      $3, $0, 0x60
/* FC7E0 001FC6E0 4801A3AF */  sw         $3, 0x148($sp)
/* FC7E4 001FC6E4 20000224 */  addiu      $2, $0, 0x20
/* FC7E8 001FC6E8 4C01A2AF */  sw         $2, 0x14C($sp)
/* FC7EC 001FC6EC 6400E226 */  addiu      $2, $23, 0x64
/* FC7F0 001FC6F0 3001A2AF */  sw         $2, 0x130($sp)
/* FC7F4 001FC6F4 3300C227 */  addiu      $2, $fp, 0x33
/* FC7F8 001FC6F8 3401A2AF */  sw         $2, 0x134($sp)
/* FC7FC 001FC6FC 3801A3AF */  sw         $3, 0x138($sp)
/* FC800 001FC700 1F000224 */  addiu      $2, $0, 0x1F
/* FC804 001FC704 3C01A2AF */  sw         $2, 0x13C($sp)
/* FC808 001FC708 2895848F */  lw         $4, -0x6AD8($gp)
/* FC80C 001FC70C 3001A527 */  addiu      $5, $sp, 0x130
/* FC810 001FC710 4001A627 */  addiu      $6, $sp, 0x140
/* FC814 001FC714 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* FC818 001FC718 00000000 */   nop
.L001FC71C:
/* FC81C 001FC71C 9000BF7B */  lq         $31, 0x90($sp)
/* FC820 001FC720 8000BE7B */  lq         $fp, 0x80($sp)
/* FC824 001FC724 7000B77B */  lq         $23, 0x70($sp)
/* FC828 001FC728 6000B67B */  lq         $22, 0x60($sp)
/* FC82C 001FC72C 5000B57B */  lq         $21, 0x50($sp)
/* FC830 001FC730 4000B47B */  lq         $20, 0x40($sp)
/* FC834 001FC734 3000B37B */  lq         $19, 0x30($sp)
/* FC838 001FC738 2000B27B */  lq         $18, 0x20($sp)
/* FC83C 001FC73C 1000B17B */  lq         $17, 0x10($sp)
/* FC840 001FC740 0000B07B */  lq         $16, 0x0($sp)
/* FC844 001FC744 6001BD27 */  addiu      $sp, $sp, 0x160
/* FC848 001FC748 0800E003 */  jr         $31
/* FC84C 001FC74C 00000000 */   nop
