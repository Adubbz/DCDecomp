.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleActionPlay_Jinn__FP10CCharacteri
/* 010C30 01DBC930 20FFBD27 */  addiu       $29, $29, -0xE0
/* 010C34 01DBC934 7000BF7F */  sq          $31, 0x70($29)
/* 010C38 01DBC938 6000B57F */  sq          $21, 0x60($29)
/* 010C3C 01DBC93C 5000B47F */  sq          $20, 0x50($29)
/* 010C40 01DBC940 4000B37F */  sq          $19, 0x40($29)
/* 010C44 01DBC944 3000B27F */  sq          $18, 0x30($29)
/* 010C48 01DBC948 2000B17F */  sq          $17, 0x20($29)
/* 010C4C 01DBC94C 1000B07F */  sq          $16, 0x10($29)
/* 010C50 01DBC950 0000B4E7 */  swc1        $f20, 0x0($29)
/* 010C54 01DBC954 28868070 */  paddub      $16, $4, $0
/* 010C58 01DBC958 2896A070 */  paddub      $18, $5, $0
/* 010C5C 01DBC95C F00294C4 */  lwc1        $f20, 0x2F0($4)
/* 010C60 01DBC960 049D828F */  lw          $2, -0x62FC($28)
/* 010C64 01DBC964 04005184 */  lh          $17, 0x4($2)
/* 010C68 01DBC968 08000424 */  addiu       $4, $0, 0x8
/* 010C6C 01DBC96C 4CC6060C */  jal         StatusErrCheck__Fi
/* 010C70 01DBC970 00000000 */   nop
/* 010C74 01DBC974 02004010 */  beqz        $2, .L01DBC980_2F7F80
/* 010C78 01DBC978 00000000 */   nop
/* 010C7C 01DBC97C 40881100 */  sll         $17, $17, 1
.L01DBC980_2F7F80:
/* 010C80 01DBC980 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 010C84 01DBC984 9444248C */  lw          $4, %lo(BtActStatus + 0x14)($1)
/* 010C88 01DBC988 0B000324 */  addiu       $3, $0, 0xB
/* 010C8C 01DBC98C 29008314 */  bne         $4, $3, .L01DBCA34_2F8034
/* 010C90 01DBC990 00000000 */   nop
/* 010C94 01DBC994 CC01023C */  lui         $2, %hi(GamePad)
/* 010C98 01DBC998 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 010C9C 01DBC99C 9C9C858F */  lw          $5, -0x6364($28)
/* 010CA0 01DBC9A0 04AE040C */  jal         On__8CGamePadFi
/* 010CA4 01DBC9A4 00000000 */   nop
/* 010CA8 01DBC9A8 04004014 */  bnez        $2, .L01DBC9BC_2F7FBC
/* 010CAC 01DBC9AC 00000000 */   nop
/* 010CB0 01DBC9B0 01000324 */  addiu       $3, $0, 0x1
/* 010CB4 01DBC9B4 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 010CB8 01DBC9B8 984423AC */  sw          $3, %lo(BtActStatus + 0x18)($1)
.L01DBC9BC_2F7FBC:
/* 010CBC 01DBC9BC 0B000324 */  addiu       $3, $0, 0xB
/* 010CC0 01DBC9C0 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 010CC4 01DBC9C4 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
/* 010CC8 01DBC9C8 4403038E */  lw          $3, 0x344($16)
/* 010CCC 01DBC9CC B40060C4 */  lwc1        $f0, 0xB4($3)
/* 010CD0 01DBC9D0 60008046 */  cvt.s.w     $f1, $f0
/* 010CD4 01DBC9D4 0040033C */  lui         $3, (0x40000000 >> 16)
/* 010CD8 01DBC9D8 00008344 */  mtc1        $3, $f0
/* 010CDC 01DBC9DC 00000000 */  nop
/* 010CE0 01DBC9E0 01080046 */  sub.s       $f0, $f1, $f0
/* 010CE4 01DBC9E4 34A00046 */  c.lt.s      $f20, $f0
/* 010CE8 01DBC9E8 00000000 */  nop
/* 010CEC 01DBC9EC 11000145 */  bc1t        .L01DBCA34_2F8034
/* 010CF0 01DBC9F0 00000000 */   nop
/* 010CF4 01DBC9F4 36A00146 */  c.le.s      $f20, $f1
/* 010CF8 01DBC9F8 00000000 */  nop
/* 010CFC 01DBC9FC 0D000045 */  bc1f        .L01DBCA34_2F8034
/* 010D00 01DBCA00 00000000 */   nop
/* 010D04 01DBCA04 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 010D08 01DBCA08 9844238C */  lw          $3, %lo(BtActStatus + 0x18)($1)
/* 010D0C 01DBCA0C 06006014 */  bnez        $3, .L01DBCA28_2F8028
/* 010D10 01DBCA10 00000000 */   nop
/* 010D14 01DBCA14 0C000324 */  addiu       $3, $0, 0xC
/* 010D18 01DBCA18 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 010D1C 01DBCA1C 944423AC */  sw          $3, %lo(BtActStatus + 0x14)($1)
/* 010D20 01DBCA20 04000010 */  b           .L01DBCA34_2F8034
/* 010D24 01DBCA24 00000000 */   nop
.L01DBCA28_2F8028:
/* 010D28 01DBCA28 0D000324 */  addiu       $3, $0, 0xD
/* 010D2C 01DBCA2C DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 010D30 01DBCA30 944423AC */  sw          $3, %lo(BtActStatus + 0x14)($1)
.L01DBCA34_2F8034:
/* 010D34 01DBCA34 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 010D38 01DBCA38 9444248C */  lw          $4, %lo(BtActStatus + 0x14)($1)
/* 010D3C 01DBCA3C 0D000324 */  addiu       $3, $0, 0xD
/* 010D40 01DBCA40 07018314 */  bne         $4, $3, .L01DBCE60_2F8460
/* 010D44 01DBCA44 00000000 */   nop
/* 010D48 01DBCA48 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 010D4C 01DBCA4C 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
/* 010D50 01DBCA50 88004016 */  bnez        $18, .L01DBCC74_2F8274
/* 010D54 01DBCA54 00000000 */   nop
/* 010D58 01DBCA58 7B43033C */  lui         $3, (0x437B0000 >> 16)
/* 010D5C 01DBCA5C 00008344 */  mtc1        $3, $f0
/* 010D60 01DBCA60 00000000 */  nop
/* 010D64 01DBCA64 36A00046 */  c.le.s      $f20, $f0
/* 010D68 01DBCA68 00000000 */  nop
/* 010D6C 01DBCA6C DD000145 */  bc1t        .L01DBCDE4_2F83E4
/* 010D70 01DBCA70 00000000 */   nop
/* 010D74 01DBCA74 7C43033C */  lui         $3, (0x437C0000 >> 16)
/* 010D78 01DBCA78 00008344 */  mtc1        $3, $f0
/* 010D7C 01DBCA7C 00000000 */  nop
/* 010D80 01DBCA80 34A00046 */  c.lt.s      $f20, $f0
/* 010D84 01DBCA84 00000000 */  nop
/* 010D88 01DBCA88 D6000045 */  bc1f        .L01DBCDE4_2F83E4
/* 010D8C 01DBCA8C 00000000 */   nop
/* 010D90 01DBCA90 91010424 */  addiu       $4, $0, 0x191
/* 010D94 01DBCA94 FFFF0524 */  addiu       $5, $0, -0x1
/* 010D98 01DBCA98 28360070 */  paddub      $6, $0, $0
/* 010D9C 01DBCA9C AC69050C */  jal         SndSePlay__Fiii
/* 010DA0 01DBCAA0 00000000 */   nop
/* 010DA4 01DBCAA4 A5010424 */  addiu       $4, $0, 0x1A5
/* 010DA8 01DBCAA8 FFFF0524 */  addiu       $5, $0, -0x1
/* 010DAC 01DBCAAC 28360070 */  paddub      $6, $0, $0
/* 010DB0 01DBCAB0 AC69050C */  jal         SndSePlay__Fiii
/* 010DB4 01DBCAB4 00000000 */   nop
/* 010DB8 01DBCAB8 DC01023C */  lui         $2, %hi(LIT_5687)
/* 010DBC 01DBCABC C0284224 */  addiu       $2, $2, %lo(LIT_5687)
/* 010DC0 01DBCAC0 A000A327 */  addiu       $3, $29, 0xA0
/* 010DC4 01DBCAC4 00004278 */  lq          $2, 0x0($2)
/* 010DC8 01DBCAC8 0000627C */  sq          $2, 0x0($3)
/* 010DCC 01DBCACC 009D828F */  lw          $2, -0x6300($28)
/* 010DD0 01DBCAD0 BC00448C */  lw          $4, 0xBC($2)
/* 010DD4 01DBCAD4 DC01023C */  lui         $2, %hi(LIT_5735)
/* 010DD8 01DBCAD8 98334524 */  addiu       $5, $2, %lo(LIT_5735)
/* 010DDC 01DBCADC C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 010DE0 01DBCAE0 00000000 */   nop
/* 010DE4 01DBCAE4 5C004010 */  beqz        $2, .L01DBCC58_2F8258
/* 010DE8 01DBCAE8 00000000 */   nop
/* 010DEC 01DBCAEC 28264070 */  paddub      $4, $2, $0
/* 010DF0 01DBCAF0 8000A527 */  addiu       $5, $29, 0x80
/* 010DF4 01DBCAF4 A000A627 */  addiu       $6, $29, 0xA0
/* 010DF8 01DBCAF8 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 010DFC 01DBCAFC 00000000 */   nop
/* 010E00 01DBCB00 989D828F */  lw          $2, -0x6268($28)
/* 010E04 01DBCB04 0E004014 */  bnez        $2, .L01DBCB40_2F8140
/* 010E08 01DBCB08 00000000 */   nop
/* 010E0C 01DBCB0C EA01023C */  lui         $2, %hi(CharaMain)
/* 010E10 01DBCB10 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 010E14 01DBCB14 E05B050C */  jal         GetRotation__7CObjectFv
/* 010E18 01DBCB18 00000000 */   nop
/* 010E1C 01DBCB1C 04004DC4 */  lwc1        $f13, 0x4($2)
/* 010E20 01DBCB20 00708044 */  mtc1        $0, $f14
/* 010E24 01DBCB24 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 010E28 01DBCB28 00608244 */  mtc1        $2, $f12
/* 010E2C 01DBCB2C 9000A427 */  addiu       $4, $29, 0x90
/* 010E30 01DBCB30 4050070C */  jal         setShotVector__FPffff
/* 010E34 01DBCB34 00000000 */   nop
/* 010E38 01DBCB38 21000010 */  b           .L01DBCBC0_2F81C0
/* 010E3C 01DBCB3C 00000000 */   nop
.L01DBCB40_2F8140:
/* 010E40 01DBCB40 DC01013C */  lui         $1, %hi(BtActStatus + 0x80)
/* 010E44 01DBCB44 004521C4 */  lwc1        $f1, %lo(BtActStatus + 0x80)($1)
/* 010E48 01DBCB48 8000A0C7 */  lwc1        $f0, 0x80($29)
/* 010E4C 01DBCB4C 01080046 */  sub.s       $f0, $f1, $f0
/* 010E50 01DBCB50 9000A0E7 */  swc1        $f0, 0x90($29)
/* 010E54 01DBCB54 DC01013C */  lui         $1, %hi(BtActStatus + 0x84)
/* 010E58 01DBCB58 044521C4 */  lwc1        $f1, %lo(BtActStatus + 0x84)($1)
/* 010E5C 01DBCB5C 8400A0C7 */  lwc1        $f0, 0x84($29)
/* 010E60 01DBCB60 01080046 */  sub.s       $f0, $f1, $f0
/* 010E64 01DBCB64 9400B227 */  addiu       $18, $29, 0x94
/* 010E68 01DBCB68 000040E6 */  swc1        $f0, 0x0($18)
/* 010E6C 01DBCB6C DC01013C */  lui         $1, %hi(BtActStatus + 0x88)
/* 010E70 01DBCB70 084521C4 */  lwc1        $f1, %lo(BtActStatus + 0x88)($1)
/* 010E74 01DBCB74 8800A0C7 */  lwc1        $f0, 0x88($29)
/* 010E78 01DBCB78 01080046 */  sub.s       $f0, $f1, $f0
/* 010E7C 01DBCB7C 9800B327 */  addiu       $19, $29, 0x98
/* 010E80 01DBCB80 000060E6 */  swc1        $f0, 0x0($19)
/* 010E84 01DBCB84 9000A427 */  addiu       $4, $29, 0x90
/* 010E88 01DBCB88 282E8070 */  paddub      $5, $4, $0
/* 010E8C 01DBCB8C 9285040C */  jal         sceVu0Normalize
/* 010E90 01DBCB90 00000000 */   nop
/* 010E94 01DBCB94 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 010E98 01DBCB98 00088244 */  mtc1        $2, $f1
/* 010E9C 01DBCB9C 9000A0C7 */  lwc1        $f0, 0x90($29)
/* 010EA0 01DBCBA0 02000146 */  mul.s       $f0, $f0, $f1
/* 010EA4 01DBCBA4 9000A0E7 */  swc1        $f0, 0x90($29)
/* 010EA8 01DBCBA8 000040C6 */  lwc1        $f0, 0x0($18)
/* 010EAC 01DBCBAC 02000146 */  mul.s       $f0, $f0, $f1
/* 010EB0 01DBCBB0 000040E6 */  swc1        $f0, 0x0($18)
/* 010EB4 01DBCBB4 000060C6 */  lwc1        $f0, 0x0($19)
/* 010EB8 01DBCBB8 02000146 */  mul.s       $f0, $f0, $f1
/* 010EBC 01DBCBBC 000060E6 */  swc1        $f0, 0x0($19)
.L01DBCBC0_2F81C0:
/* 010EC0 01DBCBC0 E49D928F */  lw          $18, -0x621C($28)
/* 010EC4 01DBCBC4 281E0070 */  paddub      $3, $0, $0
/* 010EC8 01DBCBC8 1E000010 */  b           .L01DBCC44_2F8244
/* 010ECC 01DBCBCC 00000000 */   nop
.L01DBCBD0_2F81D0:
/* 010ED0 01DBCBD0 80980300 */  sll         $19, $3, 2
/* 010ED4 01DBCBD4 21107202 */  addu        $2, $19, $18
/* 010ED8 01DBCBD8 D0035424 */  addiu       $20, $2, 0x3D0
/* 010EDC 01DBCBDC D003428C */  lw          $2, 0x3D0($2)
/* 010EE0 01DBCBE0 17004014 */  bnez        $2, .L01DBCC40_2F8240
/* 010EE4 01DBCBE4 00000000 */   nop
/* 010EE8 01DBCBE8 00110300 */  sll         $2, $3, 4
/* 010EEC 01DBCBEC 21A84202 */  addu        $21, $18, $2
/* 010EF0 01DBCBF0 4000A426 */  addiu       $4, $21, 0x40
/* 010EF4 01DBCBF4 8000A527 */  addiu       $5, $29, 0x80
/* 010EF8 01DBCBF8 0C86040C */  jal         sceVu0CopyVector
/* 010EFC 01DBCBFC 00000000 */   nop
/* 010F00 01DBCC00 C001A426 */  addiu       $4, $21, 0x1C0
/* 010F04 01DBCC04 9000A527 */  addiu       $5, $29, 0x90
/* 010F08 01DBCC08 0C86040C */  jal         sceVu0CopyVector
/* 010F0C 01DBCC0C 00000000 */   nop
/* 010F10 01DBCC10 78000224 */  addiu       $2, $0, 0x78
/* 010F14 01DBCC14 21187202 */  addu        $3, $19, $18
/* 010F18 01DBCC18 B00262AC */  sw          $2, 0x2B0($3)
/* 010F1C 01DBCC1C E00271AC */  sw          $17, 0x2E0($3)
/* 010F20 01DBCC20 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 010F24 01DBCC24 100362AC */  sw          $2, 0x310($3)
/* 010F28 01DBCC28 800260AC */  sw          $0, 0x280($3)
/* 010F2C 01DBCC2C A00360AC */  sw          $0, 0x3A0($3)
/* 010F30 01DBCC30 01000224 */  addiu       $2, $0, 0x1
/* 010F34 01DBCC34 000082AE */  sw          $2, 0x0($20)
/* 010F38 01DBCC38 05000010 */  b           .L01DBCC50_2F8250
/* 010F3C 01DBCC3C 00000000 */   nop
.L01DBCC40_2F8240:
/* 010F40 01DBCC40 01006324 */  addiu       $3, $3, 0x1
.L01DBCC44_2F8244:
/* 010F44 01DBCC44 0C006228 */  slti        $2, $3, 0xC
/* 010F48 01DBCC48 E1FF4014 */  bnez        $2, .L01DBCBD0_2F81D0
/* 010F4C 01DBCC4C 00000000 */   nop
.L01DBCC50_2F8250:
/* 010F50 01DBCC50 DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 010F54 01DBCC54 604520AC */  sw          $0, %lo(BtActStatus + 0xE0)($1)
.L01DBCC58_2F8258:
/* 010F58 01DBCC58 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 010F5C 01DBCC5C 00608244 */  mtc1        $2, $f12
/* 010F60 01DBCC60 28260070 */  paddub      $4, $0, $0
/* 010F64 01DBCC64 CCE6760C */  jal         SwordDmgCheck1__Ffi
/* 010F68 01DBCC68 00000000 */   nop
/* 010F6C 01DBCC6C 5D000010 */  b           .L01DBCDE4_2F83E4
/* 010F70 01DBCC70 00000000 */   nop
.L01DBCC74_2F8274:
/* 010F74 01DBCC74 A841033C */  lui         $3, (0x41A80000 >> 16)
/* 010F78 01DBCC78 00008344 */  mtc1        $3, $f0
/* 010F7C 01DBCC7C 00000000 */  nop
/* 010F80 01DBCC80 36A00046 */  c.le.s      $f20, $f0
/* 010F84 01DBCC84 00000000 */  nop
/* 010F88 01DBCC88 56000145 */  bc1t        .L01DBCDE4_2F83E4
/* 010F8C 01DBCC8C 00000000 */   nop
/* 010F90 01DBCC90 AC41033C */  lui         $3, (0x41AC0000 >> 16)
/* 010F94 01DBCC94 00008344 */  mtc1        $3, $f0
/* 010F98 01DBCC98 00000000 */  nop
/* 010F9C 01DBCC9C 34A00046 */  c.lt.s      $f20, $f0
/* 010FA0 01DBCCA0 00000000 */  nop
/* 010FA4 01DBCCA4 4F000045 */  bc1f        .L01DBCDE4_2F83E4
/* 010FA8 01DBCCA8 00000000 */   nop
/* 010FAC 01DBCCAC 91010424 */  addiu       $4, $0, 0x191
/* 010FB0 01DBCCB0 FFFF0524 */  addiu       $5, $0, -0x1
/* 010FB4 01DBCCB4 28360070 */  paddub      $6, $0, $0
/* 010FB8 01DBCCB8 AC69050C */  jal         SndSePlay__Fiii
/* 010FBC 01DBCCBC 00000000 */   nop
/* 010FC0 01DBCCC0 A5010424 */  addiu       $4, $0, 0x1A5
/* 010FC4 01DBCCC4 FFFF0524 */  addiu       $5, $0, -0x1
/* 010FC8 01DBCCC8 28360070 */  paddub      $6, $0, $0
/* 010FCC 01DBCCCC AC69050C */  jal         SndSePlay__Fiii
/* 010FD0 01DBCCD0 00000000 */   nop
/* 010FD4 01DBCCD4 DC01023C */  lui         $2, %hi(LIT_5697)
/* 010FD8 01DBCCD8 D0284224 */  addiu       $2, $2, %lo(LIT_5697)
/* 010FDC 01DBCCDC D000A327 */  addiu       $3, $29, 0xD0
/* 010FE0 01DBCCE0 00004278 */  lq          $2, 0x0($2)
/* 010FE4 01DBCCE4 0000627C */  sq          $2, 0x0($3)
/* 010FE8 01DBCCE8 009D828F */  lw          $2, -0x6300($28)
/* 010FEC 01DBCCEC BC00448C */  lw          $4, 0xBC($2)
/* 010FF0 01DBCCF0 DC01023C */  lui         $2, %hi(LIT_5735)
/* 010FF4 01DBCCF4 98334524 */  addiu       $5, $2, %lo(LIT_5735)
/* 010FF8 01DBCCF8 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 010FFC 01DBCCFC 00000000 */   nop
/* 011000 01DBCD00 33004010 */  beqz        $2, .L01DBCDD0_2F83D0
/* 011004 01DBCD04 00000000 */   nop
/* 011008 01DBCD08 28264070 */  paddub      $4, $2, $0
/* 01100C 01DBCD0C B000A527 */  addiu       $5, $29, 0xB0
/* 011010 01DBCD10 D000A627 */  addiu       $6, $29, 0xD0
/* 011014 01DBCD14 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 011018 01DBCD18 00000000 */   nop
/* 01101C 01DBCD1C 6040023C */  lui         $2, (0x40600000 >> 16)
/* 011020 01DBCD20 00608244 */  mtc1        $2, $f12
/* 011024 01DBCD24 C000A427 */  addiu       $4, $29, 0xC0
/* 011028 01DBCD28 AC9C8DC7 */  lwc1        $f13, -0x6354($28)
/* 01102C 01DBCD2C B09C8EC7 */  lwc1        $f14, -0x6350($28)
/* 011030 01DBCD30 4050070C */  jal         setShotVector__FPffff
/* 011034 01DBCD34 00000000 */   nop
/* 011038 01DBCD38 E49D928F */  lw          $18, -0x621C($28)
/* 01103C 01DBCD3C 281E0070 */  paddub      $3, $0, $0
/* 011040 01DBCD40 1E000010 */  b           .L01DBCDBC_2F83BC
/* 011044 01DBCD44 00000000 */   nop
.L01DBCD48_2F8348:
/* 011048 01DBCD48 80980300 */  sll         $19, $3, 2
/* 01104C 01DBCD4C 21107202 */  addu        $2, $19, $18
/* 011050 01DBCD50 D0035424 */  addiu       $20, $2, 0x3D0
/* 011054 01DBCD54 D003428C */  lw          $2, 0x3D0($2)
/* 011058 01DBCD58 17004014 */  bnez        $2, .L01DBCDB8_2F83B8
/* 01105C 01DBCD5C 00000000 */   nop
/* 011060 01DBCD60 00110300 */  sll         $2, $3, 4
/* 011064 01DBCD64 21A84202 */  addu        $21, $18, $2
/* 011068 01DBCD68 4000A426 */  addiu       $4, $21, 0x40
/* 01106C 01DBCD6C B000A527 */  addiu       $5, $29, 0xB0
/* 011070 01DBCD70 0C86040C */  jal         sceVu0CopyVector
/* 011074 01DBCD74 00000000 */   nop
/* 011078 01DBCD78 C001A426 */  addiu       $4, $21, 0x1C0
/* 01107C 01DBCD7C C000A527 */  addiu       $5, $29, 0xC0
/* 011080 01DBCD80 0C86040C */  jal         sceVu0CopyVector
/* 011084 01DBCD84 00000000 */   nop
/* 011088 01DBCD88 78000224 */  addiu       $2, $0, 0x78
/* 01108C 01DBCD8C 21187202 */  addu        $3, $19, $18
/* 011090 01DBCD90 B00262AC */  sw          $2, 0x2B0($3)
/* 011094 01DBCD94 E00271AC */  sw          $17, 0x2E0($3)
/* 011098 01DBCD98 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 01109C 01DBCD9C 100362AC */  sw          $2, 0x310($3)
/* 0110A0 01DBCDA0 800260AC */  sw          $0, 0x280($3)
/* 0110A4 01DBCDA4 A00360AC */  sw          $0, 0x3A0($3)
/* 0110A8 01DBCDA8 01000224 */  addiu       $2, $0, 0x1
/* 0110AC 01DBCDAC 000082AE */  sw          $2, 0x0($20)
/* 0110B0 01DBCDB0 05000010 */  b           .L01DBCDC8_2F83C8
/* 0110B4 01DBCDB4 00000000 */   nop
.L01DBCDB8_2F83B8:
/* 0110B8 01DBCDB8 01006324 */  addiu       $3, $3, 0x1
.L01DBCDBC_2F83BC:
/* 0110BC 01DBCDBC 0C006228 */  slti        $2, $3, 0xC
/* 0110C0 01DBCDC0 E1FF4014 */  bnez        $2, .L01DBCD48_2F8348
/* 0110C4 01DBCDC4 00000000 */   nop
.L01DBCDC8_2F83C8:
/* 0110C8 01DBCDC8 DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 0110CC 01DBCDCC 604520AC */  sw          $0, %lo(BtActStatus + 0xE0)($1)
.L01DBCDD0_2F83D0:
/* 0110D0 01DBCDD0 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0110D4 01DBCDD4 00608244 */  mtc1        $2, $f12
/* 0110D8 01DBCDD8 28260070 */  paddub      $4, $0, $0
/* 0110DC 01DBCDDC CCE6760C */  jal         SwordDmgCheck1__Ffi
/* 0110E0 01DBCDE0 00000000 */   nop
.L01DBCDE4_2F83E4:
/* 0110E4 01DBCDE4 4403038E */  lw          $3, 0x344($16)
/* 0110E8 01DBCDE8 D40060C4 */  lwc1        $f0, 0xD4($3)
/* 0110EC 01DBCDEC 60008046 */  cvt.s.w     $f1, $f0
/* 0110F0 01DBCDF0 0040033C */  lui         $3, (0x40000000 >> 16)
/* 0110F4 01DBCDF4 00008344 */  mtc1        $3, $f0
/* 0110F8 01DBCDF8 00000000 */  nop
/* 0110FC 01DBCDFC 01080046 */  sub.s       $f0, $f1, $f0
/* 011100 01DBCE00 34A00046 */  c.lt.s      $f20, $f0
/* 011104 01DBCE04 00000000 */  nop
/* 011108 01DBCE08 15000145 */  bc1t        .L01DBCE60_2F8460
/* 01110C 01DBCE0C 00000000 */   nop
/* 011110 01DBCE10 36A00146 */  c.le.s      $f20, $f1
/* 011114 01DBCE14 00000000 */  nop
/* 011118 01DBCE18 11000045 */  bc1f        .L01DBCE60_2F8460
/* 01111C 01DBCE1C 00000000 */   nop
/* 011120 01DBCE20 DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 011124 01DBCE24 A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 011128 01DBCE28 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 01112C 01DBCE2C 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 011130 01DBCE30 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 011134 01DBCE34 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 011138 01DBCE38 989D838F */  lw          $3, -0x6268($28)
/* 01113C 01DBCE3C 04006010 */  beqz        $3, .L01DBCE50_2F8450
/* 011140 01DBCE40 00000000 */   nop
/* 011144 01DBCE44 12000324 */  addiu       $3, $0, 0x12
/* 011148 01DBCE48 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 01114C 01DBCE4C 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
.L01DBCE50_2F8450:
/* 011150 01DBCE50 FC9D848F */  lw          $4, -0x6204($28)
/* 011154 01DBCE54 0A000324 */  addiu       $3, $0, 0xA
/* 011158 01DBCE58 01008314 */  bne         $4, $3, .L01DBCE60_2F8460
/* 01115C 01DBCE5C 00000000 */   nop
.L01DBCE60_2F8460:
/* 011160 01DBCE60 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 011164 01DBCE64 9444248C */  lw          $4, %lo(BtActStatus + 0x14)($1)
/* 011168 01DBCE68 0C000324 */  addiu       $3, $0, 0xC
/* 01116C 01DBCE6C 18008314 */  bne         $4, $3, .L01DBCED0_2F84D0
/* 011170 01DBCE70 00000000 */   nop
/* 011174 01DBCE74 CC01023C */  lui         $2, %hi(GamePad)
/* 011178 01DBCE78 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 01117C 01DBCE7C 9C9C858F */  lw          $5, -0x6364($28)
/* 011180 01DBCE80 04AE040C */  jal         On__8CGamePadFi
/* 011184 01DBCE84 00000000 */   nop
/* 011188 01DBCE88 04004014 */  bnez        $2, .L01DBCE9C_2F849C
/* 01118C 01DBCE8C 00000000 */   nop
/* 011190 01DBCE90 01000324 */  addiu       $3, $0, 0x1
/* 011194 01DBCE94 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 011198 01DBCE98 984423AC */  sw          $3, %lo(BtActStatus + 0x18)($1)
.L01DBCE9C_2F849C:
/* 01119C 01DBCE9C 0C000324 */  addiu       $3, $0, 0xC
/* 0111A0 01DBCEA0 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0111A4 01DBCEA4 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
/* 0111A8 01DBCEA8 01000424 */  addiu       $4, $0, 0x1
/* 0111AC 01DBCEAC 7C9D84AF */  sw          $4, -0x6284($28)
/* 0111B0 01DBCEB0 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 0111B4 01DBCEB4 9844238C */  lw          $3, %lo(BtActStatus + 0x18)($1)
/* 0111B8 01DBCEB8 05006010 */  beqz        $3, .L01DBCED0_2F84D0
/* 0111BC 01DBCEBC 00000000 */   nop
/* 0111C0 01DBCEC0 7C9D84AF */  sw          $4, -0x6284($28)
/* 0111C4 01DBCEC4 0D000324 */  addiu       $3, $0, 0xD
/* 0111C8 01DBCEC8 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 0111CC 01DBCECC 944423AC */  sw          $3, %lo(BtActStatus + 0x14)($1)
.L01DBCED0_2F84D0:
/* 0111D0 01DBCED0 7000BF7B */  lq          $31, 0x70($29)
/* 0111D4 01DBCED4 6000B57B */  lq          $21, 0x60($29)
/* 0111D8 01DBCED8 5000B47B */  lq          $20, 0x50($29)
/* 0111DC 01DBCEDC 4000B37B */  lq          $19, 0x40($29)
/* 0111E0 01DBCEE0 3000B27B */  lq          $18, 0x30($29)
/* 0111E4 01DBCEE4 2000B17B */  lq          $17, 0x20($29)
/* 0111E8 01DBCEE8 1000B07B */  lq          $16, 0x10($29)
/* 0111EC 01DBCEEC 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0111F0 01DBCEF0 E000BD27 */  addiu       $29, $29, 0xE0
/* 0111F4 01DBCEF4 0800E003 */  jr          $31
/* 0111F8 01DBCEF8 00000000 */   nop
/* 0111FC 01DBCEFC 00000000 */  nop
