.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleActionDrink__Fv
/* 010900 01DBC600 C0FFBD27 */  addiu       $29, $29, -0x40
/* 010904 01DBC604 1000BF7F */  sq          $31, 0x10($29)
/* 010908 01DBC608 0400B5E7 */  swc1        $f21, 0x4($29)
/* 01090C 01DBC60C 0000B4E7 */  swc1        $f20, 0x0($29)
/* 010910 01DBC610 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 010914 01DBC614 9044248C */  lw          $4, %lo(BtActStatus + 0x10)($1)
/* 010918 01DBC618 03000324 */  addiu       $3, $0, 0x3
/* 01091C 01DBC61C 97008314 */  bne         $4, $3, .L01DBC87C_2F7E7C
/* 010920 01DBC620 00000000 */   nop
/* 010924 01DBC624 DC01033C */  lui         $3, %hi(LIT_5631)
/* 010928 01DBC628 A0286324 */  addiu       $3, $3, %lo(LIT_5631)
/* 01092C 01DBC62C 2000A527 */  addiu       $5, $29, 0x20
/* 010930 01DBC630 00006478 */  lq          $4, 0x0($3)
/* 010934 01DBC634 100063DC */  ld          $3, 0x10($3)
/* 010938 01DBC638 0000A47C */  sq          $4, 0x0($5)
/* 01093C 01DBC63C 1000A3FC */  sd          $3, 0x10($5)
/* 010940 01DBC640 1C000324 */  addiu       $3, $0, 0x1C
/* 010944 01DBC644 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 010948 01DBC648 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
/* 01094C 01DBC64C 789C838F */  lw          $3, -0x6388($28)
/* 010950 01DBC650 04006380 */  lb          $3, 0x4($3)
/* 010954 01DBC654 80180300 */  sll         $3, $3, 2
/* 010958 01DBC658 21187D00 */  addu        $3, $3, $29
/* 01095C 01DBC65C 200074C4 */  lwc1        $f20, 0x20($3)
/* 010960 01DBC660 EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 010964 01DBC664 102035C4 */  lwc1        $f21, %lo(CharaMain + 0x2F0)($1)
/* 010968 01DBC668 34A81446 */  c.lt.s      $f21, $f20
/* 01096C 01DBC66C 00000000 */  nop
/* 010970 01DBC670 0C000145 */  bc1t        .L01DBC6A4_2F7CA4
/* 010974 01DBC674 00000000 */   nop
/* 010978 01DBC678 908280C7 */  lwc1        $f0, -0x7D70($28)
/* 01097C 01DBC67C 00001446 */  add.s       $f0, $f0, $f20
/* 010980 01DBC680 34A80046 */  c.lt.s      $f21, $f0
/* 010984 01DBC684 00000000 */  nop
/* 010988 01DBC688 06000045 */  bc1f        .L01DBC6A4_2F7CA4
/* 01098C 01DBC68C 00000000 */   nop
/* 010990 01DBC690 97000424 */  addiu       $4, $0, 0x97
/* 010994 01DBC694 FFFF0524 */  addiu       $5, $0, -0x1
/* 010998 01DBC698 28360070 */  paddub      $6, $0, $0
/* 01099C 01DBC69C AC69050C */  jal         SndSePlay__Fiii
/* 0109A0 01DBC6A0 00000000 */   nop
.L01DBC6A4_2F7CA4:
/* 0109A4 01DBC6A4 2041033C */  lui         $3, (0x41200000 >> 16)
/* 0109A8 01DBC6A8 00008344 */  mtc1        $3, $f0
/* 0109AC 01DBC6AC 00000000 */  nop
/* 0109B0 01DBC6B0 00001446 */  add.s       $f0, $f0, $f20
/* 0109B4 01DBC6B4 34A80046 */  c.lt.s      $f21, $f0
/* 0109B8 01DBC6B8 00000000 */  nop
/* 0109BC 01DBC6BC 17000145 */  bc1t        .L01DBC71C_2F7D1C
/* 0109C0 01DBC6C0 00000000 */   nop
/* 0109C4 01DBC6C4 248580C7 */  lwc1        $f0, -0x7ADC($28)
/* 0109C8 01DBC6C8 00001446 */  add.s       $f0, $f0, $f20
/* 0109CC 01DBC6CC 34A80046 */  c.lt.s      $f21, $f0
/* 0109D0 01DBC6D0 00000000 */  nop
/* 0109D4 01DBC6D4 11000045 */  bc1f        .L01DBC71C_2F7D1C
/* 0109D8 01DBC6D8 00000000 */   nop
/* 0109DC 01DBC6DC 8042023C */  lui         $2, (0x42800000 >> 16)
/* 0109E0 01DBC6E0 00608244 */  mtc1        $2, $f12
/* 0109E4 01DBC6E4 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0109E8 01DBC6E8 00688244 */  mtc1        $2, $f13
/* 0109EC 01DBC6EC F442023C */  lui         $2, (0x42F40000 >> 16)
/* 0109F0 01DBC6F0 00788244 */  mtc1        $2, $f15
/* 0109F4 01DBC6F4 5043023C */  lui         $2, (0x43500000 >> 16)
/* 0109F8 01DBC6F8 00808244 */  mtc1        $2, $f16
/* 0109FC 01DBC6FC 00708044 */  mtc1        $0, $f14
/* 010A00 01DBC700 0004770C */  jal         setUnitAmbientAnime__Ffffff
/* 010A04 01DBC704 00000000 */   nop
/* 010A08 01DBC708 13000424 */  addiu       $4, $0, 0x13
/* 010A0C 01DBC70C FFFF0524 */  addiu       $5, $0, -0x1
/* 010A10 01DBC710 28360070 */  paddub      $6, $0, $0
/* 010A14 01DBC714 AC69050C */  jal         SndSePlay__Fiii
/* 010A18 01DBC718 00000000 */   nop
.L01DBC71C_2F7D1C:
/* 010A1C 01DBC71C EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 010A20 01DBC720 6420238C */  lw          $3, %lo(CharaMain + 0x344)($1)
/* 010A24 01DBC724 C40160C4 */  lwc1        $f0, 0x1C4($3)
/* 010A28 01DBC728 60008046 */  cvt.s.w     $f1, $f0
/* 010A2C 01DBC72C EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 010A30 01DBC730 102022C4 */  lwc1        $f2, %lo(CharaMain + 0x2F0)($1)
/* 010A34 01DBC734 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 010A38 01DBC738 00008344 */  mtc1        $3, $f0
/* 010A3C 01DBC73C 00000000 */  nop
/* 010A40 01DBC740 01080046 */  sub.s       $f0, $f1, $f0
/* 010A44 01DBC744 34100046 */  c.lt.s      $f2, $f0
/* 010A48 01DBC748 00000000 */  nop
/* 010A4C 01DBC74C 4B000145 */  bc1t        .L01DBC87C_2F7E7C
/* 010A50 01DBC750 00000000 */   nop
/* 010A54 01DBC754 36100146 */  c.le.s      $f2, $f1
/* 010A58 01DBC758 00000000 */  nop
/* 010A5C 01DBC75C 47000045 */  bc1f        .L01DBC87C_2F7E7C
/* 010A60 01DBC760 00000000 */   nop
/* 010A64 01DBC764 EC01013C */  lui         $1, %hi(activeItem)
/* 010A68 01DBC768 7078228C */  lw          $2, %lo(activeItem)($1)
/* 010A6C 01DBC76C 80180200 */  sll         $3, $2, 2
/* 010A70 01DBC770 EC01023C */  lui         $2, %hi(activeItem + 0x4)
/* 010A74 01DBC774 74784224 */  addiu       $2, $2, %lo(activeItem + 0x4)
/* 010A78 01DBC778 21104300 */  addu        $2, $2, $3
/* 010A7C 01DBC77C 0000458C */  lw          $5, 0x0($2)
/* 010A80 01DBC780 789C848F */  lw          $4, -0x6388($28)
/* 010A84 01DBC784 BC55070C */  jal         usedActiveItem__FP11CUserStatusi
/* 010A88 01DBC788 00000000 */   nop
/* 010A8C 01DBC78C 789C828F */  lw          $2, -0x6388($28)
/* 010A90 01DBC790 60434524 */  addiu       $5, $2, 0x4360
/* 010A94 01DBC794 A89D828F */  lw          $2, -0x6258($28)
/* 010A98 01DBC798 40100200 */  sll         $2, $2, 1
/* 010A9C 01DBC79C 21204500 */  addu        $4, $2, $5
/* 010AA0 01DBC7A0 06008624 */  addiu       $6, $4, 0x6
/* 010AA4 01DBC7A4 06008384 */  lh          $3, 0x6($4)
/* 010AA8 01DBC7A8 01000224 */  addiu       $2, $0, 0x1
/* 010AAC 01DBC7AC 09006214 */  bne         $3, $2, .L01DBC7D4_2F7DD4
/* 010AB0 01DBC7B0 00000000 */   nop
/* 010AB4 01DBC7B4 FFFF0224 */  addiu       $2, $0, -0x1
/* 010AB8 01DBC7B8 000082A4 */  sh          $2, 0x0($4)
/* 010ABC 01DBC7BC A89D828F */  lw          $2, -0x6258($28)
/* 010AC0 01DBC7C0 40100200 */  sll         $2, $2, 1
/* 010AC4 01DBC7C4 21104500 */  addu        $2, $2, $5
/* 010AC8 01DBC7C8 060040A4 */  sh          $0, 0x6($2)
/* 010ACC 01DBC7CC 04000010 */  b           .L01DBC7E0_2F7DE0
/* 010AD0 01DBC7D0 00000000 */   nop
.L01DBC7D4_2F7DD4:
/* 010AD4 01DBC7D4 0000C284 */  lh          $2, 0x0($6)
/* 010AD8 01DBC7D8 FFFF4224 */  addiu       $2, $2, -0x1
/* 010ADC 01DBC7DC 0000C2A4 */  sh          $2, 0x0($6)
.L01DBC7E0_2F7DE0:
/* 010AE0 01DBC7E0 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 010AE4 01DBC7E4 A478258C */  lw          $5, %lo(activeItem + 0x34)($1)
/* 010AE8 01DBC7E8 FFFF0224 */  addiu       $2, $0, -0x1
/* 010AEC 01DBC7EC 0500A210 */  beq         $5, $2, .L01DBC804_2F7E04
/* 010AF0 01DBC7F0 00000000 */   nop
/* 010AF4 01DBC7F4 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 010AF8 01DBC7F8 A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 010AFC 01DBC7FC DC51070C */  jal         DeleteModel__14CMainItemModelFi
/* 010B00 01DBC800 00000000 */   nop
.L01DBC804_2F7E04:
/* 010B04 01DBC804 FFFF0524 */  addiu       $5, $0, -0x1
/* 010B08 01DBC808 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 010B0C 01DBC80C A47825AC */  sw          $5, %lo(activeItem + 0x34)($1)
/* 010B10 01DBC810 B8010424 */  addiu       $4, $0, 0x1B8
/* 010B14 01DBC814 28360070 */  paddub      $6, $0, $0
/* 010B18 01DBC818 AC69050C */  jal         SndSePlay__Fiii
/* 010B1C 01DBC81C 00000000 */   nop
/* 010B20 01DBC820 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 010B24 01DBC824 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 010B28 01DBC828 01000324 */  addiu       $3, $0, 0x1
/* 010B2C 01DBC82C DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 010B30 01DBC830 E44423A4 */  sh          $3, %lo(BtActStatus + 0x64)($1)
/* 010B34 01DBC834 7C9D83AF */  sw          $3, -0x6284($28)
/* 010B38 01DBC838 DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 010B3C 01DBC83C F04420AC */  sw          $0, %lo(BtActStatus + 0x70)($1)
/* 010B40 01DBC840 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 010B44 01DBC844 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 010B48 01DBC848 EC9C80AF */  sw          $0, -0x6314($28)
/* 010B4C 01DBC84C E49C80AF */  sw          $0, -0x631C($28)
/* 010B50 01DBC850 FFFF0324 */  addiu       $3, $0, -0x1
/* 010B54 01DBC854 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 010B58 01DBC858 B47623AC */  sw          $3, %lo(DngMessMan + 0x24)($1)
/* 010B5C 01DBC85C EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 010B60 01DBC860 947620AC */  sw          $0, %lo(DngMessMan + 0x4)($1)
/* 010B64 01DBC864 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 010B68 01DBC868 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 010B6C 01DBC86C EA01013C */  lui         $1, %hi(DngMessMan + 0x20)
/* 010B70 01DBC870 B07620AC */  sw          $0, %lo(DngMessMan + 0x20)($1)
/* 010B74 01DBC874 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 010B78 01DBC878 987620AC */  sw          $0, %lo(DngMessMan + 0x8)($1)
.L01DBC87C_2F7E7C:
/* 010B7C 01DBC87C 1000BF7B */  lq          $31, 0x10($29)
/* 010B80 01DBC880 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 010B84 01DBC884 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 010B88 01DBC888 4000BD27 */  addiu       $29, $29, 0x40
/* 010B8C 01DBC88C 0800E003 */  jr          $31
/* 010B90 01DBC890 00000000 */   nop
/* 010B94 01DBC894 00000000 */  nop
/* 010B98 01DBC898 00000000 */  nop
/* 010B9C 01DBC89C 00000000 */  nop
