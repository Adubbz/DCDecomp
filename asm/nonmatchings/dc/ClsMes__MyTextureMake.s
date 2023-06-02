.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MyTextureMake__6ClsMesFv
/* 4E480 0014E380 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4E484 0014E384 1000BF7F */  sq         $31, 0x10($sp)
/* 4E488 0014E388 0000B07F */  sq         $16, 0x0($sp)
/* 4E48C 0014E38C 28868070 */  paddub     $16, $4, $0
/* 4E490 0014E390 AC00838C */  lw         $3, 0xAC($4)
/* 4E494 0014E394 0E006010 */  beqz       $3, .L0014E3D0
/* 4E498 0014E398 00000000 */   nop
/* 4E49C 0014E39C B000038E */  lw         $3, 0xB0($16)
/* 4E4A0 0014E3A0 09006010 */  beqz       $3, .L0014E3C8
/* 4E4A4 0014E3A4 00000000 */   nop
/* 4E4A8 0014E3A8 B416058E */  lw         $5, 0x16B4($16)
/* 4E4AC 0014E3AC B816038E */  lw         $3, 0x16B8($16)
/* 4E4B0 0014E3B0 2A18A300 */  slt        $3, $5, $3
/* 4E4B4 0014E3B4 04006014 */  bnez       $3, .L0014E3C8
/* 4E4B8 0014E3B8 00000000 */   nop
/* 4E4BC 0014E3BC 5C38050C */  jal        GoNextPage__6ClsMesFv
/* 4E4C0 0014E3C0 00000000 */   nop
/* 4E4C4 0014E3C4 B81600AE */  sw         $0, 0x16B8($16)
.L0014E3C8:
/* 4E4C8 0014E3C8 67000010 */  b          .L0014E568
/* 4E4CC 0014E3CC 00000000 */   nop
.L0014E3D0:
/* 4E4D0 0014E3D0 B016038E */  lw         $3, 0x16B0($16)
/* 4E4D4 0014E3D4 05006018 */  blez       $3, .L0014E3EC
/* 4E4D8 0014E3D8 00000000 */   nop
/* 4E4DC 0014E3DC FFFF6324 */  addiu      $3, $3, -0x1
/* 4E4E0 0014E3E0 B01603AE */  sw         $3, 0x16B0($16)
/* 4E4E4 0014E3E4 0B000010 */  b          .L0014E414
/* 4E4E8 0014E3E8 00000000 */   nop
.L0014E3EC:
/* 4E4EC 0014E3EC A40001C6 */  lwc1       $f1, 0xA4($16)
/* 4E4F0 0014E3F0 00008044 */  mtc1       $0, $f0
/* 4E4F4 0014E3F4 00000000 */  nop
/* 4E4F8 0014E3F8 36080046 */  c.le.s     $f1, $f0
/* 4E4FC 0014E3FC 00000000 */  nop
/* 4E500 0014E400 04000145 */  bc1t       .L0014E414
/* 4E504 0014E404 00000000 */   nop
/* 4E508 0014E408 B40000C6 */  lwc1       $f0, 0xB4($16)
/* 4E50C 0014E40C 00000146 */  add.s      $f0, $f0, $f1
/* 4E510 0014E410 B40000E6 */  swc1       $f0, 0xB4($16)
.L0014E414:
/* 4E514 0014E414 A80001C6 */  lwc1       $f1, 0xA8($16)
/* 4E518 0014E418 00008044 */  mtc1       $0, $f0
/* 4E51C 0014E41C 00000000 */  nop
/* 4E520 0014E420 32000146 */  c.eq.s     $f0, $f1
/* 4E524 0014E424 00000000 */  nop
/* 4E528 0014E428 06000045 */  bc1f       .L0014E444
/* 4E52C 0014E42C 00000000 */   nop
/* 4E530 0014E430 B800048E */  lw         $4, 0xB8($16)
/* 4E534 0014E434 2000038E */  lw         $3, 0x20($16)
/* 4E538 0014E438 2A088300 */  slt        $at, $4, $3
/* 4E53C 0014E43C 4A002010 */  beqz       $at, .L0014E568
/* 4E540 0014E440 00000000 */   nop
.L0014E444:
/* 4E544 0014E444 B40001C6 */  lwc1       $f1, 0xB4($16)
/* 4E548 0014E448 2000038E */  lw         $3, 0x20($16)
/* 4E54C 0014E44C 00008344 */  mtc1       $3, $f0
/* 4E550 0014E450 00000000 */  nop
/* 4E554 0014E454 20008046 */  cvt.s.w    $f0, $f0
/* 4E558 0014E458 36080046 */  c.le.s     $f1, $f0
/* 4E55C 0014E45C 00000000 */  nop
/* 4E560 0014E460 2F000145 */  bc1t       .L0014E520
/* 4E564 0014E464 00000000 */   nop
/* 4E568 0014E468 B40000E6 */  swc1       $f0, 0xB4($16)
/* 4E56C 0014E46C 2C000010 */  b          .L0014E520
/* 4E570 0014E470 00000000 */   nop
.L0014E474:
/* 4E574 0014E474 28260072 */  paddub     $4, $16, $0
/* 4E578 0014E478 7038050C */  jal        MyTextureMake_sub__6ClsMesFv
/* 4E57C 0014E47C 00000000 */   nop
/* 4E580 0014E480 FFFF4324 */  addiu      $3, $2, -0x1
/* 4E584 0014E484 0200612C */  sltiu      $at, $3, 0x2
/* 4E588 0014E488 0F002010 */  beqz       $at, .L0014E4C8
/* 4E58C 0014E48C 00000000 */   nop
/* 4E590 0014E490 A40001C6 */  lwc1       $f1, 0xA4($16)
/* 4E594 0014E494 00008044 */  mtc1       $0, $f0
/* 4E598 0014E498 00000000 */  nop
/* 4E59C 0014E49C 32000146 */  c.eq.s     $f0, $f1
/* 4E5A0 0014E4A0 00000000 */  nop
/* 4E5A4 0014E4A4 06000045 */  bc1f       .L0014E4C0
/* 4E5A8 0014E4A8 00000000 */   nop
/* 4E5AC 0014E4AC A80000C6 */  lwc1       $f0, 0xA8($16)
/* 4E5B0 0014E4B0 A40000E6 */  swc1       $f0, 0xA4($16)
/* 4E5B4 0014E4B4 B80000C6 */  lwc1       $f0, 0xB8($16)
/* 4E5B8 0014E4B8 20008046 */  cvt.s.w    $f0, $f0
/* 4E5BC 0014E4BC B40000E6 */  swc1       $f0, 0xB4($16)
.L0014E4C0:
/* 4E5C0 0014E4C0 29000010 */  b          .L0014E568
/* 4E5C4 0014E4C4 00000000 */   nop
.L0014E4C8:
/* 4E5C8 0014E4C8 B800058E */  lw         $5, 0xB8($16)
/* 4E5CC 0014E4CC 2000048E */  lw         $4, 0x20($16)
/* 4E5D0 0014E4D0 2A18A400 */  slt        $3, $5, $4
/* 4E5D4 0014E4D4 08006014 */  bnez       $3, .L0014E4F8
/* 4E5D8 0014E4D8 00000000 */   nop
/* 4E5DC 0014E4DC A80000C6 */  lwc1       $f0, 0xA8($16)
/* 4E5E0 0014E4E0 A40000E6 */  swc1       $f0, 0xA4($16)
/* 4E5E4 0014E4E4 B80000C6 */  lwc1       $f0, 0xB8($16)
/* 4E5E8 0014E4E8 20008046 */  cvt.s.w    $f0, $f0
/* 4E5EC 0014E4EC B40000E6 */  swc1       $f0, 0xB4($16)
/* 4E5F0 0014E4F0 1D000010 */  b          .L0014E568
/* 4E5F4 0014E4F4 00000000 */   nop
.L0014E4F8:
/* 4E5F8 0014E4F8 A80001C6 */  lwc1       $f1, 0xA8($16)
/* 4E5FC 0014E4FC 00008044 */  mtc1       $0, $f0
/* 4E600 0014E500 00000000 */  nop
/* 4E604 0014E504 32000146 */  c.eq.s     $f0, $f1
/* 4E608 0014E508 00000000 */  nop
/* 4E60C 0014E50C 04000045 */  bc1f       .L0014E520
/* 4E610 0014E510 00000000 */   nop
/* 4E614 0014E514 2A08A400 */  slt        $at, $5, $4
/* 4E618 0014E518 13002010 */  beqz       $at, .L0014E568
/* 4E61C 0014E51C 00000000 */   nop
.L0014E520:
/* 4E620 0014E520 A40001C6 */  lwc1       $f1, 0xA4($16)
/* 4E624 0014E524 00008044 */  mtc1       $0, $f0
/* 4E628 0014E528 00000000 */  nop
/* 4E62C 0014E52C 32000146 */  c.eq.s     $f0, $f1
/* 4E630 0014E530 00000000 */  nop
/* 4E634 0014E534 CFFF0145 */  bc1t       .L0014E474
/* 4E638 0014E538 00000000 */   nop
/* 4E63C 0014E53C B40001C6 */  lwc1       $f1, 0xB4($16)
/* 4E640 0014E540 B80000C6 */  lwc1       $f0, 0xB8($16)
/* 4E644 0014E544 20008046 */  cvt.s.w    $f0, $f0
/* 4E648 0014E548 41080046 */  sub.s      $f1, $f1, $f0
/* 4E64C 0014E54C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 4E650 0014E550 00008344 */  mtc1       $3, $f0
/* 4E654 0014E554 00000000 */  nop
/* 4E658 0014E558 34080046 */  c.lt.s     $f1, $f0
/* 4E65C 0014E55C 00000000 */  nop
/* 4E660 0014E560 C4FF0045 */  bc1f       .L0014E474
/* 4E664 0014E564 00000000 */   nop
.L0014E568:
/* 4E668 0014E568 1000BF7B */  lq         $31, 0x10($sp)
/* 4E66C 0014E56C 0000B07B */  lq         $16, 0x0($sp)
/* 4E670 0014E570 2000BD27 */  addiu      $sp, $sp, 0x20
/* 4E674 0014E574 0800E003 */  jr         $31
/* 4E678 0014E578 00000000 */   nop
/* 4E67C 0014E57C 00000000 */  nop
