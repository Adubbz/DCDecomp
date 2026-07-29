.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OPAnalyz__FPc
/* 005700 01DB1400 B0FFBD27 */  addiu       $29, $29, -0x50
/* 005704 01DB1404 4000BF7F */  sq          $31, 0x40($29)
/* 005708 01DB1408 3000B37F */  sq          $19, 0x30($29)
/* 00570C 01DB140C 2000B27F */  sq          $18, 0x20($29)
/* 005710 01DB1410 1000B17F */  sq          $17, 0x10($29)
/* 005714 01DB1414 0000B07F */  sq          $16, 0x0($29)
/* 005718 01DB1418 A09880AF */  sw          $0, -0x6760($28)
/* 00571C 01DB141C E101023C */  lui         $2, %hi(teigiBuff)
/* 005720 01DB1420 40F45024 */  addiu       $16, $2, %lo(teigiBuff)
/* 005724 01DB1424 E101023C */  lui         $2, %hi(teigiBuff)
/* 005728 01DB1428 40F44524 */  addiu       $5, $2, %lo(teigiBuff)
/* 00572C 01DB142C A4988627 */  addiu       $6, $28, -0x675C
/* 005730 01DB1430 D8FC040C */  jal         LoadFile__FPcPvPi
/* 005734 01DB1434 00000000 */   nop
/* 005738 01DB1438 34054010 */  beqz        $2, .L01DB290C_2B810C
/* 00573C 01DB143C 00000000 */   nop
/* 005740 01DB1440 282E0070 */  paddub      $5, $0, $0
/* 005744 01DB1444 0E000010 */  b           .L01DB1480_2B6C80
/* 005748 01DB1448 00000000 */   nop
.L01DB144C_2B6C4C:
/* 00574C 01DB144C 21380502 */  addu        $7, $16, $5
/* 005750 01DB1450 0000E480 */  lb          $4, 0x0($7)
/* 005754 01DB1454 0D000324 */  addiu       $3, $0, 0xD
/* 005758 01DB1458 08008314 */  bne         $4, $3, .L01DB147C_2B6C7C
/* 00575C 01DB145C 00000000 */   nop
/* 005760 01DB1460 0100E624 */  addiu       $6, $7, 0x1
/* 005764 01DB1464 0100E480 */  lb          $4, 0x1($7)
/* 005768 01DB1468 0A000324 */  addiu       $3, $0, 0xA
/* 00576C 01DB146C 03008314 */  bne         $4, $3, .L01DB147C_2B6C7C
/* 005770 01DB1470 00000000 */   nop
/* 005774 01DB1474 0000C0A0 */  sb          $0, 0x0($6)
/* 005778 01DB1478 0000E0A0 */  sb          $0, 0x0($7)
.L01DB147C_2B6C7C:
/* 00577C 01DB147C 0100A524 */  addiu       $5, $5, 0x1
.L01DB1480_2B6C80:
/* 005780 01DB1480 A498838F */  lw          $3, -0x675C($28)
/* 005784 01DB1484 2A18A300 */  slt         $3, $5, $3
/* 005788 01DB1488 F0FF6014 */  bnez        $3, .L01DB144C_2B6C4C
/* 00578C 01DB148C 00000000 */   nop
/* 005790 01DB1490 282E0070 */  paddub      $5, $0, $0
/* 005794 01DB1494 07000010 */  b           .L01DB14B4_2B6CB4
/* 005798 01DB1498 00000000 */   nop
.L01DB149C_2B6C9C:
/* 00579C 01DB149C 40210500 */  sll         $4, $5, 5
/* 0057A0 01DB14A0 E101033C */  lui         $3, %hi(pointLight)
/* 0057A4 01DB14A4 10E86324 */  addiu       $3, $3, %lo(pointLight)
/* 0057A8 01DB14A8 21186400 */  addu        $3, $3, $4
/* 0057AC 01DB14AC 000060AC */  sw          $0, 0x0($3)
/* 0057B0 01DB14B0 0100A524 */  addiu       $5, $5, 0x1
.L01DB14B4_2B6CB4:
/* 0057B4 01DB14B4 6000A328 */  slti        $3, $5, 0x60
/* 0057B8 01DB14B8 F8FF6014 */  bnez        $3, .L01DB149C_2B6C9C
/* 0057BC 01DB14BC 00000000 */   nop
/* 0057C0 01DB14C0 9C9880AF */  sw          $0, -0x6764($28)
/* 0057C4 01DB14C4 288E0070 */  paddub      $17, $0, $0
/* 0057C8 01DB14C8 0C050010 */  b           .L01DB28FC_2B80FC
/* 0057CC 01DB14CC 00000000 */   nop
.L01DB14D0_2B6CD0:
/* 0057D0 01DB14D0 28960070 */  paddub      $18, $0, $0
/* 0057D4 01DB14D4 28260072 */  paddub      $4, $16, $0
/* 0057D8 01DB14D8 282E2072 */  paddub      $5, $17, $0
/* 0057DC 01DB14DC 0CD2760C */  jal         skipSpace__FPci
/* 0057E0 01DB14E0 00000000 */   nop
/* 0057E4 01DB14E4 288E4070 */  paddub      $17, $2, $0
/* 0057E8 01DB14E8 21200202 */  addu        $4, $16, $2
/* 0057EC 01DB14EC DE01023C */  lui         $2, %hi(LIT_621__5)
/* 0057F0 01DB14F0 28D84524 */  addiu       $5, $2, %lo(LIT_621__5)
/* 0057F4 01DB14F4 07000624 */  addiu       $6, $0, 0x7
/* 0057F8 01DB14F8 C60C040C */  jal         memcmp
/* 0057FC 01DB14FC 00000000 */   nop
/* 005800 01DB1500 19004014 */  bnez        $2, .L01DB1568_2B6D68
/* 005804 01DB1504 00000000 */   nop
/* 005808 01DB1508 07002526 */  addiu       $5, $17, 0x7
/* 00580C 01DB150C 28260072 */  paddub      $4, $16, $0
/* 005810 01DB1510 0CD2760C */  jal         skipSpace__FPci
/* 005814 01DB1514 00000000 */   nop
/* 005818 01DB1518 288E4070 */  paddub      $17, $2, $0
/* 00581C 01DB151C 28260072 */  paddub      $4, $16, $0
/* 005820 01DB1520 282E2072 */  paddub      $5, $17, $0
/* 005824 01DB1524 DD01023C */  lui         $2, %hi(TEIGI_GRD_IMG)
/* 005828 01DB1528 405C4624 */  addiu       $6, $2, %lo(TEIGI_GRD_IMG)
/* 00582C 01DB152C 50D2760C */  jal         checkArg__FPciPi
/* 005830 01DB1530 00000000 */   nop
/* 005834 01DB1534 288E4070 */  paddub      $17, $2, $0
/* 005838 01DB1538 FFFF0224 */  addiu       $2, $0, -0x1
/* 00583C 01DB153C 02002212 */  beq         $17, $2, .L01DB1548_2B6D48
/* 005840 01DB1540 00000000 */   nop
/* 005844 01DB1544 01001224 */  addiu       $18, $0, 0x1
.L01DB1548_2B6D48:
/* 005848 01DB1548 28260072 */  paddub      $4, $16, $0
/* 00584C 01DB154C 282E2072 */  paddub      $5, $17, $0
/* 005850 01DB1550 0CD2760C */  jal         skipSpace__FPci
/* 005854 01DB1554 00000000 */   nop
/* 005858 01DB1558 288E4070 */  paddub      $17, $2, $0
/* 00585C 01DB155C A098828F */  lw          $2, -0x6760($28)
/* 005860 01DB1560 01004224 */  addiu       $2, $2, 0x1
/* 005864 01DB1564 A09882AF */  sw          $2, -0x6760($28)
.L01DB1568_2B6D68:
/* 005868 01DB1568 21201102 */  addu        $4, $16, $17
/* 00586C 01DB156C DE01023C */  lui         $2, %hi(LIT_622__4)
/* 005870 01DB1570 30D84524 */  addiu       $5, $2, %lo(LIT_622__4)
/* 005874 01DB1574 07000624 */  addiu       $6, $0, 0x7
/* 005878 01DB1578 C60C040C */  jal         memcmp
/* 00587C 01DB157C 00000000 */   nop
/* 005880 01DB1580 19004014 */  bnez        $2, .L01DB15E8_2B6DE8
/* 005884 01DB1584 00000000 */   nop
/* 005888 01DB1588 07002526 */  addiu       $5, $17, 0x7
/* 00588C 01DB158C 28260072 */  paddub      $4, $16, $0
/* 005890 01DB1590 0CD2760C */  jal         skipSpace__FPci
/* 005894 01DB1594 00000000 */   nop
/* 005898 01DB1598 288E4070 */  paddub      $17, $2, $0
/* 00589C 01DB159C 28260072 */  paddub      $4, $16, $0
/* 0058A0 01DB15A0 282E2072 */  paddub      $5, $17, $0
/* 0058A4 01DB15A4 DD01023C */  lui         $2, %hi(TEIGI_BLD_IMG)
/* 0058A8 01DB15A8 505C4624 */  addiu       $6, $2, %lo(TEIGI_BLD_IMG)
/* 0058AC 01DB15AC 50D2760C */  jal         checkArg__FPciPi
/* 0058B0 01DB15B0 00000000 */   nop
/* 0058B4 01DB15B4 288E4070 */  paddub      $17, $2, $0
/* 0058B8 01DB15B8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0058BC 01DB15BC 02002212 */  beq         $17, $2, .L01DB15C8_2B6DC8
/* 0058C0 01DB15C0 00000000 */   nop
/* 0058C4 01DB15C4 01001224 */  addiu       $18, $0, 0x1
.L01DB15C8_2B6DC8:
/* 0058C8 01DB15C8 28260072 */  paddub      $4, $16, $0
/* 0058CC 01DB15CC 282E2072 */  paddub      $5, $17, $0
/* 0058D0 01DB15D0 0CD2760C */  jal         skipSpace__FPci
/* 0058D4 01DB15D4 00000000 */   nop
/* 0058D8 01DB15D8 288E4070 */  paddub      $17, $2, $0
/* 0058DC 01DB15DC A098828F */  lw          $2, -0x6760($28)
/* 0058E0 01DB15E0 01004224 */  addiu       $2, $2, 0x1
/* 0058E4 01DB15E4 A09882AF */  sw          $2, -0x6760($28)
.L01DB15E8_2B6DE8:
/* 0058E8 01DB15E8 21201102 */  addu        $4, $16, $17
/* 0058EC 01DB15EC DE01023C */  lui         $2, %hi(LIT_623__4)
/* 0058F0 01DB15F0 38D84524 */  addiu       $5, $2, %lo(LIT_623__4)
/* 0058F4 01DB15F4 07000624 */  addiu       $6, $0, 0x7
/* 0058F8 01DB15F8 C60C040C */  jal         memcmp
/* 0058FC 01DB15FC 00000000 */   nop
/* 005900 01DB1600 19004014 */  bnez        $2, .L01DB1668_2B6E68
/* 005904 01DB1604 00000000 */   nop
/* 005908 01DB1608 07002526 */  addiu       $5, $17, 0x7
/* 00590C 01DB160C 28260072 */  paddub      $4, $16, $0
/* 005910 01DB1610 0CD2760C */  jal         skipSpace__FPci
/* 005914 01DB1614 00000000 */   nop
/* 005918 01DB1618 288E4070 */  paddub      $17, $2, $0
/* 00591C 01DB161C 28260072 */  paddub      $4, $16, $0
/* 005920 01DB1620 282E2072 */  paddub      $5, $17, $0
/* 005924 01DB1624 DD01023C */  lui         $2, %hi(TEIGI_SKY_IMG)
/* 005928 01DB1628 605C4624 */  addiu       $6, $2, %lo(TEIGI_SKY_IMG)
/* 00592C 01DB162C 50D2760C */  jal         checkArg__FPciPi
/* 005930 01DB1630 00000000 */   nop
/* 005934 01DB1634 288E4070 */  paddub      $17, $2, $0
/* 005938 01DB1638 FFFF0224 */  addiu       $2, $0, -0x1
/* 00593C 01DB163C 02002212 */  beq         $17, $2, .L01DB1648_2B6E48
/* 005940 01DB1640 00000000 */   nop
/* 005944 01DB1644 01001224 */  addiu       $18, $0, 0x1
.L01DB1648_2B6E48:
/* 005948 01DB1648 28260072 */  paddub      $4, $16, $0
/* 00594C 01DB164C 282E2072 */  paddub      $5, $17, $0
/* 005950 01DB1650 0CD2760C */  jal         skipSpace__FPci
/* 005954 01DB1654 00000000 */   nop
/* 005958 01DB1658 288E4070 */  paddub      $17, $2, $0
/* 00595C 01DB165C A098828F */  lw          $2, -0x6760($28)
/* 005960 01DB1660 01004224 */  addiu       $2, $2, 0x1
/* 005964 01DB1664 A09882AF */  sw          $2, -0x6760($28)
.L01DB1668_2B6E68:
/* 005968 01DB1668 21201102 */  addu        $4, $16, $17
/* 00596C 01DB166C DE01023C */  lui         $2, %hi(LIT_624__4)
/* 005970 01DB1670 40D84524 */  addiu       $5, $2, %lo(LIT_624__4)
/* 005974 01DB1674 03000624 */  addiu       $6, $0, 0x3
/* 005978 01DB1678 C60C040C */  jal         memcmp
/* 00597C 01DB167C 00000000 */   nop
/* 005980 01DB1680 19004014 */  bnez        $2, .L01DB16E8_2B6EE8
/* 005984 01DB1684 00000000 */   nop
/* 005988 01DB1688 03002526 */  addiu       $5, $17, 0x3
/* 00598C 01DB168C 28260072 */  paddub      $4, $16, $0
/* 005990 01DB1690 0CD2760C */  jal         skipSpace__FPci
/* 005994 01DB1694 00000000 */   nop
/* 005998 01DB1698 288E4070 */  paddub      $17, $2, $0
/* 00599C 01DB169C 28260072 */  paddub      $4, $16, $0
/* 0059A0 01DB16A0 282E2072 */  paddub      $5, $17, $0
/* 0059A4 01DB16A4 DD01023C */  lui         $2, %hi(TEIGI_GRD)
/* 0059A8 01DB16A8 805C4624 */  addiu       $6, $2, %lo(TEIGI_GRD)
/* 0059AC 01DB16AC 50D2760C */  jal         checkArg__FPciPi
/* 0059B0 01DB16B0 00000000 */   nop
/* 0059B4 01DB16B4 288E4070 */  paddub      $17, $2, $0
/* 0059B8 01DB16B8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0059BC 01DB16BC 02002212 */  beq         $17, $2, .L01DB16C8_2B6EC8
/* 0059C0 01DB16C0 00000000 */   nop
/* 0059C4 01DB16C4 01001224 */  addiu       $18, $0, 0x1
.L01DB16C8_2B6EC8:
/* 0059C8 01DB16C8 28260072 */  paddub      $4, $16, $0
/* 0059CC 01DB16CC 282E2072 */  paddub      $5, $17, $0
/* 0059D0 01DB16D0 0CD2760C */  jal         skipSpace__FPci
/* 0059D4 01DB16D4 00000000 */   nop
/* 0059D8 01DB16D8 288E4070 */  paddub      $17, $2, $0
/* 0059DC 01DB16DC A098828F */  lw          $2, -0x6760($28)
/* 0059E0 01DB16E0 01004224 */  addiu       $2, $2, 0x1
/* 0059E4 01DB16E4 A09882AF */  sw          $2, -0x6760($28)
.L01DB16E8_2B6EE8:
/* 0059E8 01DB16E8 21981102 */  addu        $19, $16, $17
/* 0059EC 01DB16EC 28266072 */  paddub      $4, $19, $0
/* 0059F0 01DB16F0 DE01023C */  lui         $2, %hi(LIT_625__5)
/* 0059F4 01DB16F4 48D84524 */  addiu       $5, $2, %lo(LIT_625__5)
/* 0059F8 01DB16F8 03000624 */  addiu       $6, $0, 0x3
/* 0059FC 01DB16FC C60C040C */  jal         memcmp
/* 005A00 01DB1700 00000000 */   nop
/* 005A04 01DB1704 21004014 */  bnez        $2, .L01DB178C_2B6F8C
/* 005A08 01DB1708 00000000 */   nop
/* 005A0C 01DB170C 28266072 */  paddub      $4, $19, $0
/* 005A10 01DB1710 DE01023C */  lui         $2, %hi(LIT_622__4)
/* 005A14 01DB1714 30D84524 */  addiu       $5, $2, %lo(LIT_622__4)
/* 005A18 01DB1718 07000624 */  addiu       $6, $0, 0x7
/* 005A1C 01DB171C C60C040C */  jal         memcmp
/* 005A20 01DB1720 00000000 */   nop
/* 005A24 01DB1724 19004010 */  beqz        $2, .L01DB178C_2B6F8C
/* 005A28 01DB1728 00000000 */   nop
/* 005A2C 01DB172C 03002526 */  addiu       $5, $17, 0x3
/* 005A30 01DB1730 28260072 */  paddub      $4, $16, $0
/* 005A34 01DB1734 0CD2760C */  jal         skipSpace__FPci
/* 005A38 01DB1738 00000000 */   nop
/* 005A3C 01DB173C 288E4070 */  paddub      $17, $2, $0
/* 005A40 01DB1740 28260072 */  paddub      $4, $16, $0
/* 005A44 01DB1744 282E2072 */  paddub      $5, $17, $0
/* 005A48 01DB1748 DD01023C */  lui         $2, %hi(TEIGI_BLD)
/* 005A4C 01DB174C B05C4624 */  addiu       $6, $2, %lo(TEIGI_BLD)
/* 005A50 01DB1750 50D2760C */  jal         checkArg__FPciPi
/* 005A54 01DB1754 00000000 */   nop
/* 005A58 01DB1758 288E4070 */  paddub      $17, $2, $0
/* 005A5C 01DB175C FFFF0224 */  addiu       $2, $0, -0x1
/* 005A60 01DB1760 02002212 */  beq         $17, $2, .L01DB176C_2B6F6C
/* 005A64 01DB1764 00000000 */   nop
/* 005A68 01DB1768 01001224 */  addiu       $18, $0, 0x1
.L01DB176C_2B6F6C:
/* 005A6C 01DB176C 28260072 */  paddub      $4, $16, $0
/* 005A70 01DB1770 282E2072 */  paddub      $5, $17, $0
/* 005A74 01DB1774 0CD2760C */  jal         skipSpace__FPci
/* 005A78 01DB1778 00000000 */   nop
/* 005A7C 01DB177C 288E4070 */  paddub      $17, $2, $0
/* 005A80 01DB1780 A098828F */  lw          $2, -0x6760($28)
/* 005A84 01DB1784 01004224 */  addiu       $2, $2, 0x1
/* 005A88 01DB1788 A09882AF */  sw          $2, -0x6760($28)
.L01DB178C_2B6F8C:
/* 005A8C 01DB178C 21201102 */  addu        $4, $16, $17
/* 005A90 01DB1790 DE01023C */  lui         $2, %hi(LIT_626__6)
/* 005A94 01DB1794 50D84524 */  addiu       $5, $2, %lo(LIT_626__6)
/* 005A98 01DB1798 03000624 */  addiu       $6, $0, 0x3
/* 005A9C 01DB179C C60C040C */  jal         memcmp
/* 005AA0 01DB17A0 00000000 */   nop
/* 005AA4 01DB17A4 19004014 */  bnez        $2, .L01DB180C_2B700C
/* 005AA8 01DB17A8 00000000 */   nop
/* 005AAC 01DB17AC 03002526 */  addiu       $5, $17, 0x3
/* 005AB0 01DB17B0 28260072 */  paddub      $4, $16, $0
/* 005AB4 01DB17B4 0CD2760C */  jal         skipSpace__FPci
/* 005AB8 01DB17B8 00000000 */   nop
/* 005ABC 01DB17BC 288E4070 */  paddub      $17, $2, $0
/* 005AC0 01DB17C0 28260072 */  paddub      $4, $16, $0
/* 005AC4 01DB17C4 282E2072 */  paddub      $5, $17, $0
/* 005AC8 01DB17C8 DD01023C */  lui         $2, %hi(TEIGI_LOD)
/* 005ACC 01DB17CC D85C4624 */  addiu       $6, $2, %lo(TEIGI_LOD)
/* 005AD0 01DB17D0 50D2760C */  jal         checkArg__FPciPi
/* 005AD4 01DB17D4 00000000 */   nop
/* 005AD8 01DB17D8 288E4070 */  paddub      $17, $2, $0
/* 005ADC 01DB17DC FFFF0224 */  addiu       $2, $0, -0x1
/* 005AE0 01DB17E0 02002212 */  beq         $17, $2, .L01DB17EC_2B6FEC
/* 005AE4 01DB17E4 00000000 */   nop
/* 005AE8 01DB17E8 01001224 */  addiu       $18, $0, 0x1
.L01DB17EC_2B6FEC:
/* 005AEC 01DB17EC 28260072 */  paddub      $4, $16, $0
/* 005AF0 01DB17F0 282E2072 */  paddub      $5, $17, $0
/* 005AF4 01DB17F4 0CD2760C */  jal         skipSpace__FPci
/* 005AF8 01DB17F8 00000000 */   nop
/* 005AFC 01DB17FC 288E4070 */  paddub      $17, $2, $0
/* 005B00 01DB1800 A098828F */  lw          $2, -0x6760($28)
/* 005B04 01DB1804 01004224 */  addiu       $2, $2, 0x1
/* 005B08 01DB1808 A09882AF */  sw          $2, -0x6760($28)
.L01DB180C_2B700C:
/* 005B0C 01DB180C 21201102 */  addu        $4, $16, $17
/* 005B10 01DB1810 DE01023C */  lui         $2, %hi(LIT_627__6)
/* 005B14 01DB1814 58D84524 */  addiu       $5, $2, %lo(LIT_627__6)
/* 005B18 01DB1818 03000624 */  addiu       $6, $0, 0x3
/* 005B1C 01DB181C C60C040C */  jal         memcmp
/* 005B20 01DB1820 00000000 */   nop
/* 005B24 01DB1824 19004014 */  bnez        $2, .L01DB188C_2B708C
/* 005B28 01DB1828 00000000 */   nop
/* 005B2C 01DB182C 03002526 */  addiu       $5, $17, 0x3
/* 005B30 01DB1830 28260072 */  paddub      $4, $16, $0
/* 005B34 01DB1834 0CD2760C */  jal         skipSpace__FPci
/* 005B38 01DB1838 00000000 */   nop
/* 005B3C 01DB183C 288E4070 */  paddub      $17, $2, $0
/* 005B40 01DB1840 28260072 */  paddub      $4, $16, $0
/* 005B44 01DB1844 282E2072 */  paddub      $5, $17, $0
/* 005B48 01DB1848 DD01023C */  lui         $2, %hi(TEIGI_SKY)
/* 005B4C 01DB184C 005D4624 */  addiu       $6, $2, %lo(TEIGI_SKY)
/* 005B50 01DB1850 50D2760C */  jal         checkArg__FPciPi
/* 005B54 01DB1854 00000000 */   nop
/* 005B58 01DB1858 288E4070 */  paddub      $17, $2, $0
/* 005B5C 01DB185C FFFF0224 */  addiu       $2, $0, -0x1
/* 005B60 01DB1860 02002212 */  beq         $17, $2, .L01DB186C_2B706C
/* 005B64 01DB1864 00000000 */   nop
/* 005B68 01DB1868 01001224 */  addiu       $18, $0, 0x1
.L01DB186C_2B706C:
/* 005B6C 01DB186C 28260072 */  paddub      $4, $16, $0
/* 005B70 01DB1870 282E2072 */  paddub      $5, $17, $0
/* 005B74 01DB1874 0CD2760C */  jal         skipSpace__FPci
/* 005B78 01DB1878 00000000 */   nop
/* 005B7C 01DB187C 288E4070 */  paddub      $17, $2, $0
/* 005B80 01DB1880 A098828F */  lw          $2, -0x6760($28)
/* 005B84 01DB1884 01004224 */  addiu       $2, $2, 0x1
/* 005B88 01DB1888 A09882AF */  sw          $2, -0x6760($28)
.L01DB188C_2B708C:
/* 005B8C 01DB188C 21201102 */  addu        $4, $16, $17
/* 005B90 01DB1890 DE01023C */  lui         $2, %hi(LIT_628__6)
/* 005B94 01DB1894 60D84524 */  addiu       $5, $2, %lo(LIT_628__6)
/* 005B98 01DB1898 03000624 */  addiu       $6, $0, 0x3
/* 005B9C 01DB189C C60C040C */  jal         memcmp
/* 005BA0 01DB18A0 00000000 */   nop
/* 005BA4 01DB18A4 19004014 */  bnez        $2, .L01DB190C_2B710C
/* 005BA8 01DB18A8 00000000 */   nop
/* 005BAC 01DB18AC 03002526 */  addiu       $5, $17, 0x3
/* 005BB0 01DB18B0 28260072 */  paddub      $4, $16, $0
/* 005BB4 01DB18B4 0CD2760C */  jal         skipSpace__FPci
/* 005BB8 01DB18B8 00000000 */   nop
/* 005BBC 01DB18BC 288E4070 */  paddub      $17, $2, $0
/* 005BC0 01DB18C0 28260072 */  paddub      $4, $16, $0
/* 005BC4 01DB18C4 282E2072 */  paddub      $5, $17, $0
/* 005BC8 01DB18C8 DD01023C */  lui         $2, %hi(TEIGI_FOG)
/* 005BCC 01DB18CC 105D4624 */  addiu       $6, $2, %lo(TEIGI_FOG)
/* 005BD0 01DB18D0 50D2760C */  jal         checkArg__FPciPi
/* 005BD4 01DB18D4 00000000 */   nop
/* 005BD8 01DB18D8 288E4070 */  paddub      $17, $2, $0
/* 005BDC 01DB18DC FFFF0224 */  addiu       $2, $0, -0x1
/* 005BE0 01DB18E0 02002212 */  beq         $17, $2, .L01DB18EC_2B70EC
/* 005BE4 01DB18E4 00000000 */   nop
/* 005BE8 01DB18E8 01001224 */  addiu       $18, $0, 0x1
.L01DB18EC_2B70EC:
/* 005BEC 01DB18EC 28260072 */  paddub      $4, $16, $0
/* 005BF0 01DB18F0 282E2072 */  paddub      $5, $17, $0
/* 005BF4 01DB18F4 0CD2760C */  jal         skipSpace__FPci
/* 005BF8 01DB18F8 00000000 */   nop
/* 005BFC 01DB18FC 288E4070 */  paddub      $17, $2, $0
/* 005C00 01DB1900 A098828F */  lw          $2, -0x6760($28)
/* 005C04 01DB1904 01004224 */  addiu       $2, $2, 0x1
/* 005C08 01DB1908 A09882AF */  sw          $2, -0x6760($28)
.L01DB190C_2B710C:
/* 005C0C 01DB190C 21201102 */  addu        $4, $16, $17
/* 005C10 01DB1910 DE01023C */  lui         $2, %hi(LIT_629__5)
/* 005C14 01DB1914 68D84524 */  addiu       $5, $2, %lo(LIT_629__5)
/* 005C18 01DB1918 03000624 */  addiu       $6, $0, 0x3
/* 005C1C 01DB191C C60C040C */  jal         memcmp
/* 005C20 01DB1920 00000000 */   nop
/* 005C24 01DB1924 19004014 */  bnez        $2, .L01DB198C_2B718C
/* 005C28 01DB1928 00000000 */   nop
/* 005C2C 01DB192C 03002526 */  addiu       $5, $17, 0x3
/* 005C30 01DB1930 28260072 */  paddub      $4, $16, $0
/* 005C34 01DB1934 0CD2760C */  jal         skipSpace__FPci
/* 005C38 01DB1938 00000000 */   nop
/* 005C3C 01DB193C 288E4070 */  paddub      $17, $2, $0
/* 005C40 01DB1940 28260072 */  paddub      $4, $16, $0
/* 005C44 01DB1944 282E2072 */  paddub      $5, $17, $0
/* 005C48 01DB1948 DD01023C */  lui         $2, %hi(TEIGI_CRD)
/* 005C4C 01DB194C E85C4624 */  addiu       $6, $2, %lo(TEIGI_CRD)
/* 005C50 01DB1950 50D2760C */  jal         checkArg__FPciPi
/* 005C54 01DB1954 00000000 */   nop
/* 005C58 01DB1958 288E4070 */  paddub      $17, $2, $0
/* 005C5C 01DB195C FFFF0224 */  addiu       $2, $0, -0x1
/* 005C60 01DB1960 02002212 */  beq         $17, $2, .L01DB196C_2B716C
/* 005C64 01DB1964 00000000 */   nop
/* 005C68 01DB1968 01001224 */  addiu       $18, $0, 0x1
.L01DB196C_2B716C:
/* 005C6C 01DB196C 28260072 */  paddub      $4, $16, $0
/* 005C70 01DB1970 282E2072 */  paddub      $5, $17, $0
/* 005C74 01DB1974 0CD2760C */  jal         skipSpace__FPci
/* 005C78 01DB1978 00000000 */   nop
/* 005C7C 01DB197C 288E4070 */  paddub      $17, $2, $0
/* 005C80 01DB1980 A098828F */  lw          $2, -0x6760($28)
/* 005C84 01DB1984 01004224 */  addiu       $2, $2, 0x1
/* 005C88 01DB1988 A09882AF */  sw          $2, -0x6760($28)
.L01DB198C_2B718C:
/* 005C8C 01DB198C 21201102 */  addu        $4, $16, $17
/* 005C90 01DB1990 DE01023C */  lui         $2, %hi(LIT_630__7)
/* 005C94 01DB1994 70D84524 */  addiu       $5, $2, %lo(LIT_630__7)
/* 005C98 01DB1998 07000624 */  addiu       $6, $0, 0x7
/* 005C9C 01DB199C C60C040C */  jal         memcmp
/* 005CA0 01DB19A0 00000000 */   nop
/* 005CA4 01DB19A4 19004014 */  bnez        $2, .L01DB1A0C_2B720C
/* 005CA8 01DB19A8 00000000 */   nop
/* 005CAC 01DB19AC 07002526 */  addiu       $5, $17, 0x7
/* 005CB0 01DB19B0 28260072 */  paddub      $4, $16, $0
/* 005CB4 01DB19B4 0CD2760C */  jal         skipSpace__FPci
/* 005CB8 01DB19B8 00000000 */   nop
/* 005CBC 01DB19BC 288E4070 */  paddub      $17, $2, $0
/* 005CC0 01DB19C0 28260072 */  paddub      $4, $16, $0
/* 005CC4 01DB19C4 282E2072 */  paddub      $5, $17, $0
/* 005CC8 01DB19C8 DD01023C */  lui         $2, %hi(TEIGI_AMBIENT)
/* 005CCC 01DB19CC 405D4624 */  addiu       $6, $2, %lo(TEIGI_AMBIENT)
/* 005CD0 01DB19D0 50D2760C */  jal         checkArg__FPciPi
/* 005CD4 01DB19D4 00000000 */   nop
/* 005CD8 01DB19D8 288E4070 */  paddub      $17, $2, $0
/* 005CDC 01DB19DC FFFF0224 */  addiu       $2, $0, -0x1
/* 005CE0 01DB19E0 02002212 */  beq         $17, $2, .L01DB19EC_2B71EC
/* 005CE4 01DB19E4 00000000 */   nop
/* 005CE8 01DB19E8 01001224 */  addiu       $18, $0, 0x1
.L01DB19EC_2B71EC:
/* 005CEC 01DB19EC 28260072 */  paddub      $4, $16, $0
/* 005CF0 01DB19F0 282E2072 */  paddub      $5, $17, $0
/* 005CF4 01DB19F4 0CD2760C */  jal         skipSpace__FPci
/* 005CF8 01DB19F8 00000000 */   nop
/* 005CFC 01DB19FC 288E4070 */  paddub      $17, $2, $0
/* 005D00 01DB1A00 A098828F */  lw          $2, -0x6760($28)
/* 005D04 01DB1A04 01004224 */  addiu       $2, $2, 0x1
/* 005D08 01DB1A08 A09882AF */  sw          $2, -0x6760($28)
.L01DB1A0C_2B720C:
/* 005D0C 01DB1A0C 21201102 */  addu        $4, $16, $17
/* 005D10 01DB1A10 DE01023C */  lui         $2, %hi(LIT_631__6)
/* 005D14 01DB1A14 78D84524 */  addiu       $5, $2, %lo(LIT_631__6)
/* 005D18 01DB1A18 07000624 */  addiu       $6, $0, 0x7
/* 005D1C 01DB1A1C C60C040C */  jal         memcmp
/* 005D20 01DB1A20 00000000 */   nop
/* 005D24 01DB1A24 19004014 */  bnez        $2, .L01DB1A8C_2B728C
/* 005D28 01DB1A28 00000000 */   nop
/* 005D2C 01DB1A2C 07002526 */  addiu       $5, $17, 0x7
/* 005D30 01DB1A30 28260072 */  paddub      $4, $16, $0
/* 005D34 01DB1A34 0CD2760C */  jal         skipSpace__FPci
/* 005D38 01DB1A38 00000000 */   nop
/* 005D3C 01DB1A3C 288E4070 */  paddub      $17, $2, $0
/* 005D40 01DB1A40 28260072 */  paddub      $4, $16, $0
/* 005D44 01DB1A44 282E2072 */  paddub      $5, $17, $0
/* 005D48 01DB1A48 DD01023C */  lui         $2, %hi(TEIGI_LIGHT_COL)
/* 005D4C 01DB1A4C 605D4624 */  addiu       $6, $2, %lo(TEIGI_LIGHT_COL)
/* 005D50 01DB1A50 50D2760C */  jal         checkArg__FPciPi
/* 005D54 01DB1A54 00000000 */   nop
/* 005D58 01DB1A58 288E4070 */  paddub      $17, $2, $0
/* 005D5C 01DB1A5C FFFF0224 */  addiu       $2, $0, -0x1
/* 005D60 01DB1A60 02002212 */  beq         $17, $2, .L01DB1A6C_2B726C
/* 005D64 01DB1A64 00000000 */   nop
/* 005D68 01DB1A68 01001224 */  addiu       $18, $0, 0x1
.L01DB1A6C_2B726C:
/* 005D6C 01DB1A6C 28260072 */  paddub      $4, $16, $0
/* 005D70 01DB1A70 282E2072 */  paddub      $5, $17, $0
/* 005D74 01DB1A74 0CD2760C */  jal         skipSpace__FPci
/* 005D78 01DB1A78 00000000 */   nop
/* 005D7C 01DB1A7C 288E4070 */  paddub      $17, $2, $0
/* 005D80 01DB1A80 A098828F */  lw          $2, -0x6760($28)
/* 005D84 01DB1A84 01004224 */  addiu       $2, $2, 0x1
/* 005D88 01DB1A88 A09882AF */  sw          $2, -0x6760($28)
.L01DB1A8C_2B728C:
/* 005D8C 01DB1A8C 21201102 */  addu        $4, $16, $17
/* 005D90 01DB1A90 DE01023C */  lui         $2, %hi(LIT_632__4)
/* 005D94 01DB1A94 80D84524 */  addiu       $5, $2, %lo(LIT_632__4)
/* 005D98 01DB1A98 07000624 */  addiu       $6, $0, 0x7
/* 005D9C 01DB1A9C C60C040C */  jal         memcmp
/* 005DA0 01DB1AA0 00000000 */   nop
/* 005DA4 01DB1AA4 19004014 */  bnez        $2, .L01DB1B0C_2B730C
/* 005DA8 01DB1AA8 00000000 */   nop
/* 005DAC 01DB1AAC 07002526 */  addiu       $5, $17, 0x7
/* 005DB0 01DB1AB0 28260072 */  paddub      $4, $16, $0
/* 005DB4 01DB1AB4 0CD2760C */  jal         skipSpace__FPci
/* 005DB8 01DB1AB8 00000000 */   nop
/* 005DBC 01DB1ABC 288E4070 */  paddub      $17, $2, $0
/* 005DC0 01DB1AC0 28260072 */  paddub      $4, $16, $0
/* 005DC4 01DB1AC4 282E2072 */  paddub      $5, $17, $0
/* 005DC8 01DB1AC8 DD01023C */  lui         $2, %hi(TEIGI_FARCLIP)
/* 005DCC 01DB1ACC 885D4624 */  addiu       $6, $2, %lo(TEIGI_FARCLIP)
/* 005DD0 01DB1AD0 50D2760C */  jal         checkArg__FPciPi
/* 005DD4 01DB1AD4 00000000 */   nop
/* 005DD8 01DB1AD8 288E4070 */  paddub      $17, $2, $0
/* 005DDC 01DB1ADC FFFF0224 */  addiu       $2, $0, -0x1
/* 005DE0 01DB1AE0 02002212 */  beq         $17, $2, .L01DB1AEC_2B72EC
/* 005DE4 01DB1AE4 00000000 */   nop
/* 005DE8 01DB1AE8 01001224 */  addiu       $18, $0, 0x1
.L01DB1AEC_2B72EC:
/* 005DEC 01DB1AEC 28260072 */  paddub      $4, $16, $0
/* 005DF0 01DB1AF0 282E2072 */  paddub      $5, $17, $0
/* 005DF4 01DB1AF4 0CD2760C */  jal         skipSpace__FPci
/* 005DF8 01DB1AF8 00000000 */   nop
/* 005DFC 01DB1AFC 288E4070 */  paddub      $17, $2, $0
/* 005E00 01DB1B00 A098828F */  lw          $2, -0x6760($28)
/* 005E04 01DB1B04 01004224 */  addiu       $2, $2, 0x1
/* 005E08 01DB1B08 A09882AF */  sw          $2, -0x6760($28)
.L01DB1B0C_2B730C:
/* 005E0C 01DB1B0C 21201102 */  addu        $4, $16, $17
/* 005E10 01DB1B10 DE01023C */  lui         $2, %hi(LIT_633__4)
/* 005E14 01DB1B14 88D84524 */  addiu       $5, $2, %lo(LIT_633__4)
/* 005E18 01DB1B18 07000624 */  addiu       $6, $0, 0x7
/* 005E1C 01DB1B1C C60C040C */  jal         memcmp
/* 005E20 01DB1B20 00000000 */   nop
/* 005E24 01DB1B24 19004014 */  bnez        $2, .L01DB1B8C_2B738C
/* 005E28 01DB1B28 00000000 */   nop
/* 005E2C 01DB1B2C 06002526 */  addiu       $5, $17, 0x6
/* 005E30 01DB1B30 28260072 */  paddub      $4, $16, $0
/* 005E34 01DB1B34 0CD2760C */  jal         skipSpace__FPci
/* 005E38 01DB1B38 00000000 */   nop
/* 005E3C 01DB1B3C 288E4070 */  paddub      $17, $2, $0
/* 005E40 01DB1B40 28260072 */  paddub      $4, $16, $0
/* 005E44 01DB1B44 282E2072 */  paddub      $5, $17, $0
/* 005E48 01DB1B48 DD01023C */  lui         $2, %hi(TEIGI_BG_COL2)
/* 005E4C 01DB1B4C A05D4624 */  addiu       $6, $2, %lo(TEIGI_BG_COL2)
/* 005E50 01DB1B50 50D2760C */  jal         checkArg__FPciPi
/* 005E54 01DB1B54 00000000 */   nop
/* 005E58 01DB1B58 288E4070 */  paddub      $17, $2, $0
/* 005E5C 01DB1B5C FFFF0224 */  addiu       $2, $0, -0x1
/* 005E60 01DB1B60 02002212 */  beq         $17, $2, .L01DB1B6C_2B736C
/* 005E64 01DB1B64 00000000 */   nop
/* 005E68 01DB1B68 01001224 */  addiu       $18, $0, 0x1
.L01DB1B6C_2B736C:
/* 005E6C 01DB1B6C 28260072 */  paddub      $4, $16, $0
/* 005E70 01DB1B70 282E2072 */  paddub      $5, $17, $0
/* 005E74 01DB1B74 0CD2760C */  jal         skipSpace__FPci
/* 005E78 01DB1B78 00000000 */   nop
/* 005E7C 01DB1B7C 288E4070 */  paddub      $17, $2, $0
/* 005E80 01DB1B80 A098828F */  lw          $2, -0x6760($28)
/* 005E84 01DB1B84 01004224 */  addiu       $2, $2, 0x1
/* 005E88 01DB1B88 A09882AF */  sw          $2, -0x6760($28)
.L01DB1B8C_2B738C:
/* 005E8C 01DB1B8C 21201102 */  addu        $4, $16, $17
/* 005E90 01DB1B90 DE01023C */  lui         $2, %hi(LIT_634__4)
/* 005E94 01DB1B94 90D84524 */  addiu       $5, $2, %lo(LIT_634__4)
/* 005E98 01DB1B98 06000624 */  addiu       $6, $0, 0x6
/* 005E9C 01DB1B9C C60C040C */  jal         memcmp
/* 005EA0 01DB1BA0 00000000 */   nop
/* 005EA4 01DB1BA4 19004014 */  bnez        $2, .L01DB1C0C_2B740C
/* 005EA8 01DB1BA8 00000000 */   nop
/* 005EAC 01DB1BAC 06002526 */  addiu       $5, $17, 0x6
/* 005EB0 01DB1BB0 28260072 */  paddub      $4, $16, $0
/* 005EB4 01DB1BB4 0CD2760C */  jal         skipSpace__FPci
/* 005EB8 01DB1BB8 00000000 */   nop
/* 005EBC 01DB1BBC 288E4070 */  paddub      $17, $2, $0
/* 005EC0 01DB1BC0 28260072 */  paddub      $4, $16, $0
/* 005EC4 01DB1BC4 282E2072 */  paddub      $5, $17, $0
/* 005EC8 01DB1BC8 DD01023C */  lui         $2, %hi(TEIGI_BG_COL)
/* 005ECC 01DB1BCC C05D4624 */  addiu       $6, $2, %lo(TEIGI_BG_COL)
/* 005ED0 01DB1BD0 50D2760C */  jal         checkArg__FPciPi
/* 005ED4 01DB1BD4 00000000 */   nop
/* 005ED8 01DB1BD8 288E4070 */  paddub      $17, $2, $0
/* 005EDC 01DB1BDC FFFF0224 */  addiu       $2, $0, -0x1
/* 005EE0 01DB1BE0 02002212 */  beq         $17, $2, .L01DB1BEC_2B73EC
/* 005EE4 01DB1BE4 00000000 */   nop
/* 005EE8 01DB1BE8 01001224 */  addiu       $18, $0, 0x1
.L01DB1BEC_2B73EC:
/* 005EEC 01DB1BEC 28260072 */  paddub      $4, $16, $0
/* 005EF0 01DB1BF0 282E2072 */  paddub      $5, $17, $0
/* 005EF4 01DB1BF4 0CD2760C */  jal         skipSpace__FPci
/* 005EF8 01DB1BF8 00000000 */   nop
/* 005EFC 01DB1BFC 288E4070 */  paddub      $17, $2, $0
/* 005F00 01DB1C00 A098828F */  lw          $2, -0x6760($28)
/* 005F04 01DB1C04 01004224 */  addiu       $2, $2, 0x1
/* 005F08 01DB1C08 A09882AF */  sw          $2, -0x6760($28)
.L01DB1C0C_2B740C:
/* 005F0C 01DB1C0C 21201102 */  addu        $4, $16, $17
/* 005F10 01DB1C10 DE01023C */  lui         $2, %hi(LIT_635__5)
/* 005F14 01DB1C14 98D84524 */  addiu       $5, $2, %lo(LIT_635__5)
/* 005F18 01DB1C18 0E000624 */  addiu       $6, $0, 0xE
/* 005F1C 01DB1C1C C60C040C */  jal         memcmp
/* 005F20 01DB1C20 00000000 */   nop
/* 005F24 01DB1C24 19004014 */  bnez        $2, .L01DB1C8C_2B748C
/* 005F28 01DB1C28 00000000 */   nop
/* 005F2C 01DB1C2C 0E002526 */  addiu       $5, $17, 0xE
/* 005F30 01DB1C30 28260072 */  paddub      $4, $16, $0
/* 005F34 01DB1C34 0CD2760C */  jal         skipSpace__FPci
/* 005F38 01DB1C38 00000000 */   nop
/* 005F3C 01DB1C3C 288E4070 */  paddub      $17, $2, $0
/* 005F40 01DB1C40 28260072 */  paddub      $4, $16, $0
/* 005F44 01DB1C44 282E2072 */  paddub      $5, $17, $0
/* 005F48 01DB1C48 DD01023C */  lui         $2, %hi(TEIGI_NORMALCLIP_OFF)
/* 005F4C 01DB1C4C D85D4624 */  addiu       $6, $2, %lo(TEIGI_NORMALCLIP_OFF)
/* 005F50 01DB1C50 50D2760C */  jal         checkArg__FPciPi
/* 005F54 01DB1C54 00000000 */   nop
/* 005F58 01DB1C58 288E4070 */  paddub      $17, $2, $0
/* 005F5C 01DB1C5C FFFF0224 */  addiu       $2, $0, -0x1
/* 005F60 01DB1C60 02002212 */  beq         $17, $2, .L01DB1C6C_2B746C
/* 005F64 01DB1C64 00000000 */   nop
/* 005F68 01DB1C68 01001224 */  addiu       $18, $0, 0x1
.L01DB1C6C_2B746C:
/* 005F6C 01DB1C6C 28260072 */  paddub      $4, $16, $0
/* 005F70 01DB1C70 282E2072 */  paddub      $5, $17, $0
/* 005F74 01DB1C74 0CD2760C */  jal         skipSpace__FPci
/* 005F78 01DB1C78 00000000 */   nop
/* 005F7C 01DB1C7C 288E4070 */  paddub      $17, $2, $0
/* 005F80 01DB1C80 A098828F */  lw          $2, -0x6760($28)
/* 005F84 01DB1C84 01004224 */  addiu       $2, $2, 0x1
/* 005F88 01DB1C88 A09882AF */  sw          $2, -0x6760($28)
.L01DB1C8C_2B748C:
/* 005F8C 01DB1C8C 21201102 */  addu        $4, $16, $17
/* 005F90 01DB1C90 DE01023C */  lui         $2, %hi(LIT_636__4)
/* 005F94 01DB1C94 A8D84524 */  addiu       $5, $2, %lo(LIT_636__4)
/* 005F98 01DB1C98 09000624 */  addiu       $6, $0, 0x9
/* 005F9C 01DB1C9C C60C040C */  jal         memcmp
/* 005FA0 01DB1CA0 00000000 */   nop
/* 005FA4 01DB1CA4 19004014 */  bnez        $2, .L01DB1D0C_2B750C
/* 005FA8 01DB1CA8 00000000 */   nop
/* 005FAC 01DB1CAC 09002526 */  addiu       $5, $17, 0x9
/* 005FB0 01DB1CB0 28260072 */  paddub      $4, $16, $0
/* 005FB4 01DB1CB4 0CD2760C */  jal         skipSpace__FPci
/* 005FB8 01DB1CB8 00000000 */   nop
/* 005FBC 01DB1CBC 288E4070 */  paddub      $17, $2, $0
/* 005FC0 01DB1CC0 28260072 */  paddub      $4, $16, $0
/* 005FC4 01DB1CC4 282E2072 */  paddub      $5, $17, $0
/* 005FC8 01DB1CC8 DD01023C */  lui         $2, %hi(TEIGI_RUN_SPEED)
/* 005FCC 01DB1CCC E85D4624 */  addiu       $6, $2, %lo(TEIGI_RUN_SPEED)
/* 005FD0 01DB1CD0 50D2760C */  jal         checkArg__FPciPi
/* 005FD4 01DB1CD4 00000000 */   nop
/* 005FD8 01DB1CD8 288E4070 */  paddub      $17, $2, $0
/* 005FDC 01DB1CDC FFFF0224 */  addiu       $2, $0, -0x1
/* 005FE0 01DB1CE0 02002212 */  beq         $17, $2, .L01DB1CEC_2B74EC
/* 005FE4 01DB1CE4 00000000 */   nop
/* 005FE8 01DB1CE8 01001224 */  addiu       $18, $0, 0x1
.L01DB1CEC_2B74EC:
/* 005FEC 01DB1CEC 28260072 */  paddub      $4, $16, $0
/* 005FF0 01DB1CF0 282E2072 */  paddub      $5, $17, $0
/* 005FF4 01DB1CF4 0CD2760C */  jal         skipSpace__FPci
/* 005FF8 01DB1CF8 00000000 */   nop
/* 005FFC 01DB1CFC 288E4070 */  paddub      $17, $2, $0
/* 006000 01DB1D00 A098828F */  lw          $2, -0x6760($28)
/* 006004 01DB1D04 01004224 */  addiu       $2, $2, 0x1
/* 006008 01DB1D08 A09882AF */  sw          $2, -0x6760($28)
.L01DB1D0C_2B750C:
/* 00600C 01DB1D0C 21201102 */  addu        $4, $16, $17
/* 006010 01DB1D10 DE01023C */  lui         $2, %hi(LIT_637__3)
/* 006014 01DB1D14 B8D84524 */  addiu       $5, $2, %lo(LIT_637__3)
/* 006018 01DB1D18 08000624 */  addiu       $6, $0, 0x8
/* 00601C 01DB1D1C C60C040C */  jal         memcmp
/* 006020 01DB1D20 00000000 */   nop
/* 006024 01DB1D24 19004014 */  bnez        $2, .L01DB1D8C_2B758C
/* 006028 01DB1D28 00000000 */   nop
/* 00602C 01DB1D2C 08002526 */  addiu       $5, $17, 0x8
/* 006030 01DB1D30 28260072 */  paddub      $4, $16, $0
/* 006034 01DB1D34 0CD2760C */  jal         skipSpace__FPci
/* 006038 01DB1D38 00000000 */   nop
/* 00603C 01DB1D3C 288E4070 */  paddub      $17, $2, $0
/* 006040 01DB1D40 28260072 */  paddub      $4, $16, $0
/* 006044 01DB1D44 282E2072 */  paddub      $5, $17, $0
/* 006048 01DB1D48 DD01023C */  lui         $2, %hi(TEIGI_EDIT_FOG)
/* 00604C 01DB1D4C 005E4624 */  addiu       $6, $2, %lo(TEIGI_EDIT_FOG)
/* 006050 01DB1D50 50D2760C */  jal         checkArg__FPciPi
/* 006054 01DB1D54 00000000 */   nop
/* 006058 01DB1D58 288E4070 */  paddub      $17, $2, $0
/* 00605C 01DB1D5C FFFF0224 */  addiu       $2, $0, -0x1
/* 006060 01DB1D60 02002212 */  beq         $17, $2, .L01DB1D6C_2B756C
/* 006064 01DB1D64 00000000 */   nop
/* 006068 01DB1D68 01001224 */  addiu       $18, $0, 0x1
.L01DB1D6C_2B756C:
/* 00606C 01DB1D6C 28260072 */  paddub      $4, $16, $0
/* 006070 01DB1D70 282E2072 */  paddub      $5, $17, $0
/* 006074 01DB1D74 0CD2760C */  jal         skipSpace__FPci
/* 006078 01DB1D78 00000000 */   nop
/* 00607C 01DB1D7C 288E4070 */  paddub      $17, $2, $0
/* 006080 01DB1D80 A098828F */  lw          $2, -0x6760($28)
/* 006084 01DB1D84 01004224 */  addiu       $2, $2, 0x1
/* 006088 01DB1D88 A09882AF */  sw          $2, -0x6760($28)
.L01DB1D8C_2B758C:
/* 00608C 01DB1D8C 21201102 */  addu        $4, $16, $17
/* 006090 01DB1D90 DE01023C */  lui         $2, %hi(LIT_638__4)
/* 006094 01DB1D94 C8D84524 */  addiu       $5, $2, %lo(LIT_638__4)
/* 006098 01DB1D98 09000624 */  addiu       $6, $0, 0x9
/* 00609C 01DB1D9C C60C040C */  jal         memcmp
/* 0060A0 01DB1DA0 00000000 */   nop
/* 0060A4 01DB1DA4 19004014 */  bnez        $2, .L01DB1E0C_2B760C
/* 0060A8 01DB1DA8 00000000 */   nop
/* 0060AC 01DB1DAC 09002526 */  addiu       $5, $17, 0x9
/* 0060B0 01DB1DB0 28260072 */  paddub      $4, $16, $0
/* 0060B4 01DB1DB4 0CD2760C */  jal         skipSpace__FPci
/* 0060B8 01DB1DB8 00000000 */   nop
/* 0060BC 01DB1DBC 288E4070 */  paddub      $17, $2, $0
/* 0060C0 01DB1DC0 28260072 */  paddub      $4, $16, $0
/* 0060C4 01DB1DC4 282E2072 */  paddub      $5, $17, $0
/* 0060C8 01DB1DC8 DD01023C */  lui         $2, %hi(TEIGI_WATER_SET)
/* 0060CC 01DB1DCC 305E4624 */  addiu       $6, $2, %lo(TEIGI_WATER_SET)
/* 0060D0 01DB1DD0 50D2760C */  jal         checkArg__FPciPi
/* 0060D4 01DB1DD4 00000000 */   nop
/* 0060D8 01DB1DD8 288E4070 */  paddub      $17, $2, $0
/* 0060DC 01DB1DDC FFFF0224 */  addiu       $2, $0, -0x1
/* 0060E0 01DB1DE0 02002212 */  beq         $17, $2, .L01DB1DEC_2B75EC
/* 0060E4 01DB1DE4 00000000 */   nop
/* 0060E8 01DB1DE8 01001224 */  addiu       $18, $0, 0x1
.L01DB1DEC_2B75EC:
/* 0060EC 01DB1DEC 28260072 */  paddub      $4, $16, $0
/* 0060F0 01DB1DF0 282E2072 */  paddub      $5, $17, $0
/* 0060F4 01DB1DF4 0CD2760C */  jal         skipSpace__FPci
/* 0060F8 01DB1DF8 00000000 */   nop
/* 0060FC 01DB1DFC 288E4070 */  paddub      $17, $2, $0
/* 006100 01DB1E00 A098828F */  lw          $2, -0x6760($28)
/* 006104 01DB1E04 01004224 */  addiu       $2, $2, 0x1
/* 006108 01DB1E08 A09882AF */  sw          $2, -0x6760($28)
.L01DB1E0C_2B760C:
/* 00610C 01DB1E0C 21201102 */  addu        $4, $16, $17
/* 006110 01DB1E10 DE01023C */  lui         $2, %hi(LIT_639__5)
/* 006114 01DB1E14 D8D84524 */  addiu       $5, $2, %lo(LIT_639__5)
/* 006118 01DB1E18 09000624 */  addiu       $6, $0, 0x9
/* 00611C 01DB1E1C C60C040C */  jal         memcmp
/* 006120 01DB1E20 00000000 */   nop
/* 006124 01DB1E24 19004014 */  bnez        $2, .L01DB1E8C_2B768C
/* 006128 01DB1E28 00000000 */   nop
/* 00612C 01DB1E2C 09002526 */  addiu       $5, $17, 0x9
/* 006130 01DB1E30 28260072 */  paddub      $4, $16, $0
/* 006134 01DB1E34 0CD2760C */  jal         skipSpace__FPci
/* 006138 01DB1E38 00000000 */   nop
/* 00613C 01DB1E3C 288E4070 */  paddub      $17, $2, $0
/* 006140 01DB1E40 28260072 */  paddub      $4, $16, $0
/* 006144 01DB1E44 282E2072 */  paddub      $5, $17, $0
/* 006148 01DB1E48 DD01023C */  lui         $2, %hi(TEIGI_WATER_RGB)
/* 00614C 01DB1E4C 505E4624 */  addiu       $6, $2, %lo(TEIGI_WATER_RGB)
/* 006150 01DB1E50 50D2760C */  jal         checkArg__FPciPi
/* 006154 01DB1E54 00000000 */   nop
/* 006158 01DB1E58 288E4070 */  paddub      $17, $2, $0
/* 00615C 01DB1E5C FFFF0224 */  addiu       $2, $0, -0x1
/* 006160 01DB1E60 02002212 */  beq         $17, $2, .L01DB1E6C_2B766C
/* 006164 01DB1E64 00000000 */   nop
/* 006168 01DB1E68 01001224 */  addiu       $18, $0, 0x1
.L01DB1E6C_2B766C:
/* 00616C 01DB1E6C 28260072 */  paddub      $4, $16, $0
/* 006170 01DB1E70 282E2072 */  paddub      $5, $17, $0
/* 006174 01DB1E74 0CD2760C */  jal         skipSpace__FPci
/* 006178 01DB1E78 00000000 */   nop
/* 00617C 01DB1E7C 288E4070 */  paddub      $17, $2, $0
/* 006180 01DB1E80 A098828F */  lw          $2, -0x6760($28)
/* 006184 01DB1E84 01004224 */  addiu       $2, $2, 0x1
/* 006188 01DB1E88 A09882AF */  sw          $2, -0x6760($28)
.L01DB1E8C_2B768C:
/* 00618C 01DB1E8C 21201102 */  addu        $4, $16, $17
/* 006190 01DB1E90 DE01023C */  lui         $2, %hi(LIT_640__4)
/* 006194 01DB1E94 E8D84524 */  addiu       $5, $2, %lo(LIT_640__4)
/* 006198 01DB1E98 0B000624 */  addiu       $6, $0, 0xB
/* 00619C 01DB1E9C C60C040C */  jal         memcmp
/* 0061A0 01DB1EA0 00000000 */   nop
/* 0061A4 01DB1EA4 19004014 */  bnez        $2, .L01DB1F0C_2B770C
/* 0061A8 01DB1EA8 00000000 */   nop
/* 0061AC 01DB1EAC 0B002526 */  addiu       $5, $17, 0xB
/* 0061B0 01DB1EB0 28260072 */  paddub      $4, $16, $0
/* 0061B4 01DB1EB4 0CD2760C */  jal         skipSpace__FPci
/* 0061B8 01DB1EB8 00000000 */   nop
/* 0061BC 01DB1EBC 288E4070 */  paddub      $17, $2, $0
/* 0061C0 01DB1EC0 28260072 */  paddub      $4, $16, $0
/* 0061C4 01DB1EC4 282E2072 */  paddub      $5, $17, $0
/* 0061C8 01DB1EC8 DD01023C */  lui         $2, %hi(TEIGI_WATER_PARAM)
/* 0061CC 01DB1ECC 705E4624 */  addiu       $6, $2, %lo(TEIGI_WATER_PARAM)
/* 0061D0 01DB1ED0 50D2760C */  jal         checkArg__FPciPi
/* 0061D4 01DB1ED4 00000000 */   nop
/* 0061D8 01DB1ED8 288E4070 */  paddub      $17, $2, $0
/* 0061DC 01DB1EDC FFFF0224 */  addiu       $2, $0, -0x1
/* 0061E0 01DB1EE0 02002212 */  beq         $17, $2, .L01DB1EEC_2B76EC
/* 0061E4 01DB1EE4 00000000 */   nop
/* 0061E8 01DB1EE8 01001224 */  addiu       $18, $0, 0x1
.L01DB1EEC_2B76EC:
/* 0061EC 01DB1EEC 28260072 */  paddub      $4, $16, $0
/* 0061F0 01DB1EF0 282E2072 */  paddub      $5, $17, $0
/* 0061F4 01DB1EF4 0CD2760C */  jal         skipSpace__FPci
/* 0061F8 01DB1EF8 00000000 */   nop
/* 0061FC 01DB1EFC 288E4070 */  paddub      $17, $2, $0
/* 006200 01DB1F00 A098828F */  lw          $2, -0x6760($28)
/* 006204 01DB1F04 01004224 */  addiu       $2, $2, 0x1
/* 006208 01DB1F08 A09882AF */  sw          $2, -0x6760($28)
.L01DB1F0C_2B770C:
/* 00620C 01DB1F0C 21201102 */  addu        $4, $16, $17
/* 006210 01DB1F10 DE01023C */  lui         $2, %hi(LIT_641__4)
/* 006214 01DB1F14 F8D84524 */  addiu       $5, $2, %lo(LIT_641__4)
/* 006218 01DB1F18 09000624 */  addiu       $6, $0, 0x9
/* 00621C 01DB1F1C C60C040C */  jal         memcmp
/* 006220 01DB1F20 00000000 */   nop
/* 006224 01DB1F24 19004014 */  bnez        $2, .L01DB1F8C_2B778C
/* 006228 01DB1F28 00000000 */   nop
/* 00622C 01DB1F2C 09002526 */  addiu       $5, $17, 0x9
/* 006230 01DB1F30 28260072 */  paddub      $4, $16, $0
/* 006234 01DB1F34 0CD2760C */  jal         skipSpace__FPci
/* 006238 01DB1F38 00000000 */   nop
/* 00623C 01DB1F3C 288E4070 */  paddub      $17, $2, $0
/* 006240 01DB1F40 28260072 */  paddub      $4, $16, $0
/* 006244 01DB1F44 282E2072 */  paddub      $5, $17, $0
/* 006248 01DB1F48 DD01023C */  lui         $2, %hi(TEIGI_LEVEL_FAR)
/* 00624C 01DB1F4C A05E4624 */  addiu       $6, $2, %lo(TEIGI_LEVEL_FAR)
/* 006250 01DB1F50 50D2760C */  jal         checkArg__FPciPi
/* 006254 01DB1F54 00000000 */   nop
/* 006258 01DB1F58 288E4070 */  paddub      $17, $2, $0
/* 00625C 01DB1F5C FFFF0224 */  addiu       $2, $0, -0x1
/* 006260 01DB1F60 02002212 */  beq         $17, $2, .L01DB1F6C_2B776C
/* 006264 01DB1F64 00000000 */   nop
/* 006268 01DB1F68 01001224 */  addiu       $18, $0, 0x1
.L01DB1F6C_2B776C:
/* 00626C 01DB1F6C 28260072 */  paddub      $4, $16, $0
/* 006270 01DB1F70 282E2072 */  paddub      $5, $17, $0
/* 006274 01DB1F74 0CD2760C */  jal         skipSpace__FPci
/* 006278 01DB1F78 00000000 */   nop
/* 00627C 01DB1F7C 288E4070 */  paddub      $17, $2, $0
/* 006280 01DB1F80 A098828F */  lw          $2, -0x6760($28)
/* 006284 01DB1F84 01004224 */  addiu       $2, $2, 0x1
/* 006288 01DB1F88 A09882AF */  sw          $2, -0x6760($28)
.L01DB1F8C_2B778C:
/* 00628C 01DB1F8C 21201102 */  addu        $4, $16, $17
/* 006290 01DB1F90 DE01023C */  lui         $2, %hi(LIT_642__4)
/* 006294 01DB1F94 08D94524 */  addiu       $5, $2, %lo(LIT_642__4)
/* 006298 01DB1F98 09000624 */  addiu       $6, $0, 0x9
/* 00629C 01DB1F9C C60C040C */  jal         memcmp
/* 0062A0 01DB1FA0 00000000 */   nop
/* 0062A4 01DB1FA4 19004014 */  bnez        $2, .L01DB200C_2B780C
/* 0062A8 01DB1FA8 00000000 */   nop
/* 0062AC 01DB1FAC 09002526 */  addiu       $5, $17, 0x9
/* 0062B0 01DB1FB0 28260072 */  paddub      $4, $16, $0
/* 0062B4 01DB1FB4 0CD2760C */  jal         skipSpace__FPci
/* 0062B8 01DB1FB8 00000000 */   nop
/* 0062BC 01DB1FBC 288E4070 */  paddub      $17, $2, $0
/* 0062C0 01DB1FC0 28260072 */  paddub      $4, $16, $0
/* 0062C4 01DB1FC4 282E2072 */  paddub      $5, $17, $0
/* 0062C8 01DB1FC8 DD01023C */  lui         $2, %hi(TEIGI_DebugFlag)
/* 0062CC 01DB1FCC B85E4624 */  addiu       $6, $2, %lo(TEIGI_DebugFlag)
/* 0062D0 01DB1FD0 50D2760C */  jal         checkArg__FPciPi
/* 0062D4 01DB1FD4 00000000 */   nop
/* 0062D8 01DB1FD8 288E4070 */  paddub      $17, $2, $0
/* 0062DC 01DB1FDC FFFF0224 */  addiu       $2, $0, -0x1
/* 0062E0 01DB1FE0 02002212 */  beq         $17, $2, .L01DB1FEC_2B77EC
/* 0062E4 01DB1FE4 00000000 */   nop
/* 0062E8 01DB1FE8 01001224 */  addiu       $18, $0, 0x1
.L01DB1FEC_2B77EC:
/* 0062EC 01DB1FEC 28260072 */  paddub      $4, $16, $0
/* 0062F0 01DB1FF0 282E2072 */  paddub      $5, $17, $0
/* 0062F4 01DB1FF4 0CD2760C */  jal         skipSpace__FPci
/* 0062F8 01DB1FF8 00000000 */   nop
/* 0062FC 01DB1FFC 288E4070 */  paddub      $17, $2, $0
/* 006300 01DB2000 A098828F */  lw          $2, -0x6760($28)
/* 006304 01DB2004 01004224 */  addiu       $2, $2, 0x1
/* 006308 01DB2008 A09882AF */  sw          $2, -0x6760($28)
.L01DB200C_2B780C:
/* 00630C 01DB200C 21201102 */  addu        $4, $16, $17
/* 006310 01DB2010 DE01023C */  lui         $2, %hi(LIT_643__4)
/* 006314 01DB2014 18D94524 */  addiu       $5, $2, %lo(LIT_643__4)
/* 006318 01DB2018 0A000624 */  addiu       $6, $0, 0xA
/* 00631C 01DB201C C60C040C */  jal         memcmp
/* 006320 01DB2020 00000000 */   nop
/* 006324 01DB2024 19004014 */  bnez        $2, .L01DB208C_2B788C
/* 006328 01DB2028 00000000 */   nop
/* 00632C 01DB202C 0A002526 */  addiu       $5, $17, 0xA
/* 006330 01DB2030 28260072 */  paddub      $4, $16, $0
/* 006334 01DB2034 0CD2760C */  jal         skipSpace__FPci
/* 006338 01DB2038 00000000 */   nop
/* 00633C 01DB203C 288E4070 */  paddub      $17, $2, $0
/* 006340 01DB2040 28260072 */  paddub      $4, $16, $0
/* 006344 01DB2044 282E2072 */  paddub      $5, $17, $0
/* 006348 01DB2048 DD01023C */  lui         $2, %hi(TEIGI_AnimeSpeed)
/* 00634C 01DB204C D05E4624 */  addiu       $6, $2, %lo(TEIGI_AnimeSpeed)
/* 006350 01DB2050 50D2760C */  jal         checkArg__FPciPi
/* 006354 01DB2054 00000000 */   nop
/* 006358 01DB2058 288E4070 */  paddub      $17, $2, $0
/* 00635C 01DB205C FFFF0224 */  addiu       $2, $0, -0x1
/* 006360 01DB2060 02002212 */  beq         $17, $2, .L01DB206C_2B786C
/* 006364 01DB2064 00000000 */   nop
/* 006368 01DB2068 01001224 */  addiu       $18, $0, 0x1
.L01DB206C_2B786C:
/* 00636C 01DB206C 28260072 */  paddub      $4, $16, $0
/* 006370 01DB2070 282E2072 */  paddub      $5, $17, $0
/* 006374 01DB2074 0CD2760C */  jal         skipSpace__FPci
/* 006378 01DB2078 00000000 */   nop
/* 00637C 01DB207C 288E4070 */  paddub      $17, $2, $0
/* 006380 01DB2080 A098828F */  lw          $2, -0x6760($28)
/* 006384 01DB2084 01004224 */  addiu       $2, $2, 0x1
/* 006388 01DB2088 A09882AF */  sw          $2, -0x6760($28)
.L01DB208C_2B788C:
/* 00638C 01DB208C 21201102 */  addu        $4, $16, $17
/* 006390 01DB2090 DE01023C */  lui         $2, %hi(LIT_644__3)
/* 006394 01DB2094 28D94524 */  addiu       $5, $2, %lo(LIT_644__3)
/* 006398 01DB2098 04000624 */  addiu       $6, $0, 0x4
/* 00639C 01DB209C C60C040C */  jal         memcmp
/* 0063A0 01DB20A0 00000000 */   nop
/* 0063A4 01DB20A4 19004014 */  bnez        $2, .L01DB210C_2B790C
/* 0063A8 01DB20A8 00000000 */   nop
/* 0063AC 01DB20AC 04002526 */  addiu       $5, $17, 0x4
/* 0063B0 01DB20B0 28260072 */  paddub      $4, $16, $0
/* 0063B4 01DB20B4 0CD2760C */  jal         skipSpace__FPci
/* 0063B8 01DB20B8 00000000 */   nop
/* 0063BC 01DB20BC 288E4070 */  paddub      $17, $2, $0
/* 0063C0 01DB20C0 28260072 */  paddub      $4, $16, $0
/* 0063C4 01DB20C4 282E2072 */  paddub      $5, $17, $0
/* 0063C8 01DB20C8 DD01023C */  lui         $2, %hi(TEIGI_UPER)
/* 0063CC 01DB20CC E05E4624 */  addiu       $6, $2, %lo(TEIGI_UPER)
/* 0063D0 01DB20D0 50D2760C */  jal         checkArg__FPciPi
/* 0063D4 01DB20D4 00000000 */   nop
/* 0063D8 01DB20D8 288E4070 */  paddub      $17, $2, $0
/* 0063DC 01DB20DC FFFF0224 */  addiu       $2, $0, -0x1
/* 0063E0 01DB20E0 02002212 */  beq         $17, $2, .L01DB20EC_2B78EC
/* 0063E4 01DB20E4 00000000 */   nop
/* 0063E8 01DB20E8 01001224 */  addiu       $18, $0, 0x1
.L01DB20EC_2B78EC:
/* 0063EC 01DB20EC 28260072 */  paddub      $4, $16, $0
/* 0063F0 01DB20F0 282E2072 */  paddub      $5, $17, $0
/* 0063F4 01DB20F4 0CD2760C */  jal         skipSpace__FPci
/* 0063F8 01DB20F8 00000000 */   nop
/* 0063FC 01DB20FC 288E4070 */  paddub      $17, $2, $0
/* 006400 01DB2100 A098828F */  lw          $2, -0x6760($28)
/* 006404 01DB2104 01004224 */  addiu       $2, $2, 0x1
/* 006408 01DB2108 A09882AF */  sw          $2, -0x6760($28)
.L01DB210C_2B790C:
/* 00640C 01DB210C 21201102 */  addu        $4, $16, $17
/* 006410 01DB2110 DE01023C */  lui         $2, %hi(LIT_645__3)
/* 006414 01DB2114 30D94524 */  addiu       $5, $2, %lo(LIT_645__3)
/* 006418 01DB2118 07000624 */  addiu       $6, $0, 0x7
/* 00641C 01DB211C C60C040C */  jal         memcmp
/* 006420 01DB2120 00000000 */   nop
/* 006424 01DB2124 19004014 */  bnez        $2, .L01DB218C_2B798C
/* 006428 01DB2128 00000000 */   nop
/* 00642C 01DB212C 07002526 */  addiu       $5, $17, 0x7
/* 006430 01DB2130 28260072 */  paddub      $4, $16, $0
/* 006434 01DB2134 0CD2760C */  jal         skipSpace__FPci
/* 006438 01DB2138 00000000 */   nop
/* 00643C 01DB213C 288E4070 */  paddub      $17, $2, $0
/* 006440 01DB2140 28260072 */  paddub      $4, $16, $0
/* 006444 01DB2144 282E2072 */  paddub      $5, $17, $0
/* 006448 01DB2148 DD01023C */  lui         $2, %hi(TEIGI_UPR_IMG)
/* 00644C 01DB214C 105F4624 */  addiu       $6, $2, %lo(TEIGI_UPR_IMG)
/* 006450 01DB2150 50D2760C */  jal         checkArg__FPciPi
/* 006454 01DB2154 00000000 */   nop
/* 006458 01DB2158 288E4070 */  paddub      $17, $2, $0
/* 00645C 01DB215C FFFF0224 */  addiu       $2, $0, -0x1
/* 006460 01DB2160 02002212 */  beq         $17, $2, .L01DB216C_2B796C
/* 006464 01DB2164 00000000 */   nop
/* 006468 01DB2168 01001224 */  addiu       $18, $0, 0x1
.L01DB216C_2B796C:
/* 00646C 01DB216C 28260072 */  paddub      $4, $16, $0
/* 006470 01DB2170 282E2072 */  paddub      $5, $17, $0
/* 006474 01DB2174 0CD2760C */  jal         skipSpace__FPci
/* 006478 01DB2178 00000000 */   nop
/* 00647C 01DB217C 288E4070 */  paddub      $17, $2, $0
/* 006480 01DB2180 A098828F */  lw          $2, -0x6760($28)
/* 006484 01DB2184 01004224 */  addiu       $2, $2, 0x1
/* 006488 01DB2188 A09882AF */  sw          $2, -0x6760($28)
.L01DB218C_2B798C:
/* 00648C 01DB218C 21201102 */  addu        $4, $16, $17
/* 006490 01DB2190 DE01023C */  lui         $2, %hi(LIT_646__5)
/* 006494 01DB2194 38D94524 */  addiu       $5, $2, %lo(LIT_646__5)
/* 006498 01DB2198 06000624 */  addiu       $6, $0, 0x6
/* 00649C 01DB219C C60C040C */  jal         memcmp
/* 0064A0 01DB21A0 00000000 */   nop
/* 0064A4 01DB21A4 19004014 */  bnez        $2, .L01DB220C_2B7A0C
/* 0064A8 01DB21A8 00000000 */   nop
/* 0064AC 01DB21AC 06002526 */  addiu       $5, $17, 0x6
/* 0064B0 01DB21B0 28260072 */  paddub      $4, $16, $0
/* 0064B4 01DB21B4 0CD2760C */  jal         skipSpace__FPci
/* 0064B8 01DB21B8 00000000 */   nop
/* 0064BC 01DB21BC 288E4070 */  paddub      $17, $2, $0
/* 0064C0 01DB21C0 28260072 */  paddub      $4, $16, $0
/* 0064C4 01DB21C4 282E2072 */  paddub      $5, $17, $0
/* 0064C8 01DB21C8 DD01023C */  lui         $2, %hi(TEIGI_PLIGHT)
/* 0064CC 01DB21CC 205F4624 */  addiu       $6, $2, %lo(TEIGI_PLIGHT)
/* 0064D0 01DB21D0 50D2760C */  jal         checkArg__FPciPi
/* 0064D4 01DB21D4 00000000 */   nop
/* 0064D8 01DB21D8 288E4070 */  paddub      $17, $2, $0
/* 0064DC 01DB21DC FFFF0224 */  addiu       $2, $0, -0x1
/* 0064E0 01DB21E0 02002212 */  beq         $17, $2, .L01DB21EC_2B79EC
/* 0064E4 01DB21E4 00000000 */   nop
/* 0064E8 01DB21E8 01001224 */  addiu       $18, $0, 0x1
.L01DB21EC_2B79EC:
/* 0064EC 01DB21EC 28260072 */  paddub      $4, $16, $0
/* 0064F0 01DB21F0 282E2072 */  paddub      $5, $17, $0
/* 0064F4 01DB21F4 0CD2760C */  jal         skipSpace__FPci
/* 0064F8 01DB21F8 00000000 */   nop
/* 0064FC 01DB21FC 288E4070 */  paddub      $17, $2, $0
/* 006500 01DB2200 A098828F */  lw          $2, -0x6760($28)
/* 006504 01DB2204 01004224 */  addiu       $2, $2, 0x1
/* 006508 01DB2208 A09882AF */  sw          $2, -0x6760($28)
.L01DB220C_2B7A0C:
/* 00650C 01DB220C 21201102 */  addu        $4, $16, $17
/* 006510 01DB2210 DE01023C */  lui         $2, %hi(LIT_647__3)
/* 006514 01DB2214 40D94524 */  addiu       $5, $2, %lo(LIT_647__3)
/* 006518 01DB2218 07000624 */  addiu       $6, $0, 0x7
/* 00651C 01DB221C C60C040C */  jal         memcmp
/* 006520 01DB2220 00000000 */   nop
/* 006524 01DB2224 19004014 */  bnez        $2, .L01DB228C_2B7A8C
/* 006528 01DB2228 00000000 */   nop
/* 00652C 01DB222C 07002526 */  addiu       $5, $17, 0x7
/* 006530 01DB2230 28260072 */  paddub      $4, $16, $0
/* 006534 01DB2234 0CD2760C */  jal         skipSpace__FPci
/* 006538 01DB2238 00000000 */   nop
/* 00653C 01DB223C 288E4070 */  paddub      $17, $2, $0
/* 006540 01DB2240 28260072 */  paddub      $4, $16, $0
/* 006544 01DB2244 282E2072 */  paddub      $5, $17, $0
/* 006548 01DB2248 DD01023C */  lui         $2, %hi(TEIGI_ADD_CRD)
/* 00654C 01DB224C 505F4624 */  addiu       $6, $2, %lo(TEIGI_ADD_CRD)
/* 006550 01DB2250 50D2760C */  jal         checkArg__FPciPi
/* 006554 01DB2254 00000000 */   nop
/* 006558 01DB2258 288E4070 */  paddub      $17, $2, $0
/* 00655C 01DB225C FFFF0224 */  addiu       $2, $0, -0x1
/* 006560 01DB2260 02002212 */  beq         $17, $2, .L01DB226C_2B7A6C
/* 006564 01DB2264 00000000 */   nop
/* 006568 01DB2268 01001224 */  addiu       $18, $0, 0x1
.L01DB226C_2B7A6C:
/* 00656C 01DB226C 28260072 */  paddub      $4, $16, $0
/* 006570 01DB2270 282E2072 */  paddub      $5, $17, $0
/* 006574 01DB2274 0CD2760C */  jal         skipSpace__FPci
/* 006578 01DB2278 00000000 */   nop
/* 00657C 01DB227C 288E4070 */  paddub      $17, $2, $0
/* 006580 01DB2280 A098828F */  lw          $2, -0x6760($28)
/* 006584 01DB2284 01004224 */  addiu       $2, $2, 0x1
/* 006588 01DB2288 A09882AF */  sw          $2, -0x6760($28)
.L01DB228C_2B7A8C:
/* 00658C 01DB228C 21201102 */  addu        $4, $16, $17
/* 006590 01DB2290 DE01023C */  lui         $2, %hi(LIT_648__3)
/* 006594 01DB2294 48D94524 */  addiu       $5, $2, %lo(LIT_648__3)
/* 006598 01DB2298 08000624 */  addiu       $6, $0, 0x8
/* 00659C 01DB229C C60C040C */  jal         memcmp
/* 0065A0 01DB22A0 00000000 */   nop
/* 0065A4 01DB22A4 12004014 */  bnez        $2, .L01DB22F0_2B7AF0
/* 0065A8 01DB22A8 00000000 */   nop
/* 0065AC 01DB22AC 08002526 */  addiu       $5, $17, 0x8
/* 0065B0 01DB22B0 28260072 */  paddub      $4, $16, $0
/* 0065B4 01DB22B4 0CD2760C */  jal         skipSpace__FPci
/* 0065B8 01DB22B8 00000000 */   nop
/* 0065BC 01DB22BC 288E4070 */  paddub      $17, $2, $0
/* 0065C0 01DB22C0 408A80C7 */  lwc1        $f0, -0x75C0($28)
/* 0065C4 01DB22C4 20008046 */  cvt.s.w     $f0, $f0
/* 0065C8 01DB22C8 A098828F */  lw          $2, -0x6760($28)
/* 0065CC 01DB22CC 001A0200 */  sll         $3, $2, 8
/* 0065D0 01DB22D0 E101023C */  lui         $2, %hi(argValBuff)
/* 0065D4 01DB22D4 40244224 */  addiu       $2, $2, %lo(argValBuff)
/* 0065D8 01DB22D8 21104300 */  addu        $2, $2, $3
/* 0065DC 01DB22DC 000040E4 */  swc1        $f0, 0x0($2)
/* 0065E0 01DB22E0 01001224 */  addiu       $18, $0, 0x1
/* 0065E4 01DB22E4 A098828F */  lw          $2, -0x6760($28)
/* 0065E8 01DB22E8 01004224 */  addiu       $2, $2, 0x1
/* 0065EC 01DB22EC A09882AF */  sw          $2, -0x6760($28)
.L01DB22F0_2B7AF0:
/* 0065F0 01DB22F0 21201102 */  addu        $4, $16, $17
/* 0065F4 01DB22F4 DE01023C */  lui         $2, %hi(LIT_649__3)
/* 0065F8 01DB22F8 58D94524 */  addiu       $5, $2, %lo(LIT_649__3)
/* 0065FC 01DB22FC 08000624 */  addiu       $6, $0, 0x8
/* 006600 01DB2300 C60C040C */  jal         memcmp
/* 006604 01DB2304 00000000 */   nop
/* 006608 01DB2308 12004014 */  bnez        $2, .L01DB2354_2B7B54
/* 00660C 01DB230C 00000000 */   nop
/* 006610 01DB2310 08002526 */  addiu       $5, $17, 0x8
/* 006614 01DB2314 28260072 */  paddub      $4, $16, $0
/* 006618 01DB2318 0CD2760C */  jal         skipSpace__FPci
/* 00661C 01DB231C 00000000 */   nop
/* 006620 01DB2320 288E4070 */  paddub      $17, $2, $0
/* 006624 01DB2324 488A80C7 */  lwc1        $f0, -0x75B8($28)
/* 006628 01DB2328 20008046 */  cvt.s.w     $f0, $f0
/* 00662C 01DB232C A098828F */  lw          $2, -0x6760($28)
/* 006630 01DB2330 001A0200 */  sll         $3, $2, 8
/* 006634 01DB2334 E101023C */  lui         $2, %hi(argValBuff)
/* 006638 01DB2338 40244224 */  addiu       $2, $2, %lo(argValBuff)
/* 00663C 01DB233C 21104300 */  addu        $2, $2, $3
/* 006640 01DB2340 000040E4 */  swc1        $f0, 0x0($2)
/* 006644 01DB2344 01001224 */  addiu       $18, $0, 0x1
/* 006648 01DB2348 A098828F */  lw          $2, -0x6760($28)
/* 00664C 01DB234C 01004224 */  addiu       $2, $2, 0x1
/* 006650 01DB2350 A09882AF */  sw          $2, -0x6760($28)
.L01DB2354_2B7B54:
/* 006654 01DB2354 21201102 */  addu        $4, $16, $17
/* 006658 01DB2358 DE01023C */  lui         $2, %hi(LIT_650__6)
/* 00665C 01DB235C 68D94524 */  addiu       $5, $2, %lo(LIT_650__6)
/* 006660 01DB2360 07000624 */  addiu       $6, $0, 0x7
/* 006664 01DB2364 C60C040C */  jal         memcmp
/* 006668 01DB2368 00000000 */   nop
/* 00666C 01DB236C 19004014 */  bnez        $2, .L01DB23D4_2B7BD4
/* 006670 01DB2370 00000000 */   nop
/* 006674 01DB2374 07002526 */  addiu       $5, $17, 0x7
/* 006678 01DB2378 28260072 */  paddub      $4, $16, $0
/* 00667C 01DB237C 0CD2760C */  jal         skipSpace__FPci
/* 006680 01DB2380 00000000 */   nop
/* 006684 01DB2384 288E4070 */  paddub      $17, $2, $0
/* 006688 01DB2388 28260072 */  paddub      $4, $16, $0
/* 00668C 01DB238C 282E2072 */  paddub      $5, $17, $0
/* 006690 01DB2390 DD01023C */  lui         $2, %hi(TEIGI_PT_BASE)
/* 006694 01DB2394 20604624 */  addiu       $6, $2, %lo(TEIGI_PT_BASE)
/* 006698 01DB2398 50D2760C */  jal         checkArg__FPciPi
/* 00669C 01DB239C 00000000 */   nop
/* 0066A0 01DB23A0 288E4070 */  paddub      $17, $2, $0
/* 0066A4 01DB23A4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0066A8 01DB23A8 02002212 */  beq         $17, $2, .L01DB23B4_2B7BB4
/* 0066AC 01DB23AC 00000000 */   nop
/* 0066B0 01DB23B0 01001224 */  addiu       $18, $0, 0x1
.L01DB23B4_2B7BB4:
/* 0066B4 01DB23B4 28260072 */  paddub      $4, $16, $0
/* 0066B8 01DB23B8 282E2072 */  paddub      $5, $17, $0
/* 0066BC 01DB23BC 0CD2760C */  jal         skipSpace__FPci
/* 0066C0 01DB23C0 00000000 */   nop
/* 0066C4 01DB23C4 288E4070 */  paddub      $17, $2, $0
/* 0066C8 01DB23C8 A098828F */  lw          $2, -0x6760($28)
/* 0066CC 01DB23CC 01004224 */  addiu       $2, $2, 0x1
/* 0066D0 01DB23D0 A09882AF */  sw          $2, -0x6760($28)
.L01DB23D4_2B7BD4:
/* 0066D4 01DB23D4 21201102 */  addu        $4, $16, $17
/* 0066D8 01DB23D8 DE01023C */  lui         $2, %hi(LIT_651__3)
/* 0066DC 01DB23DC 70D94524 */  addiu       $5, $2, %lo(LIT_651__3)
/* 0066E0 01DB23E0 04000624 */  addiu       $6, $0, 0x4
/* 0066E4 01DB23E4 C60C040C */  jal         memcmp
/* 0066E8 01DB23E8 00000000 */   nop
/* 0066EC 01DB23EC 19004014 */  bnez        $2, .L01DB2454_2B7C54
/* 0066F0 01DB23F0 00000000 */   nop
/* 0066F4 01DB23F4 04002526 */  addiu       $5, $17, 0x4
/* 0066F8 01DB23F8 28260072 */  paddub      $4, $16, $0
/* 0066FC 01DB23FC 0CD2760C */  jal         skipSpace__FPci
/* 006700 01DB2400 00000000 */   nop
/* 006704 01DB2404 288E4070 */  paddub      $17, $2, $0
/* 006708 01DB2408 28260072 */  paddub      $4, $16, $0
/* 00670C 01DB240C 282E2072 */  paddub      $5, $17, $0
/* 006710 01DB2410 DD01023C */  lui         $2, %hi(TEIGI_MAPD)
/* 006714 01DB2414 40604624 */  addiu       $6, $2, %lo(TEIGI_MAPD)
/* 006718 01DB2418 50D2760C */  jal         checkArg__FPciPi
/* 00671C 01DB241C 00000000 */   nop
/* 006720 01DB2420 288E4070 */  paddub      $17, $2, $0
/* 006724 01DB2424 FFFF0224 */  addiu       $2, $0, -0x1
/* 006728 01DB2428 02002212 */  beq         $17, $2, .L01DB2434_2B7C34
/* 00672C 01DB242C 00000000 */   nop
/* 006730 01DB2430 01001224 */  addiu       $18, $0, 0x1
.L01DB2434_2B7C34:
/* 006734 01DB2434 28260072 */  paddub      $4, $16, $0
/* 006738 01DB2438 282E2072 */  paddub      $5, $17, $0
/* 00673C 01DB243C 0CD2760C */  jal         skipSpace__FPci
/* 006740 01DB2440 00000000 */   nop
/* 006744 01DB2444 288E4070 */  paddub      $17, $2, $0
/* 006748 01DB2448 A098828F */  lw          $2, -0x6760($28)
/* 00674C 01DB244C 01004224 */  addiu       $2, $2, 0x1
/* 006750 01DB2450 A09882AF */  sw          $2, -0x6760($28)
.L01DB2454_2B7C54:
/* 006754 01DB2454 21201102 */  addu        $4, $16, $17
/* 006758 01DB2458 DE01023C */  lui         $2, %hi(LIT_652__2)
/* 00675C 01DB245C 78D94524 */  addiu       $5, $2, %lo(LIT_652__2)
/* 006760 01DB2460 07000624 */  addiu       $6, $0, 0x7
/* 006764 01DB2464 C60C040C */  jal         memcmp
/* 006768 01DB2468 00000000 */   nop
/* 00676C 01DB246C 19004014 */  bnez        $2, .L01DB24D4_2B7CD4
/* 006770 01DB2470 00000000 */   nop
/* 006774 01DB2474 07002526 */  addiu       $5, $17, 0x7
/* 006778 01DB2478 28260072 */  paddub      $4, $16, $0
/* 00677C 01DB247C 0CD2760C */  jal         skipSpace__FPci
/* 006780 01DB2480 00000000 */   nop
/* 006784 01DB2484 288E4070 */  paddub      $17, $2, $0
/* 006788 01DB2488 28260072 */  paddub      $4, $16, $0
/* 00678C 01DB248C 282E2072 */  paddub      $5, $17, $0
/* 006790 01DB2490 DD01023C */  lui         $2, %hi(TEIGI_PT_COLS)
/* 006794 01DB2494 30604624 */  addiu       $6, $2, %lo(TEIGI_PT_COLS)
/* 006798 01DB2498 50D2760C */  jal         checkArg__FPciPi
/* 00679C 01DB249C 00000000 */   nop
/* 0067A0 01DB24A0 288E4070 */  paddub      $17, $2, $0
/* 0067A4 01DB24A4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0067A8 01DB24A8 02002212 */  beq         $17, $2, .L01DB24B4_2B7CB4
/* 0067AC 01DB24AC 00000000 */   nop
/* 0067B0 01DB24B0 01001224 */  addiu       $18, $0, 0x1
.L01DB24B4_2B7CB4:
/* 0067B4 01DB24B4 28260072 */  paddub      $4, $16, $0
/* 0067B8 01DB24B8 282E2072 */  paddub      $5, $17, $0
/* 0067BC 01DB24BC 0CD2760C */  jal         skipSpace__FPci
/* 0067C0 01DB24C0 00000000 */   nop
/* 0067C4 01DB24C4 288E4070 */  paddub      $17, $2, $0
/* 0067C8 01DB24C8 A098828F */  lw          $2, -0x6760($28)
/* 0067CC 01DB24CC 01004224 */  addiu       $2, $2, 0x1
/* 0067D0 01DB24D0 A09882AF */  sw          $2, -0x6760($28)
.L01DB24D4_2B7CD4:
/* 0067D4 01DB24D4 21201102 */  addu        $4, $16, $17
/* 0067D8 01DB24D8 DE01023C */  lui         $2, %hi(LIT_653__4)
/* 0067DC 01DB24DC 80D94524 */  addiu       $5, $2, %lo(LIT_653__4)
/* 0067E0 01DB24E0 07000624 */  addiu       $6, $0, 0x7
/* 0067E4 01DB24E4 C60C040C */  jal         memcmp
/* 0067E8 01DB24E8 00000000 */   nop
/* 0067EC 01DB24EC 19004014 */  bnez        $2, .L01DB2554_2B7D54
/* 0067F0 01DB24F0 00000000 */   nop
/* 0067F4 01DB24F4 07002526 */  addiu       $5, $17, 0x7
/* 0067F8 01DB24F8 28260072 */  paddub      $4, $16, $0
/* 0067FC 01DB24FC 0CD2760C */  jal         skipSpace__FPci
/* 006800 01DB2500 00000000 */   nop
/* 006804 01DB2504 288E4070 */  paddub      $17, $2, $0
/* 006808 01DB2508 28260072 */  paddub      $4, $16, $0
/* 00680C 01DB250C 282E2072 */  paddub      $5, $17, $0
/* 006810 01DB2510 DD01023C */  lui         $2, %hi(TEIGI_PT_FIRE)
/* 006814 01DB2514 D0604624 */  addiu       $6, $2, %lo(TEIGI_PT_FIRE)
/* 006818 01DB2518 50D2760C */  jal         checkArg__FPciPi
/* 00681C 01DB251C 00000000 */   nop
/* 006820 01DB2520 288E4070 */  paddub      $17, $2, $0
/* 006824 01DB2524 FFFF0224 */  addiu       $2, $0, -0x1
/* 006828 01DB2528 02002212 */  beq         $17, $2, .L01DB2534_2B7D34
/* 00682C 01DB252C 00000000 */   nop
/* 006830 01DB2530 01001224 */  addiu       $18, $0, 0x1
.L01DB2534_2B7D34:
/* 006834 01DB2534 28260072 */  paddub      $4, $16, $0
/* 006838 01DB2538 282E2072 */  paddub      $5, $17, $0
/* 00683C 01DB253C 0CD2760C */  jal         skipSpace__FPci
/* 006840 01DB2540 00000000 */   nop
/* 006844 01DB2544 288E4070 */  paddub      $17, $2, $0
/* 006848 01DB2548 A098828F */  lw          $2, -0x6760($28)
/* 00684C 01DB254C 01004224 */  addiu       $2, $2, 0x1
/* 006850 01DB2550 A09882AF */  sw          $2, -0x6760($28)
.L01DB2554_2B7D54:
/* 006854 01DB2554 21201102 */  addu        $4, $16, $17
/* 006858 01DB2558 DE01023C */  lui         $2, %hi(LIT_654__4)
/* 00685C 01DB255C 88D94524 */  addiu       $5, $2, %lo(LIT_654__4)
/* 006860 01DB2560 08000624 */  addiu       $6, $0, 0x8
/* 006864 01DB2564 C60C040C */  jal         memcmp
/* 006868 01DB2568 00000000 */   nop
/* 00686C 01DB256C 19004014 */  bnez        $2, .L01DB25D4_2B7DD4
/* 006870 01DB2570 00000000 */   nop
/* 006874 01DB2574 08002526 */  addiu       $5, $17, 0x8
/* 006878 01DB2578 28260072 */  paddub      $4, $16, $0
/* 00687C 01DB257C 0CD2760C */  jal         skipSpace__FPci
/* 006880 01DB2580 00000000 */   nop
/* 006884 01DB2584 288E4070 */  paddub      $17, $2, $0
/* 006888 01DB2588 28260072 */  paddub      $4, $16, $0
/* 00688C 01DB258C 282E2072 */  paddub      $5, $17, $0
/* 006890 01DB2590 DD01023C */  lui         $2, %hi(TEIGI_PT_WATER)
/* 006894 01DB2594 F0604624 */  addiu       $6, $2, %lo(TEIGI_PT_WATER)
/* 006898 01DB2598 50D2760C */  jal         checkArg__FPciPi
/* 00689C 01DB259C 00000000 */   nop
/* 0068A0 01DB25A0 288E4070 */  paddub      $17, $2, $0
/* 0068A4 01DB25A4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0068A8 01DB25A8 02002212 */  beq         $17, $2, .L01DB25B4_2B7DB4
/* 0068AC 01DB25AC 00000000 */   nop
/* 0068B0 01DB25B0 01001224 */  addiu       $18, $0, 0x1
.L01DB25B4_2B7DB4:
/* 0068B4 01DB25B4 28260072 */  paddub      $4, $16, $0
/* 0068B8 01DB25B8 282E2072 */  paddub      $5, $17, $0
/* 0068BC 01DB25BC 0CD2760C */  jal         skipSpace__FPci
/* 0068C0 01DB25C0 00000000 */   nop
/* 0068C4 01DB25C4 288E4070 */  paddub      $17, $2, $0
/* 0068C8 01DB25C8 A098828F */  lw          $2, -0x6760($28)
/* 0068CC 01DB25CC 01004224 */  addiu       $2, $2, 0x1
/* 0068D0 01DB25D0 A09882AF */  sw          $2, -0x6760($28)
.L01DB25D4_2B7DD4:
/* 0068D4 01DB25D4 21201102 */  addu        $4, $16, $17
/* 0068D8 01DB25D8 DE01023C */  lui         $2, %hi(LIT_655__3)
/* 0068DC 01DB25DC 98D94524 */  addiu       $5, $2, %lo(LIT_655__3)
/* 0068E0 01DB25E0 08000624 */  addiu       $6, $0, 0x8
/* 0068E4 01DB25E4 C60C040C */  jal         memcmp
/* 0068E8 01DB25E8 00000000 */   nop
/* 0068EC 01DB25EC 19004014 */  bnez        $2, .L01DB2654_2B7E54
/* 0068F0 01DB25F0 00000000 */   nop
/* 0068F4 01DB25F4 08002526 */  addiu       $5, $17, 0x8
/* 0068F8 01DB25F8 28260072 */  paddub      $4, $16, $0
/* 0068FC 01DB25FC 0CD2760C */  jal         skipSpace__FPci
/* 006900 01DB2600 00000000 */   nop
/* 006904 01DB2604 288E4070 */  paddub      $17, $2, $0
/* 006908 01DB2608 28260072 */  paddub      $4, $16, $0
/* 00690C 01DB260C 282E2072 */  paddub      $5, $17, $0
/* 006910 01DB2610 DD01023C */  lui         $2, %hi(TEIGI_S_VOLUME)
/* 006914 01DB2614 805F4624 */  addiu       $6, $2, %lo(TEIGI_S_VOLUME)
/* 006918 01DB2618 50D2760C */  jal         checkArg__FPciPi
/* 00691C 01DB261C 00000000 */   nop
/* 006920 01DB2620 288E4070 */  paddub      $17, $2, $0
/* 006924 01DB2624 FFFF0224 */  addiu       $2, $0, -0x1
/* 006928 01DB2628 02002212 */  beq         $17, $2, .L01DB2634_2B7E34
/* 00692C 01DB262C 00000000 */   nop
/* 006930 01DB2630 01001224 */  addiu       $18, $0, 0x1
.L01DB2634_2B7E34:
/* 006934 01DB2634 28260072 */  paddub      $4, $16, $0
/* 006938 01DB2638 282E2072 */  paddub      $5, $17, $0
/* 00693C 01DB263C 0CD2760C */  jal         skipSpace__FPci
/* 006940 01DB2640 00000000 */   nop
/* 006944 01DB2644 288E4070 */  paddub      $17, $2, $0
/* 006948 01DB2648 A098828F */  lw          $2, -0x6760($28)
/* 00694C 01DB264C 01004224 */  addiu       $2, $2, 0x1
/* 006950 01DB2650 A09882AF */  sw          $2, -0x6760($28)
.L01DB2654_2B7E54:
/* 006954 01DB2654 21201102 */  addu        $4, $16, $17
/* 006958 01DB2658 DE01023C */  lui         $2, %hi(LIT_656__6)
/* 00695C 01DB265C A8D94524 */  addiu       $5, $2, %lo(LIT_656__6)
/* 006960 01DB2660 0A000624 */  addiu       $6, $0, 0xA
/* 006964 01DB2664 C60C040C */  jal         memcmp
/* 006968 01DB2668 00000000 */   nop
/* 00696C 01DB266C 19004014 */  bnez        $2, .L01DB26D4_2B7ED4
/* 006970 01DB2670 00000000 */   nop
/* 006974 01DB2674 0A002526 */  addiu       $5, $17, 0xA
/* 006978 01DB2678 28260072 */  paddub      $4, $16, $0
/* 00697C 01DB267C 0CD2760C */  jal         skipSpace__FPci
/* 006980 01DB2680 00000000 */   nop
/* 006984 01DB2684 288E4070 */  paddub      $17, $2, $0
/* 006988 01DB2688 28260072 */  paddub      $4, $16, $0
/* 00698C 01DB268C 282E2072 */  paddub      $5, $17, $0
/* 006990 01DB2690 DD01023C */  lui         $2, %hi(TEIGI_PROJECTION)
/* 006994 01DB2694 A85F4624 */  addiu       $6, $2, %lo(TEIGI_PROJECTION)
/* 006998 01DB2698 50D2760C */  jal         checkArg__FPciPi
/* 00699C 01DB269C 00000000 */   nop
/* 0069A0 01DB26A0 288E4070 */  paddub      $17, $2, $0
/* 0069A4 01DB26A4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0069A8 01DB26A8 02002212 */  beq         $17, $2, .L01DB26B4_2B7EB4
/* 0069AC 01DB26AC 00000000 */   nop
/* 0069B0 01DB26B0 01001224 */  addiu       $18, $0, 0x1
.L01DB26B4_2B7EB4:
/* 0069B4 01DB26B4 28260072 */  paddub      $4, $16, $0
/* 0069B8 01DB26B8 282E2072 */  paddub      $5, $17, $0
/* 0069BC 01DB26BC 0CD2760C */  jal         skipSpace__FPci
/* 0069C0 01DB26C0 00000000 */   nop
/* 0069C4 01DB26C4 288E4070 */  paddub      $17, $2, $0
/* 0069C8 01DB26C8 A098828F */  lw          $2, -0x6760($28)
/* 0069CC 01DB26CC 01004224 */  addiu       $2, $2, 0x1
/* 0069D0 01DB26D0 A09882AF */  sw          $2, -0x6760($28)
.L01DB26D4_2B7ED4:
/* 0069D4 01DB26D4 21201102 */  addu        $4, $16, $17
/* 0069D8 01DB26D8 DE01023C */  lui         $2, %hi(LIT_657__5)
/* 0069DC 01DB26DC B8D94524 */  addiu       $5, $2, %lo(LIT_657__5)
/* 0069E0 01DB26E0 07000624 */  addiu       $6, $0, 0x7
/* 0069E4 01DB26E4 C60C040C */  jal         memcmp
/* 0069E8 01DB26E8 00000000 */   nop
/* 0069EC 01DB26EC 19004014 */  bnez        $2, .L01DB2754_2B7F54
/* 0069F0 01DB26F0 00000000 */   nop
/* 0069F4 01DB26F4 07002526 */  addiu       $5, $17, 0x7
/* 0069F8 01DB26F8 28260072 */  paddub      $4, $16, $0
/* 0069FC 01DB26FC 0CD2760C */  jal         skipSpace__FPci
/* 006A00 01DB2700 00000000 */   nop
/* 006A04 01DB2704 288E4070 */  paddub      $17, $2, $0
/* 006A08 01DB2708 28260072 */  paddub      $4, $16, $0
/* 006A0C 01DB270C 282E2072 */  paddub      $5, $17, $0
/* 006A10 01DB2710 DD01023C */  lui         $2, %hi(TEIGI_OBJ_ROT)
/* 006A14 01DB2714 C05F4624 */  addiu       $6, $2, %lo(TEIGI_OBJ_ROT)
/* 006A18 01DB2718 50D2760C */  jal         checkArg__FPciPi
/* 006A1C 01DB271C 00000000 */   nop
/* 006A20 01DB2720 288E4070 */  paddub      $17, $2, $0
/* 006A24 01DB2724 FFFF0224 */  addiu       $2, $0, -0x1
/* 006A28 01DB2728 02002212 */  beq         $17, $2, .L01DB2734_2B7F34
/* 006A2C 01DB272C 00000000 */   nop
/* 006A30 01DB2730 01001224 */  addiu       $18, $0, 0x1
.L01DB2734_2B7F34:
/* 006A34 01DB2734 28260072 */  paddub      $4, $16, $0
/* 006A38 01DB2738 282E2072 */  paddub      $5, $17, $0
/* 006A3C 01DB273C 0CD2760C */  jal         skipSpace__FPci
/* 006A40 01DB2740 00000000 */   nop
/* 006A44 01DB2744 288E4070 */  paddub      $17, $2, $0
/* 006A48 01DB2748 A098828F */  lw          $2, -0x6760($28)
/* 006A4C 01DB274C 01004224 */  addiu       $2, $2, 0x1
/* 006A50 01DB2750 A09882AF */  sw          $2, -0x6760($28)
.L01DB2754_2B7F54:
/* 006A54 01DB2754 21201102 */  addu        $4, $16, $17
/* 006A58 01DB2758 DE01023C */  lui         $2, %hi(LIT_658__4)
/* 006A5C 01DB275C C0D94524 */  addiu       $5, $2, %lo(LIT_658__4)
/* 006A60 01DB2760 07000624 */  addiu       $6, $0, 0x7
/* 006A64 01DB2764 C60C040C */  jal         memcmp
/* 006A68 01DB2768 00000000 */   nop
/* 006A6C 01DB276C 19004014 */  bnez        $2, .L01DB27D4_2B7FD4
/* 006A70 01DB2770 00000000 */   nop
/* 006A74 01DB2774 07002526 */  addiu       $5, $17, 0x7
/* 006A78 01DB2778 28260072 */  paddub      $4, $16, $0
/* 006A7C 01DB277C 0CD2760C */  jal         skipSpace__FPci
/* 006A80 01DB2780 00000000 */   nop
/* 006A84 01DB2784 288E4070 */  paddub      $17, $2, $0
/* 006A88 01DB2788 28260072 */  paddub      $4, $16, $0
/* 006A8C 01DB278C 282E2072 */  paddub      $5, $17, $0
/* 006A90 01DB2790 DD01023C */  lui         $2, %hi(TEIGI_MAPINFO)
/* 006A94 01DB2794 10604624 */  addiu       $6, $2, %lo(TEIGI_MAPINFO)
/* 006A98 01DB2798 50D2760C */  jal         checkArg__FPciPi
/* 006A9C 01DB279C 00000000 */   nop
/* 006AA0 01DB27A0 288E4070 */  paddub      $17, $2, $0
/* 006AA4 01DB27A4 FFFF0224 */  addiu       $2, $0, -0x1
/* 006AA8 01DB27A8 02002212 */  beq         $17, $2, .L01DB27B4_2B7FB4
/* 006AAC 01DB27AC 00000000 */   nop
/* 006AB0 01DB27B0 01001224 */  addiu       $18, $0, 0x1
.L01DB27B4_2B7FB4:
/* 006AB4 01DB27B4 28260072 */  paddub      $4, $16, $0
/* 006AB8 01DB27B8 282E2072 */  paddub      $5, $17, $0
/* 006ABC 01DB27BC 0CD2760C */  jal         skipSpace__FPci
/* 006AC0 01DB27C0 00000000 */   nop
/* 006AC4 01DB27C4 288E4070 */  paddub      $17, $2, $0
/* 006AC8 01DB27C8 A098828F */  lw          $2, -0x6760($28)
/* 006ACC 01DB27CC 01004224 */  addiu       $2, $2, 0x1
/* 006AD0 01DB27D0 A09882AF */  sw          $2, -0x6760($28)
.L01DB27D4_2B7FD4:
/* 006AD4 01DB27D4 21201102 */  addu        $4, $16, $17
/* 006AD8 01DB27D8 DE01023C */  lui         $2, %hi(LIT_659__4)
/* 006ADC 01DB27DC C8D94524 */  addiu       $5, $2, %lo(LIT_659__4)
/* 006AE0 01DB27E0 08000624 */  addiu       $6, $0, 0x8
/* 006AE4 01DB27E4 C60C040C */  jal         memcmp
/* 006AE8 01DB27E8 00000000 */   nop
/* 006AEC 01DB27EC 19004014 */  bnez        $2, .L01DB2854_2B8054
/* 006AF0 01DB27F0 00000000 */   nop
/* 006AF4 01DB27F4 08002526 */  addiu       $5, $17, 0x8
/* 006AF8 01DB27F8 28260072 */  paddub      $4, $16, $0
/* 006AFC 01DB27FC 0CD2760C */  jal         skipSpace__FPci
/* 006B00 01DB2800 00000000 */   nop
/* 006B04 01DB2804 288E4070 */  paddub      $17, $2, $0
/* 006B08 01DB2808 28260072 */  paddub      $4, $16, $0
/* 006B0C 01DB280C 282E2072 */  paddub      $5, $17, $0
/* 006B10 01DB2810 DD01023C */  lui         $2, %hi(TEIGI_FIRE_IMG)
/* 006B14 01DB2814 705C4624 */  addiu       $6, $2, %lo(TEIGI_FIRE_IMG)
/* 006B18 01DB2818 50D2760C */  jal         checkArg__FPciPi
/* 006B1C 01DB281C 00000000 */   nop
/* 006B20 01DB2820 288E4070 */  paddub      $17, $2, $0
/* 006B24 01DB2824 FFFF0224 */  addiu       $2, $0, -0x1
/* 006B28 01DB2828 02002212 */  beq         $17, $2, .L01DB2834_2B8034
/* 006B2C 01DB282C 00000000 */   nop
/* 006B30 01DB2830 01001224 */  addiu       $18, $0, 0x1
.L01DB2834_2B8034:
/* 006B34 01DB2834 28260072 */  paddub      $4, $16, $0
/* 006B38 01DB2838 282E2072 */  paddub      $5, $17, $0
/* 006B3C 01DB283C 0CD2760C */  jal         skipSpace__FPci
/* 006B40 01DB2840 00000000 */   nop
/* 006B44 01DB2844 288E4070 */  paddub      $17, $2, $0
/* 006B48 01DB2848 A098828F */  lw          $2, -0x6760($28)
/* 006B4C 01DB284C 01004224 */  addiu       $2, $2, 0x1
/* 006B50 01DB2850 A09882AF */  sw          $2, -0x6760($28)
.L01DB2854_2B8054:
/* 006B54 01DB2854 21201102 */  addu        $4, $16, $17
/* 006B58 01DB2858 DE01023C */  lui         $2, %hi(LIT_660__3)
/* 006B5C 01DB285C D8D94524 */  addiu       $5, $2, %lo(LIT_660__3)
/* 006B60 01DB2860 04000624 */  addiu       $6, $0, 0x4
/* 006B64 01DB2864 C60C040C */  jal         memcmp
/* 006B68 01DB2868 00000000 */   nop
/* 006B6C 01DB286C 19004014 */  bnez        $2, .L01DB28D4_2B80D4
/* 006B70 01DB2870 00000000 */   nop
/* 006B74 01DB2874 04002526 */  addiu       $5, $17, 0x4
/* 006B78 01DB2878 28260072 */  paddub      $4, $16, $0
/* 006B7C 01DB287C 0CD2760C */  jal         skipSpace__FPci
/* 006B80 01DB2880 00000000 */   nop
/* 006B84 01DB2884 288E4070 */  paddub      $17, $2, $0
/* 006B88 01DB2888 28260072 */  paddub      $4, $16, $0
/* 006B8C 01DB288C 282E2072 */  paddub      $5, $17, $0
/* 006B90 01DB2890 DD01023C */  lui         $2, %hi(TEIGI_FIRE)
/* 006B94 01DB2894 F05F4624 */  addiu       $6, $2, %lo(TEIGI_FIRE)
/* 006B98 01DB2898 50D2760C */  jal         checkArg__FPciPi
/* 006B9C 01DB289C 00000000 */   nop
/* 006BA0 01DB28A0 288E4070 */  paddub      $17, $2, $0
/* 006BA4 01DB28A4 FFFF0224 */  addiu       $2, $0, -0x1
/* 006BA8 01DB28A8 02002212 */  beq         $17, $2, .L01DB28B4_2B80B4
/* 006BAC 01DB28AC 00000000 */   nop
/* 006BB0 01DB28B0 01001224 */  addiu       $18, $0, 0x1
.L01DB28B4_2B80B4:
/* 006BB4 01DB28B4 28260072 */  paddub      $4, $16, $0
/* 006BB8 01DB28B8 282E2072 */  paddub      $5, $17, $0
/* 006BBC 01DB28BC 0CD2760C */  jal         skipSpace__FPci
/* 006BC0 01DB28C0 00000000 */   nop
/* 006BC4 01DB28C4 288E4070 */  paddub      $17, $2, $0
/* 006BC8 01DB28C8 A098828F */  lw          $2, -0x6760($28)
/* 006BCC 01DB28CC 01004224 */  addiu       $2, $2, 0x1
/* 006BD0 01DB28D0 A09882AF */  sw          $2, -0x6760($28)
.L01DB28D4_2B80D4:
/* 006BD4 01DB28D4 04004016 */  bnez        $18, .L01DB28E8_2B80E8
/* 006BD8 01DB28D8 00000000 */   nop
/* 006BDC 01DB28DC FFFF0424 */  addiu       $4, $0, -0x1
/* 006BE0 01DB28E0 DC05040C */  jal         exit__2
/* 006BE4 01DB28E4 00000000 */   nop
.L01DB28E8_2B80E8:
/* 006BE8 01DB28E8 28260072 */  paddub      $4, $16, $0
/* 006BEC 01DB28EC 282E2072 */  paddub      $5, $17, $0
/* 006BF0 01DB28F0 0CD2760C */  jal         skipSpace__FPci
/* 006BF4 01DB28F4 00000000 */   nop
/* 006BF8 01DB28F8 288E4070 */  paddub      $17, $2, $0
.L01DB28FC_2B80FC:
/* 006BFC 01DB28FC A498838F */  lw          $3, -0x675C($28)
/* 006C00 01DB2900 2A182302 */  slt         $3, $17, $3
/* 006C04 01DB2904 F2FA6014 */  bnez        $3, .L01DB14D0_2B6CD0
/* 006C08 01DB2908 00000000 */   nop
.L01DB290C_2B810C:
/* 006C0C 01DB290C 4000BF7B */  lq          $31, 0x40($29)
/* 006C10 01DB2910 3000B37B */  lq          $19, 0x30($29)
/* 006C14 01DB2914 2000B27B */  lq          $18, 0x20($29)
/* 006C18 01DB2918 1000B17B */  lq          $17, 0x10($29)
/* 006C1C 01DB291C 0000B07B */  lq          $16, 0x0($29)
/* 006C20 01DB2920 5000BD27 */  addiu       $29, $29, 0x50
/* 006C24 01DB2924 0800E003 */  jr          $31
/* 006C28 01DB2928 00000000 */   nop
/* 006C2C 01DB292C 00000000 */  nop
