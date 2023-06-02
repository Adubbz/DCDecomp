.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CreatPartsList__11CDungeonMapFPiiii
/* CA390 001CA290 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* CA394 001CA294 28160070 */  paddub     $2, $0, $0
/* CA398 001CA298 2800033C */  lui        $3, %hi(_2868)
/* CA39C 001CA29C 70A06324 */  addiu      $3, $3, %lo(_2868)
/* CA3A0 001CA2A0 0000AA27 */  addiu      $10, $sp, 0x0
/* CA3A4 001CA2A4 00006978 */  lq         $9, 0x0($3)
/* CA3A8 001CA2A8 10006378 */  lq         $3, 0x10($3)
/* CA3AC 001CA2AC 0000497D */  sq         $9, 0x0($10)
/* CA3B0 001CA2B0 1000437D */  sq         $3, 0x10($10)
/* CA3B4 001CA2B4 01000324 */  addiu      $3, $0, 0x1
/* CA3B8 001CA2B8 68000010 */  b          .L001CA45C
/* CA3BC 001CA2BC 00000000 */   nop
.L001CA2C0:
/* CA3C0 001CA2C0 01000924 */  addiu      $9, $0, 0x1
/* CA3C4 001CA2C4 61000010 */  b          .L001CA44C
/* CA3C8 001CA2C8 00000000 */   nop
.L001CA2CC:
/* CA3CC 001CA2CC FFFF0A24 */  addiu      $10, $0, -0x1
/* CA3D0 001CA2D0 1C000A11 */  beq        $8, $10, .L001CA344
/* CA3D4 001CA2D4 00000000 */   nop
/* CA3D8 001CA2D8 80500300 */  sll        $10, $3, 2
/* CA3DC 001CA2DC 21504301 */  addu       $10, $10, $3
/* CA3E0 001CA2E0 80500A00 */  sll        $10, $10, 2
/* CA3E4 001CA2E4 21502A01 */  addu       $10, $9, $10
/* CA3E8 001CA2E8 00510A00 */  sll        $10, $10, 4
/* CA3EC 001CA2EC 21504401 */  addu       $10, $10, $4
/* CA3F0 001CA2F0 0100013C */  lui        $at, (0x10000 >> 16)
/* CA3F4 001CA2F4 21084101 */  addu       $at, $10, $at
/* CA3F8 001CA2F8 509C2B8C */  lw         $11, -0x63B0($at)
/* CA3FC 001CA2FC 2A506701 */  slt        $10, $11, $7
/* CA400 001CA300 51004015 */  bnez       $10, .L001CA448
/* CA404 001CA304 00000000 */   nop
/* CA408 001CA308 2A080B01 */  slt        $at, $8, $11
/* CA40C 001CA30C 4E002014 */  bnez       $at, .L001CA448
/* CA410 001CA310 00000000 */   nop
/* CA414 001CA314 C0500200 */  sll        $10, $2, 3
/* CA418 001CA318 2150AA00 */  addu       $10, $5, $10
/* CA41C 001CA31C 000049AD */  sw         $9, 0x0($10)
/* CA420 001CA320 040043AD */  sw         $3, 0x4($10)
/* CA424 001CA324 01004224 */  addiu      $2, $2, 0x1
/* CA428 001CA328 FFFFCA24 */  addiu      $10, $6, -0x1
/* CA42C 001CA32C 2A504A00 */  slt        $10, $2, $10
/* CA430 001CA330 45004015 */  bnez       $10, .L001CA448
/* CA434 001CA334 00000000 */   nop
/* CA438 001CA338 10000324 */  addiu      $3, $0, 0x10
/* CA43C 001CA33C 46000010 */  b          .L001CA458
/* CA440 001CA340 00000000 */   nop
.L001CA344:
/* CA444 001CA344 01000A24 */  addiu      $10, $0, 0x1
/* CA448 001CA348 285E0070 */  paddub     $11, $0, $0
/* CA44C 001CA34C 22000010 */  b          .L001CA3D8
/* CA450 001CA350 00000000 */   nop
.L001CA354:
/* CA454 001CA354 C0600B00 */  sll        $12, $11, 3
/* CA458 001CA358 21609D01 */  addu       $12, $12, $sp
/* CA45C 001CA35C 00008E8D */  lw         $14, 0x0($12)
/* CA460 001CA360 04008C8D */  lw         $12, 0x4($12)
/* CA464 001CA364 21686C00 */  addu       $13, $3, $12
/* CA468 001CA368 80600D00 */  sll        $12, $13, 2
/* CA46C 001CA36C 21608D01 */  addu       $12, $12, $13
/* CA470 001CA370 80600C00 */  sll        $12, $12, 2
/* CA474 001CA374 21602C01 */  addu       $12, $9, $12
/* CA478 001CA378 2170CC01 */  addu       $14, $14, $12
/* CA47C 001CA37C 00610E00 */  sll        $12, $14, 4
/* CA480 001CA380 21608401 */  addu       $12, $12, $4
/* CA484 001CA384 0100013C */  lui        $at, (0x10000 >> 16)
/* CA488 001CA388 21088101 */  addu       $at, $12, $at
/* CA48C 001CA38C 509C2D8C */  lw         $13, -0x63B0($at)
/* CA490 001CA390 FFFF0C24 */  addiu      $12, $0, -0x1
/* CA494 001CA394 0F00AC11 */  beq        $13, $12, .L001CA3D4
/* CA498 001CA398 00000000 */   nop
/* CA49C 001CA39C C0600E00 */  sll        $12, $14, 3
/* CA4A0 001CA3A0 21608E01 */  addu       $12, $12, $14
/* CA4A4 001CA3A4 40600C00 */  sll        $12, $12, 1
/* CA4A8 001CA3A8 21608E01 */  addu       $12, $12, $14
/* CA4AC 001CA3AC 80680C00 */  sll        $13, $12, 2
/* CA4B0 001CA3B0 D5010C3C */  lui        $12, %hi(D_1D56DE8)
/* CA4B4 001CA3B4 E86D8C25 */  addiu      $12, $12, %lo(D_1D56DE8)
/* CA4B8 001CA3B8 21608D01 */  addu       $12, $12, $13
/* CA4BC 001CA3BC 00008C8D */  lw         $12, 0x0($12)
/* CA4C0 001CA3C0 00048D31 */  andi       $13, $12, 0x400
/* CA4C4 001CA3C4 00040C24 */  addiu      $12, $0, 0x400
/* CA4C8 001CA3C8 0200AC15 */  bne        $13, $12, .L001CA3D4
/* CA4CC 001CA3CC 00000000 */   nop
/* CA4D0 001CA3D0 28560070 */  paddub     $10, $0, $0
.L001CA3D4:
/* CA4D4 001CA3D4 01006B25 */  addiu      $11, $11, 0x1
.L001CA3D8:
/* CA4D8 001CA3D8 04006C29 */  slti       $12, $11, 0x4
/* CA4DC 001CA3DC DDFF8015 */  bnez       $12, .L001CA354
/* CA4E0 001CA3E0 00000000 */   nop
/* CA4E4 001CA3E4 80580300 */  sll        $11, $3, 2
/* CA4E8 001CA3E8 21586301 */  addu       $11, $11, $3
/* CA4EC 001CA3EC 80580B00 */  sll        $11, $11, 2
/* CA4F0 001CA3F0 21582B01 */  addu       $11, $9, $11
/* CA4F4 001CA3F4 00590B00 */  sll        $11, $11, 4
/* CA4F8 001CA3F8 21586401 */  addu       $11, $11, $4
/* CA4FC 001CA3FC 0100013C */  lui        $at, (0x10000 >> 16)
/* CA500 001CA400 21086101 */  addu       $at, $11, $at
/* CA504 001CA404 509C2B8C */  lw         $11, -0x63B0($at)
/* CA508 001CA408 0F006715 */  bne        $11, $7, .L001CA448
/* CA50C 001CA40C 00000000 */   nop
/* CA510 001CA410 0D004011 */  beqz       $10, .L001CA448
/* CA514 001CA414 00000000 */   nop
/* CA518 001CA418 C0500200 */  sll        $10, $2, 3
/* CA51C 001CA41C 2150AA00 */  addu       $10, $5, $10
/* CA520 001CA420 000049AD */  sw         $9, 0x0($10)
/* CA524 001CA424 040043AD */  sw         $3, 0x4($10)
/* CA528 001CA428 01004224 */  addiu      $2, $2, 0x1
/* CA52C 001CA42C FFFFCA24 */  addiu      $10, $6, -0x1
/* CA530 001CA430 2A504A00 */  slt        $10, $2, $10
/* CA534 001CA434 04004015 */  bnez       $10, .L001CA448
/* CA538 001CA438 00000000 */   nop
/* CA53C 001CA43C 10000324 */  addiu      $3, $0, 0x10
/* CA540 001CA440 05000010 */  b          .L001CA458
/* CA544 001CA444 00000000 */   nop
.L001CA448:
/* CA548 001CA448 01002925 */  addiu      $9, $9, 0x1
.L001CA44C:
/* CA54C 001CA44C 0F002A29 */  slti       $10, $9, 0xF
/* CA550 001CA450 9EFF4015 */  bnez       $10, .L001CA2CC
/* CA554 001CA454 00000000 */   nop
.L001CA458:
/* CA558 001CA458 01006324 */  addiu      $3, $3, 0x1
.L001CA45C:
/* CA55C 001CA45C 0F006928 */  slti       $9, $3, 0xF
/* CA560 001CA460 97FF2015 */  bnez       $9, .L001CA2C0
/* CA564 001CA464 00000000 */   nop
/* CA568 001CA468 2000BD27 */  addiu      $sp, $sp, 0x20
/* CA56C 001CA46C 0800E003 */  jr         $31
/* CA570 001CA470 00000000 */   nop
/* CA574 001CA474 00000000 */  nop
/* CA578 001CA478 00000000 */  nop
/* CA57C 001CA47C 00000000 */  nop
