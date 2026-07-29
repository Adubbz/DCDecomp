.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ItemShopSelectKey2__Fv
/* 0EE380 001EE280 70FDBD27 */  addiu       $29, $29, -0x290
/* 0EE384 001EE284 8000BF7F */  sq          $31, 0x80($29)
/* 0EE388 001EE288 7000B77F */  sq          $23, 0x70($29)
/* 0EE38C 001EE28C 6000B67F */  sq          $22, 0x60($29)
/* 0EE390 001EE290 5000B57F */  sq          $21, 0x50($29)
/* 0EE394 001EE294 4000B47F */  sq          $20, 0x40($29)
/* 0EE398 001EE298 3000B37F */  sq          $19, 0x30($29)
/* 0EE39C 001EE29C 2000B27F */  sq          $18, 0x20($29)
/* 0EE3A0 001EE2A0 1000B17F */  sq          $17, 0x10($29)
/* 0EE3A4 001EE2A4 0000B07F */  sq          $16, 0x0($29)
/* 0EE3A8 001EE2A8 CC01023C */  lui         $2, %hi(GamePad)
/* 0EE3AC 001EE2AC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EE3B0 001EE2B0 00100524 */  addiu       $5, $0, 0x1000
/* 0EE3B4 001EE2B4 1CAE040C */  jal         Down__8CGamePadFi
/* 0EE3B8 001EE2B8 00000000 */   nop
/* 0EE3BC 001EE2BC 1D004010 */  beqz        $2, .L001EE334
/* 0EE3C0 001EE2C0 00000000 */   nop
/* 0EE3C4 001EE2C4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE3C8 001EE2C8 E400228C */  lw          $2, %lo(ShopMenu + 0x14)($1)
/* 0EE3CC 001EE2CC FBFF4224 */  addiu       $2, $2, -0x5
/* 0EE3D0 001EE2D0 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE3D4 001EE2D4 E40022AC */  sw          $2, %lo(ShopMenu + 0x14)($1)
/* 0EE3D8 001EE2D8 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE3DC 001EE2DC E400228C */  lw          $2, %lo(ShopMenu + 0x14)($1)
/* 0EE3E0 001EE2E0 04004104 */  bgez        $2, .L001EE2F4
/* 0EE3E4 001EE2E4 00000000 */   nop
/* 0EE3E8 001EE2E8 05004224 */  addiu       $2, $2, 0x5
/* 0EE3EC 001EE2EC D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE3F0 001EE2F0 E40022AC */  sw          $2, %lo(ShopMenu + 0x14)($1)
.L001EE2F4:
/* 0EE3F4 001EE2F4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE3F8 001EE2F8 E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EE3FC 001EE2FC 05000224 */  addiu       $2, $0, 0x5
/* 0EE400 001EE300 1A006200 */  div         $0, $3, $2
/* 0EE404 001EE304 02004014 */  bnez        $2, .L001EE310
/* 0EE408 001EE308 00000000 */   nop
/* 0EE40C 001EE30C CD010000 */  break       0, 7
.L001EE310:
/* 0EE410 001EE310 12180000 */  mflo        $3
/* 0EE414 001EE314 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EE418 001EE318 46022290 */  lbu         $2, %lo(ShopMenu + 0x176)($1)
/* 0EE41C 001EE31C 2A086200 */  slt         $1, $3, $2
/* 0EE420 001EE320 04002010 */  beqz        $1, .L001EE334
/* 0EE424 001EE324 00000000 */   nop
/* 0EE428 001EE328 FFFF4224 */  addiu       $2, $2, -0x1
/* 0EE42C 001EE32C D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EE430 001EE330 460222A0 */  sb          $2, %lo(ShopMenu + 0x176)($1)
.L001EE334:
/* 0EE434 001EE334 CC01023C */  lui         $2, %hi(GamePad)
/* 0EE438 001EE338 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EE43C 001EE33C 00400524 */  addiu       $5, $0, 0x4000
/* 0EE440 001EE340 1CAE040C */  jal         Down__8CGamePadFi
/* 0EE444 001EE344 00000000 */   nop
/* 0EE448 001EE348 21004010 */  beqz        $2, .L001EE3D0
/* 0EE44C 001EE34C 00000000 */   nop
/* 0EE450 001EE350 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE454 001EE354 E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EE458 001EE358 19006228 */  slti        $2, $3, 0x19
/* 0EE45C 001EE35C 06004014 */  bnez        $2, .L001EE378
/* 0EE460 001EE360 00000000 */   nop
/* 0EE464 001EE364 02000224 */  addiu       $2, $0, 0x2
/* 0EE468 001EE368 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0EE46C 001EE36C D20022A4 */  sh          $2, %lo(ShopMenu + 0x2)($1)
/* 0EE470 001EE370 04000010 */  b           .L001EE384
/* 0EE474 001EE374 00000000 */   nop
.L001EE378:
/* 0EE478 001EE378 05006224 */  addiu       $2, $3, 0x5
/* 0EE47C 001EE37C D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE480 001EE380 E40022AC */  sw          $2, %lo(ShopMenu + 0x14)($1)
.L001EE384:
/* 0EE484 001EE384 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EE488 001EE388 46022290 */  lbu         $2, %lo(ShopMenu + 0x176)($1)
/* 0EE48C 001EE38C 03004424 */  addiu       $4, $2, 0x3
/* 0EE490 001EE390 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE494 001EE394 E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EE498 001EE398 05000224 */  addiu       $2, $0, 0x5
/* 0EE49C 001EE39C 1A006200 */  div         $0, $3, $2
/* 0EE4A0 001EE3A0 02004014 */  bnez        $2, .L001EE3AC
/* 0EE4A4 001EE3A4 00000000 */   nop
/* 0EE4A8 001EE3A8 CD010000 */  break       0, 7
.L001EE3AC:
/* 0EE4AC 001EE3AC 12100000 */  mflo        $2
/* 0EE4B0 001EE3B0 2A088200 */  slt         $1, $4, $2
/* 0EE4B4 001EE3B4 06002010 */  beqz        $1, .L001EE3D0
/* 0EE4B8 001EE3B8 00000000 */   nop
/* 0EE4BC 001EE3BC D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EE4C0 001EE3C0 46022290 */  lbu         $2, %lo(ShopMenu + 0x176)($1)
/* 0EE4C4 001EE3C4 01004224 */  addiu       $2, $2, 0x1
/* 0EE4C8 001EE3C8 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EE4CC 001EE3CC 460222A0 */  sb          $2, %lo(ShopMenu + 0x176)($1)
.L001EE3D0:
/* 0EE4D0 001EE3D0 CC01023C */  lui         $2, %hi(GamePad)
/* 0EE4D4 001EE3D4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EE4D8 001EE3D8 00800534 */  ori         $5, $0, 0x8000
/* 0EE4DC 001EE3DC 1CAE040C */  jal         Down__8CGamePadFi
/* 0EE4E0 001EE3E0 00000000 */   nop
/* 0EE4E4 001EE3E4 0D004010 */  beqz        $2, .L001EE41C
/* 0EE4E8 001EE3E8 00000000 */   nop
/* 0EE4EC 001EE3EC D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE4F0 001EE3F0 E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EE4F4 001EE3F4 05000224 */  addiu       $2, $0, 0x5
/* 0EE4F8 001EE3F8 1A006200 */  div         $0, $3, $2
/* 0EE4FC 001EE3FC 00000000 */  nop
/* 0EE500 001EE400 00000000 */  nop
/* 0EE504 001EE404 10100000 */  mfhi        $2
/* 0EE508 001EE408 04004010 */  beqz        $2, .L001EE41C
/* 0EE50C 001EE40C 00000000 */   nop
/* 0EE510 001EE410 FFFF6224 */  addiu       $2, $3, -0x1
/* 0EE514 001EE414 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE518 001EE418 E40022AC */  sw          $2, %lo(ShopMenu + 0x14)($1)
.L001EE41C:
/* 0EE51C 001EE41C CC01023C */  lui         $2, %hi(GamePad)
/* 0EE520 001EE420 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EE524 001EE424 00200524 */  addiu       $5, $0, 0x2000
/* 0EE528 001EE428 1CAE040C */  jal         Down__8CGamePadFi
/* 0EE52C 001EE42C 00000000 */   nop
/* 0EE530 001EE430 24004010 */  beqz        $2, .L001EE4C4
/* 0EE534 001EE434 00000000 */   nop
/* 0EE538 001EE438 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE53C 001EE43C E400268C */  lw          $6, %lo(ShopMenu + 0x14)($1)
/* 0EE540 001EE440 05000524 */  addiu       $5, $0, 0x5
/* 0EE544 001EE444 1A00C500 */  div         $0, $6, $5
/* 0EE548 001EE448 00000000 */  nop
/* 0EE54C 001EE44C 00000000 */  nop
/* 0EE550 001EE450 10200000 */  mfhi        $4
/* 0EE554 001EE454 04000324 */  addiu       $3, $0, 0x4
/* 0EE558 001EE458 17008314 */  bne         $4, $3, .L001EE4B8
/* 0EE55C 001EE45C 00000000 */   nop
/* 0EE560 001EE460 01000324 */  addiu       $3, $0, 0x1
/* 0EE564 001EE464 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0EE568 001EE468 D20023A4 */  sh          $3, %lo(ShopMenu + 0x2)($1)
/* 0EE56C 001EE46C D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE570 001EE470 E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EE574 001EE474 1A006500 */  div         $0, $3, $5
/* 0EE578 001EE478 0200A014 */  bnez        $5, .L001EE484
/* 0EE57C 001EE47C 00000000 */   nop
/* 0EE580 001EE480 CD010000 */  break       0, 7
.L001EE484:
/* 0EE584 001EE484 12200000 */  mflo        $4
/* 0EE588 001EE488 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EE58C 001EE48C 46022390 */  lbu         $3, %lo(ShopMenu + 0x176)($1)
/* 0EE590 001EE490 23208300 */  subu        $4, $4, $3
/* 0EE594 001EE494 D901013C */  lui         $1, %hi(ShopMenu + 0x20)
/* 0EE598 001EE498 F000238C */  lw          $3, %lo(ShopMenu + 0x20)($1)
/* 0EE59C 001EE49C 21206400 */  addu        $4, $3, $4
/* 0EE5A0 001EE4A0 80180400 */  sll         $3, $4, 2
/* 0EE5A4 001EE4A4 21186400 */  addu        $3, $3, $4
/* 0EE5A8 001EE4A8 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE5AC 001EE4AC E40023AC */  sw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EE5B0 001EE4B0 04000010 */  b           .L001EE4C4
/* 0EE5B4 001EE4B4 00000000 */   nop
.L001EE4B8:
/* 0EE5B8 001EE4B8 0100C324 */  addiu       $3, $6, 0x1
/* 0EE5BC 001EE4BC D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE5C0 001EE4C0 E40023AC */  sw          $3, %lo(ShopMenu + 0x14)($1)
.L001EE4C4:
/* 0EE5C4 001EE4C4 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0EE5C8 001EE4C8 D2002384 */  lh          $3, %lo(ShopMenu + 0x2)($1)
/* 0EE5CC 001EE4CC 20006014 */  bnez        $3, .L001EE550
/* 0EE5D0 001EE4D0 00000000 */   nop
/* 0EE5D4 001EE4D4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE5D8 001EE4D8 E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EE5DC 001EE4DC 1F006128 */  slti        $1, $3, 0x1F
/* 0EE5E0 001EE4E0 1B002014 */  bnez        $1, .L001EE550
/* 0EE5E4 001EE4E4 00000000 */   nop
/* 0EE5E8 001EE4E8 06000010 */  b           .L001EE504
/* 0EE5EC 001EE4EC 00000000 */   nop
.L001EE4F0:
/* 0EE5F0 001EE4F0 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE5F4 001EE4F4 E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EE5F8 001EE4F8 FBFF6324 */  addiu       $3, $3, -0x5
/* 0EE5FC 001EE4FC D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE600 001EE500 E40023AC */  sw          $3, %lo(ShopMenu + 0x14)($1)
.L001EE504:
/* 0EE604 001EE504 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE608 001EE508 E400248C */  lw          $4, %lo(ShopMenu + 0x14)($1)
/* 0EE60C 001EE50C 1F008128 */  slti        $1, $4, 0x1F
/* 0EE610 001EE510 F7FF2010 */  beqz        $1, .L001EE4F0
/* 0EE614 001EE514 00000000 */   nop
/* 0EE618 001EE518 05000324 */  addiu       $3, $0, 0x5
/* 0EE61C 001EE51C 1A008300 */  div         $0, $4, $3
/* 0EE620 001EE520 02006014 */  bnez        $3, .L001EE52C
/* 0EE624 001EE524 00000000 */   nop
/* 0EE628 001EE528 CD010000 */  break       0, 7
.L001EE52C:
/* 0EE62C 001EE52C 12180000 */  mflo        $3
/* 0EE630 001EE530 FEFF6324 */  addiu       $3, $3, -0x2
/* 0EE634 001EE534 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EE638 001EE538 460223A0 */  sb          $3, %lo(ShopMenu + 0x176)($1)
/* 0EE63C 001EE53C 02000324 */  addiu       $3, $0, 0x2
/* 0EE640 001EE540 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0EE644 001EE544 D20023A4 */  sh          $3, %lo(ShopMenu + 0x2)($1)
/* 0EE648 001EE548 FD010010 */  b           .L001EED40
/* 0EE64C 001EE54C 00000000 */   nop
.L001EE550:
/* 0EE650 001EE550 CC01023C */  lui         $2, %hi(GamePad)
/* 0EE654 001EE554 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EE658 001EE558 40000524 */  addiu       $5, $0, 0x40
/* 0EE65C 001EE55C 1CAE040C */  jal         Down__8CGamePadFi
/* 0EE660 001EE560 00000000 */   nop
/* 0EE664 001EE564 00014010 */  beqz        $2, .L001EE968
/* 0EE668 001EE568 00000000 */   nop
/* 0EE66C 001EE56C 01000224 */  addiu       $2, $0, 0x1
/* 0EE670 001EE570 D901013C */  lui         $1, %hi(ShopMenu + 0x6)
/* 0EE674 001EE574 D60022A4 */  sh          $2, %lo(ShopMenu + 0x6)($1)
/* 0EE678 001EE578 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE67C 001EE57C E400308C */  lw          $16, %lo(ShopMenu + 0x14)($1)
/* 0EE680 001EE580 80A81000 */  sll         $21, $16, 2
/* 0EE684 001EE584 80111000 */  sll         $2, $16, 6
/* 0EE688 001EE588 23105000 */  subu        $2, $2, $16
/* 0EE68C 001EE58C 80900200 */  sll         $18, $2, 2
/* 0EE690 001EE590 A094828F */  lw          $2, -0x6B60($28)
/* 0EE694 001EE594 21105200 */  addu        $2, $2, $18
/* 0EE698 001EE598 00004284 */  lh          $2, 0x0($2)
/* 0EE69C 001EE59C 51004128 */  slti        $1, $2, 0x51
/* 0EE6A0 001EE5A0 0B002010 */  beqz        $1, .L001EE5D0
/* 0EE6A4 001EE5A4 00000000 */   nop
/* 0EE6A8 001EE5A8 B894828F */  lw          $2, -0x6B48($28)
/* 0EE6AC 001EE5AC 10004284 */  lh          $2, 0x10($2)
/* 0EE6B0 001EE5B0 51004128 */  slti        $1, $2, 0x51
/* 0EE6B4 001EE5B4 06002010 */  beqz        $1, .L001EE5D0
/* 0EE6B8 001EE5B8 00000000 */   nop
/* 0EE6BC 001EE5BC 02000424 */  addiu       $4, $0, 0x2
/* 0EE6C0 001EE5C0 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EE6C4 001EE5C4 00000000 */   nop
/* 0EE6C8 001EE5C8 DD010010 */  b           .L001EED40
/* 0EE6CC 001EE5CC 00000000 */   nop
.L001EE5D0:
/* 0EE6D0 001EE5D0 B894828F */  lw          $2, -0x6B48($28)
/* 0EE6D4 001EE5D4 10004484 */  lh          $4, 0x10($2)
/* 0EE6D8 001EE5D8 109E070C */  jal         IsEnableCharge__Fi
/* 0EE6DC 001EE5DC 00000000 */   nop
/* 0EE6E0 001EE5E0 288E4070 */  paddub      $17, $2, $0
/* 0EE6E4 001EE5E4 1F002012 */  beqz        $17, .L001EE664
/* 0EE6E8 001EE5E8 00000000 */   nop
/* 0EE6EC 001EE5EC B894828F */  lw          $2, -0x6B48($28)
/* 0EE6F0 001EE5F0 10004484 */  lh          $4, 0x10($2)
/* 0EE6F4 001EE5F4 84008228 */  slti        $2, $4, 0x84
/* 0EE6F8 001EE5F8 10004014 */  bnez        $2, .L001EE63C
/* 0EE6FC 001EE5FC 00000000 */   nop
/* 0EE700 001EE600 A043070C */  jal         GetItemData__Fi
/* 0EE704 001EE604 00000000 */   nop
/* 0EE708 001EE608 0C004010 */  beqz        $2, .L001EE63C
/* 0EE70C 001EE60C 00000000 */   nop
/* 0EE710 001EE610 08004284 */  lh          $2, 0x8($2)
/* 0EE714 001EE614 10004230 */  andi        $2, $2, 0x10
/* 0EE718 001EE618 02004010 */  beqz        $2, .L001EE624
/* 0EE71C 001EE61C 00000000 */   nop
/* 0EE720 001EE620 288E0070 */  paddub      $17, $0, $0
.L001EE624:
/* 0EE724 001EE624 B894828F */  lw          $2, -0x6B48($28)
/* 0EE728 001EE628 10004384 */  lh          $3, 0x10($2)
/* 0EE72C 001EE62C B9000224 */  addiu       $2, $0, 0xB9
/* 0EE730 001EE630 02006214 */  bne         $3, $2, .L001EE63C
/* 0EE734 001EE634 00000000 */   nop
/* 0EE738 001EE638 288E0070 */  paddub      $17, $0, $0
.L001EE63C:
/* 0EE73C 001EE63C B894828F */  lw          $2, -0x6B48($28)
/* 0EE740 001EE640 10004384 */  lh          $3, 0x10($2)
/* 0EE744 001EE644 0C010224 */  addiu       $2, $0, 0x10C
/* 0EE748 001EE648 06006214 */  bne         $3, $2, .L001EE664
/* 0EE74C 001EE64C 00000000 */   nop
/* 0EE750 001EE650 E02F080C */  jal         GetMenuHebikiriFlag__Fv
/* 0EE754 001EE654 00000000 */   nop
/* 0EE758 001EE658 02004014 */  bnez        $2, .L001EE664
/* 0EE75C 001EE65C 00000000 */   nop
/* 0EE760 001EE660 288E0070 */  paddub      $17, $0, $0
.L001EE664:
/* 0EE764 001EE664 D901013C */  lui         $1, %hi(ShopMenu + 0x164)
/* 0EE768 001EE668 3402228C */  lw          $2, %lo(ShopMenu + 0x164)($1)
/* 0EE76C 001EE66C 0A004004 */  bltz        $2, .L001EE698
/* 0EE770 001EE670 00000000 */   nop
/* 0EE774 001EE674 02000424 */  addiu       $4, $0, 0x2
/* 0EE778 001EE678 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EE77C 001EE67C 00000000 */   nop
/* 0EE780 001EE680 05000424 */  addiu       $4, $0, 0x5
/* 0EE784 001EE684 01000524 */  addiu       $5, $0, 0x1
/* 0EE788 001EE688 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EE78C 001EE68C 00000000 */   nop
/* 0EE790 001EE690 AB010010 */  b           .L001EED40
/* 0EE794 001EE694 00000000 */   nop
.L001EE698:
/* 0EE798 001EE698 0A002016 */  bnez        $17, .L001EE6C4
/* 0EE79C 001EE69C 00000000 */   nop
/* 0EE7A0 001EE6A0 02000424 */  addiu       $4, $0, 0x2
/* 0EE7A4 001EE6A4 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EE7A8 001EE6A8 00000000 */   nop
/* 0EE7AC 001EE6AC 04000424 */  addiu       $4, $0, 0x4
/* 0EE7B0 001EE6B0 01000524 */  addiu       $5, $0, 0x1
/* 0EE7B4 001EE6B4 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EE7B8 001EE6B8 00000000 */   nop
/* 0EE7BC 001EE6BC A0010010 */  b           .L001EED40
/* 0EE7C0 001EE6C0 00000000 */   nop
.L001EE6C4:
/* 0EE7C4 001EE6C4 9094828F */  lw          $2, -0x6B70($28)
/* 0EE7C8 001EE6C8 21105500 */  addu        $2, $2, $21
/* 0EE7CC 001EE6CC 0000568C */  lw          $22, 0x0($2)
/* 0EE7D0 001EE6D0 B894828F */  lw          $2, -0x6B48($28)
/* 0EE7D4 001EE6D4 0000518C */  lw          $17, 0x0($2)
/* 0EE7D8 001EE6D8 9000A427 */  addiu       $4, $29, 0x90
/* 0EE7DC 001EE6DC 282E0070 */  paddub      $5, $0, $0
/* 0EE7E0 001EE6E0 F0010624 */  addiu       $6, $0, 0x1F0
/* 0EE7E4 001EE6E4 5A0D040C */  jal         memset
/* 0EE7E8 001EE6E8 00000000 */   nop
/* 0EE7EC 001EE6EC A094828F */  lw          $2, -0x6B60($28)
/* 0EE7F0 001EE6F0 21905200 */  addu        $18, $2, $18
/* 0EE7F4 001EE6F4 00004486 */  lh          $4, 0x0($18)
/* 0EE7F8 001EE6F8 88C7080C */  jal         WhatIsKindofItem__Fi
/* 0EE7FC 001EE6FC 00000000 */   nop
/* 0EE800 001EE700 28A64070 */  paddub      $20, $2, $0
/* 0EE804 001EE704 00004286 */  lh          $2, 0x0($18)
/* 0EE808 001EE708 8002A2AF */  sw          $2, 0x280($29)
/* 0EE80C 001EE70C 02000224 */  addiu       $2, $0, 0x2
/* 0EE810 001EE710 13008212 */  beq         $20, $2, .L001EE760
/* 0EE814 001EE714 00000000 */   nop
/* 0EE818 001EE718 01000224 */  addiu       $2, $0, 0x1
/* 0EE81C 001EE71C 09008212 */  beq         $20, $2, .L001EE744
/* 0EE820 001EE720 00000000 */   nop
/* 0EE824 001EE724 03008012 */  beqz        $20, .L001EE734
/* 0EE828 001EE728 00000000 */   nop
/* 0EE82C 001EE72C 13000010 */  b           .L001EE77C
/* 0EE830 001EE730 00000000 */   nop
.L001EE734:
/* 0EE834 001EE734 0400428E */  lw          $2, 0x4($18)
/* 0EE838 001EE738 9000A2AF */  sw          $2, 0x90($29)
/* 0EE83C 001EE73C 12000010 */  b           .L001EE788
/* 0EE840 001EE740 00000000 */   nop
.L001EE744:
/* 0EE844 001EE744 9000A427 */  addiu       $4, $29, 0x90
/* 0EE848 001EE748 04004526 */  addiu       $5, $18, 0x4
/* 0EE84C 001EE74C F8000624 */  addiu       $6, $0, 0xF8
/* 0EE850 001EE750 EC0C040C */  jal         memcpy
/* 0EE854 001EE754 00000000 */   nop
/* 0EE858 001EE758 0B000010 */  b           .L001EE788
/* 0EE85C 001EE75C 00000000 */   nop
.L001EE760:
/* 0EE860 001EE760 9000A427 */  addiu       $4, $29, 0x90
/* 0EE864 001EE764 04004526 */  addiu       $5, $18, 0x4
/* 0EE868 001EE768 20000624 */  addiu       $6, $0, 0x20
/* 0EE86C 001EE76C EC0C040C */  jal         memcpy
/* 0EE870 001EE770 00000000 */   nop
/* 0EE874 001EE774 04000010 */  b           .L001EE788
/* 0EE878 001EE778 00000000 */   nop
.L001EE77C:
/* 0EE87C 001EE77C 28264072 */  paddub      $4, $18, $0
/* 0EE880 001EE780 3C9A070C */  jal         InitShopItemListData__FP13SHOP_ITEMLIST
/* 0EE884 001EE784 00000000 */   nop
.L001EE788:
/* 0EE888 001EE788 B894828F */  lw          $2, -0x6B48($28)
/* 0EE88C 001EE78C 10004484 */  lh          $4, 0x10($2)
/* 0EE890 001EE790 88C7080C */  jal         WhatIsKindofItem__Fi
/* 0EE894 001EE794 00000000 */   nop
/* 0EE898 001EE798 289E4070 */  paddub      $19, $2, $0
/* 0EE89C 001EE79C B894838F */  lw          $3, -0x6B48($28)
/* 0EE8A0 001EE7A0 10006284 */  lh          $2, 0x10($3)
/* 0EE8A4 001EE7A4 8402B727 */  addiu       $23, $29, 0x284
/* 0EE8A8 001EE7A8 0000E2AE */  sw          $2, 0x0($23)
/* 0EE8AC 001EE7AC 02000224 */  addiu       $2, $0, 0x2
/* 0EE8B0 001EE7B0 13006212 */  beq         $19, $2, .L001EE800
/* 0EE8B4 001EE7B4 00000000 */   nop
/* 0EE8B8 001EE7B8 01000224 */  addiu       $2, $0, 0x1
/* 0EE8BC 001EE7BC 09006212 */  beq         $19, $2, .L001EE7E4
/* 0EE8C0 001EE7C0 00000000 */   nop
/* 0EE8C4 001EE7C4 03006012 */  beqz        $19, .L001EE7D4
/* 0EE8C8 001EE7C8 00000000 */   nop
/* 0EE8CC 001EE7CC 11000010 */  b           .L001EE814
/* 0EE8D0 001EE7D0 00000000 */   nop
.L001EE7D4:
/* 0EE8D4 001EE7D4 12006284 */  lh          $2, 0x12($3)
/* 0EE8D8 001EE7D8 8801A2AF */  sw          $2, 0x188($29)
/* 0EE8DC 001EE7DC 0D000010 */  b           .L001EE814
/* 0EE8E0 001EE7E0 00000000 */   nop
.L001EE7E4:
/* 0EE8E4 001EE7E4 8801A427 */  addiu       $4, $29, 0x188
/* 0EE8E8 001EE7E8 BC94858F */  lw          $5, -0x6B44($28)
/* 0EE8EC 001EE7EC F8000624 */  addiu       $6, $0, 0xF8
/* 0EE8F0 001EE7F0 EC0C040C */  jal         memcpy
/* 0EE8F4 001EE7F4 00000000 */   nop
/* 0EE8F8 001EE7F8 06000010 */  b           .L001EE814
/* 0EE8FC 001EE7FC 00000000 */   nop
.L001EE800:
/* 0EE900 001EE800 8801A427 */  addiu       $4, $29, 0x188
/* 0EE904 001EE804 C094858F */  lw          $5, -0x6B40($28)
/* 0EE908 001EE808 20000624 */  addiu       $6, $0, 0x20
/* 0EE90C 001EE80C EC0C040C */  jal         memcpy
/* 0EE910 001EE810 00000000 */   nop
.L001EE814:
/* 0EE914 001EE814 02000224 */  addiu       $2, $0, 0x2
/* 0EE918 001EE818 14008212 */  beq         $20, $2, .L001EE86C
/* 0EE91C 001EE81C 00000000 */   nop
/* 0EE920 001EE820 01000224 */  addiu       $2, $0, 0x1
/* 0EE924 001EE824 0A008212 */  beq         $20, $2, .L001EE850
/* 0EE928 001EE828 00000000 */   nop
/* 0EE92C 001EE82C 03008012 */  beqz        $20, .L001EE83C
/* 0EE930 001EE830 00000000 */   nop
/* 0EE934 001EE834 12000010 */  b           .L001EE880
/* 0EE938 001EE838 00000000 */   nop
.L001EE83C:
/* 0EE93C 001EE83C 9000A387 */  lh          $3, 0x90($29)
/* 0EE940 001EE840 B894828F */  lw          $2, -0x6B48($28)
/* 0EE944 001EE844 120043A4 */  sh          $3, 0x12($2)
/* 0EE948 001EE848 0D000010 */  b           .L001EE880
/* 0EE94C 001EE84C 00000000 */   nop
.L001EE850:
/* 0EE950 001EE850 BC94848F */  lw          $4, -0x6B44($28)
/* 0EE954 001EE854 9000A527 */  addiu       $5, $29, 0x90
/* 0EE958 001EE858 F8000624 */  addiu       $6, $0, 0xF8
/* 0EE95C 001EE85C EC0C040C */  jal         memcpy
/* 0EE960 001EE860 00000000 */   nop
/* 0EE964 001EE864 06000010 */  b           .L001EE880
/* 0EE968 001EE868 00000000 */   nop
.L001EE86C:
/* 0EE96C 001EE86C C094848F */  lw          $4, -0x6B40($28)
/* 0EE970 001EE870 9000A527 */  addiu       $5, $29, 0x90
/* 0EE974 001EE874 20000624 */  addiu       $6, $0, 0x20
/* 0EE978 001EE878 EC0C040C */  jal         memcpy
/* 0EE97C 001EE87C 00000000 */   nop
.L001EE880:
/* 0EE980 001EE880 8002A387 */  lh          $3, 0x280($29)
/* 0EE984 001EE884 B894828F */  lw          $2, -0x6B48($28)
/* 0EE988 001EE888 100043A4 */  sh          $3, 0x10($2)
/* 0EE98C 001EE88C 02000224 */  addiu       $2, $0, 0x2
/* 0EE990 001EE890 13006212 */  beq         $19, $2, .L001EE8E0
/* 0EE994 001EE894 00000000 */   nop
/* 0EE998 001EE898 01000224 */  addiu       $2, $0, 0x1
/* 0EE99C 001EE89C 09006212 */  beq         $19, $2, .L001EE8C4
/* 0EE9A0 001EE8A0 00000000 */   nop
/* 0EE9A4 001EE8A4 03006012 */  beqz        $19, .L001EE8B4
/* 0EE9A8 001EE8A8 00000000 */   nop
/* 0EE9AC 001EE8AC 11000010 */  b           .L001EE8F4
/* 0EE9B0 001EE8B0 00000000 */   nop
.L001EE8B4:
/* 0EE9B4 001EE8B4 8801A28F */  lw          $2, 0x188($29)
/* 0EE9B8 001EE8B8 040042AE */  sw          $2, 0x4($18)
/* 0EE9BC 001EE8BC 0D000010 */  b           .L001EE8F4
/* 0EE9C0 001EE8C0 00000000 */   nop
.L001EE8C4:
/* 0EE9C4 001EE8C4 04004426 */  addiu       $4, $18, 0x4
/* 0EE9C8 001EE8C8 8801A527 */  addiu       $5, $29, 0x188
/* 0EE9CC 001EE8CC F8000624 */  addiu       $6, $0, 0xF8
/* 0EE9D0 001EE8D0 EC0C040C */  jal         memcpy
/* 0EE9D4 001EE8D4 00000000 */   nop
/* 0EE9D8 001EE8D8 06000010 */  b           .L001EE8F4
/* 0EE9DC 001EE8DC 00000000 */   nop
.L001EE8E0:
/* 0EE9E0 001EE8E0 04004426 */  addiu       $4, $18, 0x4
/* 0EE9E4 001EE8E4 8801A527 */  addiu       $5, $29, 0x188
/* 0EE9E8 001EE8E8 20000624 */  addiu       $6, $0, 0x20
/* 0EE9EC 001EE8EC EC0C040C */  jal         memcpy
/* 0EE9F0 001EE8F0 00000000 */   nop
.L001EE8F4:
/* 0EE9F4 001EE8F4 0000E286 */  lh          $2, 0x0($23)
/* 0EE9F8 001EE8F8 000042A6 */  sh          $2, 0x0($18)
/* 0EE9FC 001EE8FC B894828F */  lw          $2, -0x6B48($28)
/* 0EEA00 001EE900 000056AC */  sw          $22, 0x0($2)
/* 0EEA04 001EE904 9094828F */  lw          $2, -0x6B70($28)
/* 0EEA08 001EE908 21105500 */  addu        $2, $2, $21
/* 0EEA0C 001EE90C 000051AC */  sw          $17, 0x0($2)
/* 0EEA10 001EE910 B894838F */  lw          $3, -0x6B48($28)
/* 0EEA14 001EE914 10006284 */  lh          $2, 0x10($3)
/* 0EEA18 001EE918 51004128 */  slti        $1, $2, 0x51
/* 0EEA1C 001EE91C 08002010 */  beqz        $1, .L001EE940
/* 0EEA20 001EE920 00000000 */   nop
/* 0EEA24 001EE924 F49B070C */  jal         InitAllHaveData__Fv
/* 0EEA28 001EE928 00000000 */   nop
/* 0EEA2C 001EE92C FFFF0224 */  addiu       $2, $0, -0x1
/* 0EEA30 001EE930 D901013C */  lui         $1, %hi(ShopMenu + 0x164)
/* 0EEA34 001EE934 340222AC */  sw          $2, %lo(ShopMenu + 0x164)($1)
/* 0EEA38 001EE938 06000010 */  b           .L001EE954
/* 0EEA3C 001EE93C 00000000 */   nop
.L001EE940:
/* 0EEA40 001EE940 080070AC */  sw          $16, 0x8($3)
/* 0EEA44 001EE944 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0EEA48 001EE948 DC0034AC */  sw          $20, %lo(ShopMenu + 0xC)($1)
/* 0EEA4C 001EE94C B8BA080C */  jal         PersonalBoardLimmitCheck__Fv
/* 0EEA50 001EE950 00000000 */   nop
.L001EE954:
/* 0EEA54 001EE954 01000424 */  addiu       $4, $0, 0x1
/* 0EEA58 001EE958 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EEA5C 001EE95C 00000000 */   nop
/* 0EEA60 001EE960 EE000010 */  b           .L001EED1C
/* 0EEA64 001EE964 00000000 */   nop
.L001EE968:
/* 0EEA68 001EE968 CC01023C */  lui         $2, %hi(GamePad)
/* 0EEA6C 001EE96C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EEA70 001EE970 10000524 */  addiu       $5, $0, 0x10
/* 0EEA74 001EE974 1CAE040C */  jal         Down__8CGamePadFi
/* 0EEA78 001EE978 00000000 */   nop
/* 0EEA7C 001EE97C E7004010 */  beqz        $2, .L001EED1C
/* 0EEA80 001EE980 00000000 */   nop
/* 0EEA84 001EE984 01000424 */  addiu       $4, $0, 0x1
/* 0EEA88 001EE988 D901013C */  lui         $1, %hi(ShopMenu + 0x6)
/* 0EEA8C 001EE98C D60024A4 */  sh          $4, %lo(ShopMenu + 0x6)($1)
/* 0EEA90 001EE990 B894828F */  lw          $2, -0x6B48($28)
/* 0EEA94 001EE994 10004284 */  lh          $2, 0x10($2)
/* 0EEA98 001EE998 51004228 */  slti        $2, $2, 0x51
/* 0EEA9C 001EE99C 06004014 */  bnez        $2, .L001EE9B8
/* 0EEAA0 001EE9A0 00000000 */   nop
/* 0EEAA4 001EE9A4 02000424 */  addiu       $4, $0, 0x2
/* 0EEAA8 001EE9A8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EEAAC 001EE9AC 00000000 */   nop
/* 0EEAB0 001EE9B0 E3000010 */  b           .L001EED40
/* 0EEAB4 001EE9B4 00000000 */   nop
.L001EE9B8:
/* 0EEAB8 001EE9B8 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EEABC 001EE9BC E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0EEAC0 001EE9C0 80180500 */  sll         $3, $5, 2
/* 0EEAC4 001EE9C4 9094828F */  lw          $2, -0x6B70($28)
/* 0EEAC8 001EE9C8 21104300 */  addu        $2, $2, $3
/* 0EEACC 001EE9CC 0000428C */  lw          $2, 0x0($2)
/* 0EEAD0 001EE9D0 CF004414 */  bne         $2, $4, .L001EED10
/* 0EEAD4 001EE9D4 00000000 */   nop
/* 0EEAD8 001EE9D8 8494828F */  lw          $2, -0x6B7C($28)
/* 0EEADC 001EE9DC 46434694 */  lhu         $6, 0x4346($2)
/* 0EEAE0 001EE9E0 80110500 */  sll         $2, $5, 6
/* 0EEAE4 001EE9E4 23104500 */  subu        $2, $2, $5
/* 0EEAE8 001EE9E8 80180200 */  sll         $3, $2, 2
/* 0EEAEC 001EE9EC A094828F */  lw          $2, -0x6B60($28)
/* 0EEAF0 001EE9F0 21104300 */  addu        $2, $2, $3
/* 0EEAF4 001EE9F4 00005384 */  lh          $19, 0x0($2)
/* 0EEAF8 001EE9F8 28266072 */  paddub      $4, $19, $0
/* 0EEAFC 001EE9FC 282E0070 */  paddub      $5, $0, $0
/* 0EEB00 001EEA00 B4AC070C */  jal         CalItemMoney__Fii
/* 0EEB04 001EEA04 00000000 */   nop
/* 0EEB08 001EEA08 01001024 */  addiu       $16, $0, 0x1
/* 0EEB0C 001EEA0C 5100612A */  slti        $1, $19, 0x51
/* 0EEB10 001EEA10 02002010 */  beqz        $1, .L001EEA1C
/* 0EEB14 001EEA14 00000000 */   nop
/* 0EEB18 001EEA18 28860070 */  paddub      $16, $0, $0
.L001EEA1C:
/* 0EEB1C 001EEA1C 2A08C200 */  slt         $1, $6, $2
/* 0EEB20 001EEA20 06002010 */  beqz        $1, .L001EEA3C
/* 0EEB24 001EEA24 00000000 */   nop
/* 0EEB28 001EEA28 28860070 */  paddub      $16, $0, $0
/* 0EEB2C 001EEA2C 15000424 */  addiu       $4, $0, 0x15
/* 0EEB30 001EEA30 01000524 */  addiu       $5, $0, 0x1
/* 0EEB34 001EEA34 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EEB38 001EEA38 00000000 */   nop
.L001EEA3C:
/* 0EEB3C 001EEA3C 28266072 */  paddub      $4, $19, $0
/* 0EEB40 001EEA40 88C7080C */  jal         WhatIsKindofItem__Fi
/* 0EEB44 001EEA44 00000000 */   nop
/* 0EEB48 001EEA48 8C02A2AF */  sw          $2, 0x28C($29)
/* 0EEB4C 001EEA4C 28266072 */  paddub      $4, $19, $0
/* 0EEB50 001EEA50 8C02A527 */  addiu       $5, $29, 0x28C
/* 0EEB54 001EEA54 70C5080C */  jal         GetBoardSpace__FiPi
/* 0EEB58 001EEA58 00000000 */   nop
/* 0EEB5C 001EEA5C 06004104 */  bgez        $2, .L001EEA78
/* 0EEB60 001EEA60 00000000 */   nop
/* 0EEB64 001EEA64 28860070 */  paddub      $16, $0, $0
/* 0EEB68 001EEA68 0B000424 */  addiu       $4, $0, 0xB
/* 0EEB6C 001EEA6C 01000524 */  addiu       $5, $0, 0x1
/* 0EEB70 001EEA70 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EEB74 001EEA74 00000000 */   nop
.L001EEA78:
/* 0EEB78 001EEA78 28BE0070 */  paddub      $23, $0, $0
/* 0EEB7C 001EEA7C 288E0070 */  paddub      $17, $0, $0
/* 0EEB80 001EEA80 28960070 */  paddub      $18, $0, $0
/* 0EEB84 001EEA84 28266072 */  paddub      $4, $19, $0
/* 0EEB88 001EEA88 A4C7080C */  jal         WhoIsWeaponEquip__Fi
/* 0EEB8C 001EEA8C 00000000 */   nop
/* 0EEB90 001EEA90 28B64070 */  paddub      $22, $2, $0
/* 0EEB94 001EEA94 8C02A38F */  lw          $3, 0x28C($29)
/* 0EEB98 001EEA98 02000224 */  addiu       $2, $0, 0x2
/* 0EEB9C 001EEA9C 42006210 */  beq         $3, $2, .L001EEBA8
/* 0EEBA0 001EEAA0 00000000 */   nop
/* 0EEBA4 001EEAA4 01000224 */  addiu       $2, $0, 0x1
/* 0EEBA8 001EEAA8 27006210 */  beq         $3, $2, .L001EEB48
/* 0EEBAC 001EEAAC 00000000 */   nop
/* 0EEBB0 001EEAB0 03006010 */  beqz        $3, .L001EEAC0
/* 0EEBB4 001EEAB4 00000000 */   nop
/* 0EEBB8 001EEAB8 4D000010 */  b           .L001EEBF0
/* 0EEBBC 001EEABC 00000000 */   nop
.L001EEAC0:
/* 0EEBC0 001EEAC0 8494828F */  lw          $2, -0x6B7C($28)
/* 0EEBC4 001EEAC4 60434524 */  addiu       $5, $2, 0x4360
/* 0EEBC8 001EEAC8 60435180 */  lb          $17, 0x4360($2)
/* 0EEBCC 001EEACC 28260070 */  paddub      $4, $0, $0
/* 0EEBD0 001EEAD0 0A000010 */  b           .L001EEAFC
/* 0EEBD4 001EEAD4 00000000 */   nop
.L001EEAD8:
/* 0EEBD8 001EEAD8 40100400 */  sll         $2, $4, 1
/* 0EEBDC 001EEADC 21184500 */  addu        $3, $2, $5
/* 0EEBE0 001EEAE0 02006284 */  lh          $2, 0x2($3)
/* 0EEBE4 001EEAE4 84004228 */  slti        $2, $2, 0x84
/* 0EEBE8 001EEAE8 03004014 */  bnez        $2, .L001EEAF8
/* 0EEBEC 001EEAEC 00000000 */   nop
/* 0EEBF0 001EEAF0 08006284 */  lh          $2, 0x8($3)
/* 0EEBF4 001EEAF4 21904202 */  addu        $18, $18, $2
.L001EEAF8:
/* 0EEBF8 001EEAF8 01008424 */  addiu       $4, $4, 0x1
.L001EEAFC:
/* 0EEBFC 001EEAFC 03008228 */  slti        $2, $4, 0x3
/* 0EEC00 001EEB00 F5FF4014 */  bnez        $2, .L001EEAD8
/* 0EEC04 001EEB04 00000000 */   nop
/* 0EEC08 001EEB08 281E0070 */  paddub      $3, $0, $0
/* 0EEC0C 001EEB0C 09000010 */  b           .L001EEB34
/* 0EEC10 001EEB10 00000000 */   nop
.L001EEB14:
/* 0EEC14 001EEB14 40100300 */  sll         $2, $3, 1
/* 0EEC18 001EEB18 21104500 */  addu        $2, $2, $5
/* 0EEC1C 001EEB1C 0E004284 */  lh          $2, 0xE($2)
/* 0EEC20 001EEB20 84004228 */  slti        $2, $2, 0x84
/* 0EEC24 001EEB24 02004014 */  bnez        $2, .L001EEB30
/* 0EEC28 001EEB28 00000000 */   nop
/* 0EEC2C 001EEB2C 01005226 */  addiu       $18, $18, 0x1
.L001EEB30:
/* 0EEC30 001EEB30 01006324 */  addiu       $3, $3, 0x1
.L001EEB34:
/* 0EEC34 001EEB34 2A107100 */  slt         $2, $3, $17
/* 0EEC38 001EEB38 F6FF4014 */  bnez        $2, .L001EEB14
/* 0EEC3C 001EEB3C 00000000 */   nop
/* 0EEC40 001EEB40 2B000010 */  b           .L001EEBF0
/* 0EEC44 001EEB44 00000000 */   nop
.L001EEB48:
/* 0EEC48 001EEB48 0A001124 */  addiu       $17, $0, 0xA
/* 0EEC4C 001EEB4C 8494838F */  lw          $3, -0x6B7C($28)
/* 0EEC50 001EEB50 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0EEC54 001EEB54 1810C202 */  mult        $2, $22, $2
/* 0EEC58 001EEB58 21106200 */  addu        $2, $3, $2
/* 0EEC5C 001EEB5C 0C454424 */  addiu       $4, $2, 0x450C
/* 0EEC60 001EEB60 281E0070 */  paddub      $3, $0, $0
/* 0EEC64 001EEB64 0B000010 */  b           .L001EEB94
/* 0EEC68 001EEB68 00000000 */   nop
.L001EEB6C:
/* 0EEC6C 001EEB6C 40110300 */  sll         $2, $3, 5
/* 0EEC70 001EEB70 23104300 */  subu        $2, $2, $3
/* 0EEC74 001EEB74 C0100200 */  sll         $2, $2, 3
/* 0EEC78 001EEB78 21108200 */  addu        $2, $4, $2
/* 0EEC7C 001EEB7C 00004284 */  lh          $2, 0x0($2)
/* 0EEC80 001EEB80 01014228 */  slti        $2, $2, 0x101
/* 0EEC84 001EEB84 02004014 */  bnez        $2, .L001EEB90
/* 0EEC88 001EEB88 00000000 */   nop
/* 0EEC8C 001EEB8C 01005226 */  addiu       $18, $18, 0x1
.L001EEB90:
/* 0EEC90 001EEB90 01006324 */  addiu       $3, $3, 0x1
.L001EEB94:
/* 0EEC94 001EEB94 0A006228 */  slti        $2, $3, 0xA
/* 0EEC98 001EEB98 F4FF4014 */  bnez        $2, .L001EEB6C
/* 0EEC9C 001EEB9C 00000000 */   nop
/* 0EECA0 001EEBA0 13000010 */  b           .L001EEBF0
/* 0EECA4 001EEBA4 00000000 */   nop
.L001EEBA8:
/* 0EECA8 001EEBA8 28001124 */  addiu       $17, $0, 0x28
/* 0EECAC 001EEBAC 8494828F */  lw          $2, -0x6B7C($28)
/* 0EECB0 001EEBB0 04054424 */  addiu       $4, $2, 0x504
/* 0EECB4 001EEBB4 F87F8424 */  addiu       $4, $4, 0x7FF8
/* 0EECB8 001EEBB8 281E0070 */  paddub      $3, $0, $0
/* 0EECBC 001EEBBC 09000010 */  b           .L001EEBE4
/* 0EECC0 001EEBC0 00000000 */   nop
.L001EEBC4:
/* 0EECC4 001EEBC4 40110300 */  sll         $2, $3, 5
/* 0EECC8 001EEBC8 21108200 */  addu        $2, $4, $2
/* 0EECCC 001EEBCC 00004284 */  lh          $2, 0x0($2)
/* 0EECD0 001EEBD0 51004228 */  slti        $2, $2, 0x51
/* 0EECD4 001EEBD4 02004014 */  bnez        $2, .L001EEBE0
/* 0EECD8 001EEBD8 00000000 */   nop
/* 0EECDC 001EEBDC 01005226 */  addiu       $18, $18, 0x1
.L001EEBE0:
/* 0EECE0 001EEBE0 01006324 */  addiu       $3, $3, 0x1
.L001EEBE4:
/* 0EECE4 001EEBE4 28006228 */  slti        $2, $3, 0x28
/* 0EECE8 001EEBE8 F6FF4014 */  bnez        $2, .L001EEBC4
/* 0EECEC 001EEBEC 00000000 */   nop
.L001EEBF0:
/* 0EECF0 001EEBF0 D901013C */  lui         $1, %hi(ShopDataMove + 0x10)
/* 0EECF4 001EEBF4 90022284 */  lh          $2, %lo(ShopDataMove + 0x10)($1)
/* 0EECF8 001EEBF8 02004018 */  blez        $2, .L001EEC04
/* 0EECFC 001EEBFC 00000000 */   nop
/* 0EED00 001EEC00 01005226 */  addiu       $18, $18, 0x1
.L001EEC04:
/* 0EED04 001EEC04 289E0070 */  paddub      $19, $0, $0
/* 0EED08 001EEC08 24000010 */  b           .L001EEC9C
/* 0EED0C 001EEC0C 00000000 */   nop
.L001EEC10:
/* 0EED10 001EEC10 8C02B48F */  lw          $20, 0x28C($29)
/* 0EED14 001EEC14 20008006 */  bltz        $20, .L001EEC98
/* 0EED18 001EEC18 00000000 */   nop
/* 0EED1C 001EEC1C 80111300 */  sll         $2, $19, 6
/* 0EED20 001EEC20 23105300 */  subu        $2, $2, $19
/* 0EED24 001EEC24 80A80200 */  sll         $21, $2, 2
/* 0EED28 001EEC28 A094828F */  lw          $2, -0x6B60($28)
/* 0EED2C 001EEC2C 21105500 */  addu        $2, $2, $21
/* 0EED30 001EEC30 00004484 */  lh          $4, 0x0($2)
/* 0EED34 001EEC34 88C7080C */  jal         WhatIsKindofItem__Fi
/* 0EED38 001EEC38 00000000 */   nop
/* 0EED3C 001EEC3C 16008216 */  bne         $20, $2, .L001EEC98
/* 0EED40 001EEC40 00000000 */   nop
/* 0EED44 001EEC44 80181300 */  sll         $3, $19, 2
/* 0EED48 001EEC48 9094828F */  lw          $2, -0x6B70($28)
/* 0EED4C 001EEC4C 21104300 */  addu        $2, $2, $3
/* 0EED50 001EEC50 0000438C */  lw          $3, 0x0($2)
/* 0EED54 001EEC54 02000224 */  addiu       $2, $0, 0x2
/* 0EED58 001EEC58 0F006214 */  bne         $3, $2, .L001EEC98
/* 0EED5C 001EEC5C 00000000 */   nop
/* 0EED60 001EEC60 01000224 */  addiu       $2, $0, 0x1
/* 0EED64 001EEC64 0B008216 */  bne         $20, $2, .L001EEC94
/* 0EED68 001EEC68 00000000 */   nop
/* 0EED6C 001EEC6C A094828F */  lw          $2, -0x6B60($28)
/* 0EED70 001EEC70 21105500 */  addu        $2, $2, $21
/* 0EED74 001EEC74 00004484 */  lh          $4, 0x0($2)
/* 0EED78 001EEC78 A4C7080C */  jal         WhoIsWeaponEquip__Fi
/* 0EED7C 001EEC7C 00000000 */   nop
/* 0EED80 001EEC80 0500C216 */  bne         $22, $2, .L001EEC98
/* 0EED84 001EEC84 00000000 */   nop
/* 0EED88 001EEC88 01005226 */  addiu       $18, $18, 0x1
/* 0EED8C 001EEC8C 02000010 */  b           .L001EEC98
/* 0EED90 001EEC90 00000000 */   nop
.L001EEC94:
/* 0EED94 001EEC94 01005226 */  addiu       $18, $18, 0x1
.L001EEC98:
/* 0EED98 001EEC98 01007326 */  addiu       $19, $19, 0x1
.L001EEC9C:
/* 0EED9C 001EEC9C 1E00622A */  slti        $2, $19, 0x1E
/* 0EEDA0 001EECA0 DBFF4014 */  bnez        $2, .L001EEC10
/* 0EEDA4 001EECA4 00000000 */   nop
/* 0EEDA8 001EECA8 2A105102 */  slt         $2, $18, $17
/* 0EEDAC 001EECAC 02004014 */  bnez        $2, .L001EECB8
/* 0EEDB0 001EECB0 00000000 */   nop
/* 0EEDB4 001EECB4 01001724 */  addiu       $23, $0, 0x1
.L001EECB8:
/* 0EEDB8 001EECB8 0600E012 */  beqz        $23, .L001EECD4
/* 0EEDBC 001EECBC 00000000 */   nop
/* 0EEDC0 001EECC0 28860070 */  paddub      $16, $0, $0
/* 0EEDC4 001EECC4 0B000424 */  addiu       $4, $0, 0xB
/* 0EEDC8 001EECC8 01000524 */  addiu       $5, $0, 0x1
/* 0EEDCC 001EECCC 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EEDD0 001EECD0 00000000 */   nop
.L001EECD4:
/* 0EEDD4 001EECD4 09000012 */  beqz        $16, .L001EECFC
/* 0EEDD8 001EECD8 00000000 */   nop
/* 0EEDDC 001EECDC 0D000224 */  addiu       $2, $0, 0xD
/* 0EEDE0 001EECE0 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EEDE4 001EECE4 500222A4 */  sh          $2, %lo(ShopMenu + 0x180)($1)
/* 0EEDE8 001EECE8 01000424 */  addiu       $4, $0, 0x1
/* 0EEDEC 001EECEC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EEDF0 001EECF0 00000000 */   nop
/* 0EEDF4 001EECF4 09000010 */  b           .L001EED1C
/* 0EEDF8 001EECF8 00000000 */   nop
.L001EECFC:
/* 0EEDFC 001EECFC 02000424 */  addiu       $4, $0, 0x2
/* 0EEE00 001EED00 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EEE04 001EED04 00000000 */   nop
/* 0EEE08 001EED08 04000010 */  b           .L001EED1C
/* 0EEE0C 001EED0C 00000000 */   nop
.L001EED10:
/* 0EEE10 001EED10 02000424 */  addiu       $4, $0, 0x2
/* 0EEE14 001EED14 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EEE18 001EED18 00000000 */   nop
.L001EED1C:
/* 0EEE1C 001EED1C 6CBA080C */  jal         BoardModeChangeKey__Fv
/* 0EEE20 001EED20 00000000 */   nop
/* 0EEE24 001EED24 06004010 */  beqz        $2, .L001EED40
/* 0EEE28 001EED28 00000000 */   nop
/* 0EEE2C 001EED2C B8BA080C */  jal         PersonalBoardLimmitCheck__Fv
/* 0EEE30 001EED30 00000000 */   nop
/* 0EEE34 001EED34 28260070 */  paddub      $4, $0, $0
/* 0EEE38 001EED38 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EEE3C 001EED3C 00000000 */   nop
.L001EED40:
/* 0EEE40 001EED40 8000BF7B */  lq          $31, 0x80($29)
/* 0EEE44 001EED44 7000B77B */  lq          $23, 0x70($29)
/* 0EEE48 001EED48 6000B67B */  lq          $22, 0x60($29)
/* 0EEE4C 001EED4C 5000B57B */  lq          $21, 0x50($29)
/* 0EEE50 001EED50 4000B47B */  lq          $20, 0x40($29)
/* 0EEE54 001EED54 3000B37B */  lq          $19, 0x30($29)
/* 0EEE58 001EED58 2000B27B */  lq          $18, 0x20($29)
/* 0EEE5C 001EED5C 1000B17B */  lq          $17, 0x10($29)
/* 0EEE60 001EED60 0000B07B */  lq          $16, 0x0($29)
/* 0EEE64 001EED64 9002BD27 */  addiu       $29, $29, 0x290
/* 0EEE68 001EED68 0800E003 */  jr          $31
/* 0EEE6C 001EED6C 00000000 */   nop
