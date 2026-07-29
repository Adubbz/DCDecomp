.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleActionPlay_Ruby__FP10CCharacteri
/* 011650 01DBD350 70FFBD27 */  addiu       $29, $29, -0x90
/* 011654 01DBD354 4000BF7F */  sq          $31, 0x40($29)
/* 011658 01DBD358 3000B27F */  sq          $18, 0x30($29)
/* 01165C 01DBD35C 2000B17F */  sq          $17, 0x20($29)
/* 011660 01DBD360 1000B07F */  sq          $16, 0x10($29)
/* 011664 01DBD364 0000B4E7 */  swc1        $f20, 0x0($29)
/* 011668 01DBD368 28968070 */  paddub      $18, $4, $0
/* 01166C 01DBD36C 288EA070 */  paddub      $17, $5, $0
/* 011670 01DBD370 F00294C4 */  lwc1        $f20, 0x2F0($4)
/* 011674 01DBD374 049D838F */  lw          $3, -0x62FC($28)
/* 011678 01DBD378 16007080 */  lb          $16, 0x16($3)
/* 01167C 01DBD37C DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 011680 01DBD380 9444248C */  lw          $4, %lo(BtActStatus + 0x14)($1)
/* 011684 01DBD384 0B000324 */  addiu       $3, $0, 0xB
/* 011688 01DBD388 CD008314 */  bne         $4, $3, .L01DBD6C0_2F8CC0
/* 01168C 01DBD38C 00000000 */   nop
/* 011690 01DBD390 CC01023C */  lui         $2, %hi(GamePad)
/* 011694 01DBD394 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 011698 01DBD398 9C9C858F */  lw          $5, -0x6364($28)
/* 01169C 01DBD39C 04AE040C */  jal         On__8CGamePadFi
/* 0116A0 01DBD3A0 00000000 */   nop
/* 0116A4 01DBD3A4 04004014 */  bnez        $2, .L01DBD3B8_2F89B8
/* 0116A8 01DBD3A8 00000000 */   nop
/* 0116AC 01DBD3AC 01000324 */  addiu       $3, $0, 0x1
/* 0116B0 01DBD3B0 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 0116B4 01DBD3B4 984423AC */  sw          $3, %lo(BtActStatus + 0x18)($1)
.L01DBD3B8_2F89B8:
/* 0116B8 01DBD3B8 0B000324 */  addiu       $3, $0, 0xB
/* 0116BC 01DBD3BC DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0116C0 01DBD3C0 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
/* 0116C4 01DBD3C4 FFFF0324 */  addiu       $3, $0, -0x1
/* 0116C8 01DBD3C8 A49C83AF */  sw          $3, -0x635C($28)
/* 0116CC 01DBD3CC 51002016 */  bnez        $17, .L01DBD514_2F8B14
/* 0116D0 01DBD3D0 00000000 */   nop
/* 0116D4 01DBD3D4 FC42033C */  lui         $3, (0x42FC0000 >> 16)
/* 0116D8 01DBD3D8 00008344 */  mtc1        $3, $f0
/* 0116DC 01DBD3DC 00000000 */  nop
/* 0116E0 01DBD3E0 34A00046 */  c.lt.s      $f20, $f0
/* 0116E4 01DBD3E4 00000000 */  nop
/* 0116E8 01DBD3E8 25000145 */  bc1t        .L01DBD480_2F8A80
/* 0116EC 01DBD3EC 00000000 */   nop
/* 0116F0 01DBD3F0 E48480C7 */  lwc1        $f0, -0x7B1C($28)
/* 0116F4 01DBD3F4 34A00046 */  c.lt.s      $f20, $f0
/* 0116F8 01DBD3F8 00000000 */  nop
/* 0116FC 01DBD3FC 20000045 */  bc1f        .L01DBD480_2F8A80
/* 011700 01DBD400 00000000 */   nop
/* 011704 01DBD404 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 011708 01DBD408 9844238C */  lw          $3, %lo(BtActStatus + 0x18)($1)
/* 01170C 01DBD40C 1C006014 */  bnez        $3, .L01DBD480_2F8A80
/* 011710 01DBD410 00000000 */   nop
/* 011714 01DBD414 0E000224 */  addiu       $2, $0, 0xE
/* 011718 01DBD418 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 01171C 01DBD41C 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 011720 01DBD420 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 011724 01DBD424 944422AC */  sw          $2, %lo(BtActStatus + 0x14)($1)
/* 011728 01DBD428 DC01013C */  lui         $1, %hi(BtActStatus + 0x1C)
/* 01172C 01DBD42C 9C4420AC */  sw          $0, %lo(BtActStatus + 0x1C)($1)
/* 011730 01DBD430 BC00448E */  lw          $4, 0xBC($18)
/* 011734 01DBD434 DC01023C */  lui         $2, %hi(LIT_5627)
/* 011738 01DBD438 90334524 */  addiu       $5, $2, %lo(LIT_5627)
/* 01173C 01DBD43C C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 011740 01DBD440 00000000 */   nop
/* 011744 01DBD444 FC9C848F */  lw          $4, -0x6304($28)
/* 011748 01DBD448 5000A527 */  addiu       $5, $29, 0x50
/* 01174C 01DBD44C 6000A627 */  addiu       $6, $29, 0x60
/* 011750 01DBD450 03000724 */  addiu       $7, $0, 0x3
/* 011754 01DBD454 28460072 */  paddub      $8, $16, $0
/* 011758 01DBD458 284E0070 */  paddub      $9, $0, $0
/* 01175C 01DBD45C 28564070 */  paddub      $10, $2, $0
/* 011760 01DBD460 285E0070 */  paddub      $11, $0, $0
/* 011764 01DBD464 58B7060C */  jal         Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* 011768 01DBD468 00000000 */   nop
/* 01176C 01DBD46C A49C82AF */  sw          $2, -0x635C($28)
/* 011770 01DBD470 FC9C848F */  lw          $4, -0x6304($28)
/* 011774 01DBD474 01000524 */  addiu       $5, $0, 0x1
/* 011778 01DBD478 48B7060C */  jal         SetLoop__12CSHOT_EFFECTFi
/* 01177C 01DBD47C 00000000 */   nop
.L01DBD480_2F8A80:
/* 011780 01DBD480 0043033C */  lui         $3, (0x43000000 >> 16)
/* 011784 01DBD484 00008344 */  mtc1        $3, $f0
/* 011788 01DBD488 00000000 */  nop
/* 01178C 01DBD48C 34A00046 */  c.lt.s      $f20, $f0
/* 011790 01DBD490 00000000 */  nop
/* 011794 01DBD494 6D000145 */  bc1t        .L01DBD64C_2F8C4C
/* 011798 01DBD498 00000000 */   nop
/* 01179C 01DBD49C E88480C7 */  lwc1        $f0, -0x7B18($28)
/* 0117A0 01DBD4A0 34A00046 */  c.lt.s      $f20, $f0
/* 0117A4 01DBD4A4 00000000 */  nop
/* 0117A8 01DBD4A8 68000045 */  bc1f        .L01DBD64C_2F8C4C
/* 0117AC 01DBD4AC 00000000 */   nop
/* 0117B0 01DBD4B0 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0117B4 01DBD4B4 00608244 */  mtc1        $2, $f12
/* 0117B8 01DBD4B8 28264072 */  paddub      $4, $18, $0
/* 0117BC 01DBD4BC 282E2072 */  paddub      $5, $17, $0
/* 0117C0 01DBD4C0 28360070 */  paddub      $6, $0, $0
/* 0117C4 01DBD4C4 E0F3760C */  jal         BattleActionShotRuby__FP10CCharacterifi
/* 0117C8 01DBD4C8 00000000 */   nop
/* 0117CC 01DBD4CC DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 0117D0 01DBD4D0 604520AC */  sw          $0, %lo(BtActStatus + 0xE0)($1)
/* 0117D4 01DBD4D4 DC838CC7 */  lwc1        $f12, -0x7C24($28)
/* 0117D8 01DBD4D8 28260070 */  paddub      $4, $0, $0
/* 0117DC 01DBD4DC CCE6760C */  jal         SwordDmgCheck1__Ffi
/* 0117E0 01DBD4E0 00000000 */   nop
/* 0117E4 01DBD4E4 90010424 */  addiu       $4, $0, 0x190
/* 0117E8 01DBD4E8 FFFF0524 */  addiu       $5, $0, -0x1
/* 0117EC 01DBD4EC 28360070 */  paddub      $6, $0, $0
/* 0117F0 01DBD4F0 AC69050C */  jal         SndSePlay__Fiii
/* 0117F4 01DBD4F4 00000000 */   nop
/* 0117F8 01DBD4F8 A4010424 */  addiu       $4, $0, 0x1A4
/* 0117FC 01DBD4FC FFFF0524 */  addiu       $5, $0, -0x1
/* 011800 01DBD500 28360070 */  paddub      $6, $0, $0
/* 011804 01DBD504 AC69050C */  jal         SndSePlay__Fiii
/* 011808 01DBD508 00000000 */   nop
/* 01180C 01DBD50C 4F000010 */  b           .L01DBD64C_2F8C4C
/* 011810 01DBD510 00000000 */   nop
.L01DBD514_2F8B14:
/* 011814 01DBD514 FC42033C */  lui         $3, (0x42FC0000 >> 16)
/* 011818 01DBD518 00008344 */  mtc1        $3, $f0
/* 01181C 01DBD51C 00000000 */  nop
/* 011820 01DBD520 34A00046 */  c.lt.s      $f20, $f0
/* 011824 01DBD524 00000000 */  nop
/* 011828 01DBD528 25000145 */  bc1t        .L01DBD5C0_2F8BC0
/* 01182C 01DBD52C 00000000 */   nop
/* 011830 01DBD530 E48480C7 */  lwc1        $f0, -0x7B1C($28)
/* 011834 01DBD534 34A00046 */  c.lt.s      $f20, $f0
/* 011838 01DBD538 00000000 */  nop
/* 01183C 01DBD53C 20000045 */  bc1f        .L01DBD5C0_2F8BC0
/* 011840 01DBD540 00000000 */   nop
/* 011844 01DBD544 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 011848 01DBD548 9844238C */  lw          $3, %lo(BtActStatus + 0x18)($1)
/* 01184C 01DBD54C 1C006014 */  bnez        $3, .L01DBD5C0_2F8BC0
/* 011850 01DBD550 00000000 */   nop
/* 011854 01DBD554 0E000224 */  addiu       $2, $0, 0xE
/* 011858 01DBD558 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 01185C 01DBD55C 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 011860 01DBD560 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 011864 01DBD564 944422AC */  sw          $2, %lo(BtActStatus + 0x14)($1)
/* 011868 01DBD568 DC01013C */  lui         $1, %hi(BtActStatus + 0x1C)
/* 01186C 01DBD56C 9C4420AC */  sw          $0, %lo(BtActStatus + 0x1C)($1)
/* 011870 01DBD570 BC00448E */  lw          $4, 0xBC($18)
/* 011874 01DBD574 DC01023C */  lui         $2, %hi(LIT_5627)
/* 011878 01DBD578 90334524 */  addiu       $5, $2, %lo(LIT_5627)
/* 01187C 01DBD57C C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 011880 01DBD580 00000000 */   nop
/* 011884 01DBD584 FC9C848F */  lw          $4, -0x6304($28)
/* 011888 01DBD588 7000A527 */  addiu       $5, $29, 0x70
/* 01188C 01DBD58C 8000A627 */  addiu       $6, $29, 0x80
/* 011890 01DBD590 03000724 */  addiu       $7, $0, 0x3
/* 011894 01DBD594 28460072 */  paddub      $8, $16, $0
/* 011898 01DBD598 284E0070 */  paddub      $9, $0, $0
/* 01189C 01DBD59C 28564070 */  paddub      $10, $2, $0
/* 0118A0 01DBD5A0 285E0070 */  paddub      $11, $0, $0
/* 0118A4 01DBD5A4 58B7060C */  jal         Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* 0118A8 01DBD5A8 00000000 */   nop
/* 0118AC 01DBD5AC A49C82AF */  sw          $2, -0x635C($28)
/* 0118B0 01DBD5B0 FC9C848F */  lw          $4, -0x6304($28)
/* 0118B4 01DBD5B4 01000524 */  addiu       $5, $0, 0x1
/* 0118B8 01DBD5B8 48B7060C */  jal         SetLoop__12CSHOT_EFFECTFi
/* 0118BC 01DBD5BC 00000000 */   nop
.L01DBD5C0_2F8BC0:
/* 0118C0 01DBD5C0 0043033C */  lui         $3, (0x43000000 >> 16)
/* 0118C4 01DBD5C4 00008344 */  mtc1        $3, $f0
/* 0118C8 01DBD5C8 00000000 */  nop
/* 0118CC 01DBD5CC 34A00046 */  c.lt.s      $f20, $f0
/* 0118D0 01DBD5D0 00000000 */  nop
/* 0118D4 01DBD5D4 1D000145 */  bc1t        .L01DBD64C_2F8C4C
/* 0118D8 01DBD5D8 00000000 */   nop
/* 0118DC 01DBD5DC E88480C7 */  lwc1        $f0, -0x7B18($28)
/* 0118E0 01DBD5E0 34A00046 */  c.lt.s      $f20, $f0
/* 0118E4 01DBD5E4 00000000 */  nop
/* 0118E8 01DBD5E8 18000045 */  bc1f        .L01DBD64C_2F8C4C
/* 0118EC 01DBD5EC 00000000 */   nop
/* 0118F0 01DBD5F0 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0118F4 01DBD5F4 00608244 */  mtc1        $2, $f12
/* 0118F8 01DBD5F8 28264072 */  paddub      $4, $18, $0
/* 0118FC 01DBD5FC 282E2072 */  paddub      $5, $17, $0
/* 011900 01DBD600 28360070 */  paddub      $6, $0, $0
/* 011904 01DBD604 E0F3760C */  jal         BattleActionShotRuby__FP10CCharacterifi
/* 011908 01DBD608 00000000 */   nop
/* 01190C 01DBD60C DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 011910 01DBD610 604520AC */  sw          $0, %lo(BtActStatus + 0xE0)($1)
/* 011914 01DBD614 DC838CC7 */  lwc1        $f12, -0x7C24($28)
/* 011918 01DBD618 28260070 */  paddub      $4, $0, $0
/* 01191C 01DBD61C CCE6760C */  jal         SwordDmgCheck1__Ffi
/* 011920 01DBD620 00000000 */   nop
/* 011924 01DBD624 90010424 */  addiu       $4, $0, 0x190
/* 011928 01DBD628 FFFF0524 */  addiu       $5, $0, -0x1
/* 01192C 01DBD62C 28360070 */  paddub      $6, $0, $0
/* 011930 01DBD630 AC69050C */  jal         SndSePlay__Fiii
/* 011934 01DBD634 00000000 */   nop
/* 011938 01DBD638 A4010424 */  addiu       $4, $0, 0x1A4
/* 01193C 01DBD63C FFFF0524 */  addiu       $5, $0, -0x1
/* 011940 01DBD640 28360070 */  paddub      $6, $0, $0
/* 011944 01DBD644 AC69050C */  jal         SndSePlay__Fiii
/* 011948 01DBD648 00000000 */   nop
.L01DBD64C_2F8C4C:
/* 01194C 01DBD64C 4403438E */  lw          $3, 0x344($18)
/* 011950 01DBD650 B40060C4 */  lwc1        $f0, 0xB4($3)
/* 011954 01DBD654 60008046 */  cvt.s.w     $f1, $f0
/* 011958 01DBD658 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 01195C 01DBD65C 00008344 */  mtc1        $3, $f0
/* 011960 01DBD660 00000000 */  nop
/* 011964 01DBD664 01080046 */  sub.s       $f0, $f1, $f0
/* 011968 01DBD668 34A00046 */  c.lt.s      $f20, $f0
/* 01196C 01DBD66C 00000000 */  nop
/* 011970 01DBD670 13000145 */  bc1t        .L01DBD6C0_2F8CC0
/* 011974 01DBD674 00000000 */   nop
/* 011978 01DBD678 36A00146 */  c.le.s      $f20, $f1
/* 01197C 01DBD67C 00000000 */  nop
/* 011980 01DBD680 0F000045 */  bc1f        .L01DBD6C0_2F8CC0
/* 011984 01DBD684 00000000 */   nop
/* 011988 01DBD688 DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 01198C 01DBD68C A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 011990 01DBD690 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 011994 01DBD694 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 011998 01DBD698 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 01199C 01DBD69C 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 0119A0 01DBD6A0 989D838F */  lw          $3, -0x6268($28)
/* 0119A4 01DBD6A4 06006010 */  beqz        $3, .L01DBD6C0_2F8CC0
/* 0119A8 01DBD6A8 00000000 */   nop
/* 0119AC 01DBD6AC 04002016 */  bnez        $17, .L01DBD6C0_2F8CC0
/* 0119B0 01DBD6B0 00000000 */   nop
/* 0119B4 01DBD6B4 12000324 */  addiu       $3, $0, 0x12
/* 0119B8 01DBD6B8 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0119BC 01DBD6BC 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
.L01DBD6C0_2F8CC0:
/* 0119C0 01DBD6C0 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 0119C4 01DBD6C4 9444248C */  lw          $4, %lo(BtActStatus + 0x14)($1)
/* 0119C8 01DBD6C8 0E000324 */  addiu       $3, $0, 0xE
/* 0119CC 01DBD6CC 48008314 */  bne         $4, $3, .L01DBD7F0_2F8DF0
/* 0119D0 01DBD6D0 00000000 */   nop
/* 0119D4 01DBD6D4 CC01023C */  lui         $2, %hi(GamePad)
/* 0119D8 01DBD6D8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0119DC 01DBD6DC 9C9C858F */  lw          $5, -0x6364($28)
/* 0119E0 01DBD6E0 04AE040C */  jal         On__8CGamePadFi
/* 0119E4 01DBD6E4 00000000 */   nop
/* 0119E8 01DBD6E8 04004014 */  bnez        $2, .L01DBD6FC_2F8CFC
/* 0119EC 01DBD6EC 00000000 */   nop
/* 0119F0 01DBD6F0 01000224 */  addiu       $2, $0, 0x1
/* 0119F4 01DBD6F4 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 0119F8 01DBD6F8 984422AC */  sw          $2, %lo(BtActStatus + 0x18)($1)
.L01DBD6FC_2F8CFC:
/* 0119FC 01DBD6FC 0E000224 */  addiu       $2, $0, 0xE
/* 011A00 01DBD700 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 011A04 01DBD704 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 011A08 01DBD708 93010424 */  addiu       $4, $0, 0x193
/* 011A0C 01DBD70C 05000524 */  addiu       $5, $0, 0x5
/* 011A10 01DBD710 28360070 */  paddub      $6, $0, $0
/* 011A14 01DBD714 C86B050C */  jal         SndSeSeqPlayStop__Fiii
/* 011A18 01DBD718 00000000 */   nop
/* 011A1C 01DBD71C DC01013C */  lui         $1, %hi(BtActStatus + 0x1C)
/* 011A20 01DBD720 9C4421C4 */  lwc1        $f1, %lo(BtActStatus + 0x1C)($1)
/* 011A24 01DBD724 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 011A28 01DBD728 00008344 */  mtc1        $3, $f0
/* 011A2C 01DBD72C 00000000 */  nop
/* 011A30 01DBD730 40080046 */  add.s       $f1, $f1, $f0
/* 011A34 01DBD734 DC01013C */  lui         $1, %hi(BtActStatus + 0x1C)
/* 011A38 01DBD738 9C4421E4 */  swc1        $f1, %lo(BtActStatus + 0x1C)($1)
/* 011A3C 01DBD73C 7042033C */  lui         $3, (0x42700000 >> 16)
/* 011A40 01DBD740 00008344 */  mtc1        $3, $f0
/* 011A44 01DBD744 00000000 */  nop
/* 011A48 01DBD748 34080046 */  c.lt.s      $f1, $f0
/* 011A4C 01DBD74C 00000000 */  nop
/* 011A50 01DBD750 03000145 */  bc1t        .L01DBD760_2F8D60
/* 011A54 01DBD754 00000000 */   nop
/* 011A58 01DBD758 DC01013C */  lui         $1, %hi(BtActStatus + 0x1C)
/* 011A5C 01DBD75C 9C4423AC */  sw          $3, %lo(BtActStatus + 0x1C)($1)
.L01DBD760_2F8D60:
/* 011A60 01DBD760 DC01013C */  lui         $1, %hi(BtActStatus + 0x1C)
/* 011A64 01DBD764 9C4421C4 */  lwc1        $f1, %lo(BtActStatus + 0x1C)($1)
/* 011A68 01DBD768 6842033C */  lui         $3, (0x42680000 >> 16)
/* 011A6C 01DBD76C 00008344 */  mtc1        $3, $f0
/* 011A70 01DBD770 00000000 */  nop
/* 011A74 01DBD774 34080046 */  c.lt.s      $f1, $f0
/* 011A78 01DBD778 00000000 */  nop
/* 011A7C 01DBD77C 13000145 */  bc1t        .L01DBD7CC_2F8DCC
/* 011A80 01DBD780 00000000 */   nop
/* 011A84 01DBD784 6A42033C */  lui         $3, (0x426A0000 >> 16)
/* 011A88 01DBD788 00008344 */  mtc1        $3, $f0
/* 011A8C 01DBD78C 00000000 */  nop
/* 011A90 01DBD790 34080046 */  c.lt.s      $f1, $f0
/* 011A94 01DBD794 00000000 */  nop
/* 011A98 01DBD798 0C000045 */  bc1f        .L01DBD7CC_2F8DCC
/* 011A9C 01DBD79C 00000000 */   nop
/* 011AA0 01DBD7A0 7041023C */  lui         $2, (0x41700000 >> 16)
/* 011AA4 01DBD7A4 00608244 */  mtc1        $2, $f12
/* 011AA8 01DBD7A8 F442023C */  lui         $2, (0x42F40000 >> 16)
/* 011AAC 01DBD7AC 00788244 */  mtc1        $2, $f15
/* 011AB0 01DBD7B0 5043023C */  lui         $2, (0x43500000 >> 16)
/* 011AB4 01DBD7B4 00808244 */  mtc1        $2, $f16
/* 011AB8 01DBD7B8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 011ABC 01DBD7BC 00688244 */  mtc1        $2, $f13
/* 011AC0 01DBD7C0 00708044 */  mtc1        $0, $f14
/* 011AC4 01DBD7C4 0004770C */  jal         setUnitAmbientAnime__Ffffff
/* 011AC8 01DBD7C8 00000000 */   nop
.L01DBD7CC_2F8DCC:
/* 011ACC 01DBD7CC DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 011AD0 01DBD7D0 9844238C */  lw          $3, %lo(BtActStatus + 0x18)($1)
/* 011AD4 01DBD7D4 06006010 */  beqz        $3, .L01DBD7F0_2F8DF0
/* 011AD8 01DBD7D8 00000000 */   nop
/* 011ADC 01DBD7DC 10000324 */  addiu       $3, $0, 0x10
/* 011AE0 01DBD7E0 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 011AE4 01DBD7E4 944423AC */  sw          $3, %lo(BtActStatus + 0x14)($1)
/* 011AE8 01DBD7E8 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 011AEC 01DBD7EC C84420AC */  sw          $0, %lo(BtActStatus + 0x48)($1)
.L01DBD7F0_2F8DF0:
/* 011AF0 01DBD7F0 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 011AF4 01DBD7F4 9444248C */  lw          $4, %lo(BtActStatus + 0x14)($1)
/* 011AF8 01DBD7F8 10000324 */  addiu       $3, $0, 0x10
/* 011AFC 01DBD7FC C8008314 */  bne         $4, $3, .L01DBDB20_2F9120
/* 011B00 01DBD800 00000000 */   nop
/* 011B04 01DBD804 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 011B08 01DBD808 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
/* 011B0C 01DBD80C DC01013C */  lui         $1, %hi(BtActStatus + 0x1C)
/* 011B10 01DBD810 9C4421C4 */  lwc1        $f1, %lo(BtActStatus + 0x1C)($1)
/* 011B14 01DBD814 7042033C */  lui         $3, (0x42700000 >> 16)
/* 011B18 01DBD818 00008344 */  mtc1        $3, $f0
/* 011B1C 01DBD81C 00000000 */  nop
/* 011B20 01DBD820 34080046 */  c.lt.s      $f1, $f0
/* 011B24 01DBD824 00000000 */  nop
/* 011B28 01DBD828 6C000145 */  bc1t        .L01DBD9DC_2F8FDC
/* 011B2C 01DBD82C 00000000 */   nop
/* 011B30 01DBD830 5843033C */  lui         $3, (0x43580000 >> 16)
/* 011B34 01DBD834 00008344 */  mtc1        $3, $f0
/* 011B38 01DBD838 00000000 */  nop
/* 011B3C 01DBD83C 34A00046 */  c.lt.s      $f20, $f0
/* 011B40 01DBD840 00000000 */  nop
/* 011B44 01DBD844 0F000145 */  bc1t        .L01DBD884_2F8E84
/* 011B48 01DBD848 00000000 */   nop
/* 011B4C 01DBD84C EC8480C7 */  lwc1        $f0, -0x7B14($28)
/* 011B50 01DBD850 34A00046 */  c.lt.s      $f20, $f0
/* 011B54 01DBD854 00000000 */  nop
/* 011B58 01DBD858 0A000045 */  bc1f        .L01DBD884_2F8E84
/* 011B5C 01DBD85C 00000000 */   nop
/* 011B60 01DBD860 A49C858F */  lw          $5, -0x635C($28)
/* 011B64 01DBD864 FFFF0324 */  addiu       $3, $0, -0x1
/* 011B68 01DBD868 0600A310 */  beq         $5, $3, .L01DBD884_2F8E84
/* 011B6C 01DBD86C 00000000 */   nop
/* 011B70 01DBD870 FC9C848F */  lw          $4, -0x6304($28)
/* 011B74 01DBD874 04B3060C */  jal         OffEffect__12CSHOT_EFFECTFi
/* 011B78 01DBD878 00000000 */   nop
/* 011B7C 01DBD87C FFFF0324 */  addiu       $3, $0, -0x1
/* 011B80 01DBD880 A49C83AF */  sw          $3, -0x635C($28)
.L01DBD884_2F8E84:
/* 011B84 01DBD884 2B002016 */  bnez        $17, .L01DBD934_2F8F34
/* 011B88 01DBD888 00000000 */   nop
/* 011B8C 01DBD88C 5843033C */  lui         $3, (0x43580000 >> 16)
/* 011B90 01DBD890 00008344 */  mtc1        $3, $f0
/* 011B94 01DBD894 00000000 */  nop
/* 011B98 01DBD898 34A00046 */  c.lt.s      $f20, $f0
/* 011B9C 01DBD89C 00000000 */  nop
/* 011BA0 01DBD8A0 82000145 */  bc1t        .L01DBDAAC_2F90AC
/* 011BA4 01DBD8A4 00000000 */   nop
/* 011BA8 01DBD8A8 F08480C7 */  lwc1        $f0, -0x7B10($28)
/* 011BAC 01DBD8AC 34A00046 */  c.lt.s      $f20, $f0
/* 011BB0 01DBD8B0 00000000 */  nop
/* 011BB4 01DBD8B4 7D000045 */  bc1f        .L01DBDAAC_2F90AC
/* 011BB8 01DBD8B8 00000000 */   nop
/* 011BBC 01DBD8BC 28264072 */  paddub      $4, $18, $0
/* 011BC0 01DBD8C0 282E2072 */  paddub      $5, $17, $0
/* 011BC4 01DBD8C4 DC828CC7 */  lwc1        $f12, -0x7D24($28)
/* 011BC8 01DBD8C8 28360070 */  paddub      $6, $0, $0
/* 011BCC 01DBD8CC E0F3760C */  jal         BattleActionShotRuby__FP10CCharacterifi
/* 011BD0 01DBD8D0 00000000 */   nop
/* 011BD4 01DBD8D4 28264072 */  paddub      $4, $18, $0
/* 011BD8 01DBD8D8 282E2072 */  paddub      $5, $17, $0
/* 011BDC 01DBD8DC DC828CC7 */  lwc1        $f12, -0x7D24($28)
/* 011BE0 01DBD8E0 01000624 */  addiu       $6, $0, 0x1
/* 011BE4 01DBD8E4 E0F3760C */  jal         BattleActionShotRuby__FP10CCharacterifi
/* 011BE8 01DBD8E8 00000000 */   nop
/* 011BEC 01DBD8EC DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 011BF0 01DBD8F0 604520AC */  sw          $0, %lo(BtActStatus + 0xE0)($1)
/* 011BF4 01DBD8F4 84848CC7 */  lwc1        $f12, -0x7B7C($28)
/* 011BF8 01DBD8F8 28260070 */  paddub      $4, $0, $0
/* 011BFC 01DBD8FC CCE6760C */  jal         SwordDmgCheck1__Ffi
/* 011C00 01DBD900 00000000 */   nop
/* 011C04 01DBD904 90010424 */  addiu       $4, $0, 0x190
/* 011C08 01DBD908 FFFF0524 */  addiu       $5, $0, -0x1
/* 011C0C 01DBD90C 28360070 */  paddub      $6, $0, $0
/* 011C10 01DBD910 AC69050C */  jal         SndSePlay__Fiii
/* 011C14 01DBD914 00000000 */   nop
/* 011C18 01DBD918 A6010424 */  addiu       $4, $0, 0x1A6
/* 011C1C 01DBD91C FFFF0524 */  addiu       $5, $0, -0x1
/* 011C20 01DBD920 28360070 */  paddub      $6, $0, $0
/* 011C24 01DBD924 AC69050C */  jal         SndSePlay__Fiii
/* 011C28 01DBD928 00000000 */   nop
/* 011C2C 01DBD92C 5F000010 */  b           .L01DBDAAC_2F90AC
/* 011C30 01DBD930 00000000 */   nop
.L01DBD934_2F8F34:
/* 011C34 01DBD934 5843033C */  lui         $3, (0x43580000 >> 16)
/* 011C38 01DBD938 00008344 */  mtc1        $3, $f0
/* 011C3C 01DBD93C 00000000 */  nop
/* 011C40 01DBD940 34A00046 */  c.lt.s      $f20, $f0
/* 011C44 01DBD944 00000000 */  nop
/* 011C48 01DBD948 58000145 */  bc1t        .L01DBDAAC_2F90AC
/* 011C4C 01DBD94C 00000000 */   nop
/* 011C50 01DBD950 F48480C7 */  lwc1        $f0, -0x7B0C($28)
/* 011C54 01DBD954 34A00046 */  c.lt.s      $f20, $f0
/* 011C58 01DBD958 00000000 */  nop
/* 011C5C 01DBD95C 53000045 */  bc1f        .L01DBDAAC_2F90AC
/* 011C60 01DBD960 00000000 */   nop
/* 011C64 01DBD964 28264072 */  paddub      $4, $18, $0
/* 011C68 01DBD968 282E2072 */  paddub      $5, $17, $0
/* 011C6C 01DBD96C DC828CC7 */  lwc1        $f12, -0x7D24($28)
/* 011C70 01DBD970 28360070 */  paddub      $6, $0, $0
/* 011C74 01DBD974 E0F3760C */  jal         BattleActionShotRuby__FP10CCharacterifi
/* 011C78 01DBD978 00000000 */   nop
/* 011C7C 01DBD97C 28264072 */  paddub      $4, $18, $0
/* 011C80 01DBD980 282E2072 */  paddub      $5, $17, $0
/* 011C84 01DBD984 DC828CC7 */  lwc1        $f12, -0x7D24($28)
/* 011C88 01DBD988 01000624 */  addiu       $6, $0, 0x1
/* 011C8C 01DBD98C E0F3760C */  jal         BattleActionShotRuby__FP10CCharacterifi
/* 011C90 01DBD990 00000000 */   nop
/* 011C94 01DBD994 DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 011C98 01DBD998 604520AC */  sw          $0, %lo(BtActStatus + 0xE0)($1)
/* 011C9C 01DBD99C 84848CC7 */  lwc1        $f12, -0x7B7C($28)
/* 011CA0 01DBD9A0 28260070 */  paddub      $4, $0, $0
/* 011CA4 01DBD9A4 CCE6760C */  jal         SwordDmgCheck1__Ffi
/* 011CA8 01DBD9A8 00000000 */   nop
/* 011CAC 01DBD9AC 90010424 */  addiu       $4, $0, 0x190
/* 011CB0 01DBD9B0 FFFF0524 */  addiu       $5, $0, -0x1
/* 011CB4 01DBD9B4 28360070 */  paddub      $6, $0, $0
/* 011CB8 01DBD9B8 AC69050C */  jal         SndSePlay__Fiii
/* 011CBC 01DBD9BC 00000000 */   nop
/* 011CC0 01DBD9C0 A6010424 */  addiu       $4, $0, 0x1A6
/* 011CC4 01DBD9C4 FFFF0524 */  addiu       $5, $0, -0x1
/* 011CC8 01DBD9C8 28360070 */  paddub      $6, $0, $0
/* 011CCC 01DBD9CC AC69050C */  jal         SndSePlay__Fiii
/* 011CD0 01DBD9D0 00000000 */   nop
/* 011CD4 01DBD9D4 35000010 */  b           .L01DBDAAC_2F90AC
/* 011CD8 01DBD9D8 00000000 */   nop
.L01DBD9DC_2F8FDC:
/* 011CDC 01DBD9DC F88480C7 */  lwc1        $f0, -0x7B08($28)
/* 011CE0 01DBD9E0 34A00046 */  c.lt.s      $f20, $f0
/* 011CE4 01DBD9E4 00000000 */  nop
/* 011CE8 01DBD9E8 0F000145 */  bc1t        .L01DBDA28_2F9028
/* 011CEC 01DBD9EC 00000000 */   nop
/* 011CF0 01DBD9F0 EC8480C7 */  lwc1        $f0, -0x7B14($28)
/* 011CF4 01DBD9F4 34A00046 */  c.lt.s      $f20, $f0
/* 011CF8 01DBD9F8 00000000 */  nop
/* 011CFC 01DBD9FC 0A000045 */  bc1f        .L01DBDA28_2F9028
/* 011D00 01DBDA00 00000000 */   nop
/* 011D04 01DBDA04 A49C858F */  lw          $5, -0x635C($28)
/* 011D08 01DBDA08 FFFF0324 */  addiu       $3, $0, -0x1
/* 011D0C 01DBDA0C 0600A310 */  beq         $5, $3, .L01DBDA28_2F9028
/* 011D10 01DBDA10 00000000 */   nop
/* 011D14 01DBDA14 FC9C848F */  lw          $4, -0x6304($28)
/* 011D18 01DBDA18 04B3060C */  jal         OffEffect__12CSHOT_EFFECTFi
/* 011D1C 01DBDA1C 00000000 */   nop
/* 011D20 01DBDA20 FFFF0324 */  addiu       $3, $0, -0x1
/* 011D24 01DBDA24 A49C83AF */  sw          $3, -0x635C($28)
.L01DBDA28_2F9028:
/* 011D28 01DBDA28 F88480C7 */  lwc1        $f0, -0x7B08($28)
/* 011D2C 01DBDA2C 34A00046 */  c.lt.s      $f20, $f0
/* 011D30 01DBDA30 00000000 */  nop
/* 011D34 01DBDA34 1D000145 */  bc1t        .L01DBDAAC_2F90AC
/* 011D38 01DBDA38 00000000 */   nop
/* 011D3C 01DBDA3C FC8480C7 */  lwc1        $f0, -0x7B04($28)
/* 011D40 01DBDA40 34A00046 */  c.lt.s      $f20, $f0
/* 011D44 01DBDA44 00000000 */  nop
/* 011D48 01DBDA48 18000045 */  bc1f        .L01DBDAAC_2F90AC
/* 011D4C 01DBDA4C 00000000 */   nop
/* 011D50 01DBDA50 C03F023C */  lui         $2, (0x3FC00000 >> 16)
/* 011D54 01DBDA54 00608244 */  mtc1        $2, $f12
/* 011D58 01DBDA58 28264072 */  paddub      $4, $18, $0
/* 011D5C 01DBDA5C 282E2072 */  paddub      $5, $17, $0
/* 011D60 01DBDA60 28360070 */  paddub      $6, $0, $0
/* 011D64 01DBDA64 E0F3760C */  jal         BattleActionShotRuby__FP10CCharacterifi
/* 011D68 01DBDA68 00000000 */   nop
/* 011D6C 01DBDA6C DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 011D70 01DBDA70 604520AC */  sw          $0, %lo(BtActStatus + 0xE0)($1)
/* 011D74 01DBDA74 08838CC7 */  lwc1        $f12, -0x7CF8($28)
/* 011D78 01DBDA78 28260070 */  paddub      $4, $0, $0
/* 011D7C 01DBDA7C CCE6760C */  jal         SwordDmgCheck1__Ffi
/* 011D80 01DBDA80 00000000 */   nop
/* 011D84 01DBDA84 90010424 */  addiu       $4, $0, 0x190
/* 011D88 01DBDA88 FFFF0524 */  addiu       $5, $0, -0x1
/* 011D8C 01DBDA8C 28360070 */  paddub      $6, $0, $0
/* 011D90 01DBDA90 AC69050C */  jal         SndSePlay__Fiii
/* 011D94 01DBDA94 00000000 */   nop
/* 011D98 01DBDA98 A6010424 */  addiu       $4, $0, 0x1A6
/* 011D9C 01DBDA9C FFFF0524 */  addiu       $5, $0, -0x1
/* 011DA0 01DBDAA0 28360070 */  paddub      $6, $0, $0
/* 011DA4 01DBDAA4 AC69050C */  jal         SndSePlay__Fiii
/* 011DA8 01DBDAA8 00000000 */   nop
.L01DBDAAC_2F90AC:
/* 011DAC 01DBDAAC 4403438E */  lw          $3, 0x344($18)
/* 011DB0 01DBDAB0 040160C4 */  lwc1        $f0, 0x104($3)
/* 011DB4 01DBDAB4 60008046 */  cvt.s.w     $f1, $f0
/* 011DB8 01DBDAB8 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 011DBC 01DBDABC 00008344 */  mtc1        $3, $f0
/* 011DC0 01DBDAC0 00000000 */  nop
/* 011DC4 01DBDAC4 01080046 */  sub.s       $f0, $f1, $f0
/* 011DC8 01DBDAC8 34A00046 */  c.lt.s      $f20, $f0
/* 011DCC 01DBDACC 00000000 */  nop
/* 011DD0 01DBDAD0 13000145 */  bc1t        .L01DBDB20_2F9120
/* 011DD4 01DBDAD4 00000000 */   nop
/* 011DD8 01DBDAD8 36A00146 */  c.le.s      $f20, $f1
/* 011DDC 01DBDADC 00000000 */  nop
/* 011DE0 01DBDAE0 0F000045 */  bc1f        .L01DBDB20_2F9120
/* 011DE4 01DBDAE4 00000000 */   nop
/* 011DE8 01DBDAE8 DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 011DEC 01DBDAEC A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 011DF0 01DBDAF0 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 011DF4 01DBDAF4 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 011DF8 01DBDAF8 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 011DFC 01DBDAFC 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 011E00 01DBDB00 989D838F */  lw          $3, -0x6268($28)
/* 011E04 01DBDB04 06006010 */  beqz        $3, .L01DBDB20_2F9120
/* 011E08 01DBDB08 00000000 */   nop
/* 011E0C 01DBDB0C 04002016 */  bnez        $17, .L01DBDB20_2F9120
/* 011E10 01DBDB10 00000000 */   nop
/* 011E14 01DBDB14 12000324 */  addiu       $3, $0, 0x12
/* 011E18 01DBDB18 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 011E1C 01DBDB1C 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
.L01DBDB20_2F9120:
/* 011E20 01DBDB20 4000BF7B */  lq          $31, 0x40($29)
/* 011E24 01DBDB24 3000B27B */  lq          $18, 0x30($29)
/* 011E28 01DBDB28 2000B17B */  lq          $17, 0x20($29)
/* 011E2C 01DBDB2C 1000B07B */  lq          $16, 0x10($29)
/* 011E30 01DBDB30 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 011E34 01DBDB34 9000BD27 */  addiu       $29, $29, 0x90
/* 011E38 01DBDB38 0800E003 */  jr          $31
/* 011E3C 01DBDB3C 00000000 */   nop
