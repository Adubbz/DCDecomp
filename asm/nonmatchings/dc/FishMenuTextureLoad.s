.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishMenuTextureLoad__Fv
/* F16D0 001F15D0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* F16D4 001F15D4 1000BF7F */  sq         $31, 0x10($sp)
/* F16D8 001F15D8 0000B07F */  sq         $16, 0x0($sp)
/* F16DC 001F15DC 28860070 */  paddub     $16, $0, $0
/* F16E0 001F15E0 D901013C */  lui        $at, (0x1D90394 >> 16)
/* F16E4 001F15E4 94032284 */  lh         $2, (0x1D90394 & 0xFFFF)($at)
/* F16E8 001F15E8 9D004014 */  bnez       $2, .L001F1860
/* F16EC 001F15EC 00000000 */   nop
/* F16F0 001F15F0 8CFB040C */  jal        ReadBGSync__Fv
/* F16F4 001F15F4 00000000 */   nop
/* F16F8 001F15F8 9A004014 */  bnez       $2, .L001F1864
/* F16FC 001F15FC 00000000 */   nop
/* F1700 001F1600 28260070 */  paddub     $4, $0, $0
/* F1704 001F1604 18FB040C */  jal        GetReadBGFile__Fi
/* F1708 001F1608 00000000 */   nop
/* F170C 001F160C 28864070 */  paddub     $16, $2, $0
/* F1710 001F1610 2900023C */  lui        $2, %hi(_2949)
/* F1714 001F1614 602A4524 */  addiu      $5, $2, %lo(_2949)
/* F1718 001F1618 2000A427 */  addiu      $4, $sp, 0x20
/* F171C 001F161C 02000324 */  addiu      $3, $0, 0x2
.L001F1620:
/* F1720 001F1620 0000A278 */  lq         $2, 0x0($5)
/* F1724 001F1624 1000A524 */  addiu      $5, $5, 0x10
/* F1728 001F1628 FFFF6324 */  addiu      $3, $3, -0x1
/* F172C 001F162C 0000827C */  sq         $2, 0x0($4)
/* F1730 001F1630 10008424 */  addiu      $4, $4, 0x10
/* F1734 001F1634 FAFF601C */  bgtz       $3, .L001F1620
/* F1738 001F1638 00000000 */   nop
/* F173C 001F163C 0000A2C4 */  lwc1       $f2, 0x0($5)
/* F1740 001F1640 000082E4 */  swc1       $f2, 0x0($4)
/* F1744 001F1644 D901013C */  lui        $at, (0x1D90390 >> 16)
/* F1748 001F1648 90032284 */  lh         $2, (0x1D90390 & 0xFFFF)($at)
/* F174C 001F164C 2400A2AF */  sw         $2, 0x24($sp)
/* F1750 001F1650 3000A2AF */  sw         $2, 0x30($sp)
/* F1754 001F1654 8C00048E */  lw         $4, 0x8C($16)
/* F1758 001F1658 2A00023C */  lui        $2, %hi(_2962)
/* F175C 001F165C 28D44524 */  addiu      $5, $2, %lo(_2962)
/* F1760 001F1660 28360070 */  paddub     $6, $0, $0
/* F1764 001F1664 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* F1768 001F1668 00000000 */   nop
/* F176C 001F166C 2C00A2AF */  sw         $2, 0x2C($sp)
/* F1770 001F1670 D901013C */  lui        $at, (0x1D90390 >> 16)
/* F1774 001F1674 90032584 */  lh         $5, (0x1D90390 & 0xFFFF)($at)
/* F1778 001F1678 C701023C */  lui        $2, %hi(TexManager)
/* F177C 001F167C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F1780 001F1680 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* F1784 001F1684 00000000 */   nop
/* F1788 001F1688 C701023C */  lui        $2, %hi(TexManager)
/* F178C 001F168C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F1790 001F1690 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* F1794 001F1694 00000000 */   nop
/* F1798 001F1698 C701023C */  lui        $2, %hi(TexManager)
/* F179C 001F169C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F17A0 001F16A0 FFFF0524 */  addiu      $5, $0, -0x1
/* F17A4 001F16A4 2000A627 */  addiu      $6, $sp, 0x20
/* F17A8 001F16A8 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* F17AC 001F16AC 00000000 */   nop
/* F17B0 001F16B0 C701023C */  lui        $2, %hi(TexManager)
/* F17B4 001F16B4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F17B8 001F16B8 2A00023C */  lui        $2, %hi(_2963)
/* F17BC 001F16BC 38D44524 */  addiu      $5, $2, %lo(_2963)
/* F17C0 001F16C0 FFFF0624 */  addiu      $6, $0, -0x1
/* F17C4 001F16C4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F17C8 001F16C8 00000000 */   nop
/* F17CC 001F16CC C89482AF */  sw         $2, -0x6B38($gp)
/* F17D0 001F16D0 C701023C */  lui        $2, %hi(TexManager)
/* F17D4 001F16D4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F17D8 001F16D8 2A00023C */  lui        $2, %hi(_790)
/* F17DC 001F16DC B0D14524 */  addiu      $5, $2, %lo(_790)
/* F17E0 001F16E0 FFFF0624 */  addiu      $6, $0, -0x1
/* F17E4 001F16E4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F17E8 001F16E8 00000000 */   nop
/* F17EC 001F16EC B09682AF */  sw         $2, -0x6950($gp)
/* F17F0 001F16F0 C701023C */  lui        $2, %hi(TexManager)
/* F17F4 001F16F4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F17F8 001F16F8 2A00023C */  lui        $2, %hi(_791)
/* F17FC 001F16FC B8D14524 */  addiu      $5, $2, %lo(_791)
/* F1800 001F1700 FFFF0624 */  addiu      $6, $0, -0x1
/* F1804 001F1704 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F1808 001F1708 00000000 */   nop
/* F180C 001F170C A89682AF */  sw         $2, -0x6958($gp)
/* F1810 001F1710 8C00048E */  lw         $4, 0x8C($16)
/* F1814 001F1714 2A00023C */  lui        $2, %hi(_2964)
/* F1818 001F1718 40D44524 */  addiu      $5, $2, %lo(_2964)
/* F181C 001F171C 28360070 */  paddub     $6, $0, $0
/* F1820 001F1720 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* F1824 001F1724 00000000 */   nop
/* F1828 001F1728 28260070 */  paddub     $4, $0, $0
/* F182C 001F172C 282E4070 */  paddub     $5, $2, $0
/* F1830 001F1730 50B0080C */  jal        InitMenuMesSet__FiPs
/* F1834 001F1734 00000000 */   nop
/* F1838 001F1738 FFFF0224 */  addiu      $2, $0, -0x1
/* F183C 001F173C DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* F1840 001F1740 0C3A22AC */  sw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* F1844 001F1744 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F1848 001F1748 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F184C 001F174C 01000524 */  addiu      $5, $0, 0x1
/* F1850 001F1750 9836050C */  jal        Preset__6ClsMesFi
/* F1854 001F1754 00000000 */   nop
/* F1858 001F1758 28260070 */  paddub     $4, $0, $0
/* F185C 001F175C 0B000010 */  b          .L001F178C
/* F1860 001F1760 00000000 */   nop
.L001F1764:
/* F1864 001F1764 94C4070C */  jal        GetExchangeItemList__Fi
/* F1868 001F1768 00000000 */   nop
/* F186C 001F176C 00004284 */  lh         $2, 0x0($2)
/* F1870 001F1770 64004524 */  addiu      $5, $2, 0x64
/* F1874 001F1774 80180400 */  sll        $3, $4, 2
/* F1878 001F1778 DA01023C */  lui        $2, %hi(D_1DA69B0)
/* F187C 001F177C B0694224 */  addiu      $2, $2, %lo(D_1DA69B0)
/* F1880 001F1780 21104300 */  addu       $2, $2, $3
/* F1884 001F1784 000045AC */  sw         $5, 0x0($2)
/* F1888 001F1788 01008424 */  addiu      $4, $4, 0x1
.L001F178C:
/* F188C 001F178C 05008228 */  slti       $2, $4, 0x5
/* F1890 001F1790 F4FF4014 */  bnez       $2, .L001F1764
/* F1894 001F1794 00000000 */   nop
/* F1898 001F1798 01000324 */  addiu      $3, $0, 0x1
/* F189C 001F179C DA01013C */  lui        $at, (0x1DA69AC >> 16)
/* F18A0 001F17A0 AC6923AC */  sw         $3, (0x1DA69AC & 0xFFFF)($at)
/* F18A4 001F17A4 04000224 */  addiu      $2, $0, 0x4
/* F18A8 001F17A8 DA01013C */  lui        $at, (0x1DA6990 >> 16)
/* F18AC 001F17AC 906922AC */  sw         $2, (0x1DA6990 & 0xFFFF)($at)
/* F18B0 001F17B0 DA01013C */  lui        $at, (0x1DA69FC >> 16)
/* F18B4 001F17B4 FC6920AC */  sw         $0, (0x1DA69FC & 0xFFFF)($at)
/* F18B8 001F17B8 DA01013C */  lui        $at, (0x1DA6A00 >> 16)
/* F18BC 001F17BC 006A23AC */  sw         $3, (0x1DA6A00 & 0xFFFF)($at)
/* F18C0 001F17C0 FFFF0224 */  addiu      $2, $0, -0x1
/* F18C4 001F17C4 DA01013C */  lui        $at, (0x1DA698C >> 16)
/* F18C8 001F17C8 8C6922AC */  sw         $2, (0x1DA698C & 0xFFFF)($at)
/* F18CC 001F17CC DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F18D0 001F17D0 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F18D4 001F17D4 C8000524 */  addiu      $5, $0, 0xC8
/* F18D8 001F17D8 5441050C */  jal        MakeMesWin__6ClsMesFi
/* F18DC 001F17DC 00000000 */   nop
/* F18E0 001F17E0 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F18E4 001F17E4 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F18E8 001F17E8 6437050C */  jal        Step__6ClsMesFv
/* F18EC 001F17EC 00000000 */   nop
/* F18F0 001F17F0 01000224 */  addiu      $2, $0, 0x1
/* F18F4 001F17F4 D901013C */  lui        $at, (0x1D90394 >> 16)
/* F18F8 001F17F8 940322A4 */  sh         $2, (0x1D90394 & 0xFFFF)($at)
/* F18FC 001F17FC DA01013C */  lui        $at, (0x1DA523C >> 16)
/* F1900 001F1800 3C5220AC */  sw         $0, (0x1DA523C & 0xFFFF)($at)
/* F1904 001F1804 DA01013C */  lui        $at, (0x1DA5240 >> 16)
/* F1908 001F1808 405222AC */  sw         $2, (0x1DA5240 & 0xFFFF)($at)
/* F190C 001F180C DA01013C */  lui        $at, (0x1DA3BA8 >> 16)
/* F1910 001F1810 A83B22AC */  sw         $2, (0x1DA3BA8 & 0xFFFF)($at)
/* F1914 001F1814 DA01013C */  lui        $at, (0x1DA5238 >> 16)
/* F1918 001F1818 385220AC */  sw         $0, (0x1DA5238 & 0xFFFF)($at)
/* F191C 001F181C 28260070 */  paddub     $4, $0, $0
/* F1920 001F1820 C0B7080C */  jal        GetNumberKeta__Fi
/* F1924 001F1824 00000000 */   nop
/* F1928 001F1828 FFFF0324 */  addiu      $3, $0, -0x1
/* F192C 001F182C DA01013C */  lui        $at, (0x1DA51CC >> 16)
/* F1930 001F1830 CC5123AC */  sw         $3, (0x1DA51CC & 0xFFFF)($at)
/* F1934 001F1834 CD004524 */  addiu      $5, $2, 0xCD
/* F1938 001F1838 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* F193C 001F183C 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* F1940 001F1840 5441050C */  jal        MakeMesWin__6ClsMesFi
/* F1944 001F1844 00000000 */   nop
/* F1948 001F1848 7E000224 */  addiu      $2, $0, 0x7E
/* F194C 001F184C D901013C */  lui        $at, (0x1D9039C >> 16)
/* F1950 001F1850 9C0322AC */  sw         $2, (0x1D9039C & 0xFFFF)($at)
/* F1954 001F1854 01001024 */  addiu      $16, $0, 0x1
/* F1958 001F1858 02000010 */  b          .L001F1864
/* F195C 001F185C 00000000 */   nop
.L001F1860:
/* F1960 001F1860 01001024 */  addiu      $16, $0, 0x1
.L001F1864:
/* F1964 001F1864 28160072 */  paddub     $2, $16, $0
/* F1968 001F1868 1000BF7B */  lq         $31, 0x10($sp)
/* F196C 001F186C 0000B07B */  lq         $16, 0x0($sp)
/* F1970 001F1870 5000BD27 */  addiu      $sp, $sp, 0x50
/* F1974 001F1874 0800E003 */  jr         $31
/* F1978 001F1878 00000000 */   nop
/* F197C 001F187C 00000000 */  nop
