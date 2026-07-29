.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleActionPlay_Ozumond_F__Fi
/* 0126A0 01DBE3A0 90FFBD27 */  addiu       $29, $29, -0x70
/* 0126A4 01DBE3A4 2000BF7F */  sq          $31, 0x20($29)
/* 0126A8 01DBE3A8 1000B17F */  sq          $17, 0x10($29)
/* 0126AC 01DBE3AC 0000B07F */  sq          $16, 0x0($29)
/* 0126B0 01DBE3B0 288E8070 */  paddub      $17, $4, $0
/* 0126B4 01DBE3B4 CC9E8283 */  lb          $2, -0x6134($28)
/* 0126B8 01DBE3B8 04004014 */  bnez        $2, .L01DBE3CC_2F99CC
/* 0126BC 01DBE3BC 00000000 */   nop
/* 0126C0 01DBE3C0 C89E80AF */  sw          $0, -0x6138($28)
/* 0126C4 01DBE3C4 01000224 */  addiu       $2, $0, 0x1
/* 0126C8 01DBE3C8 CC9E82A3 */  sb          $2, -0x6134($28)
.L01DBE3CC_2F99CC:
/* 0126CC 01DBE3CC 049D828F */  lw          $2, -0x62FC($28)
/* 0126D0 01DBE3D0 16004480 */  lb          $4, 0x16($2)
/* 0126D4 01DBE3D4 7CDA060C */  jal         GetWeaponElementAttr__Fi
/* 0126D8 01DBE3D8 00000000 */   nop
/* 0126DC 01DBE3DC 049D828F */  lw          $2, -0x62FC($28)
/* 0126E0 01DBE3E0 04005084 */  lh          $16, 0x4($2)
/* 0126E4 01DBE3E4 08000424 */  addiu       $4, $0, 0x8
/* 0126E8 01DBE3E8 4CC6060C */  jal         StatusErrCheck__Fi
/* 0126EC 01DBE3EC 00000000 */   nop
/* 0126F0 01DBE3F0 02004010 */  beqz        $2, .L01DBE3FC_2F99FC
/* 0126F4 01DBE3F4 00000000 */   nop
/* 0126F8 01DBE3F8 40801000 */  sll         $16, $16, 1
.L01DBE3FC_2F99FC:
/* 0126FC 01DBE3FC DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 012700 01DBE400 9444238C */  lw          $3, %lo(BtActStatus + 0x14)($1)
/* 012704 01DBE404 54006014 */  bnez        $3, .L01DBE558_2F9B58
/* 012708 01DBE408 00000000 */   nop
/* 01270C 01DBE40C 0B000224 */  addiu       $2, $0, 0xB
/* 012710 01DBE410 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 012714 01DBE414 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 012718 01DBE418 B09E828F */  lw          $2, -0x6150($28)
/* 01271C 01DBE41C 01004224 */  addiu       $2, $2, 0x1
/* 012720 01DBE420 B09E82AF */  sw          $2, -0x6150($28)
/* 012724 01DBE424 B09E828F */  lw          $2, -0x6150($28)
/* 012728 01DBE428 08004228 */  slti        $2, $2, 0x8
/* 01272C 01DBE42C 35004014 */  bnez        $2, .L01DBE504_2F9B04
/* 012730 01DBE430 00000000 */   nop
/* 012734 01DBE434 B09E80AF */  sw          $0, -0x6150($28)
/* 012738 01DBE438 C03F023C */  lui         $2, (0x3FC00000 >> 16)
/* 01273C 01DBE43C 00608244 */  mtc1        $2, $f12
/* 012740 01DBE440 28260070 */  paddub      $4, $0, $0
/* 012744 01DBE444 CCE6760C */  jal         SwordDmgCheck1__Ffi
/* 012748 01DBE448 00000000 */   nop
/* 01274C 01DBE44C 01000224 */  addiu       $2, $0, 0x1
/* 012750 01DBE450 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 012754 01DBE454 944422AC */  sw          $2, %lo(BtActStatus + 0x14)($1)
/* 012758 01DBE458 DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 01275C 01DBE45C 604520AC */  sw          $0, %lo(BtActStatus + 0xE0)($1)
/* 012760 01DBE460 0E002016 */  bnez        $17, .L01DBE49C_2F9A9C
/* 012764 01DBE464 00000000 */   nop
/* 012768 01DBE468 009D828F */  lw          $2, -0x6300($28)
/* 01276C 01DBE46C BC00448C */  lw          $4, 0xBC($2)
/* 012770 01DBE470 DC01023C */  lui         $2, %hi(LIT_4408)
/* 012774 01DBE474 982F4524 */  addiu       $5, $2, %lo(LIT_4408)
/* 012778 01DBE478 3000A627 */  addiu       $6, $29, 0x30
/* 01277C 01DBE47C CCDB060C */  jal         getFramePos__FP9CFrameVu1PcPf
/* 012780 01DBE480 00000000 */   nop
/* 012784 01DBE484 00608044 */  mtc1        $0, $f12
/* 012788 01DBE488 4000A427 */  addiu       $4, $29, 0x40
/* 01278C 01DBE48C 6850070C */  jal         getCharacterVector__FPff
/* 012790 01DBE490 00000000 */   nop
/* 012794 01DBE494 13000010 */  b           .L01DBE4E4_2F9AE4
/* 012798 01DBE498 00000000 */   nop
.L01DBE49C_2F9A9C:
/* 01279C 01DBE49C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0127A0 01DBE4A0 00608244 */  mtc1        $2, $f12
/* 0127A4 01DBE4A4 4000A427 */  addiu       $4, $29, 0x40
/* 0127A8 01DBE4A8 AC9C8DC7 */  lwc1        $f13, -0x6354($28)
/* 0127AC 01DBE4AC B09C8EC7 */  lwc1        $f14, -0x6350($28)
/* 0127B0 01DBE4B0 4050070C */  jal         setShotVector__FPffff
/* 0127B4 01DBE4B4 00000000 */   nop
/* 0127B8 01DBE4B8 3000A427 */  addiu       $4, $29, 0x30
/* 0127BC 01DBE4BC EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0127C0 01DBE4C0 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0127C4 01DBE4C4 0C86040C */  jal         sceVu0CopyVector
/* 0127C8 01DBE4C8 00000000 */   nop
/* 0127CC 01DBE4CC 3400A1C7 */  lwc1        $f1, 0x34($29)
/* 0127D0 01DBE4D0 2041023C */  lui         $2, (0x41200000 >> 16)
/* 0127D4 01DBE4D4 00008244 */  mtc1        $2, $f0
/* 0127D8 01DBE4D8 00000000 */  nop
/* 0127DC 01DBE4DC 00080046 */  add.s       $f0, $f1, $f0
/* 0127E0 01DBE4E0 3400A0E7 */  swc1        $f0, 0x34($29)
.L01DBE4E4_2F9AE4:
/* 0127E4 01DBE4E4 F001023C */  lui         $2, %hi(OzumondFire)
/* 0127E8 01DBE4E8 F0B24424 */  addiu       $4, $2, %lo(OzumondFire)
/* 0127EC 01DBE4EC 3000A527 */  addiu       $5, $29, 0x30
/* 0127F0 01DBE4F0 4000A627 */  addiu       $6, $29, 0x40
/* 0127F4 01DBE4F4 283E0070 */  paddub      $7, $0, $0
/* 0127F8 01DBE4F8 28460070 */  paddub      $8, $0, $0
/* 0127FC 01DBE4FC C8BA060C */  jal         Init__13CSHOT_FIREBARFPfPfii
/* 012800 01DBE500 00000000 */   nop
.L01DBE504_2F9B04:
/* 012804 01DBE504 CC01023C */  lui         $2, %hi(GamePad)
/* 012808 01DBE508 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 01280C 01DBE50C 9C9C858F */  lw          $5, -0x6364($28)
/* 012810 01DBE510 04AE040C */  jal         On__8CGamePadFi
/* 012814 01DBE514 00000000 */   nop
/* 012818 01DBE518 0F004014 */  bnez        $2, .L01DBE558_2F9B58
/* 01281C 01DBE51C 00000000 */   nop
/* 012820 01DBE520 DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 012824 01DBE524 A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 012828 01DBE528 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 01282C 01DBE52C 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 012830 01DBE530 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 012834 01DBE534 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 012838 01DBE538 989D838F */  lw          $3, -0x6268($28)
/* 01283C 01DBE53C 04006010 */  beqz        $3, .L01DBE550_2F9B50
/* 012840 01DBE540 00000000 */   nop
/* 012844 01DBE544 12000324 */  addiu       $3, $0, 0x12
/* 012848 01DBE548 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 01284C 01DBE54C 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
.L01DBE550_2F9B50:
/* 012850 01DBE550 0A000324 */  addiu       $3, $0, 0xA
/* 012854 01DBE554 C89E83AF */  sw          $3, -0x6138($28)
.L01DBE558_2F9B58:
/* 012858 01DBE558 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 01285C 01DBE55C 9444248C */  lw          $4, %lo(BtActStatus + 0x14)($1)
/* 012860 01DBE560 01000324 */  addiu       $3, $0, 0x1
/* 012864 01DBE564 78008314 */  bne         $4, $3, .L01DBE748_2F9D48
/* 012868 01DBE568 00000000 */   nop
/* 01286C 01DBE56C 0B000224 */  addiu       $2, $0, 0xB
/* 012870 01DBE570 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 012874 01DBE574 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 012878 01DBE578 94010424 */  addiu       $4, $0, 0x194
/* 01287C 01DBE57C 05000524 */  addiu       $5, $0, 0x5
/* 012880 01DBE580 28360070 */  paddub      $6, $0, $0
/* 012884 01DBE584 C86B050C */  jal         SndSeSeqPlayStop__Fiii
/* 012888 01DBE588 00000000 */   nop
/* 01288C 01DBE58C DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 012890 01DBE590 C84421C4 */  lwc1        $f1, %lo(BtActStatus + 0x48)($1)
/* 012894 01DBE594 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 012898 01DBE598 00008244 */  mtc1        $2, $f0
/* 01289C 01DBE59C 00000000 */  nop
/* 0128A0 01DBE5A0 41080046 */  sub.s       $f1, $f1, $f0
/* 0128A4 01DBE5A4 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 0128A8 01DBE5A8 C84421E4 */  swc1        $f1, %lo(BtActStatus + 0x48)($1)
/* 0128AC 01DBE5AC 00008044 */  mtc1        $0, $f0
/* 0128B0 01DBE5B0 00000000 */  nop
/* 0128B4 01DBE5B4 36080046 */  c.le.s      $f1, $f0
/* 0128B8 01DBE5B8 00000000 */  nop
/* 0128BC 01DBE5BC 10000045 */  bc1f        .L01DBE600_2F9C00
/* 0128C0 01DBE5C0 00000000 */   nop
/* 0128C4 01DBE5C4 DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 0128C8 01DBE5C8 A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 0128CC 01DBE5CC DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0128D0 01DBE5D0 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 0128D4 01DBE5D4 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 0128D8 01DBE5D8 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 0128DC 01DBE5DC 01000224 */  addiu       $2, $0, 0x1
/* 0128E0 01DBE5E0 DC01013C */  lui         $1, %hi(BtActStatus + 0xA4)
/* 0128E4 01DBE5E4 244522AC */  sw          $2, %lo(BtActStatus + 0xA4)($1)
/* 0128E8 01DBE5E8 989D828F */  lw          $2, -0x6268($28)
/* 0128EC 01DBE5EC 04004010 */  beqz        $2, .L01DBE600_2F9C00
/* 0128F0 01DBE5F0 00000000 */   nop
/* 0128F4 01DBE5F4 12000224 */  addiu       $2, $0, 0x12
/* 0128F8 01DBE5F8 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0128FC 01DBE5FC 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
.L01DBE600_2F9C00:
/* 012900 01DBE600 0E002016 */  bnez        $17, .L01DBE63C_2F9C3C
/* 012904 01DBE604 00000000 */   nop
/* 012908 01DBE608 009D828F */  lw          $2, -0x6300($28)
/* 01290C 01DBE60C BC00448C */  lw          $4, 0xBC($2)
/* 012910 01DBE610 DC01023C */  lui         $2, %hi(LIT_4408)
/* 012914 01DBE614 982F4524 */  addiu       $5, $2, %lo(LIT_4408)
/* 012918 01DBE618 5000A627 */  addiu       $6, $29, 0x50
/* 01291C 01DBE61C CCDB060C */  jal         getFramePos__FP9CFrameVu1PcPf
/* 012920 01DBE620 00000000 */   nop
/* 012924 01DBE624 00608044 */  mtc1        $0, $f12
/* 012928 01DBE628 6000A427 */  addiu       $4, $29, 0x60
/* 01292C 01DBE62C 6850070C */  jal         getCharacterVector__FPff
/* 012930 01DBE630 00000000 */   nop
/* 012934 01DBE634 13000010 */  b           .L01DBE684_2F9C84
/* 012938 01DBE638 00000000 */   nop
.L01DBE63C_2F9C3C:
/* 01293C 01DBE63C 6040023C */  lui         $2, (0x40600000 >> 16)
/* 012940 01DBE640 00608244 */  mtc1        $2, $f12
/* 012944 01DBE644 6000A427 */  addiu       $4, $29, 0x60
/* 012948 01DBE648 AC9C8DC7 */  lwc1        $f13, -0x6354($28)
/* 01294C 01DBE64C B09C8EC7 */  lwc1        $f14, -0x6350($28)
/* 012950 01DBE650 4050070C */  jal         setShotVector__FPffff
/* 012954 01DBE654 00000000 */   nop
/* 012958 01DBE658 5000A427 */  addiu       $4, $29, 0x50
/* 01295C 01DBE65C EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 012960 01DBE660 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 012964 01DBE664 0C86040C */  jal         sceVu0CopyVector
/* 012968 01DBE668 00000000 */   nop
/* 01296C 01DBE66C 5400A1C7 */  lwc1        $f1, 0x54($29)
/* 012970 01DBE670 2041023C */  lui         $2, (0x41200000 >> 16)
/* 012974 01DBE674 00008244 */  mtc1        $2, $f0
/* 012978 01DBE678 00000000 */  nop
/* 01297C 01DBE67C 00080046 */  add.s       $f0, $f1, $f0
/* 012980 01DBE680 5400A0E7 */  swc1        $f0, 0x54($29)
.L01DBE684_2F9C84:
/* 012984 01DBE684 049D828F */  lw          $2, -0x62FC($28)
/* 012988 01DBE688 16004880 */  lb          $8, 0x16($2)
/* 01298C 01DBE68C F001023C */  lui         $2, %hi(OzumondFire)
/* 012990 01DBE690 F0B24424 */  addiu       $4, $2, %lo(OzumondFire)
/* 012994 01DBE694 5000A527 */  addiu       $5, $29, 0x50
/* 012998 01DBE698 6000A627 */  addiu       $6, $29, 0x60
/* 01299C 01DBE69C 283E0072 */  paddub      $7, $16, $0
/* 0129A0 01DBE6A0 50BB060C */  jal         Set__13CSHOT_FIREBARFPfPfii
/* 0129A4 01DBE6A4 00000000 */   nop
/* 0129A8 01DBE6A8 B09E828F */  lw          $2, -0x6150($28)
/* 0129AC 01DBE6AC 01004224 */  addiu       $2, $2, 0x1
/* 0129B0 01DBE6B0 B09E82AF */  sw          $2, -0x6150($28)
/* 0129B4 01DBE6B4 B09E828F */  lw          $2, -0x6150($28)
/* 0129B8 01DBE6B8 1E004228 */  slti        $2, $2, 0x1E
/* 0129BC 01DBE6BC 08004014 */  bnez        $2, .L01DBE6E0_2F9CE0
/* 0129C0 01DBE6C0 00000000 */   nop
/* 0129C4 01DBE6C4 B09E80AF */  sw          $0, -0x6150($28)
/* 0129C8 01DBE6C8 DC828CC7 */  lwc1        $f12, -0x7D24($28)
/* 0129CC 01DBE6CC 28260070 */  paddub      $4, $0, $0
/* 0129D0 01DBE6D0 CCE6760C */  jal         SwordDmgCheck1__Ffi
/* 0129D4 01DBE6D4 00000000 */   nop
/* 0129D8 01DBE6D8 DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 0129DC 01DBE6DC 604520AC */  sw          $0, %lo(BtActStatus + 0xE0)($1)
.L01DBE6E0_2F9CE0:
/* 0129E0 01DBE6E0 CC01023C */  lui         $2, %hi(GamePad)
/* 0129E4 01DBE6E4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0129E8 01DBE6E8 9C9C858F */  lw          $5, -0x6364($28)
/* 0129EC 01DBE6EC 04AE040C */  jal         On__8CGamePadFi
/* 0129F0 01DBE6F0 00000000 */   nop
/* 0129F4 01DBE6F4 14004014 */  bnez        $2, .L01DBE748_2F9D48
/* 0129F8 01DBE6F8 00000000 */   nop
/* 0129FC 01DBE6FC DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 012A00 01DBE700 A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 012A04 01DBE704 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 012A08 01DBE708 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 012A0C 01DBE70C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 012A10 01DBE710 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 012A14 01DBE714 989D828F */  lw          $2, -0x6268($28)
/* 012A18 01DBE718 04004010 */  beqz        $2, .L01DBE72C_2F9D2C
/* 012A1C 01DBE71C 00000000 */   nop
/* 012A20 01DBE720 12000224 */  addiu       $2, $0, 0x12
/* 012A24 01DBE724 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 012A28 01DBE728 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
.L01DBE72C_2F9D2C:
/* 012A2C 01DBE72C F001023C */  lui         $2, %hi(OzumondFire)
/* 012A30 01DBE730 F0B24424 */  addiu       $4, $2, %lo(OzumondFire)
/* 012A34 01DBE734 D8BB060C */  jal         Rset__13CSHOT_FIREBARFv
/* 012A38 01DBE738 00000000 */   nop
/* 012A3C 01DBE73C 0A000324 */  addiu       $3, $0, 0xA
/* 012A40 01DBE740 C89E83AF */  sw          $3, -0x6138($28)
/* 012A44 01DBE744 B09E80AF */  sw          $0, -0x6150($28)
.L01DBE748_2F9D48:
/* 012A48 01DBE748 2000BF7B */  lq          $31, 0x20($29)
/* 012A4C 01DBE74C 1000B17B */  lq          $17, 0x10($29)
/* 012A50 01DBE750 0000B07B */  lq          $16, 0x0($29)
/* 012A54 01DBE754 7000BD27 */  addiu       $29, $29, 0x70
/* 012A58 01DBE758 0800E003 */  jr          $31
/* 012A5C 01DBE75C 00000000 */   nop
