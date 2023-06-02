.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawChargeShop__Fv
/* EA8A0 001EA7A0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* EA8A4 001EA7A4 3000BF7F */  sq         $31, 0x30($sp)
/* EA8A8 001EA7A8 2000B27F */  sq         $18, 0x20($sp)
/* EA8AC 001EA7AC 1000B17F */  sq         $17, 0x10($sp)
/* EA8B0 001EA7B0 0000B07F */  sq         $16, 0x0($sp)
/* EA8B4 001EA7B4 28260070 */  paddub     $4, $0, $0
/* EA8B8 001EA7B8 046F050C */  jal        setbilinear__Fi
/* EA8BC 001EA7BC 00000000 */   nop
/* EA8C0 001EA7C0 DA01023C */  lui        $2, %hi(MenuCamera)
/* EA8C4 001EA7C4 D0084424 */  addiu      $4, $2, %lo(MenuCamera)
/* EA8C8 001EA7C8 7CAF080C */  jal        MenuWorldTrans__FP7CCamera
/* EA8CC 001EA7CC 00000000 */   nop
/* EA8D0 001EA7D0 40000424 */  addiu      $4, $0, 0x40
/* EA8D4 001EA7D4 D901013C */  lui        $at, (0x1D90250 >> 16)
/* EA8D8 001EA7D8 50022384 */  lh         $3, (0x1D90250 & 0xFFFF)($at)
/* EA8DC 001EA7DC 02000224 */  addiu      $2, $0, 0x2
/* EA8E0 001EA7E0 0E006210 */  beq        $3, $2, .L001EA81C
/* EA8E4 001EA7E4 00000000 */   nop
/* EA8E8 001EA7E8 01000224 */  addiu      $2, $0, 0x1
/* EA8EC 001EA7EC 03006210 */  beq        $3, $2, .L001EA7FC
/* EA8F0 001EA7F0 00000000 */   nop
/* EA8F4 001EA7F4 0E000010 */  b          .L001EA830
/* EA8F8 001EA7F8 00000000 */   nop
.L001EA7FC:
/* EA8FC 001EA7FC 80000424 */  addiu      $4, $0, 0x80
/* EA900 001EA800 D901013C */  lui        $at, (0x1D90254 >> 16)
/* EA904 001EA804 5402238C */  lw         $3, (0x1D90254 & 0xFFFF)($at)
/* EA908 001EA808 40100300 */  sll        $2, $3, 1
/* EA90C 001EA80C 21104300 */  addu       $2, $2, $3
/* EA910 001EA810 23208200 */  subu       $4, $4, $2
/* EA914 001EA814 06000010 */  b          .L001EA830
/* EA918 001EA818 00000000 */   nop
.L001EA81C:
/* EA91C 001EA81C D901013C */  lui        $at, (0x1D90254 >> 16)
/* EA920 001EA820 5402238C */  lw         $3, (0x1D90254 & 0xFFFF)($at)
/* EA924 001EA824 40100300 */  sll        $2, $3, 1
/* EA928 001EA828 21104300 */  addu       $2, $2, $3
/* EA92C 001EA82C 40004424 */  addiu      $4, $2, 0x40
.L001EA830:
/* EA930 001EA830 40008128 */  slti       $at, $4, 0x40
/* EA934 001EA834 02002010 */  beqz       $at, .L001EA840
/* EA938 001EA838 00000000 */   nop
/* EA93C 001EA83C 40000424 */  addiu      $4, $0, 0x40
.L001EA840:
/* EA940 001EA840 81008128 */  slti       $at, $4, 0x81
/* EA944 001EA844 02002014 */  bnez       $at, .L001EA850
/* EA948 001EA848 00000000 */   nop
/* EA94C 001EA84C 80000424 */  addiu      $4, $0, 0x80
.L001EA850:
/* EA950 001EA850 80000524 */  addiu      $5, $0, 0x80
/* EA954 001EA854 ACB4080C */  jal        FrameImageDraw__Fii
/* EA958 001EA858 00000000 */   nop
/* EA95C 001EA85C D901013C */  lui        $at, (0x1D90258 >> 16)
/* EA960 001EA860 58022284 */  lh         $2, (0x1D90258 & 0xFFFF)($at)
/* EA964 001EA864 DA004010 */  beqz       $2, .L001EABD0
/* EA968 001EA868 00000000 */   nop
/* EA96C 001EA86C D901013C */  lui        $at, (0x1D9025A >> 16)
/* EA970 001EA870 5A022484 */  lh         $4, (0x1D9025A & 0xFFFF)($at)
/* EA974 001EA874 38B4080C */  jal        MenuTextureReload__Fi
/* EA978 001EA878 00000000 */   nop
/* EA97C 001EA87C 54010424 */  addiu      $4, $0, 0x154
/* EA980 001EA880 84000524 */  addiu      $5, $0, 0x84
/* EA984 001EA884 D901013C */  lui        $at, (0x1D900DC >> 16)
/* EA988 001EA888 DC00268C */  lw         $6, (0x1D900DC & 0xFFFF)($at)
/* EA98C 001EA88C 80000724 */  addiu      $7, $0, 0x80
/* EA990 001EA890 28460070 */  paddub     $8, $0, $0
/* EA994 001EA894 F4BD080C */  jal        DrawPersonalBoard__Fiiiii
/* EA998 001EA898 00000000 */   nop
/* EA99C 001EA89C 32020424 */  addiu      $4, $0, 0x232
/* EA9A0 001EA8A0 18010524 */  addiu      $5, $0, 0x118
/* EA9A4 001EA8A4 80000624 */  addiu      $6, $0, 0x80
/* EA9A8 001EA8A8 18C4080C */  jal        CommonTrushDraw__Fiii
/* EA9AC 001EA8AC 00000000 */   nop
/* EA9B0 001EA8B0 8494828F */  lw         $2, -0x6B7C($gp)
/* EA9B4 001EA8B4 46434694 */  lhu        $6, 0x4346($2)
/* EA9B8 001EA8B8 63010424 */  addiu      $4, $0, 0x163
/* EA9BC 001EA8BC 2C010524 */  addiu      $5, $0, 0x12C
/* EA9C0 001EA8C0 80000724 */  addiu      $7, $0, 0x80
/* EA9C4 001EA8C4 D8C4080C */  jal        CommonMoneyBoardDraw__Fiiii
/* EA9C8 001EA8C8 00000000 */   nop
/* EA9CC 001EA8CC 32000424 */  addiu      $4, $0, 0x32
/* EA9D0 001EA8D0 84000524 */  addiu      $5, $0, 0x84
/* EA9D4 001EA8D4 80000624 */  addiu      $6, $0, 0x80
/* EA9D8 001EA8D8 D0AB070C */  jal        ChargeShopBoardDraw__Fiii
/* EA9DC 001EA8DC 00000000 */   nop
/* EA9E0 001EA8E0 B894828F */  lw         $2, -0x6B48($gp)
/* EA9E4 001EA8E4 10004284 */  lh         $2, 0x10($2)
/* EA9E8 001EA8E8 51004128 */  slti       $at, $2, 0x51
/* EA9EC 001EA8EC 04002010 */  beqz       $at, .L001EA900
/* EA9F0 001EA8F0 00000000 */   nop
/* EA9F4 001EA8F4 80000424 */  addiu      $4, $0, 0x80
/* EA9F8 001EA8F8 C89C070C */  jal        ChargeShopLRDraw__Fi
/* EA9FC 001EA8FC 00000000 */   nop
.L001EA900:
/* EAA00 001EA900 D901013C */  lui        $at, (0x1D90250 >> 16)
/* EAA04 001EA904 50022384 */  lh         $3, (0x1D90250 & 0xFFFF)($at)
/* EAA08 001EA908 18000224 */  addiu      $2, $0, 0x18
/* EAA0C 001EA90C 4B006210 */  beq        $3, $2, .L001EAA3C
/* EAA10 001EA910 00000000 */   nop
/* EAA14 001EA914 19000224 */  addiu      $2, $0, 0x19
/* EAA18 001EA918 48006210 */  beq        $3, $2, .L001EAA3C
/* EAA1C 001EA91C 00000000 */   nop
/* EAA20 001EA920 01000010 */  b          .L001EA928
/* EAA24 001EA924 00000000 */   nop
.L001EA928:
/* EAA28 001EA928 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* EAA2C 001EA92C D2002384 */  lh         $3, (0x1D900D2 & 0xFFFF)($at)
/* EAA30 001EA930 01000224 */  addiu      $2, $0, 0x1
/* EAA34 001EA934 0A006210 */  beq        $3, $2, .L001EA960
/* EAA38 001EA938 00000000 */   nop
/* EAA3C 001EA93C 03006010 */  beqz       $3, .L001EA94C
/* EAA40 001EA940 00000000 */   nop
/* EAA44 001EA944 0A000010 */  b          .L001EA970
/* EAA48 001EA948 00000000 */   nop
.L001EA94C:
/* EAA4C 001EA94C 22001024 */  addiu      $16, $0, 0x22
/* EAA50 001EA950 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EAA54 001EA954 46023190 */  lbu        $17, (0x1D90246 & 0xFFFF)($at)
/* EAA58 001EA958 05000010 */  b          .L001EA970
/* EAA5C 001EA95C 00000000 */   nop
.L001EA960:
/* EAA60 001EA960 44011024 */  addiu      $16, $0, 0x144
/* EAA64 001EA964 D901013C */  lui        $at, (0x1D900F0 >> 16)
/* EAA68 001EA968 F000318C */  lw         $17, (0x1D900F0 & 0xFFFF)($at)
/* EAA6C 001EA96C 00000000 */  nop
.L001EA970:
/* EAA70 001EA970 B894828F */  lw         $2, -0x6B48($gp)
/* EAA74 001EA974 10004284 */  lh         $2, 0x10($2)
/* EAA78 001EA978 51004228 */  slti       $2, $2, 0x51
/* EAA7C 001EA97C 04004014 */  bnez       $2, .L001EA990
/* EAA80 001EA980 00000000 */   nop
/* EAA84 001EA984 02001224 */  addiu      $18, $0, 0x2
/* EAA88 001EA988 22000010 */  b          .L001EAA14
/* EAA8C 001EA98C 00000000 */   nop
.L001EA990:
/* EAA90 001EA990 15006010 */  beqz       $3, .L001EA9E8
/* EAA94 001EA994 00000000 */   nop
/* EAA98 001EA998 01000224 */  addiu      $2, $0, 0x1
/* EAA9C 001EA99C 03006210 */  beq        $3, $2, .L001EA9AC
/* EAAA0 001EA9A0 00000000 */   nop
/* EAAA4 001EA9A4 1B000010 */  b          .L001EAA14
/* EAAA8 001EA9A8 00000000 */   nop
.L001EA9AC:
/* EAAAC 001EA9AC D901013C */  lui        $at, (0x1D900DC >> 16)
/* EAAB0 001EA9B0 DC00248C */  lw         $4, (0x1D900DC & 0xFFFF)($at)
/* EAAB4 001EA9B4 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EAAB8 001EA9B8 E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* EAABC 001EA9BC 38C5080C */  jal        SearchBoardNowPosItemExist__Fii
/* EAAC0 001EA9C0 00000000 */   nop
/* EAAC4 001EA9C4 28964070 */  paddub     $18, $2, $0
/* EAAC8 001EA9C8 0400401E */  bgtz       $18, .L001EA9DC
/* EAACC 001EA9CC 00000000 */   nop
/* EAAD0 001EA9D0 28960070 */  paddub     $18, $0, $0
/* EAAD4 001EA9D4 0F000010 */  b          .L001EAA14
/* EAAD8 001EA9D8 00000000 */   nop
.L001EA9DC:
/* EAADC 001EA9DC 01001224 */  addiu      $18, $0, 0x1
/* EAAE0 001EA9E0 0C000010 */  b          .L001EAA14
/* EAAE4 001EA9E4 00000000 */   nop
.L001EA9E8:
/* EAAE8 001EA9E8 8C94848F */  lw         $4, -0x6B74($gp)
/* EAAEC 001EA9EC D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EAAF0 001EA9F0 E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* EAAF4 001EA9F4 D901013C */  lui        $at, (0x1D900DC >> 16)
/* EAAF8 001EA9F8 DC00268C */  lw         $6, (0x1D900DC & 0xFFFF)($at)
/* EAAFC 001EA9FC 80FD080C */  jal        SearchSpace__10CStockItemFii
/* EAB00 001EAA00 00000000 */   nop
/* EAB04 001EAA04 28964070 */  paddub     $18, $2, $0
/* EAB08 001EAA08 0200401A */  blez       $18, .L001EAA14
/* EAB0C 001EAA0C 00000000 */   nop
/* EAB10 001EAA10 01001224 */  addiu      $18, $0, 0x1
.L001EAA14:
/* EAB14 001EAA14 28260072 */  paddub     $4, $16, $0
/* EAB18 001EAA18 90000524 */  addiu      $5, $0, 0x90
/* EAB1C 001EAA1C D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EAB20 001EAA20 E400268C */  lw         $6, (0x1D900E4 & 0xFFFF)($at)
/* EAB24 001EAA24 283E2072 */  paddub     $7, $17, $0
/* EAB28 001EAA28 28460070 */  paddub     $8, $0, $0
/* EAB2C 001EAA2C 284E4072 */  paddub     $9, $18, $0
/* EAB30 001EAA30 80000A24 */  addiu      $10, $0, 0x80
/* EAB34 001EAA34 349D070C */  jal        ShopCurDraw__Fiiiiiii
/* EAB38 001EAA38 00000000 */   nop
.L001EAA3C:
/* EAB3C 001EAA3C 4C000424 */  addiu      $4, $0, 0x4C
/* EAB40 001EAA40 2A000524 */  addiu      $5, $0, 0x2A
/* EAB44 001EAA44 01000624 */  addiu      $6, $0, 0x1
/* EAB48 001EAA48 80000724 */  addiu      $7, $0, 0x80
/* EAB4C 001EAA4C F49D070C */  jal        DrawShopIcon__Fiiii
/* EAB50 001EAA50 00000000 */   nop
/* EAB54 001EAA54 D901023C */  lui        $2, %hi(ShopDataMove)
/* EAB58 001EAA58 80024424 */  addiu      $4, $2, %lo(ShopDataMove)
/* EAB5C 001EAA5C 809B070C */  jal        IconAutoMoveDraw__12ShopIconMoveFv
/* EAB60 001EAA60 00000000 */   nop
/* EAB64 001EAA64 C4948587 */  lh         $5, -0x6B3C($gp)
/* EAB68 001EAA68 D901023C */  lui        $2, %hi(ShopDataMove)
/* EAB6C 001EAA6C 80024424 */  addiu      $4, $2, %lo(ShopDataMove)
/* EAB70 001EAA70 28360070 */  paddub     $6, $0, $0
/* EAB74 001EAA74 689A070C */  jal        IconAutoMove__12ShopIconMoveFii
/* EAB78 001EAA78 00000000 */   nop
/* EAB7C 001EAA7C D901013C */  lui        $at, (0x1D90250 >> 16)
/* EAB80 001EAA80 50022684 */  lh         $6, (0x1D90250 & 0xFFFF)($at)
/* EAB84 001EAA84 11000224 */  addiu      $2, $0, 0x11
/* EAB88 001EAA88 0400C210 */  beq        $6, $2, .L001EAA9C
/* EAB8C 001EAA8C 00000000 */   nop
/* EAB90 001EAA90 12000224 */  addiu      $2, $0, 0x12
/* EAB94 001EAA94 2A00C214 */  bne        $6, $2, .L001EAB40
/* EAB98 001EAA98 00000000 */   nop
.L001EAA9C:
/* EAB9C 001EAA9C 6000A327 */  addiu      $3, $sp, 0x60
/* EABA0 001EAAA0 088882DF */  ld         $2, -0x77F8($gp)
/* EABA4 001EAAA4 000062FC */  sd         $2, 0x0($3)
/* EABA8 001EAAA8 DA01013C */  lui        $at, (0x1DA224C >> 16)
/* EABAC 001EAAAC 4C22238C */  lw         $3, (0x1DA224C & 0xFFFF)($at)
/* EABB0 001EAAB0 80100600 */  sll        $2, $6, 2
/* EABB4 001EAAB4 21105D00 */  addu       $2, $2, $sp
/* EABB8 001EAAB8 1C00458C */  lw         $5, 0x1C($2)
/* EABBC 001EAABC 05006510 */  beq        $3, $5, .L001EAAD4
/* EABC0 001EAAC0 00000000 */   nop
/* EABC4 001EAAC4 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* EABC8 001EAAC8 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* EABCC 001EAACC 5441050C */  jal        MakeMesWin__6ClsMesFi
/* EABD0 001EAAD0 00000000 */   nop
.L001EAAD4:
/* EABD4 001EAAD4 4A010224 */  addiu      $2, $0, 0x14A
/* EABD8 001EAAD8 DA01013C */  lui        $at, (0x1DA0B90 >> 16)
/* EABDC 001EAADC 900B22AC */  sw         $2, (0x1DA0B90 & 0xFFFF)($at)
/* EABE0 001EAAE0 BE000224 */  addiu      $2, $0, 0xBE
/* EABE4 001EAAE4 DA01013C */  lui        $at, (0x1DA0B94 >> 16)
/* EABE8 001EAAE8 940B22AC */  sw         $2, (0x1DA0B94 & 0xFFFF)($at)
/* EABEC 001EAAEC D901013C */  lui        $at, (0x1D90250 >> 16)
/* EABF0 001EAAF0 50022384 */  lh         $3, (0x1D90250 & 0xFFFF)($at)
/* EABF4 001EAAF4 11000224 */  addiu      $2, $0, 0x11
/* EABF8 001EAAF8 04006214 */  bne        $3, $2, .L001EAB0C
/* EABFC 001EAAFC 00000000 */   nop
/* EAC00 001EAB00 96000224 */  addiu      $2, $0, 0x96
/* EAC04 001EAB04 DA01013C */  lui        $at, (0x1DA0B90 >> 16)
/* EAC08 001EAB08 900B22AC */  sw         $2, (0x1DA0B90 & 0xFFFF)($at)
.L001EAB0C:
/* EAC0C 001EAB0C 01000224 */  addiu      $2, $0, 0x1
/* EAC10 001EAB10 DA01013C */  lui        $at, (0x1DA0C28 >> 16)
/* EAC14 001EAB14 280C22AC */  sw         $2, (0x1DA0C28 & 0xFFFF)($at)
/* EAC18 001EAB18 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* EAC1C 001EAB1C 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* EAC20 001EAB20 6437050C */  jal        Step__6ClsMesFv
/* EAC24 001EAB24 00000000 */   nop
/* EAC28 001EAB28 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* EAC2C 001EAB2C 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* EAC30 001EAB30 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* EAC34 001EAB34 00000000 */   nop
/* EAC38 001EAB38 03000010 */  b          .L001EAB48
/* EAC3C 001EAB3C 00000000 */   nop
.L001EAB40:
/* EAC40 001EAB40 DA01013C */  lui        $at, (0x1DA0C28 >> 16)
/* EAC44 001EAB44 280C20AC */  sw         $0, (0x1DA0C28 & 0xFFFF)($at)
.L001EAB48:
/* EAC48 001EAB48 A8948CC7 */  lwc1       $f12, -0x6B58($gp)
/* EAC4C 001EAB4C 2C44040C */  jal        fptosi
/* EAC50 001EAB50 00000000 */   nop
/* EAC54 001EAB54 28864070 */  paddub     $16, $2, $0
/* EAC58 001EAB58 AC948CC7 */  lwc1       $f12, -0x6B54($gp)
/* EAC5C 001EAB5C 2C44040C */  jal        fptosi
/* EAC60 001EAB60 00000000 */   nop
/* EAC64 001EAB64 28260072 */  paddub     $4, $16, $0
/* EAC68 001EAB68 282E4070 */  paddub     $5, $2, $0
/* EAC6C 001EAB6C B4948CC7 */  lwc1       $f12, -0x6B4C($gp)
/* EAC70 001EAB70 B0948DC7 */  lwc1       $f13, -0x6B50($gp)
/* EAC74 001EAB74 80000624 */  addiu      $6, $0, 0x80
/* EAC78 001EAB78 985E080C */  jal        MenuHelpWinDraw__Fiiffi
/* EAC7C 001EAB7C 00000000 */   nop
/* EAC80 001EAB80 6800A427 */  addiu      $4, $sp, 0x68
/* EAC84 001EAB84 6C00A527 */  addiu      $5, $sp, 0x6C
/* EAC88 001EAB88 F0B8080C */  jal        GetMainMenuRightHelpMsgLangOffset__FRiRi
/* EAC8C 001EAB8C 00000000 */   nop
/* EAC90 001EAB90 A89481C7 */  lwc1       $f1, -0x6B58($gp)
/* EAC94 001EAB94 6800A0C7 */  lwc1       $f0, 0x68($sp)
/* EAC98 001EAB98 20008046 */  cvt.s.w    $f0, $f0
/* EAC9C 001EAB9C 000B0046 */  add.s      $f12, $f1, $f0
/* EACA0 001EABA0 2C44040C */  jal        fptosi
/* EACA4 001EABA4 00000000 */   nop
/* EACA8 001EABA8 DA01013C */  lui        $at, (0x1DA2350 >> 16)
/* EACAC 001EABAC 502322AC */  sw         $2, (0x1DA2350 & 0xFFFF)($at)
/* EACB0 001EABB0 AC9481C7 */  lwc1       $f1, -0x6B54($gp)
/* EACB4 001EABB4 6C00A0C7 */  lwc1       $f0, 0x6C($sp)
/* EACB8 001EABB8 20008046 */  cvt.s.w    $f0, $f0
/* EACBC 001EABBC 000B0046 */  add.s      $f12, $f1, $f0
/* EACC0 001EABC0 2C44040C */  jal        fptosi
/* EACC4 001EABC4 00000000 */   nop
/* EACC8 001EABC8 DA01013C */  lui        $at, (0x1DA2354 >> 16)
/* EACCC 001EABCC 542322AC */  sw         $2, (0x1DA2354 & 0xFFFF)($at)
.L001EABD0:
/* EACD0 001EABD0 D901013C */  lui        $at, (0x1D90264 >> 16)
/* EACD4 001EABD4 64022384 */  lh         $3, (0x1D90264 & 0xFFFF)($at)
/* EACD8 001EABD8 02000224 */  addiu      $2, $0, 0x2
/* EACDC 001EABDC 05006214 */  bne        $3, $2, .L001EABF4
/* EACE0 001EABE0 00000000 */   nop
/* EACE4 001EABE4 D901013C */  lui        $at, (0x1D900D0 >> 16)
/* EACE8 001EABE8 D0002484 */  lh         $4, (0x1D900D0 & 0xFFFF)($at)
/* EACEC 001EABEC DCA0070C */  jal        ShopPersonDraw__Fi
/* EACF0 001EABF0 00000000 */   nop
.L001EABF4:
/* EACF4 001EABF4 D901013C */  lui        $at, (0x1D90258 >> 16)
/* EACF8 001EABF8 58022284 */  lh         $2, (0x1D90258 & 0xFFFF)($at)
/* EACFC 001EABFC 42004010 */  beqz       $2, .L001EAD08
/* EAD00 001EAC00 00000000 */   nop
/* EAD04 001EAC04 DA01013C */  lui        $at, (0x1DA3A9C >> 16)
/* EAD08 001EAC08 9C3A248C */  lw         $4, (0x1DA3A9C & 0xFFFF)($at)
/* EAD0C 001EAC0C 38B4080C */  jal        MenuTextureReload__Fi
/* EAD10 001EAC10 00000000 */   nop
/* EAD14 001EAC14 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* EAD18 001EAC18 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* EAD1C 001EAC1C 6437050C */  jal        Step__6ClsMesFv
/* EAD20 001EAC20 00000000 */   nop
/* EAD24 001EAC24 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* EAD28 001EAC28 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* EAD2C 001EAC2C C44C050C */  jal        DrawMesWin__6ClsMesFv
/* EAD30 001EAC30 00000000 */   nop
/* EAD34 001EAC34 B894828F */  lw         $2, -0x6B48($gp)
/* EAD38 001EAC38 10004284 */  lh         $2, 0x10($2)
/* EAD3C 001EAC3C 51004128 */  slti       $at, $2, 0x51
/* EAD40 001EAC40 31002010 */  beqz       $at, .L001EAD08
/* EAD44 001EAC44 00000000 */   nop
/* EAD48 001EAC48 19050524 */  addiu      $5, $0, 0x519
/* EAD4C 001EAC4C 2900023C */  lui        $2, %hi(_1363_2)
/* EAD50 001EAC50 70274224 */  addiu      $2, $2, %lo(_1363_2)
/* EAD54 001EAC54 4000A627 */  addiu      $6, $sp, 0x40
/* EAD58 001EAC58 00004478 */  lq         $4, 0x0($2)
/* EAD5C 001EAC5C 100043DC */  ld         $3, 0x10($2)
/* EAD60 001EAC60 180042C4 */  lwc1       $f2, 0x18($2)
/* EAD64 001EAC64 0000C47C */  sq         $4, 0x0($6)
/* EAD68 001EAC68 1000C3FC */  sd         $3, 0x10($6)
/* EAD6C 001EAC6C 1800C2E4 */  swc1       $f2, 0x18($6)
/* EAD70 001EAC70 D901013C */  lui        $at, (0x1D90260 >> 16)
/* EAD74 001EAC74 60022284 */  lh         $2, (0x1D90260 & 0xFFFF)($at)
/* EAD78 001EAC78 80100200 */  sll        $2, $2, 2
/* EAD7C 001EAC7C 21205D00 */  addu       $4, $2, $sp
/* EAD80 001EAC80 40008284 */  lh         $2, 0x40($4)
/* EAD84 001EAC84 DA01013C */  lui        $at, (0x1DA52D0 >> 16)
/* EAD88 001EAC88 D05222AC */  sw         $2, (0x1DA52D0 & 0xFFFF)($at)
/* EAD8C 001EAC8C D901013C */  lui        $at, (0x1D900D2 >> 16)
/* EAD90 001EAC90 D2002384 */  lh         $3, (0x1D900D2 & 0xFFFF)($at)
/* EAD94 001EAC94 01000224 */  addiu      $2, $0, 0x1
/* EAD98 001EAC98 05006214 */  bne        $3, $2, .L001EACB0
/* EAD9C 001EAC9C 00000000 */   nop
/* EADA0 001EACA0 18050524 */  addiu      $5, $0, 0x518
/* EADA4 001EACA4 42008284 */  lh         $2, 0x42($4)
/* EADA8 001EACA8 DA01013C */  lui        $at, (0x1DA52D0 >> 16)
/* EADAC 001EACAC D05222AC */  sw         $2, (0x1DA52D0 & 0xFFFF)($at)
.L001EACB0:
/* EADB0 001EACB0 DA01013C */  lui        $at, (0x1DA698C >> 16)
/* EADB4 001EACB4 8C69228C */  lw         $2, (0x1DA698C & 0xFFFF)($at)
/* EADB8 001EACB8 05004510 */  beq        $2, $5, .L001EACD0
/* EADBC 001EACBC 00000000 */   nop
/* EADC0 001EACC0 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* EADC4 001EACC4 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* EADC8 001EACC8 5441050C */  jal        MakeMesWin__6ClsMesFi
/* EADCC 001EACCC 00000000 */   nop
.L001EACD0:
/* EADD0 001EACD0 01000224 */  addiu      $2, $0, 0x1
/* EADD4 001EACD4 DA01013C */  lui        $at, (0x1DA5368 >> 16)
/* EADD8 001EACD8 685322AC */  sw         $2, (0x1DA5368 & 0xFFFF)($at)
/* EADDC 001EACDC 62010224 */  addiu      $2, $0, 0x162
/* EADE0 001EACE0 DA01013C */  lui        $at, (0x1DA52D4 >> 16)
/* EADE4 001EACE4 D45222AC */  sw         $2, (0x1DA52D4 & 0xFFFF)($at)
/* EADE8 001EACE8 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* EADEC 001EACEC D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* EADF0 001EACF0 6437050C */  jal        Step__6ClsMesFv
/* EADF4 001EACF4 00000000 */   nop
/* EADF8 001EACF8 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* EADFC 001EACFC D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* EAE00 001EAD00 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* EAE04 001EAD04 00000000 */   nop
.L001EAD08:
/* EAE08 001EAD08 28260070 */  paddub     $4, $0, $0
/* EAE0C 001EAD0C B8B5070C */  jal        ShopModelMsgFunc__Fi
/* EAE10 001EAD10 00000000 */   nop
/* EAE14 001EAD14 A89F070C */  jal        ShopFadeoutDraw__Fv
/* EAE18 001EAD18 00000000 */   nop
/* EAE1C 001EAD1C 01000424 */  addiu      $4, $0, 0x1
/* EAE20 001EAD20 046F050C */  jal        setbilinear__Fi
/* EAE24 001EAD24 00000000 */   nop
/* EAE28 001EAD28 3000BF7B */  lq         $31, 0x30($sp)
/* EAE2C 001EAD2C 2000B27B */  lq         $18, 0x20($sp)
/* EAE30 001EAD30 1000B17B */  lq         $17, 0x10($sp)
/* EAE34 001EAD34 0000B07B */  lq         $16, 0x0($sp)
/* EAE38 001EAD38 7000BD27 */  addiu      $sp, $sp, 0x70
/* EAE3C 001EAD3C 0800E003 */  jr         $31
/* EAE40 001EAD40 00000000 */   nop
/* EAE44 001EAD44 00000000 */  nop
/* EAE48 001EAD48 00000000 */  nop
/* EAE4C 001EAD4C 00000000 */  nop
