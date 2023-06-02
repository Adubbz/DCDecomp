.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__13CDungeonPartsFv
/* C17D0 001C16D0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* C17D4 001C16D4 4000BF7F */  sq         $31, 0x40($sp)
/* C17D8 001C16D8 3000B37F */  sq         $19, 0x30($sp)
/* C17DC 001C16DC 2000B27F */  sq         $18, 0x20($sp)
/* C17E0 001C16E0 1000B17F */  sq         $17, 0x10($sp)
/* C17E4 001C16E4 0000B07F */  sq         $16, 0x0($sp)
/* C17E8 001C16E8 289E8070 */  paddub     $19, $4, $0
/* C17EC 001C16EC 28860070 */  paddub     $16, $0, $0
/* C17F0 001C16F0 4B000010 */  b          .L001C1820
/* C17F4 001C16F4 00000000 */   nop
.L001C16F8:
/* C17F8 001C16F8 80181000 */  sll        $3, $16, 2
/* C17FC 001C16FC 21187300 */  addu       $3, $3, $19
/* C1800 001C1700 B0017224 */  addiu      $18, $3, 0x1B0
/* C1804 001C1704 B001718C */  lw         $17, 0x1B0($3)
/* C1808 001C1708 44002012 */  beqz       $17, .L001C181C
/* C180C 001C170C 00000000 */   nop
/* C1810 001C1710 00016286 */  lh         $2, 0x100($19)
/* C1814 001C1714 00008244 */  mtc1       $2, $f0
/* C1818 001C1718 00000000 */  nop
/* C181C 001C171C 60008046 */  cvt.s.w    $f1, $f0
/* C1820 001C1720 700160C4 */  lwc1       $f0, 0x170($3)
/* C1824 001C1724 000B0046 */  add.s      $f12, $f1, $f0
/* C1828 001C1728 2C44040C */  jal        fptosi
/* C182C 001C172C 00000000 */   nop
/* C1830 001C1730 04004128 */  slti       $at, $2, 0x4
/* C1834 001C1734 02002014 */  bnez       $at, .L001C1740
/* C1838 001C1738 00000000 */   nop
/* C183C 001C173C FDFF4224 */  addiu      $2, $2, -0x3
.L001C1740:
/* C1840 001C1740 00008244 */  mtc1       $2, $f0
/* C1844 001C1744 00000000 */  nop
/* C1848 001C1748 60038046 */  cvt.s.w    $f13, $f0
/* C184C 001C174C 4040023C */  lui        $2, (0x40400000 >> 16)
/* C1850 001C1750 00008244 */  mtc1       $2, $f0
/* C1854 001C1754 00000000 */  nop
/* C1858 001C1758 32000D46 */  c.eq.s     $f0, $f13
/* C185C 001C175C 00000000 */  nop
/* C1860 001C1760 03000045 */  bc1f       .L001C1770
/* C1864 001C1764 00000000 */   nop
/* C1868 001C1768 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* C186C 001C176C 00688244 */  mtc1       $2, $f13
.L001C1770:
/* C1870 001C1770 B4C2023C */  lui        $2, (0xC2B40000 >> 16)
/* C1874 001C1774 00008244 */  mtc1       $2, $f0
/* C1878 001C1778 00000000 */  nop
/* C187C 001C177C 42000D46 */  mul.s      $f1, $f0, $f13
/* C1880 001C1780 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* C1884 001C1784 42000146 */  mul.s      $f1, $f0, $f1
/* C1888 001C1788 3443023C */  lui        $2, (0x43340000 >> 16)
/* C188C 001C178C 00008244 */  mtc1       $2, $f0
/* C1890 001C1790 00000000 */  nop
/* C1894 001C1794 430B0046 */  div.s      $f13, $f1, $f0
/* C1898 001C1798 00608044 */  mtc1       $0, $f12
/* C189C 001C179C 00000000 */  nop
/* C18A0 001C17A0 86630046 */  mov.s      $f14, $f12
/* C18A4 001C17A4 28262072 */  paddub     $4, $17, $0
/* C18A8 001C17A8 70A3040C */  jal        SetRotation__6CFrameFfff
/* C18AC 001C17AC 00000000 */   nop
/* C18B0 001C17B0 5000A427 */  addiu      $4, $sp, 0x50
/* C18B4 001C17B4 F0006526 */  addiu      $5, $19, 0xF0
/* C18B8 001C17B8 0C86040C */  jal        sceVu0CopyVector
/* C18BC 001C17BC 00000000 */   nop
/* C18C0 001C17C0 00111000 */  sll        $2, $16, 4
/* C18C4 001C17C4 21105300 */  addu       $2, $2, $19
/* C18C8 001C17C8 100141C4 */  lwc1       $f1, 0x110($2)
/* C18CC 001C17CC 5000A0C7 */  lwc1       $f0, 0x50($sp)
/* C18D0 001C17D0 00000146 */  add.s      $f0, $f0, $f1
/* C18D4 001C17D4 5000A0E7 */  swc1       $f0, 0x50($sp)
/* C18D8 001C17D8 140141C4 */  lwc1       $f1, 0x114($2)
/* C18DC 001C17DC 5400A0C7 */  lwc1       $f0, 0x54($sp)
/* C18E0 001C17E0 00000146 */  add.s      $f0, $f0, $f1
/* C18E4 001C17E4 5400A0E7 */  swc1       $f0, 0x54($sp)
/* C18E8 001C17E8 180141C4 */  lwc1       $f1, 0x118($2)
/* C18EC 001C17EC 5800A0C7 */  lwc1       $f0, 0x58($sp)
/* C18F0 001C17F0 00000146 */  add.s      $f0, $f0, $f1
/* C18F4 001C17F4 5800A0E7 */  swc1       $f0, 0x58($sp)
/* C18F8 001C17F8 803F023C */  lui        $2, (0x3F800000 >> 16)
/* C18FC 001C17FC 5C00A2AF */  sw         $2, 0x5C($sp)
/* C1900 001C1800 0000448E */  lw         $4, 0x0($18)
/* C1904 001C1804 5000A527 */  addiu      $5, $sp, 0x50
/* C1908 001C1808 B89F040C */  jal        SetPosition__6CFrameFPf
/* C190C 001C180C 00000000 */   nop
/* C1910 001C1810 0000448E */  lw         $4, 0x0($18)
/* C1914 001C1814 60BB040C */  jal        MGDraw__FP6CFrame
/* C1918 001C1818 00000000 */   nop
.L001C181C:
/* C191C 001C181C 01001026 */  addiu      $16, $16, 0x1
.L001C1820:
/* C1920 001C1820 0600032A */  slti       $3, $16, 0x6
/* C1924 001C1824 B4FF6014 */  bnez       $3, .L001C16F8
/* C1928 001C1828 00000000 */   nop
/* C192C 001C182C 4000BF7B */  lq         $31, 0x40($sp)
/* C1930 001C1830 3000B37B */  lq         $19, 0x30($sp)
/* C1934 001C1834 2000B27B */  lq         $18, 0x20($sp)
/* C1938 001C1838 1000B17B */  lq         $17, 0x10($sp)
/* C193C 001C183C 0000B07B */  lq         $16, 0x0($sp)
/* C1940 001C1840 6000BD27 */  addiu      $sp, $sp, 0x60
/* C1944 001C1844 0800E003 */  jr         $31
/* C1948 001C1848 00000000 */   nop
/* C194C 001C184C 00000000 */  nop