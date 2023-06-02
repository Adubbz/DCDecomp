.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishLineStep__FPfPf
/* AA440 001AA340 F0FEBD27 */  addiu      $sp, $sp, -0x110
/* AA444 001AA344 7000BF7F */  sq         $31, 0x70($sp)
/* AA448 001AA348 6000B57F */  sq         $21, 0x60($sp)
/* AA44C 001AA34C 5000B47F */  sq         $20, 0x50($sp)
/* AA450 001AA350 4000B37F */  sq         $19, 0x40($sp)
/* AA454 001AA354 3000B27F */  sq         $18, 0x30($sp)
/* AA458 001AA358 2000B17F */  sq         $17, 0x20($sp)
/* AA45C 001AA35C 1000B07F */  sq         $16, 0x10($sp)
/* AA460 001AA360 0800B6E7 */  swc1       $f22, 0x8($sp)
/* AA464 001AA364 0400B5E7 */  swc1       $f21, 0x4($sp)
/* AA468 001AA368 0000B4E7 */  swc1       $f20, 0x0($sp)
/* AA46C 001AA36C 28868070 */  paddub     $16, $4, $0
/* AA470 001AA370 7893828F */  lw         $2, -0x6C88($gp)
/* AA474 001AA374 75004010 */  beqz       $2, .L001AA54C
/* AA478 001AA378 00000000 */   nop
/* AA47C 001AA37C 8000A427 */  addiu      $4, $sp, 0x80
/* AA480 001AA380 D501023C */  lui        $2, %hi(D_1D55FA0)
/* AA484 001AA384 A05F4524 */  addiu      $5, $2, %lo(D_1D55FA0)
/* AA488 001AA388 0C86040C */  jal        sceVu0CopyVector
/* AA48C 001AA38C 00000000 */   nop
/* AA490 001AA390 9000A427 */  addiu      $4, $sp, 0x90
/* AA494 001AA394 D501023C */  lui        $2, %hi(D_1D55FA0)
/* AA498 001AA398 A05F4524 */  addiu      $5, $2, %lo(D_1D55FA0)
/* AA49C 001AA39C 0C86040C */  jal        sceVu0CopyVector
/* AA4A0 001AA3A0 00000000 */   nop
/* AA4A4 001AA3A4 8400A0C7 */  lwc1       $f0, 0x84($sp)
/* AA4A8 001AA3A8 2042023C */  lui        $2, (0x42200000 >> 16)
/* AA4AC 001AA3AC 00088244 */  mtc1       $2, $f1
/* AA4B0 001AA3B0 00000000 */  nop
/* AA4B4 001AA3B4 00000146 */  add.s      $f0, $f0, $f1
/* AA4B8 001AA3B8 8400A0E7 */  swc1       $f0, 0x84($sp)
/* AA4BC 001AA3BC 9400A0C7 */  lwc1       $f0, 0x94($sp)
/* AA4C0 001AA3C0 01000146 */  sub.s      $f0, $f0, $f1
/* AA4C4 001AA3C4 9400A0E7 */  swc1       $f0, 0x94($sp)
/* AA4C8 001AA3C8 7893848F */  lw         $4, -0x6C88($gp)
/* AA4CC 001AA3CC 7C93858F */  lw         $5, -0x6C84($gp)
/* AA4D0 001AA3D0 8000A627 */  addiu      $6, $sp, 0x80
/* AA4D4 001AA3D4 9000A727 */  addiu      $7, $sp, 0x90
/* AA4D8 001AA3D8 C000A827 */  addiu      $8, $sp, 0xC0
/* AA4DC 001AA3DC 01000924 */  addiu      $9, $0, 0x1
/* AA4E0 001AA3E0 28560070 */  paddub     $10, $0, $0
/* AA4E4 001AA3E4 5427050C */  jal        CheckHit__FP6CCPolyiPfPfPfii
/* AA4E8 001AA3E8 00000000 */   nop
/* AA4EC 001AA3EC 1C004004 */  bltz       $2, .L001AA460
/* AA4F0 001AA3F0 00000000 */   nop
/* AA4F4 001AA3F4 80180200 */  sll        $3, $2, 2
/* AA4F8 001AA3F8 21106200 */  addu       $2, $3, $2
/* AA4FC 001AA3FC 00190200 */  sll        $3, $2, 4
/* AA500 001AA400 7893828F */  lw         $2, -0x6C88($gp)
/* AA504 001AA404 21104300 */  addu       $2, $2, $3
/* AA508 001AA408 D000A427 */  addiu      $4, $sp, 0xD0
/* AA50C 001AA40C 30004524 */  addiu      $5, $2, 0x30
/* AA510 001AA410 9285040C */  jal        sceVu0Normalize
/* AA514 001AA414 00000000 */   nop
/* AA518 001AA418 D400A2C7 */  lwc1       $f2, 0xD4($sp)
/* AA51C 001AA41C 00008044 */  mtc1       $0, $f0
/* AA520 001AA420 00000000 */  nop
/* AA524 001AA424 34100046 */  c.lt.s     $f2, $f0
/* AA528 001AA428 00000000 */  nop
/* AA52C 001AA42C 04000045 */  bc1f       .L001AA440
/* AA530 001AA430 00000000 */   nop
/* AA534 001AA434 87100046 */  neg.s      $f2, $f2
/* AA538 001AA438 01000010 */  b          .L001AA440
/* AA53C 001AA43C 00000000 */   nop
.L001AA440:
/* AA540 001AA440 748281C7 */  lwc1       $f1, -0x7D8C($gp)
/* AA544 001AA444 36100146 */  c.le.s     $f2, $f1
/* AA548 001AA448 00000000 */  nop
/* AA54C 001AA44C 04000145 */  bc1t       .L001AA460
/* AA550 001AA450 00000000 */   nop
/* AA554 001AA454 C400A0C7 */  lwc1       $f0, 0xC4($sp)
/* AA558 001AA458 00080046 */  add.s      $f0, $f1, $f0
/* AA55C 001AA45C 449380E7 */  swc1       $f0, -0x6CBC($gp)
.L001AA460:
/* AA560 001AA460 A000A427 */  addiu      $4, $sp, 0xA0
/* AA564 001AA464 D501023C */  lui        $2, %hi(D_1D55F50)
/* AA568 001AA468 505F4524 */  addiu      $5, $2, %lo(D_1D55F50)
/* AA56C 001AA46C 0C86040C */  jal        sceVu0CopyVector
/* AA570 001AA470 00000000 */   nop
/* AA574 001AA474 B000A427 */  addiu      $4, $sp, 0xB0
/* AA578 001AA478 D501023C */  lui        $2, %hi(D_1D55F50)
/* AA57C 001AA47C 505F4524 */  addiu      $5, $2, %lo(D_1D55F50)
/* AA580 001AA480 0C86040C */  jal        sceVu0CopyVector
/* AA584 001AA484 00000000 */   nop
/* AA588 001AA488 A400A0C7 */  lwc1       $f0, 0xA4($sp)
/* AA58C 001AA48C 2042023C */  lui        $2, (0x42200000 >> 16)
/* AA590 001AA490 00088244 */  mtc1       $2, $f1
/* AA594 001AA494 00000000 */  nop
/* AA598 001AA498 00000146 */  add.s      $f0, $f0, $f1
/* AA59C 001AA49C A400A0E7 */  swc1       $f0, 0xA4($sp)
/* AA5A0 001AA4A0 B400A0C7 */  lwc1       $f0, 0xB4($sp)
/* AA5A4 001AA4A4 01000146 */  sub.s      $f0, $f0, $f1
/* AA5A8 001AA4A8 B400A0E7 */  swc1       $f0, 0xB4($sp)
/* AA5AC 001AA4AC 7893848F */  lw         $4, -0x6C88($gp)
/* AA5B0 001AA4B0 7C93858F */  lw         $5, -0x6C84($gp)
/* AA5B4 001AA4B4 A000A627 */  addiu      $6, $sp, 0xA0
/* AA5B8 001AA4B8 B000A727 */  addiu      $7, $sp, 0xB0
/* AA5BC 001AA4BC C000A827 */  addiu      $8, $sp, 0xC0
/* AA5C0 001AA4C0 01000924 */  addiu      $9, $0, 0x1
/* AA5C4 001AA4C4 28560070 */  paddub     $10, $0, $0
/* AA5C8 001AA4C8 5427050C */  jal        CheckHit__FP6CCPolyiPfPfPfii
/* AA5CC 001AA4CC 00000000 */   nop
/* AA5D0 001AA4D0 1E004004 */  bltz       $2, .L001AA54C
/* AA5D4 001AA4D4 00000000 */   nop
/* AA5D8 001AA4D8 80180200 */  sll        $3, $2, 2
/* AA5DC 001AA4DC 21106200 */  addu       $2, $3, $2
/* AA5E0 001AA4E0 00190200 */  sll        $3, $2, 4
/* AA5E4 001AA4E4 7893828F */  lw         $2, -0x6C88($gp)
/* AA5E8 001AA4E8 21104300 */  addu       $2, $2, $3
/* AA5EC 001AA4EC D000A427 */  addiu      $4, $sp, 0xD0
/* AA5F0 001AA4F0 30004524 */  addiu      $5, $2, 0x30
/* AA5F4 001AA4F4 9285040C */  jal        sceVu0Normalize
/* AA5F8 001AA4F8 00000000 */   nop
/* AA5FC 001AA4FC D400A1C7 */  lwc1       $f1, 0xD4($sp)
/* AA600 001AA500 00008044 */  mtc1       $0, $f0
/* AA604 001AA504 00000000 */  nop
/* AA608 001AA508 34080046 */  c.lt.s     $f1, $f0
/* AA60C 001AA50C 00000000 */  nop
/* AA610 001AA510 04000045 */  bc1f       .L001AA524
/* AA614 001AA514 00000000 */   nop
/* AA618 001AA518 47080046 */  neg.s      $f1, $f1
/* AA61C 001AA51C 01000010 */  b          .L001AA524
/* AA620 001AA520 00000000 */   nop
.L001AA524:
/* AA624 001AA524 748280C7 */  lwc1       $f0, -0x7D8C($gp)
/* AA628 001AA528 36080046 */  c.le.s     $f1, $f0
/* AA62C 001AA52C 00000000 */  nop
/* AA630 001AA530 06000145 */  bc1t       .L001AA54C
/* AA634 001AA534 00000000 */   nop
/* AA638 001AA538 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AA63C 001AA53C 00088244 */  mtc1       $2, $f1
/* AA640 001AA540 C400A0C7 */  lwc1       $f0, 0xC4($sp)
/* AA644 001AA544 00080046 */  add.s      $f0, $f1, $f0
/* AA648 001AA548 409380E7 */  swc1       $f0, -0x6CC0($gp)
.L001AA54C:
/* AA64C 001AA54C 409380C7 */  lwc1       $f0, -0x6CC0($gp)
/* AA650 001AA550 449381C7 */  lwc1       $f1, -0x6CBC($gp)
/* AA654 001AA554 34000146 */  c.lt.s     $f0, $f1
/* AA658 001AA558 00000000 */  nop
/* AA65C 001AA55C 04000045 */  bc1f       .L001AA570
/* AA660 001AA560 00000000 */   nop
/* AA664 001AA564 489380E7 */  swc1       $f0, -0x6CB8($gp)
/* AA668 001AA568 02000010 */  b          .L001AA574
/* AA66C 001AA56C 00000000 */   nop
.L001AA570:
/* AA670 001AA570 489381E7 */  swc1       $f1, -0x6CB8($gp)
.L001AA574:
/* AA674 001AA574 389394C7 */  lwc1       $f20, -0x6CC8($gp)
/* AA678 001AA578 D501023C */  lui        $2, %hi(rod_top)
/* AA67C 001AA57C 30644424 */  addiu      $4, $2, %lo(rod_top)
/* AA680 001AA580 282E0072 */  paddub     $5, $16, $0
/* AA684 001AA584 0C86040C */  jal        sceVu0CopyVector
/* AA688 001AA588 00000000 */   nop
/* AA68C 001AA58C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* AA690 001AA590 D501013C */  lui        $at, (0x1D5643C >> 16)
/* AA694 001AA594 3C6423AC */  sw         $3, (0x1D5643C & 0xFFFF)($at)
/* AA698 001AA598 D501013C */  lui        $at, (0x1D5644C >> 16)
/* AA69C 001AA59C 4C6423AC */  sw         $3, (0x1D5644C & 0xFFFF)($at)
/* AA6A0 001AA5A0 28860070 */  paddub     $16, $0, $0
/* AA6A4 001AA5A4 17000010 */  b          .L001AA604
/* AA6A8 001AA5A8 00000000 */   nop
.L001AA5AC:
/* AA6AC 001AA5AC 00191000 */  sll        $3, $16, 4
/* AA6B0 001AA5B0 D501023C */  lui        $2, %hi(D_1D56134)
/* AA6B4 001AA5B4 34614224 */  addiu      $2, $2, %lo(D_1D56134)
/* AA6B8 001AA5B8 21104300 */  addu       $2, $2, $3
/* AA6BC 001AA5BC 000041C4 */  lwc1       $f1, 0x0($2)
/* AA6C0 001AA5C0 788280C7 */  lwc1       $f0, -0x7D88($gp)
/* AA6C4 001AA5C4 00080046 */  add.s      $f0, $f1, $f0
/* AA6C8 001AA5C8 000040E4 */  swc1       $f0, 0x0($2)
/* AA6CC 001AA5CC D501023C */  lui        $2, %hi(D_1D5613C)
/* AA6D0 001AA5D0 3C614224 */  addiu      $2, $2, %lo(D_1D5613C)
/* AA6D4 001AA5D4 21104300 */  addu       $2, $2, $3
/* AA6D8 001AA5D8 000040AC */  sw         $0, 0x0($2)
/* AA6DC 001AA5DC D501023C */  lui        $2, %hi(point)
/* AA6E0 001AA5E0 305E4224 */  addiu      $2, $2, %lo(point)
/* AA6E4 001AA5E4 21204300 */  addu       $4, $2, $3
/* AA6E8 001AA5E8 D501023C */  lui        $2, %hi(velo)
/* AA6EC 001AA5EC 30614224 */  addiu      $2, $2, %lo(velo)
/* AA6F0 001AA5F0 21304300 */  addu       $6, $2, $3
/* AA6F4 001AA5F4 282E8070 */  paddub     $5, $4, $0
/* AA6F8 001AA5F8 E885040C */  jal        sceVu0AddVector
/* AA6FC 001AA5FC 00000000 */   nop
/* AA700 001AA600 01001026 */  addiu      $16, $16, 0x1
.L001AA604:
/* AA704 001AA604 1800032A */  slti       $3, $16, 0x18
/* AA708 001AA608 E8FF6014 */  bnez       $3, .L001AA5AC
/* AA70C 001AA60C 00000000 */   nop
/* AA710 001AA610 889395C7 */  lwc1       $f21, -0x6C78($gp)
/* AA714 001AA614 D501013C */  lui        $at, (0x1D55FA4 >> 16)
/* AA718 001AA618 A45F20C4 */  lwc1       $f0, (0x1D55FA4 & 0xFFFF)($at)
/* AA71C 001AA61C 00001546 */  add.s      $f0, $f0, $f21
/* AA720 001AA620 D501013C */  lui        $at, (0x1D55FA4 >> 16)
/* AA724 001AA624 A45F20E4 */  swc1       $f0, (0x1D55FA4 & 0xFFFF)($at)
/* AA728 001AA628 28860070 */  paddub     $16, $0, $0
/* AA72C 001AA62C 18000010 */  b          .L001AA690
/* AA730 001AA630 00000000 */   nop
.L001AA634:
/* AA734 001AA634 00191000 */  sll        $3, $16, 4
/* AA738 001AA638 D501023C */  lui        $2, %hi(D_1D56314)
/* AA73C 001AA63C 14634224 */  addiu      $2, $2, %lo(D_1D56314)
/* AA740 001AA640 21104300 */  addu       $2, $2, $3
/* AA744 001AA644 000041C4 */  lwc1       $f1, 0x0($2)
/* AA748 001AA648 788280C7 */  lwc1       $f0, -0x7D88($gp)
/* AA74C 001AA64C 00001546 */  add.s      $f0, $f0, $f21
/* AA750 001AA650 00080046 */  add.s      $f0, $f1, $f0
/* AA754 001AA654 000040E4 */  swc1       $f0, 0x0($2)
/* AA758 001AA658 D501023C */  lui        $2, %hi(D_1D5631C)
/* AA75C 001AA65C 1C634224 */  addiu      $2, $2, %lo(D_1D5631C)
/* AA760 001AA660 21104300 */  addu       $2, $2, $3
/* AA764 001AA664 000040AC */  sw         $0, 0x0($2)
/* AA768 001AA668 D501023C */  lui        $2, %hi(hookp)
/* AA76C 001AA66C B0624224 */  addiu      $2, $2, %lo(hookp)
/* AA770 001AA670 21204300 */  addu       $4, $2, $3
/* AA774 001AA674 D501023C */  lui        $2, %hi(hookv)
/* AA778 001AA678 10634224 */  addiu      $2, $2, %lo(hookv)
/* AA77C 001AA67C 21304300 */  addu       $6, $2, $3
/* AA780 001AA680 282E8070 */  paddub     $5, $4, $0
/* AA784 001AA684 E885040C */  jal        sceVu0AddVector
/* AA788 001AA688 00000000 */   nop
/* AA78C 001AA68C 01001026 */  addiu      $16, $16, 0x1
.L001AA690:
/* AA790 001AA690 0300032A */  slti       $3, $16, 0x3
/* AA794 001AA694 E7FF6014 */  bnez       $3, .L001AA634
/* AA798 001AA698 00000000 */   nop
/* AA79C 001AA69C 28860070 */  paddub     $16, $0, $0
/* AA7A0 001AA6A0 18000010 */  b          .L001AA704
/* AA7A4 001AA6A4 00000000 */   nop
.L001AA6A8:
/* AA7A8 001AA6A8 00191000 */  sll        $3, $16, 4
/* AA7AC 001AA6AC D501023C */  lui        $2, %hi(D_1D563D4)
/* AA7B0 001AA6B0 D4634224 */  addiu      $2, $2, %lo(D_1D563D4)
/* AA7B4 001AA6B4 21104300 */  addu       $2, $2, $3
/* AA7B8 001AA6B8 000041C4 */  lwc1       $f1, 0x0($2)
/* AA7BC 001AA6BC 788280C7 */  lwc1       $f0, -0x7D88($gp)
/* AA7C0 001AA6C0 00001546 */  add.s      $f0, $f0, $f21
/* AA7C4 001AA6C4 00080046 */  add.s      $f0, $f1, $f0
/* AA7C8 001AA6C8 000040E4 */  swc1       $f0, 0x0($2)
/* AA7CC 001AA6CC D501023C */  lui        $2, %hi(D_1D563DC)
/* AA7D0 001AA6D0 DC634224 */  addiu      $2, $2, %lo(D_1D563DC)
/* AA7D4 001AA6D4 21104300 */  addu       $2, $2, $3
/* AA7D8 001AA6D8 000040AC */  sw         $0, 0x0($2)
/* AA7DC 001AA6DC D501023C */  lui        $2, %hi(ukip)
/* AA7E0 001AA6E0 50634224 */  addiu      $2, $2, %lo(ukip)
/* AA7E4 001AA6E4 21204300 */  addu       $4, $2, $3
/* AA7E8 001AA6E8 D501023C */  lui        $2, %hi(ukiv)
/* AA7EC 001AA6EC D0634224 */  addiu      $2, $2, %lo(ukiv)
/* AA7F0 001AA6F0 21304300 */  addu       $6, $2, $3
/* AA7F4 001AA6F4 282E8070 */  paddub     $5, $4, $0
/* AA7F8 001AA6F8 E885040C */  jal        sceVu0AddVector
/* AA7FC 001AA6FC 00000000 */   nop
/* AA800 001AA700 01001026 */  addiu      $16, $16, 0x1
.L001AA704:
/* AA804 001AA704 0400032A */  slti       $3, $16, 0x4
/* AA808 001AA708 E7FF6014 */  bnez       $3, .L001AA6A8
/* AA80C 001AA70C 00000000 */   nop
/* AA810 001AA710 288E0070 */  paddub     $17, $0, $0
/* AA814 001AA714 13010010 */  b          .L001AAB64
/* AA818 001AA718 00000000 */   nop
.L001AA71C:
/* AA81C 001AA71C D501023C */  lui        $2, %hi(point)
/* AA820 001AA720 305E4424 */  addiu      $4, $2, %lo(point)
/* AA824 001AA724 D501023C */  lui        $2, %hi(rod_top)
/* AA828 001AA728 30644524 */  addiu      $5, $2, %lo(rod_top)
/* AA82C 001AA72C 0C86040C */  jal        sceVu0CopyVector
/* AA830 001AA730 00000000 */   nop
/* AA834 001AA734 D501023C */  lui        $2, %hi(old_p)
/* AA838 001AA738 B05F4424 */  addiu      $4, $2, %lo(old_p)
/* AA83C 001AA73C D501023C */  lui        $2, %hi(rod_top)
/* AA840 001AA740 30644524 */  addiu      $5, $2, %lo(rod_top)
/* AA844 001AA744 0C86040C */  jal        sceVu0CopyVector
/* AA848 001AA748 00000000 */   nop
/* AA84C 001AA74C 01001024 */  addiu      $16, $0, 0x1
/* AA850 001AA750 37000010 */  b          .L001AA830
/* AA854 001AA754 00000000 */   nop
.L001AA758:
/* AA858 001AA758 003F023C */  lui        $2, (0x3F000000 >> 16)
/* AA85C 001AA75C 00A88244 */  mtc1       $2, $f21
/* AA860 001AA760 17000224 */  addiu      $2, $0, 0x17
/* AA864 001AA764 03000216 */  bne        $16, $2, .L001AA774
/* AA868 001AA768 00000000 */   nop
/* AA86C 001AA76C 848095C7 */  lwc1       $f21, -0x7F7C($gp)
/* AA870 001AA770 00000000 */  nop
.L001AA774:
/* AA874 001AA774 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AA878 001AA778 00008244 */  mtc1       $2, $f0
/* AA87C 001AA77C 00000000 */  nop
/* AA880 001AA780 81051546 */  sub.s      $f22, $f0, $f21
/* AA884 001AA784 FFFF0226 */  addiu      $2, $16, -0x1
/* AA888 001AA788 00190200 */  sll        $3, $2, 4
/* AA88C 001AA78C D501023C */  lui        $2, %hi(point)
/* AA890 001AA790 305E4224 */  addiu      $2, $2, %lo(point)
/* AA894 001AA794 21904300 */  addu       $18, $2, $3
/* AA898 001AA798 00191000 */  sll        $3, $16, 4
/* AA89C 001AA79C D501023C */  lui        $2, %hi(point)
/* AA8A0 001AA7A0 305E4224 */  addiu      $2, $2, %lo(point)
/* AA8A4 001AA7A4 21984300 */  addu       $19, $2, $3
/* AA8A8 001AA7A8 E000A427 */  addiu      $4, $sp, 0xE0
/* AA8AC 001AA7AC 282E4072 */  paddub     $5, $18, $0
/* AA8B0 001AA7B0 28366072 */  paddub     $6, $19, $0
/* AA8B4 001AA7B4 EE85040C */  jal        sceVu0SubVector
/* AA8B8 001AA7B8 00000000 */   nop
/* AA8BC 001AA7BC E000A427 */  addiu      $4, $sp, 0xE0
/* AA8C0 001AA7C0 588D040C */  jal        DistVector__FPf
/* AA8C4 001AA7C4 00000000 */   nop
/* AA8C8 001AA7C8 B48781C7 */  lwc1       $f1, -0x784C($gp)
/* AA8CC 001AA7CC 81000146 */  sub.s      $f2, $f0, $f1
/* AA8D0 001AA7D0 42B00246 */  mul.s      $f1, $f22, $f2
/* AA8D4 001AA7D4 030B0046 */  div.s      $f12, $f1, $f0
/* AA8D8 001AA7D8 42A80246 */  mul.s      $f1, $f21, $f2
/* AA8DC 001AA7DC 430D0046 */  div.s      $f21, $f1, $f0
/* AA8E0 001AA7E0 F000A427 */  addiu      $4, $sp, 0xF0
/* AA8E4 001AA7E4 E000A527 */  addiu      $5, $sp, 0xE0
/* AA8E8 001AA7E8 FA85040C */  jal        sceVu0ScaleVector
/* AA8EC 001AA7EC 00000000 */   nop
/* AA8F0 001AA7F0 0001A427 */  addiu      $4, $sp, 0x100
/* AA8F4 001AA7F4 E000A527 */  addiu      $5, $sp, 0xE0
/* AA8F8 001AA7F8 06AB0046 */  mov.s      $f12, $f21
/* AA8FC 001AA7FC FA85040C */  jal        sceVu0ScaleVector
/* AA900 001AA800 00000000 */   nop
/* AA904 001AA804 28264072 */  paddub     $4, $18, $0
/* AA908 001AA808 282E4072 */  paddub     $5, $18, $0
/* AA90C 001AA80C F000A627 */  addiu      $6, $sp, 0xF0
/* AA910 001AA810 EE85040C */  jal        sceVu0SubVector
/* AA914 001AA814 00000000 */   nop
/* AA918 001AA818 28266072 */  paddub     $4, $19, $0
/* AA91C 001AA81C 282E6072 */  paddub     $5, $19, $0
/* AA920 001AA820 0001A627 */  addiu      $6, $sp, 0x100
/* AA924 001AA824 E885040C */  jal        sceVu0AddVector
/* AA928 001AA828 00000000 */   nop
/* AA92C 001AA82C 01001026 */  addiu      $16, $16, 0x1
.L001AA830:
/* AA930 001AA830 1800022A */  slti       $2, $16, 0x18
/* AA934 001AA834 C8FF4014 */  bnez       $2, .L001AA758
/* AA938 001AA838 00000000 */   nop
/* AA93C 001AA83C D501023C */  lui        $2, %hi(hookp)
/* AA940 001AA840 B0624424 */  addiu      $4, $2, %lo(hookp)
/* AA944 001AA844 D501023C */  lui        $2, %hi(D_1D55FA0)
/* AA948 001AA848 A05F4524 */  addiu      $5, $2, %lo(D_1D55FA0)
/* AA94C 001AA84C 0C86040C */  jal        sceVu0CopyVector
/* AA950 001AA850 00000000 */   nop
/* AA954 001AA854 28860070 */  paddub     $16, $0, $0
/* AA958 001AA858 3A000010 */  b          .L001AA944
/* AA95C 001AA85C 00000000 */   nop
.L001AA860:
/* AA960 001AA860 C0201000 */  sll        $4, $16, 3
/* AA964 001AA864 2700023C */  lui        $2, %hi(hook_link)
/* AA968 001AA868 80AF4224 */  addiu      $2, $2, %lo(hook_link)
/* AA96C 001AA86C 21904400 */  addu       $18, $2, $4
/* AA970 001AA870 0000428E */  lw         $2, 0x0($18)
/* AA974 001AA874 00190200 */  sll        $3, $2, 4
/* AA978 001AA878 D501023C */  lui        $2, %hi(hookp)
/* AA97C 001AA87C B0624224 */  addiu      $2, $2, %lo(hookp)
/* AA980 001AA880 21284300 */  addu       $5, $2, $3
/* AA984 001AA884 2700023C */  lui        $2, %hi(hook_link + 0x4)
/* AA988 001AA888 84AF4224 */  addiu      $2, $2, %lo(hook_link + 0x4)
/* AA98C 001AA88C 21984400 */  addu       $19, $2, $4
/* AA990 001AA890 0000628E */  lw         $2, 0x0($19)
/* AA994 001AA894 00190200 */  sll        $3, $2, 4
/* AA998 001AA898 D501023C */  lui        $2, %hi(hookp)
/* AA99C 001AA89C B0624224 */  addiu      $2, $2, %lo(hookp)
/* AA9A0 001AA8A0 21304300 */  addu       $6, $2, $3
/* AA9A4 001AA8A4 E000A427 */  addiu      $4, $sp, 0xE0
/* AA9A8 001AA8A8 EE85040C */  jal        sceVu0SubVector
/* AA9AC 001AA8AC 00000000 */   nop
/* AA9B0 001AA8B0 E000A427 */  addiu      $4, $sp, 0xE0
/* AA9B4 001AA8B4 588D040C */  jal        DistVector__FPf
/* AA9B8 001AA8B8 00000000 */   nop
/* AA9BC 001AA8BC 80181000 */  sll        $3, $16, 2
/* AA9C0 001AA8C0 D501023C */  lui        $2, %hi(hook_dist)
/* AA9C4 001AA8C4 40634224 */  addiu      $2, $2, %lo(hook_dist)
/* AA9C8 001AA8C8 21104300 */  addu       $2, $2, $3
/* AA9CC 001AA8CC 000041C4 */  lwc1       $f1, 0x0($2)
/* AA9D0 001AA8D0 81000146 */  sub.s      $f2, $f0, $f1
/* AA9D4 001AA8D4 003F023C */  lui        $2, (0x3F000000 >> 16)
/* AA9D8 001AA8D8 00088244 */  mtc1       $2, $f1
/* AA9DC 001AA8DC 00000000 */  nop
/* AA9E0 001AA8E0 42080246 */  mul.s      $f1, $f1, $f2
/* AA9E4 001AA8E4 030B0046 */  div.s      $f12, $f1, $f0
/* AA9E8 001AA8E8 F000A427 */  addiu      $4, $sp, 0xF0
/* AA9EC 001AA8EC E000A527 */  addiu      $5, $sp, 0xE0
/* AA9F0 001AA8F0 FA85040C */  jal        sceVu0ScaleVector
/* AA9F4 001AA8F4 00000000 */   nop
/* AA9F8 001AA8F8 0000428E */  lw         $2, 0x0($18)
/* AA9FC 001AA8FC 00190200 */  sll        $3, $2, 4
/* AAA00 001AA900 D501023C */  lui        $2, %hi(hookp)
/* AAA04 001AA904 B0624224 */  addiu      $2, $2, %lo(hookp)
/* AAA08 001AA908 21204300 */  addu       $4, $2, $3
/* AAA0C 001AA90C 282E8070 */  paddub     $5, $4, $0
/* AAA10 001AA910 F000A627 */  addiu      $6, $sp, 0xF0
/* AAA14 001AA914 EE85040C */  jal        sceVu0SubVector
/* AAA18 001AA918 00000000 */   nop
/* AAA1C 001AA91C 0000628E */  lw         $2, 0x0($19)
/* AAA20 001AA920 00190200 */  sll        $3, $2, 4
/* AAA24 001AA924 D501023C */  lui        $2, %hi(hookp)
/* AAA28 001AA928 B0624224 */  addiu      $2, $2, %lo(hookp)
/* AAA2C 001AA92C 21204300 */  addu       $4, $2, $3
/* AAA30 001AA930 282E8070 */  paddub     $5, $4, $0
/* AAA34 001AA934 F000A627 */  addiu      $6, $sp, 0xF0
/* AAA38 001AA938 E885040C */  jal        sceVu0AddVector
/* AAA3C 001AA93C 00000000 */   nop
/* AAA40 001AA940 01001026 */  addiu      $16, $16, 0x1
.L001AA944:
/* AAA44 001AA944 0300022A */  slti       $2, $16, 0x3
/* AAA48 001AA948 C5FF4014 */  bnez       $2, .L001AA860
/* AAA4C 001AA94C 00000000 */   nop
/* AAA50 001AA950 E000A427 */  addiu      $4, $sp, 0xE0
/* AAA54 001AA954 D501023C */  lui        $2, %hi(D_1D55F50)
/* AAA58 001AA958 505F4524 */  addiu      $5, $2, %lo(D_1D55F50)
/* AAA5C 001AA95C D501023C */  lui        $2, %hi(ukip)
/* AAA60 001AA960 50634624 */  addiu      $6, $2, %lo(ukip)
/* AAA64 001AA964 EE85040C */  jal        sceVu0SubVector
/* AAA68 001AA968 00000000 */   nop
/* AAA6C 001AA96C E000A427 */  addiu      $4, $sp, 0xE0
/* AAA70 001AA970 588D040C */  jal        DistVector__FPf
/* AAA74 001AA974 00000000 */   nop
/* AAA78 001AA978 008281C7 */  lwc1       $f1, -0x7E00($gp)
/* AAA7C 001AA97C 42000146 */  mul.s      $f1, $f0, $f1
/* AAA80 001AA980 030B0046 */  div.s      $f12, $f1, $f0
/* AAA84 001AA984 748281C7 */  lwc1       $f1, -0x7D8C($gp)
/* AAA88 001AA988 42000146 */  mul.s      $f1, $f0, $f1
/* AAA8C 001AA98C 430D0046 */  div.s      $f21, $f1, $f0
/* AAA90 001AA990 F000A427 */  addiu      $4, $sp, 0xF0
/* AAA94 001AA994 E000A527 */  addiu      $5, $sp, 0xE0
/* AAA98 001AA998 FA85040C */  jal        sceVu0ScaleVector
/* AAA9C 001AA99C 00000000 */   nop
/* AAAA0 001AA9A0 0001A427 */  addiu      $4, $sp, 0x100
/* AAAA4 001AA9A4 E000A527 */  addiu      $5, $sp, 0xE0
/* AAAA8 001AA9A8 06AB0046 */  mov.s      $f12, $f21
/* AAAAC 001AA9AC FA85040C */  jal        sceVu0ScaleVector
/* AAAB0 001AA9B0 00000000 */   nop
/* AAAB4 001AA9B4 D501023C */  lui        $2, %hi(D_1D55F50)
/* AAAB8 001AA9B8 505F4424 */  addiu      $4, $2, %lo(D_1D55F50)
/* AAABC 001AA9BC D501023C */  lui        $2, %hi(D_1D55F50)
/* AAAC0 001AA9C0 505F4524 */  addiu      $5, $2, %lo(D_1D55F50)
/* AAAC4 001AA9C4 F000A627 */  addiu      $6, $sp, 0xF0
/* AAAC8 001AA9C8 EE85040C */  jal        sceVu0SubVector
/* AAACC 001AA9CC 00000000 */   nop
/* AAAD0 001AA9D0 D501023C */  lui        $2, %hi(ukip)
/* AAAD4 001AA9D4 50634424 */  addiu      $4, $2, %lo(ukip)
/* AAAD8 001AA9D8 D501023C */  lui        $2, %hi(ukip)
/* AAADC 001AA9DC 50634524 */  addiu      $5, $2, %lo(ukip)
/* AAAE0 001AA9E0 0001A627 */  addiu      $6, $sp, 0x100
/* AAAE4 001AA9E4 E885040C */  jal        sceVu0AddVector
/* AAAE8 001AA9E8 00000000 */   nop
/* AAAEC 001AA9EC 28860070 */  paddub     $16, $0, $0
/* AAAF0 001AA9F0 3A000010 */  b          .L001AAADC
/* AAAF4 001AA9F4 00000000 */   nop
.L001AA9F8:
/* AAAF8 001AA9F8 C0201000 */  sll        $4, $16, 3
/* AAAFC 001AA9FC 2700023C */  lui        $2, %hi(uki_link)
/* AAB00 001AAA00 A0AF4224 */  addiu      $2, $2, %lo(uki_link)
/* AAB04 001AAA04 21904400 */  addu       $18, $2, $4
/* AAB08 001AAA08 0000428E */  lw         $2, 0x0($18)
/* AAB0C 001AAA0C 00190200 */  sll        $3, $2, 4
/* AAB10 001AAA10 D501023C */  lui        $2, %hi(ukip)
/* AAB14 001AAA14 50634224 */  addiu      $2, $2, %lo(ukip)
/* AAB18 001AAA18 21284300 */  addu       $5, $2, $3
/* AAB1C 001AAA1C 2700023C */  lui        $2, %hi(uki_link + 0x4)
/* AAB20 001AAA20 A4AF4224 */  addiu      $2, $2, %lo(uki_link + 0x4)
/* AAB24 001AAA24 21984400 */  addu       $19, $2, $4
/* AAB28 001AAA28 0000628E */  lw         $2, 0x0($19)
/* AAB2C 001AAA2C 00190200 */  sll        $3, $2, 4
/* AAB30 001AAA30 D501023C */  lui        $2, %hi(ukip)
/* AAB34 001AAA34 50634224 */  addiu      $2, $2, %lo(ukip)
/* AAB38 001AAA38 21304300 */  addu       $6, $2, $3
/* AAB3C 001AAA3C E000A427 */  addiu      $4, $sp, 0xE0
/* AAB40 001AAA40 EE85040C */  jal        sceVu0SubVector
/* AAB44 001AAA44 00000000 */   nop
/* AAB48 001AAA48 E000A427 */  addiu      $4, $sp, 0xE0
/* AAB4C 001AAA4C 588D040C */  jal        DistVector__FPf
/* AAB50 001AAA50 00000000 */   nop
/* AAB54 001AAA54 80181000 */  sll        $3, $16, 2
/* AAB58 001AAA58 D501023C */  lui        $2, %hi(uki_dist)
/* AAB5C 001AAA5C 10644224 */  addiu      $2, $2, %lo(uki_dist)
/* AAB60 001AAA60 21104300 */  addu       $2, $2, $3
/* AAB64 001AAA64 000041C4 */  lwc1       $f1, 0x0($2)
/* AAB68 001AAA68 81000146 */  sub.s      $f2, $f0, $f1
/* AAB6C 001AAA6C 003F023C */  lui        $2, (0x3F000000 >> 16)
/* AAB70 001AAA70 00088244 */  mtc1       $2, $f1
/* AAB74 001AAA74 00000000 */  nop
/* AAB78 001AAA78 42080246 */  mul.s      $f1, $f1, $f2
/* AAB7C 001AAA7C 030B0046 */  div.s      $f12, $f1, $f0
/* AAB80 001AAA80 F000A427 */  addiu      $4, $sp, 0xF0
/* AAB84 001AAA84 E000A527 */  addiu      $5, $sp, 0xE0
/* AAB88 001AAA88 FA85040C */  jal        sceVu0ScaleVector
/* AAB8C 001AAA8C 00000000 */   nop
/* AAB90 001AAA90 0000428E */  lw         $2, 0x0($18)
/* AAB94 001AAA94 00190200 */  sll        $3, $2, 4
/* AAB98 001AAA98 D501023C */  lui        $2, %hi(ukip)
/* AAB9C 001AAA9C 50634224 */  addiu      $2, $2, %lo(ukip)
/* AABA0 001AAAA0 21204300 */  addu       $4, $2, $3
/* AABA4 001AAAA4 282E8070 */  paddub     $5, $4, $0
/* AABA8 001AAAA8 F000A627 */  addiu      $6, $sp, 0xF0
/* AABAC 001AAAAC EE85040C */  jal        sceVu0SubVector
/* AABB0 001AAAB0 00000000 */   nop
/* AABB4 001AAAB4 0000628E */  lw         $2, 0x0($19)
/* AABB8 001AAAB8 00190200 */  sll        $3, $2, 4
/* AABBC 001AAABC D501023C */  lui        $2, %hi(ukip)
/* AABC0 001AAAC0 50634224 */  addiu      $2, $2, %lo(ukip)
/* AABC4 001AAAC4 21204300 */  addu       $4, $2, $3
/* AABC8 001AAAC8 282E8070 */  paddub     $5, $4, $0
/* AABCC 001AAACC F000A627 */  addiu      $6, $sp, 0xF0
/* AABD0 001AAAD0 E885040C */  jal        sceVu0AddVector
/* AABD4 001AAAD4 00000000 */   nop
/* AABD8 001AAAD8 01001026 */  addiu      $16, $16, 0x1
.L001AAADC:
/* AABDC 001AAADC 0600032A */  slti       $3, $16, 0x6
/* AABE0 001AAAE0 C5FF6014 */  bnez       $3, .L001AA9F8
/* AABE4 001AAAE4 00000000 */   nop
/* AABE8 001AAAE8 8093838F */  lw         $3, -0x6C80($gp)
/* AABEC 001AAAEC 0D006010 */  beqz       $3, .L001AAB24
/* AABF0 001AAAF0 00000000 */   nop
/* AABF4 001AAAF4 D501023C */  lui        $2, %hi(D_1D55FA0)
/* AABF8 001AAAF8 A05F4424 */  addiu      $4, $2, %lo(D_1D55FA0)
/* AABFC 001AAAFC D501023C */  lui        $2, %hi(fishhook)
/* AAC00 001AAB00 40644524 */  addiu      $5, $2, %lo(fishhook)
/* AAC04 001AAB04 0C86040C */  jal        sceVu0CopyVector
/* AAC08 001AAB08 00000000 */   nop
/* AAC0C 001AAB0C D501023C */  lui        $2, %hi(hookp)
/* AAC10 001AAB10 B0624424 */  addiu      $4, $2, %lo(hookp)
/* AAC14 001AAB14 D501023C */  lui        $2, %hi(fishhook)
/* AAC18 001AAB18 40644524 */  addiu      $5, $2, %lo(fishhook)
/* AAC1C 001AAB1C 0C86040C */  jal        sceVu0CopyVector
/* AAC20 001AAB20 00000000 */   nop
.L001AAB24:
/* AAC24 001AAB24 8493838F */  lw         $3, -0x6C7C($gp)
/* AAC28 001AAB28 0D006010 */  beqz       $3, .L001AAB60
/* AAC2C 001AAB2C 00000000 */   nop
/* AAC30 001AAB30 D501023C */  lui        $2, %hi(D_1D55F50)
/* AAC34 001AAB34 505F4424 */  addiu      $4, $2, %lo(D_1D55F50)
/* AAC38 001AAB38 D501023C */  lui        $2, %hi(uki)
/* AAC3C 001AAB3C 50644524 */  addiu      $5, $2, %lo(uki)
/* AAC40 001AAB40 0C86040C */  jal        sceVu0CopyVector
/* AAC44 001AAB44 00000000 */   nop
/* AAC48 001AAB48 D501023C */  lui        $2, %hi(ukip)
/* AAC4C 001AAB4C 50634424 */  addiu      $4, $2, %lo(ukip)
/* AAC50 001AAB50 D501023C */  lui        $2, %hi(uki)
/* AAC54 001AAB54 50644524 */  addiu      $5, $2, %lo(uki)
/* AAC58 001AAB58 0C86040C */  jal        sceVu0CopyVector
/* AAC5C 001AAB5C 00000000 */   nop
.L001AAB60:
/* AAC60 001AAB60 01003126 */  addiu      $17, $17, 0x1
.L001AAB64:
/* AAC64 001AAB64 1000232A */  slti       $3, $17, 0x10
/* AAC68 001AAB68 ECFE6014 */  bnez       $3, .L001AA71C
/* AAC6C 001AAB6C 00000000 */   nop
/* AAC70 001AAB70 28860070 */  paddub     $16, $0, $0
/* AAC74 001AAB74 53000010 */  b          .L001AACC4
/* AAC78 001AAB78 00000000 */   nop
.L001AAB7C:
/* AAC7C 001AAB7C 00891000 */  sll        $17, $16, 4
/* AAC80 001AAB80 D501023C */  lui        $2, %hi(velo)
/* AAC84 001AAB84 30614224 */  addiu      $2, $2, %lo(velo)
/* AAC88 001AAB88 21905100 */  addu       $18, $2, $17
/* AAC8C 001AAB8C D501023C */  lui        $2, %hi(point)
/* AAC90 001AAB90 305E4224 */  addiu      $2, $2, %lo(point)
/* AAC94 001AAB94 21985100 */  addu       $19, $2, $17
/* AAC98 001AAB98 D501023C */  lui        $2, %hi(old_p)
/* AAC9C 001AAB9C B05F4224 */  addiu      $2, $2, %lo(old_p)
/* AACA0 001AABA0 21A05100 */  addu       $20, $2, $17
/* AACA4 001AABA4 28264072 */  paddub     $4, $18, $0
/* AACA8 001AABA8 282E6072 */  paddub     $5, $19, $0
/* AACAC 001AABAC 28368072 */  paddub     $6, $20, $0
/* AACB0 001AABB0 EE85040C */  jal        sceVu0SubVector
/* AACB4 001AABB4 00000000 */   nop
/* AACB8 001AABB8 17000224 */  addiu      $2, $0, 0x17
/* AACBC 001AABBC 08000212 */  beq        $16, $2, .L001AABE0
/* AACC0 001AABC0 00000000 */   nop
/* AACC4 001AABC4 28264072 */  paddub     $4, $18, $0
/* AACC8 001AABC8 282E4072 */  paddub     $5, $18, $0
/* AACCC 001AABCC 90808CC7 */  lwc1       $f12, -0x7F70($gp)
/* AACD0 001AABD0 FA85040C */  jal        sceVu0ScaleVector
/* AACD4 001AABD4 00000000 */   nop
/* AACD8 001AABD8 06000010 */  b          .L001AABF4
/* AACDC 001AABDC 00000000 */   nop
.L001AABE0:
/* AACE0 001AABE0 28264072 */  paddub     $4, $18, $0
/* AACE4 001AABE4 282E4072 */  paddub     $5, $18, $0
/* AACE8 001AABE8 7C828CC7 */  lwc1       $f12, -0x7D84($gp)
/* AACEC 001AABEC FA85040C */  jal        sceVu0ScaleVector
/* AACF0 001AABF0 00000000 */   nop
.L001AABF4:
/* AACF4 001AABF4 D501023C */  lui        $2, %hi(D_1D55E34)
/* AACF8 001AABF8 345E4224 */  addiu      $2, $2, %lo(D_1D55E34)
/* AACFC 001AABFC 21185100 */  addu       $3, $2, $17
/* AAD00 001AAC00 000060C4 */  lwc1       $f0, 0x0($3)
/* AAD04 001AAC04 489381C7 */  lwc1       $f1, -0x6CB8($gp)
/* AAD08 001AAC08 34000146 */  c.lt.s     $f0, $f1
/* AAD0C 001AAC0C 00000000 */  nop
/* AAD10 001AAC10 13000045 */  bc1f       .L001AAC60
/* AAD14 001AAC14 00000000 */   nop
/* AAD18 001AAC18 000061E4 */  swc1       $f1, 0x0($3)
/* AAD1C 001AAC1C 000040C6 */  lwc1       $f0, 0x0($18)
/* AAD20 001AAC20 D48182C7 */  lwc1       $f2, -0x7E2C($gp)
/* AAD24 001AAC24 02000246 */  mul.s      $f0, $f0, $f2
/* AAD28 001AAC28 000040E6 */  swc1       $f0, 0x0($18)
/* AAD2C 001AAC2C D501023C */  lui        $2, %hi(D_1D56134)
/* AAD30 001AAC30 34614224 */  addiu      $2, $2, %lo(D_1D56134)
/* AAD34 001AAC34 21105100 */  addu       $2, $2, $17
/* AAD38 001AAC38 000041C4 */  lwc1       $f1, 0x0($2)
/* AAD3C 001AAC3C 808280C7 */  lwc1       $f0, -0x7D80($gp)
/* AAD40 001AAC40 02080046 */  mul.s      $f0, $f1, $f0
/* AAD44 001AAC44 000040E4 */  swc1       $f0, 0x0($2)
/* AAD48 001AAC48 D501023C */  lui        $2, %hi(D_1D56138)
/* AAD4C 001AAC4C 38614224 */  addiu      $2, $2, %lo(D_1D56138)
/* AAD50 001AAC50 21105100 */  addu       $2, $2, $17
/* AAD54 001AAC54 000040C4 */  lwc1       $f0, 0x0($2)
/* AAD58 001AAC58 02000246 */  mul.s      $f0, $f0, $f2
/* AAD5C 001AAC5C 000040E4 */  swc1       $f0, 0x0($2)
.L001AAC60:
/* AAD60 001AAC60 000060C4 */  lwc1       $f0, 0x0($3)
/* AAD64 001AAC64 34001446 */  c.lt.s     $f0, $f20
/* AAD68 001AAC68 00000000 */  nop
/* AAD6C 001AAC6C 10000045 */  bc1f       .L001AACB0
/* AAD70 001AAC70 00000000 */   nop
/* AAD74 001AAC74 28264072 */  paddub     $4, $18, $0
/* AAD78 001AAC78 282E4072 */  paddub     $5, $18, $0
/* AAD7C 001AAC7C D4818CC7 */  lwc1       $f12, -0x7E2C($gp)
/* AAD80 001AAC80 FA85040C */  jal        sceVu0ScaleVector
/* AAD84 001AAC84 00000000 */   nop
/* AAD88 001AAC88 1300012A */  slti       $at, $16, 0x13
/* AAD8C 001AAC8C 08002010 */  beqz       $at, .L001AACB0
/* AAD90 001AAC90 00000000 */   nop
/* AAD94 001AAC94 D501023C */  lui        $2, %hi(D_1D56134)
/* AAD98 001AAC98 34614224 */  addiu      $2, $2, %lo(D_1D56134)
/* AAD9C 001AAC9C 21105100 */  addu       $2, $2, $17
/* AADA0 001AACA0 000041C4 */  lwc1       $f1, 0x0($2)
/* AADA4 001AACA4 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* AADA8 001AACA8 00080046 */  add.s      $f0, $f1, $f0
/* AADAC 001AACAC 000040E4 */  swc1       $f0, 0x0($2)
.L001AACB0:
/* AADB0 001AACB0 28268072 */  paddub     $4, $20, $0
/* AADB4 001AACB4 282E6072 */  paddub     $5, $19, $0
/* AADB8 001AACB8 0C86040C */  jal        sceVu0CopyVector
/* AADBC 001AACBC 00000000 */   nop
/* AADC0 001AACC0 01001026 */  addiu      $16, $16, 0x1
.L001AACC4:
/* AADC4 001AACC4 1800032A */  slti       $3, $16, 0x18
/* AADC8 001AACC8 ACFF6014 */  bnez       $3, .L001AAB7C
/* AADCC 001AACCC 00000000 */   nop
/* AADD0 001AACD0 28860070 */  paddub     $16, $0, $0
/* AADD4 001AACD4 36000010 */  b          .L001AADB0
/* AADD8 001AACD8 00000000 */   nop
.L001AACDC:
/* AADDC 001AACDC 00891000 */  sll        $17, $16, 4
/* AADE0 001AACE0 D501023C */  lui        $2, %hi(hookv)
/* AADE4 001AACE4 10634224 */  addiu      $2, $2, %lo(hookv)
/* AADE8 001AACE8 21905100 */  addu       $18, $2, $17
/* AADEC 001AACEC D501023C */  lui        $2, %hi(hookp)
/* AADF0 001AACF0 B0624224 */  addiu      $2, $2, %lo(hookp)
/* AADF4 001AACF4 21985100 */  addu       $19, $2, $17
/* AADF8 001AACF8 D501023C */  lui        $2, %hi(hookop)
/* AADFC 001AACFC E0624224 */  addiu      $2, $2, %lo(hookop)
/* AAE00 001AAD00 21A05100 */  addu       $20, $2, $17
/* AAE04 001AAD04 28264072 */  paddub     $4, $18, $0
/* AAE08 001AAD08 282E6072 */  paddub     $5, $19, $0
/* AAE0C 001AAD0C 28368072 */  paddub     $6, $20, $0
/* AAE10 001AAD10 EE85040C */  jal        sceVu0SubVector
/* AAE14 001AAD14 00000000 */   nop
/* AAE18 001AAD18 D501023C */  lui        $2, %hi(D_1D562B4)
/* AAE1C 001AAD1C B4624224 */  addiu      $2, $2, %lo(D_1D562B4)
/* AAE20 001AAD20 21105100 */  addu       $2, $2, $17
/* AAE24 001AAD24 000040C4 */  lwc1       $f0, 0x0($2)
/* AAE28 001AAD28 449381C7 */  lwc1       $f1, -0x6CBC($gp)
/* AAE2C 001AAD2C 34000146 */  c.lt.s     $f0, $f1
/* AAE30 001AAD30 00000000 */  nop
/* AAE34 001AAD34 14000045 */  bc1f       .L001AAD88
/* AAE38 001AAD38 00000000 */   nop
/* AAE3C 001AAD3C 000041E4 */  swc1       $f1, 0x0($2)
/* AAE40 001AAD40 000041C6 */  lwc1       $f1, 0x0($18)
/* AAE44 001AAD44 008280C7 */  lwc1       $f0, -0x7E00($gp)
/* AAE48 001AAD48 02080046 */  mul.s      $f0, $f1, $f0
/* AAE4C 001AAD4C 000040E6 */  swc1       $f0, 0x0($18)
/* AAE50 001AAD50 D501023C */  lui        $2, %hi(D_1D56314)
/* AAE54 001AAD54 14634224 */  addiu      $2, $2, %lo(D_1D56314)
/* AAE58 001AAD58 21105100 */  addu       $2, $2, $17
/* AAE5C 001AAD5C 000041C4 */  lwc1       $f1, 0x0($2)
/* AAE60 001AAD60 848280C7 */  lwc1       $f0, -0x7D7C($gp)
/* AAE64 001AAD64 02080046 */  mul.s      $f0, $f1, $f0
/* AAE68 001AAD68 000040E4 */  swc1       $f0, 0x0($2)
/* AAE6C 001AAD6C D501023C */  lui        $2, %hi(D_1D56318)
/* AAE70 001AAD70 18634224 */  addiu      $2, $2, %lo(D_1D56318)
/* AAE74 001AAD74 21105100 */  addu       $2, $2, $17
/* AAE78 001AAD78 000041C4 */  lwc1       $f1, 0x0($2)
/* AAE7C 001AAD7C 008280C7 */  lwc1       $f0, -0x7E00($gp)
/* AAE80 001AAD80 02080046 */  mul.s      $f0, $f1, $f0
/* AAE84 001AAD84 000040E4 */  swc1       $f0, 0x0($2)
.L001AAD88:
/* AAE88 001AAD88 28268072 */  paddub     $4, $20, $0
/* AAE8C 001AAD8C 282E6072 */  paddub     $5, $19, $0
/* AAE90 001AAD90 0C86040C */  jal        sceVu0CopyVector
/* AAE94 001AAD94 00000000 */   nop
/* AAE98 001AAD98 28264072 */  paddub     $4, $18, $0
/* AAE9C 001AAD9C 282E4072 */  paddub     $5, $18, $0
/* AAEA0 001AADA0 88828CC7 */  lwc1       $f12, -0x7D78($gp)
/* AAEA4 001AADA4 FA85040C */  jal        sceVu0ScaleVector
/* AAEA8 001AADA8 00000000 */   nop
/* AAEAC 001AADAC 01001026 */  addiu      $16, $16, 0x1
.L001AADB0:
/* AAEB0 001AADB0 0300032A */  slti       $3, $16, 0x3
/* AAEB4 001AADB4 C9FF6014 */  bnez       $3, .L001AACDC
/* AAEB8 001AADB8 00000000 */   nop
/* AAEBC 001AADBC 28860070 */  paddub     $16, $0, $0
/* AAEC0 001AADC0 B2000010 */  b          .L001AB08C
/* AAEC4 001AADC4 00000000 */   nop
.L001AADC8:
/* AAEC8 001AADC8 00891000 */  sll        $17, $16, 4
/* AAECC 001AADCC D501023C */  lui        $2, %hi(ukiv)
/* AAED0 001AADD0 D0634224 */  addiu      $2, $2, %lo(ukiv)
/* AAED4 001AADD4 21985100 */  addu       $19, $2, $17
/* AAED8 001AADD8 D501023C */  lui        $2, %hi(ukip)
/* AAEDC 001AADDC 50634224 */  addiu      $2, $2, %lo(ukip)
/* AAEE0 001AADE0 21A05100 */  addu       $20, $2, $17
/* AAEE4 001AADE4 D501023C */  lui        $2, %hi(ukiop)
/* AAEE8 001AADE8 90634224 */  addiu      $2, $2, %lo(ukiop)
/* AAEEC 001AADEC 21A85100 */  addu       $21, $2, $17
/* AAEF0 001AADF0 28266072 */  paddub     $4, $19, $0
/* AAEF4 001AADF4 282E8072 */  paddub     $5, $20, $0
/* AAEF8 001AADF8 2836A072 */  paddub     $6, $21, $0
/* AAEFC 001AADFC EE85040C */  jal        sceVu0SubVector
/* AAF00 001AAE00 00000000 */   nop
/* AAF04 001AAE04 D501023C */  lui        $2, %hi(D_1D56354)
/* AAF08 001AAE08 54634224 */  addiu      $2, $2, %lo(D_1D56354)
/* AAF0C 001AAE0C 21905100 */  addu       $18, $2, $17
/* AAF10 001AAE10 000040C6 */  lwc1       $f0, 0x0($18)
/* AAF14 001AAE14 409381C7 */  lwc1       $f1, -0x6CC0($gp)
/* AAF18 001AAE18 34000146 */  c.lt.s     $f0, $f1
/* AAF1C 001AAE1C 00000000 */  nop
/* AAF20 001AAE20 13000045 */  bc1f       .L001AAE70
/* AAF24 001AAE24 00000000 */   nop
/* AAF28 001AAE28 000041E6 */  swc1       $f1, 0x0($18)
/* AAF2C 001AAE2C 000060C6 */  lwc1       $f0, 0x0($19)
/* AAF30 001AAE30 A08082C7 */  lwc1       $f2, -0x7F60($gp)
/* AAF34 001AAE34 02000246 */  mul.s      $f0, $f0, $f2
/* AAF38 001AAE38 000060E6 */  swc1       $f0, 0x0($19)
/* AAF3C 001AAE3C D501023C */  lui        $2, %hi(D_1D563D4)
/* AAF40 001AAE40 D4634224 */  addiu      $2, $2, %lo(D_1D563D4)
/* AAF44 001AAE44 21105100 */  addu       $2, $2, $17
/* AAF48 001AAE48 000041C4 */  lwc1       $f1, 0x0($2)
/* AAF4C 001AAE4C 8C8280C7 */  lwc1       $f0, -0x7D74($gp)
/* AAF50 001AAE50 02080046 */  mul.s      $f0, $f1, $f0
/* AAF54 001AAE54 000040E4 */  swc1       $f0, 0x0($2)
/* AAF58 001AAE58 D501023C */  lui        $2, %hi(D_1D563D8)
/* AAF5C 001AAE5C D8634224 */  addiu      $2, $2, %lo(D_1D563D8)
/* AAF60 001AAE60 21105100 */  addu       $2, $2, $17
/* AAF64 001AAE64 000040C4 */  lwc1       $f0, 0x0($2)
/* AAF68 001AAE68 02000246 */  mul.s      $f0, $f0, $f2
/* AAF6C 001AAE6C 000040E4 */  swc1       $f0, 0x0($2)
.L001AAE70:
/* AAF70 001AAE70 18000012 */  beqz       $16, .L001AAED4
/* AAF74 001AAE74 00000000 */   nop
/* AAF78 001AAE78 000040C6 */  lwc1       $f0, 0x0($18)
/* AAF7C 001AAE7C 34001446 */  c.lt.s     $f0, $f20
/* AAF80 001AAE80 00000000 */  nop
/* AAF84 001AAE84 13000045 */  bc1f       .L001AAED4
/* AAF88 001AAE88 00000000 */   nop
/* AAF8C 001AAE8C D501013C */  lui        $at, (0x1D56354 >> 16)
/* AAF90 001AAE90 546320C4 */  lwc1       $f0, (0x1D56354 & 0xFFFF)($at)
/* AAF94 001AAE94 34001446 */  c.lt.s     $f0, $f20
/* AAF98 001AAE98 00000000 */  nop
/* AAF9C 001AAE9C 0D000045 */  bc1f       .L001AAED4
/* AAFA0 001AAEA0 00000000 */   nop
/* AAFA4 001AAEA4 28266072 */  paddub     $4, $19, $0
/* AAFA8 001AAEA8 282E6072 */  paddub     $5, $19, $0
/* AAFAC 001AAEAC A0808CC7 */  lwc1       $f12, -0x7F60($gp)
/* AAFB0 001AAEB0 FA85040C */  jal        sceVu0ScaleVector
/* AAFB4 001AAEB4 00000000 */   nop
/* AAFB8 001AAEB8 D501023C */  lui        $2, %hi(D_1D563D4)
/* AAFBC 001AAEBC D4634224 */  addiu      $2, $2, %lo(D_1D563D4)
/* AAFC0 001AAEC0 21105100 */  addu       $2, $2, $17
/* AAFC4 001AAEC4 000041C4 */  lwc1       $f1, 0x0($2)
/* AAFC8 001AAEC8 908280C7 */  lwc1       $f0, -0x7D70($gp)
/* AAFCC 001AAECC 00080046 */  add.s      $f0, $f1, $f0
/* AAFD0 001AAED0 000040E4 */  swc1       $f0, 0x0($2)
.L001AAED4:
/* AAFD4 001AAED4 D501013C */  lui        $at, (0x1D56354 >> 16)
/* AAFD8 001AAED8 546323C4 */  lwc1       $f3, (0x1D56354 & 0xFFFF)($at)
/* AAFDC 001AAEDC 34181446 */  c.lt.s     $f3, $f20
/* AAFE0 001AAEE0 00000000 */  nop
/* AAFE4 001AAEE4 33000045 */  bc1f       .L001AAFB4
/* AAFE8 001AAEE8 00000000 */   nop
/* AAFEC 001AAEEC 000040C6 */  lwc1       $f0, 0x0($18)
/* AAFF0 001AAEF0 34001446 */  c.lt.s     $f0, $f20
/* AAFF4 001AAEF4 00000000 */  nop
/* AAFF8 001AAEF8 2E000145 */  bc1t       .L001AAFB4
/* AAFFC 001AAEFC 00000000 */   nop
/* AB000 001AAF00 01190046 */  sub.s      $f4, $f3, $f0
/* AB004 001AAF04 86200046 */  mov.s      $f2, $f4
/* AB008 001AAF08 00008044 */  mtc1       $0, $f0
/* AB00C 001AAF0C 00000000 */  nop
/* AB010 001AAF10 34200046 */  c.lt.s     $f4, $f0
/* AB014 001AAF14 00000000 */  nop
/* AB018 001AAF18 04000045 */  bc1f       .L001AAF2C
/* AB01C 001AAF1C 00000000 */   nop
/* AB020 001AAF20 87200046 */  neg.s      $f2, $f4
/* AB024 001AAF24 01000010 */  b          .L001AAF2C
/* AB028 001AAF28 00000000 */   nop
.L001AAF2C:
/* AB02C 001AAF2C 000060C6 */  lwc1       $f0, 0x0($19)
/* AB030 001AAF30 A08081C7 */  lwc1       $f1, -0x7F60($gp)
/* AB034 001AAF34 02000146 */  mul.s      $f0, $f0, $f1
/* AB038 001AAF38 000060E6 */  swc1       $f0, 0x0($19)
/* AB03C 001AAF3C D501023C */  lui        $2, %hi(D_1D563D8)
/* AB040 001AAF40 D8634224 */  addiu      $2, $2, %lo(D_1D563D8)
/* AB044 001AAF44 21105100 */  addu       $2, $2, $17
/* AB048 001AAF48 000040C4 */  lwc1       $f0, 0x0($2)
/* AB04C 001AAF4C 02000146 */  mul.s      $f0, $f0, $f1
/* AB050 001AAF50 000040E4 */  swc1       $f0, 0x0($2)
/* AB054 001AAF54 00008044 */  mtc1       $0, $f0
/* AB058 001AAF58 00000000 */  nop
/* AB05C 001AAF5C 34200046 */  c.lt.s     $f4, $f0
/* AB060 001AAF60 00000000 */  nop
/* AB064 001AAF64 04000045 */  bc1f       .L001AAF78
/* AB068 001AAF68 00000000 */   nop
/* AB06C 001AAF6C 07210046 */  neg.s      $f4, $f4
/* AB070 001AAF70 01000010 */  b          .L001AAF78
/* AB074 001AAF74 00000000 */   nop
.L001AAF78:
/* AB078 001AAF78 A48080C7 */  lwc1       $f0, -0x7F5C($gp)
/* AB07C 001AAF7C 36200046 */  c.le.s     $f4, $f0
/* AB080 001AAF80 00000000 */  nop
/* AB084 001AAF84 0B000145 */  bc1t       .L001AAFB4
/* AB088 001AAF88 00000000 */   nop
/* AB08C 001AAF8C 41A00346 */  sub.s      $f1, $f20, $f3
/* AB090 001AAF90 908280C7 */  lwc1       $f0, -0x7D70($gp)
/* AB094 001AAF94 02000146 */  mul.s      $f0, $f0, $f1
/* AB098 001AAF98 43000246 */  div.s      $f1, $f0, $f2
/* AB09C 001AAF9C D501023C */  lui        $2, %hi(D_1D563D4)
/* AB0A0 001AAFA0 D4634224 */  addiu      $2, $2, %lo(D_1D563D4)
/* AB0A4 001AAFA4 21105100 */  addu       $2, $2, $17
/* AB0A8 001AAFA8 000040C4 */  lwc1       $f0, 0x0($2)
/* AB0AC 001AAFAC 00000146 */  add.s      $f0, $f0, $f1
/* AB0B0 001AAFB0 000040E4 */  swc1       $f0, 0x0($2)
.L001AAFB4:
/* AB0B4 001AAFB4 000044C6 */  lwc1       $f4, 0x0($18)
/* AB0B8 001AAFB8 34201446 */  c.lt.s     $f4, $f20
/* AB0BC 001AAFBC 00000000 */  nop
/* AB0C0 001AAFC0 28000045 */  bc1f       .L001AB064
/* AB0C4 001AAFC4 00000000 */   nop
/* AB0C8 001AAFC8 34181446 */  c.lt.s     $f3, $f20
/* AB0CC 001AAFCC 00000000 */  nop
/* AB0D0 001AAFD0 24000145 */  bc1t       .L001AB064
/* AB0D4 001AAFD4 00000000 */   nop
/* AB0D8 001AAFD8 81200346 */  sub.s      $f2, $f4, $f3
/* AB0DC 001AAFDC 00008044 */  mtc1       $0, $f0
/* AB0E0 001AAFE0 00000000 */  nop
/* AB0E4 001AAFE4 34100046 */  c.lt.s     $f2, $f0
/* AB0E8 001AAFE8 00000000 */  nop
/* AB0EC 001AAFEC 04000045 */  bc1f       .L001AB000
/* AB0F0 001AAFF0 00000000 */   nop
/* AB0F4 001AAFF4 87100046 */  neg.s      $f2, $f2
/* AB0F8 001AAFF8 01000010 */  b          .L001AB000
/* AB0FC 001AAFFC 00000000 */   nop
.L001AB000:
/* AB100 001AB000 41180446 */  sub.s      $f1, $f3, $f4
/* AB104 001AB004 00008044 */  mtc1       $0, $f0
/* AB108 001AB008 00000000 */  nop
/* AB10C 001AB00C 34080046 */  c.lt.s     $f1, $f0
/* AB110 001AB010 00000000 */  nop
/* AB114 001AB014 04000045 */  bc1f       .L001AB028
/* AB118 001AB018 00000000 */   nop
/* AB11C 001AB01C 47080046 */  neg.s      $f1, $f1
/* AB120 001AB020 01000010 */  b          .L001AB028
/* AB124 001AB024 00000000 */   nop
.L001AB028:
/* AB128 001AB028 A48080C7 */  lwc1       $f0, -0x7F5C($gp)
/* AB12C 001AB02C 36080046 */  c.le.s     $f1, $f0
/* AB130 001AB030 00000000 */  nop
/* AB134 001AB034 0B000145 */  bc1t       .L001AB064
/* AB138 001AB038 00000000 */   nop
/* AB13C 001AB03C 41A00446 */  sub.s      $f1, $f20, $f4
/* AB140 001AB040 908280C7 */  lwc1       $f0, -0x7D70($gp)
/* AB144 001AB044 02000146 */  mul.s      $f0, $f0, $f1
/* AB148 001AB048 43000246 */  div.s      $f1, $f0, $f2
/* AB14C 001AB04C D501023C */  lui        $2, %hi(D_1D563D4)
/* AB150 001AB050 D4634224 */  addiu      $2, $2, %lo(D_1D563D4)
/* AB154 001AB054 21105100 */  addu       $2, $2, $17
/* AB158 001AB058 000040C4 */  lwc1       $f0, 0x0($2)
/* AB15C 001AB05C 00000146 */  add.s      $f0, $f0, $f1
/* AB160 001AB060 000040E4 */  swc1       $f0, 0x0($2)
.L001AB064:
/* AB164 001AB064 2826A072 */  paddub     $4, $21, $0
/* AB168 001AB068 282E8072 */  paddub     $5, $20, $0
/* AB16C 001AB06C 0C86040C */  jal        sceVu0CopyVector
/* AB170 001AB070 00000000 */   nop
/* AB174 001AB074 28266072 */  paddub     $4, $19, $0
/* AB178 001AB078 282E6072 */  paddub     $5, $19, $0
/* AB17C 001AB07C 7C828CC7 */  lwc1       $f12, -0x7D84($gp)
/* AB180 001AB080 FA85040C */  jal        sceVu0ScaleVector
/* AB184 001AB084 00000000 */   nop
/* AB188 001AB088 01001026 */  addiu      $16, $16, 0x1
.L001AB08C:
/* AB18C 001AB08C 0400032A */  slti       $3, $16, 0x4
/* AB190 001AB090 4DFF6014 */  bnez       $3, .L001AADC8
/* AB194 001AB094 00000000 */   nop
/* AB198 001AB098 3C9380C7 */  lwc1       $f0, -0x6CC4($gp)
/* AB19C 001AB09C 409380E7 */  swc1       $f0, -0x6CC0($gp)
/* AB1A0 001AB0A0 449380E7 */  swc1       $f0, -0x6CBC($gp)
/* AB1A4 001AB0A4 489380E7 */  swc1       $f0, -0x6CB8($gp)
/* AB1A8 001AB0A8 849380AF */  sw         $0, -0x6C7C($gp)
/* AB1AC 001AB0AC 809380AF */  sw         $0, -0x6C80($gp)
/* AB1B0 001AB0B0 889380AF */  sw         $0, -0x6C78($gp)
/* AB1B4 001AB0B4 7000BF7B */  lq         $31, 0x70($sp)
/* AB1B8 001AB0B8 6000B57B */  lq         $21, 0x60($sp)
/* AB1BC 001AB0BC 5000B47B */  lq         $20, 0x50($sp)
/* AB1C0 001AB0C0 4000B37B */  lq         $19, 0x40($sp)
/* AB1C4 001AB0C4 3000B27B */  lq         $18, 0x30($sp)
/* AB1C8 001AB0C8 2000B17B */  lq         $17, 0x20($sp)
/* AB1CC 001AB0CC 1000B07B */  lq         $16, 0x10($sp)
/* AB1D0 001AB0D0 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* AB1D4 001AB0D4 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* AB1D8 001AB0D8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* AB1DC 001AB0DC 1001BD27 */  addiu      $sp, $sp, 0x110
/* AB1E0 001AB0E0 0800E003 */  jr         $31
/* AB1E4 001AB0E4 00000000 */   nop
/* AB1E8 001AB0E8 00000000 */  nop
/* AB1EC 001AB0EC 00000000 */  nop
