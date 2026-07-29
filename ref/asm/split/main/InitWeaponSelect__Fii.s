.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitWeaponSelect__Fii
/* 0FC850 001FC750 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0FC854 001FC754 3000BF7F */  sq          $31, 0x30($29)
/* 0FC858 001FC758 2000B27F */  sq          $18, 0x20($29)
/* 0FC85C 001FC75C 1000B17F */  sq          $17, 0x10($29)
/* 0FC860 001FC760 0000B07F */  sq          $16, 0x0($29)
/* 0FC864 001FC764 28868070 */  paddub      $16, $4, $0
/* 0FC868 001FC768 288EA070 */  paddub      $17, $5, $0
/* 0FC86C 001FC76C D494848F */  lw          $4, -0x6B2C($28)
/* 0FC870 001FC770 DA01023C */  lui         $2, %hi(WepMenu + 0x14)
/* 0FC874 001FC774 84EA4524 */  addiu       $5, $2, %lo(WepMenu + 0x14)
/* 0FC878 001FC778 01000624 */  addiu       $6, $0, 0x1
/* 0FC87C 001FC77C 02000724 */  addiu       $7, $0, 0x2
/* 0FC880 001FC780 D0B9080C */  jal         InitPersonalBoardMode__FP11CUserStatusP14PERSONAL_BOARDii
/* 0FC884 001FC784 00000000 */   nop
/* 0FC888 001FC788 DA01013C */  lui         $1, %hi(WepMenu)
/* 0FC88C 001FC78C 70EA30A4 */  sh          $16, %lo(WepMenu)($1)
/* 0FC890 001FC790 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FC894 001FC794 72EA20A4 */  sh          $0, %lo(WepMenu + 0x2)($1)
/* 0FC898 001FC798 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FC89C 001FC79C 75EA31A0 */  sb          $17, %lo(WepMenu + 0x5)($1)
/* 0FC8A0 001FC7A0 02000224 */  addiu       $2, $0, 0x2
/* 0FC8A4 001FC7A4 11000212 */  beq         $16, $2, .L001FC7EC
/* 0FC8A8 001FC7A8 00000000 */   nop
/* 0FC8AC 001FC7AC 01000224 */  addiu       $2, $0, 0x1
/* 0FC8B0 001FC7B0 0C000212 */  beq         $16, $2, .L001FC7E4
/* 0FC8B4 001FC7B4 00000000 */   nop
/* 0FC8B8 001FC7B8 03000012 */  beqz        $16, .L001FC7C8
/* 0FC8BC 001FC7BC 00000000 */   nop
/* 0FC8C0 001FC7C0 0A000010 */  b           .L001FC7EC
/* 0FC8C4 001FC7C4 00000000 */   nop
.L001FC7C8:
/* 0FC8C8 001FC7C8 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FC8CC 001FC7CC 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FC8D0 001FC7D0 DA01023C */  lui         $2, %hi(WepMenu + 0x44)
/* 0FC8D4 001FC7D4 B4EA4224 */  addiu       $2, $2, %lo(WepMenu + 0x44)
/* 0FC8D8 001FC7D8 749582AF */  sw          $2, -0x6A8C($28)
/* 0FC8DC 001FC7DC 03000010 */  b           .L001FC7EC
/* 0FC8E0 001FC7E0 00000000 */   nop
.L001FC7E4:
/* 0FC8E4 001FC7E4 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FC8E8 001FC7E8 7CEA20A4 */  sh          $0, %lo(WepMenu + 0xC)($1)
.L001FC7EC:
/* 0FC8EC 001FC7EC DA01013C */  lui         $1, %hi(WepMenu + 0x10)
/* 0FC8F0 001FC7F0 80EA20AC */  sw          $0, %lo(WepMenu + 0x10)($1)
/* 0FC8F4 001FC7F4 E494848F */  lw          $4, -0x6B1C($28)
/* 0FC8F8 001FC7F8 282E2072 */  paddub      $5, $17, $0
/* 0FC8FC 001FC7FC 7434080C */  jal         StartReadWepMDS__FP1i
/* 0FC900 001FC800 00000000 */   nop
/* 0FC904 001FC804 049580AF */  sw          $0, -0x6AFC($28)
/* 0FC908 001FC808 D494838F */  lw          $3, -0x6B2C($28)
/* 0FC90C 001FC80C A80A0224 */  addiu       $2, $0, 0xAA8
/* 0FC910 001FC810 18102202 */  mult        $2, $17, $2
/* 0FC914 001FC814 21106200 */  addu        $2, $3, $2
/* 0FC918 001FC818 0C454224 */  addiu       $2, $2, 0x450C
/* 0FC91C 001FC81C 149582AF */  sw          $2, -0x6AEC($28)
/* 0FC920 001FC820 28860070 */  paddub      $16, $0, $0
/* 0FC924 001FC824 13000010 */  b           .L001FC874
/* 0FC928 001FC828 00000000 */   nop
.L001FC82C:
/* 0FC92C 001FC82C 40111000 */  sll         $2, $16, 5
/* 0FC930 001FC830 23105000 */  subu        $2, $2, $16
/* 0FC934 001FC834 C0900200 */  sll         $18, $2, 3
/* 0FC938 001FC838 1495828F */  lw          $2, -0x6AEC($28)
/* 0FC93C 001FC83C 21205200 */  addu        $4, $2, $18
/* 0FC940 001FC840 00008284 */  lh          $2, 0x0($4)
/* 0FC944 001FC844 01014128 */  slti        $1, $2, 0x101
/* 0FC948 001FC848 09002010 */  beqz        $1, .L001FC870
/* 0FC94C 001FC84C 00000000 */   nop
/* 0FC950 001FC850 282E0070 */  paddub      $5, $0, $0
/* 0FC954 001FC854 F8000624 */  addiu       $6, $0, 0xF8
/* 0FC958 001FC858 5A0D040C */  jal         memset
/* 0FC95C 001FC85C 00000000 */   nop
/* 0FC960 001FC860 FFFF0324 */  addiu       $3, $0, -0x1
/* 0FC964 001FC864 1495828F */  lw          $2, -0x6AEC($28)
/* 0FC968 001FC868 21105200 */  addu        $2, $2, $18
/* 0FC96C 001FC86C 000043A4 */  sh          $3, 0x0($2)
.L001FC870:
/* 0FC970 001FC870 01001026 */  addiu       $16, $16, 0x1
.L001FC874:
/* 0FC974 001FC874 0A00022A */  slti        $2, $16, 0xA
/* 0FC978 001FC878 ECFF4014 */  bnez        $2, .L001FC82C
/* 0FC97C 001FC87C 00000000 */   nop
/* 0FC980 001FC880 D494828F */  lw          $2, -0x6B2C($28)
/* 0FC984 001FC884 21102202 */  addu        $2, $17, $2
/* 0FC988 001FC888 40434280 */  lb          $2, 0x4340($2)
/* 0FC98C 001FC88C DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FC990 001FC890 74EA22A0 */  sb          $2, %lo(WepMenu + 0x4)($1)
/* 0FC994 001FC894 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FC998 001FC898 74EA2280 */  lb          $2, %lo(WepMenu + 0x4)($1)
/* 0FC99C 001FC89C 04004004 */  bltz        $2, .L001FC8B0
/* 0FC9A0 001FC8A0 00000000 */   nop
/* 0FC9A4 001FC8A4 0A004228 */  slti        $2, $2, 0xA
/* 0FC9A8 001FC8A8 03004014 */  bnez        $2, .L001FC8B8
/* 0FC9AC 001FC8AC 00000000 */   nop
.L001FC8B0:
/* 0FC9B0 001FC8B0 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FC9B4 001FC8B4 74EA20A0 */  sb          $0, %lo(WepMenu + 0x4)($1)
.L001FC8B8:
/* 0FC9B8 001FC8B8 6B43023C */  lui         $2, (0x436B0000 >> 16)
/* 0FC9BC 001FC8BC D901013C */  lui         $1, %hi(SysCur)
/* 0FC9C0 001FC8C0 600422AC */  sw          $2, %lo(SysCur)($1)
/* 0FC9C4 001FC8C4 2543023C */  lui         $2, (0x43250000 >> 16)
/* 0FC9C8 001FC8C8 D901013C */  lui         $1, %hi(SysCur + 0x4)
/* 0FC9CC 001FC8CC 640422AC */  sw          $2, %lo(SysCur + 0x4)($1)
/* 0FC9D0 001FC8D0 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FC9D4 001FC8D4 75EA31A0 */  sb          $17, %lo(WepMenu + 0x5)($1)
/* 0FC9D8 001FC8D8 28260070 */  paddub      $4, $0, $0
/* 0FC9DC 001FC8DC 1E000010 */  b           .L001FC958
/* 0FC9E0 001FC8E0 00000000 */   nop
.L001FC8E4:
/* 0FC9E4 001FC8E4 40100400 */  sll         $2, $4, 1
/* 0FC9E8 001FC8E8 21104400 */  addu        $2, $2, $4
/* 0FC9EC 001FC8EC 80280200 */  sll         $5, $2, 2
/* 0FC9F0 001FC8F0 2900023C */  lui         $2, %hi(SysChara)
/* 0FC9F4 001FC8F4 502B4224 */  addiu       $2, $2, %lo(SysChara)
/* 0FC9F8 001FC8F8 21104500 */  addu        $2, $2, $5
/* 0FC9FC 001FC8FC 00004380 */  lb          $3, 0x0($2)
/* 0FCA00 001FC900 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FCA04 001FC904 75EA2280 */  lb          $2, %lo(WepMenu + 0x5)($1)
/* 0FCA08 001FC908 23186200 */  subu        $3, $3, $2
/* 0FCA0C 001FC90C C0100300 */  sll         $2, $3, 3
/* 0FCA10 001FC910 23104300 */  subu        $2, $2, $3
/* 0FCA14 001FC914 C0100200 */  sll         $2, $2, 3
/* 0FCA18 001FC918 23104300 */  subu        $2, $2, $3
/* 0FCA1C 001FC91C 40100200 */  sll         $2, $2, 1
/* 0FCA20 001FC920 0E014224 */  addiu       $2, $2, 0x10E
/* 0FCA24 001FC924 00008244 */  mtc1        $2, $f0
/* 0FCA28 001FC928 00000000 */  nop
/* 0FCA2C 001FC92C 20008046 */  cvt.s.w     $f0, $f0
/* 0FCA30 001FC930 2900023C */  lui         $2, %hi(SysChara + 0x4)
/* 0FCA34 001FC934 542B4224 */  addiu       $2, $2, %lo(SysChara + 0x4)
/* 0FCA38 001FC938 21104500 */  addu        $2, $2, $5
/* 0FCA3C 001FC93C 000040E4 */  swc1        $f0, 0x0($2)
/* 0FCA40 001FC940 6041033C */  lui         $3, (0x41600000 >> 16)
/* 0FCA44 001FC944 2900023C */  lui         $2, %hi(SysChara + 0x8)
/* 0FCA48 001FC948 582B4224 */  addiu       $2, $2, %lo(SysChara + 0x8)
/* 0FCA4C 001FC94C 21104500 */  addu        $2, $2, $5
/* 0FCA50 001FC950 000043AC */  sw          $3, 0x0($2)
/* 0FCA54 001FC954 01008424 */  addiu       $4, $4, 0x1
.L001FC958:
/* 0FCA58 001FC958 06008228 */  slti        $2, $4, 0x6
/* 0FCA5C 001FC95C E1FF4014 */  bnez        $2, .L001FC8E4
/* 0FCA60 001FC960 00000000 */   nop
/* 0FCA64 001FC964 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FCA68 001FC968 74EA2480 */  lb          $4, %lo(WepMenu + 0x4)($1)
/* 0FCA6C 001FC96C D6000224 */  addiu       $2, $0, 0xD6
/* 0FCA70 001FC970 18188200 */  mult        $3, $4, $2
/* 0FCA74 001FC974 E8000224 */  addiu       $2, $0, 0xE8
/* 0FCA78 001FC978 23104300 */  subu        $2, $2, $3
/* 0FCA7C 001FC97C 00008244 */  mtc1        $2, $f0
/* 0FCA80 001FC980 00000000 */  nop
/* 0FCA84 001FC984 20008046 */  cvt.s.w     $f0, $f0
/* 0FCA88 001FC988 7C9580E7 */  swc1        $f0, -0x6A84($28)
/* 0FCA8C 001FC98C 23100400 */  negu        $2, $4
/* 0FCA90 001FC990 00008244 */  mtc1        $2, $f0
/* 0FCA94 001FC994 00000000 */  nop
/* 0FCA98 001FC998 60008046 */  cvt.s.w     $f1, $f0
/* 0FCA9C 001FC99C 8041023C */  lui         $2, (0x41800000 >> 16)
/* 0FCAA0 001FC9A0 00008244 */  mtc1        $2, $f0
/* 0FCAA4 001FC9A4 00000000 */  nop
/* 0FCAA8 001FC9A8 42000146 */  mul.s       $f1, $f0, $f1
/* 0FCAAC 001FC9AC 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0FCAB0 001FC9B0 00008244 */  mtc1        $2, $f0
/* 0FCAB4 001FC9B4 00000000 */  nop
/* 0FCAB8 001FC9B8 00000146 */  add.s       $f0, $f0, $f1
/* 0FCABC 001FC9BC 809580E7 */  swc1        $f0, -0x6A80($28)
/* 0FCAC0 001FC9C0 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 0FCAC4 001FC9C4 789580E7 */  swc1        $f0, -0x6A88($28)
/* 0FCAC8 001FC9C8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0FCACC 001FC9CC DA01013C */  lui         $1, %hi(WepMenu + 0x8)
/* 0FCAD0 001FC9D0 78EA22A0 */  sb          $2, %lo(WepMenu + 0x8)($1)
/* 0FCAD4 001FC9D4 DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x12E0)
/* 0FCAD8 001FC9D8 C0BB20A0 */  sb          $0, %lo(MenuWepLevelUp + 0x12E0)($1)
/* 0FCADC 001FC9DC DA01023C */  lui         $2, %hi(CommonMenuMes3)
/* 0FCAE0 001FC9E0 103B4424 */  addiu       $4, $2, %lo(CommonMenuMes3)
/* 0FCAE4 001FC9E4 01000524 */  addiu       $5, $0, 0x1
/* 0FCAE8 001FC9E8 9836050C */  jal         Preset__6ClsMesFi
/* 0FCAEC 001FC9EC 00000000 */   nop
/* 0FCAF0 001FC9F0 1C88848F */  lw          $4, -0x77E4($28)
/* 0FCAF4 001FC9F4 FFFF0524 */  addiu       $5, $0, -0x1
/* 0FCAF8 001FC9F8 24B0080C */  jal         GetMenuCommonFontW__Fii
/* 0FCAFC 001FC9FC 00000000 */   nop
/* 0FCB00 001FCA00 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x8)
/* 0FCB04 001FCA04 183B22AC */  sw          $2, %lo(CommonMenuMes3 + 0x8)($1)
/* 0FCB08 001FCA08 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C0)
/* 0FCB0C 001FCA0C D05120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C0)($1)
/* 0FCB10 001FCA10 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x1730)
/* 0FCB14 001FCA14 006A20AC */  sw          $0, %lo(AtoraNameMes + 0x1730)($1)
/* 0FCB18 001FCA18 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x1734)
/* 0FCB1C 001FCA1C 046A20AC */  sw          $0, %lo(AtoraNameMes + 0x1734)($1)
/* 0FCB20 001FCA20 1C88848F */  lw          $4, -0x77E4($28)
/* 0FCB24 001FCA24 FFFF0524 */  addiu       $5, $0, -0x1
/* 0FCB28 001FCA28 24B0080C */  jal         GetMenuCommonFontW__Fii
/* 0FCB2C 001FCA2C 00000000 */   nop
/* 0FCB30 001FCA30 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x8)
/* 0FCB34 001FCA34 D85222AC */  sw          $2, %lo(AtoraNameMes + 0x8)($1)
/* 0FCB38 001FCA38 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x16C0)
/* 0FCB3C 001FCA3C 906920AC */  sw          $0, %lo(AtoraNameMes + 0x16C0)($1)
/* 0FCB40 001FCA40 01000224 */  addiu       $2, $0, 0x1
/* 0FCB44 001FCA44 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x16DC)
/* 0FCB48 001FCA48 AC6922AC */  sw          $2, %lo(AtoraNameMes + 0x16DC)($1)
/* 0FCB4C 001FCA4C DA01013C */  lui         $1, %hi(AtoraNameMes + 0x17B0)
/* 0FCB50 001FCA50 806A248C */  lw          $4, %lo(AtoraNameMes + 0x17B0)($1)
/* 0FCB54 001FCA54 282E0070 */  paddub      $5, $0, $0
/* 0FCB58 001FCA58 00010624 */  addiu       $6, $0, 0x100
/* 0FCB5C 001FCA5C 5A0D040C */  jal         memset
/* 0FCB60 001FCA60 00000000 */   nop
/* 0FCB64 001FCA64 28260070 */  paddub      $4, $0, $0
/* 0FCB68 001FCA68 0C000010 */  b           .L001FCA9C
/* 0FCB6C 001FCA6C 00000000 */   nop
.L001FCA70:
/* 0FCB70 001FCA70 FFFF0324 */  addiu       $3, $0, -0x1
/* 0FCB74 001FCA74 80280400 */  sll         $5, $4, 2
/* 0FCB78 001FCA78 DA01023C */  lui         $2, %hi(AtoraNameMes + 0x16E0)
/* 0FCB7C 001FCA7C B0694224 */  addiu       $2, $2, %lo(AtoraNameMes + 0x16E0)
/* 0FCB80 001FCA80 21104500 */  addu        $2, $2, $5
/* 0FCB84 001FCA84 000043AC */  sw          $3, 0x0($2)
/* 0FCB88 001FCA88 DA01023C */  lui         $2, %hi(AtoraNameMes + 0x1708)
/* 0FCB8C 001FCA8C D8694224 */  addiu       $2, $2, %lo(AtoraNameMes + 0x1708)
/* 0FCB90 001FCA90 21104500 */  addu        $2, $2, $5
/* 0FCB94 001FCA94 000040AC */  sw          $0, 0x0($2)
/* 0FCB98 001FCA98 01008424 */  addiu       $4, $4, 0x1
.L001FCA9C:
/* 0FCB9C 001FCA9C 0A008228 */  slti        $2, $4, 0xA
/* 0FCBA0 001FCAA0 F3FF4014 */  bnez        $2, .L001FCA70
/* 0FCBA4 001FCAA4 00000000 */   nop
/* 0FCBA8 001FCAA8 10000224 */  addiu       $2, $0, 0x10
/* 0FCBAC 001FCAAC DA01013C */  lui         $1, %hi(AtoraNameMes + 0x10)
/* 0FCBB0 001FCAB0 E05222AC */  sw          $2, %lo(AtoraNameMes + 0x10)($1)
/* 0FCBB4 001FCAB4 DA01023C */  lui         $2, %hi(AtoraNameMes)
/* 0FCBB8 001FCAB8 D0524424 */  addiu       $4, $2, %lo(AtoraNameMes)
/* 0FCBBC 001FCABC 04000524 */  addiu       $5, $0, 0x4
/* 0FCBC0 001FCAC0 9836050C */  jal         Preset__6ClsMesFi
/* 0FCBC4 001FCAC4 00000000 */   nop
/* 0FCBC8 001FCAC8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0FCBCC 001FCACC DA01013C */  lui         $1, %hi(AtoraNameMes + 0x16BC)
/* 0FCBD0 001FCAD0 8C6922AC */  sw          $2, %lo(AtoraNameMes + 0x16BC)($1)
/* 0FCBD4 001FCAD4 D901023C */  lui         $2, %hi(MenuMes)
/* 0FCBD8 001FCAD8 F0034424 */  addiu       $4, $2, %lo(MenuMes)
/* 0FCBDC 001FCADC 682D080C */  jal         InitData__10MenuClsMesFv
/* 0FCBE0 001FCAE0 00000000 */   nop
/* 0FCBE4 001FCAE4 10000424 */  addiu       $4, $0, 0x10
/* 0FCBE8 001FCAE8 D901013C */  lui         $1, %hi(MenuMes + 0x1C)
/* 0FCBEC 001FCAEC 0C04238C */  lw          $3, %lo(MenuMes + 0x1C)($1)
/* 0FCBF0 001FCAF0 2C0064AC */  sw          $4, 0x2C($3)
/* 0FCBF4 001FCAF4 D901013C */  lui         $1, %hi(MenuMes + 0x1C)
/* 0FCBF8 001FCAF8 0C04238C */  lw          $3, %lo(MenuMes + 0x1C)($1)
/* 0FCBFC 001FCAFC 300064AC */  sw          $4, 0x30($3)
/* 0FCC00 001FCB00 3000BF7B */  lq          $31, 0x30($29)
/* 0FCC04 001FCB04 2000B27B */  lq          $18, 0x20($29)
/* 0FCC08 001FCB08 1000B17B */  lq          $17, 0x10($29)
/* 0FCC0C 001FCB0C 0000B07B */  lq          $16, 0x0($29)
/* 0FCC10 001FCB10 4000BD27 */  addiu       $29, $29, 0x40
/* 0FCC14 001FCB14 0800E003 */  jr          $31
/* 0FCC18 001FCB18 00000000 */   nop
/* 0FCC1C 001FCB1C 00000000 */  nop
