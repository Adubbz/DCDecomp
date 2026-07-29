.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawChargeShop__Fv
/* 0EA8A0 001EA7A0 90FFBD27 */  addiu       $29, $29, -0x70
/* 0EA8A4 001EA7A4 3000BF7F */  sq          $31, 0x30($29)
/* 0EA8A8 001EA7A8 2000B27F */  sq          $18, 0x20($29)
/* 0EA8AC 001EA7AC 1000B17F */  sq          $17, 0x10($29)
/* 0EA8B0 001EA7B0 0000B07F */  sq          $16, 0x0($29)
/* 0EA8B4 001EA7B4 28260070 */  paddub      $4, $0, $0
/* 0EA8B8 001EA7B8 046F050C */  jal         setbilinear__Fi
/* 0EA8BC 001EA7BC 00000000 */   nop
/* 0EA8C0 001EA7C0 DA01023C */  lui         $2, %hi(MenuCamera)
/* 0EA8C4 001EA7C4 D0084424 */  addiu       $4, $2, %lo(MenuCamera)
/* 0EA8C8 001EA7C8 7CAF080C */  jal         MenuWorldTrans__FP7CCamera
/* 0EA8CC 001EA7CC 00000000 */   nop
/* 0EA8D0 001EA7D0 40000424 */  addiu       $4, $0, 0x40
/* 0EA8D4 001EA7D4 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EA8D8 001EA7D8 50022384 */  lh          $3, %lo(ShopMenu + 0x180)($1)
/* 0EA8DC 001EA7DC 02000224 */  addiu       $2, $0, 0x2
/* 0EA8E0 001EA7E0 0E006210 */  beq         $3, $2, .L001EA81C
/* 0EA8E4 001EA7E4 00000000 */   nop
/* 0EA8E8 001EA7E8 01000224 */  addiu       $2, $0, 0x1
/* 0EA8EC 001EA7EC 03006210 */  beq         $3, $2, .L001EA7FC
/* 0EA8F0 001EA7F0 00000000 */   nop
/* 0EA8F4 001EA7F4 0E000010 */  b           .L001EA830
/* 0EA8F8 001EA7F8 00000000 */   nop
.L001EA7FC:
/* 0EA8FC 001EA7FC 80000424 */  addiu       $4, $0, 0x80
/* 0EA900 001EA800 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0EA904 001EA804 5402238C */  lw          $3, %lo(ShopMenu + 0x184)($1)
/* 0EA908 001EA808 40100300 */  sll         $2, $3, 1
/* 0EA90C 001EA80C 21104300 */  addu        $2, $2, $3
/* 0EA910 001EA810 23208200 */  subu        $4, $4, $2
/* 0EA914 001EA814 06000010 */  b           .L001EA830
/* 0EA918 001EA818 00000000 */   nop
.L001EA81C:
/* 0EA91C 001EA81C D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0EA920 001EA820 5402238C */  lw          $3, %lo(ShopMenu + 0x184)($1)
/* 0EA924 001EA824 40100300 */  sll         $2, $3, 1
/* 0EA928 001EA828 21104300 */  addu        $2, $2, $3
/* 0EA92C 001EA82C 40004424 */  addiu       $4, $2, 0x40
.L001EA830:
/* 0EA930 001EA830 40008128 */  slti        $1, $4, 0x40
/* 0EA934 001EA834 02002010 */  beqz        $1, .L001EA840
/* 0EA938 001EA838 00000000 */   nop
/* 0EA93C 001EA83C 40000424 */  addiu       $4, $0, 0x40
.L001EA840:
/* 0EA940 001EA840 81008128 */  slti        $1, $4, 0x81
/* 0EA944 001EA844 02002014 */  bnez        $1, .L001EA850
/* 0EA948 001EA848 00000000 */   nop
/* 0EA94C 001EA84C 80000424 */  addiu       $4, $0, 0x80
.L001EA850:
/* 0EA950 001EA850 80000524 */  addiu       $5, $0, 0x80
/* 0EA954 001EA854 ACB4080C */  jal         FrameImageDraw__Fii
/* 0EA958 001EA858 00000000 */   nop
/* 0EA95C 001EA85C D901013C */  lui         $1, %hi(ShopMenu + 0x188)
/* 0EA960 001EA860 58022284 */  lh          $2, %lo(ShopMenu + 0x188)($1)
/* 0EA964 001EA864 DA004010 */  beqz        $2, .L001EABD0
/* 0EA968 001EA868 00000000 */   nop
/* 0EA96C 001EA86C D901013C */  lui         $1, %hi(ShopMenu + 0x18A)
/* 0EA970 001EA870 5A022484 */  lh          $4, %lo(ShopMenu + 0x18A)($1)
/* 0EA974 001EA874 38B4080C */  jal         MenuTextureReload__Fi
/* 0EA978 001EA878 00000000 */   nop
/* 0EA97C 001EA87C 54010424 */  addiu       $4, $0, 0x154
/* 0EA980 001EA880 84000524 */  addiu       $5, $0, 0x84
/* 0EA984 001EA884 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0EA988 001EA888 DC00268C */  lw          $6, %lo(ShopMenu + 0xC)($1)
/* 0EA98C 001EA88C 80000724 */  addiu       $7, $0, 0x80
/* 0EA990 001EA890 28460070 */  paddub      $8, $0, $0
/* 0EA994 001EA894 F4BD080C */  jal         DrawPersonalBoard__Fiiiii
/* 0EA998 001EA898 00000000 */   nop
/* 0EA99C 001EA89C 32020424 */  addiu       $4, $0, 0x232
/* 0EA9A0 001EA8A0 18010524 */  addiu       $5, $0, 0x118
/* 0EA9A4 001EA8A4 80000624 */  addiu       $6, $0, 0x80
/* 0EA9A8 001EA8A8 18C4080C */  jal         CommonTrushDraw__Fiii
/* 0EA9AC 001EA8AC 00000000 */   nop
/* 0EA9B0 001EA8B0 8494828F */  lw          $2, -0x6B7C($28)
/* 0EA9B4 001EA8B4 46434694 */  lhu         $6, 0x4346($2)
/* 0EA9B8 001EA8B8 63010424 */  addiu       $4, $0, 0x163
/* 0EA9BC 001EA8BC 2C010524 */  addiu       $5, $0, 0x12C
/* 0EA9C0 001EA8C0 80000724 */  addiu       $7, $0, 0x80
/* 0EA9C4 001EA8C4 D8C4080C */  jal         CommonMoneyBoardDraw__Fiiii
/* 0EA9C8 001EA8C8 00000000 */   nop
/* 0EA9CC 001EA8CC 32000424 */  addiu       $4, $0, 0x32
/* 0EA9D0 001EA8D0 84000524 */  addiu       $5, $0, 0x84
/* 0EA9D4 001EA8D4 80000624 */  addiu       $6, $0, 0x80
/* 0EA9D8 001EA8D8 D0AB070C */  jal         ChargeShopBoardDraw__Fiii
/* 0EA9DC 001EA8DC 00000000 */   nop
/* 0EA9E0 001EA8E0 B894828F */  lw          $2, -0x6B48($28)
/* 0EA9E4 001EA8E4 10004284 */  lh          $2, 0x10($2)
/* 0EA9E8 001EA8E8 51004128 */  slti        $1, $2, 0x51
/* 0EA9EC 001EA8EC 04002010 */  beqz        $1, .L001EA900
/* 0EA9F0 001EA8F0 00000000 */   nop
/* 0EA9F4 001EA8F4 80000424 */  addiu       $4, $0, 0x80
/* 0EA9F8 001EA8F8 C89C070C */  jal         ChargeShopLRDraw__Fi
/* 0EA9FC 001EA8FC 00000000 */   nop
.L001EA900:
/* 0EAA00 001EA900 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EAA04 001EA904 50022384 */  lh          $3, %lo(ShopMenu + 0x180)($1)
/* 0EAA08 001EA908 18000224 */  addiu       $2, $0, 0x18
/* 0EAA0C 001EA90C 4B006210 */  beq         $3, $2, .L001EAA3C
/* 0EAA10 001EA910 00000000 */   nop
/* 0EAA14 001EA914 19000224 */  addiu       $2, $0, 0x19
/* 0EAA18 001EA918 48006210 */  beq         $3, $2, .L001EAA3C
/* 0EAA1C 001EA91C 00000000 */   nop
/* 0EAA20 001EA920 01000010 */  b           .L001EA928
/* 0EAA24 001EA924 00000000 */   nop
.L001EA928:
/* 0EAA28 001EA928 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0EAA2C 001EA92C D2002384 */  lh          $3, %lo(ShopMenu + 0x2)($1)
/* 0EAA30 001EA930 01000224 */  addiu       $2, $0, 0x1
/* 0EAA34 001EA934 0A006210 */  beq         $3, $2, .L001EA960
/* 0EAA38 001EA938 00000000 */   nop
/* 0EAA3C 001EA93C 03006010 */  beqz        $3, .L001EA94C
/* 0EAA40 001EA940 00000000 */   nop
/* 0EAA44 001EA944 0A000010 */  b           .L001EA970
/* 0EAA48 001EA948 00000000 */   nop
.L001EA94C:
/* 0EAA4C 001EA94C 22001024 */  addiu       $16, $0, 0x22
/* 0EAA50 001EA950 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EAA54 001EA954 46023190 */  lbu         $17, %lo(ShopMenu + 0x176)($1)
/* 0EAA58 001EA958 05000010 */  b           .L001EA970
/* 0EAA5C 001EA95C 00000000 */   nop
.L001EA960:
/* 0EAA60 001EA960 44011024 */  addiu       $16, $0, 0x144
/* 0EAA64 001EA964 D901013C */  lui         $1, %hi(ShopMenu + 0x20)
/* 0EAA68 001EA968 F000318C */  lw          $17, %lo(ShopMenu + 0x20)($1)
/* 0EAA6C 001EA96C 00000000 */  nop
.L001EA970:
/* 0EAA70 001EA970 B894828F */  lw          $2, -0x6B48($28)
/* 0EAA74 001EA974 10004284 */  lh          $2, 0x10($2)
/* 0EAA78 001EA978 51004228 */  slti        $2, $2, 0x51
/* 0EAA7C 001EA97C 04004014 */  bnez        $2, .L001EA990
/* 0EAA80 001EA980 00000000 */   nop
/* 0EAA84 001EA984 02001224 */  addiu       $18, $0, 0x2
/* 0EAA88 001EA988 22000010 */  b           .L001EAA14
/* 0EAA8C 001EA98C 00000000 */   nop
.L001EA990:
/* 0EAA90 001EA990 15006010 */  beqz        $3, .L001EA9E8
/* 0EAA94 001EA994 00000000 */   nop
/* 0EAA98 001EA998 01000224 */  addiu       $2, $0, 0x1
/* 0EAA9C 001EA99C 03006210 */  beq         $3, $2, .L001EA9AC
/* 0EAAA0 001EA9A0 00000000 */   nop
/* 0EAAA4 001EA9A4 1B000010 */  b           .L001EAA14
/* 0EAAA8 001EA9A8 00000000 */   nop
.L001EA9AC:
/* 0EAAAC 001EA9AC D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0EAAB0 001EA9B0 DC00248C */  lw          $4, %lo(ShopMenu + 0xC)($1)
/* 0EAAB4 001EA9B4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EAAB8 001EA9B8 E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0EAABC 001EA9BC 38C5080C */  jal         SearchBoardNowPosItemExist__Fii
/* 0EAAC0 001EA9C0 00000000 */   nop
/* 0EAAC4 001EA9C4 28964070 */  paddub      $18, $2, $0
/* 0EAAC8 001EA9C8 0400401E */  bgtz        $18, .L001EA9DC
/* 0EAACC 001EA9CC 00000000 */   nop
/* 0EAAD0 001EA9D0 28960070 */  paddub      $18, $0, $0
/* 0EAAD4 001EA9D4 0F000010 */  b           .L001EAA14
/* 0EAAD8 001EA9D8 00000000 */   nop
.L001EA9DC:
/* 0EAADC 001EA9DC 01001224 */  addiu       $18, $0, 0x1
/* 0EAAE0 001EA9E0 0C000010 */  b           .L001EAA14
/* 0EAAE4 001EA9E4 00000000 */   nop
.L001EA9E8:
/* 0EAAE8 001EA9E8 8C94848F */  lw          $4, -0x6B74($28)
/* 0EAAEC 001EA9EC D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EAAF0 001EA9F0 E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0EAAF4 001EA9F4 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0EAAF8 001EA9F8 DC00268C */  lw          $6, %lo(ShopMenu + 0xC)($1)
/* 0EAAFC 001EA9FC 80FD080C */  jal         SearchSpace__10CStockItemFii
/* 0EAB00 001EAA00 00000000 */   nop
/* 0EAB04 001EAA04 28964070 */  paddub      $18, $2, $0
/* 0EAB08 001EAA08 0200401A */  blez        $18, .L001EAA14
/* 0EAB0C 001EAA0C 00000000 */   nop
/* 0EAB10 001EAA10 01001224 */  addiu       $18, $0, 0x1
.L001EAA14:
/* 0EAB14 001EAA14 28260072 */  paddub      $4, $16, $0
/* 0EAB18 001EAA18 90000524 */  addiu       $5, $0, 0x90
/* 0EAB1C 001EAA1C D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EAB20 001EAA20 E400268C */  lw          $6, %lo(ShopMenu + 0x14)($1)
/* 0EAB24 001EAA24 283E2072 */  paddub      $7, $17, $0
/* 0EAB28 001EAA28 28460070 */  paddub      $8, $0, $0
/* 0EAB2C 001EAA2C 284E4072 */  paddub      $9, $18, $0
/* 0EAB30 001EAA30 80000A24 */  addiu       $10, $0, 0x80
/* 0EAB34 001EAA34 349D070C */  jal         ShopCurDraw__Fiiiiiii
/* 0EAB38 001EAA38 00000000 */   nop
.L001EAA3C:
/* 0EAB3C 001EAA3C 4C000424 */  addiu       $4, $0, 0x4C
/* 0EAB40 001EAA40 2A000524 */  addiu       $5, $0, 0x2A
/* 0EAB44 001EAA44 01000624 */  addiu       $6, $0, 0x1
/* 0EAB48 001EAA48 80000724 */  addiu       $7, $0, 0x80
/* 0EAB4C 001EAA4C F49D070C */  jal         DrawShopIcon__Fiiii
/* 0EAB50 001EAA50 00000000 */   nop
/* 0EAB54 001EAA54 D901023C */  lui         $2, %hi(ShopDataMove)
/* 0EAB58 001EAA58 80024424 */  addiu       $4, $2, %lo(ShopDataMove)
/* 0EAB5C 001EAA5C 809B070C */  jal         IconAutoMoveDraw__12ShopIconMoveFv
/* 0EAB60 001EAA60 00000000 */   nop
/* 0EAB64 001EAA64 C4948587 */  lh          $5, -0x6B3C($28)
/* 0EAB68 001EAA68 D901023C */  lui         $2, %hi(ShopDataMove)
/* 0EAB6C 001EAA6C 80024424 */  addiu       $4, $2, %lo(ShopDataMove)
/* 0EAB70 001EAA70 28360070 */  paddub      $6, $0, $0
/* 0EAB74 001EAA74 689A070C */  jal         IconAutoMove__12ShopIconMoveFii
/* 0EAB78 001EAA78 00000000 */   nop
/* 0EAB7C 001EAA7C D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EAB80 001EAA80 50022684 */  lh          $6, %lo(ShopMenu + 0x180)($1)
/* 0EAB84 001EAA84 11000224 */  addiu       $2, $0, 0x11
/* 0EAB88 001EAA88 0400C210 */  beq         $6, $2, .L001EAA9C
/* 0EAB8C 001EAA8C 00000000 */   nop
/* 0EAB90 001EAA90 12000224 */  addiu       $2, $0, 0x12
/* 0EAB94 001EAA94 2A00C214 */  bne         $6, $2, .L001EAB40
/* 0EAB98 001EAA98 00000000 */   nop
.L001EAA9C:
/* 0EAB9C 001EAA9C 6000A327 */  addiu       $3, $29, 0x60
/* 0EABA0 001EAAA0 088882DF */  ld          $2, -0x77F8($28)
/* 0EABA4 001EAAA4 000062FC */  sd          $2, 0x0($3)
/* 0EABA8 001EAAA8 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x16BC)
/* 0EABAC 001EAAAC 4C22238C */  lw          $3, %lo(CommonMenuMes1 + 0x16BC)($1)
/* 0EABB0 001EAAB0 80100600 */  sll         $2, $6, 2
/* 0EABB4 001EAAB4 21105D00 */  addu        $2, $2, $29
/* 0EABB8 001EAAB8 1C00458C */  lw          $5, 0x1C($2)
/* 0EABBC 001EAABC 05006510 */  beq         $3, $5, .L001EAAD4
/* 0EABC0 001EAAC0 00000000 */   nop
/* 0EABC4 001EAAC4 DA01023C */  lui         $2, %hi(CommonMenuMes1)
/* 0EABC8 001EAAC8 900B4424 */  addiu       $4, $2, %lo(CommonMenuMes1)
/* 0EABCC 001EAACC 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0EABD0 001EAAD0 00000000 */   nop
.L001EAAD4:
/* 0EABD4 001EAAD4 4A010224 */  addiu       $2, $0, 0x14A
/* 0EABD8 001EAAD8 DA01013C */  lui         $1, %hi(CommonMenuMes1)
/* 0EABDC 001EAADC 900B22AC */  sw          $2, %lo(CommonMenuMes1)($1)
/* 0EABE0 001EAAE0 BE000224 */  addiu       $2, $0, 0xBE
/* 0EABE4 001EAAE4 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x4)
/* 0EABE8 001EAAE8 940B22AC */  sw          $2, %lo(CommonMenuMes1 + 0x4)($1)
/* 0EABEC 001EAAEC D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EABF0 001EAAF0 50022384 */  lh          $3, %lo(ShopMenu + 0x180)($1)
/* 0EABF4 001EAAF4 11000224 */  addiu       $2, $0, 0x11
/* 0EABF8 001EAAF8 04006214 */  bne         $3, $2, .L001EAB0C
/* 0EABFC 001EAAFC 00000000 */   nop
/* 0EAC00 001EAB00 96000224 */  addiu       $2, $0, 0x96
/* 0EAC04 001EAB04 DA01013C */  lui         $1, %hi(CommonMenuMes1)
/* 0EAC08 001EAB08 900B22AC */  sw          $2, %lo(CommonMenuMes1)($1)
.L001EAB0C:
/* 0EAC0C 001EAB0C 01000224 */  addiu       $2, $0, 0x1
/* 0EAC10 001EAB10 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x98)
/* 0EAC14 001EAB14 280C22AC */  sw          $2, %lo(CommonMenuMes1 + 0x98)($1)
/* 0EAC18 001EAB18 DA01023C */  lui         $2, %hi(CommonMenuMes1)
/* 0EAC1C 001EAB1C 900B4424 */  addiu       $4, $2, %lo(CommonMenuMes1)
/* 0EAC20 001EAB20 6437050C */  jal         Step__6ClsMesFv
/* 0EAC24 001EAB24 00000000 */   nop
/* 0EAC28 001EAB28 DA01023C */  lui         $2, %hi(CommonMenuMes1)
/* 0EAC2C 001EAB2C 900B4424 */  addiu       $4, $2, %lo(CommonMenuMes1)
/* 0EAC30 001EAB30 C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 0EAC34 001EAB34 00000000 */   nop
/* 0EAC38 001EAB38 03000010 */  b           .L001EAB48
/* 0EAC3C 001EAB3C 00000000 */   nop
.L001EAB40:
/* 0EAC40 001EAB40 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x98)
/* 0EAC44 001EAB44 280C20AC */  sw          $0, %lo(CommonMenuMes1 + 0x98)($1)
.L001EAB48:
/* 0EAC48 001EAB48 A8948CC7 */  lwc1        $f12, -0x6B58($28)
/* 0EAC4C 001EAB4C 2C44040C */  jal         fptosi
/* 0EAC50 001EAB50 00000000 */   nop
/* 0EAC54 001EAB54 28864070 */  paddub      $16, $2, $0
/* 0EAC58 001EAB58 AC948CC7 */  lwc1        $f12, -0x6B54($28)
/* 0EAC5C 001EAB5C 2C44040C */  jal         fptosi
/* 0EAC60 001EAB60 00000000 */   nop
/* 0EAC64 001EAB64 28260072 */  paddub      $4, $16, $0
/* 0EAC68 001EAB68 282E4070 */  paddub      $5, $2, $0
/* 0EAC6C 001EAB6C B4948CC7 */  lwc1        $f12, -0x6B4C($28)
/* 0EAC70 001EAB70 B0948DC7 */  lwc1        $f13, -0x6B50($28)
/* 0EAC74 001EAB74 80000624 */  addiu       $6, $0, 0x80
/* 0EAC78 001EAB78 985E080C */  jal         MenuHelpWinDraw__Fiiffi
/* 0EAC7C 001EAB7C 00000000 */   nop
/* 0EAC80 001EAB80 6800A427 */  addiu       $4, $29, 0x68
/* 0EAC84 001EAB84 6C00A527 */  addiu       $5, $29, 0x6C
/* 0EAC88 001EAB88 F0B8080C */  jal         GetMainMenuRightHelpMsgLangOffset__FRiRi
/* 0EAC8C 001EAB8C 00000000 */   nop
/* 0EAC90 001EAB90 A89481C7 */  lwc1        $f1, -0x6B58($28)
/* 0EAC94 001EAB94 6800A0C7 */  lwc1        $f0, 0x68($29)
/* 0EAC98 001EAB98 20008046 */  cvt.s.w     $f0, $f0
/* 0EAC9C 001EAB9C 000B0046 */  add.s       $f12, $f1, $f0
/* 0EACA0 001EABA0 2C44040C */  jal         fptosi
/* 0EACA4 001EABA4 00000000 */   nop
/* 0EACA8 001EABA8 DA01013C */  lui         $1, %hi(CommonMenuMes2)
/* 0EACAC 001EABAC 502322AC */  sw          $2, %lo(CommonMenuMes2)($1)
/* 0EACB0 001EABB0 AC9481C7 */  lwc1        $f1, -0x6B54($28)
/* 0EACB4 001EABB4 6C00A0C7 */  lwc1        $f0, 0x6C($29)
/* 0EACB8 001EABB8 20008046 */  cvt.s.w     $f0, $f0
/* 0EACBC 001EABBC 000B0046 */  add.s       $f12, $f1, $f0
/* 0EACC0 001EABC0 2C44040C */  jal         fptosi
/* 0EACC4 001EABC4 00000000 */   nop
/* 0EACC8 001EABC8 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x4)
/* 0EACCC 001EABCC 542322AC */  sw          $2, %lo(CommonMenuMes2 + 0x4)($1)
.L001EABD0:
/* 0EACD0 001EABD0 D901013C */  lui         $1, %hi(ShopMenu + 0x194)
/* 0EACD4 001EABD4 64022384 */  lh          $3, %lo(ShopMenu + 0x194)($1)
/* 0EACD8 001EABD8 02000224 */  addiu       $2, $0, 0x2
/* 0EACDC 001EABDC 05006214 */  bne         $3, $2, .L001EABF4
/* 0EACE0 001EABE0 00000000 */   nop
/* 0EACE4 001EABE4 D901013C */  lui         $1, %hi(ShopMenu)
/* 0EACE8 001EABE8 D0002484 */  lh          $4, %lo(ShopMenu)($1)
/* 0EACEC 001EABEC DCA0070C */  jal         ShopPersonDraw__Fi
/* 0EACF0 001EABF0 00000000 */   nop
.L001EABF4:
/* 0EACF4 001EABF4 D901013C */  lui         $1, %hi(ShopMenu + 0x188)
/* 0EACF8 001EABF8 58022284 */  lh          $2, %lo(ShopMenu + 0x188)($1)
/* 0EACFC 001EABFC 42004010 */  beqz        $2, .L001EAD08
/* 0EAD00 001EAC00 00000000 */   nop
/* 0EAD04 001EAC04 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x174C)
/* 0EAD08 001EAC08 9C3A248C */  lw          $4, %lo(CommonMenuMes2 + 0x174C)($1)
/* 0EAD0C 001EAC0C 38B4080C */  jal         MenuTextureReload__Fi
/* 0EAD10 001EAC10 00000000 */   nop
/* 0EAD14 001EAC14 DA01023C */  lui         $2, %hi(CommonMenuMes2)
/* 0EAD18 001EAC18 50234424 */  addiu       $4, $2, %lo(CommonMenuMes2)
/* 0EAD1C 001EAC1C 6437050C */  jal         Step__6ClsMesFv
/* 0EAD20 001EAC20 00000000 */   nop
/* 0EAD24 001EAC24 DA01023C */  lui         $2, %hi(CommonMenuMes2)
/* 0EAD28 001EAC28 50234424 */  addiu       $4, $2, %lo(CommonMenuMes2)
/* 0EAD2C 001EAC2C C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 0EAD30 001EAC30 00000000 */   nop
/* 0EAD34 001EAC34 B894828F */  lw          $2, -0x6B48($28)
/* 0EAD38 001EAC38 10004284 */  lh          $2, 0x10($2)
/* 0EAD3C 001EAC3C 51004128 */  slti        $1, $2, 0x51
/* 0EAD40 001EAC40 31002010 */  beqz        $1, .L001EAD08
/* 0EAD44 001EAC44 00000000 */   nop
/* 0EAD48 001EAC48 19050524 */  addiu       $5, $0, 0x519
/* 0EAD4C 001EAC4C 2900023C */  lui         $2, %hi(LIT_1363__2)
/* 0EAD50 001EAC50 70274224 */  addiu       $2, $2, %lo(LIT_1363__2)
/* 0EAD54 001EAC54 4000A627 */  addiu       $6, $29, 0x40
/* 0EAD58 001EAC58 00004478 */  lq          $4, 0x0($2)
/* 0EAD5C 001EAC5C 100043DC */  ld          $3, 0x10($2)
/* 0EAD60 001EAC60 180042C4 */  lwc1        $f2, 0x18($2)
/* 0EAD64 001EAC64 0000C47C */  sq          $4, 0x0($6)
/* 0EAD68 001EAC68 1000C3FC */  sd          $3, 0x10($6)
/* 0EAD6C 001EAC6C 1800C2E4 */  swc1        $f2, 0x18($6)
/* 0EAD70 001EAC70 D901013C */  lui         $1, %hi(ShopMenu + 0x190)
/* 0EAD74 001EAC74 60022284 */  lh          $2, %lo(ShopMenu + 0x190)($1)
/* 0EAD78 001EAC78 80100200 */  sll         $2, $2, 2
/* 0EAD7C 001EAC7C 21205D00 */  addu        $4, $2, $29
/* 0EAD80 001EAC80 40008284 */  lh          $2, 0x40($4)
/* 0EAD84 001EAC84 DA01013C */  lui         $1, %hi(AtoraNameMes)
/* 0EAD88 001EAC88 D05222AC */  sw          $2, %lo(AtoraNameMes)($1)
/* 0EAD8C 001EAC8C D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0EAD90 001EAC90 D2002384 */  lh          $3, %lo(ShopMenu + 0x2)($1)
/* 0EAD94 001EAC94 01000224 */  addiu       $2, $0, 0x1
/* 0EAD98 001EAC98 05006214 */  bne         $3, $2, .L001EACB0
/* 0EAD9C 001EAC9C 00000000 */   nop
/* 0EADA0 001EACA0 18050524 */  addiu       $5, $0, 0x518
/* 0EADA4 001EACA4 42008284 */  lh          $2, 0x42($4)
/* 0EADA8 001EACA8 DA01013C */  lui         $1, %hi(AtoraNameMes)
/* 0EADAC 001EACAC D05222AC */  sw          $2, %lo(AtoraNameMes)($1)
.L001EACB0:
/* 0EADB0 001EACB0 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x16BC)
/* 0EADB4 001EACB4 8C69228C */  lw          $2, %lo(AtoraNameMes + 0x16BC)($1)
/* 0EADB8 001EACB8 05004510 */  beq         $2, $5, .L001EACD0
/* 0EADBC 001EACBC 00000000 */   nop
/* 0EADC0 001EACC0 DA01023C */  lui         $2, %hi(AtoraNameMes)
/* 0EADC4 001EACC4 D0524424 */  addiu       $4, $2, %lo(AtoraNameMes)
/* 0EADC8 001EACC8 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0EADCC 001EACCC 00000000 */   nop
.L001EACD0:
/* 0EADD0 001EACD0 01000224 */  addiu       $2, $0, 0x1
/* 0EADD4 001EACD4 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x98)
/* 0EADD8 001EACD8 685322AC */  sw          $2, %lo(AtoraNameMes + 0x98)($1)
/* 0EADDC 001EACDC 62010224 */  addiu       $2, $0, 0x162
/* 0EADE0 001EACE0 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x4)
/* 0EADE4 001EACE4 D45222AC */  sw          $2, %lo(AtoraNameMes + 0x4)($1)
/* 0EADE8 001EACE8 DA01023C */  lui         $2, %hi(AtoraNameMes)
/* 0EADEC 001EACEC D0524424 */  addiu       $4, $2, %lo(AtoraNameMes)
/* 0EADF0 001EACF0 6437050C */  jal         Step__6ClsMesFv
/* 0EADF4 001EACF4 00000000 */   nop
/* 0EADF8 001EACF8 DA01023C */  lui         $2, %hi(AtoraNameMes)
/* 0EADFC 001EACFC D0524424 */  addiu       $4, $2, %lo(AtoraNameMes)
/* 0EAE00 001EAD00 C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 0EAE04 001EAD04 00000000 */   nop
.L001EAD08:
/* 0EAE08 001EAD08 28260070 */  paddub      $4, $0, $0
/* 0EAE0C 001EAD0C B8B5070C */  jal         ShopModelMsgFunc__Fi
/* 0EAE10 001EAD10 00000000 */   nop
/* 0EAE14 001EAD14 A89F070C */  jal         ShopFadeoutDraw__Fv
/* 0EAE18 001EAD18 00000000 */   nop
/* 0EAE1C 001EAD1C 01000424 */  addiu       $4, $0, 0x1
/* 0EAE20 001EAD20 046F050C */  jal         setbilinear__Fi
/* 0EAE24 001EAD24 00000000 */   nop
/* 0EAE28 001EAD28 3000BF7B */  lq          $31, 0x30($29)
/* 0EAE2C 001EAD2C 2000B27B */  lq          $18, 0x20($29)
/* 0EAE30 001EAD30 1000B17B */  lq          $17, 0x10($29)
/* 0EAE34 001EAD34 0000B07B */  lq          $16, 0x0($29)
/* 0EAE38 001EAD38 7000BD27 */  addiu       $29, $29, 0x70
/* 0EAE3C 001EAD3C 0800E003 */  jr          $31
/* 0EAE40 001EAD40 00000000 */   nop
/* 0EAE44 001EAD44 00000000 */  nop
/* 0EAE48 001EAD48 00000000 */  nop
/* 0EAE4C 001EAD4C 00000000 */  nop
