.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel motionDrive__Fv
/* 00B750 01DB7450 60FFBD27 */  addiu       $29, $29, -0xA0
/* 00B754 01DB7454 4000BF7F */  sq          $31, 0x40($29)
/* 00B758 01DB7458 3000B27F */  sq          $18, 0x30($29)
/* 00B75C 01DB745C 2000B17F */  sq          $17, 0x20($29)
/* 00B760 01DB7460 1000B07F */  sq          $16, 0x10($29)
/* 00B764 01DB7464 0400B5E7 */  swc1        $f21, 0x4($29)
/* 00B768 01DB7468 0000B4E7 */  swc1        $f20, 0x0($29)
/* 00B76C 01DB746C 789C838F */  lw          $3, -0x6388($28)
/* 00B770 01DB7470 04007080 */  lb          $16, 0x4($3)
/* 00B774 01DB7474 709D838F */  lw          $3, -0x6290($28)
/* 00B778 01DB7478 BA046010 */  beqz        $3, .L01DB8764_2F3D64
/* 00B77C 01DB747C 00000000 */   nop
/* 00B780 01DB7480 189E838F */  lw          $3, -0x61E8($28)
/* 00B784 01DB7484 07006014 */  bnez        $3, .L01DB74A4_2F2AA4
/* 00B788 01DB7488 00000000 */   nop
/* 00B78C 01DB748C 749D838F */  lw          $3, -0x628C($28)
/* 00B790 01DB7490 EC9C828F */  lw          $2, -0x6314($28)
/* 00B794 01DB7494 25286200 */  or          $5, $3, $2
/* 00B798 01DB7498 E09C848F */  lw          $4, -0x6320($28)
/* 00B79C 01DB749C 5075070C */  jal         Step__12CMonstorUnitFi
/* 00B7A0 01DB74A0 00000000 */   nop
.L01DB74A4_2F2AA4:
/* 00B7A4 01DB74A4 DC01013C */  lui         $1, %hi(BtActStatus)
/* 00B7A8 01DB74A8 8044238C */  lw          $3, %lo(BtActStatus)($1)
/* 00B7AC 01DB74AC D4006010 */  beqz        $3, .L01DB7800_2F2E00
/* 00B7B0 01DB74B0 00000000 */   nop
/* 00B7B4 01DB74B4 D401013C */  lui         $1, %hi(EdEventInfo + 0x60)
/* 00B7B8 01DB74B8 30D2238C */  lw          $3, %lo(EdEventInfo + 0x60)($1)
/* 00B7BC 01DB74BC D0006010 */  beqz        $3, .L01DB7800_2F2E00
/* 00B7C0 01DB74C0 00000000 */   nop
/* 00B7C4 01DB74C4 109D828F */  lw          $2, -0x62F0($28)
/* 00B7C8 01DB74C8 5000A427 */  addiu       $4, $29, 0x50
/* 00B7CC 01DB74CC 20024524 */  addiu       $5, $2, 0x220
/* 00B7D0 01DB74D0 0C86040C */  jal         sceVu0CopyVector
/* 00B7D4 01DB74D4 00000000 */   nop
/* 00B7D8 01DB74D8 109D848F */  lw          $4, -0x62F0($28)
/* 00B7DC 01DB74DC 6000A527 */  addiu       $5, $29, 0x60
/* 00B7E0 01DB74E0 8CA3040C */  jal         GetRotation__6CFrameFPf
/* 00B7E4 01DB74E4 00000000 */   nop
/* 00B7E8 01DB74E8 EA01023C */  lui         $2, %hi(CharaMain)
/* 00B7EC 01DB74EC 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00B7F0 01DB74F0 5000A527 */  addiu       $5, $29, 0x50
/* 00B7F4 01DB74F4 38E4040C */  jal         SetPosition__10CCharacterFPf
/* 00B7F8 01DB74F8 00000000 */   nop
/* 00B7FC 01DB74FC EA01023C */  lui         $2, %hi(CharaMain)
/* 00B800 01DB7500 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00B804 01DB7504 6000ACC7 */  lwc1        $f12, 0x60($29)
/* 00B808 01DB7508 6400ADC7 */  lwc1        $f13, 0x64($29)
/* 00B80C 01DB750C 6800AEC7 */  lwc1        $f14, 0x68($29)
/* 00B810 01DB7510 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 00B814 01DB7514 00000000 */   nop
/* 00B818 01DB7518 28260070 */  paddub      $4, $0, $0
/* 00B81C 01DB751C 7C9D828F */  lw          $2, -0x6284($28)
/* 00B820 01DB7520 03004010 */  beqz        $2, .L01DB7530_2F2B30
/* 00B824 01DB7524 00000000 */   nop
/* 00B828 01DB7528 04000424 */  addiu       $4, $0, 0x4
/* 00B82C 01DB752C 7C9D80AF */  sw          $0, -0x6284($28)
.L01DB7530_2F2B30:
/* 00B830 01DB7530 749D828F */  lw          $2, -0x628C($28)
/* 00B834 01DB7534 09004014 */  bnez        $2, .L01DB755C_2F2B5C
/* 00B838 01DB7538 00000000 */   nop
/* 00B83C 01DB753C D401013C */  lui         $1, %hi(EdEventInfo + 0x6C)
/* 00B840 01DB7540 3CD2228C */  lw          $2, %lo(EdEventInfo + 0x6C)($1)
/* 00B844 01DB7544 05004014 */  bnez        $2, .L01DB755C_2F2B5C
/* 00B848 01DB7548 00000000 */   nop
/* 00B84C 01DB754C DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 00B850 01DB7550 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 00B854 01DB7554 16004010 */  beqz        $2, .L01DB75B0_2F2BB0
/* 00B858 01DB7558 00000000 */   nop
.L01DB755C_2F2B5C:
/* 00B85C 01DB755C DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00B860 01DB7560 8C44248C */  lw          $4, %lo(BtActStatus + 0xC)($1)
/* 00B864 01DB7564 EA01013C */  lui         $1, %hi(CharaMain + 0xC68)
/* 00B868 01DB7568 882924AC */  sw          $4, %lo(CharaMain + 0xC68)($1)
/* 00B86C 01DB756C 01000324 */  addiu       $3, $0, 0x1
/* 00B870 01DB7570 EA01013C */  lui         $1, %hi(CharaMain + 0xC64)
/* 00B874 01DB7574 842923AC */  sw          $3, %lo(CharaMain + 0xC64)($1)
/* 00B878 01DB7578 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 00B87C 01DB757C EA01013C */  lui         $1, %hi(CharaMain + 0xC60)
/* 00B880 01DB7580 802922AC */  sw          $2, %lo(CharaMain + 0xC60)($1)
/* 00B884 01DB7584 05000316 */  bne         $16, $3, .L01DB759C_2F2B9C
/* 00B888 01DB7588 00000000 */   nop
/* 00B88C 01DB758C 009D858F */  lw          $5, -0x6300($28)
/* 00B890 01DB7590 680CA4AC */  sw          $4, 0xC68($5)
/* 00B894 01DB7594 640CA3AC */  sw          $3, 0xC64($5)
/* 00B898 01DB7598 600CA2AC */  sw          $2, 0xC60($5)
.L01DB759C_2F2B9C:
/* 00B89C 01DB759C FFFF0224 */  addiu       $2, $0, -0x1
/* 00B8A0 01DB75A0 DC01013C */  lui         $1, %hi(BtActStatus + 0x4)
/* 00B8A4 01DB75A4 844422AC */  sw          $2, %lo(BtActStatus + 0x4)($1)
/* 00B8A8 01DB75A8 19000010 */  b           .L01DB7610_2F2C10
/* 00B8AC 01DB75AC 00000000 */   nop
.L01DB75B0_2F2BB0:
/* 00B8B0 01DB75B0 DC01013C */  lui         $1, %hi(BtActStatus + 0x4)
/* 00B8B4 01DB75B4 8444228C */  lw          $2, %lo(BtActStatus + 0x4)($1)
/* 00B8B8 01DB75B8 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00B8BC 01DB75BC 8C44258C */  lw          $5, %lo(BtActStatus + 0xC)($1)
/* 00B8C0 01DB75C0 13004510 */  beq         $2, $5, .L01DB7610_2F2C10
/* 00B8C4 01DB75C4 00000000 */   nop
/* 00B8C8 01DB75C8 EA01013C */  lui         $1, %hi(CharaMain + 0xC68)
/* 00B8CC 01DB75CC 882925AC */  sw          $5, %lo(CharaMain + 0xC68)($1)
/* 00B8D0 01DB75D0 EA01013C */  lui         $1, %hi(CharaMain + 0xC64)
/* 00B8D4 01DB75D4 842924AC */  sw          $4, %lo(CharaMain + 0xC64)($1)
/* 00B8D8 01DB75D8 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 00B8DC 01DB75DC EA01013C */  lui         $1, %hi(CharaMain + 0xC60)
/* 00B8E0 01DB75E0 802923AC */  sw          $3, %lo(CharaMain + 0xC60)($1)
/* 00B8E4 01DB75E4 01000224 */  addiu       $2, $0, 0x1
/* 00B8E8 01DB75E8 05000216 */  bne         $16, $2, .L01DB7600_2F2C00
/* 00B8EC 01DB75EC 00000000 */   nop
/* 00B8F0 01DB75F0 009D828F */  lw          $2, -0x6300($28)
/* 00B8F4 01DB75F4 680C45AC */  sw          $5, 0xC68($2)
/* 00B8F8 01DB75F8 640C44AC */  sw          $4, 0xC64($2)
/* 00B8FC 01DB75FC 600C43AC */  sw          $3, 0xC60($2)
.L01DB7600_2F2C00:
/* 00B900 01DB7600 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00B904 01DB7604 8C44228C */  lw          $2, %lo(BtActStatus + 0xC)($1)
/* 00B908 01DB7608 DC01013C */  lui         $1, %hi(BtActStatus + 0x4)
/* 00B90C 01DB760C 844422AC */  sw          $2, %lo(BtActStatus + 0x4)($1)
.L01DB7610_2F2C10:
/* 00B910 01DB7610 789C828F */  lw          $2, -0x6388($28)
/* 00B914 01DB7614 04004380 */  lb          $3, 0x4($2)
/* 00B918 01DB7618 05000224 */  addiu       $2, $0, 0x5
/* 00B91C 01DB761C 42006214 */  bne         $3, $2, .L01DB7728_2F2D28
/* 00B920 01DB7620 00000000 */   nop
/* 00B924 01DB7624 EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 00B928 01DB7628 DC1D248C */  lw          $4, %lo(CharaMain + 0xBC)($1)
/* 00B92C 01DB762C DC01023C */  lui         $2, %hi(LIT_4830)
/* 00B930 01DB7630 A0304524 */  addiu       $5, $2, %lo(LIT_4830)
/* 00B934 01DB7634 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00B938 01DB7638 00000000 */   nop
/* 00B93C 01DB763C 288E4070 */  paddub      $17, $2, $0
/* 00B940 01DB7640 EA01013C */  lui         $1, %hi(CharaMain + 0xC0)
/* 00B944 01DB7644 E01D248C */  lw          $4, %lo(CharaMain + 0xC0)($1)
/* 00B948 01DB7648 DC01023C */  lui         $2, %hi(LIT_4831)
/* 00B94C 01DB764C A8304524 */  addiu       $5, $2, %lo(LIT_4831)
/* 00B950 01DB7650 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00B954 01DB7654 00000000 */   nop
/* 00B958 01DB7658 28964070 */  paddub      $18, $2, $0
/* 00B95C 01DB765C 32002012 */  beqz        $17, .L01DB7728_2F2D28
/* 00B960 01DB7660 00000000 */   nop
/* 00B964 01DB7664 889E8283 */  lb          $2, -0x6178($28)
/* 00B968 01DB7668 04004014 */  bnez        $2, .L01DB767C_2F2C7C
/* 00B96C 01DB766C 00000000 */   nop
/* 00B970 01DB7670 849E80AF */  sw          $0, -0x617C($28)
/* 00B974 01DB7674 01000224 */  addiu       $2, $0, 0x1
/* 00B978 01DB7678 889E82A3 */  sb          $2, -0x6178($28)
.L01DB767C_2F2C7C:
/* 00B97C 01DB767C 849E81C7 */  lwc1        $f1, -0x617C($28)
/* 00B980 01DB7680 A08580C7 */  lwc1        $f0, -0x7A60($28)
/* 00B984 01DB7684 40080046 */  add.s       $f1, $f1, $f0
/* 00B988 01DB7688 849E81E7 */  swc1        $f1, -0x617C($28)
/* 00B98C 01DB768C 448480C7 */  lwc1        $f0, -0x7BBC($28)
/* 00B990 01DB7690 34080046 */  c.lt.s      $f1, $f0
/* 00B994 01DB7694 00000000 */  nop
/* 00B998 01DB7698 05000145 */  bc1t        .L01DB76B0_2F2CB0
/* 00B99C 01DB769C 00000000 */   nop
/* 00B9A0 01DB76A0 849E81C7 */  lwc1        $f1, -0x617C($28)
/* 00B9A4 01DB76A4 A48580C7 */  lwc1        $f0, -0x7A5C($28)
/* 00B9A8 01DB76A8 01080046 */  sub.s       $f0, $f1, $f0
/* 00B9AC 01DB76AC 849E80E7 */  swc1        $f0, -0x617C($28)
.L01DB76B0_2F2CB0:
/* 00B9B0 01DB76B0 28262072 */  paddub      $4, $17, $0
/* 00B9B4 01DB76B4 02000524 */  addiu       $5, $0, 0x2
/* 00B9B8 01DB76B8 A0A3040C */  jal         SetRotType__6CFrameFi
/* 00B9BC 01DB76BC 00000000 */   nop
/* 00B9C0 01DB76C0 849E8CC7 */  lwc1        $f12, -0x617C($28)
/* 00B9C4 01DB76C4 F88E040C */  jal         AngleLimit__Ff
/* 00B9C8 01DB76C8 00000000 */   nop
/* 00B9CC 01DB76CC 00608044 */  mtc1        $0, $f12
/* 00B9D0 01DB76D0 00000000 */  nop
/* 00B9D4 01DB76D4 86630046 */  mov.s       $f14, $f12
/* 00B9D8 01DB76D8 28262072 */  paddub      $4, $17, $0
/* 00B9DC 01DB76DC 46030046 */  mov.s       $f13, $f0
/* 00B9E0 01DB76E0 70A3040C */  jal         SetRotation__6CFrameFfff
/* 00B9E4 01DB76E4 00000000 */   nop
/* 00B9E8 01DB76E8 0F004012 */  beqz        $18, .L01DB7728_2F2D28
/* 00B9EC 01DB76EC 00000000 */   nop
/* 00B9F0 01DB76F0 28264072 */  paddub      $4, $18, $0
/* 00B9F4 01DB76F4 02000524 */  addiu       $5, $0, 0x2
/* 00B9F8 01DB76F8 A0A3040C */  jal         SetRotType__6CFrameFi
/* 00B9FC 01DB76FC 00000000 */   nop
/* 00BA00 01DB7700 849E8CC7 */  lwc1        $f12, -0x617C($28)
/* 00BA04 01DB7704 F88E040C */  jal         AngleLimit__Ff
/* 00BA08 01DB7708 00000000 */   nop
/* 00BA0C 01DB770C 00608044 */  mtc1        $0, $f12
/* 00BA10 01DB7710 00000000 */  nop
/* 00BA14 01DB7714 86630046 */  mov.s       $f14, $f12
/* 00BA18 01DB7718 28264072 */  paddub      $4, $18, $0
/* 00BA1C 01DB771C 46030046 */  mov.s       $f13, $f0
/* 00BA20 01DB7720 70A3040C */  jal         SetRotation__6CFrameFfff
/* 00BA24 01DB7724 00000000 */   nop
.L01DB7728_2F2D28:
/* 00BA28 01DB7728 989D828F */  lw          $2, -0x6268($28)
/* 00BA2C 01DB772C 1E004010 */  beqz        $2, .L01DB77A8_2F2DA8
/* 00BA30 01DB7730 00000000 */   nop
/* 00BA34 01DB7734 789C828F */  lw          $2, -0x6388($28)
/* 00BA38 01DB7738 04004380 */  lb          $3, 0x4($2)
/* 00BA3C 01DB773C 01000224 */  addiu       $2, $0, 0x1
/* 00BA40 01DB7740 19006214 */  bne         $3, $2, .L01DB77A8_2F2DA8
/* 00BA44 01DB7744 00000000 */   nop
/* 00BA48 01DB7748 F49C828F */  lw          $2, -0x630C($28)
/* 00BA4C 01DB774C 16004014 */  bnez        $2, .L01DB77A8_2F2DA8
/* 00BA50 01DB7750 00000000 */   nop
/* 00BA54 01DB7754 109D848F */  lw          $4, -0x62F0($28)
/* 00BA58 01DB7758 DC01023C */  lui         $2, %hi(LIT_4833)
/* 00BA5C 01DB775C B0304524 */  addiu       $5, $2, %lo(LIT_4833)
/* 00BA60 01DB7760 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00BA64 01DB7764 00000000 */   nop
/* 00BA68 01DB7768 EA01013C */  lui         $1, %hi(CharaMain + 0x318)
/* 00BA6C 01DB776C 382022AC */  sw          $2, %lo(CharaMain + 0x318)($1)
/* 00BA70 01DB7770 EA01023C */  lui         $2, %hi(CharaMain + 0x320)
/* 00BA74 01DB7774 40204424 */  addiu       $4, $2, %lo(CharaMain + 0x320)
/* 00BA78 01DB7778 DC01023C */  lui         $2, %hi(BtActStatus + 0x80)
/* 00BA7C 01DB777C 00454524 */  addiu       $5, $2, %lo(BtActStatus + 0x80)
/* 00BA80 01DB7780 0C86040C */  jal         sceVu0CopyVector
/* 00BA84 01DB7784 00000000 */   nop
/* 00BA88 01DB7788 01000224 */  addiu       $2, $0, 0x1
/* 00BA8C 01DB778C EA01013C */  lui         $1, %hi(CharaMain + 0x314)
/* 00BA90 01DB7790 342022AC */  sw          $2, %lo(CharaMain + 0x314)($1)
/* 00BA94 01DB7794 02000224 */  addiu       $2, $0, 0x2
/* 00BA98 01DB7798 EA01013C */  lui         $1, %hi(CharaMain + 0x330)
/* 00BA9C 01DB779C 502022AC */  sw          $2, %lo(CharaMain + 0x330)($1)
/* 00BAA0 01DB77A0 03000010 */  b           .L01DB77B0_2F2DB0
/* 00BAA4 01DB77A4 00000000 */   nop
.L01DB77A8_2F2DA8:
/* 00BAA8 01DB77A8 EA01013C */  lui         $1, %hi(CharaMain + 0x314)
/* 00BAAC 01DB77AC 342020AC */  sw          $0, %lo(CharaMain + 0x314)($1)
.L01DB77B0_2F2DB0:
/* 00BAB0 01DB77B0 EA01023C */  lui         $2, %hi(CharaMain)
/* 00BAB4 01DB77B4 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00BAB8 01DB77B8 4CE1040C */  jal         Step__10CCharacterFv
/* 00BABC 01DB77BC 00000000 */   nop
/* 00BAC0 01DB77C0 01000324 */  addiu       $3, $0, 0x1
/* 00BAC4 01DB77C4 06000316 */  bne         $16, $3, .L01DB77E0_2F2DE0
/* 00BAC8 01DB77C8 00000000 */   nop
/* 00BACC 01DB77CC 009D848F */  lw          $4, -0x6300($28)
/* 00BAD0 01DB77D0 A000998C */  lw          $25, 0xA0($4)
/* 00BAD4 01DB77D4 0800398F */  lw          $25, 0x8($25)
/* 00BAD8 01DB77D8 09F82003 */  jalr        $25
/* 00BADC 01DB77DC 00000000 */   nop
.L01DB77E0_2F2DE0:
/* 00BAE0 01DB77E0 DC01013C */  lui         $1, %hi(BtActStatus + 0x54)
/* 00BAE4 01DB77E4 D444238C */  lw          $3, %lo(BtActStatus + 0x54)($1)
/* 00BAE8 01DB77E8 05006010 */  beqz        $3, .L01DB7800_2F2E00
/* 00BAEC 01DB77EC 00000000 */   nop
/* 00BAF0 01DB77F0 EA01023C */  lui         $2, %hi(CharaMain)
/* 00BAF4 01DB77F4 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00BAF8 01DB77F8 24E3040C */  jal         ShadowStep__10CCharacterFv
/* 00BAFC 01DB77FC 00000000 */   nop
.L01DB7800_2F2E00:
/* 00BB00 01DB7800 F49C838F */  lw          $3, -0x630C($28)
/* 00BB04 01DB7804 06006010 */  beqz        $3, .L01DB7820_2F2E20
/* 00BB08 01DB7808 00000000 */   nop
/* 00BB0C 01DB780C 789C838F */  lw          $3, -0x6388($28)
/* 00BB10 01DB7810 04006680 */  lb          $6, 0x4($3)
/* 00BB14 01DB7814 01000324 */  addiu       $3, $0, 0x1
/* 00BB18 01DB7818 0600C310 */  beq         $6, $3, .L01DB7834_2F2E34
/* 00BB1C 01DB781C 00000000 */   nop
.L01DB7820_2F2E20:
/* 00BB20 01DB7820 789C838F */  lw          $3, -0x6388($28)
/* 00BB24 01DB7824 04006680 */  lb          $6, 0x4($3)
/* 00BB28 01DB7828 03000324 */  addiu       $3, $0, 0x3
/* 00BB2C 01DB782C 6400C314 */  bne         $6, $3, .L01DB79C0_2F2FC0
/* 00BB30 01DB7830 00000000 */   nop
.L01DB7834_2F2E34:
/* 00BB34 01DB7834 109D828F */  lw          $2, -0x62F0($28)
/* 00BB38 01DB7838 7000A427 */  addiu       $4, $29, 0x70
/* 00BB3C 01DB783C 20024524 */  addiu       $5, $2, 0x220
/* 00BB40 01DB7840 0C86040C */  jal         sceVu0CopyVector
/* 00BB44 01DB7844 00000000 */   nop
/* 00BB48 01DB7848 789C858F */  lw          $5, -0x6388($28)
/* 00BB4C 01DB784C DC01023C */  lui         $2, %hi(LIT_345__11)
/* 00BB50 01DB7850 401B4224 */  addiu       $2, $2, %lo(LIT_345__11)
/* 00BB54 01DB7854 8000A427 */  addiu       $4, $29, 0x80
/* 00BB58 01DB7858 00004378 */  lq          $3, 0x0($2)
/* 00BB5C 01DB785C 100042DC */  ld          $2, 0x10($2)
/* 00BB60 01DB7860 0000837C */  sq          $3, 0x0($4)
/* 00BB64 01DB7864 100082FC */  sd          $2, 0x10($4)
/* 00BB68 01DB7868 0400A280 */  lb          $2, 0x4($5)
/* 00BB6C 01DB786C 80100200 */  sll         $2, $2, 2
/* 00BB70 01DB7870 21105D00 */  addu        $2, $2, $29
/* 00BB74 01DB7874 800042C4 */  lwc1        $f2, 0x80($2)
/* 00BB78 01DB7878 7400A1C7 */  lwc1        $f1, 0x74($29)
/* 00BB7C 01DB787C 4040023C */  lui         $2, (0x40400000 >> 16)
/* 00BB80 01DB7880 00008244 */  mtc1        $2, $f0
/* 00BB84 01DB7884 00000000 */  nop
/* 00BB88 01DB7888 01100046 */  sub.s       $f0, $f2, $f0
/* 00BB8C 01DB788C 00080046 */  add.s       $f0, $f1, $f0
/* 00BB90 01DB7890 7400A0E7 */  swc1        $f0, 0x74($29)
/* 00BB94 01DB7894 EA01023C */  lui         $2, %hi(CharaHand)
/* 00BB98 01DB7898 D02E4424 */  addiu       $4, $2, %lo(CharaHand)
/* 00BB9C 01DB789C 7000A527 */  addiu       $5, $29, 0x70
/* 00BBA0 01DB78A0 38E4040C */  jal         SetPosition__10CCharacterFPf
/* 00BBA4 01DB78A4 00000000 */   nop
/* 00BBA8 01DB78A8 28260070 */  paddub      $4, $0, $0
/* 00BBAC 01DB78AC 7C9D828F */  lw          $2, -0x6284($28)
/* 00BBB0 01DB78B0 03004010 */  beqz        $2, .L01DB78C0_2F2EC0
/* 00BBB4 01DB78B4 00000000 */   nop
/* 00BBB8 01DB78B8 04000424 */  addiu       $4, $0, 0x4
/* 00BBBC 01DB78BC 7C9D80AF */  sw          $0, -0x6284($28)
.L01DB78C0_2F2EC0:
/* 00BBC0 01DB78C0 749D828F */  lw          $2, -0x628C($28)
/* 00BBC4 01DB78C4 05004014 */  bnez        $2, .L01DB78DC_2F2EDC
/* 00BBC8 01DB78C8 00000000 */   nop
/* 00BBCC 01DB78CC DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 00BBD0 01DB78D0 1845228C */  lw          $2, %lo(BtActStatus + 0x98)($1)
/* 00BBD4 01DB78D4 16004010 */  beqz        $2, .L01DB7930_2F2F30
/* 00BBD8 01DB78D8 00000000 */   nop
.L01DB78DC_2F2EDC:
/* 00BBDC 01DB78DC DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00BBE0 01DB78E0 8C44248C */  lw          $4, %lo(BtActStatus + 0xC)($1)
/* 00BBE4 01DB78E4 EA01013C */  lui         $1, %hi(CharaHand + 0xC68)
/* 00BBE8 01DB78E8 383B24AC */  sw          $4, %lo(CharaHand + 0xC68)($1)
/* 00BBEC 01DB78EC 01000324 */  addiu       $3, $0, 0x1
/* 00BBF0 01DB78F0 EA01013C */  lui         $1, %hi(CharaHand + 0xC64)
/* 00BBF4 01DB78F4 343B23AC */  sw          $3, %lo(CharaHand + 0xC64)($1)
/* 00BBF8 01DB78F8 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 00BBFC 01DB78FC EA01013C */  lui         $1, %hi(CharaHand + 0xC60)
/* 00BC00 01DB7900 303B22AC */  sw          $2, %lo(CharaHand + 0xC60)($1)
/* 00BC04 01DB7904 05000316 */  bne         $16, $3, .L01DB791C_2F2F1C
/* 00BC08 01DB7908 00000000 */   nop
/* 00BC0C 01DB790C 009D858F */  lw          $5, -0x6300($28)
/* 00BC10 01DB7910 680CA4AC */  sw          $4, 0xC68($5)
/* 00BC14 01DB7914 640CA3AC */  sw          $3, 0xC64($5)
/* 00BC18 01DB7918 600CA2AC */  sw          $2, 0xC60($5)
.L01DB791C_2F2F1C:
/* 00BC1C 01DB791C FFFF0224 */  addiu       $2, $0, -0x1
/* 00BC20 01DB7920 DC01013C */  lui         $1, %hi(BtActStatus + 0x8)
/* 00BC24 01DB7924 884422AC */  sw          $2, %lo(BtActStatus + 0x8)($1)
/* 00BC28 01DB7928 19000010 */  b           .L01DB7990_2F2F90
/* 00BC2C 01DB792C 00000000 */   nop
.L01DB7930_2F2F30:
/* 00BC30 01DB7930 DC01013C */  lui         $1, %hi(BtActStatus + 0x8)
/* 00BC34 01DB7934 8844228C */  lw          $2, %lo(BtActStatus + 0x8)($1)
/* 00BC38 01DB7938 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00BC3C 01DB793C 8C44258C */  lw          $5, %lo(BtActStatus + 0xC)($1)
/* 00BC40 01DB7940 13004510 */  beq         $2, $5, .L01DB7990_2F2F90
/* 00BC44 01DB7944 00000000 */   nop
/* 00BC48 01DB7948 EA01013C */  lui         $1, %hi(CharaHand + 0xC68)
/* 00BC4C 01DB794C 383B25AC */  sw          $5, %lo(CharaHand + 0xC68)($1)
/* 00BC50 01DB7950 EA01013C */  lui         $1, %hi(CharaHand + 0xC64)
/* 00BC54 01DB7954 343B24AC */  sw          $4, %lo(CharaHand + 0xC64)($1)
/* 00BC58 01DB7958 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 00BC5C 01DB795C EA01013C */  lui         $1, %hi(CharaHand + 0xC60)
/* 00BC60 01DB7960 303B23AC */  sw          $3, %lo(CharaHand + 0xC60)($1)
/* 00BC64 01DB7964 01000224 */  addiu       $2, $0, 0x1
/* 00BC68 01DB7968 05000216 */  bne         $16, $2, .L01DB7980_2F2F80
/* 00BC6C 01DB796C 00000000 */   nop
/* 00BC70 01DB7970 009D828F */  lw          $2, -0x6300($28)
/* 00BC74 01DB7974 680C45AC */  sw          $5, 0xC68($2)
/* 00BC78 01DB7978 640C44AC */  sw          $4, 0xC64($2)
/* 00BC7C 01DB797C 600C43AC */  sw          $3, 0xC60($2)
.L01DB7980_2F2F80:
/* 00BC80 01DB7980 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00BC84 01DB7984 8C44228C */  lw          $2, %lo(BtActStatus + 0xC)($1)
/* 00BC88 01DB7988 DC01013C */  lui         $1, %hi(BtActStatus + 0x8)
/* 00BC8C 01DB798C 884422AC */  sw          $2, %lo(BtActStatus + 0x8)($1)
.L01DB7990_2F2F90:
/* 00BC90 01DB7990 01000224 */  addiu       $2, $0, 0x1
/* 00BC94 01DB7994 06000216 */  bne         $16, $2, .L01DB79B0_2F2FB0
/* 00BC98 01DB7998 00000000 */   nop
/* 00BC9C 01DB799C 009D848F */  lw          $4, -0x6300($28)
/* 00BCA0 01DB79A0 A000998C */  lw          $25, 0xA0($4)
/* 00BCA4 01DB79A4 0800398F */  lw          $25, 0x8($25)
/* 00BCA8 01DB79A8 09F82003 */  jalr        $25
/* 00BCAC 01DB79AC 00000000 */   nop
.L01DB79B0_2F2FB0:
/* 00BCB0 01DB79B0 EA01023C */  lui         $2, %hi(CharaHand)
/* 00BCB4 01DB79B4 D02E4424 */  addiu       $4, $2, %lo(CharaHand)
/* 00BCB8 01DB79B8 4CE1040C */  jal         Step__10CCharacterFv
/* 00BCBC 01DB79BC 00000000 */   nop
.L01DB79C0_2F2FC0:
/* 00BCC0 01DB79C0 189E838F */  lw          $3, -0x61E8($28)
/* 00BCC4 01DB79C4 1D006010 */  beqz        $3, .L01DB7A3C_2F303C
/* 00BCC8 01DB79C8 00000000 */   nop
/* 00BCCC 01DB79CC 28860070 */  paddub      $16, $0, $0
/* 00BCD0 01DB79D0 17000010 */  b           .L01DB7A30_2F3030
/* 00BCD4 01DB79D4 00000000 */   nop
.L01DB79D8_2F2FD8:
/* 00BCD8 01DB79D8 80301000 */  sll         $6, $16, 2
/* 00BCDC 01DB79DC D401033C */  lui         $3, %hi(EdEventInfo + 0x174)
/* 00BCE0 01DB79E0 44D36324 */  addiu       $3, $3, %lo(EdEventInfo + 0x174)
/* 00BCE4 01DB79E4 21186600 */  addu        $3, $3, $6
/* 00BCE8 01DB79E8 0000638C */  lw          $3, 0x0($3)
/* 00BCEC 01DB79EC 0F006014 */  bnez        $3, .L01DB7A2C_2F302C
/* 00BCF0 01DB79F0 00000000 */   nop
/* 00BCF4 01DB79F4 40111000 */  sll         $2, $16, 5
/* 00BCF8 01DB79F8 21185000 */  addu        $3, $2, $16
/* 00BCFC 01DB79FC 80100300 */  sll         $2, $3, 2
/* 00BD00 01DB7A00 21106200 */  addu        $2, $3, $2
/* 00BD04 01DB7A04 40190200 */  sll         $3, $2, 5
/* 00BD08 01DB7A08 EB01023C */  lui         $2, %hi(NPCUnit)
/* 00BD0C 01DB7A0C 60844224 */  addiu       $2, $2, %lo(NPCUnit)
/* 00BD10 01DB7A10 21884300 */  addu        $17, $2, $3
/* 00BD14 01DB7A14 28262072 */  paddub      $4, $17, $0
/* 00BD18 01DB7A18 3C58050C */  jal         ShadowStep__12CNPCharacterFv
/* 00BD1C 01DB7A1C 00000000 */   nop
/* 00BD20 01DB7A20 28262072 */  paddub      $4, $17, $0
/* 00BD24 01DB7A24 EC57050C */  jal         Step__12CNPCharacterFv
/* 00BD28 01DB7A28 00000000 */   nop
.L01DB7A2C_2F302C:
/* 00BD2C 01DB7A2C 01001026 */  addiu       $16, $16, 0x1
.L01DB7A30_2F3030:
/* 00BD30 01DB7A30 0600032A */  slti        $3, $16, 0x6
/* 00BD34 01DB7A34 E8FF6014 */  bnez        $3, .L01DB79D8_2F2FD8
/* 00BD38 01DB7A38 00000000 */   nop
.L01DB7A3C_2F303C:
/* 00BD3C 01DB7A3C 749D868F */  lw          $6, -0x628C($28)
/* 00BD40 01DB7A40 01000324 */  addiu       $3, $0, 0x1
/* 00BD44 01DB7A44 4703C310 */  beq         $6, $3, .L01DB8764_2F3D64
/* 00BD48 01DB7A48 00000000 */   nop
/* 00BD4C 01DB7A4C DC01013C */  lui         $1, %hi(BtActStatus + 0x148)
/* 00BD50 01DB7A50 C8452284 */  lh          $2, %lo(BtActStatus + 0x148)($1)
/* 00BD54 01DB7A54 04004018 */  blez        $2, .L01DB7A68_2F3068
/* 00BD58 01DB7A58 00000000 */   nop
/* 00BD5C 01DB7A5C FFFF4224 */  addiu       $2, $2, -0x1
/* 00BD60 01DB7A60 DC01013C */  lui         $1, %hi(BtActStatus + 0x148)
/* 00BD64 01DB7A64 C84522A4 */  sh          $2, %lo(BtActStatus + 0x148)($1)
.L01DB7A68_2F3068:
/* 00BD68 01DB7A68 189E828F */  lw          $2, -0x61E8($28)
/* 00BD6C 01DB7A6C 45004014 */  bnez        $2, .L01DB7B84_2F3184
/* 00BD70 01DB7A70 00000000 */   nop
/* 00BD74 01DB7A74 789C898F */  lw          $9, -0x6388($28)
/* 00BD78 01DB7A78 04002781 */  lb          $7, 0x4($9)
/* 00BD7C 01DB7A7C 40432A25 */  addiu       $10, $9, 0x4340
/* 00BD80 01DB7A80 21104701 */  addu        $2, $10, $7
/* 00BD84 01DB7A84 00004380 */  lb          $3, 0x0($2)
/* 00BD88 01DB7A88 40110300 */  sll         $2, $3, 5
/* 00BD8C 01DB7A8C 23104300 */  subu        $2, $2, $3
/* 00BD90 01DB7A90 C0300200 */  sll         $6, $2, 3
/* 00BD94 01DB7A94 A80A0324 */  addiu       $3, $0, 0xAA8
/* 00BD98 01DB7A98 1810E300 */  mult        $2, $7, $3
/* 00BD9C 01DB7A9C 21102201 */  addu        $2, $9, $2
/* 00BDA0 01DB7AA0 21104600 */  addu        $2, $2, $6
/* 00BDA4 01DB7AA4 0C454824 */  addiu       $8, $2, 0x450C
/* 00BDA8 01DB7AA8 1C4541C4 */  lwc1        $f1, 0x451C($2)
/* 00BDAC 01DB7AAC 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00BDB0 01DB7AB0 00008244 */  mtc1        $2, $f0
/* 00BDB4 01DB7AB4 00000000 */  nop
/* 00BDB8 01DB7AB8 36080046 */  c.le.s      $f1, $f0
/* 00BDBC 01DB7ABC 00000000 */  nop
/* 00BDC0 01DB7AC0 30000045 */  bc1f        .L01DB7B84_2F3184
/* 00BDC4 01DB7AC4 00000000 */   nop
/* 00BDC8 01DB7AC8 3C3E0700 */  dsll32      $7, $7, 24
/* 00BDCC 01DB7ACC 3F3E0700 */  dsra32      $7, $7, 24
/* 00BDD0 01DB7AD0 1810E300 */  mult        $2, $7, $3
/* 00BDD4 01DB7AD4 21304900 */  addu        $6, $2, $9
/* 00BDD8 01DB7AD8 21104701 */  addu        $2, $10, $7
/* 00BDDC 01DB7ADC 00004380 */  lb          $3, 0x0($2)
/* 00BDE0 01DB7AE0 40110300 */  sll         $2, $3, 5
/* 00BDE4 01DB7AE4 23104300 */  subu        $2, $2, $3
/* 00BDE8 01DB7AE8 C0100200 */  sll         $2, $2, 3
/* 00BDEC 01DB7AEC 21104600 */  addu        $2, $2, $6
/* 00BDF0 01DB7AF0 0C454684 */  lh          $6, 0x450C($2)
/* 00BDF4 01DB7AF4 80180700 */  sll         $3, $7, 2
/* 00BDF8 01DB7AF8 DC01023C */  lui         $2, %hi(_dun_text_end)
/* 00BDFC 01DB7AFC 001B4224 */  addiu       $2, $2, %lo(_dun_text_end)
/* 00BE00 01DB7B00 21104300 */  addu        $2, $2, $3
/* 00BE04 01DB7B04 0000428C */  lw          $2, 0x0($2)
/* 00BE08 01DB7B08 1E00C210 */  beq         $6, $2, .L01DB7B84_2F3184
/* 00BE0C 01DB7B0C 00000000 */   nop
/* 00BE10 01DB7B10 909E8283 */  lb          $2, -0x6170($28)
/* 00BE14 01DB7B14 04004014 */  bnez        $2, .L01DB7B28_2F3128
/* 00BE18 01DB7B18 00000000 */   nop
/* 00BE1C 01DB7B1C 8C9E80AF */  sw          $0, -0x6174($28)
/* 00BE20 01DB7B20 01000224 */  addiu       $2, $0, 0x1
/* 00BE24 01DB7B24 909E82A3 */  sb          $2, -0x6170($28)
.L01DB7B28_2F3128:
/* 00BE28 01DB7B28 10000CC5 */  lwc1        $f12, 0x10($8)
/* 00BE2C 01DB7B2C 2C44040C */  jal         fptosi
/* 00BE30 01DB7B30 00000000 */   nop
/* 00BE34 01DB7B34 80180200 */  sll         $3, $2, 2
/* 00BE38 01DB7B38 21106200 */  addu        $2, $3, $2
/* 00BE3C 01DB7B3C 40180200 */  sll         $3, $2, 1
/* 00BE40 01DB7B40 0B006128 */  slti        $1, $3, 0xB
/* 00BE44 01DB7B44 02002010 */  beqz        $1, .L01DB7B50_2F3150
/* 00BE48 01DB7B48 00000000 */   nop
/* 00BE4C 01DB7B4C 0A000324 */  addiu       $3, $0, 0xA
.L01DB7B50_2F3150:
/* 00BE50 01DB7B50 8C9E828F */  lw          $2, -0x6174($28)
/* 00BE54 01DB7B54 0900401C */  bgtz        $2, .L01DB7B7C_2F317C
/* 00BE58 01DB7B58 00000000 */   nop
/* 00BE5C 01DB7B5C 8C9E83AF */  sw          $3, -0x6174($28)
/* 00BE60 01DB7B60 16000424 */  addiu       $4, $0, 0x16
/* 00BE64 01DB7B64 FFFF0524 */  addiu       $5, $0, -0x1
/* 00BE68 01DB7B68 28360070 */  paddub      $6, $0, $0
/* 00BE6C 01DB7B6C AC69050C */  jal         SndSePlay__Fiii
/* 00BE70 01DB7B70 00000000 */   nop
/* 00BE74 01DB7B74 03000010 */  b           .L01DB7B84_2F3184
/* 00BE78 01DB7B78 00000000 */   nop
.L01DB7B7C_2F317C:
/* 00BE7C 01DB7B7C FFFF4224 */  addiu       $2, $2, -0x1
/* 00BE80 01DB7B80 8C9E82AF */  sw          $2, -0x6174($28)
.L01DB7B84_2F3184:
/* 00BE84 01DB7B84 DC01013C */  lui         $1, %hi(BtActStatus)
/* 00BE88 01DB7B88 8044228C */  lw          $2, %lo(BtActStatus)($1)
/* 00BE8C 01DB7B8C 0A004010 */  beqz        $2, .L01DB7BB8_2F31B8
/* 00BE90 01DB7B90 00000000 */   nop
/* 00BE94 01DB7B94 D401013C */  lui         $1, %hi(EdEventInfo + 0x60)
/* 00BE98 01DB7B98 30D2228C */  lw          $2, %lo(EdEventInfo + 0x60)($1)
/* 00BE9C 01DB7B9C 06004010 */  beqz        $2, .L01DB7BB8_2F31B8
/* 00BEA0 01DB7BA0 00000000 */   nop
/* 00BEA4 01DB7BA4 EA01023C */  lui         $2, %hi(CharaMain)
/* 00BEA8 01DB7BA8 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 00BEAC 01DB7BAC 282E0070 */  paddub      $5, $0, $0
/* 00BEB0 01DB7BB0 94E3040C */  jal         ClothStep__10CCharacterFi
/* 00BEB4 01DB7BB4 00000000 */   nop
.L01DB7BB8_2F31B8:
/* 00BEB8 01DB7BB8 DC01013C */  lui         $1, %hi(BtActStatus + 0x6C)
/* 00BEBC 01DB7BBC EC44228C */  lw          $2, %lo(BtActStatus + 0x6C)($1)
/* 00BEC0 01DB7BC0 07004014 */  bnez        $2, .L01DB7BE0_2F31E0
/* 00BEC4 01DB7BC4 00000000 */   nop
/* 00BEC8 01DB7BC8 A89C848F */  lw          $4, -0x6358($28)
/* 00BECC 01DB7BCC 01000524 */  addiu       $5, $0, 0x1
/* 00BED0 01DB7BD0 B802998C */  lw          $25, 0x2B8($4)
/* 00BED4 01DB7BD4 0800398F */  lw          $25, 0x8($25)
/* 00BED8 01DB7BD8 09F82003 */  jalr        $25
/* 00BEDC 01DB7BDC 00000000 */   nop
.L01DB7BE0_2F31E0:
/* 00BEE0 01DB7BE0 149D828F */  lw          $2, -0x62EC($28)
/* 00BEE4 01DB7BE4 18004010 */  beqz        $2, .L01DB7C48_2F3248
/* 00BEE8 01DB7BE8 00000000 */   nop
/* 00BEEC 01DB7BEC EB01023C */  lui         $2, %hi(Water_Splash)
/* 00BEF0 01DB7BF0 20004424 */  addiu       $4, $2, %lo(Water_Splash)
/* 00BEF4 01DB7BF4 4CE1040C */  jal         Step__10CCharacterFv
/* 00BEF8 01DB7BF8 00000000 */   nop
/* 00BEFC 01DB7BFC EB01013C */  lui         $1, %hi(Water_Splash + 0x344)
/* 00BF00 01DB7C00 6403228C */  lw          $2, %lo(Water_Splash + 0x344)($1)
/* 00BF04 01DB7C04 040040C4 */  lwc1        $f0, 0x4($2)
/* 00BF08 01DB7C08 60008046 */  cvt.s.w     $f1, $f0
/* 00BF0C 01DB7C0C EB01013C */  lui         $1, %hi(Water_Splash + 0x2F0)
/* 00BF10 01DB7C10 100322C4 */  lwc1        $f2, %lo(Water_Splash + 0x2F0)($1)
/* 00BF14 01DB7C14 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 00BF18 01DB7C18 00008244 */  mtc1        $2, $f0
/* 00BF1C 01DB7C1C 00000000 */  nop
/* 00BF20 01DB7C20 01080046 */  sub.s       $f0, $f1, $f0
/* 00BF24 01DB7C24 34100046 */  c.lt.s      $f2, $f0
/* 00BF28 01DB7C28 00000000 */  nop
/* 00BF2C 01DB7C2C 06000145 */  bc1t        .L01DB7C48_2F3248
/* 00BF30 01DB7C30 00000000 */   nop
/* 00BF34 01DB7C34 34100146 */  c.lt.s      $f2, $f1
/* 00BF38 01DB7C38 00000000 */  nop
/* 00BF3C 01DB7C3C 02000045 */  bc1f        .L01DB7C48_2F3248
/* 00BF40 01DB7C40 00000000 */   nop
/* 00BF44 01DB7C44 149D80AF */  sw          $0, -0x62EC($28)
.L01DB7C48_2F3248:
/* 00BF48 01DB7C48 58BF060C */  jal         StepWaterLing__Fv
/* 00BF4C 01DB7C4C 00000000 */   nop
/* 00BF50 01DB7C50 C89C848F */  lw          $4, -0x6338($28)
/* 00BF54 01DB7C54 981F070C */  jal         StepTrapCircle__11CDungeonMapFv
/* 00BF58 01DB7C58 00000000 */   nop
/* 00BF5C 01DB7C5C EB01023C */  lui         $2, %hi(Trap_Circle)
/* 00BF60 01DB7C60 D0114424 */  addiu       $4, $2, %lo(Trap_Circle)
/* 00BF64 01DB7C64 4CE1040C */  jal         Step__10CCharacterFv
/* 00BF68 01DB7C68 00000000 */   nop
/* 00BF6C 01DB7C6C 189D828F */  lw          $2, -0x62E8($28)
/* 00BF70 01DB7C70 05004010 */  beqz        $2, .L01DB7C88_2F3288
/* 00BF74 01DB7C74 00000000 */   nop
/* 00BF78 01DB7C78 EB01023C */  lui         $2, %hi(EscapeEffect)
/* 00BF7C 01DB7C7C 00294424 */  addiu       $4, $2, %lo(EscapeEffect)
/* 00BF80 01DB7C80 4CE1040C */  jal         Step__10CCharacterFv
/* 00BF84 01DB7C84 00000000 */   nop
.L01DB7C88_2F3288:
/* 00BF88 01DB7C88 DB01023C */  lui         $2, %hi(ItemVolumeStep)
/* 00BF8C 01DB7C8C 10BC4424 */  addiu       $4, $2, %lo(ItemVolumeStep)
/* 00BF90 01DB7C90 3C000524 */  addiu       $5, $0, 0x3C
/* 00BF94 01DB7C94 B4D5080C */  jal         LoopStep__13CMenuItemStepFi
/* 00BF98 01DB7C98 00000000 */   nop
/* 00BF9C 01DB7C9C C89C848F */  lw          $4, -0x6338($28)
/* 00BFA0 01DB7CA0 7C08070C */  jal         StepNPC__11CDungeonMapFv
/* 00BFA4 01DB7CA4 00000000 */   nop
/* 00BFA8 01DB7CA8 CC9C848F */  lw          $4, -0x6334($28)
/* 00BFAC 01DB7CAC F435070C */  jal         Step__13CDranMapFieldFv
/* 00BFB0 01DB7CB0 00000000 */   nop
/* 00BFB4 01DB7CB4 EC01023C */  lui         $2, %hi(DngMesStb)
/* 00BFB8 01DB7CB8 A0934424 */  addiu       $4, $2, %lo(DngMesStb)
/* 00BFBC 01DB7CBC 6437050C */  jal         Step__6ClsMesFv
/* 00BFC0 01DB7CC0 00000000 */   nop
/* 00BFC4 01DB7CC4 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00BFC8 01DB7CC8 9476228C */  lw          $2, %lo(DngMessMan + 0x4)($1)
/* 00BFCC 01DB7CCC 0D004018 */  blez        $2, .L01DB7D04_2F3304
/* 00BFD0 01DB7CD0 00000000 */   nop
/* 00BFD4 01DB7CD4 FFFF4224 */  addiu       $2, $2, -0x1
/* 00BFD8 01DB7CD8 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00BFDC 01DB7CDC 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 00BFE0 01DB7CE0 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00BFE4 01DB7CE4 9476228C */  lw          $2, %lo(DngMessMan + 0x4)($1)
/* 00BFE8 01DB7CE8 06004014 */  bnez        $2, .L01DB7D04_2F3304
/* 00BFEC 01DB7CEC 00000000 */   nop
/* 00BFF0 01DB7CF0 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 00BFF4 01DB7CF4 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 00BFF8 01DB7CF8 FFFF0224 */  addiu       $2, $0, -0x1
/* 00BFFC 01DB7CFC EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 00C000 01DB7D00 B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
.L01DB7D04_2F3304:
/* 00C004 01DB7D04 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 00C008 01DB7D08 9876228C */  lw          $2, %lo(DngMessMan + 0x8)($1)
/* 00C00C 01DB7D0C 06004018 */  blez        $2, .L01DB7D28_2F3328
/* 00C010 01DB7D10 00000000 */   nop
/* 00C014 01DB7D14 FFFF4224 */  addiu       $2, $2, -0x1
/* 00C018 01DB7D18 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 00C01C 01DB7D1C 987622AC */  sw          $2, %lo(DngMessMan + 0x8)($1)
/* 00C020 01DB7D20 03000010 */  b           .L01DB7D30_2F3330
/* 00C024 01DB7D24 00000000 */   nop
.L01DB7D28_2F3328:
/* 00C028 01DB7D28 EA01013C */  lui         $1, %hi(DngMessMan + 0x8)
/* 00C02C 01DB7D2C 987620AC */  sw          $0, %lo(DngMessMan + 0x8)($1)
.L01DB7D30_2F3330:
/* 00C030 01DB7D30 F09D918F */  lw          $17, -0x6210($28)
/* 00C034 01DB7D34 28860070 */  paddub      $16, $0, $0
/* 00C038 01DB7D38 30000010 */  b           .L01DB7DFC_2F33FC
/* 00C03C 01DB7D3C 00000000 */   nop
.L01DB7D40_2F3340:
/* 00C040 01DB7D40 80181000 */  sll         $3, $16, 2
/* 00C044 01DB7D44 21107100 */  addu        $2, $3, $17
/* 00C048 01DB7D48 003C4624 */  addiu       $6, $2, 0x3C00
/* 00C04C 01DB7D4C 003C428C */  lw          $2, 0x3C00($2)
/* 00C050 01DB7D50 29004010 */  beqz        $2, .L01DB7DF8_2F33F8
/* 00C054 01DB7D54 00000000 */   nop
/* 00C058 01DB7D58 21107000 */  addu        $2, $3, $16
/* 00C05C 01DB7D5C 40290200 */  sll         $5, $2, 5
/* 00C060 01DB7D60 2118B100 */  addu        $3, $5, $17
/* 00C064 01DB7D64 70006424 */  addiu       $4, $3, 0x70
/* 00C068 01DB7D68 7000628C */  lw          $2, 0x70($3)
/* 00C06C 01DB7D6C 06004018 */  blez        $2, .L01DB7D88_2F3388
/* 00C070 01DB7D70 00000000 */   nop
/* 00C074 01DB7D74 0000828C */  lw          $2, 0x0($4)
/* 00C078 01DB7D78 FFFF4224 */  addiu       $2, $2, -0x1
/* 00C07C 01DB7D7C 000082AC */  sw          $2, 0x0($4)
/* 00C080 01DB7D80 03000010 */  b           .L01DB7D90_2F3390
/* 00C084 01DB7D84 00000000 */   nop
.L01DB7D88_2F3388:
/* 00C088 01DB7D88 7400628C */  lw          $2, 0x74($3)
/* 00C08C 01DB7D8C 000082AC */  sw          $2, 0x0($4)
.L01DB7D90_2F3390:
/* 00C090 01DB7D90 2118B100 */  addu        $3, $5, $17
/* 00C094 01DB7D94 4400628C */  lw          $2, 0x44($3)
/* 00C098 01DB7D98 FFFF4224 */  addiu       $2, $2, -0x1
/* 00C09C 01DB7D9C 440062AC */  sw          $2, 0x44($3)
/* 00C0A0 01DB7DA0 4400628C */  lw          $2, 0x44($3)
/* 00C0A4 01DB7DA4 0500401C */  bgtz        $2, .L01DB7DBC_2F33BC
/* 00C0A8 01DB7DA8 00000000 */   nop
/* 00C0AC 01DB7DAC 0000C0AC */  sw          $0, 0x0($6)
/* 00C0B0 01DB7DB0 380060AC */  sw          $0, 0x38($3)
/* 00C0B4 01DB7DB4 10000010 */  b           .L01DB7DF8_2F33F8
/* 00C0B8 01DB7DB8 00000000 */   nop
.L01DB7DBC_2F33BC:
/* 00C0BC 01DB7DBC 400061C4 */  lwc1        $f1, 0x40($3)
/* 00C0C0 01DB7DC0 3C0060C4 */  lwc1        $f0, 0x3C($3)
/* 00C0C4 01DB7DC4 00000146 */  add.s       $f0, $f0, $f1
/* 00C0C8 01DB7DC8 3C0060E4 */  swc1        $f0, 0x3C($3)
/* 00C0CC 01DB7DCC 38006CC4 */  lwc1        $f12, 0x38($3)
/* 00C0D0 01DB7DD0 00008044 */  mtc1        $0, $f0
/* 00C0D4 01DB7DD4 00000000 */  nop
/* 00C0D8 01DB7DD8 32000C46 */  c.eq.s      $f0, $f12
/* 00C0DC 01DB7DDC 00000000 */  nop
/* 00C0E0 01DB7DE0 05000145 */  bc1t        .L01DB7DF8_2F33F8
/* 00C0E4 01DB7DE4 00000000 */   nop
/* 00C0E8 01DB7DE8 10006424 */  addiu       $4, $3, 0x10
/* 00C0EC 01DB7DEC 282E8070 */  paddub      $5, $4, $0
/* 00C0F0 01DB7DF0 4688040C */  jal         sceVu0ScaleVectorXYZ
/* 00C0F4 01DB7DF4 00000000 */   nop
.L01DB7DF8_2F33F8:
/* 00C0F8 01DB7DF8 01001026 */  addiu       $16, $16, 0x1
.L01DB7DFC_2F33FC:
/* 00C0FC 01DB7DFC 6000022A */  slti        $2, $16, 0x60
/* 00C100 01DB7E00 CFFF4014 */  bnez        $2, .L01DB7D40_2F3340
/* 00C104 01DB7E04 00000000 */   nop
/* 00C108 01DB7E08 04000424 */  addiu       $4, $0, 0x4
/* 00C10C 01DB7E0C 4CC6060C */  jal         StatusErrCheck__Fi
/* 00C110 01DB7E10 00000000 */   nop
/* 00C114 01DB7E14 06004014 */  bnez        $2, .L01DB7E30_2F3430
/* 00C118 01DB7E18 00000000 */   nop
/* 00C11C 01DB7E1C 08000424 */  addiu       $4, $0, 0x8
/* 00C120 01DB7E20 4CC6060C */  jal         StatusErrCheck__Fi
/* 00C124 01DB7E24 00000000 */   nop
/* 00C128 01DB7E28 1E004010 */  beqz        $2, .L01DB7EA4_2F34A4
/* 00C12C 01DB7E2C 00000000 */   nop
.L01DB7E30_2F3430:
/* 00C130 01DB7E30 789C828F */  lw          $2, -0x6388($28)
/* 00C134 01DB7E34 04004380 */  lb          $3, 0x4($2)
/* 00C138 01DB7E38 E0424624 */  addiu       $6, $2, 0x42E0
/* 00C13C 01DB7E3C 40100300 */  sll         $2, $3, 1
/* 00C140 01DB7E40 2110C200 */  addu        $2, $6, $2
/* 00C144 01DB7E44 00004284 */  lh          $2, 0x0($2)
/* 00C148 01DB7E48 16004018 */  blez        $2, .L01DB7EA4_2F34A4
/* 00C14C 01DB7E4C 00000000 */   nop
/* 00C150 01DB7E50 3C160300 */  dsll32      $2, $3, 24
/* 00C154 01DB7E54 3F160200 */  dsra32      $2, $2, 24
/* 00C158 01DB7E58 40100200 */  sll         $2, $2, 1
/* 00C15C 01DB7E5C 2118C200 */  addu        $3, $6, $2
/* 00C160 01DB7E60 00006284 */  lh          $2, 0x0($3)
/* 00C164 01DB7E64 FFFF4224 */  addiu       $2, $2, -0x1
/* 00C168 01DB7E68 000062A4 */  sh          $2, 0x0($3)
/* 00C16C 01DB7E6C 789C868F */  lw          $6, -0x6388($28)
/* 00C170 01DB7E70 0400C380 */  lb          $3, 0x4($6)
/* 00C174 01DB7E74 40100300 */  sll         $2, $3, 1
/* 00C178 01DB7E78 21104600 */  addu        $2, $2, $6
/* 00C17C 01DB7E7C E0424284 */  lh          $2, 0x42E0($2)
/* 00C180 01DB7E80 08004014 */  bnez        $2, .L01DB7EA4_2F34A4
/* 00C184 01DB7E84 00000000 */   nop
/* 00C188 01DB7E88 3C160300 */  dsll32      $2, $3, 24
/* 00C18C 01DB7E8C 3F160200 */  dsra32      $2, $2, 24
/* 00C190 01DB7E90 80100200 */  sll         $2, $2, 2
/* 00C194 01DB7E94 21104600 */  addu        $2, $2, $6
/* 00C198 01DB7E98 C84240AC */  sw          $0, 0x42C8($2)
/* 00C19C 01DB7E9C DC01013C */  lui         $1, %hi(BtActStatus + 0x98)
/* 00C1A0 01DB7EA0 184520AC */  sw          $0, %lo(BtActStatus + 0x98)($1)
.L01DB7EA4_2F34A4:
/* 00C1A4 01DB7EA4 DC01013C */  lui         $1, %hi(BtActStatus + 0x14C)
/* 00C1A8 01DB7EA8 CC452284 */  lh          $2, %lo(BtActStatus + 0x14C)($1)
/* 00C1AC 01DB7EAC 04004018 */  blez        $2, .L01DB7EC0_2F34C0
/* 00C1B0 01DB7EB0 00000000 */   nop
/* 00C1B4 01DB7EB4 FFFF4224 */  addiu       $2, $2, -0x1
/* 00C1B8 01DB7EB8 DC01013C */  lui         $1, %hi(BtActStatus + 0x14C)
/* 00C1BC 01DB7EBC CC4522A4 */  sh          $2, %lo(BtActStatus + 0x14C)($1)
.L01DB7EC0_2F34C0:
/* 00C1C0 01DB7EC0 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 00C1C4 01DB7EC4 C8442CC4 */  lwc1        $f12, %lo(BtActStatus + 0x48)($1)
/* 00C1C8 01DB7EC8 2C44040C */  jal         fptosi
/* 00C1CC 01DB7ECC 00000000 */   nop
/* 00C1D0 01DB7ED0 64004128 */  slti        $1, $2, 0x64
/* 00C1D4 01DB7ED4 8F002010 */  beqz        $1, .L01DB8114_2F3714
/* 00C1D8 01DB7ED8 00000000 */   nop
/* 00C1DC 01DB7EDC DC01013C */  lui         $1, %hi(BtActStatus + 0xF8)
/* 00C1E0 01DB7EE0 7845228C */  lw          $2, %lo(BtActStatus + 0xF8)($1)
/* 00C1E4 01DB7EE4 0A004128 */  slti        $1, $2, 0xA
/* 00C1E8 01DB7EE8 04002010 */  beqz        $1, .L01DB7EFC_2F34FC
/* 00C1EC 01DB7EEC 00000000 */   nop
/* 00C1F0 01DB7EF0 01004224 */  addiu       $2, $2, 0x1
/* 00C1F4 01DB7EF4 DC01013C */  lui         $1, %hi(BtActStatus + 0xF8)
/* 00C1F8 01DB7EF8 784522AC */  sw          $2, %lo(BtActStatus + 0xF8)($1)
.L01DB7EFC_2F34FC:
/* 00C1FC 01DB7EFC 049D828F */  lw          $2, -0x62FC($28)
/* 00C200 01DB7F00 08004284 */  lh          $2, 0x8($2)
/* 00C204 01DB7F04 00008244 */  mtc1        $2, $f0
/* 00C208 01DB7F08 00000000 */  nop
/* 00C20C 01DB7F0C 60008046 */  cvt.s.w     $f1, $f0
/* 00C210 01DB7F10 F041023C */  lui         $2, (0x41F00000 >> 16)
/* 00C214 01DB7F14 00008244 */  mtc1        $2, $f0
/* 00C218 01DB7F18 00000000 */  nop
/* 00C21C 01DB7F1C 030D0046 */  div.s       $f20, $f1, $f0
/* 00C220 01DB7F20 40000424 */  addiu       $4, $0, 0x40
/* 00C224 01DB7F24 4CC6060C */  jal         StatusErrCheck__Fi
/* 00C228 01DB7F28 00000000 */   nop
/* 00C22C 01DB7F2C 05004010 */  beqz        $2, .L01DB7F44_2F3544
/* 00C230 01DB7F30 00000000 */   nop
/* 00C234 01DB7F34 0040023C */  lui         $2, (0x40000000 >> 16)
/* 00C238 01DB7F38 00008244 */  mtc1        $2, $f0
/* 00C23C 01DB7F3C 00000000 */  nop
/* 00C240 01DB7F40 03A50046 */  div.s       $f20, $f20, $f0
.L01DB7F44_2F3544:
/* 00C244 01DB7F44 08000424 */  addiu       $4, $0, 0x8
/* 00C248 01DB7F48 4CC6060C */  jal         StatusErrCheck__Fi
/* 00C24C 01DB7F4C 00000000 */   nop
/* 00C250 01DB7F50 05004010 */  beqz        $2, .L01DB7F68_2F3568
/* 00C254 01DB7F54 00000000 */   nop
/* 00C258 01DB7F58 0040023C */  lui         $2, (0x40000000 >> 16)
/* 00C25C 01DB7F5C 00008244 */  mtc1        $2, $f0
/* 00C260 01DB7F60 00000000 */  nop
/* 00C264 01DB7F64 02A50046 */  mul.s       $f20, $f20, $f0
.L01DB7F68_2F3568:
/* 00C268 01DB7F68 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00C26C 01DB7F6C 00008244 */  mtc1        $2, $f0
/* 00C270 01DB7F70 00000000 */  nop
/* 00C274 01DB7F74 34A00046 */  c.lt.s      $f20, $f0
/* 00C278 01DB7F78 00000000 */  nop
/* 00C27C 01DB7F7C 02000045 */  bc1f        .L01DB7F88_2F3588
/* 00C280 01DB7F80 00000000 */   nop
/* 00C284 01DB7F84 06050046 */  mov.s       $f20, $f0
.L01DB7F88_2F3588:
/* 00C288 01DB7F88 789C828F */  lw          $2, -0x6388($28)
/* 00C28C 01DB7F8C 04004624 */  addiu       $6, $2, 0x4
/* 00C290 01DB7F90 04004280 */  lb          $2, 0x4($2)
/* 00C294 01DB7F94 0E004014 */  bnez        $2, .L01DB7FD0_2F35D0
/* 00C298 01DB7F98 00000000 */   nop
/* 00C29C 01DB7F9C DC01013C */  lui         $1, %hi(BtActStatus + 0x14A)
/* 00C2A0 01DB7FA0 CA452284 */  lh          $2, %lo(BtActStatus + 0x14A)($1)
/* 00C2A4 01DB7FA4 07004014 */  bnez        $2, .L01DB7FC4_2F35C4
/* 00C2A8 01DB7FA8 00000000 */   nop
/* 00C2AC 01DB7FAC 803E023C */  lui         $2, (0x3E800000 >> 16)
/* 00C2B0 01DB7FB0 00008244 */  mtc1        $2, $f0
/* 00C2B4 01DB7FB4 00000000 */  nop
/* 00C2B8 01DB7FB8 02A50046 */  mul.s       $f20, $f20, $f0
/* 00C2BC 01DB7FBC 02000010 */  b           .L01DB7FC8_2F35C8
/* 00C2C0 01DB7FC0 00000000 */   nop
.L01DB7FC4_2F35C4:
/* 00C2C4 01DB7FC4 00A08044 */  mtc1        $0, $f20
.L01DB7FC8_2F35C8:
/* 00C2C8 01DB7FC8 DC01013C */  lui         $1, %hi(BtActStatus + 0x14A)
/* 00C2CC 01DB7FCC CA4520A4 */  sh          $0, %lo(BtActStatus + 0x14A)($1)
.L01DB7FD0_2F35D0:
/* 00C2D0 01DB7FD0 0000C380 */  lb          $3, 0x0($6)
/* 00C2D4 01DB7FD4 04000224 */  addiu       $2, $0, 0x4
/* 00C2D8 01DB7FD8 0E006214 */  bne         $3, $2, .L01DB8014_2F3614
/* 00C2DC 01DB7FDC 00000000 */   nop
/* 00C2E0 01DB7FE0 DC01013C */  lui         $1, %hi(BtActStatus + 0x14A)
/* 00C2E4 01DB7FE4 CA452284 */  lh          $2, %lo(BtActStatus + 0x14A)($1)
/* 00C2E8 01DB7FE8 07004014 */  bnez        $2, .L01DB8008_2F3608
/* 00C2EC 01DB7FEC 00000000 */   nop
/* 00C2F0 01DB7FF0 803E023C */  lui         $2, (0x3E800000 >> 16)
/* 00C2F4 01DB7FF4 00008244 */  mtc1        $2, $f0
/* 00C2F8 01DB7FF8 00000000 */  nop
/* 00C2FC 01DB7FFC 02A50046 */  mul.s       $f20, $f20, $f0
/* 00C300 01DB8000 02000010 */  b           .L01DB800C_2F360C
/* 00C304 01DB8004 00000000 */   nop
.L01DB8008_2F3608:
/* 00C308 01DB8008 00A08044 */  mtc1        $0, $f20
.L01DB800C_2F360C:
/* 00C30C 01DB800C DC01013C */  lui         $1, %hi(BtActStatus + 0x14A)
/* 00C310 01DB8010 CA4520A4 */  sh          $0, %lo(BtActStatus + 0x14A)($1)
.L01DB8014_2F3614:
/* 00C314 01DB8014 0000C680 */  lb          $6, 0x0($6)
/* 00C318 01DB8018 05000224 */  addiu       $2, $0, 0x5
/* 00C31C 01DB801C 1700C214 */  bne         $6, $2, .L01DB807C_2F367C
/* 00C320 01DB8020 00000000 */   nop
/* 00C324 01DB8024 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00C328 01DB8028 2045238C */  lw          $3, %lo(BtActStatus + 0xA0)($1)
/* 00C32C 01DB802C 01000224 */  addiu       $2, $0, 0x1
/* 00C330 01DB8030 0E006210 */  beq         $3, $2, .L01DB806C_2F366C
/* 00C334 01DB8034 00000000 */   nop
/* 00C338 01DB8038 DC01013C */  lui         $1, %hi(BtActStatus + 0xA4)
/* 00C33C 01DB803C 2445228C */  lw          $2, %lo(BtActStatus + 0xA4)($1)
/* 00C340 01DB8040 04004014 */  bnez        $2, .L01DB8054_2F3654
/* 00C344 01DB8044 00000000 */   nop
/* 00C348 01DB8048 00A08044 */  mtc1        $0, $f20
/* 00C34C 01DB804C 0B000010 */  b           .L01DB807C_2F367C
/* 00C350 01DB8050 00000000 */   nop
.L01DB8054_2F3654:
/* 00C354 01DB8054 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 00C358 01DB8058 00008244 */  mtc1        $2, $f0
/* 00C35C 01DB805C 00000000 */  nop
/* 00C360 01DB8060 02A50046 */  mul.s       $f20, $f20, $f0
/* 00C364 01DB8064 05000010 */  b           .L01DB807C_2F367C
/* 00C368 01DB8068 00000000 */   nop
.L01DB806C_2F366C:
/* 00C36C 01DB806C C03F023C */  lui         $2, (0x3FC00000 >> 16)
/* 00C370 01DB8070 00008244 */  mtc1        $2, $f0
/* 00C374 01DB8074 00000000 */  nop
/* 00C378 01DB8078 02A50046 */  mul.s       $f20, $f20, $f0
.L01DB807C_2F367C:
/* 00C37C 01DB807C 3C1E0600 */  dsll32      $3, $6, 24
/* 00C380 01DB8080 3F1E0300 */  dsra32      $3, $3, 24
/* 00C384 01DB8084 01000224 */  addiu       $2, $0, 0x1
/* 00C388 01DB8088 05006214 */  bne         $3, $2, .L01DB80A0_2F36A0
/* 00C38C 01DB808C 00000000 */   nop
/* 00C390 01DB8090 C03F023C */  lui         $2, (0x3FC00000 >> 16)
/* 00C394 01DB8094 00008244 */  mtc1        $2, $f0
/* 00C398 01DB8098 00000000 */  nop
/* 00C39C 01DB809C 02A50046 */  mul.s       $f20, $f20, $f0
.L01DB80A0_2F36A0:
/* 00C3A0 01DB80A0 3C1E0600 */  dsll32      $3, $6, 24
/* 00C3A4 01DB80A4 3F1E0300 */  dsra32      $3, $3, 24
/* 00C3A8 01DB80A8 03000224 */  addiu       $2, $0, 0x3
/* 00C3AC 01DB80AC 05006214 */  bne         $3, $2, .L01DB80C4_2F36C4
/* 00C3B0 01DB80B0 00000000 */   nop
/* 00C3B4 01DB80B4 C03F023C */  lui         $2, (0x3FC00000 >> 16)
/* 00C3B8 01DB80B8 00008244 */  mtc1        $2, $f0
/* 00C3BC 01DB80BC 00000000 */  nop
/* 00C3C0 01DB80C0 02A50046 */  mul.s       $f20, $f20, $f0
.L01DB80C4_2F36C4:
/* 00C3C4 01DB80C4 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 00C3C8 01DB80C8 C84420C4 */  lwc1        $f0, %lo(BtActStatus + 0x48)($1)
/* 00C3CC 01DB80CC 00031446 */  add.s       $f12, $f0, $f20
/* 00C3D0 01DB80D0 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 00C3D4 01DB80D4 C8442CE4 */  swc1        $f12, %lo(BtActStatus + 0x48)($1)
/* 00C3D8 01DB80D8 2C44040C */  jal         fptosi
/* 00C3DC 01DB80DC 00000000 */   nop
/* 00C3E0 01DB80E0 64004228 */  slti        $2, $2, 0x64
/* 00C3E4 01DB80E4 12004014 */  bnez        $2, .L01DB8130_2F3730
/* 00C3E8 01DB80E8 00000000 */   nop
/* 00C3EC 01DB80EC C842023C */  lui         $2, (0x42C80000 >> 16)
/* 00C3F0 01DB80F0 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 00C3F4 01DB80F4 C84422AC */  sw          $2, %lo(BtActStatus + 0x48)($1)
/* 00C3F8 01DB80F8 0A000224 */  addiu       $2, $0, 0xA
/* 00C3FC 01DB80FC DC01013C */  lui         $1, %hi(BtActStatus + 0x4C)
/* 00C400 01DB8100 CC4422AC */  sw          $2, %lo(BtActStatus + 0x4C)($1)
/* 00C404 01DB8104 DC01013C */  lui         $1, %hi(BtActStatus + 0xA4)
/* 00C408 01DB8108 244520AC */  sw          $0, %lo(BtActStatus + 0xA4)($1)
/* 00C40C 01DB810C 08000010 */  b           .L01DB8130_2F3730
/* 00C410 01DB8110 00000000 */   nop
.L01DB8114_2F3714:
/* 00C414 01DB8114 DC01013C */  lui         $1, %hi(BtActStatus + 0x4C)
/* 00C418 01DB8118 CC44228C */  lw          $2, %lo(BtActStatus + 0x4C)($1)
/* 00C41C 01DB811C 04004018 */  blez        $2, .L01DB8130_2F3730
/* 00C420 01DB8120 00000000 */   nop
/* 00C424 01DB8124 FFFF4224 */  addiu       $2, $2, -0x1
/* 00C428 01DB8128 DC01013C */  lui         $1, %hi(BtActStatus + 0x4C)
/* 00C42C 01DB812C CC4422AC */  sw          $2, %lo(BtActStatus + 0x4C)($1)
.L01DB8130_2F3730:
/* 00C430 01DB8130 DC01013C */  lui         $1, %hi(BtActStatus + 0x144)
/* 00C434 01DB8134 C4452284 */  lh          $2, %lo(BtActStatus + 0x144)($1)
/* 00C438 01DB8138 18004018 */  blez        $2, .L01DB819C_2F379C
/* 00C43C 01DB813C 00000000 */   nop
/* 00C440 01DB8140 BE11040C */  jal         rand
/* 00C444 01DB8144 00000000 */   nop
/* 00C448 01DB8148 00008244 */  mtc1        $2, $f0
/* 00C44C 01DB814C 00000000 */  nop
/* 00C450 01DB8150 60008046 */  cvt.s.w     $f1, $f0
/* 00C454 01DB8154 8041023C */  lui         $2, (0x41800000 >> 16)
/* 00C458 01DB8158 00008244 */  mtc1        $2, $f0
/* 00C45C 01DB815C 00000000 */  nop
/* 00C460 01DB8160 42000146 */  mul.s       $f1, $f0, $f1
/* 00C464 01DB8164 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 00C468 01DB8168 00008244 */  mtc1        $2, $f0
/* 00C46C 01DB816C 00000000 */  nop
/* 00C470 01DB8170 030B0046 */  div.s       $f12, $f1, $f0
/* 00C474 01DB8174 2C44040C */  jal         fptosi
/* 00C478 01DB8178 00000000 */   nop
/* 00C47C 01DB817C F8FF4224 */  addiu       $2, $2, -0x8
/* 00C480 01DB8180 DC01013C */  lui         $1, %hi(BtActStatus + 0x146)
/* 00C484 01DB8184 C64522A4 */  sh          $2, %lo(BtActStatus + 0x146)($1)
/* 00C488 01DB8188 DC01013C */  lui         $1, %hi(BtActStatus + 0x144)
/* 00C48C 01DB818C C4452284 */  lh          $2, %lo(BtActStatus + 0x144)($1)
/* 00C490 01DB8190 FFFF4224 */  addiu       $2, $2, -0x1
/* 00C494 01DB8194 DC01013C */  lui         $1, %hi(BtActStatus + 0x144)
/* 00C498 01DB8198 C44522A4 */  sh          $2, %lo(BtActStatus + 0x144)($1)
.L01DB819C_2F379C:
/* 00C49C 01DB819C DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 00C4A0 01DB81A0 6045228C */  lw          $2, %lo(BtActStatus + 0xE0)($1)
/* 00C4A4 01DB81A4 01004224 */  addiu       $2, $2, 0x1
/* 00C4A8 01DB81A8 DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 00C4AC 01DB81AC 604522AC */  sw          $2, %lo(BtActStatus + 0xE0)($1)
/* 00C4B0 01DB81B0 DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 00C4B4 01DB81B4 6045228C */  lw          $2, %lo(BtActStatus + 0xE0)($1)
/* 00C4B8 01DB81B8 100E4228 */  slti        $2, $2, 0xE10
/* 00C4BC 01DB81BC 04004014 */  bnez        $2, .L01DB81D0_2F37D0
/* 00C4C0 01DB81C0 00000000 */   nop
/* 00C4C4 01DB81C4 100E0224 */  addiu       $2, $0, 0xE10
/* 00C4C8 01DB81C8 DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 00C4CC 01DB81CC 604522AC */  sw          $2, %lo(BtActStatus + 0xE0)($1)
.L01DB81D0_2F37D0:
/* 00C4D0 01DB81D0 789C828F */  lw          $2, -0x6388($28)
/* 00C4D4 01DB81D4 0100013C */  lui         $1, (0x10000 >> 16)
/* 00C4D8 01DB81D8 21084100 */  addu        $1, $2, $1
/* 00C4DC 01DB81DC 0C8B228C */  lw          $2, -0x74F4($1)
/* 00C4E0 01DB81E0 03004014 */  bnez        $2, .L01DB81F0_2F37F0
/* 00C4E4 01DB81E4 00000000 */   nop
/* 00C4E8 01DB81E8 94C6060C */  jal         BtStatusErrStep__Fv
/* 00C4EC 01DB81EC 00000000 */   nop
.L01DB81F0_2F37F0:
/* 00C4F0 01DB81F0 789C848F */  lw          $4, -0x6388($28)
/* 00C4F4 01DB81F4 04008324 */  addiu       $3, $4, 0x4
/* 00C4F8 01DB81F8 04008280 */  lb          $2, 0x4($4)
/* 00C4FC 01DB81FC 80100200 */  sll         $2, $2, 2
/* 00C500 01DB8200 21104400 */  addu        $2, $2, $4
/* 00C504 01DB8204 EC4254C4 */  lwc1        $f20, 0x42EC($2)
/* 00C508 01DB8208 044355C4 */  lwc1        $f21, 0x4304($2)
/* 00C50C 01DB820C 989E8283 */  lb          $2, -0x6168($28)
/* 00C510 01DB8210 04004014 */  bnez        $2, .L01DB8224_2F3824
/* 00C514 01DB8214 00000000 */   nop
/* 00C518 01DB8218 949E80AF */  sw          $0, -0x616C($28)
/* 00C51C 01DB821C 01000224 */  addiu       $2, $0, 0x1
/* 00C520 01DB8220 989E82A3 */  sb          $2, -0x6168($28)
.L01DB8224_2F3824:
/* 00C524 01DB8224 949E828F */  lw          $2, -0x616C($28)
/* 00C528 01DB8228 01004224 */  addiu       $2, $2, 0x1
/* 00C52C 01DB822C 949E82AF */  sw          $2, -0x616C($28)
/* 00C530 01DB8230 949E828F */  lw          $2, -0x616C($28)
/* 00C534 01DB8234 F0004228 */  slti        $2, $2, 0xF0
/* 00C538 01DB8238 14004014 */  bnez        $2, .L01DB828C_2F388C
/* 00C53C 01DB823C 00000000 */   nop
/* 00C540 01DB8240 049D828F */  lw          $2, -0x62FC($28)
/* 00C544 01DB8244 EE004284 */  lh          $2, 0xEE($2)
/* 00C548 01DB8248 00084230 */  andi        $2, $2, 0x800
/* 00C54C 01DB824C 0E004010 */  beqz        $2, .L01DB8288_2F3888
/* 00C550 01DB8250 00000000 */   nop
/* 00C554 01DB8254 00006380 */  lb          $3, 0x0($3)
/* 00C558 01DB8258 40100300 */  sll         $2, $3, 1
/* 00C55C 01DB825C 21104400 */  addu        $2, $2, $4
/* 00C560 01DB8260 12004284 */  lh          $2, 0x12($2)
/* 00C564 01DB8264 08004018 */  blez        $2, .L01DB8288_2F3888
/* 00C568 01DB8268 00000000 */   nop
/* 00C56C 01DB826C 7F43023C */  lui         $2, (0x437F0000 >> 16)
/* 00C570 01DB8270 00608244 */  mtc1        $2, $f12
/* 00C574 01DB8274 3C2E0300 */  dsll32      $5, $3, 24
/* 00C578 01DB8278 3F2E0500 */  dsra32      $5, $5, 24
/* 00C57C 01DB827C 01000624 */  addiu       $6, $0, 0x1
/* 00C580 01DB8280 C4F9060C */  jal         AddNowLife__11CUserStatusFisf
/* 00C584 01DB8284 00000000 */   nop
.L01DB8288_2F3888:
/* 00C588 01DB8288 949E80AF */  sw          $0, -0x616C($28)
.L01DB828C_2F388C:
/* 00C58C 01DB828C 789C848F */  lw          $4, -0x6388($28)
/* 00C590 01DB8290 282E0070 */  paddub      $5, $0, $0
/* 00C594 01DB8294 94FA060C */  jal         Step__11CUserStatusFi
/* 00C598 01DB8298 00000000 */   nop
/* 00C59C 01DB829C 789C838F */  lw          $3, -0x6388($28)
/* 00C5A0 01DB82A0 04006280 */  lb          $2, 0x4($3)
/* 00C5A4 01DB82A4 80100200 */  sll         $2, $2, 2
/* 00C5A8 01DB82A8 21104300 */  addu        $2, $2, $3
/* 00C5AC 01DB82AC 04434EC4 */  lwc1        $f14, 0x4304($2)
/* 00C5B0 01DB82B0 EA01023C */  lui         $2, %hi(DngMessMan)
/* 00C5B4 01DB82B4 90764424 */  addiu       $4, $2, %lo(DngMessMan)
/* 00C5B8 01DB82B8 06A30046 */  mov.s       $f12, $f20
/* 00C5BC 01DB82BC 46AB0046 */  mov.s       $f13, $f21
/* 00C5C0 01DB82C0 0CD7060C */  jal         SetStatus_Dry__14CDngMessageManFfff
/* 00C5C4 01DB82C4 00000000 */   nop
/* 00C5C8 01DB82C8 C8C0060C */  jal         BtStatusAlarmAnime__Fv
/* 00C5CC 01DB82CC 00000000 */   nop
/* 00C5D0 01DB82D0 28860070 */  paddub      $16, $0, $0
/* 00C5D4 01DB82D4 0A000010 */  b           .L01DB8300_2F3900
/* 00C5D8 01DB82D8 00000000 */   nop
.L01DB82DC_2F38DC:
/* 00C5DC 01DB82DC C0101000 */  sll         $2, $16, 3
/* 00C5E0 01DB82E0 21105000 */  addu        $2, $2, $16
/* 00C5E4 01DB82E4 00190200 */  sll         $3, $2, 4
/* 00C5E8 01DB82E8 D801023C */  lui         $2, %hi(FrameObjAnim)
/* 00C5EC 01DB82EC 201F4224 */  addiu       $2, $2, %lo(FrameObjAnim)
/* 00C5F0 01DB82F0 21204300 */  addu        $4, $2, $3
/* 00C5F4 01DB82F4 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 00C5F8 01DB82F8 00000000 */   nop
/* 00C5FC 01DB82FC 01001026 */  addiu       $16, $16, 0x1
.L01DB8300_2F3900:
/* 00C600 01DB8300 1894828F */  lw          $2, -0x6BE8($28)
/* 00C604 01DB8304 2A100202 */  slt         $2, $16, $2
/* 00C608 01DB8308 F4FF4014 */  bnez        $2, .L01DB82DC_2F38DC
/* 00C60C 01DB830C 00000000 */   nop
/* 00C610 01DB8310 C89C908F */  lw          $16, -0x6338($28)
/* 00C614 01DB8314 50000426 */  addiu       $4, $16, 0x50
/* 00C618 01DB8318 BC85050C */  jal         FireStep__9CFireOmniFv
/* 00C61C 01DB831C 00000000 */   nop
/* 00C620 01DB8320 50000426 */  addiu       $4, $16, 0x50
/* 00C624 01DB8324 A088050C */  jal         RasterStep__9CFireOmniFv
/* 00C628 01DB8328 00000000 */   nop
/* 00C62C 01DB832C E601023C */  lui         $2, %hi(CWeaponFx)
/* 00C630 01DB8330 408F4424 */  addiu       $4, $2, %lo(CWeaponFx)
/* 00C634 01DB8334 D859070C */  jal         Step__13CWeaponEffectFv
/* 00C638 01DB8338 00000000 */   nop
/* 00C63C 01DB833C 28860070 */  paddub      $16, $0, $0
/* 00C640 01DB8340 0A000010 */  b           .L01DB836C_2F396C
/* 00C644 01DB8344 00000000 */   nop
.L01DB8348_2F3948:
/* 00C648 01DB8348 40111000 */  sll         $2, $16, 5
/* 00C64C 01DB834C 23105000 */  subu        $2, $2, $16
/* 00C650 01DB8350 80190200 */  sll         $3, $2, 6
/* 00C654 01DB8354 E601023C */  lui         $2, %hi(CWeaponElFx)
/* 00C658 01DB8358 80944224 */  addiu       $2, $2, %lo(CWeaponElFx)
/* 00C65C 01DB835C 21204300 */  addu        $4, $2, $3
/* 00C660 01DB8360 50DE060C */  jal         Step__14CWeaponElementFv
/* 00C664 01DB8364 00000000 */   nop
/* 00C668 01DB8368 01001026 */  addiu       $16, $16, 0x1
.L01DB836C_2F396C:
/* 00C66C 01DB836C 0400022A */  slti        $2, $16, 0x4
/* 00C670 01DB8370 F5FF4014 */  bnez        $2, .L01DB8348_2F3948
/* 00C674 01DB8374 00000000 */   nop
/* 00C678 01DB8378 28860070 */  paddub      $16, $0, $0
/* 00C67C 01DB837C 0A000010 */  b           .L01DB83A8_2F39A8
/* 00C680 01DB8380 00000000 */   nop
.L01DB8384_2F3984:
/* 00C684 01DB8384 40101000 */  sll         $2, $16, 1
/* 00C688 01DB8388 21105000 */  addu        $2, $2, $16
/* 00C68C 01DB838C 40190200 */  sll         $3, $2, 5
/* 00C690 01DB8390 EC01023C */  lui         $2, %hi(HitValue)
/* 00C694 01DB8394 40794224 */  addiu       $2, $2, %lo(HitValue)
/* 00C698 01DB8398 21204300 */  addu        $4, $2, $3
/* 00C69C 01DB839C 14DA060C */  jal         Step__9CHitValueFv
/* 00C6A0 01DB83A0 00000000 */   nop
/* 00C6A4 01DB83A4 01001026 */  addiu       $16, $16, 0x1
.L01DB83A8_2F39A8:
/* 00C6A8 01DB83A8 2000022A */  slti        $2, $16, 0x20
/* 00C6AC 01DB83AC F5FF4014 */  bnez        $2, .L01DB8384_2F3984
/* 00C6B0 01DB83B0 00000000 */   nop
/* 00C6B4 01DB83B4 EC01023C */  lui         $2, %hi(mainItemModel)
/* 00C6B8 01DB83B8 60504424 */  addiu       $4, $2, %lo(mainItemModel)
/* 00C6BC 01DB83BC 8853070C */  jal         Step__14CMainItemModelFv
/* 00C6C0 01DB83C0 00000000 */   nop
/* 00C6C4 01DB83C4 EC01023C */  lui         $2, %hi(WeaponCrashEffect)
/* 00C6C8 01DB83C8 E0DA4424 */  addiu       $4, $2, %lo(WeaponCrashEffect)
/* 00C6CC 01DB83CC 24CD060C */  jal         Step__8CHitMarkFv
/* 00C6D0 01DB83D0 00000000 */   nop
/* 00C6D4 01DB83D4 28860070 */  paddub      $16, $0, $0
/* 00C6D8 01DB83D8 17000010 */  b           .L01DB8438_2F3A38
/* 00C6DC 01DB83DC 00000000 */   nop
.L01DB83E0_2F39E0:
/* 00C6E0 01DB83E0 00111000 */  sll         $2, $16, 4
/* 00C6E4 01DB83E4 21185000 */  addu        $3, $2, $16
/* 00C6E8 01DB83E8 80100300 */  sll         $2, $3, 2
/* 00C6EC 01DB83EC 23104300 */  subu        $2, $2, $3
/* 00C6F0 01DB83F0 40190200 */  sll         $3, $2, 5
/* 00C6F4 01DB83F4 EC01023C */  lui         $2, %hi(HitMark)
/* 00C6F8 01DB83F8 40E14224 */  addiu       $2, $2, %lo(HitMark)
/* 00C6FC 01DB83FC 21204300 */  addu        $4, $2, $3
/* 00C700 01DB8400 24CD060C */  jal         Step__8CHitMarkFv
/* 00C704 01DB8404 00000000 */   nop
/* 00C708 01DB8408 40891000 */  sll         $17, $16, 5
/* 00C70C 01DB840C EC01023C */  lui         $2, %hi(HitPointMark)
/* 00C710 01DB8410 40474224 */  addiu       $2, $2, %lo(HitPointMark)
/* 00C714 01DB8414 21205100 */  addu        $4, $2, $17
/* 00C718 01DB8418 C4CD060C */  jal         Step__13CHitPointMarkFv
/* 00C71C 01DB841C 00000000 */   nop
/* 00C720 01DB8420 EC01023C */  lui         $2, %hi(MyHitPointMark)
/* 00C724 01DB8424 40494224 */  addiu       $2, $2, %lo(MyHitPointMark)
/* 00C728 01DB8428 21205100 */  addu        $4, $2, $17
/* 00C72C 01DB842C C4CD060C */  jal         Step__13CHitPointMarkFv
/* 00C730 01DB8430 00000000 */   nop
/* 00C734 01DB8434 01001026 */  addiu       $16, $16, 0x1
.L01DB8438_2F3A38:
/* 00C738 01DB8438 1000032A */  slti        $3, $16, 0x10
/* 00C73C 01DB843C E8FF6014 */  bnez        $3, .L01DB83E0_2F39E0
/* 00C740 01DB8440 00000000 */   nop
/* 00C744 01DB8444 289D838F */  lw          $3, -0x62D8($28)
/* 00C748 01DB8448 16006010 */  beqz        $3, .L01DB84A4_2F3AA4
/* 00C74C 01DB844C 00000000 */   nop
/* 00C750 01DB8450 EB01023C */  lui         $2, %hi(NewChangeFx)
/* 00C754 01DB8454 D03A4424 */  addiu       $4, $2, %lo(NewChangeFx)
/* 00C758 01DB8458 4CE1040C */  jal         Step__10CCharacterFv
/* 00C75C 01DB845C 00000000 */   nop
/* 00C760 01DB8460 EB01013C */  lui         $1, %hi(NewChangeFx + 0x344)
/* 00C764 01DB8464 143E238C */  lw          $3, %lo(NewChangeFx + 0x344)($1)
/* 00C768 01DB8468 040060C4 */  lwc1        $f0, 0x4($3)
/* 00C76C 01DB846C 60008046 */  cvt.s.w     $f1, $f0
/* 00C770 01DB8470 EB01013C */  lui         $1, %hi(NewChangeFx + 0x2F0)
/* 00C774 01DB8474 C03D22C4 */  lwc1        $f2, %lo(NewChangeFx + 0x2F0)($1)
/* 00C778 01DB8478 908280C7 */  lwc1        $f0, -0x7D70($28)
/* 00C77C 01DB847C 01080046 */  sub.s       $f0, $f1, $f0
/* 00C780 01DB8480 34100046 */  c.lt.s      $f2, $f0
/* 00C784 01DB8484 00000000 */  nop
/* 00C788 01DB8488 06000145 */  bc1t        .L01DB84A4_2F3AA4
/* 00C78C 01DB848C 00000000 */   nop
/* 00C790 01DB8490 34100146 */  c.lt.s      $f2, $f1
/* 00C794 01DB8494 00000000 */  nop
/* 00C798 01DB8498 02000045 */  bc1f        .L01DB84A4_2F3AA4
/* 00C79C 01DB849C 00000000 */   nop
/* 00C7A0 01DB84A0 289D80AF */  sw          $0, -0x62D8($28)
.L01DB84A4_2F3AA4:
/* 00C7A4 01DB84A4 2C9D838F */  lw          $3, -0x62D4($28)
/* 00C7A8 01DB84A8 08006010 */  beqz        $3, .L01DB84CC_2F3ACC
/* 00C7AC 01DB84AC 00000000 */   nop
/* 00C7B0 01DB84B0 349D838F */  lw          $3, -0x62CC($28)
/* 00C7B4 01DB84B4 05006010 */  beqz        $3, .L01DB84CC_2F3ACC
/* 00C7B8 01DB84B8 00000000 */   nop
/* 00C7BC 01DB84BC EB01023C */  lui         $2, %hi(shortAtraEffect)
/* 00C7C0 01DB84C0 A04C4424 */  addiu       $4, $2, %lo(shortAtraEffect)
/* 00C7C4 01DB84C4 4CE1040C */  jal         Step__10CCharacterFv
/* 00C7C8 01DB84C8 00000000 */   nop
.L01DB84CC_2F3ACC:
/* 00C7CC 01DB84CC 489D848F */  lw          $4, -0x62B8($28)
/* 00C7D0 01DB84D0 01000324 */  addiu       $3, $0, 0x1
/* 00C7D4 01DB84D4 09008314 */  bne         $4, $3, .L01DB84FC_2F3AFC
/* 00C7D8 01DB84D8 00000000 */   nop
/* 00C7DC 01DB84DC EB01023C */  lui         $2, %hi(itemOpenSmall)
/* 00C7E0 01DB84E0 505E4424 */  addiu       $4, $2, %lo(itemOpenSmall)
/* 00C7E4 01DB84E4 34DB060C */  jal         Step__12CMotionModelFv
/* 00C7E8 01DB84E8 00000000 */   nop
/* 00C7EC 01DB84EC EB01023C */  lui         $2, %hi(itemOpenSmallFx)
/* 00C7F0 01DB84F0 F05E4424 */  addiu       $4, $2, %lo(itemOpenSmallFx)
/* 00C7F4 01DB84F4 34DB060C */  jal         Step__12CMotionModelFv
/* 00C7F8 01DB84F8 00000000 */   nop
.L01DB84FC_2F3AFC:
/* 00C7FC 01DB84FC 609D848F */  lw          $4, -0x62A0($28)
/* 00C800 01DB8500 01000324 */  addiu       $3, $0, 0x1
/* 00C804 01DB8504 09008314 */  bne         $4, $3, .L01DB852C_2F3B2C
/* 00C808 01DB8508 00000000 */   nop
/* 00C80C 01DB850C EB01023C */  lui         $2, %hi(itemOpenBig)
/* 00C810 01DB8510 905F4424 */  addiu       $4, $2, %lo(itemOpenBig)
/* 00C814 01DB8514 34DB060C */  jal         Step__12CMotionModelFv
/* 00C818 01DB8518 00000000 */   nop
/* 00C81C 01DB851C EB01023C */  lui         $2, %hi(itemOpenBigFx)
/* 00C820 01DB8520 30604424 */  addiu       $4, $2, %lo(itemOpenBigFx)
/* 00C824 01DB8524 34DB060C */  jal         Step__12CMotionModelFv
/* 00C828 01DB8528 00000000 */   nop
.L01DB852C_2F3B2C:
/* 00C82C 01DB852C E49C838F */  lw          $3, -0x631C($28)
/* 00C830 01DB8530 04006014 */  bnez        $3, .L01DB8544_2F3B44
/* 00C834 01DB8534 00000000 */   nop
/* 00C838 01DB8538 189E838F */  lw          $3, -0x61E8($28)
/* 00C83C 01DB853C 03006010 */  beqz        $3, .L01DB854C_2F3B4C
/* 00C840 01DB8540 00000000 */   nop
.L01DB8544_2F3B44:
/* 00C844 01DB8544 87000010 */  b           .L01DB8764_2F3D64
/* 00C848 01DB8548 00000000 */   nop
.L01DB854C_2F3B4C:
/* 00C84C 01DB854C DC01013C */  lui         $1, %hi(BtActStatus + 0x124)
/* 00C850 01DB8550 A445228C */  lw          $2, %lo(BtActStatus + 0x124)($1)
/* 00C854 01DB8554 22004018 */  blez        $2, .L01DB85E0_2F3BE0
/* 00C858 01DB8558 00000000 */   nop
/* 00C85C 01DB855C DC01013C */  lui         $1, %hi(BtActStatus + 0x118)
/* 00C860 01DB8560 984534C4 */  lwc1        $f20, %lo(BtActStatus + 0x118)($1)
/* 00C864 01DB8564 BE11040C */  jal         rand
/* 00C868 01DB8568 00000000 */   nop
/* 00C86C 01DB856C 00008244 */  mtc1        $2, $f0
/* 00C870 01DB8570 00000000 */  nop
/* 00C874 01DB8574 20008046 */  cvt.s.w     $f0, $f0
/* 00C878 01DB8578 42A00046 */  mul.s       $f1, $f20, $f0
/* 00C87C 01DB857C 0040023C */  lui         $2, (0x40000000 >> 16)
/* 00C880 01DB8580 00008244 */  mtc1        $2, $f0
/* 00C884 01DB8584 00000000 */  nop
/* 00C888 01DB8588 42000146 */  mul.s       $f1, $f0, $f1
/* 00C88C 01DB858C 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 00C890 01DB8590 00008244 */  mtc1        $2, $f0
/* 00C894 01DB8594 00000000 */  nop
/* 00C898 01DB8598 03080046 */  div.s       $f0, $f1, $f0
/* 00C89C 01DB859C 01001446 */  sub.s       $f0, $f0, $f20
/* 00C8A0 01DB85A0 DC01013C */  lui         $1, %hi(BtActStatus + 0x120)
/* 00C8A4 01DB85A4 A04520E4 */  swc1        $f0, %lo(BtActStatus + 0x120)($1)
/* 00C8A8 01DB85A8 DC01013C */  lui         $1, %hi(BtActStatus + 0x118)
/* 00C8AC 01DB85AC 984521C4 */  lwc1        $f1, %lo(BtActStatus + 0x118)($1)
/* 00C8B0 01DB85B0 DC01013C */  lui         $1, %hi(BtActStatus + 0x11C)
/* 00C8B4 01DB85B4 9C4520C4 */  lwc1        $f0, %lo(BtActStatus + 0x11C)($1)
/* 00C8B8 01DB85B8 01080046 */  sub.s       $f0, $f1, $f0
/* 00C8BC 01DB85BC DC01013C */  lui         $1, %hi(BtActStatus + 0x118)
/* 00C8C0 01DB85C0 984520E4 */  swc1        $f0, %lo(BtActStatus + 0x118)($1)
/* 00C8C4 01DB85C4 DC01013C */  lui         $1, %hi(BtActStatus + 0x124)
/* 00C8C8 01DB85C8 A445228C */  lw          $2, %lo(BtActStatus + 0x124)($1)
/* 00C8CC 01DB85CC FFFF4224 */  addiu       $2, $2, -0x1
/* 00C8D0 01DB85D0 DC01013C */  lui         $1, %hi(BtActStatus + 0x124)
/* 00C8D4 01DB85D4 A44522AC */  sw          $2, %lo(BtActStatus + 0x124)($1)
/* 00C8D8 01DB85D8 03000010 */  b           .L01DB85E8_2F3BE8
/* 00C8DC 01DB85DC 00000000 */   nop
.L01DB85E0_2F3BE0:
/* 00C8E0 01DB85E0 DC01013C */  lui         $1, %hi(BtActStatus + 0x120)
/* 00C8E4 01DB85E4 A04520AC */  sw          $0, %lo(BtActStatus + 0x120)($1)
.L01DB85E8_2F3BE8:
/* 00C8E8 01DB85E8 DC01013C */  lui         $1, %hi(BtActStatus + 0x128)
/* 00C8EC 01DB85EC A845228C */  lw          $2, %lo(BtActStatus + 0x128)($1)
/* 00C8F0 01DB85F0 04004018 */  blez        $2, .L01DB8604_2F3C04
/* 00C8F4 01DB85F4 00000000 */   nop
/* 00C8F8 01DB85F8 FFFF4224 */  addiu       $2, $2, -0x1
/* 00C8FC 01DB85FC DC01013C */  lui         $1, %hi(BtActStatus + 0x128)
/* 00C900 01DB8600 A84522AC */  sw          $2, %lo(BtActStatus + 0x128)($1)
.L01DB8604_2F3C04:
/* 00C904 01DB8604 089D848F */  lw          $4, -0x62F8($28)
/* 00C908 01DB8608 E85B070C */  jal         CheckPosition__11CRandomItemFv
/* 00C90C 01DB860C 00000000 */   nop
/* 00C910 01DB8610 789C858F */  lw          $5, -0x6388($28)
/* 00C914 01DB8614 4643A394 */  lhu         $3, 0x4346($5)
/* 00C918 01DB8618 21206200 */  addu        $4, $3, $2
/* 00C91C 01DB861C FFFF0334 */  ori         $3, $0, 0xFFFF
/* 00C920 01DB8620 2A108300 */  slt         $2, $4, $3
/* 00C924 01DB8624 04004014 */  bnez        $2, .L01DB8638_2F3C38
/* 00C928 01DB8628 00000000 */   nop
/* 00C92C 01DB862C 4643A3A4 */  sh          $3, 0x4346($5)
/* 00C930 01DB8630 02000010 */  b           .L01DB863C_2F3C3C
/* 00C934 01DB8634 00000000 */   nop
.L01DB8638_2F3C38:
/* 00C938 01DB8638 4643A4A4 */  sh          $4, 0x4346($5)
.L01DB863C_2F3C3C:
/* 00C93C 01DB863C 089D848F */  lw          $4, -0x62F8($28)
/* 00C940 01DB8640 E05C070C */  jal         Step__11CRandomItemFv
/* 00C944 01DB8644 00000000 */   nop
/* 00C948 01DB8648 EB01023C */  lui         $2, %hi(StealItem)
/* 00C94C 01DB864C 00834424 */  addiu       $4, $2, %lo(StealItem)
/* 00C950 01DB8650 805D070C */  jal         Step__10CStealItemFv
/* 00C954 01DB8654 00000000 */   nop
/* 00C958 01DB8658 28860070 */  paddub      $16, $0, $0
/* 00C95C 01DB865C 0A000010 */  b           .L01DB8688_2F3C88
/* 00C960 01DB8660 00000000 */   nop
.L01DB8664_2F3C64:
/* 00C964 01DB8664 40101000 */  sll         $2, $16, 1
/* 00C968 01DB8668 21105000 */  addu        $2, $2, $16
/* 00C96C 01DB866C 80190200 */  sll         $3, $2, 6
/* 00C970 01DB8670 F001023C */  lui         $2, %hi(CBomb__2)
/* 00C974 01DB8674 D0FE4224 */  addiu       $2, $2, %lo(CBomb__2)
/* 00C978 01DB8678 21204300 */  addu        $4, $2, $3
/* 00C97C 01DB867C AC57070C */  jal         Step__15CItemBombEffectFv
/* 00C980 01DB8680 00000000 */   nop
/* 00C984 01DB8684 01001026 */  addiu       $16, $16, 0x1
.L01DB8688_2F3C88:
/* 00C988 01DB8688 0300022A */  slti        $2, $16, 0x3
/* 00C98C 01DB868C F5FF4014 */  bnez        $2, .L01DB8664_2F3C64
/* 00C990 01DB8690 00000000 */   nop
/* 00C994 01DB8694 28860070 */  paddub      $16, $0, $0
/* 00C998 01DB8698 09000010 */  b           .L01DB86C0_2F3CC0
/* 00C99C 01DB869C 00000000 */   nop
.L01DB86A0_2F3CA0:
/* 00C9A0 01DB86A0 60A10234 */  ori         $2, $0, 0xA160
/* 00C9A4 01DB86A4 18180202 */  mult        $3, $16, $2
/* 00C9A8 01DB86A8 E601023C */  lui         $2, %hi(MasekiEffect)
/* 00C9AC 01DB86AC 80B34224 */  addiu       $2, $2, %lo(MasekiEffect)
/* 00C9B0 01DB86B0 21204300 */  addu        $4, $2, $3
/* 00C9B4 01DB86B4 60B0060C */  jal         Step__12CSHOT_EFFECTFv
/* 00C9B8 01DB86B8 00000000 */   nop
/* 00C9BC 01DB86BC 01001026 */  addiu       $16, $16, 0x1
.L01DB86C0_2F3CC0:
/* 00C9C0 01DB86C0 0500022A */  slti        $2, $16, 0x5
/* 00C9C4 01DB86C4 F6FF4014 */  bnez        $2, .L01DB86A0_2F3CA0
/* 00C9C8 01DB86C8 00000000 */   nop
/* 00C9CC 01DB86CC F89D848F */  lw          $4, -0x6208($28)
/* 00C9D0 01DB86D0 3859070C */  jal         Step__10CShockWaveFv
/* 00C9D4 01DB86D4 00000000 */   nop
/* 00C9D8 01DB86D8 E89D918F */  lw          $17, -0x6218($28)
/* 00C9DC 01DB86DC 28860070 */  paddub      $16, $0, $0
/* 00C9E0 01DB86E0 07000010 */  b           .L01DB8700_2F3D00
/* 00C9E4 01DB86E4 00000000 */   nop
.L01DB86E8_2F3CE8:
/* 00C9E8 01DB86E8 60A10234 */  ori         $2, $0, 0xA160
/* 00C9EC 01DB86EC 18100202 */  mult        $2, $16, $2
/* 00C9F0 01DB86F0 21202202 */  addu        $4, $17, $2
/* 00C9F4 01DB86F4 60B0060C */  jal         Step__12CSHOT_EFFECTFv
/* 00C9F8 01DB86F8 00000000 */   nop
/* 00C9FC 01DB86FC 01001026 */  addiu       $16, $16, 0x1
.L01DB8700_2F3D00:
/* 00CA00 01DB8700 0500022A */  slti        $2, $16, 0x5
/* 00CA04 01DB8704 F8FF4014 */  bnez        $2, .L01DB86E8_2F3CE8
/* 00CA08 01DB8708 00000000 */   nop
/* 00CA0C 01DB870C F001023C */  lui         $2, %hi(OzumondShot)
/* 00CA10 01DB8710 30B04424 */  addiu       $4, $2, %lo(OzumondShot)
/* 00CA14 01DB8714 D4B9060C */  jal         Step__15CSHOT_MACHINGUNFv
/* 00CA18 01DB8718 00000000 */   nop
/* 00CA1C 01DB871C F001023C */  lui         $2, %hi(OzumondFire)
/* 00CA20 01DB8720 F0B24424 */  addiu       $4, $2, %lo(OzumondFire)
/* 00CA24 01DB8724 E8BB060C */  jal         Step__13CSHOT_FIREBARFv
/* 00CA28 01DB8728 00000000 */   nop
/* 00CA2C 01DB872C F001023C */  lui         $2, %hi(OzumondShotEffect)
/* 00CA30 01DB8730 00C04424 */  addiu       $4, $2, %lo(OzumondShotEffect)
/* 00CA34 01DB8734 B4BA060C */  jal         Step__21CHIT_MACHINGUN_EFFECTFv
/* 00CA38 01DB8738 00000000 */   nop
/* 00CA3C 01DB873C FC9C848F */  lw          $4, -0x6304($28)
/* 00CA40 01DB8740 60B0060C */  jal         Step__12CSHOT_EFFECTFv
/* 00CA44 01DB8744 00000000 */   nop
/* 00CA48 01DB8748 E49D848F */  lw          $4, -0x621C($28)
/* 00CA4C 01DB874C 44AF060C */  jal         step__5CSHOTFv
/* 00CA50 01DB8750 00000000 */   nop
/* 00CA54 01DB8754 EC01023C */  lui         $2, %hi(HealEffect)
/* 00CA58 01DB8758 404B4424 */  addiu       $4, $2, %lo(HealEffect)
/* 00CA5C 01DB875C C0CA060C */  jal         Step__11CHealEffectFv
/* 00CA60 01DB8760 00000000 */   nop
.L01DB8764_2F3D64:
/* 00CA64 01DB8764 4000BF7B */  lq          $31, 0x40($29)
/* 00CA68 01DB8768 3000B27B */  lq          $18, 0x30($29)
/* 00CA6C 01DB876C 2000B17B */  lq          $17, 0x20($29)
/* 00CA70 01DB8770 1000B07B */  lq          $16, 0x10($29)
/* 00CA74 01DB8774 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 00CA78 01DB8778 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 00CA7C 01DB877C A000BD27 */  addiu       $29, $29, 0xA0
/* 00CA80 01DB8780 0800E003 */  jr          $31
/* 00CA84 01DB8784 00000000 */   nop
/* 00CA88 01DB8788 00000000 */  nop
/* 00CA8C 01DB878C 00000000 */  nop
