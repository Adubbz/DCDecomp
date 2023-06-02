.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawBattleMain__Fv
/* F4660 001F4560 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* F4664 001F4564 2000BF7F */  sq         $31, 0x20($sp)
/* F4668 001F4568 1000B17F */  sq         $17, 0x10($sp)
/* F466C 001F456C 0000B07F */  sq         $16, 0x0($sp)
/* F4670 001F4570 5C95848F */  lw         $4, -0x6AA4($gp)
/* F4674 001F4574 5000A527 */  addiu      $5, $sp, 0x50
/* F4678 001F4578 44D0070C */  jal        GetMenuIconPos__FiPi
/* F467C 001F457C 00000000 */   nop
/* F4680 001F4580 5000A28F */  lw         $2, 0x50($sp)
/* F4684 001F4584 D4FF4224 */  addiu      $2, $2, -0x2C
/* F4688 001F4588 5400A0C7 */  lwc1       $f0, 0x54($sp)
/* F468C 001F458C 00088244 */  mtc1       $2, $f1
/* F4690 001F4590 00000000 */  nop
/* F4694 001F4594 60088046 */  cvt.s.w    $f1, $f1
/* F4698 001F4598 D901013C */  lui        $at, (0x1D90460 >> 16)
/* F469C 001F459C 600423C4 */  lwc1       $f3, (0x1D90460 & 0xFFFF)($at)
/* F46A0 001F45A0 41080346 */  sub.s      $f1, $f1, $f3
/* F46A4 001F45A4 8040023C */  lui        $2, (0x40800000 >> 16)
/* F46A8 001F45A8 00108244 */  mtc1       $2, $f2
/* F46AC 001F45AC 00000000 */  nop
/* F46B0 001F45B0 43080246 */  div.s      $f1, $f1, $f2
/* F46B4 001F45B4 40180146 */  add.s      $f1, $f3, $f1
/* F46B8 001F45B8 D901013C */  lui        $at, (0x1D90460 >> 16)
/* F46BC 001F45BC 600421E4 */  swc1       $f1, (0x1D90460 & 0xFFFF)($at)
/* F46C0 001F45C0 20008046 */  cvt.s.w    $f0, $f0
/* F46C4 001F45C4 D901013C */  lui        $at, (0x1D90464 >> 16)
/* F46C8 001F45C8 640421C4 */  lwc1       $f1, (0x1D90464 & 0xFFFF)($at)
/* F46CC 001F45CC 01000146 */  sub.s      $f0, $f0, $f1
/* F46D0 001F45D0 03000246 */  div.s      $f0, $f0, $f2
/* F46D4 001F45D4 00080046 */  add.s      $f0, $f1, $f0
/* F46D8 001F45D8 D901013C */  lui        $at, (0x1D90464 >> 16)
/* F46DC 001F45DC 640420E4 */  swc1       $f0, (0x1D90464 & 0xFFFF)($at)
/* F46E0 001F45E0 28D0070C */  jal        GetMenuModeMax__Fv
/* F46E4 001F45E4 00000000 */   nop
/* F46E8 001F45E8 3000A427 */  addiu      $4, $sp, 0x30
/* F46EC 001F45EC D894858F */  lw         $5, -0x6B28($gp)
/* F46F0 001F45F0 58D0070C */  jal        BtlMenuMekeIconInfo__FPii
/* F46F4 001F45F4 00000000 */   nop
/* F46F8 001F45F8 5C95828F */  lw         $2, -0x6AA4($gp)
/* F46FC 001F45FC 80100200 */  sll        $2, $2, 2
/* F4700 001F4600 21105D00 */  addu       $2, $2, $sp
/* F4704 001F4604 3000448C */  lw         $4, 0x30($2)
/* F4708 001F4608 D0B7080C */  jal        GetMenuIconInfo__Fi
/* F470C 001F460C 00000000 */   nop
/* F4710 001F4610 28864070 */  paddub     $16, $2, $0
/* F4714 001F4614 24005184 */  lh         $17, 0x24($2)
/* F4718 001F4618 5C95838F */  lw         $3, -0x6AA4($gp)
/* F471C 001F461C 04000224 */  addiu      $2, $0, 0x4
/* F4720 001F4620 2A006214 */  bne        $3, $2, .L001F46CC
/* F4724 001F4624 00000000 */   nop
/* F4728 001F4628 D894848F */  lw         $4, -0x6B28($gp)
/* F472C 001F462C B02F080C */  jal        NowGetGameFlagForBtlMenu__Fi
/* F4730 001F4630 00000000 */   nop
/* F4734 001F4634 02000324 */  addiu      $3, $0, 0x2
/* F4738 001F4638 23004310 */  beq        $2, $3, .L001F46C8
/* F473C 001F463C 00000000 */   nop
/* F4740 001F4640 01000324 */  addiu      $3, $0, 0x1
/* F4744 001F4644 1D004310 */  beq        $2, $3, .L001F46BC
/* F4748 001F4648 00000000 */   nop
/* F474C 001F464C 0A000324 */  addiu      $3, $0, 0xA
/* F4750 001F4650 17004310 */  beq        $2, $3, .L001F46B0
/* F4754 001F4654 00000000 */   nop
/* F4758 001F4658 0B000324 */  addiu      $3, $0, 0xB
/* F475C 001F465C 11004310 */  beq        $2, $3, .L001F46A4
/* F4760 001F4660 00000000 */   nop
/* F4764 001F4664 03004010 */  beqz       $2, .L001F4674
/* F4768 001F4668 00000000 */   nop
/* F476C 001F466C 17000010 */  b          .L001F46CC
/* F4770 001F4670 00000000 */   nop
.L001F4674:
/* F4774 001F4674 5800A327 */  addiu      $3, $sp, 0x58
/* F4778 001F4678 388880C7 */  lwc1       $f0, -0x77C8($gp)
/* F477C 001F467C 3C888287 */  lh         $2, -0x77C4($gp)
/* F4780 001F4680 000060E4 */  swc1       $f0, 0x0($3)
/* F4784 001F4684 040062A4 */  sh         $2, 0x4($3)
/* F4788 001F4688 ECCF070C */  jal        GetEscapeDngFlag__Fv
/* F478C 001F468C 00000000 */   nop
/* F4790 001F4690 40100200 */  sll        $2, $2, 1
/* F4794 001F4694 21105D00 */  addu       $2, $2, $sp
/* F4798 001F4698 58005184 */  lh         $17, 0x58($2)
/* F479C 001F469C 0B000010 */  b          .L001F46CC
/* F47A0 001F46A0 00000000 */   nop
.L001F46A4:
/* F47A4 001F46A4 1D001124 */  addiu      $17, $0, 0x1D
/* F47A8 001F46A8 08000010 */  b          .L001F46CC
/* F47AC 001F46AC 00000000 */   nop
.L001F46B0:
/* F47B0 001F46B0 12001124 */  addiu      $17, $0, 0x12
/* F47B4 001F46B4 05000010 */  b          .L001F46CC
/* F47B8 001F46B8 00000000 */   nop
.L001F46BC:
/* F47BC 001F46BC 11001124 */  addiu      $17, $0, 0x11
/* F47C0 001F46C0 02000010 */  b          .L001F46CC
/* F47C4 001F46C4 00000000 */   nop
.L001F46C8:
/* F47C8 001F46C8 13001124 */  addiu      $17, $0, 0x13
.L001F46CC:
/* F47CC 001F46CC DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* F47D0 001F46D0 0C3A228C */  lw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* F47D4 001F46D4 06005110 */  beq        $2, $17, .L001F46F0
/* F47D8 001F46D8 00000000 */   nop
/* F47DC 001F46DC DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* F47E0 001F46E0 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* F47E4 001F46E4 282E2072 */  paddub     $5, $17, $0
/* F47E8 001F46E8 5441050C */  jal        MakeMesWin__6ClsMesFi
/* F47EC 001F46EC 00000000 */   nop
.L001F46F0:
/* F47F0 001F46F0 D894828F */  lw         $2, -0x6B28($gp)
/* F47F4 001F46F4 2F004014 */  bnez       $2, .L001F47B4
/* F47F8 001F46F8 00000000 */   nop
/* F47FC 001F46FC 3CD1070C */  jal        GetLimmitMsg__Fv
/* F4800 001F4700 00000000 */   nop
/* F4804 001F4704 288E4070 */  paddub     $17, $2, $0
/* F4808 001F4708 DA01013C */  lui        $at, (0x1DA224C >> 16)
/* F480C 001F470C 4C22228C */  lw         $2, (0x1DA224C & 0xFFFF)($at)
/* F4810 001F4710 06005110 */  beq        $2, $17, .L001F472C
/* F4814 001F4714 00000000 */   nop
/* F4818 001F4718 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* F481C 001F471C 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* F4820 001F4720 282E2072 */  paddub     $5, $17, $0
/* F4824 001F4724 5441050C */  jal        MakeMesWin__6ClsMesFi
/* F4828 001F4728 00000000 */   nop
.L001F472C:
/* F482C 001F472C 21002006 */  bltz       $17, .L001F47B4
/* F4830 001F4730 00000000 */   nop
/* F4834 001F4734 DA01013C */  lui        $at, (0x1DA22DC >> 16)
/* F4838 001F4738 DC22248C */  lw         $4, (0x1DA22DC & 0xFFFF)($at)
/* F483C 001F473C 38B4080C */  jal        MenuTextureReload__Fi
/* F4840 001F4740 00000000 */   nop
/* F4844 001F4744 1C88828F */  lw         $2, -0x77E4($gp)
/* F4848 001F4748 09004018 */  blez       $2, .L001F4770
/* F484C 001F474C 00000000 */   nop
/* F4850 001F4750 44000224 */  addiu      $2, $0, 0x44
/* F4854 001F4754 DA01013C */  lui        $at, (0x1DA0B90 >> 16)
/* F4858 001F4758 900B22AC */  sw         $2, (0x1DA0B90 & 0xFFFF)($at)
/* F485C 001F475C 56010224 */  addiu      $2, $0, 0x156
/* F4860 001F4760 DA01013C */  lui        $at, (0x1DA0B94 >> 16)
/* F4864 001F4764 940B22AC */  sw         $2, (0x1DA0B94 & 0xFFFF)($at)
/* F4868 001F4768 07000010 */  b          .L001F4788
/* F486C 001F476C 00000000 */   nop
.L001F4770:
/* F4870 001F4770 50000224 */  addiu      $2, $0, 0x50
/* F4874 001F4774 DA01013C */  lui        $at, (0x1DA0B90 >> 16)
/* F4878 001F4778 900B22AC */  sw         $2, (0x1DA0B90 & 0xFFFF)($at)
/* F487C 001F477C 4A010224 */  addiu      $2, $0, 0x14A
/* F4880 001F4780 DA01013C */  lui        $at, (0x1DA0B94 >> 16)
/* F4884 001F4784 940B22AC */  sw         $2, (0x1DA0B94 & 0xFFFF)($at)
.L001F4788:
/* F4888 001F4788 01000224 */  addiu      $2, $0, 0x1
/* F488C 001F478C DA01013C */  lui        $at, (0x1DA0C28 >> 16)
/* F4890 001F4790 280C22AC */  sw         $2, (0x1DA0C28 & 0xFFFF)($at)
/* F4894 001F4794 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* F4898 001F4798 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* F489C 001F479C 6437050C */  jal        Step__6ClsMesFv
/* F48A0 001F47A0 00000000 */   nop
/* F48A4 001F47A4 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* F48A8 001F47A8 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* F48AC 001F47AC C44C050C */  jal        DrawMesWin__6ClsMesFv
/* F48B0 001F47B0 00000000 */   nop
.L001F47B4:
/* F48B4 001F47B4 1C00028E */  lw         $2, 0x1C($16)
/* F48B8 001F47B8 4A004424 */  addiu      $4, $2, 0x4A
/* F48BC 001F47BC 5C95828F */  lw         $2, -0x6AA4($gp)
/* F48C0 001F47C0 C0180200 */  sll        $3, $2, 3
/* F48C4 001F47C4 D901023C */  lui        $2, %hi(D_1D90424)
/* F48C8 001F47C8 24044224 */  addiu      $2, $2, %lo(D_1D90424)
/* F48CC 001F47CC 21104300 */  addu       $2, $2, $3
/* F48D0 001F47D0 000041C4 */  lwc1       $f1, 0x0($2)
/* F48D4 001F47D4 0041023C */  lui        $2, (0x41000000 >> 16)
/* F48D8 001F47D8 00008244 */  mtc1       $2, $f0
/* F48DC 001F47DC 00000000 */  nop
/* F48E0 001F47E0 410B0046 */  sub.s      $f13, $f1, $f0
/* F48E4 001F47E4 D901023C */  lui        $2, %hi(NorMenuIcon)
/* F48E8 001F47E8 20044224 */  addiu      $2, $2, %lo(NorMenuIcon)
/* F48EC 001F47EC 21104300 */  addu       $2, $2, $3
/* F48F0 001F47F0 000041C4 */  lwc1       $f1, 0x0($2)
/* F48F4 001F47F4 9041023C */  lui        $2, (0x41900000 >> 16)
/* F48F8 001F47F8 00008244 */  mtc1       $2, $f0
/* F48FC 001F47FC 00000000 */  nop
/* F4900 001F4800 010B0046 */  sub.s      $f12, $f1, $f0
/* F4904 001F4804 22000524 */  addiu      $5, $0, 0x22
/* F4908 001F4808 28360070 */  paddub     $6, $0, $0
/* F490C 001F480C A096878F */  lw         $7, -0x6960($gp)
/* F4910 001F4810 80000824 */  addiu      $8, $0, 0x80
/* F4914 001F4814 C05E080C */  jal        DrawMenuWaku__FffiiiP8CTexturei
/* F4918 001F4818 00000000 */   nop
/* F491C 001F481C D901013C */  lui        $at, (0x1D90460 >> 16)
/* F4920 001F4820 60042CC4 */  lwc1       $f12, (0x1D90460 & 0xFFFF)($at)
/* F4924 001F4824 2C44040C */  jal        fptosi
/* F4928 001F4828 00000000 */   nop
/* F492C 001F482C 28864070 */  paddub     $16, $2, $0
/* F4930 001F4830 D901013C */  lui        $at, (0x1D90464 >> 16)
/* F4934 001F4834 64042CC4 */  lwc1       $f12, (0x1D90464 & 0xFFFF)($at)
/* F4938 001F4838 2C44040C */  jal        fptosi
/* F493C 001F483C 00000000 */   nop
/* F4940 001F4840 28260072 */  paddub     $4, $16, $0
/* F4944 001F4844 282E4070 */  paddub     $5, $2, $0
/* F4948 001F4848 01000624 */  addiu      $6, $0, 0x1
/* F494C 001F484C 40000724 */  addiu      $7, $0, 0x40
/* F4950 001F4850 D05B080C */  jal        DrawMenuObjectVibe__Fiiii
/* F4954 001F4854 00000000 */   nop
/* F4958 001F4858 2000BF7B */  lq         $31, 0x20($sp)
/* F495C 001F485C 1000B17B */  lq         $17, 0x10($sp)
/* F4960 001F4860 0000B07B */  lq         $16, 0x0($sp)
/* F4964 001F4864 6000BD27 */  addiu      $sp, $sp, 0x60
/* F4968 001F4868 0800E003 */  jr         $31
/* F496C 001F486C 00000000 */   nop
