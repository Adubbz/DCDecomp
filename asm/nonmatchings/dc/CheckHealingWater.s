.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckHealingWater__Fv
/* AF4B0 001AF3B0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* AF4B4 001AF3B4 7000BF7F */  sq         $31, 0x70($sp)
/* AF4B8 001AF3B8 6000B57F */  sq         $21, 0x60($sp)
/* AF4BC 001AF3BC 5000B47F */  sq         $20, 0x50($sp)
/* AF4C0 001AF3C0 4000B37F */  sq         $19, 0x40($sp)
/* AF4C4 001AF3C4 3000B27F */  sq         $18, 0x30($sp)
/* AF4C8 001AF3C8 2000B17F */  sq         $17, 0x20($sp)
/* AF4CC 001AF3CC 1000B07F */  sq         $16, 0x10($sp)
/* AF4D0 001AF3D0 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* AF4D4 001AF3D4 0800B6E7 */  swc1       $f22, 0x8($sp)
/* AF4D8 001AF3D8 0400B5E7 */  swc1       $f21, 0x4($sp)
/* AF4DC 001AF3DC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* AF4E0 001AF3E0 2043023C */  lui        $2, (0x43200000 >> 16)
/* AF4E4 001AF3E4 00A08244 */  mtc1       $2, $f20
/* AF4E8 001AF3E8 8000A427 */  addiu      $4, $sp, 0x80
/* AF4EC 001AF3EC EA01023C */  lui        $2, %hi(D_1EA1D30)
/* AF4F0 001AF3F0 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* AF4F4 001AF3F4 0C86040C */  jal        sceVu0CopyVector
/* AF4F8 001AF3F8 00000000 */   nop
/* AF4FC 001AF3FC 288E0070 */  paddub     $17, $0, $0
/* AF500 001AF400 3F000010 */  b          .L001AF500
/* AF504 001AF404 00000000 */   nop
.L001AF408:
/* AF508 001AF408 28960070 */  paddub     $18, $0, $0
/* AF50C 001AF40C 38000010 */  b          .L001AF4F0
/* AF510 001AF410 00000000 */   nop
.L001AF414:
/* AF514 001AF414 80101100 */  sll        $2, $17, 2
/* AF518 001AF418 21105100 */  addu       $2, $2, $17
/* AF51C 001AF41C 80100200 */  sll        $2, $2, 2
/* AF520 001AF420 21104202 */  addu       $2, $18, $2
/* AF524 001AF424 00110200 */  sll        $2, $2, 4
/* AF528 001AF428 C89C848F */  lw         $4, -0x6338($gp)
/* AF52C 001AF42C 21104400 */  addu       $2, $2, $4
/* AF530 001AF430 0100013C */  lui        $at, (0x10000 >> 16)
/* AF534 001AF434 21084100 */  addu       $at, $2, $at
/* AF538 001AF438 509C238C */  lw         $3, -0x63B0($at)
/* AF53C 001AF43C FFFF0224 */  addiu      $2, $0, -0x1
/* AF540 001AF440 2A006210 */  beq        $3, $2, .L001AF4EC
/* AF544 001AF444 00000000 */   nop
/* AF548 001AF448 C0100300 */  sll        $2, $3, 3
/* AF54C 001AF44C 23104300 */  subu       $2, $2, $3
/* AF550 001AF450 80100200 */  sll        $2, $2, 2
/* AF554 001AF454 21104300 */  addu       $2, $2, $3
/* AF558 001AF458 00110200 */  sll        $2, $2, 4
/* AF55C 001AF45C 21108200 */  addu       $2, $4, $2
/* AF560 001AF460 90044324 */  addiu      $3, $2, 0x490
/* AF564 001AF464 90007324 */  addiu      $19, $3, 0x90
/* AF568 001AF468 2005428C */  lw         $2, 0x520($2)
/* AF56C 001AF46C 1F004010 */  beqz       $2, .L001AF4EC
/* AF570 001AF470 00000000 */   nop
/* AF574 001AF474 2043023C */  lui        $2, (0x43200000 >> 16)
/* AF578 001AF478 00088244 */  mtc1       $2, $f1
/* AF57C 001AF47C 00009244 */  mtc1       $18, $f0
/* AF580 001AF480 00000000 */  nop
/* AF584 001AF484 20008046 */  cvt.s.w    $f0, $f0
/* AF588 001AF488 02080046 */  mul.s      $f0, $f1, $f0
/* AF58C 001AF48C 9000A0E7 */  swc1       $f0, 0x90($sp)
/* AF590 001AF490 140060C6 */  lwc1       $f0, 0x14($19)
/* AF594 001AF494 9400B427 */  addiu      $20, $sp, 0x94
/* AF598 001AF498 000080E6 */  swc1       $f0, 0x0($20)
/* AF59C 001AF49C 00009144 */  mtc1       $17, $f0
/* AF5A0 001AF4A0 00000000 */  nop
/* AF5A4 001AF4A4 20008046 */  cvt.s.w    $f0, $f0
/* AF5A8 001AF4A8 02080046 */  mul.s      $f0, $f1, $f0
/* AF5AC 001AF4AC 9800B527 */  addiu      $21, $sp, 0x98
/* AF5B0 001AF4B0 0000A0E6 */  swc1       $f0, 0x0($21)
/* AF5B4 001AF4B4 8000A427 */  addiu      $4, $sp, 0x80
/* AF5B8 001AF4B8 9000A527 */  addiu      $5, $sp, 0x90
/* AF5BC 001AF4BC 648D040C */  jal        DistVector__FPfPf
/* AF5C0 001AF4C0 00000000 */   nop
/* AF5C4 001AF4C4 34001446 */  c.lt.s     $f0, $f20
/* AF5C8 001AF4C8 00000000 */  nop
/* AF5CC 001AF4CC 07000045 */  bc1f       .L001AF4EC
/* AF5D0 001AF4D0 00000000 */   nop
/* AF5D4 001AF4D4 28866072 */  paddub     $16, $19, $0
/* AF5D8 001AF4D8 06050046 */  mov.s      $f20, $f0
/* AF5DC 001AF4DC 9000B5C7 */  lwc1       $f21, 0x90($sp)
/* AF5E0 001AF4E0 000096C6 */  lwc1       $f22, 0x0($20)
/* AF5E4 001AF4E4 0000B7C6 */  lwc1       $f23, 0x0($21)
/* AF5E8 001AF4E8 00000000 */  nop
.L001AF4EC:
/* AF5EC 001AF4EC 01005226 */  addiu      $18, $18, 0x1
.L001AF4F0:
/* AF5F0 001AF4F0 1000422A */  slti       $2, $18, 0x10
/* AF5F4 001AF4F4 C7FF4014 */  bnez       $2, .L001AF414
/* AF5F8 001AF4F8 00000000 */   nop
/* AF5FC 001AF4FC 01003126 */  addiu      $17, $17, 0x1
.L001AF500:
/* AF600 001AF500 1000222A */  slti       $2, $17, 0x10
/* AF604 001AF504 C0FF4014 */  bnez       $2, .L001AF408
/* AF608 001AF508 00000000 */   nop
/* AF60C 001AF50C 2043023C */  lui        $2, (0x43200000 >> 16)
/* AF610 001AF510 00008244 */  mtc1       $2, $f0
/* AF614 001AF514 00000000 */  nop
/* AF618 001AF518 34A00046 */  c.lt.s     $f20, $f0
/* AF61C 001AF51C 00000000 */  nop
/* AF620 001AF520 57000045 */  bc1f       .L001AF680
/* AF624 001AF524 00000000 */   nop
/* AF628 001AF528 100000C6 */  lwc1       $f0, 0x10($16)
/* AF62C 001AF52C 00A80046 */  add.s      $f0, $f21, $f0
/* AF630 001AF530 8000A1C7 */  lwc1       $f1, 0x80($sp)
/* AF634 001AF534 34080046 */  c.lt.s     $f1, $f0
/* AF638 001AF538 00000000 */  nop
/* AF63C 001AF53C 50000145 */  bc1t       .L001AF680
/* AF640 001AF540 00000000 */   nop
/* AF644 001AF544 400000C6 */  lwc1       $f0, 0x40($16)
/* AF648 001AF548 00A80046 */  add.s      $f0, $f21, $f0
/* AF64C 001AF54C 34080046 */  c.lt.s     $f1, $f0
/* AF650 001AF550 00000000 */  nop
/* AF654 001AF554 4A000045 */  bc1f       .L001AF680
/* AF658 001AF558 00000000 */   nop
/* AF65C 001AF55C 180000C6 */  lwc1       $f0, 0x18($16)
/* AF660 001AF560 00B80046 */  add.s      $f0, $f23, $f0
/* AF664 001AF564 8800A1C7 */  lwc1       $f1, 0x88($sp)
/* AF668 001AF568 34080046 */  c.lt.s     $f1, $f0
/* AF66C 001AF56C 00000000 */  nop
/* AF670 001AF570 43000145 */  bc1t       .L001AF680
/* AF674 001AF574 00000000 */   nop
/* AF678 001AF578 480000C6 */  lwc1       $f0, 0x48($16)
/* AF67C 001AF57C 00B80046 */  add.s      $f0, $f23, $f0
/* AF680 001AF580 34080046 */  c.lt.s     $f1, $f0
/* AF684 001AF584 00000000 */  nop
/* AF688 001AF588 3D000045 */  bc1f       .L001AF680
/* AF68C 001AF58C 00000000 */   nop
/* AF690 001AF590 8400A227 */  addiu      $2, $sp, 0x84
/* AF694 001AF594 000040C4 */  lwc1       $f0, 0x0($2)
/* AF698 001AF598 34001646 */  c.lt.s     $f0, $f22
/* AF69C 001AF59C 00000000 */  nop
/* AF6A0 001AF5A0 37000045 */  bc1f       .L001AF680
/* AF6A4 001AF5A4 00000000 */   nop
/* AF6A8 001AF5A8 000056E4 */  swc1       $f22, 0x0($2)
/* AF6AC 001AF5AC D501023C */  lui        $2, %hi(D_1D564E0)
/* AF6B0 001AF5B0 E0644424 */  addiu      $4, $2, %lo(D_1D564E0)
/* AF6B4 001AF5B4 8000A527 */  addiu      $5, $sp, 0x80
/* AF6B8 001AF5B8 0C86040C */  jal        sceVu0CopyVector
/* AF6BC 001AF5BC 00000000 */   nop
/* AF6C0 001AF5C0 01000224 */  addiu      $2, $0, 0x1
/* AF6C4 001AF5C4 DC01013C */  lui        $at, (0x1DC4514 >> 16)
/* AF6C8 001AF5C8 144522A4 */  sh         $2, (0x1DC4514 & 0xFFFF)($at)
/* AF6CC 001AF5CC 149D828F */  lw         $2, -0x62EC($gp)
/* AF6D0 001AF5D0 26004014 */  bnez       $2, .L001AF66C
/* AF6D4 001AF5D4 00000000 */   nop
/* AF6D8 001AF5D8 D501013C */  lui        $at, (0x1D564F0 >> 16)
/* AF6DC 001AF5DC F064228C */  lw         $2, (0x1D564F0 & 0xFFFF)($at)
/* AF6E0 001AF5E0 22004014 */  bnez       $2, .L001AF66C
/* AF6E4 001AF5E4 00000000 */   nop
/* AF6E8 001AF5E8 D501013C */  lui        $at, (0x1D564D4 >> 16)
/* AF6EC 001AF5EC D46421C4 */  lwc1       $f1, (0x1D564D4 & 0xFFFF)($at)
/* AF6F0 001AF5F0 D501013C */  lui        $at, (0x1D564E4 >> 16)
/* AF6F4 001AF5F4 E46420C4 */  lwc1       $f0, (0x1D564E4 & 0xFFFF)($at)
/* AF6F8 001AF5F8 41080046 */  sub.s      $f1, $f1, $f0
/* AF6FC 001AF5FC 003F023C */  lui        $2, (0x3F000000 >> 16)
/* AF700 001AF600 00008244 */  mtc1       $2, $f0
/* AF704 001AF604 00000000 */  nop
/* AF708 001AF608 36080046 */  c.le.s     $f1, $f0
/* AF70C 001AF60C 00000000 */  nop
/* AF710 001AF610 16000145 */  bc1t       .L001AF66C
/* AF714 001AF614 00000000 */   nop
/* AF718 001AF618 EB01023C */  lui        $2, %hi(D_1EB0020)
/* AF71C 001AF61C 20004424 */  addiu      $4, $2, %lo(D_1EB0020)
/* AF720 001AF620 D501023C */  lui        $2, %hi(D_1D564E0)
/* AF724 001AF624 E0644524 */  addiu      $5, $2, %lo(D_1D564E0)
/* AF728 001AF628 38E4040C */  jal        SetPosition__10CCharacterFPf
/* AF72C 001AF62C 00000000 */   nop
/* AF730 001AF630 EB01013C */  lui        $at, (0x1EB0C88 >> 16)
/* AF734 001AF634 880C20AC */  sw         $0, (0x1EB0C88 & 0xFFFF)($at)
/* AF738 001AF638 06000224 */  addiu      $2, $0, 0x6
/* AF73C 001AF63C EB01013C */  lui        $at, (0x1EB0C84 >> 16)
/* AF740 001AF640 840C22AC */  sw         $2, (0x1EB0C84 & 0xFFFF)($at)
/* AF744 001AF644 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* AF748 001AF648 EB01013C */  lui        $at, (0x1EB0C80 >> 16)
/* AF74C 001AF64C 800C22AC */  sw         $2, (0x1EB0C80 & 0xFFFF)($at)
/* AF750 001AF650 23020424 */  addiu      $4, $0, 0x223
/* AF754 001AF654 FFFF0524 */  addiu      $5, $0, -0x1
/* AF758 001AF658 28360070 */  paddub     $6, $0, $0
/* AF75C 001AF65C AC69050C */  jal        SndSePlay__Fiii
/* AF760 001AF660 00000000 */   nop
/* AF764 001AF664 01000224 */  addiu      $2, $0, 0x1
/* AF768 001AF668 149D82AF */  sw         $2, -0x62EC($gp)
.L001AF66C:
/* AF76C 001AF66C 01000224 */  addiu      $2, $0, 0x1
/* AF770 001AF670 D501013C */  lui        $at, (0x1D564F0 >> 16)
/* AF774 001AF674 F06422AC */  sw         $2, (0x1D564F0 & 0xFFFF)($at)
/* AF778 001AF678 09000010 */  b          .L001AF6A0
/* AF77C 001AF67C 00000000 */   nop
.L001AF680:
/* AF780 001AF680 D501023C */  lui        $2, %hi(CheckWaterInfo)
/* AF784 001AF684 D0644424 */  addiu      $4, $2, %lo(CheckWaterInfo)
/* AF788 001AF688 8000A527 */  addiu      $5, $sp, 0x80
/* AF78C 001AF68C 0C86040C */  jal        sceVu0CopyVector
/* AF790 001AF690 00000000 */   nop
/* AF794 001AF694 D501013C */  lui        $at, (0x1D564F0 >> 16)
/* AF798 001AF698 F06420AC */  sw         $0, (0x1D564F0 & 0xFFFF)($at)
/* AF79C 001AF69C 28160070 */  paddub     $2, $0, $0
.L001AF6A0:
/* AF7A0 001AF6A0 7000BF7B */  lq         $31, 0x70($sp)
/* AF7A4 001AF6A4 6000B57B */  lq         $21, 0x60($sp)
/* AF7A8 001AF6A8 5000B47B */  lq         $20, 0x50($sp)
/* AF7AC 001AF6AC 4000B37B */  lq         $19, 0x40($sp)
/* AF7B0 001AF6B0 3000B27B */  lq         $18, 0x30($sp)
/* AF7B4 001AF6B4 2000B17B */  lq         $17, 0x20($sp)
/* AF7B8 001AF6B8 1000B07B */  lq         $16, 0x10($sp)
/* AF7BC 001AF6BC 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* AF7C0 001AF6C0 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* AF7C4 001AF6C4 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* AF7C8 001AF6C8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* AF7CC 001AF6CC A000BD27 */  addiu      $sp, $sp, 0xA0
/* AF7D0 001AF6D0 0800E003 */  jr         $31
/* AF7D4 001AF6D4 00000000 */   nop
/* AF7D8 001AF6D8 00000000 */  nop
/* AF7DC 001AF6DC 00000000 */  nop
