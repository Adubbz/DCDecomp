.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ItemShopSelectKey2__Fv
/* EE380 001EE280 70FDBD27 */  addiu      $sp, $sp, -0x290
/* EE384 001EE284 8000BF7F */  sq         $31, 0x80($sp)
/* EE388 001EE288 7000B77F */  sq         $23, 0x70($sp)
/* EE38C 001EE28C 6000B67F */  sq         $22, 0x60($sp)
/* EE390 001EE290 5000B57F */  sq         $21, 0x50($sp)
/* EE394 001EE294 4000B47F */  sq         $20, 0x40($sp)
/* EE398 001EE298 3000B37F */  sq         $19, 0x30($sp)
/* EE39C 001EE29C 2000B27F */  sq         $18, 0x20($sp)
/* EE3A0 001EE2A0 1000B17F */  sq         $17, 0x10($sp)
/* EE3A4 001EE2A4 0000B07F */  sq         $16, 0x0($sp)
/* EE3A8 001EE2A8 CC01023C */  lui        $2, %hi(GamePad)
/* EE3AC 001EE2AC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EE3B0 001EE2B0 00100524 */  addiu      $5, $0, 0x1000
/* EE3B4 001EE2B4 1CAE040C */  jal        Down__8CGamePadFi
/* EE3B8 001EE2B8 00000000 */   nop
/* EE3BC 001EE2BC 1D004010 */  beqz       $2, .L001EE334
/* EE3C0 001EE2C0 00000000 */   nop
/* EE3C4 001EE2C4 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE3C8 001EE2C8 E400228C */  lw         $2, (0x1D900E4 & 0xFFFF)($at)
/* EE3CC 001EE2CC FBFF4224 */  addiu      $2, $2, -0x5
/* EE3D0 001EE2D0 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE3D4 001EE2D4 E40022AC */  sw         $2, (0x1D900E4 & 0xFFFF)($at)
/* EE3D8 001EE2D8 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE3DC 001EE2DC E400228C */  lw         $2, (0x1D900E4 & 0xFFFF)($at)
/* EE3E0 001EE2E0 04004104 */  bgez       $2, .L001EE2F4
/* EE3E4 001EE2E4 00000000 */   nop
/* EE3E8 001EE2E8 05004224 */  addiu      $2, $2, 0x5
/* EE3EC 001EE2EC D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE3F0 001EE2F0 E40022AC */  sw         $2, (0x1D900E4 & 0xFFFF)($at)
.L001EE2F4:
/* EE3F4 001EE2F4 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE3F8 001EE2F8 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EE3FC 001EE2FC 05000224 */  addiu      $2, $0, 0x5
/* EE400 001EE300 1A006200 */  div        $0, $3, $2
/* EE404 001EE304 02004014 */  bnez       $2, .L001EE310
/* EE408 001EE308 00000000 */   nop
/* EE40C 001EE30C CD010000 */  break      0, 7
.L001EE310:
/* EE410 001EE310 12180000 */  mflo       $3
/* EE414 001EE314 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EE418 001EE318 46022290 */  lbu        $2, (0x1D90246 & 0xFFFF)($at)
/* EE41C 001EE31C 2A086200 */  slt        $at, $3, $2
/* EE420 001EE320 04002010 */  beqz       $at, .L001EE334
/* EE424 001EE324 00000000 */   nop
/* EE428 001EE328 FFFF4224 */  addiu      $2, $2, -0x1
/* EE42C 001EE32C D901013C */  lui        $at, (0x1D90246 >> 16)
/* EE430 001EE330 460222A0 */  sb         $2, (0x1D90246 & 0xFFFF)($at)
.L001EE334:
/* EE434 001EE334 CC01023C */  lui        $2, %hi(GamePad)
/* EE438 001EE338 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EE43C 001EE33C 00400524 */  addiu      $5, $0, 0x4000
/* EE440 001EE340 1CAE040C */  jal        Down__8CGamePadFi
/* EE444 001EE344 00000000 */   nop
/* EE448 001EE348 21004010 */  beqz       $2, .L001EE3D0
/* EE44C 001EE34C 00000000 */   nop
/* EE450 001EE350 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE454 001EE354 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EE458 001EE358 19006228 */  slti       $2, $3, 0x19
/* EE45C 001EE35C 06004014 */  bnez       $2, .L001EE378
/* EE460 001EE360 00000000 */   nop
/* EE464 001EE364 02000224 */  addiu      $2, $0, 0x2
/* EE468 001EE368 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* EE46C 001EE36C D20022A4 */  sh         $2, (0x1D900D2 & 0xFFFF)($at)
/* EE470 001EE370 04000010 */  b          .L001EE384
/* EE474 001EE374 00000000 */   nop
.L001EE378:
/* EE478 001EE378 05006224 */  addiu      $2, $3, 0x5
/* EE47C 001EE37C D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE480 001EE380 E40022AC */  sw         $2, (0x1D900E4 & 0xFFFF)($at)
.L001EE384:
/* EE484 001EE384 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EE488 001EE388 46022290 */  lbu        $2, (0x1D90246 & 0xFFFF)($at)
/* EE48C 001EE38C 03004424 */  addiu      $4, $2, 0x3
/* EE490 001EE390 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE494 001EE394 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EE498 001EE398 05000224 */  addiu      $2, $0, 0x5
/* EE49C 001EE39C 1A006200 */  div        $0, $3, $2
/* EE4A0 001EE3A0 02004014 */  bnez       $2, .L001EE3AC
/* EE4A4 001EE3A4 00000000 */   nop
/* EE4A8 001EE3A8 CD010000 */  break      0, 7
.L001EE3AC:
/* EE4AC 001EE3AC 12100000 */  mflo       $2
/* EE4B0 001EE3B0 2A088200 */  slt        $at, $4, $2
/* EE4B4 001EE3B4 06002010 */  beqz       $at, .L001EE3D0
/* EE4B8 001EE3B8 00000000 */   nop
/* EE4BC 001EE3BC D901013C */  lui        $at, (0x1D90246 >> 16)
/* EE4C0 001EE3C0 46022290 */  lbu        $2, (0x1D90246 & 0xFFFF)($at)
/* EE4C4 001EE3C4 01004224 */  addiu      $2, $2, 0x1
/* EE4C8 001EE3C8 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EE4CC 001EE3CC 460222A0 */  sb         $2, (0x1D90246 & 0xFFFF)($at)
.L001EE3D0:
/* EE4D0 001EE3D0 CC01023C */  lui        $2, %hi(GamePad)
/* EE4D4 001EE3D4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EE4D8 001EE3D8 00800534 */  ori        $5, $0, 0x8000
/* EE4DC 001EE3DC 1CAE040C */  jal        Down__8CGamePadFi
/* EE4E0 001EE3E0 00000000 */   nop
/* EE4E4 001EE3E4 0D004010 */  beqz       $2, .L001EE41C
/* EE4E8 001EE3E8 00000000 */   nop
/* EE4EC 001EE3EC D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE4F0 001EE3F0 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EE4F4 001EE3F4 05000224 */  addiu      $2, $0, 0x5
/* EE4F8 001EE3F8 1A006200 */  div        $0, $3, $2
/* EE4FC 001EE3FC 00000000 */  nop
/* EE500 001EE400 00000000 */  nop
/* EE504 001EE404 10100000 */  mfhi       $2
/* EE508 001EE408 04004010 */  beqz       $2, .L001EE41C
/* EE50C 001EE40C 00000000 */   nop
/* EE510 001EE410 FFFF6224 */  addiu      $2, $3, -0x1
/* EE514 001EE414 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE518 001EE418 E40022AC */  sw         $2, (0x1D900E4 & 0xFFFF)($at)
.L001EE41C:
/* EE51C 001EE41C CC01023C */  lui        $2, %hi(GamePad)
/* EE520 001EE420 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EE524 001EE424 00200524 */  addiu      $5, $0, 0x2000
/* EE528 001EE428 1CAE040C */  jal        Down__8CGamePadFi
/* EE52C 001EE42C 00000000 */   nop
/* EE530 001EE430 24004010 */  beqz       $2, .L001EE4C4
/* EE534 001EE434 00000000 */   nop
/* EE538 001EE438 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE53C 001EE43C E400268C */  lw         $6, (0x1D900E4 & 0xFFFF)($at)
/* EE540 001EE440 05000524 */  addiu      $5, $0, 0x5
/* EE544 001EE444 1A00C500 */  div        $0, $6, $5
/* EE548 001EE448 00000000 */  nop
/* EE54C 001EE44C 00000000 */  nop
/* EE550 001EE450 10200000 */  mfhi       $4
/* EE554 001EE454 04000324 */  addiu      $3, $0, 0x4
/* EE558 001EE458 17008314 */  bne        $4, $3, .L001EE4B8
/* EE55C 001EE45C 00000000 */   nop
/* EE560 001EE460 01000324 */  addiu      $3, $0, 0x1
/* EE564 001EE464 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* EE568 001EE468 D20023A4 */  sh         $3, (0x1D900D2 & 0xFFFF)($at)
/* EE56C 001EE46C D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE570 001EE470 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EE574 001EE474 1A006500 */  div        $0, $3, $5
/* EE578 001EE478 0200A014 */  bnez       $5, .L001EE484
/* EE57C 001EE47C 00000000 */   nop
/* EE580 001EE480 CD010000 */  break      0, 7
.L001EE484:
/* EE584 001EE484 12200000 */  mflo       $4
/* EE588 001EE488 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EE58C 001EE48C 46022390 */  lbu        $3, (0x1D90246 & 0xFFFF)($at)
/* EE590 001EE490 23208300 */  subu       $4, $4, $3
/* EE594 001EE494 D901013C */  lui        $at, (0x1D900F0 >> 16)
/* EE598 001EE498 F000238C */  lw         $3, (0x1D900F0 & 0xFFFF)($at)
/* EE59C 001EE49C 21206400 */  addu       $4, $3, $4
/* EE5A0 001EE4A0 80180400 */  sll        $3, $4, 2
/* EE5A4 001EE4A4 21186400 */  addu       $3, $3, $4
/* EE5A8 001EE4A8 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE5AC 001EE4AC E40023AC */  sw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EE5B0 001EE4B0 04000010 */  b          .L001EE4C4
/* EE5B4 001EE4B4 00000000 */   nop
.L001EE4B8:
/* EE5B8 001EE4B8 0100C324 */  addiu      $3, $6, 0x1
/* EE5BC 001EE4BC D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE5C0 001EE4C0 E40023AC */  sw         $3, (0x1D900E4 & 0xFFFF)($at)
.L001EE4C4:
/* EE5C4 001EE4C4 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* EE5C8 001EE4C8 D2002384 */  lh         $3, (0x1D900D2 & 0xFFFF)($at)
/* EE5CC 001EE4CC 20006014 */  bnez       $3, .L001EE550
/* EE5D0 001EE4D0 00000000 */   nop
/* EE5D4 001EE4D4 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE5D8 001EE4D8 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EE5DC 001EE4DC 1F006128 */  slti       $at, $3, 0x1F
/* EE5E0 001EE4E0 1B002014 */  bnez       $at, .L001EE550
/* EE5E4 001EE4E4 00000000 */   nop
/* EE5E8 001EE4E8 06000010 */  b          .L001EE504
/* EE5EC 001EE4EC 00000000 */   nop
.L001EE4F0:
/* EE5F0 001EE4F0 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE5F4 001EE4F4 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EE5F8 001EE4F8 FBFF6324 */  addiu      $3, $3, -0x5
/* EE5FC 001EE4FC D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE600 001EE500 E40023AC */  sw         $3, (0x1D900E4 & 0xFFFF)($at)
.L001EE504:
/* EE604 001EE504 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE608 001EE508 E400248C */  lw         $4, (0x1D900E4 & 0xFFFF)($at)
/* EE60C 001EE50C 1F008128 */  slti       $at, $4, 0x1F
/* EE610 001EE510 F7FF2010 */  beqz       $at, .L001EE4F0
/* EE614 001EE514 00000000 */   nop
/* EE618 001EE518 05000324 */  addiu      $3, $0, 0x5
/* EE61C 001EE51C 1A008300 */  div        $0, $4, $3
/* EE620 001EE520 02006014 */  bnez       $3, .L001EE52C
/* EE624 001EE524 00000000 */   nop
/* EE628 001EE528 CD010000 */  break      0, 7
.L001EE52C:
/* EE62C 001EE52C 12180000 */  mflo       $3
/* EE630 001EE530 FEFF6324 */  addiu      $3, $3, -0x2
/* EE634 001EE534 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EE638 001EE538 460223A0 */  sb         $3, (0x1D90246 & 0xFFFF)($at)
/* EE63C 001EE53C 02000324 */  addiu      $3, $0, 0x2
/* EE640 001EE540 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* EE644 001EE544 D20023A4 */  sh         $3, (0x1D900D2 & 0xFFFF)($at)
/* EE648 001EE548 FD010010 */  b          .L001EED40
/* EE64C 001EE54C 00000000 */   nop
.L001EE550:
/* EE650 001EE550 CC01023C */  lui        $2, %hi(GamePad)
/* EE654 001EE554 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EE658 001EE558 40000524 */  addiu      $5, $0, 0x40
/* EE65C 001EE55C 1CAE040C */  jal        Down__8CGamePadFi
/* EE660 001EE560 00000000 */   nop
/* EE664 001EE564 00014010 */  beqz       $2, .L001EE968
/* EE668 001EE568 00000000 */   nop
/* EE66C 001EE56C 01000224 */  addiu      $2, $0, 0x1
/* EE670 001EE570 D901013C */  lui        $at, (0x1D900D6 >> 16)
/* EE674 001EE574 D60022A4 */  sh         $2, (0x1D900D6 & 0xFFFF)($at)
/* EE678 001EE578 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EE67C 001EE57C E400308C */  lw         $16, (0x1D900E4 & 0xFFFF)($at)
/* EE680 001EE580 80A81000 */  sll        $21, $16, 2
/* EE684 001EE584 80111000 */  sll        $2, $16, 6
/* EE688 001EE588 23105000 */  subu       $2, $2, $16
/* EE68C 001EE58C 80900200 */  sll        $18, $2, 2
/* EE690 001EE590 A094828F */  lw         $2, -0x6B60($gp)
/* EE694 001EE594 21105200 */  addu       $2, $2, $18
/* EE698 001EE598 00004284 */  lh         $2, 0x0($2)
/* EE69C 001EE59C 51004128 */  slti       $at, $2, 0x51
/* EE6A0 001EE5A0 0B002010 */  beqz       $at, .L001EE5D0
/* EE6A4 001EE5A4 00000000 */   nop
/* EE6A8 001EE5A8 B894828F */  lw         $2, -0x6B48($gp)
/* EE6AC 001EE5AC 10004284 */  lh         $2, 0x10($2)
/* EE6B0 001EE5B0 51004128 */  slti       $at, $2, 0x51
/* EE6B4 001EE5B4 06002010 */  beqz       $at, .L001EE5D0
/* EE6B8 001EE5B8 00000000 */   nop
/* EE6BC 001EE5BC 02000424 */  addiu      $4, $0, 0x2
/* EE6C0 001EE5C0 BCB3080C */  jal        ComMenuSePlay__Fi
/* EE6C4 001EE5C4 00000000 */   nop
/* EE6C8 001EE5C8 DD010010 */  b          .L001EED40
/* EE6CC 001EE5CC 00000000 */   nop
.L001EE5D0:
/* EE6D0 001EE5D0 B894828F */  lw         $2, -0x6B48($gp)
/* EE6D4 001EE5D4 10004484 */  lh         $4, 0x10($2)
/* EE6D8 001EE5D8 109E070C */  jal        IsEnableCharge__Fi
/* EE6DC 001EE5DC 00000000 */   nop
/* EE6E0 001EE5E0 288E4070 */  paddub     $17, $2, $0
/* EE6E4 001EE5E4 1F002012 */  beqz       $17, .L001EE664
/* EE6E8 001EE5E8 00000000 */   nop
/* EE6EC 001EE5EC B894828F */  lw         $2, -0x6B48($gp)
/* EE6F0 001EE5F0 10004484 */  lh         $4, 0x10($2)
/* EE6F4 001EE5F4 84008228 */  slti       $2, $4, 0x84
/* EE6F8 001EE5F8 10004014 */  bnez       $2, .L001EE63C
/* EE6FC 001EE5FC 00000000 */   nop
/* EE700 001EE600 A043070C */  jal        GetItemData__Fi
/* EE704 001EE604 00000000 */   nop
/* EE708 001EE608 0C004010 */  beqz       $2, .L001EE63C
/* EE70C 001EE60C 00000000 */   nop
/* EE710 001EE610 08004284 */  lh         $2, 0x8($2)
/* EE714 001EE614 10004230 */  andi       $2, $2, 0x10
/* EE718 001EE618 02004010 */  beqz       $2, .L001EE624
/* EE71C 001EE61C 00000000 */   nop
/* EE720 001EE620 288E0070 */  paddub     $17, $0, $0
.L001EE624:
/* EE724 001EE624 B894828F */  lw         $2, -0x6B48($gp)
/* EE728 001EE628 10004384 */  lh         $3, 0x10($2)
/* EE72C 001EE62C B9000224 */  addiu      $2, $0, 0xB9
/* EE730 001EE630 02006214 */  bne        $3, $2, .L001EE63C
/* EE734 001EE634 00000000 */   nop
/* EE738 001EE638 288E0070 */  paddub     $17, $0, $0
.L001EE63C:
/* EE73C 001EE63C B894828F */  lw         $2, -0x6B48($gp)
/* EE740 001EE640 10004384 */  lh         $3, 0x10($2)
/* EE744 001EE644 0C010224 */  addiu      $2, $0, 0x10C
/* EE748 001EE648 06006214 */  bne        $3, $2, .L001EE664
/* EE74C 001EE64C 00000000 */   nop
/* EE750 001EE650 E02F080C */  jal        GetMenuHebikiriFlag__Fv
/* EE754 001EE654 00000000 */   nop
/* EE758 001EE658 02004014 */  bnez       $2, .L001EE664
/* EE75C 001EE65C 00000000 */   nop
/* EE760 001EE660 288E0070 */  paddub     $17, $0, $0
.L001EE664:
/* EE764 001EE664 D901013C */  lui        $at, (0x1D90234 >> 16)
/* EE768 001EE668 3402228C */  lw         $2, (0x1D90234 & 0xFFFF)($at)
/* EE76C 001EE66C 0A004004 */  bltz       $2, .L001EE698
/* EE770 001EE670 00000000 */   nop
/* EE774 001EE674 02000424 */  addiu      $4, $0, 0x2
/* EE778 001EE678 BCB3080C */  jal        ComMenuSePlay__Fi
/* EE77C 001EE67C 00000000 */   nop
/* EE780 001EE680 05000424 */  addiu      $4, $0, 0x5
/* EE784 001EE684 01000524 */  addiu      $5, $0, 0x1
/* EE788 001EE688 749C070C */  jal        SetItemShopTalkMode__Fii
/* EE78C 001EE68C 00000000 */   nop
/* EE790 001EE690 AB010010 */  b          .L001EED40
/* EE794 001EE694 00000000 */   nop
.L001EE698:
/* EE798 001EE698 0A002016 */  bnez       $17, .L001EE6C4
/* EE79C 001EE69C 00000000 */   nop
/* EE7A0 001EE6A0 02000424 */  addiu      $4, $0, 0x2
/* EE7A4 001EE6A4 BCB3080C */  jal        ComMenuSePlay__Fi
/* EE7A8 001EE6A8 00000000 */   nop
/* EE7AC 001EE6AC 04000424 */  addiu      $4, $0, 0x4
/* EE7B0 001EE6B0 01000524 */  addiu      $5, $0, 0x1
/* EE7B4 001EE6B4 749C070C */  jal        SetItemShopTalkMode__Fii
/* EE7B8 001EE6B8 00000000 */   nop
/* EE7BC 001EE6BC A0010010 */  b          .L001EED40
/* EE7C0 001EE6C0 00000000 */   nop
.L001EE6C4:
/* EE7C4 001EE6C4 9094828F */  lw         $2, -0x6B70($gp)
/* EE7C8 001EE6C8 21105500 */  addu       $2, $2, $21
/* EE7CC 001EE6CC 0000568C */  lw         $22, 0x0($2)
/* EE7D0 001EE6D0 B894828F */  lw         $2, -0x6B48($gp)
/* EE7D4 001EE6D4 0000518C */  lw         $17, 0x0($2)
/* EE7D8 001EE6D8 9000A427 */  addiu      $4, $sp, 0x90
/* EE7DC 001EE6DC 282E0070 */  paddub     $5, $0, $0
/* EE7E0 001EE6E0 F0010624 */  addiu      $6, $0, 0x1F0
/* EE7E4 001EE6E4 5A0D040C */  jal        memset
/* EE7E8 001EE6E8 00000000 */   nop
/* EE7EC 001EE6EC A094828F */  lw         $2, -0x6B60($gp)
/* EE7F0 001EE6F0 21905200 */  addu       $18, $2, $18
/* EE7F4 001EE6F4 00004486 */  lh         $4, 0x0($18)
/* EE7F8 001EE6F8 88C7080C */  jal        WhatIsKindofItem__Fi
/* EE7FC 001EE6FC 00000000 */   nop
/* EE800 001EE700 28A64070 */  paddub     $20, $2, $0
/* EE804 001EE704 00004286 */  lh         $2, 0x0($18)
/* EE808 001EE708 8002A2AF */  sw         $2, 0x280($sp)
/* EE80C 001EE70C 02000224 */  addiu      $2, $0, 0x2
/* EE810 001EE710 13008212 */  beq        $20, $2, .L001EE760
/* EE814 001EE714 00000000 */   nop
/* EE818 001EE718 01000224 */  addiu      $2, $0, 0x1
/* EE81C 001EE71C 09008212 */  beq        $20, $2, .L001EE744
/* EE820 001EE720 00000000 */   nop
/* EE824 001EE724 03008012 */  beqz       $20, .L001EE734
/* EE828 001EE728 00000000 */   nop
/* EE82C 001EE72C 13000010 */  b          .L001EE77C
/* EE830 001EE730 00000000 */   nop
.L001EE734:
/* EE834 001EE734 0400428E */  lw         $2, 0x4($18)
/* EE838 001EE738 9000A2AF */  sw         $2, 0x90($sp)
/* EE83C 001EE73C 12000010 */  b          .L001EE788
/* EE840 001EE740 00000000 */   nop
.L001EE744:
/* EE844 001EE744 9000A427 */  addiu      $4, $sp, 0x90
/* EE848 001EE748 04004526 */  addiu      $5, $18, 0x4
/* EE84C 001EE74C F8000624 */  addiu      $6, $0, 0xF8
/* EE850 001EE750 EC0C040C */  jal        memcpy
/* EE854 001EE754 00000000 */   nop
/* EE858 001EE758 0B000010 */  b          .L001EE788
/* EE85C 001EE75C 00000000 */   nop
.L001EE760:
/* EE860 001EE760 9000A427 */  addiu      $4, $sp, 0x90
/* EE864 001EE764 04004526 */  addiu      $5, $18, 0x4
/* EE868 001EE768 20000624 */  addiu      $6, $0, 0x20
/* EE86C 001EE76C EC0C040C */  jal        memcpy
/* EE870 001EE770 00000000 */   nop
/* EE874 001EE774 04000010 */  b          .L001EE788
/* EE878 001EE778 00000000 */   nop
.L001EE77C:
/* EE87C 001EE77C 28264072 */  paddub     $4, $18, $0
/* EE880 001EE780 3C9A070C */  jal        InitShopItemListData__FP13SHOP_ITEMLIST
/* EE884 001EE784 00000000 */   nop
.L001EE788:
/* EE888 001EE788 B894828F */  lw         $2, -0x6B48($gp)
/* EE88C 001EE78C 10004484 */  lh         $4, 0x10($2)
/* EE890 001EE790 88C7080C */  jal        WhatIsKindofItem__Fi
/* EE894 001EE794 00000000 */   nop
/* EE898 001EE798 289E4070 */  paddub     $19, $2, $0
/* EE89C 001EE79C B894838F */  lw         $3, -0x6B48($gp)
/* EE8A0 001EE7A0 10006284 */  lh         $2, 0x10($3)
/* EE8A4 001EE7A4 8402B727 */  addiu      $23, $sp, 0x284
/* EE8A8 001EE7A8 0000E2AE */  sw         $2, 0x0($23)
/* EE8AC 001EE7AC 02000224 */  addiu      $2, $0, 0x2
/* EE8B0 001EE7B0 13006212 */  beq        $19, $2, .L001EE800
/* EE8B4 001EE7B4 00000000 */   nop
/* EE8B8 001EE7B8 01000224 */  addiu      $2, $0, 0x1
/* EE8BC 001EE7BC 09006212 */  beq        $19, $2, .L001EE7E4
/* EE8C0 001EE7C0 00000000 */   nop
/* EE8C4 001EE7C4 03006012 */  beqz       $19, .L001EE7D4
/* EE8C8 001EE7C8 00000000 */   nop
/* EE8CC 001EE7CC 11000010 */  b          .L001EE814
/* EE8D0 001EE7D0 00000000 */   nop
.L001EE7D4:
/* EE8D4 001EE7D4 12006284 */  lh         $2, 0x12($3)
/* EE8D8 001EE7D8 8801A2AF */  sw         $2, 0x188($sp)
/* EE8DC 001EE7DC 0D000010 */  b          .L001EE814
/* EE8E0 001EE7E0 00000000 */   nop
.L001EE7E4:
/* EE8E4 001EE7E4 8801A427 */  addiu      $4, $sp, 0x188
/* EE8E8 001EE7E8 BC94858F */  lw         $5, -0x6B44($gp)
/* EE8EC 001EE7EC F8000624 */  addiu      $6, $0, 0xF8
/* EE8F0 001EE7F0 EC0C040C */  jal        memcpy
/* EE8F4 001EE7F4 00000000 */   nop
/* EE8F8 001EE7F8 06000010 */  b          .L001EE814
/* EE8FC 001EE7FC 00000000 */   nop
.L001EE800:
/* EE900 001EE800 8801A427 */  addiu      $4, $sp, 0x188
/* EE904 001EE804 C094858F */  lw         $5, -0x6B40($gp)
/* EE908 001EE808 20000624 */  addiu      $6, $0, 0x20
/* EE90C 001EE80C EC0C040C */  jal        memcpy
/* EE910 001EE810 00000000 */   nop
.L001EE814:
/* EE914 001EE814 02000224 */  addiu      $2, $0, 0x2
/* EE918 001EE818 14008212 */  beq        $20, $2, .L001EE86C
/* EE91C 001EE81C 00000000 */   nop
/* EE920 001EE820 01000224 */  addiu      $2, $0, 0x1
/* EE924 001EE824 0A008212 */  beq        $20, $2, .L001EE850
/* EE928 001EE828 00000000 */   nop
/* EE92C 001EE82C 03008012 */  beqz       $20, .L001EE83C
/* EE930 001EE830 00000000 */   nop
/* EE934 001EE834 12000010 */  b          .L001EE880
/* EE938 001EE838 00000000 */   nop
.L001EE83C:
/* EE93C 001EE83C 9000A387 */  lh         $3, 0x90($sp)
/* EE940 001EE840 B894828F */  lw         $2, -0x6B48($gp)
/* EE944 001EE844 120043A4 */  sh         $3, 0x12($2)
/* EE948 001EE848 0D000010 */  b          .L001EE880
/* EE94C 001EE84C 00000000 */   nop
.L001EE850:
/* EE950 001EE850 BC94848F */  lw         $4, -0x6B44($gp)
/* EE954 001EE854 9000A527 */  addiu      $5, $sp, 0x90
/* EE958 001EE858 F8000624 */  addiu      $6, $0, 0xF8
/* EE95C 001EE85C EC0C040C */  jal        memcpy
/* EE960 001EE860 00000000 */   nop
/* EE964 001EE864 06000010 */  b          .L001EE880
/* EE968 001EE868 00000000 */   nop
.L001EE86C:
/* EE96C 001EE86C C094848F */  lw         $4, -0x6B40($gp)
/* EE970 001EE870 9000A527 */  addiu      $5, $sp, 0x90
/* EE974 001EE874 20000624 */  addiu      $6, $0, 0x20
/* EE978 001EE878 EC0C040C */  jal        memcpy
/* EE97C 001EE87C 00000000 */   nop
.L001EE880:
/* EE980 001EE880 8002A387 */  lh         $3, 0x280($sp)
/* EE984 001EE884 B894828F */  lw         $2, -0x6B48($gp)
/* EE988 001EE888 100043A4 */  sh         $3, 0x10($2)
/* EE98C 001EE88C 02000224 */  addiu      $2, $0, 0x2
/* EE990 001EE890 13006212 */  beq        $19, $2, .L001EE8E0
/* EE994 001EE894 00000000 */   nop
/* EE998 001EE898 01000224 */  addiu      $2, $0, 0x1
/* EE99C 001EE89C 09006212 */  beq        $19, $2, .L001EE8C4
/* EE9A0 001EE8A0 00000000 */   nop
/* EE9A4 001EE8A4 03006012 */  beqz       $19, .L001EE8B4
/* EE9A8 001EE8A8 00000000 */   nop
/* EE9AC 001EE8AC 11000010 */  b          .L001EE8F4
/* EE9B0 001EE8B0 00000000 */   nop
.L001EE8B4:
/* EE9B4 001EE8B4 8801A28F */  lw         $2, 0x188($sp)
/* EE9B8 001EE8B8 040042AE */  sw         $2, 0x4($18)
/* EE9BC 001EE8BC 0D000010 */  b          .L001EE8F4
/* EE9C0 001EE8C0 00000000 */   nop
.L001EE8C4:
/* EE9C4 001EE8C4 04004426 */  addiu      $4, $18, 0x4
/* EE9C8 001EE8C8 8801A527 */  addiu      $5, $sp, 0x188
/* EE9CC 001EE8CC F8000624 */  addiu      $6, $0, 0xF8
/* EE9D0 001EE8D0 EC0C040C */  jal        memcpy
/* EE9D4 001EE8D4 00000000 */   nop
/* EE9D8 001EE8D8 06000010 */  b          .L001EE8F4
/* EE9DC 001EE8DC 00000000 */   nop
.L001EE8E0:
/* EE9E0 001EE8E0 04004426 */  addiu      $4, $18, 0x4
/* EE9E4 001EE8E4 8801A527 */  addiu      $5, $sp, 0x188
/* EE9E8 001EE8E8 20000624 */  addiu      $6, $0, 0x20
/* EE9EC 001EE8EC EC0C040C */  jal        memcpy
/* EE9F0 001EE8F0 00000000 */   nop
.L001EE8F4:
/* EE9F4 001EE8F4 0000E286 */  lh         $2, 0x0($23)
/* EE9F8 001EE8F8 000042A6 */  sh         $2, 0x0($18)
/* EE9FC 001EE8FC B894828F */  lw         $2, -0x6B48($gp)
/* EEA00 001EE900 000056AC */  sw         $22, 0x0($2)
/* EEA04 001EE904 9094828F */  lw         $2, -0x6B70($gp)
/* EEA08 001EE908 21105500 */  addu       $2, $2, $21
/* EEA0C 001EE90C 000051AC */  sw         $17, 0x0($2)
/* EEA10 001EE910 B894838F */  lw         $3, -0x6B48($gp)
/* EEA14 001EE914 10006284 */  lh         $2, 0x10($3)
/* EEA18 001EE918 51004128 */  slti       $at, $2, 0x51
/* EEA1C 001EE91C 08002010 */  beqz       $at, .L001EE940
/* EEA20 001EE920 00000000 */   nop
/* EEA24 001EE924 F49B070C */  jal        InitAllHaveData__Fv
/* EEA28 001EE928 00000000 */   nop
/* EEA2C 001EE92C FFFF0224 */  addiu      $2, $0, -0x1
/* EEA30 001EE930 D901013C */  lui        $at, (0x1D90234 >> 16)
/* EEA34 001EE934 340222AC */  sw         $2, (0x1D90234 & 0xFFFF)($at)
/* EEA38 001EE938 06000010 */  b          .L001EE954
/* EEA3C 001EE93C 00000000 */   nop
.L001EE940:
/* EEA40 001EE940 080070AC */  sw         $16, 0x8($3)
/* EEA44 001EE944 D901013C */  lui        $at, (0x1D900DC >> 16)
/* EEA48 001EE948 DC0034AC */  sw         $20, (0x1D900DC & 0xFFFF)($at)
/* EEA4C 001EE94C B8BA080C */  jal        PersonalBoardLimmitCheck__Fv
/* EEA50 001EE950 00000000 */   nop
.L001EE954:
/* EEA54 001EE954 01000424 */  addiu      $4, $0, 0x1
/* EEA58 001EE958 BCB3080C */  jal        ComMenuSePlay__Fi
/* EEA5C 001EE95C 00000000 */   nop
/* EEA60 001EE960 EE000010 */  b          .L001EED1C
/* EEA64 001EE964 00000000 */   nop
.L001EE968:
/* EEA68 001EE968 CC01023C */  lui        $2, %hi(GamePad)
/* EEA6C 001EE96C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EEA70 001EE970 10000524 */  addiu      $5, $0, 0x10
/* EEA74 001EE974 1CAE040C */  jal        Down__8CGamePadFi
/* EEA78 001EE978 00000000 */   nop
/* EEA7C 001EE97C E7004010 */  beqz       $2, .L001EED1C
/* EEA80 001EE980 00000000 */   nop
/* EEA84 001EE984 01000424 */  addiu      $4, $0, 0x1
/* EEA88 001EE988 D901013C */  lui        $at, (0x1D900D6 >> 16)
/* EEA8C 001EE98C D60024A4 */  sh         $4, (0x1D900D6 & 0xFFFF)($at)
/* EEA90 001EE990 B894828F */  lw         $2, -0x6B48($gp)
/* EEA94 001EE994 10004284 */  lh         $2, 0x10($2)
/* EEA98 001EE998 51004228 */  slti       $2, $2, 0x51
/* EEA9C 001EE99C 06004014 */  bnez       $2, .L001EE9B8
/* EEAA0 001EE9A0 00000000 */   nop
/* EEAA4 001EE9A4 02000424 */  addiu      $4, $0, 0x2
/* EEAA8 001EE9A8 BCB3080C */  jal        ComMenuSePlay__Fi
/* EEAAC 001EE9AC 00000000 */   nop
/* EEAB0 001EE9B0 E3000010 */  b          .L001EED40
/* EEAB4 001EE9B4 00000000 */   nop
.L001EE9B8:
/* EEAB8 001EE9B8 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EEABC 001EE9BC E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* EEAC0 001EE9C0 80180500 */  sll        $3, $5, 2
/* EEAC4 001EE9C4 9094828F */  lw         $2, -0x6B70($gp)
/* EEAC8 001EE9C8 21104300 */  addu       $2, $2, $3
/* EEACC 001EE9CC 0000428C */  lw         $2, 0x0($2)
/* EEAD0 001EE9D0 CF004414 */  bne        $2, $4, .L001EED10
/* EEAD4 001EE9D4 00000000 */   nop
/* EEAD8 001EE9D8 8494828F */  lw         $2, -0x6B7C($gp)
/* EEADC 001EE9DC 46434694 */  lhu        $6, 0x4346($2)
/* EEAE0 001EE9E0 80110500 */  sll        $2, $5, 6
/* EEAE4 001EE9E4 23104500 */  subu       $2, $2, $5
/* EEAE8 001EE9E8 80180200 */  sll        $3, $2, 2
/* EEAEC 001EE9EC A094828F */  lw         $2, -0x6B60($gp)
/* EEAF0 001EE9F0 21104300 */  addu       $2, $2, $3
/* EEAF4 001EE9F4 00005384 */  lh         $19, 0x0($2)
/* EEAF8 001EE9F8 28266072 */  paddub     $4, $19, $0
/* EEAFC 001EE9FC 282E0070 */  paddub     $5, $0, $0
/* EEB00 001EEA00 B4AC070C */  jal        CalItemMoney__Fii
/* EEB04 001EEA04 00000000 */   nop
/* EEB08 001EEA08 01001024 */  addiu      $16, $0, 0x1
/* EEB0C 001EEA0C 5100612A */  slti       $at, $19, 0x51
/* EEB10 001EEA10 02002010 */  beqz       $at, .L001EEA1C
/* EEB14 001EEA14 00000000 */   nop
/* EEB18 001EEA18 28860070 */  paddub     $16, $0, $0
.L001EEA1C:
/* EEB1C 001EEA1C 2A08C200 */  slt        $at, $6, $2
/* EEB20 001EEA20 06002010 */  beqz       $at, .L001EEA3C
/* EEB24 001EEA24 00000000 */   nop
/* EEB28 001EEA28 28860070 */  paddub     $16, $0, $0
/* EEB2C 001EEA2C 15000424 */  addiu      $4, $0, 0x15
/* EEB30 001EEA30 01000524 */  addiu      $5, $0, 0x1
/* EEB34 001EEA34 749C070C */  jal        SetItemShopTalkMode__Fii
/* EEB38 001EEA38 00000000 */   nop
.L001EEA3C:
/* EEB3C 001EEA3C 28266072 */  paddub     $4, $19, $0
/* EEB40 001EEA40 88C7080C */  jal        WhatIsKindofItem__Fi
/* EEB44 001EEA44 00000000 */   nop
/* EEB48 001EEA48 8C02A2AF */  sw         $2, 0x28C($sp)
/* EEB4C 001EEA4C 28266072 */  paddub     $4, $19, $0
/* EEB50 001EEA50 8C02A527 */  addiu      $5, $sp, 0x28C
/* EEB54 001EEA54 70C5080C */  jal        GetBoardSpace__FiPi
/* EEB58 001EEA58 00000000 */   nop
/* EEB5C 001EEA5C 06004104 */  bgez       $2, .L001EEA78
/* EEB60 001EEA60 00000000 */   nop
/* EEB64 001EEA64 28860070 */  paddub     $16, $0, $0
/* EEB68 001EEA68 0B000424 */  addiu      $4, $0, 0xB
/* EEB6C 001EEA6C 01000524 */  addiu      $5, $0, 0x1
/* EEB70 001EEA70 749C070C */  jal        SetItemShopTalkMode__Fii
/* EEB74 001EEA74 00000000 */   nop
.L001EEA78:
/* EEB78 001EEA78 28BE0070 */  paddub     $23, $0, $0
/* EEB7C 001EEA7C 288E0070 */  paddub     $17, $0, $0
/* EEB80 001EEA80 28960070 */  paddub     $18, $0, $0
/* EEB84 001EEA84 28266072 */  paddub     $4, $19, $0
/* EEB88 001EEA88 A4C7080C */  jal        WhoIsWeaponEquip__Fi
/* EEB8C 001EEA8C 00000000 */   nop
/* EEB90 001EEA90 28B64070 */  paddub     $22, $2, $0
/* EEB94 001EEA94 8C02A38F */  lw         $3, 0x28C($sp)
/* EEB98 001EEA98 02000224 */  addiu      $2, $0, 0x2
/* EEB9C 001EEA9C 42006210 */  beq        $3, $2, .L001EEBA8
/* EEBA0 001EEAA0 00000000 */   nop
/* EEBA4 001EEAA4 01000224 */  addiu      $2, $0, 0x1
/* EEBA8 001EEAA8 27006210 */  beq        $3, $2, .L001EEB48
/* EEBAC 001EEAAC 00000000 */   nop
/* EEBB0 001EEAB0 03006010 */  beqz       $3, .L001EEAC0
/* EEBB4 001EEAB4 00000000 */   nop
/* EEBB8 001EEAB8 4D000010 */  b          .L001EEBF0
/* EEBBC 001EEABC 00000000 */   nop
.L001EEAC0:
/* EEBC0 001EEAC0 8494828F */  lw         $2, -0x6B7C($gp)
/* EEBC4 001EEAC4 60434524 */  addiu      $5, $2, 0x4360
/* EEBC8 001EEAC8 60435180 */  lb         $17, 0x4360($2)
/* EEBCC 001EEACC 28260070 */  paddub     $4, $0, $0
/* EEBD0 001EEAD0 0A000010 */  b          .L001EEAFC
/* EEBD4 001EEAD4 00000000 */   nop
.L001EEAD8:
/* EEBD8 001EEAD8 40100400 */  sll        $2, $4, 1
/* EEBDC 001EEADC 21184500 */  addu       $3, $2, $5
/* EEBE0 001EEAE0 02006284 */  lh         $2, 0x2($3)
/* EEBE4 001EEAE4 84004228 */  slti       $2, $2, 0x84
/* EEBE8 001EEAE8 03004014 */  bnez       $2, .L001EEAF8
/* EEBEC 001EEAEC 00000000 */   nop
/* EEBF0 001EEAF0 08006284 */  lh         $2, 0x8($3)
/* EEBF4 001EEAF4 21904202 */  addu       $18, $18, $2
.L001EEAF8:
/* EEBF8 001EEAF8 01008424 */  addiu      $4, $4, 0x1
.L001EEAFC:
/* EEBFC 001EEAFC 03008228 */  slti       $2, $4, 0x3
/* EEC00 001EEB00 F5FF4014 */  bnez       $2, .L001EEAD8
/* EEC04 001EEB04 00000000 */   nop
/* EEC08 001EEB08 281E0070 */  paddub     $3, $0, $0
/* EEC0C 001EEB0C 09000010 */  b          .L001EEB34
/* EEC10 001EEB10 00000000 */   nop
.L001EEB14:
/* EEC14 001EEB14 40100300 */  sll        $2, $3, 1
/* EEC18 001EEB18 21104500 */  addu       $2, $2, $5
/* EEC1C 001EEB1C 0E004284 */  lh         $2, 0xE($2)
/* EEC20 001EEB20 84004228 */  slti       $2, $2, 0x84
/* EEC24 001EEB24 02004014 */  bnez       $2, .L001EEB30
/* EEC28 001EEB28 00000000 */   nop
/* EEC2C 001EEB2C 01005226 */  addiu      $18, $18, 0x1
.L001EEB30:
/* EEC30 001EEB30 01006324 */  addiu      $3, $3, 0x1
.L001EEB34:
/* EEC34 001EEB34 2A107100 */  slt        $2, $3, $17
/* EEC38 001EEB38 F6FF4014 */  bnez       $2, .L001EEB14
/* EEC3C 001EEB3C 00000000 */   nop
/* EEC40 001EEB40 2B000010 */  b          .L001EEBF0
/* EEC44 001EEB44 00000000 */   nop
.L001EEB48:
/* EEC48 001EEB48 0A001124 */  addiu      $17, $0, 0xA
/* EEC4C 001EEB4C 8494838F */  lw         $3, -0x6B7C($gp)
/* EEC50 001EEB50 A80A0224 */  addiu      $2, $0, 0xAA8
/* EEC54 001EEB54 1810C202 */  mult       $2, $22, $2
/* EEC58 001EEB58 21106200 */  addu       $2, $3, $2
/* EEC5C 001EEB5C 0C454424 */  addiu      $4, $2, 0x450C
/* EEC60 001EEB60 281E0070 */  paddub     $3, $0, $0
/* EEC64 001EEB64 0B000010 */  b          .L001EEB94
/* EEC68 001EEB68 00000000 */   nop
.L001EEB6C:
/* EEC6C 001EEB6C 40110300 */  sll        $2, $3, 5
/* EEC70 001EEB70 23104300 */  subu       $2, $2, $3
/* EEC74 001EEB74 C0100200 */  sll        $2, $2, 3
/* EEC78 001EEB78 21108200 */  addu       $2, $4, $2
/* EEC7C 001EEB7C 00004284 */  lh         $2, 0x0($2)
/* EEC80 001EEB80 01014228 */  slti       $2, $2, 0x101
/* EEC84 001EEB84 02004014 */  bnez       $2, .L001EEB90
/* EEC88 001EEB88 00000000 */   nop
/* EEC8C 001EEB8C 01005226 */  addiu      $18, $18, 0x1
.L001EEB90:
/* EEC90 001EEB90 01006324 */  addiu      $3, $3, 0x1
.L001EEB94:
/* EEC94 001EEB94 0A006228 */  slti       $2, $3, 0xA
/* EEC98 001EEB98 F4FF4014 */  bnez       $2, .L001EEB6C
/* EEC9C 001EEB9C 00000000 */   nop
/* EECA0 001EEBA0 13000010 */  b          .L001EEBF0
/* EECA4 001EEBA4 00000000 */   nop
.L001EEBA8:
/* EECA8 001EEBA8 28001124 */  addiu      $17, $0, 0x28
/* EECAC 001EEBAC 8494828F */  lw         $2, -0x6B7C($gp)
/* EECB0 001EEBB0 04054424 */  addiu      $4, $2, 0x504
/* EECB4 001EEBB4 F87F8424 */  addiu      $4, $4, 0x7FF8
/* EECB8 001EEBB8 281E0070 */  paddub     $3, $0, $0
/* EECBC 001EEBBC 09000010 */  b          .L001EEBE4
/* EECC0 001EEBC0 00000000 */   nop
.L001EEBC4:
/* EECC4 001EEBC4 40110300 */  sll        $2, $3, 5
/* EECC8 001EEBC8 21108200 */  addu       $2, $4, $2
/* EECCC 001EEBCC 00004284 */  lh         $2, 0x0($2)
/* EECD0 001EEBD0 51004228 */  slti       $2, $2, 0x51
/* EECD4 001EEBD4 02004014 */  bnez       $2, .L001EEBE0
/* EECD8 001EEBD8 00000000 */   nop
/* EECDC 001EEBDC 01005226 */  addiu      $18, $18, 0x1
.L001EEBE0:
/* EECE0 001EEBE0 01006324 */  addiu      $3, $3, 0x1
.L001EEBE4:
/* EECE4 001EEBE4 28006228 */  slti       $2, $3, 0x28
/* EECE8 001EEBE8 F6FF4014 */  bnez       $2, .L001EEBC4
/* EECEC 001EEBEC 00000000 */   nop
.L001EEBF0:
/* EECF0 001EEBF0 D901013C */  lui        $at, (0x1D90290 >> 16)
/* EECF4 001EEBF4 90022284 */  lh         $2, (0x1D90290 & 0xFFFF)($at)
/* EECF8 001EEBF8 02004018 */  blez       $2, .L001EEC04
/* EECFC 001EEBFC 00000000 */   nop
/* EED00 001EEC00 01005226 */  addiu      $18, $18, 0x1
.L001EEC04:
/* EED04 001EEC04 289E0070 */  paddub     $19, $0, $0
/* EED08 001EEC08 24000010 */  b          .L001EEC9C
/* EED0C 001EEC0C 00000000 */   nop
.L001EEC10:
/* EED10 001EEC10 8C02B48F */  lw         $20, 0x28C($sp)
/* EED14 001EEC14 20008006 */  bltz       $20, .L001EEC98
/* EED18 001EEC18 00000000 */   nop
/* EED1C 001EEC1C 80111300 */  sll        $2, $19, 6
/* EED20 001EEC20 23105300 */  subu       $2, $2, $19
/* EED24 001EEC24 80A80200 */  sll        $21, $2, 2
/* EED28 001EEC28 A094828F */  lw         $2, -0x6B60($gp)
/* EED2C 001EEC2C 21105500 */  addu       $2, $2, $21
/* EED30 001EEC30 00004484 */  lh         $4, 0x0($2)
/* EED34 001EEC34 88C7080C */  jal        WhatIsKindofItem__Fi
/* EED38 001EEC38 00000000 */   nop
/* EED3C 001EEC3C 16008216 */  bne        $20, $2, .L001EEC98
/* EED40 001EEC40 00000000 */   nop
/* EED44 001EEC44 80181300 */  sll        $3, $19, 2
/* EED48 001EEC48 9094828F */  lw         $2, -0x6B70($gp)
/* EED4C 001EEC4C 21104300 */  addu       $2, $2, $3
/* EED50 001EEC50 0000438C */  lw         $3, 0x0($2)
/* EED54 001EEC54 02000224 */  addiu      $2, $0, 0x2
/* EED58 001EEC58 0F006214 */  bne        $3, $2, .L001EEC98
/* EED5C 001EEC5C 00000000 */   nop
/* EED60 001EEC60 01000224 */  addiu      $2, $0, 0x1
/* EED64 001EEC64 0B008216 */  bne        $20, $2, .L001EEC94
/* EED68 001EEC68 00000000 */   nop
/* EED6C 001EEC6C A094828F */  lw         $2, -0x6B60($gp)
/* EED70 001EEC70 21105500 */  addu       $2, $2, $21
/* EED74 001EEC74 00004484 */  lh         $4, 0x0($2)
/* EED78 001EEC78 A4C7080C */  jal        WhoIsWeaponEquip__Fi
/* EED7C 001EEC7C 00000000 */   nop
/* EED80 001EEC80 0500C216 */  bne        $22, $2, .L001EEC98
/* EED84 001EEC84 00000000 */   nop
/* EED88 001EEC88 01005226 */  addiu      $18, $18, 0x1
/* EED8C 001EEC8C 02000010 */  b          .L001EEC98
/* EED90 001EEC90 00000000 */   nop
.L001EEC94:
/* EED94 001EEC94 01005226 */  addiu      $18, $18, 0x1
.L001EEC98:
/* EED98 001EEC98 01007326 */  addiu      $19, $19, 0x1
.L001EEC9C:
/* EED9C 001EEC9C 1E00622A */  slti       $2, $19, 0x1E
/* EEDA0 001EECA0 DBFF4014 */  bnez       $2, .L001EEC10
/* EEDA4 001EECA4 00000000 */   nop
/* EEDA8 001EECA8 2A105102 */  slt        $2, $18, $17
/* EEDAC 001EECAC 02004014 */  bnez       $2, .L001EECB8
/* EEDB0 001EECB0 00000000 */   nop
/* EEDB4 001EECB4 01001724 */  addiu      $23, $0, 0x1
.L001EECB8:
/* EEDB8 001EECB8 0600E012 */  beqz       $23, .L001EECD4
/* EEDBC 001EECBC 00000000 */   nop
/* EEDC0 001EECC0 28860070 */  paddub     $16, $0, $0
/* EEDC4 001EECC4 0B000424 */  addiu      $4, $0, 0xB
/* EEDC8 001EECC8 01000524 */  addiu      $5, $0, 0x1
/* EEDCC 001EECCC 749C070C */  jal        SetItemShopTalkMode__Fii
/* EEDD0 001EECD0 00000000 */   nop
.L001EECD4:
/* EEDD4 001EECD4 09000012 */  beqz       $16, .L001EECFC
/* EEDD8 001EECD8 00000000 */   nop
/* EEDDC 001EECDC 0D000224 */  addiu      $2, $0, 0xD
/* EEDE0 001EECE0 D901013C */  lui        $at, (0x1D90250 >> 16)
/* EEDE4 001EECE4 500222A4 */  sh         $2, (0x1D90250 & 0xFFFF)($at)
/* EEDE8 001EECE8 01000424 */  addiu      $4, $0, 0x1
/* EEDEC 001EECEC BCB3080C */  jal        ComMenuSePlay__Fi
/* EEDF0 001EECF0 00000000 */   nop
/* EEDF4 001EECF4 09000010 */  b          .L001EED1C
/* EEDF8 001EECF8 00000000 */   nop
.L001EECFC:
/* EEDFC 001EECFC 02000424 */  addiu      $4, $0, 0x2
/* EEE00 001EED00 BCB3080C */  jal        ComMenuSePlay__Fi
/* EEE04 001EED04 00000000 */   nop
/* EEE08 001EED08 04000010 */  b          .L001EED1C
/* EEE0C 001EED0C 00000000 */   nop
.L001EED10:
/* EEE10 001EED10 02000424 */  addiu      $4, $0, 0x2
/* EEE14 001EED14 BCB3080C */  jal        ComMenuSePlay__Fi
/* EEE18 001EED18 00000000 */   nop
.L001EED1C:
/* EEE1C 001EED1C 6CBA080C */  jal        BoardModeChangeKey__Fv
/* EEE20 001EED20 00000000 */   nop
/* EEE24 001EED24 06004010 */  beqz       $2, .L001EED40
/* EEE28 001EED28 00000000 */   nop
/* EEE2C 001EED2C B8BA080C */  jal        PersonalBoardLimmitCheck__Fv
/* EEE30 001EED30 00000000 */   nop
/* EEE34 001EED34 28260070 */  paddub     $4, $0, $0
/* EEE38 001EED38 BCB3080C */  jal        ComMenuSePlay__Fi
/* EEE3C 001EED3C 00000000 */   nop
.L001EED40:
/* EEE40 001EED40 8000BF7B */  lq         $31, 0x80($sp)
/* EEE44 001EED44 7000B77B */  lq         $23, 0x70($sp)
/* EEE48 001EED48 6000B67B */  lq         $22, 0x60($sp)
/* EEE4C 001EED4C 5000B57B */  lq         $21, 0x50($sp)
/* EEE50 001EED50 4000B47B */  lq         $20, 0x40($sp)
/* EEE54 001EED54 3000B37B */  lq         $19, 0x30($sp)
/* EEE58 001EED58 2000B27B */  lq         $18, 0x20($sp)
/* EEE5C 001EED5C 1000B17B */  lq         $17, 0x10($sp)
/* EEE60 001EED60 0000B07B */  lq         $16, 0x0($sp)
/* EEE64 001EED64 9002BD27 */  addiu      $sp, $sp, 0x290
/* EEE68 001EED68 0800E003 */  jr         $31
/* EEE6C 001EED6C 00000000 */   nop
