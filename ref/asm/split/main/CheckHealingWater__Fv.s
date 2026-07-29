.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckHealingWater__Fv
/* 0AF4B0 001AF3B0 60FFBD27 */  addiu       $29, $29, -0xA0
/* 0AF4B4 001AF3B4 7000BF7F */  sq          $31, 0x70($29)
/* 0AF4B8 001AF3B8 6000B57F */  sq          $21, 0x60($29)
/* 0AF4BC 001AF3BC 5000B47F */  sq          $20, 0x50($29)
/* 0AF4C0 001AF3C0 4000B37F */  sq          $19, 0x40($29)
/* 0AF4C4 001AF3C4 3000B27F */  sq          $18, 0x30($29)
/* 0AF4C8 001AF3C8 2000B17F */  sq          $17, 0x20($29)
/* 0AF4CC 001AF3CC 1000B07F */  sq          $16, 0x10($29)
/* 0AF4D0 001AF3D0 0C00B7E7 */  swc1        $f23, 0xC($29)
/* 0AF4D4 001AF3D4 0800B6E7 */  swc1        $f22, 0x8($29)
/* 0AF4D8 001AF3D8 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0AF4DC 001AF3DC 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0AF4E0 001AF3E0 2043023C */  lui         $2, (0x43200000 >> 16)
/* 0AF4E4 001AF3E4 00A08244 */  mtc1        $2, $f20
/* 0AF4E8 001AF3E8 8000A427 */  addiu       $4, $29, 0x80
/* 0AF4EC 001AF3EC EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0AF4F0 001AF3F0 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0AF4F4 001AF3F4 0C86040C */  jal         sceVu0CopyVector
/* 0AF4F8 001AF3F8 00000000 */   nop
/* 0AF4FC 001AF3FC 288E0070 */  paddub      $17, $0, $0
/* 0AF500 001AF400 3F000010 */  b           .L001AF500
/* 0AF504 001AF404 00000000 */   nop
.L001AF408:
/* 0AF508 001AF408 28960070 */  paddub      $18, $0, $0
/* 0AF50C 001AF40C 38000010 */  b           .L001AF4F0
/* 0AF510 001AF410 00000000 */   nop
.L001AF414:
/* 0AF514 001AF414 80101100 */  sll         $2, $17, 2
/* 0AF518 001AF418 21105100 */  addu        $2, $2, $17
/* 0AF51C 001AF41C 80100200 */  sll         $2, $2, 2
/* 0AF520 001AF420 21104202 */  addu        $2, $18, $2
/* 0AF524 001AF424 00110200 */  sll         $2, $2, 4
/* 0AF528 001AF428 C89C848F */  lw          $4, -0x6338($28)
/* 0AF52C 001AF42C 21104400 */  addu        $2, $2, $4
/* 0AF530 001AF430 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AF534 001AF434 21084100 */  addu        $1, $2, $1
/* 0AF538 001AF438 509C238C */  lw          $3, -0x63B0($1)
/* 0AF53C 001AF43C FFFF0224 */  addiu       $2, $0, -0x1
/* 0AF540 001AF440 2A006210 */  beq         $3, $2, .L001AF4EC
/* 0AF544 001AF444 00000000 */   nop
/* 0AF548 001AF448 C0100300 */  sll         $2, $3, 3
/* 0AF54C 001AF44C 23104300 */  subu        $2, $2, $3
/* 0AF550 001AF450 80100200 */  sll         $2, $2, 2
/* 0AF554 001AF454 21104300 */  addu        $2, $2, $3
/* 0AF558 001AF458 00110200 */  sll         $2, $2, 4
/* 0AF55C 001AF45C 21108200 */  addu        $2, $4, $2
/* 0AF560 001AF460 90044324 */  addiu       $3, $2, 0x490
/* 0AF564 001AF464 90007324 */  addiu       $19, $3, 0x90
/* 0AF568 001AF468 2005428C */  lw          $2, 0x520($2)
/* 0AF56C 001AF46C 1F004010 */  beqz        $2, .L001AF4EC
/* 0AF570 001AF470 00000000 */   nop
/* 0AF574 001AF474 2043023C */  lui         $2, (0x43200000 >> 16)
/* 0AF578 001AF478 00088244 */  mtc1        $2, $f1
/* 0AF57C 001AF47C 00009244 */  mtc1        $18, $f0
/* 0AF580 001AF480 00000000 */  nop
/* 0AF584 001AF484 20008046 */  cvt.s.w     $f0, $f0
/* 0AF588 001AF488 02080046 */  mul.s       $f0, $f1, $f0
/* 0AF58C 001AF48C 9000A0E7 */  swc1        $f0, 0x90($29)
/* 0AF590 001AF490 140060C6 */  lwc1        $f0, 0x14($19)
/* 0AF594 001AF494 9400B427 */  addiu       $20, $29, 0x94
/* 0AF598 001AF498 000080E6 */  swc1        $f0, 0x0($20)
/* 0AF59C 001AF49C 00009144 */  mtc1        $17, $f0
/* 0AF5A0 001AF4A0 00000000 */  nop
/* 0AF5A4 001AF4A4 20008046 */  cvt.s.w     $f0, $f0
/* 0AF5A8 001AF4A8 02080046 */  mul.s       $f0, $f1, $f0
/* 0AF5AC 001AF4AC 9800B527 */  addiu       $21, $29, 0x98
/* 0AF5B0 001AF4B0 0000A0E6 */  swc1        $f0, 0x0($21)
/* 0AF5B4 001AF4B4 8000A427 */  addiu       $4, $29, 0x80
/* 0AF5B8 001AF4B8 9000A527 */  addiu       $5, $29, 0x90
/* 0AF5BC 001AF4BC 648D040C */  jal         DistVector__FPfPf
/* 0AF5C0 001AF4C0 00000000 */   nop
/* 0AF5C4 001AF4C4 34001446 */  c.lt.s      $f0, $f20
/* 0AF5C8 001AF4C8 00000000 */  nop
/* 0AF5CC 001AF4CC 07000045 */  bc1f        .L001AF4EC
/* 0AF5D0 001AF4D0 00000000 */   nop
/* 0AF5D4 001AF4D4 28866072 */  paddub      $16, $19, $0
/* 0AF5D8 001AF4D8 06050046 */  mov.s       $f20, $f0
/* 0AF5DC 001AF4DC 9000B5C7 */  lwc1        $f21, 0x90($29)
/* 0AF5E0 001AF4E0 000096C6 */  lwc1        $f22, 0x0($20)
/* 0AF5E4 001AF4E4 0000B7C6 */  lwc1        $f23, 0x0($21)
/* 0AF5E8 001AF4E8 00000000 */  nop
.L001AF4EC:
/* 0AF5EC 001AF4EC 01005226 */  addiu       $18, $18, 0x1
.L001AF4F0:
/* 0AF5F0 001AF4F0 1000422A */  slti        $2, $18, 0x10
/* 0AF5F4 001AF4F4 C7FF4014 */  bnez        $2, .L001AF414
/* 0AF5F8 001AF4F8 00000000 */   nop
/* 0AF5FC 001AF4FC 01003126 */  addiu       $17, $17, 0x1
.L001AF500:
/* 0AF600 001AF500 1000222A */  slti        $2, $17, 0x10
/* 0AF604 001AF504 C0FF4014 */  bnez        $2, .L001AF408
/* 0AF608 001AF508 00000000 */   nop
/* 0AF60C 001AF50C 2043023C */  lui         $2, (0x43200000 >> 16)
/* 0AF610 001AF510 00008244 */  mtc1        $2, $f0
/* 0AF614 001AF514 00000000 */  nop
/* 0AF618 001AF518 34A00046 */  c.lt.s      $f20, $f0
/* 0AF61C 001AF51C 00000000 */  nop
/* 0AF620 001AF520 57000045 */  bc1f        .L001AF680
/* 0AF624 001AF524 00000000 */   nop
/* 0AF628 001AF528 100000C6 */  lwc1        $f0, 0x10($16)
/* 0AF62C 001AF52C 00A80046 */  add.s       $f0, $f21, $f0
/* 0AF630 001AF530 8000A1C7 */  lwc1        $f1, 0x80($29)
/* 0AF634 001AF534 34080046 */  c.lt.s      $f1, $f0
/* 0AF638 001AF538 00000000 */  nop
/* 0AF63C 001AF53C 50000145 */  bc1t        .L001AF680
/* 0AF640 001AF540 00000000 */   nop
/* 0AF644 001AF544 400000C6 */  lwc1        $f0, 0x40($16)
/* 0AF648 001AF548 00A80046 */  add.s       $f0, $f21, $f0
/* 0AF64C 001AF54C 34080046 */  c.lt.s      $f1, $f0
/* 0AF650 001AF550 00000000 */  nop
/* 0AF654 001AF554 4A000045 */  bc1f        .L001AF680
/* 0AF658 001AF558 00000000 */   nop
/* 0AF65C 001AF55C 180000C6 */  lwc1        $f0, 0x18($16)
/* 0AF660 001AF560 00B80046 */  add.s       $f0, $f23, $f0
/* 0AF664 001AF564 8800A1C7 */  lwc1        $f1, 0x88($29)
/* 0AF668 001AF568 34080046 */  c.lt.s      $f1, $f0
/* 0AF66C 001AF56C 00000000 */  nop
/* 0AF670 001AF570 43000145 */  bc1t        .L001AF680
/* 0AF674 001AF574 00000000 */   nop
/* 0AF678 001AF578 480000C6 */  lwc1        $f0, 0x48($16)
/* 0AF67C 001AF57C 00B80046 */  add.s       $f0, $f23, $f0
/* 0AF680 001AF580 34080046 */  c.lt.s      $f1, $f0
/* 0AF684 001AF584 00000000 */  nop
/* 0AF688 001AF588 3D000045 */  bc1f        .L001AF680
/* 0AF68C 001AF58C 00000000 */   nop
/* 0AF690 001AF590 8400A227 */  addiu       $2, $29, 0x84
/* 0AF694 001AF594 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AF698 001AF598 34001646 */  c.lt.s      $f0, $f22
/* 0AF69C 001AF59C 00000000 */  nop
/* 0AF6A0 001AF5A0 37000045 */  bc1f        .L001AF680
/* 0AF6A4 001AF5A4 00000000 */   nop
/* 0AF6A8 001AF5A8 000056E4 */  swc1        $f22, 0x0($2)
/* 0AF6AC 001AF5AC D501023C */  lui         $2, %hi(CheckWaterInfo + 0x10)
/* 0AF6B0 001AF5B0 E0644424 */  addiu       $4, $2, %lo(CheckWaterInfo + 0x10)
/* 0AF6B4 001AF5B4 8000A527 */  addiu       $5, $29, 0x80
/* 0AF6B8 001AF5B8 0C86040C */  jal         sceVu0CopyVector
/* 0AF6BC 001AF5BC 00000000 */   nop
/* 0AF6C0 001AF5C0 01000224 */  addiu       $2, $0, 0x1
/* 0AF6C4 001AF5C4 DC01013C */  lui         $1, %hi(BtActStatus + 0x94)
/* 0AF6C8 001AF5C8 144522A4 */  sh          $2, %lo(BtActStatus + 0x94)($1)
/* 0AF6CC 001AF5CC 149D828F */  lw          $2, -0x62EC($28)
/* 0AF6D0 001AF5D0 26004014 */  bnez        $2, .L001AF66C
/* 0AF6D4 001AF5D4 00000000 */   nop
/* 0AF6D8 001AF5D8 D501013C */  lui         $1, %hi(CheckWaterInfo + 0x20)
/* 0AF6DC 001AF5DC F064228C */  lw          $2, %lo(CheckWaterInfo + 0x20)($1)
/* 0AF6E0 001AF5E0 22004014 */  bnez        $2, .L001AF66C
/* 0AF6E4 001AF5E4 00000000 */   nop
/* 0AF6E8 001AF5E8 D501013C */  lui         $1, %hi(CheckWaterInfo + 0x4)
/* 0AF6EC 001AF5EC D46421C4 */  lwc1        $f1, %lo(CheckWaterInfo + 0x4)($1)
/* 0AF6F0 001AF5F0 D501013C */  lui         $1, %hi(CheckWaterInfo + 0x14)
/* 0AF6F4 001AF5F4 E46420C4 */  lwc1        $f0, %lo(CheckWaterInfo + 0x14)($1)
/* 0AF6F8 001AF5F8 41080046 */  sub.s       $f1, $f1, $f0
/* 0AF6FC 001AF5FC 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 0AF700 001AF600 00008244 */  mtc1        $2, $f0
/* 0AF704 001AF604 00000000 */  nop
/* 0AF708 001AF608 36080046 */  c.le.s      $f1, $f0
/* 0AF70C 001AF60C 00000000 */  nop
/* 0AF710 001AF610 16000145 */  bc1t        .L001AF66C
/* 0AF714 001AF614 00000000 */   nop
/* 0AF718 001AF618 EB01023C */  lui         $2, %hi(Water_Splash)
/* 0AF71C 001AF61C 20004424 */  addiu       $4, $2, %lo(Water_Splash)
/* 0AF720 001AF620 D501023C */  lui         $2, %hi(CheckWaterInfo + 0x10)
/* 0AF724 001AF624 E0644524 */  addiu       $5, $2, %lo(CheckWaterInfo + 0x10)
/* 0AF728 001AF628 38E4040C */  jal         SetPosition__10CCharacterFPf
/* 0AF72C 001AF62C 00000000 */   nop
/* 0AF730 001AF630 EB01013C */  lui         $1, %hi(Water_Splash + 0xC68)
/* 0AF734 001AF634 880C20AC */  sw          $0, %lo(Water_Splash + 0xC68)($1)
/* 0AF738 001AF638 06000224 */  addiu       $2, $0, 0x6
/* 0AF73C 001AF63C EB01013C */  lui         $1, %hi(Water_Splash + 0xC64)
/* 0AF740 001AF640 840C22AC */  sw          $2, %lo(Water_Splash + 0xC64)($1)
/* 0AF744 001AF644 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0AF748 001AF648 EB01013C */  lui         $1, %hi(Water_Splash + 0xC60)
/* 0AF74C 001AF64C 800C22AC */  sw          $2, %lo(Water_Splash + 0xC60)($1)
/* 0AF750 001AF650 23020424 */  addiu       $4, $0, 0x223
/* 0AF754 001AF654 FFFF0524 */  addiu       $5, $0, -0x1
/* 0AF758 001AF658 28360070 */  paddub      $6, $0, $0
/* 0AF75C 001AF65C AC69050C */  jal         SndSePlay__Fiii
/* 0AF760 001AF660 00000000 */   nop
/* 0AF764 001AF664 01000224 */  addiu       $2, $0, 0x1
/* 0AF768 001AF668 149D82AF */  sw          $2, -0x62EC($28)
.L001AF66C:
/* 0AF76C 001AF66C 01000224 */  addiu       $2, $0, 0x1
/* 0AF770 001AF670 D501013C */  lui         $1, %hi(CheckWaterInfo + 0x20)
/* 0AF774 001AF674 F06422AC */  sw          $2, %lo(CheckWaterInfo + 0x20)($1)
/* 0AF778 001AF678 09000010 */  b           .L001AF6A0
/* 0AF77C 001AF67C 00000000 */   nop
.L001AF680:
/* 0AF780 001AF680 D501023C */  lui         $2, %hi(CheckWaterInfo)
/* 0AF784 001AF684 D0644424 */  addiu       $4, $2, %lo(CheckWaterInfo)
/* 0AF788 001AF688 8000A527 */  addiu       $5, $29, 0x80
/* 0AF78C 001AF68C 0C86040C */  jal         sceVu0CopyVector
/* 0AF790 001AF690 00000000 */   nop
/* 0AF794 001AF694 D501013C */  lui         $1, %hi(CheckWaterInfo + 0x20)
/* 0AF798 001AF698 F06420AC */  sw          $0, %lo(CheckWaterInfo + 0x20)($1)
/* 0AF79C 001AF69C 28160070 */  paddub      $2, $0, $0
.L001AF6A0:
/* 0AF7A0 001AF6A0 7000BF7B */  lq          $31, 0x70($29)
/* 0AF7A4 001AF6A4 6000B57B */  lq          $21, 0x60($29)
/* 0AF7A8 001AF6A8 5000B47B */  lq          $20, 0x50($29)
/* 0AF7AC 001AF6AC 4000B37B */  lq          $19, 0x40($29)
/* 0AF7B0 001AF6B0 3000B27B */  lq          $18, 0x30($29)
/* 0AF7B4 001AF6B4 2000B17B */  lq          $17, 0x20($29)
/* 0AF7B8 001AF6B8 1000B07B */  lq          $16, 0x10($29)
/* 0AF7BC 001AF6BC 0C00B7C7 */  lwc1        $f23, 0xC($29)
/* 0AF7C0 001AF6C0 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 0AF7C4 001AF6C4 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0AF7C8 001AF6C8 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0AF7CC 001AF6CC A000BD27 */  addiu       $29, $29, 0xA0
/* 0AF7D0 001AF6D0 0800E003 */  jr          $31
/* 0AF7D4 001AF6D4 00000000 */   nop
/* 0AF7D8 001AF6D8 00000000 */  nop
/* 0AF7DC 001AF6DC 00000000 */  nop
