.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishLineStep__FPfPf
/* 0AA440 001AA340 F0FEBD27 */  addiu       $29, $29, -0x110
/* 0AA444 001AA344 7000BF7F */  sq          $31, 0x70($29)
/* 0AA448 001AA348 6000B57F */  sq          $21, 0x60($29)
/* 0AA44C 001AA34C 5000B47F */  sq          $20, 0x50($29)
/* 0AA450 001AA350 4000B37F */  sq          $19, 0x40($29)
/* 0AA454 001AA354 3000B27F */  sq          $18, 0x30($29)
/* 0AA458 001AA358 2000B17F */  sq          $17, 0x20($29)
/* 0AA45C 001AA35C 1000B07F */  sq          $16, 0x10($29)
/* 0AA460 001AA360 0800B6E7 */  swc1        $f22, 0x8($29)
/* 0AA464 001AA364 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0AA468 001AA368 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0AA46C 001AA36C 28868070 */  paddub      $16, $4, $0
/* 0AA470 001AA370 7893828F */  lw          $2, -0x6C88($28)
/* 0AA474 001AA374 75004010 */  beqz        $2, .L001AA54C
/* 0AA478 001AA378 00000000 */   nop
/* 0AA47C 001AA37C 8000A427 */  addiu       $4, $29, 0x80
/* 0AA480 001AA380 D501023C */  lui         $2, %hi(point + 0x170)
/* 0AA484 001AA384 A05F4524 */  addiu       $5, $2, %lo(point + 0x170)
/* 0AA488 001AA388 0C86040C */  jal         sceVu0CopyVector
/* 0AA48C 001AA38C 00000000 */   nop
/* 0AA490 001AA390 9000A427 */  addiu       $4, $29, 0x90
/* 0AA494 001AA394 D501023C */  lui         $2, %hi(point + 0x170)
/* 0AA498 001AA398 A05F4524 */  addiu       $5, $2, %lo(point + 0x170)
/* 0AA49C 001AA39C 0C86040C */  jal         sceVu0CopyVector
/* 0AA4A0 001AA3A0 00000000 */   nop
/* 0AA4A4 001AA3A4 8400A0C7 */  lwc1        $f0, 0x84($29)
/* 0AA4A8 001AA3A8 2042023C */  lui         $2, (0x42200000 >> 16)
/* 0AA4AC 001AA3AC 00088244 */  mtc1        $2, $f1
/* 0AA4B0 001AA3B0 00000000 */  nop
/* 0AA4B4 001AA3B4 00000146 */  add.s       $f0, $f0, $f1
/* 0AA4B8 001AA3B8 8400A0E7 */  swc1        $f0, 0x84($29)
/* 0AA4BC 001AA3BC 9400A0C7 */  lwc1        $f0, 0x94($29)
/* 0AA4C0 001AA3C0 01000146 */  sub.s       $f0, $f0, $f1
/* 0AA4C4 001AA3C4 9400A0E7 */  swc1        $f0, 0x94($29)
/* 0AA4C8 001AA3C8 7893848F */  lw          $4, -0x6C88($28)
/* 0AA4CC 001AA3CC 7C93858F */  lw          $5, -0x6C84($28)
/* 0AA4D0 001AA3D0 8000A627 */  addiu       $6, $29, 0x80
/* 0AA4D4 001AA3D4 9000A727 */  addiu       $7, $29, 0x90
/* 0AA4D8 001AA3D8 C000A827 */  addiu       $8, $29, 0xC0
/* 0AA4DC 001AA3DC 01000924 */  addiu       $9, $0, 0x1
/* 0AA4E0 001AA3E0 28560070 */  paddub      $10, $0, $0
/* 0AA4E4 001AA3E4 5427050C */  jal         CheckHit__FP6CCPolyiPfPfPfii
/* 0AA4E8 001AA3E8 00000000 */   nop
/* 0AA4EC 001AA3EC 1C004004 */  bltz        $2, .L001AA460
/* 0AA4F0 001AA3F0 00000000 */   nop
/* 0AA4F4 001AA3F4 80180200 */  sll         $3, $2, 2
/* 0AA4F8 001AA3F8 21106200 */  addu        $2, $3, $2
/* 0AA4FC 001AA3FC 00190200 */  sll         $3, $2, 4
/* 0AA500 001AA400 7893828F */  lw          $2, -0x6C88($28)
/* 0AA504 001AA404 21104300 */  addu        $2, $2, $3
/* 0AA508 001AA408 D000A427 */  addiu       $4, $29, 0xD0
/* 0AA50C 001AA40C 30004524 */  addiu       $5, $2, 0x30
/* 0AA510 001AA410 9285040C */  jal         sceVu0Normalize
/* 0AA514 001AA414 00000000 */   nop
/* 0AA518 001AA418 D400A2C7 */  lwc1        $f2, 0xD4($29)
/* 0AA51C 001AA41C 00008044 */  mtc1        $0, $f0
/* 0AA520 001AA420 00000000 */  nop
/* 0AA524 001AA424 34100046 */  c.lt.s      $f2, $f0
/* 0AA528 001AA428 00000000 */  nop
/* 0AA52C 001AA42C 04000045 */  bc1f        .L001AA440
/* 0AA530 001AA430 00000000 */   nop
/* 0AA534 001AA434 87100046 */  neg.s       $f2, $f2
/* 0AA538 001AA438 01000010 */  b           .L001AA440
/* 0AA53C 001AA43C 00000000 */   nop
.L001AA440:
/* 0AA540 001AA440 748281C7 */  lwc1        $f1, -0x7D8C($28)
/* 0AA544 001AA444 36100146 */  c.le.s      $f2, $f1
/* 0AA548 001AA448 00000000 */  nop
/* 0AA54C 001AA44C 04000145 */  bc1t        .L001AA460
/* 0AA550 001AA450 00000000 */   nop
/* 0AA554 001AA454 C400A0C7 */  lwc1        $f0, 0xC4($29)
/* 0AA558 001AA458 00080046 */  add.s       $f0, $f1, $f0
/* 0AA55C 001AA45C 449380E7 */  swc1        $f0, -0x6CBC($28)
.L001AA460:
/* 0AA560 001AA460 A000A427 */  addiu       $4, $29, 0xA0
/* 0AA564 001AA464 D501023C */  lui         $2, %hi(point + 0x120)
/* 0AA568 001AA468 505F4524 */  addiu       $5, $2, %lo(point + 0x120)
/* 0AA56C 001AA46C 0C86040C */  jal         sceVu0CopyVector
/* 0AA570 001AA470 00000000 */   nop
/* 0AA574 001AA474 B000A427 */  addiu       $4, $29, 0xB0
/* 0AA578 001AA478 D501023C */  lui         $2, %hi(point + 0x120)
/* 0AA57C 001AA47C 505F4524 */  addiu       $5, $2, %lo(point + 0x120)
/* 0AA580 001AA480 0C86040C */  jal         sceVu0CopyVector
/* 0AA584 001AA484 00000000 */   nop
/* 0AA588 001AA488 A400A0C7 */  lwc1        $f0, 0xA4($29)
/* 0AA58C 001AA48C 2042023C */  lui         $2, (0x42200000 >> 16)
/* 0AA590 001AA490 00088244 */  mtc1        $2, $f1
/* 0AA594 001AA494 00000000 */  nop
/* 0AA598 001AA498 00000146 */  add.s       $f0, $f0, $f1
/* 0AA59C 001AA49C A400A0E7 */  swc1        $f0, 0xA4($29)
/* 0AA5A0 001AA4A0 B400A0C7 */  lwc1        $f0, 0xB4($29)
/* 0AA5A4 001AA4A4 01000146 */  sub.s       $f0, $f0, $f1
/* 0AA5A8 001AA4A8 B400A0E7 */  swc1        $f0, 0xB4($29)
/* 0AA5AC 001AA4AC 7893848F */  lw          $4, -0x6C88($28)
/* 0AA5B0 001AA4B0 7C93858F */  lw          $5, -0x6C84($28)
/* 0AA5B4 001AA4B4 A000A627 */  addiu       $6, $29, 0xA0
/* 0AA5B8 001AA4B8 B000A727 */  addiu       $7, $29, 0xB0
/* 0AA5BC 001AA4BC C000A827 */  addiu       $8, $29, 0xC0
/* 0AA5C0 001AA4C0 01000924 */  addiu       $9, $0, 0x1
/* 0AA5C4 001AA4C4 28560070 */  paddub      $10, $0, $0
/* 0AA5C8 001AA4C8 5427050C */  jal         CheckHit__FP6CCPolyiPfPfPfii
/* 0AA5CC 001AA4CC 00000000 */   nop
/* 0AA5D0 001AA4D0 1E004004 */  bltz        $2, .L001AA54C
/* 0AA5D4 001AA4D4 00000000 */   nop
/* 0AA5D8 001AA4D8 80180200 */  sll         $3, $2, 2
/* 0AA5DC 001AA4DC 21106200 */  addu        $2, $3, $2
/* 0AA5E0 001AA4E0 00190200 */  sll         $3, $2, 4
/* 0AA5E4 001AA4E4 7893828F */  lw          $2, -0x6C88($28)
/* 0AA5E8 001AA4E8 21104300 */  addu        $2, $2, $3
/* 0AA5EC 001AA4EC D000A427 */  addiu       $4, $29, 0xD0
/* 0AA5F0 001AA4F0 30004524 */  addiu       $5, $2, 0x30
/* 0AA5F4 001AA4F4 9285040C */  jal         sceVu0Normalize
/* 0AA5F8 001AA4F8 00000000 */   nop
/* 0AA5FC 001AA4FC D400A1C7 */  lwc1        $f1, 0xD4($29)
/* 0AA600 001AA500 00008044 */  mtc1        $0, $f0
/* 0AA604 001AA504 00000000 */  nop
/* 0AA608 001AA508 34080046 */  c.lt.s      $f1, $f0
/* 0AA60C 001AA50C 00000000 */  nop
/* 0AA610 001AA510 04000045 */  bc1f        .L001AA524
/* 0AA614 001AA514 00000000 */   nop
/* 0AA618 001AA518 47080046 */  neg.s       $f1, $f1
/* 0AA61C 001AA51C 01000010 */  b           .L001AA524
/* 0AA620 001AA520 00000000 */   nop
.L001AA524:
/* 0AA624 001AA524 748280C7 */  lwc1        $f0, -0x7D8C($28)
/* 0AA628 001AA528 36080046 */  c.le.s      $f1, $f0
/* 0AA62C 001AA52C 00000000 */  nop
/* 0AA630 001AA530 06000145 */  bc1t        .L001AA54C
/* 0AA634 001AA534 00000000 */   nop
/* 0AA638 001AA538 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0AA63C 001AA53C 00088244 */  mtc1        $2, $f1
/* 0AA640 001AA540 C400A0C7 */  lwc1        $f0, 0xC4($29)
/* 0AA644 001AA544 00080046 */  add.s       $f0, $f1, $f0
/* 0AA648 001AA548 409380E7 */  swc1        $f0, -0x6CC0($28)
.L001AA54C:
/* 0AA64C 001AA54C 409380C7 */  lwc1        $f0, -0x6CC0($28)
/* 0AA650 001AA550 449381C7 */  lwc1        $f1, -0x6CBC($28)
/* 0AA654 001AA554 34000146 */  c.lt.s      $f0, $f1
/* 0AA658 001AA558 00000000 */  nop
/* 0AA65C 001AA55C 04000045 */  bc1f        .L001AA570
/* 0AA660 001AA560 00000000 */   nop
/* 0AA664 001AA564 489380E7 */  swc1        $f0, -0x6CB8($28)
/* 0AA668 001AA568 02000010 */  b           .L001AA574
/* 0AA66C 001AA56C 00000000 */   nop
.L001AA570:
/* 0AA670 001AA570 489381E7 */  swc1        $f1, -0x6CB8($28)
.L001AA574:
/* 0AA674 001AA574 389394C7 */  lwc1        $f20, -0x6CC8($28)
/* 0AA678 001AA578 D501023C */  lui         $2, %hi(rod_top)
/* 0AA67C 001AA57C 30644424 */  addiu       $4, $2, %lo(rod_top)
/* 0AA680 001AA580 282E0072 */  paddub      $5, $16, $0
/* 0AA684 001AA584 0C86040C */  jal         sceVu0CopyVector
/* 0AA688 001AA588 00000000 */   nop
/* 0AA68C 001AA58C 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0AA690 001AA590 D501013C */  lui         $1, %hi(rod_top + 0xC)
/* 0AA694 001AA594 3C6423AC */  sw          $3, %lo(rod_top + 0xC)($1)
/* 0AA698 001AA598 D501013C */  lui         $1, %hi(fishhook + 0xC)
/* 0AA69C 001AA59C 4C6423AC */  sw          $3, %lo(fishhook + 0xC)($1)
/* 0AA6A0 001AA5A0 28860070 */  paddub      $16, $0, $0
/* 0AA6A4 001AA5A4 17000010 */  b           .L001AA604
/* 0AA6A8 001AA5A8 00000000 */   nop
.L001AA5AC:
/* 0AA6AC 001AA5AC 00191000 */  sll         $3, $16, 4
/* 0AA6B0 001AA5B0 D501023C */  lui         $2, %hi(velo + 0x4)
/* 0AA6B4 001AA5B4 34614224 */  addiu       $2, $2, %lo(velo + 0x4)
/* 0AA6B8 001AA5B8 21104300 */  addu        $2, $2, $3
/* 0AA6BC 001AA5BC 000041C4 */  lwc1        $f1, 0x0($2)
/* 0AA6C0 001AA5C0 788280C7 */  lwc1        $f0, -0x7D88($28)
/* 0AA6C4 001AA5C4 00080046 */  add.s       $f0, $f1, $f0
/* 0AA6C8 001AA5C8 000040E4 */  swc1        $f0, 0x0($2)
/* 0AA6CC 001AA5CC D501023C */  lui         $2, %hi(velo + 0xC)
/* 0AA6D0 001AA5D0 3C614224 */  addiu       $2, $2, %lo(velo + 0xC)
/* 0AA6D4 001AA5D4 21104300 */  addu        $2, $2, $3
/* 0AA6D8 001AA5D8 000040AC */  sw          $0, 0x0($2)
/* 0AA6DC 001AA5DC D501023C */  lui         $2, %hi(point)
/* 0AA6E0 001AA5E0 305E4224 */  addiu       $2, $2, %lo(point)
/* 0AA6E4 001AA5E4 21204300 */  addu        $4, $2, $3
/* 0AA6E8 001AA5E8 D501023C */  lui         $2, %hi(velo)
/* 0AA6EC 001AA5EC 30614224 */  addiu       $2, $2, %lo(velo)
/* 0AA6F0 001AA5F0 21304300 */  addu        $6, $2, $3
/* 0AA6F4 001AA5F4 282E8070 */  paddub      $5, $4, $0
/* 0AA6F8 001AA5F8 E885040C */  jal         sceVu0AddVector
/* 0AA6FC 001AA5FC 00000000 */   nop
/* 0AA700 001AA600 01001026 */  addiu       $16, $16, 0x1
.L001AA604:
/* 0AA704 001AA604 1800032A */  slti        $3, $16, 0x18
/* 0AA708 001AA608 E8FF6014 */  bnez        $3, .L001AA5AC
/* 0AA70C 001AA60C 00000000 */   nop
/* 0AA710 001AA610 889395C7 */  lwc1        $f21, -0x6C78($28)
/* 0AA714 001AA614 D501013C */  lui         $1, %hi(point + 0x174)
/* 0AA718 001AA618 A45F20C4 */  lwc1        $f0, %lo(point + 0x174)($1)
/* 0AA71C 001AA61C 00001546 */  add.s       $f0, $f0, $f21
/* 0AA720 001AA620 D501013C */  lui         $1, %hi(point + 0x174)
/* 0AA724 001AA624 A45F20E4 */  swc1        $f0, %lo(point + 0x174)($1)
/* 0AA728 001AA628 28860070 */  paddub      $16, $0, $0
/* 0AA72C 001AA62C 18000010 */  b           .L001AA690
/* 0AA730 001AA630 00000000 */   nop
.L001AA634:
/* 0AA734 001AA634 00191000 */  sll         $3, $16, 4
/* 0AA738 001AA638 D501023C */  lui         $2, %hi(hookv + 0x4)
/* 0AA73C 001AA63C 14634224 */  addiu       $2, $2, %lo(hookv + 0x4)
/* 0AA740 001AA640 21104300 */  addu        $2, $2, $3
/* 0AA744 001AA644 000041C4 */  lwc1        $f1, 0x0($2)
/* 0AA748 001AA648 788280C7 */  lwc1        $f0, -0x7D88($28)
/* 0AA74C 001AA64C 00001546 */  add.s       $f0, $f0, $f21
/* 0AA750 001AA650 00080046 */  add.s       $f0, $f1, $f0
/* 0AA754 001AA654 000040E4 */  swc1        $f0, 0x0($2)
/* 0AA758 001AA658 D501023C */  lui         $2, %hi(hookv + 0xC)
/* 0AA75C 001AA65C 1C634224 */  addiu       $2, $2, %lo(hookv + 0xC)
/* 0AA760 001AA660 21104300 */  addu        $2, $2, $3
/* 0AA764 001AA664 000040AC */  sw          $0, 0x0($2)
/* 0AA768 001AA668 D501023C */  lui         $2, %hi(hookp)
/* 0AA76C 001AA66C B0624224 */  addiu       $2, $2, %lo(hookp)
/* 0AA770 001AA670 21204300 */  addu        $4, $2, $3
/* 0AA774 001AA674 D501023C */  lui         $2, %hi(hookv)
/* 0AA778 001AA678 10634224 */  addiu       $2, $2, %lo(hookv)
/* 0AA77C 001AA67C 21304300 */  addu        $6, $2, $3
/* 0AA780 001AA680 282E8070 */  paddub      $5, $4, $0
/* 0AA784 001AA684 E885040C */  jal         sceVu0AddVector
/* 0AA788 001AA688 00000000 */   nop
/* 0AA78C 001AA68C 01001026 */  addiu       $16, $16, 0x1
.L001AA690:
/* 0AA790 001AA690 0300032A */  slti        $3, $16, 0x3
/* 0AA794 001AA694 E7FF6014 */  bnez        $3, .L001AA634
/* 0AA798 001AA698 00000000 */   nop
/* 0AA79C 001AA69C 28860070 */  paddub      $16, $0, $0
/* 0AA7A0 001AA6A0 18000010 */  b           .L001AA704
/* 0AA7A4 001AA6A4 00000000 */   nop
.L001AA6A8:
/* 0AA7A8 001AA6A8 00191000 */  sll         $3, $16, 4
/* 0AA7AC 001AA6AC D501023C */  lui         $2, %hi(ukiv + 0x4)
/* 0AA7B0 001AA6B0 D4634224 */  addiu       $2, $2, %lo(ukiv + 0x4)
/* 0AA7B4 001AA6B4 21104300 */  addu        $2, $2, $3
/* 0AA7B8 001AA6B8 000041C4 */  lwc1        $f1, 0x0($2)
/* 0AA7BC 001AA6BC 788280C7 */  lwc1        $f0, -0x7D88($28)
/* 0AA7C0 001AA6C0 00001546 */  add.s       $f0, $f0, $f21
/* 0AA7C4 001AA6C4 00080046 */  add.s       $f0, $f1, $f0
/* 0AA7C8 001AA6C8 000040E4 */  swc1        $f0, 0x0($2)
/* 0AA7CC 001AA6CC D501023C */  lui         $2, %hi(ukiv + 0xC)
/* 0AA7D0 001AA6D0 DC634224 */  addiu       $2, $2, %lo(ukiv + 0xC)
/* 0AA7D4 001AA6D4 21104300 */  addu        $2, $2, $3
/* 0AA7D8 001AA6D8 000040AC */  sw          $0, 0x0($2)
/* 0AA7DC 001AA6DC D501023C */  lui         $2, %hi(ukip)
/* 0AA7E0 001AA6E0 50634224 */  addiu       $2, $2, %lo(ukip)
/* 0AA7E4 001AA6E4 21204300 */  addu        $4, $2, $3
/* 0AA7E8 001AA6E8 D501023C */  lui         $2, %hi(ukiv)
/* 0AA7EC 001AA6EC D0634224 */  addiu       $2, $2, %lo(ukiv)
/* 0AA7F0 001AA6F0 21304300 */  addu        $6, $2, $3
/* 0AA7F4 001AA6F4 282E8070 */  paddub      $5, $4, $0
/* 0AA7F8 001AA6F8 E885040C */  jal         sceVu0AddVector
/* 0AA7FC 001AA6FC 00000000 */   nop
/* 0AA800 001AA700 01001026 */  addiu       $16, $16, 0x1
.L001AA704:
/* 0AA804 001AA704 0400032A */  slti        $3, $16, 0x4
/* 0AA808 001AA708 E7FF6014 */  bnez        $3, .L001AA6A8
/* 0AA80C 001AA70C 00000000 */   nop
/* 0AA810 001AA710 288E0070 */  paddub      $17, $0, $0
/* 0AA814 001AA714 13010010 */  b           .L001AAB64
/* 0AA818 001AA718 00000000 */   nop
.L001AA71C:
/* 0AA81C 001AA71C D501023C */  lui         $2, %hi(point)
/* 0AA820 001AA720 305E4424 */  addiu       $4, $2, %lo(point)
/* 0AA824 001AA724 D501023C */  lui         $2, %hi(rod_top)
/* 0AA828 001AA728 30644524 */  addiu       $5, $2, %lo(rod_top)
/* 0AA82C 001AA72C 0C86040C */  jal         sceVu0CopyVector
/* 0AA830 001AA730 00000000 */   nop
/* 0AA834 001AA734 D501023C */  lui         $2, %hi(old_p)
/* 0AA838 001AA738 B05F4424 */  addiu       $4, $2, %lo(old_p)
/* 0AA83C 001AA73C D501023C */  lui         $2, %hi(rod_top)
/* 0AA840 001AA740 30644524 */  addiu       $5, $2, %lo(rod_top)
/* 0AA844 001AA744 0C86040C */  jal         sceVu0CopyVector
/* 0AA848 001AA748 00000000 */   nop
/* 0AA84C 001AA74C 01001024 */  addiu       $16, $0, 0x1
/* 0AA850 001AA750 37000010 */  b           .L001AA830
/* 0AA854 001AA754 00000000 */   nop
.L001AA758:
/* 0AA858 001AA758 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 0AA85C 001AA75C 00A88244 */  mtc1        $2, $f21
/* 0AA860 001AA760 17000224 */  addiu       $2, $0, 0x17
/* 0AA864 001AA764 03000216 */  bne         $16, $2, .L001AA774
/* 0AA868 001AA768 00000000 */   nop
/* 0AA86C 001AA76C 848095C7 */  lwc1        $f21, -0x7F7C($28)
/* 0AA870 001AA770 00000000 */  nop
.L001AA774:
/* 0AA874 001AA774 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0AA878 001AA778 00008244 */  mtc1        $2, $f0
/* 0AA87C 001AA77C 00000000 */  nop
/* 0AA880 001AA780 81051546 */  sub.s       $f22, $f0, $f21
/* 0AA884 001AA784 FFFF0226 */  addiu       $2, $16, -0x1
/* 0AA888 001AA788 00190200 */  sll         $3, $2, 4
/* 0AA88C 001AA78C D501023C */  lui         $2, %hi(point)
/* 0AA890 001AA790 305E4224 */  addiu       $2, $2, %lo(point)
/* 0AA894 001AA794 21904300 */  addu        $18, $2, $3
/* 0AA898 001AA798 00191000 */  sll         $3, $16, 4
/* 0AA89C 001AA79C D501023C */  lui         $2, %hi(point)
/* 0AA8A0 001AA7A0 305E4224 */  addiu       $2, $2, %lo(point)
/* 0AA8A4 001AA7A4 21984300 */  addu        $19, $2, $3
/* 0AA8A8 001AA7A8 E000A427 */  addiu       $4, $29, 0xE0
/* 0AA8AC 001AA7AC 282E4072 */  paddub      $5, $18, $0
/* 0AA8B0 001AA7B0 28366072 */  paddub      $6, $19, $0
/* 0AA8B4 001AA7B4 EE85040C */  jal         sceVu0SubVector
/* 0AA8B8 001AA7B8 00000000 */   nop
/* 0AA8BC 001AA7BC E000A427 */  addiu       $4, $29, 0xE0
/* 0AA8C0 001AA7C0 588D040C */  jal         DistVector__FPf
/* 0AA8C4 001AA7C4 00000000 */   nop
/* 0AA8C8 001AA7C8 B48781C7 */  lwc1        $f1, -0x784C($28)
/* 0AA8CC 001AA7CC 81000146 */  sub.s       $f2, $f0, $f1
/* 0AA8D0 001AA7D0 42B00246 */  mul.s       $f1, $f22, $f2
/* 0AA8D4 001AA7D4 030B0046 */  div.s       $f12, $f1, $f0
/* 0AA8D8 001AA7D8 42A80246 */  mul.s       $f1, $f21, $f2
/* 0AA8DC 001AA7DC 430D0046 */  div.s       $f21, $f1, $f0
/* 0AA8E0 001AA7E0 F000A427 */  addiu       $4, $29, 0xF0
/* 0AA8E4 001AA7E4 E000A527 */  addiu       $5, $29, 0xE0
/* 0AA8E8 001AA7E8 FA85040C */  jal         sceVu0ScaleVector
/* 0AA8EC 001AA7EC 00000000 */   nop
/* 0AA8F0 001AA7F0 0001A427 */  addiu       $4, $29, 0x100
/* 0AA8F4 001AA7F4 E000A527 */  addiu       $5, $29, 0xE0
/* 0AA8F8 001AA7F8 06AB0046 */  mov.s       $f12, $f21
/* 0AA8FC 001AA7FC FA85040C */  jal         sceVu0ScaleVector
/* 0AA900 001AA800 00000000 */   nop
/* 0AA904 001AA804 28264072 */  paddub      $4, $18, $0
/* 0AA908 001AA808 282E4072 */  paddub      $5, $18, $0
/* 0AA90C 001AA80C F000A627 */  addiu       $6, $29, 0xF0
/* 0AA910 001AA810 EE85040C */  jal         sceVu0SubVector
/* 0AA914 001AA814 00000000 */   nop
/* 0AA918 001AA818 28266072 */  paddub      $4, $19, $0
/* 0AA91C 001AA81C 282E6072 */  paddub      $5, $19, $0
/* 0AA920 001AA820 0001A627 */  addiu       $6, $29, 0x100
/* 0AA924 001AA824 E885040C */  jal         sceVu0AddVector
/* 0AA928 001AA828 00000000 */   nop
/* 0AA92C 001AA82C 01001026 */  addiu       $16, $16, 0x1
.L001AA830:
/* 0AA930 001AA830 1800022A */  slti        $2, $16, 0x18
/* 0AA934 001AA834 C8FF4014 */  bnez        $2, .L001AA758
/* 0AA938 001AA838 00000000 */   nop
/* 0AA93C 001AA83C D501023C */  lui         $2, %hi(hookp)
/* 0AA940 001AA840 B0624424 */  addiu       $4, $2, %lo(hookp)
/* 0AA944 001AA844 D501023C */  lui         $2, %hi(point + 0x170)
/* 0AA948 001AA848 A05F4524 */  addiu       $5, $2, %lo(point + 0x170)
/* 0AA94C 001AA84C 0C86040C */  jal         sceVu0CopyVector
/* 0AA950 001AA850 00000000 */   nop
/* 0AA954 001AA854 28860070 */  paddub      $16, $0, $0
/* 0AA958 001AA858 3A000010 */  b           .L001AA944
/* 0AA95C 001AA85C 00000000 */   nop
.L001AA860:
/* 0AA960 001AA860 C0201000 */  sll         $4, $16, 3
/* 0AA964 001AA864 2700023C */  lui         $2, %hi(hook_link)
/* 0AA968 001AA868 80AF4224 */  addiu       $2, $2, %lo(hook_link)
/* 0AA96C 001AA86C 21904400 */  addu        $18, $2, $4
/* 0AA970 001AA870 0000428E */  lw          $2, 0x0($18)
/* 0AA974 001AA874 00190200 */  sll         $3, $2, 4
/* 0AA978 001AA878 D501023C */  lui         $2, %hi(hookp)
/* 0AA97C 001AA87C B0624224 */  addiu       $2, $2, %lo(hookp)
/* 0AA980 001AA880 21284300 */  addu        $5, $2, $3
/* 0AA984 001AA884 2700023C */  lui         $2, %hi(hook_link + 0x4)
/* 0AA988 001AA888 84AF4224 */  addiu       $2, $2, %lo(hook_link + 0x4)
/* 0AA98C 001AA88C 21984400 */  addu        $19, $2, $4
/* 0AA990 001AA890 0000628E */  lw          $2, 0x0($19)
/* 0AA994 001AA894 00190200 */  sll         $3, $2, 4
/* 0AA998 001AA898 D501023C */  lui         $2, %hi(hookp)
/* 0AA99C 001AA89C B0624224 */  addiu       $2, $2, %lo(hookp)
/* 0AA9A0 001AA8A0 21304300 */  addu        $6, $2, $3
/* 0AA9A4 001AA8A4 E000A427 */  addiu       $4, $29, 0xE0
/* 0AA9A8 001AA8A8 EE85040C */  jal         sceVu0SubVector
/* 0AA9AC 001AA8AC 00000000 */   nop
/* 0AA9B0 001AA8B0 E000A427 */  addiu       $4, $29, 0xE0
/* 0AA9B4 001AA8B4 588D040C */  jal         DistVector__FPf
/* 0AA9B8 001AA8B8 00000000 */   nop
/* 0AA9BC 001AA8BC 80181000 */  sll         $3, $16, 2
/* 0AA9C0 001AA8C0 D501023C */  lui         $2, %hi(hook_dist)
/* 0AA9C4 001AA8C4 40634224 */  addiu       $2, $2, %lo(hook_dist)
/* 0AA9C8 001AA8C8 21104300 */  addu        $2, $2, $3
/* 0AA9CC 001AA8CC 000041C4 */  lwc1        $f1, 0x0($2)
/* 0AA9D0 001AA8D0 81000146 */  sub.s       $f2, $f0, $f1
/* 0AA9D4 001AA8D4 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 0AA9D8 001AA8D8 00088244 */  mtc1        $2, $f1
/* 0AA9DC 001AA8DC 00000000 */  nop
/* 0AA9E0 001AA8E0 42080246 */  mul.s       $f1, $f1, $f2
/* 0AA9E4 001AA8E4 030B0046 */  div.s       $f12, $f1, $f0
/* 0AA9E8 001AA8E8 F000A427 */  addiu       $4, $29, 0xF0
/* 0AA9EC 001AA8EC E000A527 */  addiu       $5, $29, 0xE0
/* 0AA9F0 001AA8F0 FA85040C */  jal         sceVu0ScaleVector
/* 0AA9F4 001AA8F4 00000000 */   nop
/* 0AA9F8 001AA8F8 0000428E */  lw          $2, 0x0($18)
/* 0AA9FC 001AA8FC 00190200 */  sll         $3, $2, 4
/* 0AAA00 001AA900 D501023C */  lui         $2, %hi(hookp)
/* 0AAA04 001AA904 B0624224 */  addiu       $2, $2, %lo(hookp)
/* 0AAA08 001AA908 21204300 */  addu        $4, $2, $3
/* 0AAA0C 001AA90C 282E8070 */  paddub      $5, $4, $0
/* 0AAA10 001AA910 F000A627 */  addiu       $6, $29, 0xF0
/* 0AAA14 001AA914 EE85040C */  jal         sceVu0SubVector
/* 0AAA18 001AA918 00000000 */   nop
/* 0AAA1C 001AA91C 0000628E */  lw          $2, 0x0($19)
/* 0AAA20 001AA920 00190200 */  sll         $3, $2, 4
/* 0AAA24 001AA924 D501023C */  lui         $2, %hi(hookp)
/* 0AAA28 001AA928 B0624224 */  addiu       $2, $2, %lo(hookp)
/* 0AAA2C 001AA92C 21204300 */  addu        $4, $2, $3
/* 0AAA30 001AA930 282E8070 */  paddub      $5, $4, $0
/* 0AAA34 001AA934 F000A627 */  addiu       $6, $29, 0xF0
/* 0AAA38 001AA938 E885040C */  jal         sceVu0AddVector
/* 0AAA3C 001AA93C 00000000 */   nop
/* 0AAA40 001AA940 01001026 */  addiu       $16, $16, 0x1
.L001AA944:
/* 0AAA44 001AA944 0300022A */  slti        $2, $16, 0x3
/* 0AAA48 001AA948 C5FF4014 */  bnez        $2, .L001AA860
/* 0AAA4C 001AA94C 00000000 */   nop
/* 0AAA50 001AA950 E000A427 */  addiu       $4, $29, 0xE0
/* 0AAA54 001AA954 D501023C */  lui         $2, %hi(point + 0x120)
/* 0AAA58 001AA958 505F4524 */  addiu       $5, $2, %lo(point + 0x120)
/* 0AAA5C 001AA95C D501023C */  lui         $2, %hi(ukip)
/* 0AAA60 001AA960 50634624 */  addiu       $6, $2, %lo(ukip)
/* 0AAA64 001AA964 EE85040C */  jal         sceVu0SubVector
/* 0AAA68 001AA968 00000000 */   nop
/* 0AAA6C 001AA96C E000A427 */  addiu       $4, $29, 0xE0
/* 0AAA70 001AA970 588D040C */  jal         DistVector__FPf
/* 0AAA74 001AA974 00000000 */   nop
/* 0AAA78 001AA978 008281C7 */  lwc1        $f1, -0x7E00($28)
/* 0AAA7C 001AA97C 42000146 */  mul.s       $f1, $f0, $f1
/* 0AAA80 001AA980 030B0046 */  div.s       $f12, $f1, $f0
/* 0AAA84 001AA984 748281C7 */  lwc1        $f1, -0x7D8C($28)
/* 0AAA88 001AA988 42000146 */  mul.s       $f1, $f0, $f1
/* 0AAA8C 001AA98C 430D0046 */  div.s       $f21, $f1, $f0
/* 0AAA90 001AA990 F000A427 */  addiu       $4, $29, 0xF0
/* 0AAA94 001AA994 E000A527 */  addiu       $5, $29, 0xE0
/* 0AAA98 001AA998 FA85040C */  jal         sceVu0ScaleVector
/* 0AAA9C 001AA99C 00000000 */   nop
/* 0AAAA0 001AA9A0 0001A427 */  addiu       $4, $29, 0x100
/* 0AAAA4 001AA9A4 E000A527 */  addiu       $5, $29, 0xE0
/* 0AAAA8 001AA9A8 06AB0046 */  mov.s       $f12, $f21
/* 0AAAAC 001AA9AC FA85040C */  jal         sceVu0ScaleVector
/* 0AAAB0 001AA9B0 00000000 */   nop
/* 0AAAB4 001AA9B4 D501023C */  lui         $2, %hi(point + 0x120)
/* 0AAAB8 001AA9B8 505F4424 */  addiu       $4, $2, %lo(point + 0x120)
/* 0AAABC 001AA9BC D501023C */  lui         $2, %hi(point + 0x120)
/* 0AAAC0 001AA9C0 505F4524 */  addiu       $5, $2, %lo(point + 0x120)
/* 0AAAC4 001AA9C4 F000A627 */  addiu       $6, $29, 0xF0
/* 0AAAC8 001AA9C8 EE85040C */  jal         sceVu0SubVector
/* 0AAACC 001AA9CC 00000000 */   nop
/* 0AAAD0 001AA9D0 D501023C */  lui         $2, %hi(ukip)
/* 0AAAD4 001AA9D4 50634424 */  addiu       $4, $2, %lo(ukip)
/* 0AAAD8 001AA9D8 D501023C */  lui         $2, %hi(ukip)
/* 0AAADC 001AA9DC 50634524 */  addiu       $5, $2, %lo(ukip)
/* 0AAAE0 001AA9E0 0001A627 */  addiu       $6, $29, 0x100
/* 0AAAE4 001AA9E4 E885040C */  jal         sceVu0AddVector
/* 0AAAE8 001AA9E8 00000000 */   nop
/* 0AAAEC 001AA9EC 28860070 */  paddub      $16, $0, $0
/* 0AAAF0 001AA9F0 3A000010 */  b           .L001AAADC
/* 0AAAF4 001AA9F4 00000000 */   nop
.L001AA9F8:
/* 0AAAF8 001AA9F8 C0201000 */  sll         $4, $16, 3
/* 0AAAFC 001AA9FC 2700023C */  lui         $2, %hi(uki_link)
/* 0AAB00 001AAA00 A0AF4224 */  addiu       $2, $2, %lo(uki_link)
/* 0AAB04 001AAA04 21904400 */  addu        $18, $2, $4
/* 0AAB08 001AAA08 0000428E */  lw          $2, 0x0($18)
/* 0AAB0C 001AAA0C 00190200 */  sll         $3, $2, 4
/* 0AAB10 001AAA10 D501023C */  lui         $2, %hi(ukip)
/* 0AAB14 001AAA14 50634224 */  addiu       $2, $2, %lo(ukip)
/* 0AAB18 001AAA18 21284300 */  addu        $5, $2, $3
/* 0AAB1C 001AAA1C 2700023C */  lui         $2, %hi(uki_link + 0x4)
/* 0AAB20 001AAA20 A4AF4224 */  addiu       $2, $2, %lo(uki_link + 0x4)
/* 0AAB24 001AAA24 21984400 */  addu        $19, $2, $4
/* 0AAB28 001AAA28 0000628E */  lw          $2, 0x0($19)
/* 0AAB2C 001AAA2C 00190200 */  sll         $3, $2, 4
/* 0AAB30 001AAA30 D501023C */  lui         $2, %hi(ukip)
/* 0AAB34 001AAA34 50634224 */  addiu       $2, $2, %lo(ukip)
/* 0AAB38 001AAA38 21304300 */  addu        $6, $2, $3
/* 0AAB3C 001AAA3C E000A427 */  addiu       $4, $29, 0xE0
/* 0AAB40 001AAA40 EE85040C */  jal         sceVu0SubVector
/* 0AAB44 001AAA44 00000000 */   nop
/* 0AAB48 001AAA48 E000A427 */  addiu       $4, $29, 0xE0
/* 0AAB4C 001AAA4C 588D040C */  jal         DistVector__FPf
/* 0AAB50 001AAA50 00000000 */   nop
/* 0AAB54 001AAA54 80181000 */  sll         $3, $16, 2
/* 0AAB58 001AAA58 D501023C */  lui         $2, %hi(uki_dist)
/* 0AAB5C 001AAA5C 10644224 */  addiu       $2, $2, %lo(uki_dist)
/* 0AAB60 001AAA60 21104300 */  addu        $2, $2, $3
/* 0AAB64 001AAA64 000041C4 */  lwc1        $f1, 0x0($2)
/* 0AAB68 001AAA68 81000146 */  sub.s       $f2, $f0, $f1
/* 0AAB6C 001AAA6C 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 0AAB70 001AAA70 00088244 */  mtc1        $2, $f1
/* 0AAB74 001AAA74 00000000 */  nop
/* 0AAB78 001AAA78 42080246 */  mul.s       $f1, $f1, $f2
/* 0AAB7C 001AAA7C 030B0046 */  div.s       $f12, $f1, $f0
/* 0AAB80 001AAA80 F000A427 */  addiu       $4, $29, 0xF0
/* 0AAB84 001AAA84 E000A527 */  addiu       $5, $29, 0xE0
/* 0AAB88 001AAA88 FA85040C */  jal         sceVu0ScaleVector
/* 0AAB8C 001AAA8C 00000000 */   nop
/* 0AAB90 001AAA90 0000428E */  lw          $2, 0x0($18)
/* 0AAB94 001AAA94 00190200 */  sll         $3, $2, 4
/* 0AAB98 001AAA98 D501023C */  lui         $2, %hi(ukip)
/* 0AAB9C 001AAA9C 50634224 */  addiu       $2, $2, %lo(ukip)
/* 0AABA0 001AAAA0 21204300 */  addu        $4, $2, $3
/* 0AABA4 001AAAA4 282E8070 */  paddub      $5, $4, $0
/* 0AABA8 001AAAA8 F000A627 */  addiu       $6, $29, 0xF0
/* 0AABAC 001AAAAC EE85040C */  jal         sceVu0SubVector
/* 0AABB0 001AAAB0 00000000 */   nop
/* 0AABB4 001AAAB4 0000628E */  lw          $2, 0x0($19)
/* 0AABB8 001AAAB8 00190200 */  sll         $3, $2, 4
/* 0AABBC 001AAABC D501023C */  lui         $2, %hi(ukip)
/* 0AABC0 001AAAC0 50634224 */  addiu       $2, $2, %lo(ukip)
/* 0AABC4 001AAAC4 21204300 */  addu        $4, $2, $3
/* 0AABC8 001AAAC8 282E8070 */  paddub      $5, $4, $0
/* 0AABCC 001AAACC F000A627 */  addiu       $6, $29, 0xF0
/* 0AABD0 001AAAD0 E885040C */  jal         sceVu0AddVector
/* 0AABD4 001AAAD4 00000000 */   nop
/* 0AABD8 001AAAD8 01001026 */  addiu       $16, $16, 0x1
.L001AAADC:
/* 0AABDC 001AAADC 0600032A */  slti        $3, $16, 0x6
/* 0AABE0 001AAAE0 C5FF6014 */  bnez        $3, .L001AA9F8
/* 0AABE4 001AAAE4 00000000 */   nop
/* 0AABE8 001AAAE8 8093838F */  lw          $3, -0x6C80($28)
/* 0AABEC 001AAAEC 0D006010 */  beqz        $3, .L001AAB24
/* 0AABF0 001AAAF0 00000000 */   nop
/* 0AABF4 001AAAF4 D501023C */  lui         $2, %hi(point + 0x170)
/* 0AABF8 001AAAF8 A05F4424 */  addiu       $4, $2, %lo(point + 0x170)
/* 0AABFC 001AAAFC D501023C */  lui         $2, %hi(fishhook)
/* 0AAC00 001AAB00 40644524 */  addiu       $5, $2, %lo(fishhook)
/* 0AAC04 001AAB04 0C86040C */  jal         sceVu0CopyVector
/* 0AAC08 001AAB08 00000000 */   nop
/* 0AAC0C 001AAB0C D501023C */  lui         $2, %hi(hookp)
/* 0AAC10 001AAB10 B0624424 */  addiu       $4, $2, %lo(hookp)
/* 0AAC14 001AAB14 D501023C */  lui         $2, %hi(fishhook)
/* 0AAC18 001AAB18 40644524 */  addiu       $5, $2, %lo(fishhook)
/* 0AAC1C 001AAB1C 0C86040C */  jal         sceVu0CopyVector
/* 0AAC20 001AAB20 00000000 */   nop
.L001AAB24:
/* 0AAC24 001AAB24 8493838F */  lw          $3, -0x6C7C($28)
/* 0AAC28 001AAB28 0D006010 */  beqz        $3, .L001AAB60
/* 0AAC2C 001AAB2C 00000000 */   nop
/* 0AAC30 001AAB30 D501023C */  lui         $2, %hi(point + 0x120)
/* 0AAC34 001AAB34 505F4424 */  addiu       $4, $2, %lo(point + 0x120)
/* 0AAC38 001AAB38 D501023C */  lui         $2, %hi(uki)
/* 0AAC3C 001AAB3C 50644524 */  addiu       $5, $2, %lo(uki)
/* 0AAC40 001AAB40 0C86040C */  jal         sceVu0CopyVector
/* 0AAC44 001AAB44 00000000 */   nop
/* 0AAC48 001AAB48 D501023C */  lui         $2, %hi(ukip)
/* 0AAC4C 001AAB4C 50634424 */  addiu       $4, $2, %lo(ukip)
/* 0AAC50 001AAB50 D501023C */  lui         $2, %hi(uki)
/* 0AAC54 001AAB54 50644524 */  addiu       $5, $2, %lo(uki)
/* 0AAC58 001AAB58 0C86040C */  jal         sceVu0CopyVector
/* 0AAC5C 001AAB5C 00000000 */   nop
.L001AAB60:
/* 0AAC60 001AAB60 01003126 */  addiu       $17, $17, 0x1
.L001AAB64:
/* 0AAC64 001AAB64 1000232A */  slti        $3, $17, 0x10
/* 0AAC68 001AAB68 ECFE6014 */  bnez        $3, .L001AA71C
/* 0AAC6C 001AAB6C 00000000 */   nop
/* 0AAC70 001AAB70 28860070 */  paddub      $16, $0, $0
/* 0AAC74 001AAB74 53000010 */  b           .L001AACC4
/* 0AAC78 001AAB78 00000000 */   nop
.L001AAB7C:
/* 0AAC7C 001AAB7C 00891000 */  sll         $17, $16, 4
/* 0AAC80 001AAB80 D501023C */  lui         $2, %hi(velo)
/* 0AAC84 001AAB84 30614224 */  addiu       $2, $2, %lo(velo)
/* 0AAC88 001AAB88 21905100 */  addu        $18, $2, $17
/* 0AAC8C 001AAB8C D501023C */  lui         $2, %hi(point)
/* 0AAC90 001AAB90 305E4224 */  addiu       $2, $2, %lo(point)
/* 0AAC94 001AAB94 21985100 */  addu        $19, $2, $17
/* 0AAC98 001AAB98 D501023C */  lui         $2, %hi(old_p)
/* 0AAC9C 001AAB9C B05F4224 */  addiu       $2, $2, %lo(old_p)
/* 0AACA0 001AABA0 21A05100 */  addu        $20, $2, $17
/* 0AACA4 001AABA4 28264072 */  paddub      $4, $18, $0
/* 0AACA8 001AABA8 282E6072 */  paddub      $5, $19, $0
/* 0AACAC 001AABAC 28368072 */  paddub      $6, $20, $0
/* 0AACB0 001AABB0 EE85040C */  jal         sceVu0SubVector
/* 0AACB4 001AABB4 00000000 */   nop
/* 0AACB8 001AABB8 17000224 */  addiu       $2, $0, 0x17
/* 0AACBC 001AABBC 08000212 */  beq         $16, $2, .L001AABE0
/* 0AACC0 001AABC0 00000000 */   nop
/* 0AACC4 001AABC4 28264072 */  paddub      $4, $18, $0
/* 0AACC8 001AABC8 282E4072 */  paddub      $5, $18, $0
/* 0AACCC 001AABCC 90808CC7 */  lwc1        $f12, -0x7F70($28)
/* 0AACD0 001AABD0 FA85040C */  jal         sceVu0ScaleVector
/* 0AACD4 001AABD4 00000000 */   nop
/* 0AACD8 001AABD8 06000010 */  b           .L001AABF4
/* 0AACDC 001AABDC 00000000 */   nop
.L001AABE0:
/* 0AACE0 001AABE0 28264072 */  paddub      $4, $18, $0
/* 0AACE4 001AABE4 282E4072 */  paddub      $5, $18, $0
/* 0AACE8 001AABE8 7C828CC7 */  lwc1        $f12, -0x7D84($28)
/* 0AACEC 001AABEC FA85040C */  jal         sceVu0ScaleVector
/* 0AACF0 001AABF0 00000000 */   nop
.L001AABF4:
/* 0AACF4 001AABF4 D501023C */  lui         $2, %hi(point + 0x4)
/* 0AACF8 001AABF8 345E4224 */  addiu       $2, $2, %lo(point + 0x4)
/* 0AACFC 001AABFC 21185100 */  addu        $3, $2, $17
/* 0AAD00 001AAC00 000060C4 */  lwc1        $f0, 0x0($3)
/* 0AAD04 001AAC04 489381C7 */  lwc1        $f1, -0x6CB8($28)
/* 0AAD08 001AAC08 34000146 */  c.lt.s      $f0, $f1
/* 0AAD0C 001AAC0C 00000000 */  nop
/* 0AAD10 001AAC10 13000045 */  bc1f        .L001AAC60
/* 0AAD14 001AAC14 00000000 */   nop
/* 0AAD18 001AAC18 000061E4 */  swc1        $f1, 0x0($3)
/* 0AAD1C 001AAC1C 000040C6 */  lwc1        $f0, 0x0($18)
/* 0AAD20 001AAC20 D48182C7 */  lwc1        $f2, -0x7E2C($28)
/* 0AAD24 001AAC24 02000246 */  mul.s       $f0, $f0, $f2
/* 0AAD28 001AAC28 000040E6 */  swc1        $f0, 0x0($18)
/* 0AAD2C 001AAC2C D501023C */  lui         $2, %hi(velo + 0x4)
/* 0AAD30 001AAC30 34614224 */  addiu       $2, $2, %lo(velo + 0x4)
/* 0AAD34 001AAC34 21105100 */  addu        $2, $2, $17
/* 0AAD38 001AAC38 000041C4 */  lwc1        $f1, 0x0($2)
/* 0AAD3C 001AAC3C 808280C7 */  lwc1        $f0, -0x7D80($28)
/* 0AAD40 001AAC40 02080046 */  mul.s       $f0, $f1, $f0
/* 0AAD44 001AAC44 000040E4 */  swc1        $f0, 0x0($2)
/* 0AAD48 001AAC48 D501023C */  lui         $2, %hi(velo + 0x8)
/* 0AAD4C 001AAC4C 38614224 */  addiu       $2, $2, %lo(velo + 0x8)
/* 0AAD50 001AAC50 21105100 */  addu        $2, $2, $17
/* 0AAD54 001AAC54 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AAD58 001AAC58 02000246 */  mul.s       $f0, $f0, $f2
/* 0AAD5C 001AAC5C 000040E4 */  swc1        $f0, 0x0($2)
.L001AAC60:
/* 0AAD60 001AAC60 000060C4 */  lwc1        $f0, 0x0($3)
/* 0AAD64 001AAC64 34001446 */  c.lt.s      $f0, $f20
/* 0AAD68 001AAC68 00000000 */  nop
/* 0AAD6C 001AAC6C 10000045 */  bc1f        .L001AACB0
/* 0AAD70 001AAC70 00000000 */   nop
/* 0AAD74 001AAC74 28264072 */  paddub      $4, $18, $0
/* 0AAD78 001AAC78 282E4072 */  paddub      $5, $18, $0
/* 0AAD7C 001AAC7C D4818CC7 */  lwc1        $f12, -0x7E2C($28)
/* 0AAD80 001AAC80 FA85040C */  jal         sceVu0ScaleVector
/* 0AAD84 001AAC84 00000000 */   nop
/* 0AAD88 001AAC88 1300012A */  slti        $1, $16, 0x13
/* 0AAD8C 001AAC8C 08002010 */  beqz        $1, .L001AACB0
/* 0AAD90 001AAC90 00000000 */   nop
/* 0AAD94 001AAC94 D501023C */  lui         $2, %hi(velo + 0x4)
/* 0AAD98 001AAC98 34614224 */  addiu       $2, $2, %lo(velo + 0x4)
/* 0AAD9C 001AAC9C 21105100 */  addu        $2, $2, $17
/* 0AADA0 001AACA0 000041C4 */  lwc1        $f1, 0x0($2)
/* 0AADA4 001AACA4 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 0AADA8 001AACA8 00080046 */  add.s       $f0, $f1, $f0
/* 0AADAC 001AACAC 000040E4 */  swc1        $f0, 0x0($2)
.L001AACB0:
/* 0AADB0 001AACB0 28268072 */  paddub      $4, $20, $0
/* 0AADB4 001AACB4 282E6072 */  paddub      $5, $19, $0
/* 0AADB8 001AACB8 0C86040C */  jal         sceVu0CopyVector
/* 0AADBC 001AACBC 00000000 */   nop
/* 0AADC0 001AACC0 01001026 */  addiu       $16, $16, 0x1
.L001AACC4:
/* 0AADC4 001AACC4 1800032A */  slti        $3, $16, 0x18
/* 0AADC8 001AACC8 ACFF6014 */  bnez        $3, .L001AAB7C
/* 0AADCC 001AACCC 00000000 */   nop
/* 0AADD0 001AACD0 28860070 */  paddub      $16, $0, $0
/* 0AADD4 001AACD4 36000010 */  b           .L001AADB0
/* 0AADD8 001AACD8 00000000 */   nop
.L001AACDC:
/* 0AADDC 001AACDC 00891000 */  sll         $17, $16, 4
/* 0AADE0 001AACE0 D501023C */  lui         $2, %hi(hookv)
/* 0AADE4 001AACE4 10634224 */  addiu       $2, $2, %lo(hookv)
/* 0AADE8 001AACE8 21905100 */  addu        $18, $2, $17
/* 0AADEC 001AACEC D501023C */  lui         $2, %hi(hookp)
/* 0AADF0 001AACF0 B0624224 */  addiu       $2, $2, %lo(hookp)
/* 0AADF4 001AACF4 21985100 */  addu        $19, $2, $17
/* 0AADF8 001AACF8 D501023C */  lui         $2, %hi(hookop)
/* 0AADFC 001AACFC E0624224 */  addiu       $2, $2, %lo(hookop)
/* 0AAE00 001AAD00 21A05100 */  addu        $20, $2, $17
/* 0AAE04 001AAD04 28264072 */  paddub      $4, $18, $0
/* 0AAE08 001AAD08 282E6072 */  paddub      $5, $19, $0
/* 0AAE0C 001AAD0C 28368072 */  paddub      $6, $20, $0
/* 0AAE10 001AAD10 EE85040C */  jal         sceVu0SubVector
/* 0AAE14 001AAD14 00000000 */   nop
/* 0AAE18 001AAD18 D501023C */  lui         $2, %hi(hookp + 0x4)
/* 0AAE1C 001AAD1C B4624224 */  addiu       $2, $2, %lo(hookp + 0x4)
/* 0AAE20 001AAD20 21105100 */  addu        $2, $2, $17
/* 0AAE24 001AAD24 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AAE28 001AAD28 449381C7 */  lwc1        $f1, -0x6CBC($28)
/* 0AAE2C 001AAD2C 34000146 */  c.lt.s      $f0, $f1
/* 0AAE30 001AAD30 00000000 */  nop
/* 0AAE34 001AAD34 14000045 */  bc1f        .L001AAD88
/* 0AAE38 001AAD38 00000000 */   nop
/* 0AAE3C 001AAD3C 000041E4 */  swc1        $f1, 0x0($2)
/* 0AAE40 001AAD40 000041C6 */  lwc1        $f1, 0x0($18)
/* 0AAE44 001AAD44 008280C7 */  lwc1        $f0, -0x7E00($28)
/* 0AAE48 001AAD48 02080046 */  mul.s       $f0, $f1, $f0
/* 0AAE4C 001AAD4C 000040E6 */  swc1        $f0, 0x0($18)
/* 0AAE50 001AAD50 D501023C */  lui         $2, %hi(hookv + 0x4)
/* 0AAE54 001AAD54 14634224 */  addiu       $2, $2, %lo(hookv + 0x4)
/* 0AAE58 001AAD58 21105100 */  addu        $2, $2, $17
/* 0AAE5C 001AAD5C 000041C4 */  lwc1        $f1, 0x0($2)
/* 0AAE60 001AAD60 848280C7 */  lwc1        $f0, -0x7D7C($28)
/* 0AAE64 001AAD64 02080046 */  mul.s       $f0, $f1, $f0
/* 0AAE68 001AAD68 000040E4 */  swc1        $f0, 0x0($2)
/* 0AAE6C 001AAD6C D501023C */  lui         $2, %hi(hookv + 0x8)
/* 0AAE70 001AAD70 18634224 */  addiu       $2, $2, %lo(hookv + 0x8)
/* 0AAE74 001AAD74 21105100 */  addu        $2, $2, $17
/* 0AAE78 001AAD78 000041C4 */  lwc1        $f1, 0x0($2)
/* 0AAE7C 001AAD7C 008280C7 */  lwc1        $f0, -0x7E00($28)
/* 0AAE80 001AAD80 02080046 */  mul.s       $f0, $f1, $f0
/* 0AAE84 001AAD84 000040E4 */  swc1        $f0, 0x0($2)
.L001AAD88:
/* 0AAE88 001AAD88 28268072 */  paddub      $4, $20, $0
/* 0AAE8C 001AAD8C 282E6072 */  paddub      $5, $19, $0
/* 0AAE90 001AAD90 0C86040C */  jal         sceVu0CopyVector
/* 0AAE94 001AAD94 00000000 */   nop
/* 0AAE98 001AAD98 28264072 */  paddub      $4, $18, $0
/* 0AAE9C 001AAD9C 282E4072 */  paddub      $5, $18, $0
/* 0AAEA0 001AADA0 88828CC7 */  lwc1        $f12, -0x7D78($28)
/* 0AAEA4 001AADA4 FA85040C */  jal         sceVu0ScaleVector
/* 0AAEA8 001AADA8 00000000 */   nop
/* 0AAEAC 001AADAC 01001026 */  addiu       $16, $16, 0x1
.L001AADB0:
/* 0AAEB0 001AADB0 0300032A */  slti        $3, $16, 0x3
/* 0AAEB4 001AADB4 C9FF6014 */  bnez        $3, .L001AACDC
/* 0AAEB8 001AADB8 00000000 */   nop
/* 0AAEBC 001AADBC 28860070 */  paddub      $16, $0, $0
/* 0AAEC0 001AADC0 B2000010 */  b           .L001AB08C
/* 0AAEC4 001AADC4 00000000 */   nop
.L001AADC8:
/* 0AAEC8 001AADC8 00891000 */  sll         $17, $16, 4
/* 0AAECC 001AADCC D501023C */  lui         $2, %hi(ukiv)
/* 0AAED0 001AADD0 D0634224 */  addiu       $2, $2, %lo(ukiv)
/* 0AAED4 001AADD4 21985100 */  addu        $19, $2, $17
/* 0AAED8 001AADD8 D501023C */  lui         $2, %hi(ukip)
/* 0AAEDC 001AADDC 50634224 */  addiu       $2, $2, %lo(ukip)
/* 0AAEE0 001AADE0 21A05100 */  addu        $20, $2, $17
/* 0AAEE4 001AADE4 D501023C */  lui         $2, %hi(ukiop)
/* 0AAEE8 001AADE8 90634224 */  addiu       $2, $2, %lo(ukiop)
/* 0AAEEC 001AADEC 21A85100 */  addu        $21, $2, $17
/* 0AAEF0 001AADF0 28266072 */  paddub      $4, $19, $0
/* 0AAEF4 001AADF4 282E8072 */  paddub      $5, $20, $0
/* 0AAEF8 001AADF8 2836A072 */  paddub      $6, $21, $0
/* 0AAEFC 001AADFC EE85040C */  jal         sceVu0SubVector
/* 0AAF00 001AAE00 00000000 */   nop
/* 0AAF04 001AAE04 D501023C */  lui         $2, %hi(ukip + 0x4)
/* 0AAF08 001AAE08 54634224 */  addiu       $2, $2, %lo(ukip + 0x4)
/* 0AAF0C 001AAE0C 21905100 */  addu        $18, $2, $17
/* 0AAF10 001AAE10 000040C6 */  lwc1        $f0, 0x0($18)
/* 0AAF14 001AAE14 409381C7 */  lwc1        $f1, -0x6CC0($28)
/* 0AAF18 001AAE18 34000146 */  c.lt.s      $f0, $f1
/* 0AAF1C 001AAE1C 00000000 */  nop
/* 0AAF20 001AAE20 13000045 */  bc1f        .L001AAE70
/* 0AAF24 001AAE24 00000000 */   nop
/* 0AAF28 001AAE28 000041E6 */  swc1        $f1, 0x0($18)
/* 0AAF2C 001AAE2C 000060C6 */  lwc1        $f0, 0x0($19)
/* 0AAF30 001AAE30 A08082C7 */  lwc1        $f2, -0x7F60($28)
/* 0AAF34 001AAE34 02000246 */  mul.s       $f0, $f0, $f2
/* 0AAF38 001AAE38 000060E6 */  swc1        $f0, 0x0($19)
/* 0AAF3C 001AAE3C D501023C */  lui         $2, %hi(ukiv + 0x4)
/* 0AAF40 001AAE40 D4634224 */  addiu       $2, $2, %lo(ukiv + 0x4)
/* 0AAF44 001AAE44 21105100 */  addu        $2, $2, $17
/* 0AAF48 001AAE48 000041C4 */  lwc1        $f1, 0x0($2)
/* 0AAF4C 001AAE4C 8C8280C7 */  lwc1        $f0, -0x7D74($28)
/* 0AAF50 001AAE50 02080046 */  mul.s       $f0, $f1, $f0
/* 0AAF54 001AAE54 000040E4 */  swc1        $f0, 0x0($2)
/* 0AAF58 001AAE58 D501023C */  lui         $2, %hi(ukiv + 0x8)
/* 0AAF5C 001AAE5C D8634224 */  addiu       $2, $2, %lo(ukiv + 0x8)
/* 0AAF60 001AAE60 21105100 */  addu        $2, $2, $17
/* 0AAF64 001AAE64 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AAF68 001AAE68 02000246 */  mul.s       $f0, $f0, $f2
/* 0AAF6C 001AAE6C 000040E4 */  swc1        $f0, 0x0($2)
.L001AAE70:
/* 0AAF70 001AAE70 18000012 */  beqz        $16, .L001AAED4
/* 0AAF74 001AAE74 00000000 */   nop
/* 0AAF78 001AAE78 000040C6 */  lwc1        $f0, 0x0($18)
/* 0AAF7C 001AAE7C 34001446 */  c.lt.s      $f0, $f20
/* 0AAF80 001AAE80 00000000 */  nop
/* 0AAF84 001AAE84 13000045 */  bc1f        .L001AAED4
/* 0AAF88 001AAE88 00000000 */   nop
/* 0AAF8C 001AAE8C D501013C */  lui         $1, %hi(ukip + 0x4)
/* 0AAF90 001AAE90 546320C4 */  lwc1        $f0, %lo(ukip + 0x4)($1)
/* 0AAF94 001AAE94 34001446 */  c.lt.s      $f0, $f20
/* 0AAF98 001AAE98 00000000 */  nop
/* 0AAF9C 001AAE9C 0D000045 */  bc1f        .L001AAED4
/* 0AAFA0 001AAEA0 00000000 */   nop
/* 0AAFA4 001AAEA4 28266072 */  paddub      $4, $19, $0
/* 0AAFA8 001AAEA8 282E6072 */  paddub      $5, $19, $0
/* 0AAFAC 001AAEAC A0808CC7 */  lwc1        $f12, -0x7F60($28)
/* 0AAFB0 001AAEB0 FA85040C */  jal         sceVu0ScaleVector
/* 0AAFB4 001AAEB4 00000000 */   nop
/* 0AAFB8 001AAEB8 D501023C */  lui         $2, %hi(ukiv + 0x4)
/* 0AAFBC 001AAEBC D4634224 */  addiu       $2, $2, %lo(ukiv + 0x4)
/* 0AAFC0 001AAEC0 21105100 */  addu        $2, $2, $17
/* 0AAFC4 001AAEC4 000041C4 */  lwc1        $f1, 0x0($2)
/* 0AAFC8 001AAEC8 908280C7 */  lwc1        $f0, -0x7D70($28)
/* 0AAFCC 001AAECC 00080046 */  add.s       $f0, $f1, $f0
/* 0AAFD0 001AAED0 000040E4 */  swc1        $f0, 0x0($2)
.L001AAED4:
/* 0AAFD4 001AAED4 D501013C */  lui         $1, %hi(ukip + 0x4)
/* 0AAFD8 001AAED8 546323C4 */  lwc1        $f3, %lo(ukip + 0x4)($1)
/* 0AAFDC 001AAEDC 34181446 */  c.lt.s      $f3, $f20
/* 0AAFE0 001AAEE0 00000000 */  nop
/* 0AAFE4 001AAEE4 33000045 */  bc1f        .L001AAFB4
/* 0AAFE8 001AAEE8 00000000 */   nop
/* 0AAFEC 001AAEEC 000040C6 */  lwc1        $f0, 0x0($18)
/* 0AAFF0 001AAEF0 34001446 */  c.lt.s      $f0, $f20
/* 0AAFF4 001AAEF4 00000000 */  nop
/* 0AAFF8 001AAEF8 2E000145 */  bc1t        .L001AAFB4
/* 0AAFFC 001AAEFC 00000000 */   nop
/* 0AB000 001AAF00 01190046 */  sub.s       $f4, $f3, $f0
/* 0AB004 001AAF04 86200046 */  mov.s       $f2, $f4
/* 0AB008 001AAF08 00008044 */  mtc1        $0, $f0
/* 0AB00C 001AAF0C 00000000 */  nop
/* 0AB010 001AAF10 34200046 */  c.lt.s      $f4, $f0
/* 0AB014 001AAF14 00000000 */  nop
/* 0AB018 001AAF18 04000045 */  bc1f        .L001AAF2C
/* 0AB01C 001AAF1C 00000000 */   nop
/* 0AB020 001AAF20 87200046 */  neg.s       $f2, $f4
/* 0AB024 001AAF24 01000010 */  b           .L001AAF2C
/* 0AB028 001AAF28 00000000 */   nop
.L001AAF2C:
/* 0AB02C 001AAF2C 000060C6 */  lwc1        $f0, 0x0($19)
/* 0AB030 001AAF30 A08081C7 */  lwc1        $f1, -0x7F60($28)
/* 0AB034 001AAF34 02000146 */  mul.s       $f0, $f0, $f1
/* 0AB038 001AAF38 000060E6 */  swc1        $f0, 0x0($19)
/* 0AB03C 001AAF3C D501023C */  lui         $2, %hi(ukiv + 0x8)
/* 0AB040 001AAF40 D8634224 */  addiu       $2, $2, %lo(ukiv + 0x8)
/* 0AB044 001AAF44 21105100 */  addu        $2, $2, $17
/* 0AB048 001AAF48 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AB04C 001AAF4C 02000146 */  mul.s       $f0, $f0, $f1
/* 0AB050 001AAF50 000040E4 */  swc1        $f0, 0x0($2)
/* 0AB054 001AAF54 00008044 */  mtc1        $0, $f0
/* 0AB058 001AAF58 00000000 */  nop
/* 0AB05C 001AAF5C 34200046 */  c.lt.s      $f4, $f0
/* 0AB060 001AAF60 00000000 */  nop
/* 0AB064 001AAF64 04000045 */  bc1f        .L001AAF78
/* 0AB068 001AAF68 00000000 */   nop
/* 0AB06C 001AAF6C 07210046 */  neg.s       $f4, $f4
/* 0AB070 001AAF70 01000010 */  b           .L001AAF78
/* 0AB074 001AAF74 00000000 */   nop
.L001AAF78:
/* 0AB078 001AAF78 A48080C7 */  lwc1        $f0, -0x7F5C($28)
/* 0AB07C 001AAF7C 36200046 */  c.le.s      $f4, $f0
/* 0AB080 001AAF80 00000000 */  nop
/* 0AB084 001AAF84 0B000145 */  bc1t        .L001AAFB4
/* 0AB088 001AAF88 00000000 */   nop
/* 0AB08C 001AAF8C 41A00346 */  sub.s       $f1, $f20, $f3
/* 0AB090 001AAF90 908280C7 */  lwc1        $f0, -0x7D70($28)
/* 0AB094 001AAF94 02000146 */  mul.s       $f0, $f0, $f1
/* 0AB098 001AAF98 43000246 */  div.s       $f1, $f0, $f2
/* 0AB09C 001AAF9C D501023C */  lui         $2, %hi(ukiv + 0x4)
/* 0AB0A0 001AAFA0 D4634224 */  addiu       $2, $2, %lo(ukiv + 0x4)
/* 0AB0A4 001AAFA4 21105100 */  addu        $2, $2, $17
/* 0AB0A8 001AAFA8 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AB0AC 001AAFAC 00000146 */  add.s       $f0, $f0, $f1
/* 0AB0B0 001AAFB0 000040E4 */  swc1        $f0, 0x0($2)
.L001AAFB4:
/* 0AB0B4 001AAFB4 000044C6 */  lwc1        $f4, 0x0($18)
/* 0AB0B8 001AAFB8 34201446 */  c.lt.s      $f4, $f20
/* 0AB0BC 001AAFBC 00000000 */  nop
/* 0AB0C0 001AAFC0 28000045 */  bc1f        .L001AB064
/* 0AB0C4 001AAFC4 00000000 */   nop
/* 0AB0C8 001AAFC8 34181446 */  c.lt.s      $f3, $f20
/* 0AB0CC 001AAFCC 00000000 */  nop
/* 0AB0D0 001AAFD0 24000145 */  bc1t        .L001AB064
/* 0AB0D4 001AAFD4 00000000 */   nop
/* 0AB0D8 001AAFD8 81200346 */  sub.s       $f2, $f4, $f3
/* 0AB0DC 001AAFDC 00008044 */  mtc1        $0, $f0
/* 0AB0E0 001AAFE0 00000000 */  nop
/* 0AB0E4 001AAFE4 34100046 */  c.lt.s      $f2, $f0
/* 0AB0E8 001AAFE8 00000000 */  nop
/* 0AB0EC 001AAFEC 04000045 */  bc1f        .L001AB000
/* 0AB0F0 001AAFF0 00000000 */   nop
/* 0AB0F4 001AAFF4 87100046 */  neg.s       $f2, $f2
/* 0AB0F8 001AAFF8 01000010 */  b           .L001AB000
/* 0AB0FC 001AAFFC 00000000 */   nop
.L001AB000:
/* 0AB100 001AB000 41180446 */  sub.s       $f1, $f3, $f4
/* 0AB104 001AB004 00008044 */  mtc1        $0, $f0
/* 0AB108 001AB008 00000000 */  nop
/* 0AB10C 001AB00C 34080046 */  c.lt.s      $f1, $f0
/* 0AB110 001AB010 00000000 */  nop
/* 0AB114 001AB014 04000045 */  bc1f        .L001AB028
/* 0AB118 001AB018 00000000 */   nop
/* 0AB11C 001AB01C 47080046 */  neg.s       $f1, $f1
/* 0AB120 001AB020 01000010 */  b           .L001AB028
/* 0AB124 001AB024 00000000 */   nop
.L001AB028:
/* 0AB128 001AB028 A48080C7 */  lwc1        $f0, -0x7F5C($28)
/* 0AB12C 001AB02C 36080046 */  c.le.s      $f1, $f0
/* 0AB130 001AB030 00000000 */  nop
/* 0AB134 001AB034 0B000145 */  bc1t        .L001AB064
/* 0AB138 001AB038 00000000 */   nop
/* 0AB13C 001AB03C 41A00446 */  sub.s       $f1, $f20, $f4
/* 0AB140 001AB040 908280C7 */  lwc1        $f0, -0x7D70($28)
/* 0AB144 001AB044 02000146 */  mul.s       $f0, $f0, $f1
/* 0AB148 001AB048 43000246 */  div.s       $f1, $f0, $f2
/* 0AB14C 001AB04C D501023C */  lui         $2, %hi(ukiv + 0x4)
/* 0AB150 001AB050 D4634224 */  addiu       $2, $2, %lo(ukiv + 0x4)
/* 0AB154 001AB054 21105100 */  addu        $2, $2, $17
/* 0AB158 001AB058 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AB15C 001AB05C 00000146 */  add.s       $f0, $f0, $f1
/* 0AB160 001AB060 000040E4 */  swc1        $f0, 0x0($2)
.L001AB064:
/* 0AB164 001AB064 2826A072 */  paddub      $4, $21, $0
/* 0AB168 001AB068 282E8072 */  paddub      $5, $20, $0
/* 0AB16C 001AB06C 0C86040C */  jal         sceVu0CopyVector
/* 0AB170 001AB070 00000000 */   nop
/* 0AB174 001AB074 28266072 */  paddub      $4, $19, $0
/* 0AB178 001AB078 282E6072 */  paddub      $5, $19, $0
/* 0AB17C 001AB07C 7C828CC7 */  lwc1        $f12, -0x7D84($28)
/* 0AB180 001AB080 FA85040C */  jal         sceVu0ScaleVector
/* 0AB184 001AB084 00000000 */   nop
/* 0AB188 001AB088 01001026 */  addiu       $16, $16, 0x1
.L001AB08C:
/* 0AB18C 001AB08C 0400032A */  slti        $3, $16, 0x4
/* 0AB190 001AB090 4DFF6014 */  bnez        $3, .L001AADC8
/* 0AB194 001AB094 00000000 */   nop
/* 0AB198 001AB098 3C9380C7 */  lwc1        $f0, -0x6CC4($28)
/* 0AB19C 001AB09C 409380E7 */  swc1        $f0, -0x6CC0($28)
/* 0AB1A0 001AB0A0 449380E7 */  swc1        $f0, -0x6CBC($28)
/* 0AB1A4 001AB0A4 489380E7 */  swc1        $f0, -0x6CB8($28)
/* 0AB1A8 001AB0A8 849380AF */  sw          $0, -0x6C7C($28)
/* 0AB1AC 001AB0AC 809380AF */  sw          $0, -0x6C80($28)
/* 0AB1B0 001AB0B0 889380AF */  sw          $0, -0x6C78($28)
/* 0AB1B4 001AB0B4 7000BF7B */  lq          $31, 0x70($29)
/* 0AB1B8 001AB0B8 6000B57B */  lq          $21, 0x60($29)
/* 0AB1BC 001AB0BC 5000B47B */  lq          $20, 0x50($29)
/* 0AB1C0 001AB0C0 4000B37B */  lq          $19, 0x40($29)
/* 0AB1C4 001AB0C4 3000B27B */  lq          $18, 0x30($29)
/* 0AB1C8 001AB0C8 2000B17B */  lq          $17, 0x20($29)
/* 0AB1CC 001AB0CC 1000B07B */  lq          $16, 0x10($29)
/* 0AB1D0 001AB0D0 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 0AB1D4 001AB0D4 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0AB1D8 001AB0D8 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0AB1DC 001AB0DC 1001BD27 */  addiu       $29, $29, 0x110
/* 0AB1E0 001AB0E0 0800E003 */  jr          $31
/* 0AB1E4 001AB0E4 00000000 */   nop
/* 0AB1E8 001AB0E8 00000000 */  nop
/* 0AB1EC 001AB0EC 00000000 */  nop
