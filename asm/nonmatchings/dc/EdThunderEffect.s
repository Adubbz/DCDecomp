.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdThunderEffect__FiP11CEditGround
/* 72470 00172370 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 72474 00172374 1000BF7F */  sq         $31, 0x10($sp)
/* 72478 00172378 0000B07F */  sq         $16, 0x0($sp)
/* 7247C 0017237C 28000324 */  addiu      $3, $0, 0x28
/* 72480 00172380 07008310 */  beq        $4, $3, .L001723A0
/* 72484 00172384 00000000 */   nop
/* 72488 00172388 32000324 */  addiu      $3, $0, 0x32
/* 7248C 0017238C 04008310 */  beq        $4, $3, .L001723A0
/* 72490 00172390 00000000 */   nop
/* 72494 00172394 18000324 */  addiu      $3, $0, 0x18
/* 72498 00172398 8D008314 */  bne        $4, $3, .L001725D0
/* 7249C 0017239C 00000000 */   nop
.L001723A0:
/* 724A0 001723A0 0100013C */  lui        $at, (0x16290 >> 16)
/* 724A4 001723A4 2108A100 */  addu       $at, $5, $at
/* 724A8 001723A8 9062308C */  lw         $16, (0x16290 & 0xFFFF)($at)
/* 724AC 001723AC 07000012 */  beqz       $16, .L001723CC
/* 724B0 001723B0 00000000 */   nop
/* 724B4 001723B4 28260072 */  paddub     $4, $16, $0
/* 724B8 001723B8 2A00023C */  lui        $2, %hi(_582)
/* 724BC 001723BC 98A24524 */  addiu      $5, $2, %lo(_582)
/* 724C0 001723C0 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 724C4 001723C4 00000000 */   nop
/* 724C8 001723C8 28864070 */  paddub     $16, $2, $0
.L001723CC:
/* 724CC 001723CC 80000012 */  beqz       $16, .L001725D0
/* 724D0 001723D0 00000000 */   nop
/* 724D4 001723D4 608F828F */  lw         $2, -0x70A0($gp)
/* 724D8 001723D8 07004014 */  bnez       $2, .L001723F8
/* 724DC 001723DC 00000000 */   nop
/* 724E0 001723E0 D201023C */  lui        $2, %hi(thd_light)
/* 724E4 001723E4 80994424 */  addiu      $4, $2, %lo(thd_light)
/* 724E8 001723E8 D201023C */  lui        $2, %hi(thd_color)
/* 724EC 001723EC C0994524 */  addiu      $5, $2, %lo(thd_color)
/* 724F0 001723F0 2CB7040C */  jal        MGGetPLight__FPA4_fPA4_f
/* 724F4 001723F4 00000000 */   nop
.L001723F8:
/* 724F8 001723F8 6000A427 */  addiu      $4, $sp, 0x60
/* 724FC 001723FC 2000A527 */  addiu      $5, $sp, 0x20
/* 72500 00172400 2CB7040C */  jal        MGGetPLight__FPA4_fPA4_f
/* 72504 00172404 00000000 */   nop
/* 72508 00172408 5C8F828F */  lw         $2, -0x70A4($gp)
/* 7250C 0017240C 05004018 */  blez       $2, .L00172424
/* 72510 00172410 00000000 */   nop
/* 72514 00172414 01000224 */  addiu      $2, $0, 0x1
/* 72518 00172418 B00002A6 */  sh         $2, 0xB0($16)
/* 7251C 0017241C 3E000010 */  b          .L00172518
/* 72520 00172420 00000000 */   nop
.L00172424:
/* 72524 00172424 5C8F80AF */  sw         $0, -0x70A4($gp)
/* 72528 00172428 648F828F */  lw         $2, -0x709C($gp)
/* 7252C 0017242C 38004014 */  bnez       $2, .L00172510
/* 72530 00172430 00000000 */   nop
/* 72534 00172434 04000224 */  addiu      $2, $0, 0x4
/* 72538 00172438 5C8F82AF */  sw         $2, -0x70A4($gp)
/* 7253C 0017243C 282E0070 */  paddub     $5, $0, $0
/* 72540 00172440 11000010 */  b          .L00172488
/* 72544 00172444 00000000 */   nop
.L00172448:
/* 72548 00172448 28360070 */  paddub     $6, $0, $0
/* 7254C 0017244C 0A000010 */  b          .L00172478
/* 72550 00172450 00000000 */   nop
.L00172454:
/* 72554 00172454 7F43043C */  lui        $4, (0x437F0000 >> 16)
/* 72558 00172458 00190500 */  sll        $3, $5, 4
/* 7255C 0017245C D201023C */  lui        $2, %hi(thd_color)
/* 72560 00172460 C0994224 */  addiu      $2, $2, %lo(thd_color)
/* 72564 00172464 21184300 */  addu       $3, $2, $3
/* 72568 00172468 80100600 */  sll        $2, $6, 2
/* 7256C 0017246C 21104300 */  addu       $2, $2, $3
/* 72570 00172470 000044AC */  sw         $4, 0x0($2)
/* 72574 00172474 0100C624 */  addiu      $6, $6, 0x1
.L00172478:
/* 72578 00172478 0300C228 */  slti       $2, $6, 0x3
/* 7257C 0017247C F5FF4014 */  bnez       $2, .L00172454
/* 72580 00172480 00000000 */   nop
/* 72584 00172484 0100A524 */  addiu      $5, $5, 0x1
.L00172488:
/* 72588 00172488 0200A228 */  slti       $2, $5, 0x2
/* 7258C 0017248C EEFF4014 */  bnez       $2, .L00172448
/* 72590 00172490 00000000 */   nop
/* 72594 00172494 BE11040C */  jal        rand
/* 72598 00172498 00000000 */   nop
/* 7259C 0017249C 06000324 */  addiu      $3, $0, 0x6
/* 725A0 001724A0 1A004300 */  div        $0, $2, $3
/* 725A4 001724A4 00000000 */  nop
/* 725A8 001724A8 00000000 */  nop
/* 725AC 001724AC 10100000 */  mfhi       $2
/* 725B0 001724B0 43004424 */  addiu      $4, $2, 0x43
/* 725B4 001724B4 FFFF0524 */  addiu      $5, $0, -0x1
/* 725B8 001724B8 28360070 */  paddub     $6, $0, $0
/* 725BC 001724BC AC69050C */  jal        SndSePlay__Fiii
/* 725C0 001724C0 00000000 */   nop
/* 725C4 001724C4 608F828F */  lw         $2, -0x70A0($gp)
/* 725C8 001724C8 08004014 */  bnez       $2, .L001724EC
/* 725CC 001724CC 00000000 */   nop
/* 725D0 001724D0 4A000424 */  addiu      $4, $0, 0x4A
/* 725D4 001724D4 FFFF0524 */  addiu      $5, $0, -0x1
/* 725D8 001724D8 28360070 */  paddub     $6, $0, $0
/* 725DC 001724DC AC69050C */  jal        SndSePlay__Fiii
/* 725E0 001724E0 00000000 */   nop
/* 725E4 001724E4 01000224 */  addiu      $2, $0, 0x1
/* 725E8 001724E8 608F82AF */  sw         $2, -0x70A0($gp)
.L001724EC:
/* 725EC 001724EC BE11040C */  jal        rand
/* 725F0 001724F0 00000000 */   nop
/* 725F4 001724F4 C8000324 */  addiu      $3, $0, 0xC8
/* 725F8 001724F8 1A004300 */  div        $0, $2, $3
/* 725FC 001724FC 00000000 */  nop
/* 72600 00172500 00000000 */  nop
/* 72604 00172504 10100000 */  mfhi       $2
/* 72608 00172508 0A004224 */  addiu      $2, $2, 0xA
/* 7260C 0017250C 648F82AF */  sw         $2, -0x709C($gp)
.L00172510:
/* 72610 00172510 02000224 */  addiu      $2, $0, 0x2
/* 72614 00172514 B00002A6 */  sh         $2, 0xB0($16)
.L00172518:
/* 72618 00172518 5C8F828F */  lw         $2, -0x70A4($gp)
/* 7261C 0017251C FFFF4224 */  addiu      $2, $2, -0x1
/* 72620 00172520 5C8F82AF */  sw         $2, -0x70A4($gp)
/* 72624 00172524 648F828F */  lw         $2, -0x709C($gp)
/* 72628 00172528 FFFF4224 */  addiu      $2, $2, -0x1
/* 7262C 0017252C 648F82AF */  sw         $2, -0x709C($gp)
/* 72630 00172530 281E0070 */  paddub     $3, $0, $0
/* 72634 00172534 1E000010 */  b          .L001725B0
/* 72638 00172538 00000000 */   nop
.L0017253C:
/* 7263C 0017253C 28260070 */  paddub     $4, $0, $0
/* 72640 00172540 17000010 */  b          .L001725A0
/* 72644 00172544 00000000 */   nop
.L00172548:
/* 72648 00172548 00310300 */  sll        $6, $3, 4
/* 7264C 0017254C D201023C */  lui        $2, %hi(thd_color)
/* 72650 00172550 C0994224 */  addiu      $2, $2, %lo(thd_color)
/* 72654 00172554 21104600 */  addu       $2, $2, $6
/* 72658 00172558 80280400 */  sll        $5, $4, 2
/* 7265C 0017255C 2138A200 */  addu       $7, $5, $2
/* 72660 00172560 0000E1C4 */  lwc1       $f1, 0x0($7)
/* 72664 00172564 C040023C */  lui        $2, (0x40C00000 >> 16)
/* 72668 00172568 00008244 */  mtc1       $2, $f0
/* 7266C 0017256C 00000000 */  nop
/* 72670 00172570 01080046 */  sub.s      $f0, $f1, $f0
/* 72674 00172574 0000E0E4 */  swc1       $f0, 0x0($7)
/* 72678 00172578 2110DD00 */  addu       $2, $6, $sp
/* 7267C 0017257C 2110A200 */  addu       $2, $5, $2
/* 72680 00172580 200041C4 */  lwc1       $f1, 0x20($2)
/* 72684 00172584 0000E0C4 */  lwc1       $f0, 0x0($7)
/* 72688 00172588 34000146 */  c.lt.s     $f0, $f1
/* 7268C 0017258C 00000000 */  nop
/* 72690 00172590 02000045 */  bc1f       .L0017259C
/* 72694 00172594 00000000 */   nop
/* 72698 00172598 0000E1E4 */  swc1       $f1, 0x0($7)
.L0017259C:
/* 7269C 0017259C 01008424 */  addiu      $4, $4, 0x1
.L001725A0:
/* 726A0 001725A0 03008228 */  slti       $2, $4, 0x3
/* 726A4 001725A4 E8FF4014 */  bnez       $2, .L00172548
/* 726A8 001725A8 00000000 */   nop
/* 726AC 001725AC 01006324 */  addiu      $3, $3, 0x1
.L001725B0:
/* 726B0 001725B0 02006228 */  slti       $2, $3, 0x2
/* 726B4 001725B4 E1FF4014 */  bnez       $2, .L0017253C
/* 726B8 001725B8 00000000 */   nop
/* 726BC 001725BC 6000A427 */  addiu      $4, $sp, 0x60
/* 726C0 001725C0 D201023C */  lui        $2, %hi(thd_color)
/* 726C4 001725C4 C0994524 */  addiu      $5, $2, %lo(thd_color)
/* 726C8 001725C8 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* 726CC 001725CC 00000000 */   nop
.L001725D0:
/* 726D0 001725D0 1000BF7B */  lq         $31, 0x10($sp)
/* 726D4 001725D4 0000B07B */  lq         $16, 0x0($sp)
/* 726D8 001725D8 A000BD27 */  addiu      $sp, $sp, 0xA0
/* 726DC 001725DC 0800E003 */  jr         $31
/* 726E0 001725E0 00000000 */   nop
/* 726E4 001725E4 00000000 */  nop
/* 726E8 001725E8 00000000 */  nop
/* 726EC 001725EC 00000000 */  nop
