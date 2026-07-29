.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishMenuTextureLoad__Fv
/* 0F16D0 001F15D0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0F16D4 001F15D4 1000BF7F */  sq          $31, 0x10($29)
/* 0F16D8 001F15D8 0000B07F */  sq          $16, 0x0($29)
/* 0F16DC 001F15DC 28860070 */  paddub      $16, $0, $0
/* 0F16E0 001F15E0 D901013C */  lui         $1, %hi(FishMenu + 0x4)
/* 0F16E4 001F15E4 94032284 */  lh          $2, %lo(FishMenu + 0x4)($1)
/* 0F16E8 001F15E8 9D004014 */  bnez        $2, .L001F1860
/* 0F16EC 001F15EC 00000000 */   nop
/* 0F16F0 001F15F0 8CFB040C */  jal         ReadBGSync__Fv
/* 0F16F4 001F15F4 00000000 */   nop
/* 0F16F8 001F15F8 9A004014 */  bnez        $2, .L001F1864
/* 0F16FC 001F15FC 00000000 */   nop
/* 0F1700 001F1600 28260070 */  paddub      $4, $0, $0
/* 0F1704 001F1604 18FB040C */  jal         GetReadBGFile__Fi
/* 0F1708 001F1608 00000000 */   nop
/* 0F170C 001F160C 28864070 */  paddub      $16, $2, $0
/* 0F1710 001F1610 2900023C */  lui         $2, %hi(LIT_2949)
/* 0F1714 001F1614 602A4524 */  addiu       $5, $2, %lo(LIT_2949)
/* 0F1718 001F1618 2000A427 */  addiu       $4, $29, 0x20
/* 0F171C 001F161C 02000324 */  addiu       $3, $0, 0x2
.L001F1620:
/* 0F1720 001F1620 0000A278 */  lq          $2, 0x0($5)
/* 0F1724 001F1624 1000A524 */  addiu       $5, $5, 0x10
/* 0F1728 001F1628 FFFF6324 */  addiu       $3, $3, -0x1
/* 0F172C 001F162C 0000827C */  sq          $2, 0x0($4)
/* 0F1730 001F1630 10008424 */  addiu       $4, $4, 0x10
/* 0F1734 001F1634 FAFF601C */  bgtz        $3, .L001F1620
/* 0F1738 001F1638 00000000 */   nop
/* 0F173C 001F163C 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 0F1740 001F1640 000082E4 */  swc1        $f2, 0x0($4)
/* 0F1744 001F1644 D901013C */  lui         $1, %hi(FishMenu)
/* 0F1748 001F1648 90032284 */  lh          $2, %lo(FishMenu)($1)
/* 0F174C 001F164C 2400A2AF */  sw          $2, 0x24($29)
/* 0F1750 001F1650 3000A2AF */  sw          $2, 0x30($29)
/* 0F1754 001F1654 8C00048E */  lw          $4, 0x8C($16)
/* 0F1758 001F1658 2A00023C */  lui         $2, %hi(LIT_2962)
/* 0F175C 001F165C 28D44524 */  addiu       $5, $2, %lo(LIT_2962)
/* 0F1760 001F1660 28360070 */  paddub      $6, $0, $0
/* 0F1764 001F1664 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0F1768 001F1668 00000000 */   nop
/* 0F176C 001F166C 2C00A2AF */  sw          $2, 0x2C($29)
/* 0F1770 001F1670 D901013C */  lui         $1, %hi(FishMenu)
/* 0F1774 001F1674 90032584 */  lh          $5, %lo(FishMenu)($1)
/* 0F1778 001F1678 C701023C */  lui         $2, %hi(TexManager)
/* 0F177C 001F167C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F1780 001F1680 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0F1784 001F1684 00000000 */   nop
/* 0F1788 001F1688 C701023C */  lui         $2, %hi(TexManager)
/* 0F178C 001F168C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F1790 001F1690 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0F1794 001F1694 00000000 */   nop
/* 0F1798 001F1698 C701023C */  lui         $2, %hi(TexManager)
/* 0F179C 001F169C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F17A0 001F16A0 FFFF0524 */  addiu       $5, $0, -0x1
/* 0F17A4 001F16A4 2000A627 */  addiu       $6, $29, 0x20
/* 0F17A8 001F16A8 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0F17AC 001F16AC 00000000 */   nop
/* 0F17B0 001F16B0 C701023C */  lui         $2, %hi(TexManager)
/* 0F17B4 001F16B4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F17B8 001F16B8 2A00023C */  lui         $2, %hi(LIT_2963)
/* 0F17BC 001F16BC 38D44524 */  addiu       $5, $2, %lo(LIT_2963)
/* 0F17C0 001F16C0 FFFF0624 */  addiu       $6, $0, -0x1
/* 0F17C4 001F16C4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F17C8 001F16C8 00000000 */   nop
/* 0F17CC 001F16CC C89482AF */  sw          $2, -0x6B38($28)
/* 0F17D0 001F16D0 C701023C */  lui         $2, %hi(TexManager)
/* 0F17D4 001F16D4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F17D8 001F16D8 2A00023C */  lui         $2, %hi(LIT_790)
/* 0F17DC 001F16DC B0D14524 */  addiu       $5, $2, %lo(LIT_790)
/* 0F17E0 001F16E0 FFFF0624 */  addiu       $6, $0, -0x1
/* 0F17E4 001F16E4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F17E8 001F16E8 00000000 */   nop
/* 0F17EC 001F16EC B09682AF */  sw          $2, -0x6950($28)
/* 0F17F0 001F16F0 C701023C */  lui         $2, %hi(TexManager)
/* 0F17F4 001F16F4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F17F8 001F16F8 2A00023C */  lui         $2, %hi(LIT_791)
/* 0F17FC 001F16FC B8D14524 */  addiu       $5, $2, %lo(LIT_791)
/* 0F1800 001F1700 FFFF0624 */  addiu       $6, $0, -0x1
/* 0F1804 001F1704 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F1808 001F1708 00000000 */   nop
/* 0F180C 001F170C A89682AF */  sw          $2, -0x6958($28)
/* 0F1810 001F1710 8C00048E */  lw          $4, 0x8C($16)
/* 0F1814 001F1714 2A00023C */  lui         $2, %hi(LIT_2964)
/* 0F1818 001F1718 40D44524 */  addiu       $5, $2, %lo(LIT_2964)
/* 0F181C 001F171C 28360070 */  paddub      $6, $0, $0
/* 0F1820 001F1720 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0F1824 001F1724 00000000 */   nop
/* 0F1828 001F1728 28260070 */  paddub      $4, $0, $0
/* 0F182C 001F172C 282E4070 */  paddub      $5, $2, $0
/* 0F1830 001F1730 50B0080C */  jal         InitMenuMesSet__FiPs
/* 0F1834 001F1734 00000000 */   nop
/* 0F1838 001F1738 FFFF0224 */  addiu       $2, $0, -0x1
/* 0F183C 001F173C DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16BC)
/* 0F1840 001F1740 0C3A22AC */  sw          $2, %lo(CommonMenuMes2 + 0x16BC)($1)
/* 0F1844 001F1744 DA01023C */  lui         $2, %hi(AtoraNameMes)
/* 0F1848 001F1748 D0524424 */  addiu       $4, $2, %lo(AtoraNameMes)
/* 0F184C 001F174C 01000524 */  addiu       $5, $0, 0x1
/* 0F1850 001F1750 9836050C */  jal         Preset__6ClsMesFi
/* 0F1854 001F1754 00000000 */   nop
/* 0F1858 001F1758 28260070 */  paddub      $4, $0, $0
/* 0F185C 001F175C 0B000010 */  b           .L001F178C
/* 0F1860 001F1760 00000000 */   nop
.L001F1764:
/* 0F1864 001F1764 94C4070C */  jal         GetExchangeItemList__Fi
/* 0F1868 001F1768 00000000 */   nop
/* 0F186C 001F176C 00004284 */  lh          $2, 0x0($2)
/* 0F1870 001F1770 64004524 */  addiu       $5, $2, 0x64
/* 0F1874 001F1774 80180400 */  sll         $3, $4, 2
/* 0F1878 001F1778 DA01023C */  lui         $2, %hi(AtoraNameMes + 0x16E0)
/* 0F187C 001F177C B0694224 */  addiu       $2, $2, %lo(AtoraNameMes + 0x16E0)
/* 0F1880 001F1780 21104300 */  addu        $2, $2, $3
/* 0F1884 001F1784 000045AC */  sw          $5, 0x0($2)
/* 0F1888 001F1788 01008424 */  addiu       $4, $4, 0x1
.L001F178C:
/* 0F188C 001F178C 05008228 */  slti        $2, $4, 0x5
/* 0F1890 001F1790 F4FF4014 */  bnez        $2, .L001F1764
/* 0F1894 001F1794 00000000 */   nop
/* 0F1898 001F1798 01000324 */  addiu       $3, $0, 0x1
/* 0F189C 001F179C DA01013C */  lui         $1, %hi(AtoraNameMes + 0x16DC)
/* 0F18A0 001F17A0 AC6923AC */  sw          $3, %lo(AtoraNameMes + 0x16DC)($1)
/* 0F18A4 001F17A4 04000224 */  addiu       $2, $0, 0x4
/* 0F18A8 001F17A8 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x16C0)
/* 0F18AC 001F17AC 906922AC */  sw          $2, %lo(AtoraNameMes + 0x16C0)($1)
/* 0F18B0 001F17B0 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x172C)
/* 0F18B4 001F17B4 FC6920AC */  sw          $0, %lo(AtoraNameMes + 0x172C)($1)
/* 0F18B8 001F17B8 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x1730)
/* 0F18BC 001F17BC 006A23AC */  sw          $3, %lo(AtoraNameMes + 0x1730)($1)
/* 0F18C0 001F17C0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0F18C4 001F17C4 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x16BC)
/* 0F18C8 001F17C8 8C6922AC */  sw          $2, %lo(AtoraNameMes + 0x16BC)($1)
/* 0F18CC 001F17CC DA01023C */  lui         $2, %hi(AtoraNameMes)
/* 0F18D0 001F17D0 D0524424 */  addiu       $4, $2, %lo(AtoraNameMes)
/* 0F18D4 001F17D4 C8000524 */  addiu       $5, $0, 0xC8
/* 0F18D8 001F17D8 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F18DC 001F17DC 00000000 */   nop
/* 0F18E0 001F17E0 DA01023C */  lui         $2, %hi(AtoraNameMes)
/* 0F18E4 001F17E4 D0524424 */  addiu       $4, $2, %lo(AtoraNameMes)
/* 0F18E8 001F17E8 6437050C */  jal         Step__6ClsMesFv
/* 0F18EC 001F17EC 00000000 */   nop
/* 0F18F0 001F17F0 01000224 */  addiu       $2, $0, 0x1
/* 0F18F4 001F17F4 D901013C */  lui         $1, %hi(FishMenu + 0x4)
/* 0F18F8 001F17F8 940322A4 */  sh          $2, %lo(FishMenu + 0x4)($1)
/* 0F18FC 001F17FC DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x172C)
/* 0F1900 001F1800 3C5220AC */  sw          $0, %lo(CommonMenuMes3 + 0x172C)($1)
/* 0F1904 001F1804 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x1730)
/* 0F1908 001F1808 405222AC */  sw          $2, %lo(CommonMenuMes3 + 0x1730)($1)
/* 0F190C 001F180C DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x98)
/* 0F1910 001F1810 A83B22AC */  sw          $2, %lo(CommonMenuMes3 + 0x98)($1)
/* 0F1914 001F1814 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x1728)
/* 0F1918 001F1818 385220AC */  sw          $0, %lo(CommonMenuMes3 + 0x1728)($1)
/* 0F191C 001F181C 28260070 */  paddub      $4, $0, $0
/* 0F1920 001F1820 C0B7080C */  jal         GetNumberKeta__Fi
/* 0F1924 001F1824 00000000 */   nop
/* 0F1928 001F1828 FFFF0324 */  addiu       $3, $0, -0x1
/* 0F192C 001F182C DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16BC)
/* 0F1930 001F1830 CC5123AC */  sw          $3, %lo(CommonMenuMes3 + 0x16BC)($1)
/* 0F1934 001F1834 CD004524 */  addiu       $5, $2, 0xCD
/* 0F1938 001F1838 DA01023C */  lui         $2, %hi(CommonMenuMes3)
/* 0F193C 001F183C 103B4424 */  addiu       $4, $2, %lo(CommonMenuMes3)
/* 0F1940 001F1840 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F1944 001F1844 00000000 */   nop
/* 0F1948 001F1848 7E000224 */  addiu       $2, $0, 0x7E
/* 0F194C 001F184C D901013C */  lui         $1, %hi(FishMenu + 0xC)
/* 0F1950 001F1850 9C0322AC */  sw          $2, %lo(FishMenu + 0xC)($1)
/* 0F1954 001F1854 01001024 */  addiu       $16, $0, 0x1
/* 0F1958 001F1858 02000010 */  b           .L001F1864
/* 0F195C 001F185C 00000000 */   nop
.L001F1860:
/* 0F1960 001F1860 01001024 */  addiu       $16, $0, 0x1
.L001F1864:
/* 0F1964 001F1864 28160072 */  paddub      $2, $16, $0
/* 0F1968 001F1868 1000BF7B */  lq          $31, 0x10($29)
/* 0F196C 001F186C 0000B07B */  lq          $16, 0x0($29)
/* 0F1970 001F1870 5000BD27 */  addiu       $29, $29, 0x50
/* 0F1974 001F1874 0800E003 */  jr          $31
/* 0F1978 001F1878 00000000 */   nop
/* 0F197C 001F187C 00000000 */  nop
