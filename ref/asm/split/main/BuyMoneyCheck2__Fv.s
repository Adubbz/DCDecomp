.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BuyMoneyCheck2__Fv
/* 0EB4A0 001EB3A0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0EB4A4 001EB3A4 0000BF7F */  sq          $31, 0x0($29)
/* 0EB4A8 001EB3A8 284E0070 */  paddub      $9, $0, $0
/* 0EB4AC 001EB3AC 2900023C */  lui         $2, %hi(LIT_1465__2)
/* 0EB4B0 001EB3B0 A0274424 */  addiu       $4, $2, %lo(LIT_1465__2)
/* 0EB4B4 001EB3B4 1000A327 */  addiu       $3, $29, 0x10
/* 0EB4B8 001EB3B8 000082DC */  ld          $2, 0x0($4)
/* 0EB4BC 001EB3BC 080080C4 */  lwc1        $f0, 0x8($4)
/* 0EB4C0 001EB3C0 000062FC */  sd          $2, 0x0($3)
/* 0EB4C4 001EB3C4 080060E4 */  swc1        $f0, 0x8($3)
/* 0EB4C8 001EB3C8 8494828F */  lw          $2, -0x6B7C($28)
/* 0EB4CC 001EB3CC 60434624 */  addiu       $6, $2, 0x4360
/* 0EB4D0 001EB3D0 28560070 */  paddub      $10, $0, $0
/* 0EB4D4 001EB3D4 10000010 */  b           .L001EB418
/* 0EB4D8 001EB3D8 00000000 */   nop
.L001EB3DC:
/* 0EB4DC 001EB3DC 80180A00 */  sll         $3, $10, 2
/* 0EB4E0 001EB3E0 9494828F */  lw          $2, -0x6B6C($28)
/* 0EB4E4 001EB3E4 21104300 */  addu        $2, $2, $3
/* 0EB4E8 001EB3E8 0000438C */  lw          $3, 0x0($2)
/* 0EB4EC 001EB3EC 01000224 */  addiu       $2, $0, 0x1
/* 0EB4F0 001EB3F0 08006214 */  bne         $3, $2, .L001EB414
/* 0EB4F4 001EB3F4 00000000 */   nop
/* 0EB4F8 001EB3F8 40100A00 */  sll         $2, $10, 1
/* 0EB4FC 001EB3FC 21104600 */  addu        $2, $2, $6
/* 0EB500 001EB400 0E004484 */  lh          $4, 0xE($2)
/* 0EB504 001EB404 282E0070 */  paddub      $5, $0, $0
/* 0EB508 001EB408 B4AC070C */  jal         CalItemMoney__Fii
/* 0EB50C 001EB40C 00000000 */   nop
/* 0EB510 001EB410 21482201 */  addu        $9, $9, $2
.L001EB414:
/* 0EB514 001EB414 01004A25 */  addiu       $10, $10, 0x1
.L001EB418:
/* 0EB518 001EB418 64004229 */  slti        $2, $10, 0x64
/* 0EB51C 001EB41C EFFF4014 */  bnez        $2, .L001EB3DC
/* 0EB520 001EB420 00000000 */   nop
/* 0EB524 001EB424 285E0070 */  paddub      $11, $0, $0
/* 0EB528 001EB428 26000010 */  b           .L001EB4C4
/* 0EB52C 001EB42C 00000000 */   nop
.L001EB430:
/* 0EB530 001EB430 28560070 */  paddub      $10, $0, $0
/* 0EB534 001EB434 1F000010 */  b           .L001EB4B4
/* 0EB538 001EB438 00000000 */   nop
.L001EB43C:
/* 0EB53C 001EB43C 80100B00 */  sll         $2, $11, 2
/* 0EB540 001EB440 21104B00 */  addu        $2, $2, $11
/* 0EB544 001EB444 C0180200 */  sll         $3, $2, 3
/* 0EB548 001EB448 9894828F */  lw          $2, -0x6B68($28)
/* 0EB54C 001EB44C 21184300 */  addu        $3, $2, $3
/* 0EB550 001EB450 80100A00 */  sll         $2, $10, 2
/* 0EB554 001EB454 21106200 */  addu        $2, $3, $2
/* 0EB558 001EB458 0000438C */  lw          $3, 0x0($2)
/* 0EB55C 001EB45C 01000224 */  addiu       $2, $0, 0x1
/* 0EB560 001EB460 13006214 */  bne         $3, $2, .L001EB4B0
/* 0EB564 001EB464 00000000 */   nop
/* 0EB568 001EB468 8494838F */  lw          $3, -0x6B7C($28)
/* 0EB56C 001EB46C A80A0224 */  addiu       $2, $0, 0xAA8
/* 0EB570 001EB470 18106201 */  mult        $2, $11, $2
/* 0EB574 001EB474 21106200 */  addu        $2, $3, $2
/* 0EB578 001EB478 0C454324 */  addiu       $3, $2, 0x450C
/* 0EB57C 001EB47C 40110A00 */  sll         $2, $10, 5
/* 0EB580 001EB480 23104A00 */  subu        $2, $2, $10
/* 0EB584 001EB484 C0100200 */  sll         $2, $2, 3
/* 0EB588 001EB488 21306200 */  addu        $6, $3, $2
/* 0EB58C 001EB48C 0000C484 */  lh          $4, 0x0($6)
/* 0EB590 001EB490 282E0070 */  paddub      $5, $0, $0
/* 0EB594 001EB494 B4AC070C */  jal         CalItemMoney__Fii
/* 0EB598 001EB498 00000000 */   nop
/* 0EB59C 001EB49C 21482201 */  addu        $9, $9, $2
/* 0EB5A0 001EB4A0 2826C070 */  paddub      $4, $6, $0
/* 0EB5A4 001EB4A4 C4AC070C */  jal         WeaponCalMoney__FP11WEAPON_HAVEi
/* 0EB5A8 001EB4A8 00000000 */   nop
/* 0EB5AC 001EB4AC 21482201 */  addu        $9, $9, $2
.L001EB4B0:
/* 0EB5B0 001EB4B0 01004A25 */  addiu       $10, $10, 0x1
.L001EB4B4:
/* 0EB5B4 001EB4B4 0A004229 */  slti        $2, $10, 0xA
/* 0EB5B8 001EB4B8 E0FF4014 */  bnez        $2, .L001EB43C
/* 0EB5BC 001EB4BC 00000000 */   nop
/* 0EB5C0 001EB4C0 01006B25 */  addiu       $11, $11, 0x1
.L001EB4C4:
/* 0EB5C4 001EB4C4 06006229 */  slti        $2, $11, 0x6
/* 0EB5C8 001EB4C8 D9FF4014 */  bnez        $2, .L001EB430
/* 0EB5CC 001EB4CC 00000000 */   nop
/* 0EB5D0 001EB4D0 8494828F */  lw          $2, -0x6B7C($28)
/* 0EB5D4 001EB4D4 04054624 */  addiu       $6, $2, 0x504
/* 0EB5D8 001EB4D8 F87FC624 */  addiu       $6, $6, 0x7FF8
/* 0EB5DC 001EB4DC 28560070 */  paddub      $10, $0, $0
/* 0EB5E0 001EB4E0 0F000010 */  b           .L001EB520
/* 0EB5E4 001EB4E4 00000000 */   nop
.L001EB4E8:
/* 0EB5E8 001EB4E8 80180A00 */  sll         $3, $10, 2
/* 0EB5EC 001EB4EC 9C94828F */  lw          $2, -0x6B64($28)
/* 0EB5F0 001EB4F0 21104300 */  addu        $2, $2, $3
/* 0EB5F4 001EB4F4 0000438C */  lw          $3, 0x0($2)
/* 0EB5F8 001EB4F8 01000224 */  addiu       $2, $0, 0x1
/* 0EB5FC 001EB4FC 06006214 */  bne         $3, $2, .L001EB518
/* 0EB600 001EB500 00000000 */   nop
/* 0EB604 001EB504 0000C484 */  lh          $4, 0x0($6)
/* 0EB608 001EB508 282E0070 */  paddub      $5, $0, $0
/* 0EB60C 001EB50C B4AC070C */  jal         CalItemMoney__Fii
/* 0EB610 001EB510 00000000 */   nop
/* 0EB614 001EB514 21482201 */  addu        $9, $9, $2
.L001EB518:
/* 0EB618 001EB518 01004A25 */  addiu       $10, $10, 0x1
/* 0EB61C 001EB51C 2000C624 */  addiu       $6, $6, 0x20
.L001EB520:
/* 0EB620 001EB520 28004229 */  slti        $2, $10, 0x28
/* 0EB624 001EB524 F0FF4014 */  bnez        $2, .L001EB4E8
/* 0EB628 001EB528 00000000 */   nop
/* 0EB62C 001EB52C 28162071 */  paddub      $2, $9, $0
/* 0EB630 001EB530 0000BF7B */  lq          $31, 0x0($29)
/* 0EB634 001EB534 2000BD27 */  addiu       $29, $29, 0x20
/* 0EB638 001EB538 0800E003 */  jr          $31
/* 0EB63C 001EB53C 00000000 */   nop
