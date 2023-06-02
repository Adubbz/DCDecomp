.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetCharaDoor__11CDungeonMapFi
/* CB330 001CB230 D0FDBD27 */  addiu      $sp, $sp, -0x230
/* CB334 001CB234 2000BF7F */  sq         $31, 0x20($sp)
/* CB338 001CB238 1000B17F */  sq         $17, 0x10($sp)
/* CB33C 001CB23C 0000B07F */  sq         $16, 0x0($sp)
/* CB340 001CB240 288E8070 */  paddub     $17, $4, $0
/* CB344 001CB244 28860070 */  paddub     $16, $0, $0
/* CB348 001CB248 0600A12C */  sltiu      $at, $5, 0x6
/* CB34C 001CB24C FF002010 */  beqz       $at, .L001CB64C
/* CB350 001CB250 00000000 */   nop
/* CB354 001CB254 2A00023C */  lui        $2, %hi(_3075)
/* CB358 001CB258 30BF4324 */  addiu      $3, $2, %lo(_3075)
/* CB35C 001CB25C 80100500 */  sll        $2, $5, 2
/* CB360 001CB260 21104300 */  addu       $2, $2, $3
/* CB364 001CB264 0000428C */  lw         $2, 0x0($2)
/* CB368 001CB268 08004000 */  jr         $2
/* CB36C 001CB26C 00000000 */   nop
/* CB370 001CB270 789C828F */  lw         $2, -0x6388($gp)
/* CB374 001CB274 05004280 */  lb         $2, 0x5($2)
/* CB378 001CB278 02004228 */  slti       $2, $2, 0x2
/* CB37C 001CB27C F3004014 */  bnez       $2, .L001CB64C
/* CB380 001CB280 00000000 */   nop
/* CB384 001CB284 28262072 */  paddub     $4, $17, $0
/* CB388 001CB288 3000A527 */  addiu      $5, $sp, 0x30
/* CB38C 001CB28C 40000624 */  addiu      $6, $0, 0x40
/* CB390 001CB290 283E0070 */  paddub     $7, $0, $0
/* CB394 001CB294 FFFF0824 */  addiu      $8, $0, -0x1
/* CB398 001CB298 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CB39C 001CB29C 00000000 */   nop
/* CB3A0 001CB2A0 28864070 */  paddub     $16, $2, $0
/* CB3A4 001CB2A4 E900001A */  blez       $16, .L001CB64C
/* CB3A8 001CB2A8 00000000 */   nop
/* CB3AC 001CB2AC BE11040C */  jal        rand
/* CB3B0 001CB2B0 00000000 */   nop
/* CB3B4 001CB2B4 00008244 */  mtc1       $2, $f0
/* CB3B8 001CB2B8 00000000 */  nop
/* CB3BC 001CB2BC 60008046 */  cvt.s.w    $f1, $f0
/* CB3C0 001CB2C0 00009044 */  mtc1       $16, $f0
/* CB3C4 001CB2C4 00000000 */  nop
/* CB3C8 001CB2C8 20008046 */  cvt.s.w    $f0, $f0
/* CB3CC 001CB2CC 42000146 */  mul.s      $f1, $f0, $f1
/* CB3D0 001CB2D0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CB3D4 001CB2D4 00008244 */  mtc1       $2, $f0
/* CB3D8 001CB2D8 00000000 */  nop
/* CB3DC 001CB2DC 030B0046 */  div.s      $f12, $f1, $f0
/* CB3E0 001CB2E0 2C44040C */  jal        fptosi
/* CB3E4 001CB2E4 00000000 */   nop
/* CB3E8 001CB2E8 3B000524 */  addiu      $5, $0, 0x3B
/* CB3EC 001CB2EC C0100200 */  sll        $2, $2, 3
/* CB3F0 001CB2F0 21205D00 */  addu       $4, $2, $sp
/* CB3F4 001CB2F4 3400838C */  lw         $3, 0x34($4)
/* CB3F8 001CB2F8 80100300 */  sll        $2, $3, 2
/* CB3FC 001CB2FC 21104300 */  addu       $2, $2, $3
/* CB400 001CB300 80180200 */  sll        $3, $2, 2
/* CB404 001CB304 3000828C */  lw         $2, 0x30($4)
/* CB408 001CB308 21104300 */  addu       $2, $2, $3
/* CB40C 001CB30C 00110200 */  sll        $2, $2, 4
/* CB410 001CB310 21105100 */  addu       $2, $2, $17
/* CB414 001CB314 0100013C */  lui        $at, (0x10000 >> 16)
/* CB418 001CB318 21084100 */  addu       $at, $2, $at
/* CB41C 001CB31C 509C25AC */  sw         $5, -0x63B0($at)
/* CB420 001CB320 CA000010 */  b          .L001CB64C
/* CB424 001CB324 00000000 */   nop
/* CB428 001CB328 3000A527 */  addiu      $5, $sp, 0x30
/* CB42C 001CB32C 40000624 */  addiu      $6, $0, 0x40
/* CB430 001CB330 09000724 */  addiu      $7, $0, 0x9
/* CB434 001CB334 0C000824 */  addiu      $8, $0, 0xC
/* CB438 001CB338 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CB43C 001CB33C 00000000 */   nop
/* CB440 001CB340 28864070 */  paddub     $16, $2, $0
/* CB444 001CB344 C100001A */  blez       $16, .L001CB64C
/* CB448 001CB348 00000000 */   nop
/* CB44C 001CB34C BE11040C */  jal        rand
/* CB450 001CB350 00000000 */   nop
/* CB454 001CB354 00008244 */  mtc1       $2, $f0
/* CB458 001CB358 00000000 */  nop
/* CB45C 001CB35C 60008046 */  cvt.s.w    $f1, $f0
/* CB460 001CB360 00009044 */  mtc1       $16, $f0
/* CB464 001CB364 00000000 */  nop
/* CB468 001CB368 20008046 */  cvt.s.w    $f0, $f0
/* CB46C 001CB36C 42000146 */  mul.s      $f1, $f0, $f1
/* CB470 001CB370 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CB474 001CB374 00008244 */  mtc1       $2, $f0
/* CB478 001CB378 00000000 */  nop
/* CB47C 001CB37C 030B0046 */  div.s      $f12, $f1, $f0
/* CB480 001CB380 2C44040C */  jal        fptosi
/* CB484 001CB384 00000000 */   nop
/* CB488 001CB388 C0100200 */  sll        $2, $2, 3
/* CB48C 001CB38C 21205D00 */  addu       $4, $2, $sp
/* CB490 001CB390 3400838C */  lw         $3, 0x34($4)
/* CB494 001CB394 80100300 */  sll        $2, $3, 2
/* CB498 001CB398 21104300 */  addu       $2, $2, $3
/* CB49C 001CB39C 80180200 */  sll        $3, $2, 2
/* CB4A0 001CB3A0 3000828C */  lw         $2, 0x30($4)
/* CB4A4 001CB3A4 21104300 */  addu       $2, $2, $3
/* CB4A8 001CB3A8 00110200 */  sll        $2, $2, 4
/* CB4AC 001CB3AC 21105100 */  addu       $2, $2, $17
/* CB4B0 001CB3B0 581C4324 */  addiu      $3, $2, 0x1C58
/* CB4B4 001CB3B4 F87F6324 */  addiu      $3, $3, 0x7FF8
/* CB4B8 001CB3B8 0000628C */  lw         $2, 0x0($3)
/* CB4BC 001CB3BC 2E004224 */  addiu      $2, $2, 0x2E
/* CB4C0 001CB3C0 000062AC */  sw         $2, 0x0($3)
/* CB4C4 001CB3C4 A1000010 */  b          .L001CB64C
/* CB4C8 001CB3C8 00000000 */   nop
/* CB4CC 001CB3CC 3000A527 */  addiu      $5, $sp, 0x30
/* CB4D0 001CB3D0 40000624 */  addiu      $6, $0, 0x40
/* CB4D4 001CB3D4 09000724 */  addiu      $7, $0, 0x9
/* CB4D8 001CB3D8 0C000824 */  addiu      $8, $0, 0xC
/* CB4DC 001CB3DC A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CB4E0 001CB3E0 00000000 */   nop
/* CB4E4 001CB3E4 28864070 */  paddub     $16, $2, $0
/* CB4E8 001CB3E8 9800001A */  blez       $16, .L001CB64C
/* CB4EC 001CB3EC 00000000 */   nop
/* CB4F0 001CB3F0 BE11040C */  jal        rand
/* CB4F4 001CB3F4 00000000 */   nop
/* CB4F8 001CB3F8 00008244 */  mtc1       $2, $f0
/* CB4FC 001CB3FC 00000000 */  nop
/* CB500 001CB400 60008046 */  cvt.s.w    $f1, $f0
/* CB504 001CB404 00009044 */  mtc1       $16, $f0
/* CB508 001CB408 00000000 */  nop
/* CB50C 001CB40C 20008046 */  cvt.s.w    $f0, $f0
/* CB510 001CB410 42000146 */  mul.s      $f1, $f0, $f1
/* CB514 001CB414 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CB518 001CB418 00008244 */  mtc1       $2, $f0
/* CB51C 001CB41C 00000000 */  nop
/* CB520 001CB420 030B0046 */  div.s      $f12, $f1, $f0
/* CB524 001CB424 2C44040C */  jal        fptosi
/* CB528 001CB428 00000000 */   nop
/* CB52C 001CB42C C0100200 */  sll        $2, $2, 3
/* CB530 001CB430 21205D00 */  addu       $4, $2, $sp
/* CB534 001CB434 3400838C */  lw         $3, 0x34($4)
/* CB538 001CB438 80100300 */  sll        $2, $3, 2
/* CB53C 001CB43C 21104300 */  addu       $2, $2, $3
/* CB540 001CB440 80180200 */  sll        $3, $2, 2
/* CB544 001CB444 3000828C */  lw         $2, 0x30($4)
/* CB548 001CB448 21104300 */  addu       $2, $2, $3
/* CB54C 001CB44C 00110200 */  sll        $2, $2, 4
/* CB550 001CB450 21105100 */  addu       $2, $2, $17
/* CB554 001CB454 581C4324 */  addiu      $3, $2, 0x1C58
/* CB558 001CB458 F87F6324 */  addiu      $3, $3, 0x7FF8
/* CB55C 001CB45C 0000628C */  lw         $2, 0x0($3)
/* CB560 001CB460 33004224 */  addiu      $2, $2, 0x33
/* CB564 001CB464 000062AC */  sw         $2, 0x0($3)
/* CB568 001CB468 78000010 */  b          .L001CB64C
/* CB56C 001CB46C 00000000 */   nop
/* CB570 001CB470 3000A527 */  addiu      $5, $sp, 0x30
/* CB574 001CB474 40000624 */  addiu      $6, $0, 0x40
/* CB578 001CB478 09000724 */  addiu      $7, $0, 0x9
/* CB57C 001CB47C 0C000824 */  addiu      $8, $0, 0xC
/* CB580 001CB480 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CB584 001CB484 00000000 */   nop
/* CB588 001CB488 28864070 */  paddub     $16, $2, $0
/* CB58C 001CB48C 6F00001A */  blez       $16, .L001CB64C
/* CB590 001CB490 00000000 */   nop
/* CB594 001CB494 BE11040C */  jal        rand
/* CB598 001CB498 00000000 */   nop
/* CB59C 001CB49C 00008244 */  mtc1       $2, $f0
/* CB5A0 001CB4A0 00000000 */  nop
/* CB5A4 001CB4A4 60008046 */  cvt.s.w    $f1, $f0
/* CB5A8 001CB4A8 00009044 */  mtc1       $16, $f0
/* CB5AC 001CB4AC 00000000 */  nop
/* CB5B0 001CB4B0 20008046 */  cvt.s.w    $f0, $f0
/* CB5B4 001CB4B4 42000146 */  mul.s      $f1, $f0, $f1
/* CB5B8 001CB4B8 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CB5BC 001CB4BC 00008244 */  mtc1       $2, $f0
/* CB5C0 001CB4C0 00000000 */  nop
/* CB5C4 001CB4C4 030B0046 */  div.s      $f12, $f1, $f0
/* CB5C8 001CB4C8 2C44040C */  jal        fptosi
/* CB5CC 001CB4CC 00000000 */   nop
/* CB5D0 001CB4D0 C0100200 */  sll        $2, $2, 3
/* CB5D4 001CB4D4 21205D00 */  addu       $4, $2, $sp
/* CB5D8 001CB4D8 3400838C */  lw         $3, 0x34($4)
/* CB5DC 001CB4DC 80100300 */  sll        $2, $3, 2
/* CB5E0 001CB4E0 21104300 */  addu       $2, $2, $3
/* CB5E4 001CB4E4 80180200 */  sll        $3, $2, 2
/* CB5E8 001CB4E8 3000828C */  lw         $2, 0x30($4)
/* CB5EC 001CB4EC 21104300 */  addu       $2, $2, $3
/* CB5F0 001CB4F0 00110200 */  sll        $2, $2, 4
/* CB5F4 001CB4F4 21105100 */  addu       $2, $2, $17
/* CB5F8 001CB4F8 581C4324 */  addiu      $3, $2, 0x1C58
/* CB5FC 001CB4FC F87F6324 */  addiu      $3, $3, 0x7FF8
/* CB600 001CB500 0000628C */  lw         $2, 0x0($3)
/* CB604 001CB504 37004224 */  addiu      $2, $2, 0x37
/* CB608 001CB508 000062AC */  sw         $2, 0x0($3)
/* CB60C 001CB50C 4F000010 */  b          .L001CB64C
/* CB610 001CB510 00000000 */   nop
/* CB614 001CB514 3000A527 */  addiu      $5, $sp, 0x30
/* CB618 001CB518 40000624 */  addiu      $6, $0, 0x40
/* CB61C 001CB51C 283E0070 */  paddub     $7, $0, $0
/* CB620 001CB520 FFFF0824 */  addiu      $8, $0, -0x1
/* CB624 001CB524 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CB628 001CB528 00000000 */   nop
/* CB62C 001CB52C 28864070 */  paddub     $16, $2, $0
/* CB630 001CB530 4600001A */  blez       $16, .L001CB64C
/* CB634 001CB534 00000000 */   nop
/* CB638 001CB538 BE11040C */  jal        rand
/* CB63C 001CB53C 00000000 */   nop
/* CB640 001CB540 00008244 */  mtc1       $2, $f0
/* CB644 001CB544 00000000 */  nop
/* CB648 001CB548 60008046 */  cvt.s.w    $f1, $f0
/* CB64C 001CB54C 00009044 */  mtc1       $16, $f0
/* CB650 001CB550 00000000 */  nop
/* CB654 001CB554 20008046 */  cvt.s.w    $f0, $f0
/* CB658 001CB558 42000146 */  mul.s      $f1, $f0, $f1
/* CB65C 001CB55C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CB660 001CB560 00008244 */  mtc1       $2, $f0
/* CB664 001CB564 00000000 */  nop
/* CB668 001CB568 030B0046 */  div.s      $f12, $f1, $f0
/* CB66C 001CB56C 2C44040C */  jal        fptosi
/* CB670 001CB570 00000000 */   nop
/* CB674 001CB574 44000524 */  addiu      $5, $0, 0x44
/* CB678 001CB578 C0100200 */  sll        $2, $2, 3
/* CB67C 001CB57C 21205D00 */  addu       $4, $2, $sp
/* CB680 001CB580 3400838C */  lw         $3, 0x34($4)
/* CB684 001CB584 80100300 */  sll        $2, $3, 2
/* CB688 001CB588 21104300 */  addu       $2, $2, $3
/* CB68C 001CB58C 80180200 */  sll        $3, $2, 2
/* CB690 001CB590 3000828C */  lw         $2, 0x30($4)
/* CB694 001CB594 21104300 */  addu       $2, $2, $3
/* CB698 001CB598 00110200 */  sll        $2, $2, 4
/* CB69C 001CB59C 21105100 */  addu       $2, $2, $17
/* CB6A0 001CB5A0 0100013C */  lui        $at, (0x10000 >> 16)
/* CB6A4 001CB5A4 21084100 */  addu       $at, $2, $at
/* CB6A8 001CB5A8 509C25AC */  sw         $5, -0x63B0($at)
/* CB6AC 001CB5AC 27000010 */  b          .L001CB64C
/* CB6B0 001CB5B0 00000000 */   nop
/* CB6B4 001CB5B4 3000A527 */  addiu      $5, $sp, 0x30
/* CB6B8 001CB5B8 40000624 */  addiu      $6, $0, 0x40
/* CB6BC 001CB5BC 283E0070 */  paddub     $7, $0, $0
/* CB6C0 001CB5C0 FFFF0824 */  addiu      $8, $0, -0x1
/* CB6C4 001CB5C4 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CB6C8 001CB5C8 00000000 */   nop
/* CB6CC 001CB5CC 28864070 */  paddub     $16, $2, $0
/* CB6D0 001CB5D0 1E00001A */  blez       $16, .L001CB64C
/* CB6D4 001CB5D4 00000000 */   nop
/* CB6D8 001CB5D8 BE11040C */  jal        rand
/* CB6DC 001CB5DC 00000000 */   nop
/* CB6E0 001CB5E0 00008244 */  mtc1       $2, $f0
/* CB6E4 001CB5E4 00000000 */  nop
/* CB6E8 001CB5E8 60008046 */  cvt.s.w    $f1, $f0
/* CB6EC 001CB5EC 00009044 */  mtc1       $16, $f0
/* CB6F0 001CB5F0 00000000 */  nop
/* CB6F4 001CB5F4 20008046 */  cvt.s.w    $f0, $f0
/* CB6F8 001CB5F8 42000146 */  mul.s      $f1, $f0, $f1
/* CB6FC 001CB5FC 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CB700 001CB600 00008244 */  mtc1       $2, $f0
/* CB704 001CB604 00000000 */  nop
/* CB708 001CB608 030B0046 */  div.s      $f12, $f1, $f0
/* CB70C 001CB60C 2C44040C */  jal        fptosi
/* CB710 001CB610 00000000 */   nop
/* CB714 001CB614 45000524 */  addiu      $5, $0, 0x45
/* CB718 001CB618 C0100200 */  sll        $2, $2, 3
/* CB71C 001CB61C 21205D00 */  addu       $4, $2, $sp
/* CB720 001CB620 3400838C */  lw         $3, 0x34($4)
/* CB724 001CB624 80100300 */  sll        $2, $3, 2
/* CB728 001CB628 21104300 */  addu       $2, $2, $3
/* CB72C 001CB62C 80180200 */  sll        $3, $2, 2
/* CB730 001CB630 3000828C */  lw         $2, 0x30($4)
/* CB734 001CB634 21104300 */  addu       $2, $2, $3
/* CB738 001CB638 00110200 */  sll        $2, $2, 4
/* CB73C 001CB63C 21105100 */  addu       $2, $2, $17
/* CB740 001CB640 0100013C */  lui        $at, (0x10000 >> 16)
/* CB744 001CB644 21084100 */  addu       $at, $2, $at
/* CB748 001CB648 509C25AC */  sw         $5, -0x63B0($at)
.L001CB64C:
/* CB74C 001CB64C 28160072 */  paddub     $2, $16, $0
/* CB750 001CB650 2000BF7B */  lq         $31, 0x20($sp)
/* CB754 001CB654 1000B17B */  lq         $17, 0x10($sp)
/* CB758 001CB658 0000B07B */  lq         $16, 0x0($sp)
/* CB75C 001CB65C 3002BD27 */  addiu      $sp, $sp, 0x230
/* CB760 001CB660 0800E003 */  jr         $31
/* CB764 001CB664 00000000 */   nop
/* CB768 001CB668 00000000 */  nop
/* CB76C 001CB66C 00000000 */  nop
