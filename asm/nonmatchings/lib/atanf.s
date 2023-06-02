.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel atanf
/* 1D508 0011D408 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 1D50C 0011D40C 00600244 */  mfc1       $2, $f12
/* 1D510 0011D410 1000B1FF */  sd         $17, 0x10($sp)
/* 1D514 0011D414 2D884000 */  daddu      $17, $2, $0
/* 1D518 0011D418 2000BFFF */  sd         $31, 0x20($sp)
/* 1D51C 0011D41C 0000B0FF */  sd         $16, 0x0($sp)
/* 1D520 0011D420 FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 1D524 0011D424 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 1D528 0011D428 7F50023C */  lui        $2, (0x507FFFFF >> 16)
/* 1D52C 0011D42C 24802302 */  and        $16, $17, $3
/* 1D530 0011D430 FFFF4234 */  ori        $2, $2, (0x507FFFFF & 0xFFFF)
/* 1D534 0011D434 2A105000 */  slt        $2, $2, $16
/* 1D538 0011D438 14004010 */  beqz       $2, .L0011D48C
/* 1D53C 0011D43C 807F023C */   lui       $2, (0x7F800000 >> 16)
/* 1D540 0011D440 2A105000 */  slt        $2, $2, $16
/* 1D544 0011D444 04004010 */  beqz       $2, .L0011D458
/* 1D548 0011D448 00000000 */   nop
/* 1D54C 0011D44C 93000010 */  b          .L0011D69C
/* 1D550 0011D450 00600C46 */   add.s     $f0, $f12, $f12
/* 1D554 0011D454 00000000 */  nop
.L0011D458:
/* 1D558 0011D458 0600201A */  blez       $17, .L0011D474
/* 1D55C 0011D45C 2A00023C */   lui       $2, (0x2A0000 >> 16)
/* 1D560 0011D460 2A00033C */  lui        $3, (0x2A0000 >> 16)
/* 1D564 0011D464 448A41C4 */  lwc1       $f1, -0x75BC($2)
/* 1D568 0011D468 548A60C4 */  lwc1       $f0, -0x75AC($3)
/* 1D56C 0011D46C 8B000010 */  b          .L0011D69C
/* 1D570 0011D470 00080046 */   add.s     $f0, $f1, $f0
.L0011D474:
/* 1D574 0011D474 2A00033C */  lui        $3, (0x2A0000 >> 16)
/* 1D578 0011D478 448A40C4 */  lwc1       $f0, -0x75BC($2)
/* 1D57C 0011D47C 548A61C4 */  lwc1       $f1, -0x75AC($3)
/* 1D580 0011D480 07000046 */  neg.s      $f0, $f0
/* 1D584 0011D484 85000010 */  b          .L0011D69C
/* 1D588 0011D488 01000146 */   sub.s     $f0, $f0, $f1
.L0011D48C:
/* 1D58C 0011D48C DF3E023C */  lui        $2, (0x3EDFFFFF >> 16)
/* 1D590 0011D490 FFFF4234 */  ori        $2, $2, (0x3EDFFFFF & 0xFFFF)
/* 1D594 0011D494 2A105000 */  slt        $2, $2, $16
/* 1D598 0011D498 11004014 */  bnez       $2, .L0011D4E0
/* 1D59C 0011D49C FF30023C */   lui       $2, (0x30FFFFFF >> 16)
/* 1D5A0 0011D4A0 FFFF4234 */  ori        $2, $2, (0x30FFFFFF & 0xFFFF)
/* 1D5A4 0011D4A4 2A105000 */  slt        $2, $2, $16
/* 1D5A8 0011D4A8 44004014 */  bnez       $2, .L0011D5BC
/* 1D5AC 0011D4AC FFFF0424 */   addiu     $4, $0, -0x1
/* 1D5B0 0011D4B0 4971013C */  lui        $at, (0x7149F2CA >> 16)
/* 1D5B4 0011D4B4 CAF22134 */  ori        $at, $at, (0x7149F2CA & 0xFFFF)
/* 1D5B8 0011D4B8 00008144 */  mtc1       $at, $f0
/* 1D5BC 0011D4BC 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 1D5C0 0011D4C0 00088144 */  mtc1       $at, $f1
/* 1D5C4 0011D4C4 00600046 */  add.s      $f0, $f12, $f0
/* 1D5C8 0011D4C8 34080046 */  c.lt.s     $f1, $f0
/* 1D5CC 0011D4CC 00000000 */  nop
/* 1D5D0 0011D4D0 3B000245 */  bc1fl      .L0011D5C0
/* 1D5D4 0011D4D4 82620C46 */   mul.s     $f10, $f12, $f12
/* 1D5D8 0011D4D8 70000010 */  b          .L0011D69C
/* 1D5DC 0011D4DC 06600046 */   mov.s     $f0, $f12
.L0011D4E0:
/* 1D5E0 0011D4E0 E675040C */  jal        fabsf
/* 1D5E4 0011D4E4 00000000 */   nop
/* 1D5E8 0011D4E8 973F023C */  lui        $2, (0x3F97FFFF >> 16)
/* 1D5EC 0011D4EC FFFF4234 */  ori        $2, $2, (0x3F97FFFF & 0xFFFF)
/* 1D5F0 0011D4F0 2A105000 */  slt        $2, $2, $16
/* 1D5F4 0011D4F4 1B004014 */  bnez       $2, .L0011D564
/* 1D5F8 0011D4F8 06030046 */   mov.s     $f12, $f0
/* 1D5FC 0011D4FC 2F3F023C */  lui        $2, (0x3F2FFFFF >> 16)
/* 1D600 0011D500 FFFF4234 */  ori        $2, $2, (0x3F2FFFFF & 0xFFFF)
/* 1D604 0011D504 2A105000 */  slt        $2, $2, $16
/* 1D608 0011D508 0D004014 */  bnez       $2, .L0011D540
/* 1D60C 0011D50C 2D200000 */   daddu     $4, $0, $0
/* 1D610 0011D510 00600C46 */  add.s      $f0, $f12, $f12
/* 1D614 0011D514 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 1D618 0011D518 00108144 */  mtc1       $at, $f2
/* 1D61C 0011D51C 0040013C */  lui        $at, (0x40000000 >> 16)
/* 1D620 0011D520 00088144 */  mtc1       $at, $f1
/* 1D624 0011D524 01000246 */  sub.s      $f0, $f0, $f2
/* 1D628 0011D528 40600146 */  add.s      $f1, $f12, $f1
/* 1D62C 0011D52C 00000000 */  nop
/* 1D630 0011D530 00000000 */  nop
/* 1D634 0011D534 03030146 */  div.s      $f12, $f0, $f1
/* 1D638 0011D538 21000010 */  b          .L0011D5C0
/* 1D63C 0011D53C 82620C46 */   mul.s     $f10, $f12, $f12
.L0011D540:
/* 1D640 0011D540 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 1D644 0011D544 00008144 */  mtc1       $at, $f0
/* 1D648 0011D548 40600046 */  add.s      $f1, $f12, $f0
/* 1D64C 0011D54C 01600046 */  sub.s      $f0, $f12, $f0
/* 1D650 0011D550 00000000 */  nop
/* 1D654 0011D554 00000000 */  nop
/* 1D658 0011D558 03030146 */  div.s      $f12, $f0, $f1
/* 1D65C 0011D55C 17000010 */  b          .L0011D5BC
/* 1D660 0011D560 01000424 */   addiu     $4, $0, 0x1
.L0011D564:
/* 1D664 0011D564 1B40023C */  lui        $2, (0x401BFFFF >> 16)
/* 1D668 0011D568 FFFF4234 */  ori        $2, $2, (0x401BFFFF & 0xFFFF)
/* 1D66C 0011D56C 2A105000 */  slt        $2, $2, $16
/* 1D670 0011D570 0D004014 */  bnez       $2, .L0011D5A8
/* 1D674 0011D574 03000424 */   addiu     $4, $0, 0x3
/* 1D678 0011D578 C03F013C */  lui        $at, (0x3FC00000 >> 16)
/* 1D67C 0011D57C 00008144 */  mtc1       $at, $f0
/* 1D680 0011D580 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 1D684 0011D584 00108144 */  mtc1       $at, $f2
/* 1D688 0011D588 42600046 */  mul.s      $f1, $f12, $f0
/* 1D68C 0011D58C 01600046 */  sub.s      $f0, $f12, $f0
/* 1D690 0011D590 40080246 */  add.s      $f1, $f1, $f2
/* 1D694 0011D594 00000000 */  nop
/* 1D698 0011D598 00000000 */  nop
/* 1D69C 0011D59C 03030146 */  div.s      $f12, $f0, $f1
/* 1D6A0 0011D5A0 06000010 */  b          .L0011D5BC
/* 1D6A4 0011D5A4 02000424 */   addiu     $4, $0, 0x2
.L0011D5A8:
/* 1D6A8 0011D5A8 80BF013C */  lui        $at, (0xBF800000 >> 16)
/* 1D6AC 0011D5AC 00008144 */  mtc1       $at, $f0
/* 1D6B0 0011D5B0 00000000 */  nop
/* 1D6B4 0011D5B4 00000000 */  nop
/* 1D6B8 0011D5B8 03030C46 */  div.s      $f12, $f0, $f12
.L0011D5BC:
/* 1D6BC 0011D5BC 82620C46 */  mul.s      $f10, $f12, $f12
.L0011D5C0:
/* 1D6C0 0011D5C0 2A00033C */  lui        $3, %hi(aT_2)
/* 1D6C4 0011D5C4 588A6224 */  addiu      $2, $3, %lo(aT_2)
/* 1D6C8 0011D5C8 588A69C4 */  lwc1       $f9, -0x75A8($3)
/* 1D6CC 0011D5CC 280043C4 */  lwc1       $f3, 0x28($2)
/* 1D6D0 0011D5D0 02500A46 */  mul.s      $f0, $f10, $f10
/* 1D6D4 0011D5D4 200045C4 */  lwc1       $f5, 0x20($2)
/* 1D6D8 0011D5D8 240044C4 */  lwc1       $f4, 0x24($2)
/* 1D6DC 0011D5DC 1C0041C4 */  lwc1       $f1, 0x1C($2)
/* 1D6E0 0011D5E0 C2000346 */  mul.s      $f3, $f0, $f3
/* 1D6E4 0011D5E4 180046C4 */  lwc1       $f6, 0x18($2)
/* 1D6E8 0011D5E8 02010446 */  mul.s      $f4, $f0, $f4
/* 1D6EC 0011D5EC 140042C4 */  lwc1       $f2, 0x14($2)
/* 1D6F0 0011D5F0 100047C4 */  lwc1       $f7, 0x10($2)
/* 1D6F4 0011D5F4 40290346 */  add.s      $f5, $f5, $f3
/* 1D6F8 0011D5F8 080048C4 */  lwc1       $f8, 0x8($2)
/* 1D6FC 0011D5FC 40080446 */  add.s      $f1, $f1, $f4
/* 1D700 0011D600 0C0043C4 */  lwc1       $f3, 0xC($2)
/* 1D704 0011D604 040044C4 */  lwc1       $f4, 0x4($2)
/* 1D708 0011D608 42010546 */  mul.s      $f5, $f0, $f5
/* 1D70C 0011D60C 42000146 */  mul.s      $f1, $f0, $f1
/* 1D710 0011D610 80310546 */  add.s      $f6, $f6, $f5
/* 1D714 0011D614 80100146 */  add.s      $f2, $f2, $f1
/* 1D718 0011D618 82010646 */  mul.s      $f6, $f0, $f6
/* 1D71C 0011D61C 82000246 */  mul.s      $f2, $f0, $f2
/* 1D720 0011D620 C0390646 */  add.s      $f7, $f7, $f6
/* 1D724 0011D624 C0180246 */  add.s      $f3, $f3, $f2
/* 1D728 0011D628 C2010746 */  mul.s      $f7, $f0, $f7
/* 1D72C 0011D62C C2000346 */  mul.s      $f3, $f0, $f3
/* 1D730 0011D630 00420746 */  add.s      $f8, $f8, $f7
/* 1D734 0011D634 00210346 */  add.s      $f4, $f4, $f3
/* 1D738 0011D638 02020846 */  mul.s      $f8, $f0, $f8
/* 1D73C 0011D63C 42000446 */  mul.s      $f1, $f0, $f4
/* 1D740 0011D640 404A0846 */  add.s      $f9, $f9, $f8
/* 1D744 0011D644 05008104 */  bgez       $4, .L0011D65C
/* 1D748 0011D648 02500946 */   mul.s     $f0, $f10, $f9
/* 1D74C 0011D64C 00000146 */  add.s      $f0, $f0, $f1
/* 1D750 0011D650 02600046 */  mul.s      $f0, $f12, $f0
/* 1D754 0011D654 11000010 */  b          .L0011D69C
/* 1D758 0011D658 01600046 */   sub.s     $f0, $f12, $f0
.L0011D65C:
/* 1D75C 0011D65C 00000146 */  add.s      $f0, $f0, $f1
/* 1D760 0011D660 2A00023C */  lui        $2, %hi(atanlo_2)
/* 1D764 0011D664 80200400 */  sll        $4, $4, 2
/* 1D768 0011D668 488A4224 */  addiu      $2, $2, %lo(atanlo_2)
/* 1D76C 0011D66C 21108200 */  addu       $2, $4, $2
/* 1D770 0011D670 2A00033C */  lui        $3, %hi(atanhi_2)
/* 1D774 0011D674 02600046 */  mul.s      $f0, $f12, $f0
/* 1D778 0011D678 000042C4 */  lwc1       $f2, 0x0($2)
/* 1D77C 0011D67C 388A6324 */  addiu      $3, $3, %lo(atanhi_2)
/* 1D780 0011D680 21208300 */  addu       $4, $4, $3
/* 1D784 0011D684 01000246 */  sub.s      $f0, $f0, $f2
/* 1D788 0011D688 000081C4 */  lwc1       $f1, 0x0($4)
/* 1D78C 0011D68C 01000C46 */  sub.s      $f0, $f0, $f12
/* 1D790 0011D690 02002106 */  bgez       $17, .L0011D69C
/* 1D794 0011D694 01080046 */   sub.s     $f0, $f1, $f0
/* 1D798 0011D698 07000046 */  neg.s      $f0, $f0
.L0011D69C:
/* 1D79C 0011D69C 2000BFDF */  ld         $31, 0x20($sp)
/* 1D7A0 0011D6A0 1000B1DF */  ld         $17, 0x10($sp)
/* 1D7A4 0011D6A4 0000B0DF */  ld         $16, 0x0($sp)
/* 1D7A8 0011D6A8 0800E003 */  jr         $31
/* 1D7AC 0011D6AC 3000BD27 */   addiu     $sp, $sp, 0x30