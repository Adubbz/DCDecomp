.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetCharaDoor__11CDungeonMapFi
/* 0CB330 001CB230 D0FDBD27 */  addiu       $29, $29, -0x230
/* 0CB334 001CB234 2000BF7F */  sq          $31, 0x20($29)
/* 0CB338 001CB238 1000B17F */  sq          $17, 0x10($29)
/* 0CB33C 001CB23C 0000B07F */  sq          $16, 0x0($29)
/* 0CB340 001CB240 288E8070 */  paddub      $17, $4, $0
/* 0CB344 001CB244 28860070 */  paddub      $16, $0, $0
/* 0CB348 001CB248 0600A12C */  sltiu       $1, $5, 0x6
/* 0CB34C 001CB24C FF002010 */  beqz        $1, .L001CB64C
/* 0CB350 001CB250 00000000 */   nop
/* 0CB354 001CB254 2A00023C */  lui         $2, %hi(LIT_3075)
/* 0CB358 001CB258 30BF4324 */  addiu       $3, $2, %lo(LIT_3075)
/* 0CB35C 001CB25C 80100500 */  sll         $2, $5, 2
/* 0CB360 001CB260 21104300 */  addu        $2, $2, $3
/* 0CB364 001CB264 0000428C */  lw          $2, 0x0($2)
/* 0CB368 001CB268 08004000 */  jr          $2
/* 0CB36C 001CB26C 00000000 */   nop
jlabel .L001CB270
/* 0CB370 001CB270 789C828F */  lw          $2, -0x6388($28)
/* 0CB374 001CB274 05004280 */  lb          $2, 0x5($2)
/* 0CB378 001CB278 02004228 */  slti        $2, $2, 0x2
/* 0CB37C 001CB27C F3004014 */  bnez        $2, .L001CB64C
/* 0CB380 001CB280 00000000 */   nop
/* 0CB384 001CB284 28262072 */  paddub      $4, $17, $0
/* 0CB388 001CB288 3000A527 */  addiu       $5, $29, 0x30
/* 0CB38C 001CB28C 40000624 */  addiu       $6, $0, 0x40
/* 0CB390 001CB290 283E0070 */  paddub      $7, $0, $0
/* 0CB394 001CB294 FFFF0824 */  addiu       $8, $0, -0x1
/* 0CB398 001CB298 A428070C */  jal         CreatPartsList__11CDungeonMapFPiiii
/* 0CB39C 001CB29C 00000000 */   nop
/* 0CB3A0 001CB2A0 28864070 */  paddub      $16, $2, $0
/* 0CB3A4 001CB2A4 E900001A */  blez        $16, .L001CB64C
/* 0CB3A8 001CB2A8 00000000 */   nop
/* 0CB3AC 001CB2AC BE11040C */  jal         rand
/* 0CB3B0 001CB2B0 00000000 */   nop
/* 0CB3B4 001CB2B4 00008244 */  mtc1        $2, $f0
/* 0CB3B8 001CB2B8 00000000 */  nop
/* 0CB3BC 001CB2BC 60008046 */  cvt.s.w     $f1, $f0
/* 0CB3C0 001CB2C0 00009044 */  mtc1        $16, $f0
/* 0CB3C4 001CB2C4 00000000 */  nop
/* 0CB3C8 001CB2C8 20008046 */  cvt.s.w     $f0, $f0
/* 0CB3CC 001CB2CC 42000146 */  mul.s       $f1, $f0, $f1
/* 0CB3D0 001CB2D0 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0CB3D4 001CB2D4 00008244 */  mtc1        $2, $f0
/* 0CB3D8 001CB2D8 00000000 */  nop
/* 0CB3DC 001CB2DC 030B0046 */  div.s       $f12, $f1, $f0
/* 0CB3E0 001CB2E0 2C44040C */  jal         fptosi
/* 0CB3E4 001CB2E4 00000000 */   nop
/* 0CB3E8 001CB2E8 3B000524 */  addiu       $5, $0, 0x3B
/* 0CB3EC 001CB2EC C0100200 */  sll         $2, $2, 3
/* 0CB3F0 001CB2F0 21205D00 */  addu        $4, $2, $29
/* 0CB3F4 001CB2F4 3400838C */  lw          $3, 0x34($4)
/* 0CB3F8 001CB2F8 80100300 */  sll         $2, $3, 2
/* 0CB3FC 001CB2FC 21104300 */  addu        $2, $2, $3
/* 0CB400 001CB300 80180200 */  sll         $3, $2, 2
/* 0CB404 001CB304 3000828C */  lw          $2, 0x30($4)
/* 0CB408 001CB308 21104300 */  addu        $2, $2, $3
/* 0CB40C 001CB30C 00110200 */  sll         $2, $2, 4
/* 0CB410 001CB310 21105100 */  addu        $2, $2, $17
/* 0CB414 001CB314 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CB418 001CB318 21084100 */  addu        $1, $2, $1
/* 0CB41C 001CB31C 509C25AC */  sw          $5, -0x63B0($1)
/* 0CB420 001CB320 CA000010 */  b           .L001CB64C
/* 0CB424 001CB324 00000000 */   nop
jlabel .L001CB328
/* 0CB428 001CB328 3000A527 */  addiu       $5, $29, 0x30
/* 0CB42C 001CB32C 40000624 */  addiu       $6, $0, 0x40
/* 0CB430 001CB330 09000724 */  addiu       $7, $0, 0x9
/* 0CB434 001CB334 0C000824 */  addiu       $8, $0, 0xC
/* 0CB438 001CB338 A428070C */  jal         CreatPartsList__11CDungeonMapFPiiii
/* 0CB43C 001CB33C 00000000 */   nop
/* 0CB440 001CB340 28864070 */  paddub      $16, $2, $0
/* 0CB444 001CB344 C100001A */  blez        $16, .L001CB64C
/* 0CB448 001CB348 00000000 */   nop
/* 0CB44C 001CB34C BE11040C */  jal         rand
/* 0CB450 001CB350 00000000 */   nop
/* 0CB454 001CB354 00008244 */  mtc1        $2, $f0
/* 0CB458 001CB358 00000000 */  nop
/* 0CB45C 001CB35C 60008046 */  cvt.s.w     $f1, $f0
/* 0CB460 001CB360 00009044 */  mtc1        $16, $f0
/* 0CB464 001CB364 00000000 */  nop
/* 0CB468 001CB368 20008046 */  cvt.s.w     $f0, $f0
/* 0CB46C 001CB36C 42000146 */  mul.s       $f1, $f0, $f1
/* 0CB470 001CB370 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0CB474 001CB374 00008244 */  mtc1        $2, $f0
/* 0CB478 001CB378 00000000 */  nop
/* 0CB47C 001CB37C 030B0046 */  div.s       $f12, $f1, $f0
/* 0CB480 001CB380 2C44040C */  jal         fptosi
/* 0CB484 001CB384 00000000 */   nop
/* 0CB488 001CB388 C0100200 */  sll         $2, $2, 3
/* 0CB48C 001CB38C 21205D00 */  addu        $4, $2, $29
/* 0CB490 001CB390 3400838C */  lw          $3, 0x34($4)
/* 0CB494 001CB394 80100300 */  sll         $2, $3, 2
/* 0CB498 001CB398 21104300 */  addu        $2, $2, $3
/* 0CB49C 001CB39C 80180200 */  sll         $3, $2, 2
/* 0CB4A0 001CB3A0 3000828C */  lw          $2, 0x30($4)
/* 0CB4A4 001CB3A4 21104300 */  addu        $2, $2, $3
/* 0CB4A8 001CB3A8 00110200 */  sll         $2, $2, 4
/* 0CB4AC 001CB3AC 21105100 */  addu        $2, $2, $17
/* 0CB4B0 001CB3B0 581C4324 */  addiu       $3, $2, 0x1C58
/* 0CB4B4 001CB3B4 F87F6324 */  addiu       $3, $3, 0x7FF8
/* 0CB4B8 001CB3B8 0000628C */  lw          $2, 0x0($3)
/* 0CB4BC 001CB3BC 2E004224 */  addiu       $2, $2, 0x2E
/* 0CB4C0 001CB3C0 000062AC */  sw          $2, 0x0($3)
/* 0CB4C4 001CB3C4 A1000010 */  b           .L001CB64C
/* 0CB4C8 001CB3C8 00000000 */   nop
jlabel .L001CB3CC
/* 0CB4CC 001CB3CC 3000A527 */  addiu       $5, $29, 0x30
/* 0CB4D0 001CB3D0 40000624 */  addiu       $6, $0, 0x40
/* 0CB4D4 001CB3D4 09000724 */  addiu       $7, $0, 0x9
/* 0CB4D8 001CB3D8 0C000824 */  addiu       $8, $0, 0xC
/* 0CB4DC 001CB3DC A428070C */  jal         CreatPartsList__11CDungeonMapFPiiii
/* 0CB4E0 001CB3E0 00000000 */   nop
/* 0CB4E4 001CB3E4 28864070 */  paddub      $16, $2, $0
/* 0CB4E8 001CB3E8 9800001A */  blez        $16, .L001CB64C
/* 0CB4EC 001CB3EC 00000000 */   nop
/* 0CB4F0 001CB3F0 BE11040C */  jal         rand
/* 0CB4F4 001CB3F4 00000000 */   nop
/* 0CB4F8 001CB3F8 00008244 */  mtc1        $2, $f0
/* 0CB4FC 001CB3FC 00000000 */  nop
/* 0CB500 001CB400 60008046 */  cvt.s.w     $f1, $f0
/* 0CB504 001CB404 00009044 */  mtc1        $16, $f0
/* 0CB508 001CB408 00000000 */  nop
/* 0CB50C 001CB40C 20008046 */  cvt.s.w     $f0, $f0
/* 0CB510 001CB410 42000146 */  mul.s       $f1, $f0, $f1
/* 0CB514 001CB414 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0CB518 001CB418 00008244 */  mtc1        $2, $f0
/* 0CB51C 001CB41C 00000000 */  nop
/* 0CB520 001CB420 030B0046 */  div.s       $f12, $f1, $f0
/* 0CB524 001CB424 2C44040C */  jal         fptosi
/* 0CB528 001CB428 00000000 */   nop
/* 0CB52C 001CB42C C0100200 */  sll         $2, $2, 3
/* 0CB530 001CB430 21205D00 */  addu        $4, $2, $29
/* 0CB534 001CB434 3400838C */  lw          $3, 0x34($4)
/* 0CB538 001CB438 80100300 */  sll         $2, $3, 2
/* 0CB53C 001CB43C 21104300 */  addu        $2, $2, $3
/* 0CB540 001CB440 80180200 */  sll         $3, $2, 2
/* 0CB544 001CB444 3000828C */  lw          $2, 0x30($4)
/* 0CB548 001CB448 21104300 */  addu        $2, $2, $3
/* 0CB54C 001CB44C 00110200 */  sll         $2, $2, 4
/* 0CB550 001CB450 21105100 */  addu        $2, $2, $17
/* 0CB554 001CB454 581C4324 */  addiu       $3, $2, 0x1C58
/* 0CB558 001CB458 F87F6324 */  addiu       $3, $3, 0x7FF8
/* 0CB55C 001CB45C 0000628C */  lw          $2, 0x0($3)
/* 0CB560 001CB460 33004224 */  addiu       $2, $2, 0x33
/* 0CB564 001CB464 000062AC */  sw          $2, 0x0($3)
/* 0CB568 001CB468 78000010 */  b           .L001CB64C
/* 0CB56C 001CB46C 00000000 */   nop
jlabel .L001CB470
/* 0CB570 001CB470 3000A527 */  addiu       $5, $29, 0x30
/* 0CB574 001CB474 40000624 */  addiu       $6, $0, 0x40
/* 0CB578 001CB478 09000724 */  addiu       $7, $0, 0x9
/* 0CB57C 001CB47C 0C000824 */  addiu       $8, $0, 0xC
/* 0CB580 001CB480 A428070C */  jal         CreatPartsList__11CDungeonMapFPiiii
/* 0CB584 001CB484 00000000 */   nop
/* 0CB588 001CB488 28864070 */  paddub      $16, $2, $0
/* 0CB58C 001CB48C 6F00001A */  blez        $16, .L001CB64C
/* 0CB590 001CB490 00000000 */   nop
/* 0CB594 001CB494 BE11040C */  jal         rand
/* 0CB598 001CB498 00000000 */   nop
/* 0CB59C 001CB49C 00008244 */  mtc1        $2, $f0
/* 0CB5A0 001CB4A0 00000000 */  nop
/* 0CB5A4 001CB4A4 60008046 */  cvt.s.w     $f1, $f0
/* 0CB5A8 001CB4A8 00009044 */  mtc1        $16, $f0
/* 0CB5AC 001CB4AC 00000000 */  nop
/* 0CB5B0 001CB4B0 20008046 */  cvt.s.w     $f0, $f0
/* 0CB5B4 001CB4B4 42000146 */  mul.s       $f1, $f0, $f1
/* 0CB5B8 001CB4B8 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0CB5BC 001CB4BC 00008244 */  mtc1        $2, $f0
/* 0CB5C0 001CB4C0 00000000 */  nop
/* 0CB5C4 001CB4C4 030B0046 */  div.s       $f12, $f1, $f0
/* 0CB5C8 001CB4C8 2C44040C */  jal         fptosi
/* 0CB5CC 001CB4CC 00000000 */   nop
/* 0CB5D0 001CB4D0 C0100200 */  sll         $2, $2, 3
/* 0CB5D4 001CB4D4 21205D00 */  addu        $4, $2, $29
/* 0CB5D8 001CB4D8 3400838C */  lw          $3, 0x34($4)
/* 0CB5DC 001CB4DC 80100300 */  sll         $2, $3, 2
/* 0CB5E0 001CB4E0 21104300 */  addu        $2, $2, $3
/* 0CB5E4 001CB4E4 80180200 */  sll         $3, $2, 2
/* 0CB5E8 001CB4E8 3000828C */  lw          $2, 0x30($4)
/* 0CB5EC 001CB4EC 21104300 */  addu        $2, $2, $3
/* 0CB5F0 001CB4F0 00110200 */  sll         $2, $2, 4
/* 0CB5F4 001CB4F4 21105100 */  addu        $2, $2, $17
/* 0CB5F8 001CB4F8 581C4324 */  addiu       $3, $2, 0x1C58
/* 0CB5FC 001CB4FC F87F6324 */  addiu       $3, $3, 0x7FF8
/* 0CB600 001CB500 0000628C */  lw          $2, 0x0($3)
/* 0CB604 001CB504 37004224 */  addiu       $2, $2, 0x37
/* 0CB608 001CB508 000062AC */  sw          $2, 0x0($3)
/* 0CB60C 001CB50C 4F000010 */  b           .L001CB64C
/* 0CB610 001CB510 00000000 */   nop
jlabel .L001CB514
/* 0CB614 001CB514 3000A527 */  addiu       $5, $29, 0x30
/* 0CB618 001CB518 40000624 */  addiu       $6, $0, 0x40
/* 0CB61C 001CB51C 283E0070 */  paddub      $7, $0, $0
/* 0CB620 001CB520 FFFF0824 */  addiu       $8, $0, -0x1
/* 0CB624 001CB524 A428070C */  jal         CreatPartsList__11CDungeonMapFPiiii
/* 0CB628 001CB528 00000000 */   nop
/* 0CB62C 001CB52C 28864070 */  paddub      $16, $2, $0
/* 0CB630 001CB530 4600001A */  blez        $16, .L001CB64C
/* 0CB634 001CB534 00000000 */   nop
/* 0CB638 001CB538 BE11040C */  jal         rand
/* 0CB63C 001CB53C 00000000 */   nop
/* 0CB640 001CB540 00008244 */  mtc1        $2, $f0
/* 0CB644 001CB544 00000000 */  nop
/* 0CB648 001CB548 60008046 */  cvt.s.w     $f1, $f0
/* 0CB64C 001CB54C 00009044 */  mtc1        $16, $f0
/* 0CB650 001CB550 00000000 */  nop
/* 0CB654 001CB554 20008046 */  cvt.s.w     $f0, $f0
/* 0CB658 001CB558 42000146 */  mul.s       $f1, $f0, $f1
/* 0CB65C 001CB55C 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0CB660 001CB560 00008244 */  mtc1        $2, $f0
/* 0CB664 001CB564 00000000 */  nop
/* 0CB668 001CB568 030B0046 */  div.s       $f12, $f1, $f0
/* 0CB66C 001CB56C 2C44040C */  jal         fptosi
/* 0CB670 001CB570 00000000 */   nop
/* 0CB674 001CB574 44000524 */  addiu       $5, $0, 0x44
/* 0CB678 001CB578 C0100200 */  sll         $2, $2, 3
/* 0CB67C 001CB57C 21205D00 */  addu        $4, $2, $29
/* 0CB680 001CB580 3400838C */  lw          $3, 0x34($4)
/* 0CB684 001CB584 80100300 */  sll         $2, $3, 2
/* 0CB688 001CB588 21104300 */  addu        $2, $2, $3
/* 0CB68C 001CB58C 80180200 */  sll         $3, $2, 2
/* 0CB690 001CB590 3000828C */  lw          $2, 0x30($4)
/* 0CB694 001CB594 21104300 */  addu        $2, $2, $3
/* 0CB698 001CB598 00110200 */  sll         $2, $2, 4
/* 0CB69C 001CB59C 21105100 */  addu        $2, $2, $17
/* 0CB6A0 001CB5A0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CB6A4 001CB5A4 21084100 */  addu        $1, $2, $1
/* 0CB6A8 001CB5A8 509C25AC */  sw          $5, -0x63B0($1)
/* 0CB6AC 001CB5AC 27000010 */  b           .L001CB64C
/* 0CB6B0 001CB5B0 00000000 */   nop
jlabel .L001CB5B4
/* 0CB6B4 001CB5B4 3000A527 */  addiu       $5, $29, 0x30
/* 0CB6B8 001CB5B8 40000624 */  addiu       $6, $0, 0x40
/* 0CB6BC 001CB5BC 283E0070 */  paddub      $7, $0, $0
/* 0CB6C0 001CB5C0 FFFF0824 */  addiu       $8, $0, -0x1
/* 0CB6C4 001CB5C4 A428070C */  jal         CreatPartsList__11CDungeonMapFPiiii
/* 0CB6C8 001CB5C8 00000000 */   nop
/* 0CB6CC 001CB5CC 28864070 */  paddub      $16, $2, $0
/* 0CB6D0 001CB5D0 1E00001A */  blez        $16, .L001CB64C
/* 0CB6D4 001CB5D4 00000000 */   nop
/* 0CB6D8 001CB5D8 BE11040C */  jal         rand
/* 0CB6DC 001CB5DC 00000000 */   nop
/* 0CB6E0 001CB5E0 00008244 */  mtc1        $2, $f0
/* 0CB6E4 001CB5E4 00000000 */  nop
/* 0CB6E8 001CB5E8 60008046 */  cvt.s.w     $f1, $f0
/* 0CB6EC 001CB5EC 00009044 */  mtc1        $16, $f0
/* 0CB6F0 001CB5F0 00000000 */  nop
/* 0CB6F4 001CB5F4 20008046 */  cvt.s.w     $f0, $f0
/* 0CB6F8 001CB5F8 42000146 */  mul.s       $f1, $f0, $f1
/* 0CB6FC 001CB5FC 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0CB700 001CB600 00008244 */  mtc1        $2, $f0
/* 0CB704 001CB604 00000000 */  nop
/* 0CB708 001CB608 030B0046 */  div.s       $f12, $f1, $f0
/* 0CB70C 001CB60C 2C44040C */  jal         fptosi
/* 0CB710 001CB610 00000000 */   nop
/* 0CB714 001CB614 45000524 */  addiu       $5, $0, 0x45
/* 0CB718 001CB618 C0100200 */  sll         $2, $2, 3
/* 0CB71C 001CB61C 21205D00 */  addu        $4, $2, $29
/* 0CB720 001CB620 3400838C */  lw          $3, 0x34($4)
/* 0CB724 001CB624 80100300 */  sll         $2, $3, 2
/* 0CB728 001CB628 21104300 */  addu        $2, $2, $3
/* 0CB72C 001CB62C 80180200 */  sll         $3, $2, 2
/* 0CB730 001CB630 3000828C */  lw          $2, 0x30($4)
/* 0CB734 001CB634 21104300 */  addu        $2, $2, $3
/* 0CB738 001CB638 00110200 */  sll         $2, $2, 4
/* 0CB73C 001CB63C 21105100 */  addu        $2, $2, $17
/* 0CB740 001CB640 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CB744 001CB644 21084100 */  addu        $1, $2, $1
/* 0CB748 001CB648 509C25AC */  sw          $5, -0x63B0($1)
.L001CB64C:
/* 0CB74C 001CB64C 28160072 */  paddub      $2, $16, $0
/* 0CB750 001CB650 2000BF7B */  lq          $31, 0x20($29)
/* 0CB754 001CB654 1000B17B */  lq          $17, 0x10($29)
/* 0CB758 001CB658 0000B07B */  lq          $16, 0x0($29)
/* 0CB75C 001CB65C 3002BD27 */  addiu       $29, $29, 0x230
/* 0CB760 001CB660 0800E003 */  jr          $31
/* 0CB764 001CB664 00000000 */   nop
/* 0CB768 001CB668 00000000 */  nop
/* 0CB76C 001CB66C 00000000 */  nop
