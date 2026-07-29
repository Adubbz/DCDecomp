.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtGetTreasureboxBig_Init__Fv
/* 0D14F0 001D13F0 30FFBD27 */  addiu       $29, $29, -0xD0
/* 0D14F4 001D13F4 1000BF7F */  sq          $31, 0x10($29)
/* 0D14F8 001D13F8 0000B07F */  sq          $16, 0x0($29)
/* 0D14FC 001D13FC C89C848F */  lw          $4, -0x6338($28)
/* 0D1500 001D1400 BC9D838F */  lw          $3, -0x6244($28)
/* 0D1504 001D1404 80100300 */  sll         $2, $3, 2
/* 0D1508 001D1408 21104300 */  addu        $2, $2, $3
/* 0D150C 001D140C 00110200 */  sll         $2, $2, 4
/* 0D1510 001D1410 21104400 */  addu        $2, $2, $4
/* 0D1514 001D1414 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D1518 001D1418 21084100 */  addu        $1, $2, $1
/* 0D151C 001D141C 788D228C */  lw          $2, -0x7288($1)
/* 0D1520 001D1420 80110200 */  sll         $2, $2, 6
/* 0D1524 001D1424 21104400 */  addu        $2, $2, $4
/* 0D1528 001D1428 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D152C 001D142C 21084100 */  addu        $1, $2, $1
/* 0D1530 001D1430 80B6308C */  lw          $16, -0x4980($1)
/* 0D1534 001D1434 0005770C */  jal         ResetMovePower__Fv
/* 0D1538 001D1438 00000000 */   nop
/* 0D153C 001D143C 789C848F */  lw          $4, -0x6388($28)
/* 0D1540 001D1440 282E0072 */  paddub      $5, $16, $0
/* 0D1544 001D1444 E4F7060C */  jal         CheckWeaponRot__14CDngStatusDataFi
/* 0D1548 001D1448 00000000 */   nop
/* 0D154C 001D144C 0A004228 */  slti        $2, $2, 0xA
/* 0D1550 001D1450 3B004014 */  bnez        $2, .L001D1540
/* 0D1554 001D1454 00000000 */   nop
/* 0D1558 001D1458 CE000424 */  addiu       $4, $0, 0xCE
/* 0D155C 001D145C FFFF0524 */  addiu       $5, $0, -0x1
/* 0D1560 001D1460 28360070 */  paddub      $6, $0, $0
/* 0D1564 001D1464 AC69050C */  jal         SndSePlay__Fiii
/* 0D1568 001D1468 00000000 */   nop
/* 0D156C 001D146C 789C848F */  lw          $4, -0x6388($28)
/* 0D1570 001D1470 282E0072 */  paddub      $5, $16, $0
/* 0D1574 001D1474 B4F7060C */  jal         CheckWeaponUser__14CDngStatusDataFi
/* 0D1578 001D1478 00000000 */   nop
/* 0D157C 001D147C 49004424 */  addiu       $4, $2, 0x49
/* 0D1580 001D1480 FFFF0524 */  addiu       $5, $0, -0x1
/* 0D1584 001D1484 05000624 */  addiu       $6, $0, 0x5
/* 0D1588 001D1488 283E0070 */  paddub      $7, $0, $0
/* 0D158C 001D148C 28460070 */  paddub      $8, $0, $0
/* 0D1590 001D1490 284E0070 */  paddub      $9, $0, $0
/* 0D1594 001D1494 9481050C */  jal         SetSystemMes__FiiiiPiPi
/* 0D1598 001D1498 00000000 */   nop
/* 0D159C 001D149C C89C848F */  lw          $4, -0x6338($28)
/* 0D15A0 001D14A0 BC9D838F */  lw          $3, -0x6244($28)
/* 0D15A4 001D14A4 80100300 */  sll         $2, $3, 2
/* 0D15A8 001D14A8 21104300 */  addu        $2, $2, $3
/* 0D15AC 001D14AC 00110200 */  sll         $2, $2, 4
/* 0D15B0 001D14B0 21104400 */  addu        $2, $2, $4
/* 0D15B4 001D14B4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D15B8 001D14B8 21084100 */  addu        $1, $2, $1
/* 0D15BC 001D14BC 788D228C */  lw          $2, -0x7288($1)
/* 0D15C0 001D14C0 A0C1033C */  lui         $3, (0xC1A00000 >> 16)
/* 0D15C4 001D14C4 80110200 */  sll         $2, $2, 6
/* 0D15C8 001D14C8 21104400 */  addu        $2, $2, $4
/* 0D15CC 001D14CC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D15D0 001D14D0 21084100 */  addu        $1, $2, $1
/* 0D15D4 001D14D4 8CB623AC */  sw          $3, -0x4974($1)
/* 0D15D8 001D14D8 28260070 */  paddub      $4, $0, $0
/* 0D15DC 001D14DC B004770C */  jal         SetMIniMapStatus__Fi
/* 0D15E0 001D14E0 00000000 */   nop
/* 0D15E4 001D14E4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0D15E8 001D14E8 B49D82AF */  sw          $2, -0x624C($28)
/* 0D15EC 001D14EC 01000224 */  addiu       $2, $0, 0x1
/* 0D15F0 001D14F0 EC9C82AF */  sw          $2, -0x6314($28)
/* 0D15F4 001D14F4 F09C82AF */  sw          $2, -0x6310($28)
/* 0D15F8 001D14F8 E49C82AF */  sw          $2, -0x631C($28)
/* 0D15FC 001D14FC E89C82AF */  sw          $2, -0x6318($28)
/* 0D1600 001D1500 EA01013C */  lui         $1, %hi(DngMessMan)
/* 0D1604 001D1504 907620AC */  sw          $0, %lo(DngMessMan)($1)
/* 0D1608 001D1508 789C838F */  lw          $3, -0x6388($28)
/* 0D160C 001D150C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D1610 001D1510 21086100 */  addu        $1, $3, $1
/* 0D1614 001D1514 0C8B22AC */  sw          $2, -0x74F4($1)
/* 0D1618 001D1518 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0D161C 001D151C 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 0D1620 001D1520 DC01013C */  lui         $1, %hi(BtActStatus + 0x9C)
/* 0D1624 001D1524 1C4522AC */  sw          $2, %lo(BtActStatus + 0x9C)($1)
/* 0D1628 001D1528 0A000224 */  addiu       $2, $0, 0xA
/* 0D162C 001D152C 289482AF */  sw          $2, -0x6BD8($28)
/* 0D1630 001D1530 5CFA760C */  jal         autoCamTrial__Fv
/* 0D1634 001D1534 00000000 */   nop
/* 0D1638 001D1538 AE000010 */  b           .L001D17F4
/* 0D163C 001D153C 00000000 */   nop
.L001D1540:
/* 0D1640 001D1540 2F010424 */  addiu       $4, $0, 0x12F
/* 0D1644 001D1544 06000416 */  bne         $16, $4, .L001D1560
/* 0D1648 001D1548 00000000 */   nop
/* 0D164C 001D154C 4C95080C */  jal         PlayerAllItemCheck__Fi
/* 0D1650 001D1550 00000000 */   nop
/* 0D1654 001D1554 02004010 */  beqz        $2, .L001D1560
/* 0D1658 001D1558 00000000 */   nop
/* 0D165C 001D155C 30011024 */  addiu       $16, $0, 0x130
.L001D1560:
/* 0D1660 001D1560 349480AF */  sw          $0, -0x6BCC($28)
/* 0D1664 001D1564 789C848F */  lw          $4, -0x6388($28)
/* 0D1668 001D1568 282E0072 */  paddub      $5, $16, $0
/* 0D166C 001D156C B4F7060C */  jal         CheckWeaponUser__14CDngStatusDataFi
/* 0D1670 001D1570 00000000 */   nop
/* 0D1674 001D1574 01000324 */  addiu       $3, $0, 0x1
/* 0D1678 001D1578 02004314 */  bne         $2, $3, .L001D1584
/* 0D167C 001D157C 00000000 */   nop
/* 0D1680 001D1580 349483AF */  sw          $3, -0x6BCC($28)
.L001D1584:
/* 0D1684 001D1584 789C848F */  lw          $4, -0x6388($28)
/* 0D1688 001D1588 282E0072 */  paddub      $5, $16, $0
/* 0D168C 001D158C B4F7060C */  jal         CheckWeaponUser__14CDngStatusDataFi
/* 0D1690 001D1590 00000000 */   nop
/* 0D1694 001D1594 05000324 */  addiu       $3, $0, 0x5
/* 0D1698 001D1598 03004314 */  bne         $2, $3, .L001D15A8
/* 0D169C 001D159C 00000000 */   nop
/* 0D16A0 001D15A0 02000224 */  addiu       $2, $0, 0x2
/* 0D16A4 001D15A4 349482AF */  sw          $2, -0x6BCC($28)
.L001D15A8:
/* 0D16A8 001D15A8 789C848F */  lw          $4, -0x6388($28)
/* 0D16AC 001D15AC 282E0072 */  paddub      $5, $16, $0
/* 0D16B0 001D15B0 B4F7060C */  jal         CheckWeaponUser__14CDngStatusDataFi
/* 0D16B4 001D15B4 00000000 */   nop
/* 0D16B8 001D15B8 03000324 */  addiu       $3, $0, 0x3
/* 0D16BC 001D15BC 02004314 */  bne         $2, $3, .L001D15C8
/* 0D16C0 001D15C0 00000000 */   nop
/* 0D16C4 001D15C4 349483AF */  sw          $3, -0x6BCC($28)
.L001D15C8:
/* 0D16C8 001D15C8 2800023C */  lui         $2, %hi(LIT_662)
/* 0D16CC 001D15CC D0E74224 */  addiu       $2, $2, %lo(LIT_662)
/* 0D16D0 001D15D0 2000A427 */  addiu       $4, $29, 0x20
/* 0D16D4 001D15D4 00004378 */  lq          $3, 0x0($2)
/* 0D16D8 001D15D8 100042DC */  ld          $2, 0x10($2)
/* 0D16DC 001D15DC 0000837C */  sq          $3, 0x0($4)
/* 0D16E0 001D15E0 100082FC */  sd          $2, 0x10($4)
/* 0D16E4 001D15E4 309490AF */  sw          $16, -0x6BD0($28)
/* 0D16E8 001D15E8 FFFF0524 */  addiu       $5, $0, -0x1
/* 0D16EC 001D15EC C89C848F */  lw          $4, -0x6338($28)
/* 0D16F0 001D15F0 BC9D838F */  lw          $3, -0x6244($28)
/* 0D16F4 001D15F4 80100300 */  sll         $2, $3, 2
/* 0D16F8 001D15F8 21104300 */  addu        $2, $2, $3
/* 0D16FC 001D15FC 00110200 */  sll         $2, $2, 4
/* 0D1700 001D1600 21104400 */  addu        $2, $2, $4
/* 0D1704 001D1604 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D1708 001D1608 21084100 */  addu        $1, $2, $1
/* 0D170C 001D160C 588D25AC */  sw          $5, -0x72A8($1)
/* 0D1710 001D1610 4000A427 */  addiu       $4, $29, 0x40
/* 0D1714 001D1614 8000A527 */  addiu       $5, $29, 0x80
/* 0D1718 001D1618 28360072 */  paddub      $6, $16, $0
/* 0D171C 001D161C 48DC060C */  jal         BtGetItemNamePath__FPcPci
/* 0D1720 001D1620 00000000 */   nop
/* 0D1724 001D1624 948B828F */  lw          $2, -0x746C($28)
/* 0D1728 001D1628 F001013C */  lui         $1, %hi(BtCashBuffer)
/* 0D172C 001D162C 506822AC */  sw          $2, %lo(BtCashBuffer)($1)
/* 0D1730 001D1630 0400023C */  lui         $2, (0x445C0 >> 16)
/* 0D1734 001D1634 C0454234 */  ori         $2, $2, (0x445C0 & 0xFFFF)
/* 0D1738 001D1638 F001013C */  lui         $1, %hi(BtCashBuffer + 0xC)
/* 0D173C 001D163C 5C6822AC */  sw          $2, %lo(BtCashBuffer + 0xC)($1)
/* 0D1740 001D1640 F001013C */  lui         $1, %hi(BtCashBuffer + 0x8)
/* 0D1744 001D1644 586820AC */  sw          $0, %lo(BtCashBuffer + 0x8)($1)
/* 0D1748 001D1648 30FB040C */  jal         StartReadBG__Fv
/* 0D174C 001D164C 00000000 */   nop
/* 0D1750 001D1650 F001013C */  lui         $1, %hi(BtCashBuffer + 0x8)
/* 0D1754 001D1654 5868228C */  lw          $2, %lo(BtCashBuffer + 0x8)($1)
/* 0D1758 001D1658 00190200 */  sll         $3, $2, 4
/* 0D175C 001D165C F001013C */  lui         $1, %hi(BtCashBuffer)
/* 0D1760 001D1660 5068228C */  lw          $2, %lo(BtCashBuffer)($1)
/* 0D1764 001D1664 21284300 */  addu        $5, $2, $3
/* 0D1768 001D1668 4C9D85AF */  sw          $5, -0x62B4($28)
/* 0D176C 001D166C 4000A427 */  addiu       $4, $29, 0x40
/* 0D1770 001D1670 CC00A627 */  addiu       $6, $29, 0xCC
/* 0D1774 001D1674 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 0D1778 001D1678 00000000 */   nop
/* 0D177C 001D167C CC00A28F */  lw          $2, 0xCC($29)
/* 0D1780 001D1680 83110200 */  sra         $2, $2, 6
/* 0D1784 001D1684 01004224 */  addiu       $2, $2, 0x1
/* 0D1788 001D1688 80110200 */  sll         $2, $2, 6
/* 0D178C 001D168C 03290200 */  sra         $5, $2, 4
/* 0D1790 001D1690 F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D1794 001D1694 50684424 */  addiu       $4, $2, %lo(BtCashBuffer)
/* 0D1798 001D1698 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0D179C 001D169C 00000000 */   nop
/* 0D17A0 001D16A0 F001013C */  lui         $1, %hi(BtCashBuffer + 0x8)
/* 0D17A4 001D16A4 5868228C */  lw          $2, %lo(BtCashBuffer + 0x8)($1)
/* 0D17A8 001D16A8 00190200 */  sll         $3, $2, 4
/* 0D17AC 001D16AC F001013C */  lui         $1, %hi(BtCashBuffer)
/* 0D17B0 001D16B0 5068228C */  lw          $2, %lo(BtCashBuffer)($1)
/* 0D17B4 001D16B4 21284300 */  addu        $5, $2, $3
/* 0D17B8 001D16B8 509D85AF */  sw          $5, -0x62B0($28)
/* 0D17BC 001D16BC 8000A427 */  addiu       $4, $29, 0x80
/* 0D17C0 001D16C0 CC00A627 */  addiu       $6, $29, 0xCC
/* 0D17C4 001D16C4 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 0D17C8 001D16C8 00000000 */   nop
/* 0D17CC 001D16CC CC00A28F */  lw          $2, 0xCC($29)
/* 0D17D0 001D16D0 83110200 */  sra         $2, $2, 6
/* 0D17D4 001D16D4 01004224 */  addiu       $2, $2, 0x1
/* 0D17D8 001D16D8 80110200 */  sll         $2, $2, 6
/* 0D17DC 001D16DC 03290200 */  sra         $5, $2, 4
/* 0D17E0 001D16E0 F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D17E4 001D16E4 50684424 */  addiu       $4, $2, %lo(BtCashBuffer)
/* 0D17E8 001D16E8 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0D17EC 001D16EC 00000000 */   nop
/* 0D17F0 001D16F0 F001013C */  lui         $1, %hi(BtCashBuffer + 0x8)
/* 0D17F4 001D16F4 5868228C */  lw          $2, %lo(BtCashBuffer + 0x8)($1)
/* 0D17F8 001D16F8 00190200 */  sll         $3, $2, 4
/* 0D17FC 001D16FC F001013C */  lui         $1, %hi(BtCashBuffer)
/* 0D1800 001D1700 5068228C */  lw          $2, %lo(BtCashBuffer)($1)
/* 0D1804 001D1704 21284300 */  addu        $5, $2, $3
/* 0D1808 001D1708 549D85AF */  sw          $5, -0x62AC($28)
/* 0D180C 001D170C 789C828F */  lw          $2, -0x6388($28)
/* 0D1810 001D1710 04004280 */  lb          $2, 0x4($2)
/* 0D1814 001D1714 80100200 */  sll         $2, $2, 2
/* 0D1818 001D1718 21105D00 */  addu        $2, $2, $29
/* 0D181C 001D171C 2000448C */  lw          $4, 0x20($2)
/* 0D1820 001D1720 CC00A627 */  addiu       $6, $29, 0xCC
/* 0D1824 001D1724 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 0D1828 001D1728 00000000 */   nop
/* 0D182C 001D172C CC00A28F */  lw          $2, 0xCC($29)
/* 0D1830 001D1730 83110200 */  sra         $2, $2, 6
/* 0D1834 001D1734 01004224 */  addiu       $2, $2, 0x1
/* 0D1838 001D1738 80110200 */  sll         $2, $2, 6
/* 0D183C 001D173C 03290200 */  sra         $5, $2, 4
/* 0D1840 001D1740 F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D1844 001D1744 50684424 */  addiu       $4, $2, %lo(BtCashBuffer)
/* 0D1848 001D1748 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0D184C 001D174C 00000000 */   nop
/* 0D1850 001D1750 F001013C */  lui         $1, %hi(BtCashBuffer + 0x8)
/* 0D1854 001D1754 5868228C */  lw          $2, %lo(BtCashBuffer + 0x8)($1)
/* 0D1858 001D1758 00190200 */  sll         $3, $2, 4
/* 0D185C 001D175C F001013C */  lui         $1, %hi(BtCashBuffer)
/* 0D1860 001D1760 5068228C */  lw          $2, %lo(BtCashBuffer)($1)
/* 0D1864 001D1764 21284300 */  addu        $5, $2, $3
/* 0D1868 001D1768 02000424 */  addiu       $4, $0, 0x2
/* 0D186C 001D176C CC00A627 */  addiu       $6, $29, 0xCC
/* 0D1870 001D1770 D86D050C */  jal         SndSPSeLoadBG__FiPUiPi
/* 0D1874 001D1774 00000000 */   nop
/* 0D1878 001D1778 CC00A28F */  lw          $2, 0xCC($29)
/* 0D187C 001D177C 83110200 */  sra         $2, $2, 6
/* 0D1880 001D1780 01004224 */  addiu       $2, $2, 0x1
/* 0D1884 001D1784 80110200 */  sll         $2, $2, 6
/* 0D1888 001D1788 03290200 */  sra         $5, $2, 4
/* 0D188C 001D178C F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D1890 001D1790 50684424 */  addiu       $4, $2, %lo(BtCashBuffer)
/* 0D1894 001D1794 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0D1898 001D1798 00000000 */   nop
/* 0D189C 001D179C 00708044 */  mtc1        $0, $f14
/* 0D18A0 001D17A0 00000000 */  nop
/* 0D18A4 001D17A4 06730046 */  mov.s       $f12, $f14
/* 0D18A8 001D17A8 46730046 */  mov.s       $f13, $f14
/* 0D18AC 001D17AC EB01013C */  lui         $1, %hi(itemOpenBig)
/* 0D18B0 001D17B0 905F248C */  lw          $4, %lo(itemOpenBig)($1)
/* 0D18B4 001D17B4 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0D18B8 001D17B8 00000000 */   nop
/* 0D18BC 001D17BC EA01013C */  lui         $1, %hi(DngMessMan)
/* 0D18C0 001D17C0 907620AC */  sw          $0, %lo(DngMessMan)($1)
/* 0D18C4 001D17C4 789C838F */  lw          $3, -0x6388($28)
/* 0D18C8 001D17C8 01000224 */  addiu       $2, $0, 0x1
/* 0D18CC 001D17CC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0D18D0 001D17D0 21086100 */  addu        $1, $3, $1
/* 0D18D4 001D17D4 0C8B22AC */  sw          $2, -0x74F4($1)
/* 0D18D8 001D17D8 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0D18DC 001D17DC 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 0D18E0 001D17E0 DC01013C */  lui         $1, %hi(BtActStatus + 0x9C)
/* 0D18E4 001D17E4 1C4522AC */  sw          $2, %lo(BtActStatus + 0x9C)($1)
/* 0D18E8 001D17E8 289480AF */  sw          $0, -0x6BD8($28)
/* 0D18EC 001D17EC 5CFA760C */  jal         autoCamTrial__Fv
/* 0D18F0 001D17F0 00000000 */   nop
.L001D17F4:
/* 0D18F4 001D17F4 1000BF7B */  lq          $31, 0x10($29)
/* 0D18F8 001D17F8 0000B07B */  lq          $16, 0x0($29)
/* 0D18FC 001D17FC D000BD27 */  addiu       $29, $29, 0xD0
/* 0D1900 001D1800 0800E003 */  jr          $31
/* 0D1904 001D1804 00000000 */   nop
/* 0D1908 001D1808 00000000 */  nop
/* 0D190C 001D180C 00000000 */  nop
