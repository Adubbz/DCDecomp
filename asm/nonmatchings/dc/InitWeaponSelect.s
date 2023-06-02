.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitWeaponSelect__Fii
/* FC850 001FC750 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* FC854 001FC754 3000BF7F */  sq         $31, 0x30($sp)
/* FC858 001FC758 2000B27F */  sq         $18, 0x20($sp)
/* FC85C 001FC75C 1000B17F */  sq         $17, 0x10($sp)
/* FC860 001FC760 0000B07F */  sq         $16, 0x0($sp)
/* FC864 001FC764 28868070 */  paddub     $16, $4, $0
/* FC868 001FC768 288EA070 */  paddub     $17, $5, $0
/* FC86C 001FC76C D494848F */  lw         $4, -0x6B2C($gp)
/* FC870 001FC770 DA01023C */  lui        $2, %hi(D_1D9EA84)
/* FC874 001FC774 84EA4524 */  addiu      $5, $2, %lo(D_1D9EA84)
/* FC878 001FC778 01000624 */  addiu      $6, $0, 0x1
/* FC87C 001FC77C 02000724 */  addiu      $7, $0, 0x2
/* FC880 001FC780 D0B9080C */  jal        InitPersonalBoardMode__FP11CUserStatusP14PERSONAL_BOARDii
/* FC884 001FC784 00000000 */   nop
/* FC888 001FC788 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC88C 001FC78C 70EA30A4 */  sh         $16, -0x1590($at)
/* FC890 001FC790 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC894 001FC794 72EA20A4 */  sh         $0, -0x158E($at)
/* FC898 001FC798 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC89C 001FC79C 75EA31A0 */  sb         $17, -0x158B($at)
/* FC8A0 001FC7A0 02000224 */  addiu      $2, $0, 0x2
/* FC8A4 001FC7A4 11000212 */  beq        $16, $2, .L001FC7EC
/* FC8A8 001FC7A8 00000000 */   nop
/* FC8AC 001FC7AC 01000224 */  addiu      $2, $0, 0x1
/* FC8B0 001FC7B0 0C000212 */  beq        $16, $2, .L001FC7E4
/* FC8B4 001FC7B4 00000000 */   nop
/* FC8B8 001FC7B8 03000012 */  beqz       $16, .L001FC7C8
/* FC8BC 001FC7BC 00000000 */   nop
/* FC8C0 001FC7C0 0A000010 */  b          .L001FC7EC
/* FC8C4 001FC7C4 00000000 */   nop
.L001FC7C8:
/* FC8C8 001FC7C8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC8CC 001FC7CC 7CEA22A4 */  sh         $2, -0x1584($at)
/* FC8D0 001FC7D0 DA01023C */  lui        $2, %hi(D_1D9EAB4)
/* FC8D4 001FC7D4 B4EA4224 */  addiu      $2, $2, %lo(D_1D9EAB4)
/* FC8D8 001FC7D8 749582AF */  sw         $2, -0x6A8C($gp)
/* FC8DC 001FC7DC 03000010 */  b          .L001FC7EC
/* FC8E0 001FC7E0 00000000 */   nop
.L001FC7E4:
/* FC8E4 001FC7E4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC8E8 001FC7E8 7CEA20A4 */  sh         $0, -0x1584($at)
.L001FC7EC:
/* FC8EC 001FC7EC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC8F0 001FC7F0 80EA20AC */  sw         $0, -0x1580($at)
/* FC8F4 001FC7F4 E494848F */  lw         $4, -0x6B1C($gp)
/* FC8F8 001FC7F8 282E2072 */  paddub     $5, $17, $0
/* FC8FC 001FC7FC 7434080C */  jal        StartReadWepMDS__FP1i
/* FC900 001FC800 00000000 */   nop
/* FC904 001FC804 049580AF */  sw         $0, -0x6AFC($gp)
/* FC908 001FC808 D494838F */  lw         $3, -0x6B2C($gp)
/* FC90C 001FC80C A80A0224 */  addiu      $2, $0, 0xAA8
/* FC910 001FC810 18102202 */  mult       $2, $17, $2
/* FC914 001FC814 21106200 */  addu       $2, $3, $2
/* FC918 001FC818 0C454224 */  addiu      $2, $2, 0x450C
/* FC91C 001FC81C 149582AF */  sw         $2, -0x6AEC($gp)
/* FC920 001FC820 28860070 */  paddub     $16, $0, $0
/* FC924 001FC824 13000010 */  b          .L001FC874
/* FC928 001FC828 00000000 */   nop
.L001FC82C:
/* FC92C 001FC82C 40111000 */  sll        $2, $16, 5
/* FC930 001FC830 23105000 */  subu       $2, $2, $16
/* FC934 001FC834 C0900200 */  sll        $18, $2, 3
/* FC938 001FC838 1495828F */  lw         $2, -0x6AEC($gp)
/* FC93C 001FC83C 21205200 */  addu       $4, $2, $18
/* FC940 001FC840 00008284 */  lh         $2, 0x0($4)
/* FC944 001FC844 01014128 */  slti       $at, $2, 0x101
/* FC948 001FC848 09002010 */  beqz       $at, .L001FC870
/* FC94C 001FC84C 00000000 */   nop
/* FC950 001FC850 282E0070 */  paddub     $5, $0, $0
/* FC954 001FC854 F8000624 */  addiu      $6, $0, 0xF8
/* FC958 001FC858 5A0D040C */  jal        memset
/* FC95C 001FC85C 00000000 */   nop
/* FC960 001FC860 FFFF0324 */  addiu      $3, $0, -0x1
/* FC964 001FC864 1495828F */  lw         $2, -0x6AEC($gp)
/* FC968 001FC868 21105200 */  addu       $2, $2, $18
/* FC96C 001FC86C 000043A4 */  sh         $3, 0x0($2)
.L001FC870:
/* FC970 001FC870 01001026 */  addiu      $16, $16, 0x1
.L001FC874:
/* FC974 001FC874 0A00022A */  slti       $2, $16, 0xA
/* FC978 001FC878 ECFF4014 */  bnez       $2, .L001FC82C
/* FC97C 001FC87C 00000000 */   nop
/* FC980 001FC880 D494828F */  lw         $2, -0x6B2C($gp)
/* FC984 001FC884 21102202 */  addu       $2, $17, $2
/* FC988 001FC888 40434280 */  lb         $2, 0x4340($2)
/* FC98C 001FC88C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC990 001FC890 74EA22A0 */  sb         $2, -0x158C($at)
/* FC994 001FC894 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC998 001FC898 74EA2280 */  lb         $2, -0x158C($at)
/* FC99C 001FC89C 04004004 */  bltz       $2, .L001FC8B0
/* FC9A0 001FC8A0 00000000 */   nop
/* FC9A4 001FC8A4 0A004228 */  slti       $2, $2, 0xA
/* FC9A8 001FC8A8 03004014 */  bnez       $2, .L001FC8B8
/* FC9AC 001FC8AC 00000000 */   nop
.L001FC8B0:
/* FC9B0 001FC8B0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC9B4 001FC8B4 74EA20A0 */  sb         $0, -0x158C($at)
.L001FC8B8:
/* FC9B8 001FC8B8 6B43023C */  lui        $2, (0x436B0000 >> 16)
/* FC9BC 001FC8BC D901013C */  lui        $at, (0x1D90460 >> 16)
/* FC9C0 001FC8C0 600422AC */  sw         $2, (0x1D90460 & 0xFFFF)($at)
/* FC9C4 001FC8C4 2543023C */  lui        $2, (0x43250000 >> 16)
/* FC9C8 001FC8C8 D901013C */  lui        $at, (0x1D90464 >> 16)
/* FC9CC 001FC8CC 640422AC */  sw         $2, (0x1D90464 & 0xFFFF)($at)
/* FC9D0 001FC8D0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC9D4 001FC8D4 75EA31A0 */  sb         $17, -0x158B($at)
/* FC9D8 001FC8D8 28260070 */  paddub     $4, $0, $0
/* FC9DC 001FC8DC 1E000010 */  b          .L001FC958
/* FC9E0 001FC8E0 00000000 */   nop
.L001FC8E4:
/* FC9E4 001FC8E4 40100400 */  sll        $2, $4, 1
/* FC9E8 001FC8E8 21104400 */  addu       $2, $2, $4
/* FC9EC 001FC8EC 80280200 */  sll        $5, $2, 2
/* FC9F0 001FC8F0 2900023C */  lui        $2, %hi(SysChara)
/* FC9F4 001FC8F4 502B4224 */  addiu      $2, $2, %lo(SysChara)
/* FC9F8 001FC8F8 21104500 */  addu       $2, $2, $5
/* FC9FC 001FC8FC 00004380 */  lb         $3, 0x0($2)
/* FCA00 001FC900 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FCA04 001FC904 75EA2280 */  lb         $2, -0x158B($at)
/* FCA08 001FC908 23186200 */  subu       $3, $3, $2
/* FCA0C 001FC90C C0100300 */  sll        $2, $3, 3
/* FCA10 001FC910 23104300 */  subu       $2, $2, $3
/* FCA14 001FC914 C0100200 */  sll        $2, $2, 3
/* FCA18 001FC918 23104300 */  subu       $2, $2, $3
/* FCA1C 001FC91C 40100200 */  sll        $2, $2, 1
/* FCA20 001FC920 0E014224 */  addiu      $2, $2, 0x10E
/* FCA24 001FC924 00008244 */  mtc1       $2, $f0
/* FCA28 001FC928 00000000 */  nop
/* FCA2C 001FC92C 20008046 */  cvt.s.w    $f0, $f0
/* FCA30 001FC930 2900023C */  lui        $2, %hi(SysChara + 0x4)
/* FCA34 001FC934 542B4224 */  addiu      $2, $2, %lo(SysChara + 0x4)
/* FCA38 001FC938 21104500 */  addu       $2, $2, $5
/* FCA3C 001FC93C 000040E4 */  swc1       $f0, 0x0($2)
/* FCA40 001FC940 6041033C */  lui        $3, (0x41600000 >> 16)
/* FCA44 001FC944 2900023C */  lui        $2, %hi(SysChara + 0x8)
/* FCA48 001FC948 582B4224 */  addiu      $2, $2, %lo(SysChara + 0x8)
/* FCA4C 001FC94C 21104500 */  addu       $2, $2, $5
/* FCA50 001FC950 000043AC */  sw         $3, 0x0($2)
/* FCA54 001FC954 01008424 */  addiu      $4, $4, 0x1
.L001FC958:
/* FCA58 001FC958 06008228 */  slti       $2, $4, 0x6
/* FCA5C 001FC95C E1FF4014 */  bnez       $2, .L001FC8E4
/* FCA60 001FC960 00000000 */   nop
/* FCA64 001FC964 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FCA68 001FC968 74EA2480 */  lb         $4, -0x158C($at)
/* FCA6C 001FC96C D6000224 */  addiu      $2, $0, 0xD6
/* FCA70 001FC970 18188200 */  mult       $3, $4, $2
/* FCA74 001FC974 E8000224 */  addiu      $2, $0, 0xE8
/* FCA78 001FC978 23104300 */  subu       $2, $2, $3
/* FCA7C 001FC97C 00008244 */  mtc1       $2, $f0
/* FCA80 001FC980 00000000 */  nop
/* FCA84 001FC984 20008046 */  cvt.s.w    $f0, $f0
/* FCA88 001FC988 7C9580E7 */  swc1       $f0, -0x6A84($gp)
/* FCA8C 001FC98C 23100400 */  negu       $2, $4
/* FCA90 001FC990 00008244 */  mtc1       $2, $f0
/* FCA94 001FC994 00000000 */  nop
/* FCA98 001FC998 60008046 */  cvt.s.w    $f1, $f0
/* FCA9C 001FC99C 8041023C */  lui        $2, (0x41800000 >> 16)
/* FCAA0 001FC9A0 00008244 */  mtc1       $2, $f0
/* FCAA4 001FC9A4 00000000 */  nop
/* FCAA8 001FC9A8 42000146 */  mul.s      $f1, $f0, $f1
/* FCAAC 001FC9AC 0040023C */  lui        $2, (0x40000000 >> 16)
/* FCAB0 001FC9B0 00008244 */  mtc1       $2, $f0
/* FCAB4 001FC9B4 00000000 */  nop
/* FCAB8 001FC9B8 00000146 */  add.s      $f0, $f0, $f1
/* FCABC 001FC9BC 809580E7 */  swc1       $f0, -0x6A80($gp)
/* FCAC0 001FC9C0 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* FCAC4 001FC9C4 789580E7 */  swc1       $f0, -0x6A88($gp)
/* FCAC8 001FC9C8 FFFF0224 */  addiu      $2, $0, -0x1
/* FCACC 001FC9CC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FCAD0 001FC9D0 78EA22A0 */  sb         $2, -0x1588($at)
/* FCAD4 001FC9D4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FCAD8 001FC9D8 C0BB20A0 */  sb         $0, -0x4440($at)
/* FCADC 001FC9DC DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* FCAE0 001FC9E0 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* FCAE4 001FC9E4 01000524 */  addiu      $5, $0, 0x1
/* FCAE8 001FC9E8 9836050C */  jal        Preset__6ClsMesFi
/* FCAEC 001FC9EC 00000000 */   nop
/* FCAF0 001FC9F0 1C88848F */  lw         $4, -0x77E4($gp)
/* FCAF4 001FC9F4 FFFF0524 */  addiu      $5, $0, -0x1
/* FCAF8 001FC9F8 24B0080C */  jal        GetMenuCommonFontW__Fii
/* FCAFC 001FC9FC 00000000 */   nop
/* FCB00 001FCA00 DA01013C */  lui        $at, (0x1DA3B18 >> 16)
/* FCB04 001FCA04 183B22AC */  sw         $2, (0x1DA3B18 & 0xFFFF)($at)
/* FCB08 001FCA08 DA01013C */  lui        $at, (0x1DA51D0 >> 16)
/* FCB0C 001FCA0C D05120AC */  sw         $0, (0x1DA51D0 & 0xFFFF)($at)
/* FCB10 001FCA10 DA01013C */  lui        $at, (0x1DA6A00 >> 16)
/* FCB14 001FCA14 006A20AC */  sw         $0, (0x1DA6A00 & 0xFFFF)($at)
/* FCB18 001FCA18 DA01013C */  lui        $at, (0x1DA6A04 >> 16)
/* FCB1C 001FCA1C 046A20AC */  sw         $0, (0x1DA6A04 & 0xFFFF)($at)
/* FCB20 001FCA20 1C88848F */  lw         $4, -0x77E4($gp)
/* FCB24 001FCA24 FFFF0524 */  addiu      $5, $0, -0x1
/* FCB28 001FCA28 24B0080C */  jal        GetMenuCommonFontW__Fii
/* FCB2C 001FCA2C 00000000 */   nop
/* FCB30 001FCA30 DA01013C */  lui        $at, (0x1DA52D8 >> 16)
/* FCB34 001FCA34 D85222AC */  sw         $2, (0x1DA52D8 & 0xFFFF)($at)
/* FCB38 001FCA38 DA01013C */  lui        $at, (0x1DA6990 >> 16)
/* FCB3C 001FCA3C 906920AC */  sw         $0, (0x1DA6990 & 0xFFFF)($at)
/* FCB40 001FCA40 01000224 */  addiu      $2, $0, 0x1
/* FCB44 001FCA44 DA01013C */  lui        $at, (0x1DA69AC >> 16)
/* FCB48 001FCA48 AC6922AC */  sw         $2, (0x1DA69AC & 0xFFFF)($at)
/* FCB4C 001FCA4C DA01013C */  lui        $at, (0x1DA6A80 >> 16)
/* FCB50 001FCA50 806A248C */  lw         $4, (0x1DA6A80 & 0xFFFF)($at)
/* FCB54 001FCA54 282E0070 */  paddub     $5, $0, $0
/* FCB58 001FCA58 00010624 */  addiu      $6, $0, 0x100
/* FCB5C 001FCA5C 5A0D040C */  jal        memset
/* FCB60 001FCA60 00000000 */   nop
/* FCB64 001FCA64 28260070 */  paddub     $4, $0, $0
/* FCB68 001FCA68 0C000010 */  b          .L001FCA9C
/* FCB6C 001FCA6C 00000000 */   nop
.L001FCA70:
/* FCB70 001FCA70 FFFF0324 */  addiu      $3, $0, -0x1
/* FCB74 001FCA74 80280400 */  sll        $5, $4, 2
/* FCB78 001FCA78 DA01023C */  lui        $2, %hi(D_1DA69B0)
/* FCB7C 001FCA7C B0694224 */  addiu      $2, $2, %lo(D_1DA69B0)
/* FCB80 001FCA80 21104500 */  addu       $2, $2, $5
/* FCB84 001FCA84 000043AC */  sw         $3, 0x0($2)
/* FCB88 001FCA88 DA01023C */  lui        $2, %hi(D_1DA69D8)
/* FCB8C 001FCA8C D8694224 */  addiu      $2, $2, %lo(D_1DA69D8)
/* FCB90 001FCA90 21104500 */  addu       $2, $2, $5
/* FCB94 001FCA94 000040AC */  sw         $0, 0x0($2)
/* FCB98 001FCA98 01008424 */  addiu      $4, $4, 0x1
.L001FCA9C:
/* FCB9C 001FCA9C 0A008228 */  slti       $2, $4, 0xA
/* FCBA0 001FCAA0 F3FF4014 */  bnez       $2, .L001FCA70
/* FCBA4 001FCAA4 00000000 */   nop
/* FCBA8 001FCAA8 10000224 */  addiu      $2, $0, 0x10
/* FCBAC 001FCAAC DA01013C */  lui        $at, (0x1DA52E0 >> 16)
/* FCBB0 001FCAB0 E05222AC */  sw         $2, (0x1DA52E0 & 0xFFFF)($at)
/* FCBB4 001FCAB4 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* FCBB8 001FCAB8 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* FCBBC 001FCABC 04000524 */  addiu      $5, $0, 0x4
/* FCBC0 001FCAC0 9836050C */  jal        Preset__6ClsMesFi
/* FCBC4 001FCAC4 00000000 */   nop
/* FCBC8 001FCAC8 FFFF0224 */  addiu      $2, $0, -0x1
/* FCBCC 001FCACC DA01013C */  lui        $at, (0x1DA698C >> 16)
/* FCBD0 001FCAD0 8C6922AC */  sw         $2, (0x1DA698C & 0xFFFF)($at)
/* FCBD4 001FCAD4 D901023C */  lui        $2, %hi(MenuMes)
/* FCBD8 001FCAD8 F0034424 */  addiu      $4, $2, %lo(MenuMes)
/* FCBDC 001FCADC 682D080C */  jal        InitData__10MenuClsMesFv
/* FCBE0 001FCAE0 00000000 */   nop
/* FCBE4 001FCAE4 10000424 */  addiu      $4, $0, 0x10
/* FCBE8 001FCAE8 D901013C */  lui        $at, (0x1D9040C >> 16)
/* FCBEC 001FCAEC 0C04238C */  lw         $3, (0x1D9040C & 0xFFFF)($at)
/* FCBF0 001FCAF0 2C0064AC */  sw         $4, 0x2C($3)
/* FCBF4 001FCAF4 D901013C */  lui        $at, (0x1D9040C >> 16)
/* FCBF8 001FCAF8 0C04238C */  lw         $3, (0x1D9040C & 0xFFFF)($at)
/* FCBFC 001FCAFC 300064AC */  sw         $4, 0x30($3)
/* FCC00 001FCB00 3000BF7B */  lq         $31, 0x30($sp)
/* FCC04 001FCB04 2000B27B */  lq         $18, 0x20($sp)
/* FCC08 001FCB08 1000B17B */  lq         $17, 0x10($sp)
/* FCC0C 001FCB0C 0000B07B */  lq         $16, 0x0($sp)
/* FCC10 001FCB10 4000BD27 */  addiu      $sp, $sp, 0x40
/* FCC14 001FCB14 0800E003 */  jr         $31
/* FCC18 001FCB18 00000000 */   nop
/* FCC1C 001FCB1C 00000000 */  nop
