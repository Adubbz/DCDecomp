.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ItemShopDraw2__Fv
/* F0900 001F0800 70FFBD27 */  addiu      $sp, $sp, -0x90
/* F0904 001F0804 5000BF7F */  sq         $31, 0x50($sp)
/* F0908 001F0808 4000B47F */  sq         $20, 0x40($sp)
/* F090C 001F080C 3000B37F */  sq         $19, 0x30($sp)
/* F0910 001F0810 2000B27F */  sq         $18, 0x20($sp)
/* F0914 001F0814 1000B17F */  sq         $17, 0x10($sp)
/* F0918 001F0818 0000B07F */  sq         $16, 0x0($sp)
/* F091C 001F081C 28260070 */  paddub     $4, $0, $0
/* F0920 001F0820 046F050C */  jal        setbilinear__Fi
/* F0924 001F0824 00000000 */   nop
/* F0928 001F0828 DA01023C */  lui        $2, %hi(MenuCamera)
/* F092C 001F082C D0084424 */  addiu      $4, $2, %lo(MenuCamera)
/* F0930 001F0830 7CAF080C */  jal        MenuWorldTrans__FP7CCamera
/* F0934 001F0834 00000000 */   nop
/* F0938 001F0838 40000424 */  addiu      $4, $0, 0x40
/* F093C 001F083C D901013C */  lui        $at, (0x1D90250 >> 16)
/* F0940 001F0840 50022384 */  lh         $3, (0x1D90250 & 0xFFFF)($at)
/* F0944 001F0844 02000224 */  addiu      $2, $0, 0x2
/* F0948 001F0848 0E006210 */  beq        $3, $2, .L001F0884
/* F094C 001F084C 00000000 */   nop
/* F0950 001F0850 01000224 */  addiu      $2, $0, 0x1
/* F0954 001F0854 03006210 */  beq        $3, $2, .L001F0864
/* F0958 001F0858 00000000 */   nop
/* F095C 001F085C 0D000010 */  b          .L001F0894
/* F0960 001F0860 00000000 */   nop
.L001F0864:
/* F0964 001F0864 80000424 */  addiu      $4, $0, 0x80
/* F0968 001F0868 D901013C */  lui        $at, (0x1D90254 >> 16)
/* F096C 001F086C 5402238C */  lw         $3, (0x1D90254 & 0xFFFF)($at)
/* F0970 001F0870 40100300 */  sll        $2, $3, 1
/* F0974 001F0874 21104300 */  addu       $2, $2, $3
/* F0978 001F0878 23208200 */  subu       $4, $4, $2
/* F097C 001F087C 05000010 */  b          .L001F0894
/* F0980 001F0880 00000000 */   nop
.L001F0884:
/* F0984 001F0884 D901013C */  lui        $at, (0x1D90254 >> 16)
/* F0988 001F0888 5402228C */  lw         $2, (0x1D90254 & 0xFFFF)($at)
/* F098C 001F088C 80100200 */  sll        $2, $2, 2
/* F0990 001F0890 40004424 */  addiu      $4, $2, 0x40
.L001F0894:
/* F0994 001F0894 40008128 */  slti       $at, $4, 0x40
/* F0998 001F0898 02002010 */  beqz       $at, .L001F08A4
/* F099C 001F089C 00000000 */   nop
/* F09A0 001F08A0 40000424 */  addiu      $4, $0, 0x40
.L001F08A4:
/* F09A4 001F08A4 81008128 */  slti       $at, $4, 0x81
/* F09A8 001F08A8 02002014 */  bnez       $at, .L001F08B4
/* F09AC 001F08AC 00000000 */   nop
/* F09B0 001F08B0 80000424 */  addiu      $4, $0, 0x80
.L001F08B4:
/* F09B4 001F08B4 80000524 */  addiu      $5, $0, 0x80
/* F09B8 001F08B8 ACB4080C */  jal        FrameImageDraw__Fii
/* F09BC 001F08BC 00000000 */   nop
/* F09C0 001F08C0 D901013C */  lui        $at, (0x1D90258 >> 16)
/* F09C4 001F08C4 58022284 */  lh         $2, (0x1D90258 & 0xFFFF)($at)
/* F09C8 001F08C8 C8014010 */  beqz       $2, .L001F0FEC
/* F09CC 001F08CC 00000000 */   nop
/* F09D0 001F08D0 D901013C */  lui        $at, (0x1D9025A >> 16)
/* F09D4 001F08D4 5A022484 */  lh         $4, (0x1D9025A & 0xFFFF)($at)
/* F09D8 001F08D8 38B4080C */  jal        MenuTextureReload__Fi
/* F09DC 001F08DC 00000000 */   nop
/* F09E0 001F08E0 D901013C */  lui        $at, (0x1D900DC >> 16)
/* F09E4 001F08E4 DC00248C */  lw         $4, (0x1D900DC & 0xFFFF)($at)
/* F09E8 001F08E8 D8BD080C */  jal        PersonalRetMax__Fi
/* F09EC 001F08EC 00000000 */   nop
/* F09F0 001F08F0 28964070 */  paddub     $18, $2, $0
/* F09F4 001F08F4 7F000624 */  addiu      $6, $0, 0x7F
/* F09F8 001F08F8 D901013C */  lui        $at, (0x1D900F0 >> 16)
/* F09FC 001F08FC F000238C */  lw         $3, (0x1D900F0 & 0xFFFF)($at)
/* F0A00 001F0900 80100300 */  sll        $2, $3, 2
/* F0A04 001F0904 21104300 */  addu       $2, $2, $3
/* F0A08 001F0908 C0100200 */  sll        $2, $2, 3
/* F0A0C 001F090C 2388C200 */  subu       $17, $6, $2
/* F0A10 001F0910 00009144 */  mtc1       $17, $f0
/* F0A14 001F0914 00000000 */  nop
/* F0A18 001F0918 20008046 */  cvt.s.w    $f0, $f0
/* F0A1C 001F091C D901013C */  lui        $at, (0x1D900E8 >> 16)
/* F0A20 001F0920 E80022C4 */  lwc1       $f2, (0x1D900E8 & 0xFFFF)($at)
/* F0A24 001F0924 41000246 */  sub.s      $f1, $f0, $f2
/* F0A28 001F0928 8040023C */  lui        $2, (0x40800000 >> 16)
/* F0A2C 001F092C 00008244 */  mtc1       $2, $f0
/* F0A30 001F0930 00000000 */  nop
/* F0A34 001F0934 03080046 */  div.s      $f0, $f1, $f0
/* F0A38 001F0938 00100046 */  add.s      $f0, $f2, $f0
/* F0A3C 001F093C D901013C */  lui        $at, (0x1D900E8 >> 16)
/* F0A40 001F0940 E80020E4 */  swc1       $f0, (0x1D900E8 & 0xFFFF)($at)
/* F0A44 001F0944 68011024 */  addiu      $16, $0, 0x168
/* F0A48 001F0948 D901013C */  lui        $at, (0x1D900E8 >> 16)
/* F0A4C 001F094C E8002CC4 */  lwc1       $f12, (0x1D900E8 & 0xFFFF)($at)
/* F0A50 001F0950 2C44040C */  jal        fptosi
/* F0A54 001F0954 00000000 */   nop
/* F0A58 001F0958 288E4070 */  paddub     $17, $2, $0
/* F0A5C 001F095C 28260070 */  paddub     $4, $0, $0
/* F0A60 001F0960 D901013C */  lui        $at, (0x1D900DC >> 16)
/* F0A64 001F0964 DC00238C */  lw         $3, (0x1D900DC & 0xFFFF)($at)
/* F0A68 001F0968 01000224 */  addiu      $2, $0, 0x1
/* F0A6C 001F096C 02006214 */  bne        $3, $2, .L001F0978
/* F0A70 001F0970 00000000 */   nop
/* F0A74 001F0974 02000424 */  addiu      $4, $0, 0x2
.L001F0978:
/* F0A78 001F0978 282E4072 */  paddub     $5, $18, $0
/* F0A7C 001F097C 68010624 */  addiu      $6, $0, 0x168
/* F0A80 001F0980 283E2072 */  paddub     $7, $17, $0
/* F0A84 001F0984 81000824 */  addiu      $8, $0, 0x81
/* F0A88 001F0988 21010924 */  addiu      $9, $0, 0x121
/* F0A8C 001F098C A4978A8F */  lw         $10, -0x685C($gp)
/* F0A90 001F0990 80000B24 */  addiu      $11, $0, 0x80
/* F0A94 001F0994 70C3080C */  jal        DrawPerBoardDraw__FiiiiiiP8CTexturei
/* F0A98 001F0998 00000000 */   nop
/* F0A9C 001F099C 06002726 */  addiu      $7, $17, 0x6
/* F0AA0 001F09A0 D901013C */  lui        $at, (0x1D900DC >> 16)
/* F0AA4 001F09A4 DC00248C */  lw         $4, (0x1D900DC & 0xFFFF)($at)
/* F0AA8 001F09A8 282E4072 */  paddub     $5, $18, $0
/* F0AAC 001F09AC 6A010624 */  addiu      $6, $0, 0x16A
/* F0AB0 001F09B0 81000824 */  addiu      $8, $0, 0x81
/* F0AB4 001F09B4 21010924 */  addiu      $9, $0, 0x121
/* F0AB8 001F09B8 80000A24 */  addiu      $10, $0, 0x80
/* F0ABC 001F09BC B4BE080C */  jal        CommonIconDraw__Fiiiiiii
/* F0AC0 001F09C0 00000000 */   nop
/* F0AC4 001F09C4 D901013C */  lui        $at, (0x1D900DC >> 16)
/* F0AC8 001F09C8 DC00248C */  lw         $4, (0x1D900DC & 0xFFFF)($at)
/* F0ACC 001F09CC 282E4072 */  paddub     $5, $18, $0
/* F0AD0 001F09D0 54010624 */  addiu      $6, $0, 0x154
/* F0AD4 001F09D4 78000724 */  addiu      $7, $0, 0x78
/* F0AD8 001F09D8 A497888F */  lw         $8, -0x685C($gp)
/* F0ADC 001F09DC 80000924 */  addiu      $9, $0, 0x80
/* F0AE0 001F09E0 50C0080C */  jal        PersonalBoardOptionDraw__FiiiiP8CTexturei
/* F0AE4 001F09E4 00000000 */   nop
/* F0AE8 001F09E8 32020424 */  addiu      $4, $0, 0x232
/* F0AEC 001F09EC 0C010524 */  addiu      $5, $0, 0x10C
/* F0AF0 001F09F0 80000624 */  addiu      $6, $0, 0x80
/* F0AF4 001F09F4 18C4080C */  jal        CommonTrushDraw__Fiii
/* F0AF8 001F09F8 00000000 */   nop
/* F0AFC 001F09FC 8494828F */  lw         $2, -0x6B7C($gp)
/* F0B00 001F0A00 46434694 */  lhu        $6, 0x4346($2)
/* F0B04 001F0A04 63010424 */  addiu      $4, $0, 0x163
/* F0B08 001F0A08 20010524 */  addiu      $5, $0, 0x120
/* F0B0C 001F0A0C 80000724 */  addiu      $7, $0, 0x80
/* F0B10 001F0A10 D8C4080C */  jal        CommonMoneyBoardDraw__Fiiii
/* F0B14 001F0A14 00000000 */   nop
/* F0B18 001F0A18 C8010424 */  addiu      $4, $0, 0x1C8
/* F0B1C 001F0A1C 20010524 */  addiu      $5, $0, 0x120
/* F0B20 001F0A20 80000624 */  addiu      $6, $0, 0x80
/* F0B24 001F0A24 90B1070C */  jal        DrawMoneyCheckBoard2__Fiii
/* F0B28 001F0A28 00000000 */   nop
/* F0B2C 001F0A2C 32000424 */  addiu      $4, $0, 0x32
/* F0B30 001F0A30 78000524 */  addiu      $5, $0, 0x78
/* F0B34 001F0A34 80000624 */  addiu      $6, $0, 0x80
/* F0B38 001F0A38 DCB0070C */  jal        DrawItemShopBoard2__Fiii
/* F0B3C 001F0A3C 00000000 */   nop
/* F0B40 001F0A40 80000424 */  addiu      $4, $0, 0x80
/* F0B44 001F0A44 C89C070C */  jal        ChargeShopLRDraw__Fi
/* F0B48 001F0A48 00000000 */   nop
/* F0B4C 001F0A4C D901023C */  lui        $2, %hi(ShopDataMove)
/* F0B50 001F0A50 80024424 */  addiu      $4, $2, %lo(ShopDataMove)
/* F0B54 001F0A54 809B070C */  jal        IconAutoMoveDraw__12ShopIconMoveFv
/* F0B58 001F0A58 00000000 */   nop
/* F0B5C 001F0A5C C4948587 */  lh         $5, -0x6B3C($gp)
/* F0B60 001F0A60 D901023C */  lui        $2, %hi(ShopDataMove)
/* F0B64 001F0A64 80024424 */  addiu      $4, $2, %lo(ShopDataMove)
/* F0B68 001F0A68 28360070 */  paddub     $6, $0, $0
/* F0B6C 001F0A6C 689A070C */  jal        IconAutoMove__12ShopIconMoveFii
/* F0B70 001F0A70 00000000 */   nop
/* F0B74 001F0A74 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* F0B78 001F0A78 D2002484 */  lh         $4, (0x1D900D2 & 0xFFFF)($at)
/* F0B7C 001F0A7C 01000224 */  addiu      $2, $0, 0x1
/* F0B80 001F0A80 0D008210 */  beq        $4, $2, .L001F0AB8
/* F0B84 001F0A84 00000000 */   nop
/* F0B88 001F0A88 06008010 */  beqz       $4, .L001F0AA4
/* F0B8C 001F0A8C 00000000 */   nop
/* F0B90 001F0A90 02000224 */  addiu      $2, $0, 0x2
/* F0B94 001F0A94 03008210 */  beq        $4, $2, .L001F0AA4
/* F0B98 001F0A98 00000000 */   nop
/* F0B9C 001F0A9C 0A000010 */  b          .L001F0AC8
/* F0BA0 001F0AA0 00000000 */   nop
.L001F0AA4:
/* F0BA4 001F0AA4 22001024 */  addiu      $16, $0, 0x22
/* F0BA8 001F0AA8 D901013C */  lui        $at, (0x1D90246 >> 16)
/* F0BAC 001F0AAC 46023390 */  lbu        $19, (0x1D90246 & 0xFFFF)($at)
/* F0BB0 001F0AB0 05000010 */  b          .L001F0AC8
/* F0BB4 001F0AB4 00000000 */   nop
.L001F0AB8:
/* F0BB8 001F0AB8 44011024 */  addiu      $16, $0, 0x144
/* F0BBC 001F0ABC D901013C */  lui        $at, (0x1D900F0 >> 16)
/* F0BC0 001F0AC0 F000338C */  lw         $19, (0x1D900F0 & 0xFFFF)($at)
/* F0BC4 001F0AC4 00000000 */  nop
.L001F0AC8:
/* F0BC8 001F0AC8 28160070 */  paddub     $2, $0, $0
/* F0BCC 001F0ACC B894838F */  lw         $3, -0x6B48($gp)
/* F0BD0 001F0AD0 10006384 */  lh         $3, 0x10($3)
/* F0BD4 001F0AD4 51006328 */  slti       $3, $3, 0x51
/* F0BD8 001F0AD8 04006014 */  bnez       $3, .L001F0AEC
/* F0BDC 001F0ADC 00000000 */   nop
/* F0BE0 001F0AE0 02000224 */  addiu      $2, $0, 0x2
/* F0BE4 001F0AE4 24000010 */  b          .L001F0B78
/* F0BE8 001F0AE8 00000000 */   nop
.L001F0AEC:
/* F0BEC 001F0AEC 02000324 */  addiu      $3, $0, 0x2
/* F0BF0 001F0AF0 21008310 */  beq        $4, $3, .L001F0B78
/* F0BF4 001F0AF4 00000000 */   nop
/* F0BF8 001F0AF8 11008010 */  beqz       $4, .L001F0B40
/* F0BFC 001F0AFC 00000000 */   nop
/* F0C00 001F0B00 01000324 */  addiu      $3, $0, 0x1
/* F0C04 001F0B04 03008310 */  beq        $4, $3, .L001F0B14
/* F0C08 001F0B08 00000000 */   nop
/* F0C0C 001F0B0C 1A000010 */  b          .L001F0B78
/* F0C10 001F0B10 00000000 */   nop
.L001F0B14:
/* F0C14 001F0B14 D901013C */  lui        $at, (0x1D900DC >> 16)
/* F0C18 001F0B18 DC00248C */  lw         $4, (0x1D900DC & 0xFFFF)($at)
/* F0C1C 001F0B1C D901013C */  lui        $at, (0x1D900E4 >> 16)
/* F0C20 001F0B20 E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* F0C24 001F0B24 38C5080C */  jal        SearchBoardNowPosItemExist__Fii
/* F0C28 001F0B28 00000000 */   nop
/* F0C2C 001F0B2C 51004128 */  slti       $at, $2, 0x51
/* F0C30 001F0B30 01000224 */  addiu      $2, $0, 0x1
/* F0C34 001F0B34 0B100100 */  movn       $2, $0, $at
/* F0C38 001F0B38 0F000010 */  b          .L001F0B78
/* F0C3C 001F0B3C 00000000 */   nop
.L001F0B40:
/* F0C40 001F0B40 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* F0C44 001F0B44 E400248C */  lw         $4, (0x1D900E4 & 0xFFFF)($at)
/* F0C48 001F0B48 80190400 */  sll        $3, $4, 6
/* F0C4C 001F0B4C 23186400 */  subu       $3, $3, $4
/* F0C50 001F0B50 80200300 */  sll        $4, $3, 2
/* F0C54 001F0B54 A094838F */  lw         $3, -0x6B60($gp)
/* F0C58 001F0B58 21186400 */  addu       $3, $3, $4
/* F0C5C 001F0B5C 00006384 */  lh         $3, 0x0($3)
/* F0C60 001F0B60 52006128 */  slti       $at, $3, 0x52
/* F0C64 001F0B64 04002014 */  bnez       $at, .L001F0B78
/* F0C68 001F0B68 00000000 */   nop
/* F0C6C 001F0B6C 01000224 */  addiu      $2, $0, 0x1
/* F0C70 001F0B70 01000010 */  b          .L001F0B78
/* F0C74 001F0B74 00000000 */   nop
.L001F0B78:
/* F0C78 001F0B78 28460070 */  paddub     $8, $0, $0
/* F0C7C 001F0B7C D901013C */  lui        $at, (0x1D900D2 >> 16)
/* F0C80 001F0B80 D2002484 */  lh         $4, (0x1D900D2 & 0xFFFF)($at)
/* F0C84 001F0B84 02000324 */  addiu      $3, $0, 0x2
/* F0C88 001F0B88 03008310 */  beq        $4, $3, .L001F0B98
/* F0C8C 001F0B8C 00000000 */   nop
/* F0C90 001F0B90 02000010 */  b          .L001F0B9C
/* F0C94 001F0B94 00000000 */   nop
.L001F0B98:
/* F0C98 001F0B98 01000824 */  addiu      $8, $0, 0x1
.L001F0B9C:
/* F0C9C 001F0B9C 28260072 */  paddub     $4, $16, $0
/* F0CA0 001F0BA0 84000524 */  addiu      $5, $0, 0x84
/* F0CA4 001F0BA4 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* F0CA8 001F0BA8 E400268C */  lw         $6, (0x1D900E4 & 0xFFFF)($at)
/* F0CAC 001F0BAC 283E6072 */  paddub     $7, $19, $0
/* F0CB0 001F0BB0 284E4070 */  paddub     $9, $2, $0
/* F0CB4 001F0BB4 80000A24 */  addiu      $10, $0, 0x80
/* F0CB8 001F0BB8 349D070C */  jal        ShopCurDraw__Fiiiiiii
/* F0CBC 001F0BBC 00000000 */   nop
/* F0CC0 001F0BC0 4C000424 */  addiu      $4, $0, 0x4C
/* F0CC4 001F0BC4 2A000524 */  addiu      $5, $0, 0x2A
/* F0CC8 001F0BC8 28360070 */  paddub     $6, $0, $0
/* F0CCC 001F0BCC 80000724 */  addiu      $7, $0, 0x80
/* F0CD0 001F0BD0 F49D070C */  jal        DrawShopIcon__Fiiii
/* F0CD4 001F0BD4 00000000 */   nop
/* F0CD8 001F0BD8 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* F0CDC 001F0BDC D2002284 */  lh         $2, (0x1D900D2 & 0xFFFF)($at)
/* F0CE0 001F0BE0 01000624 */  addiu      $6, $0, 0x1
/* F0CE4 001F0BE4 50004610 */  beq        $2, $6, .L001F0D28
/* F0CE8 001F0BE8 00000000 */   nop
/* F0CEC 001F0BEC 03004010 */  beqz       $2, .L001F0BFC
/* F0CF0 001F0BF0 00000000 */   nop
/* F0CF4 001F0BF4 CD000010 */  b          .L001F0F2C
/* F0CF8 001F0BF8 00000000 */   nop
.L001F0BFC:
/* F0CFC 001F0BFC D901013C */  lui        $at, (0x1D900E4 >> 16)
/* F0D00 001F0C00 E400298C */  lw         $9, (0x1D900E4 & 0xFFFF)($at)
/* F0D04 001F0C04 80110900 */  sll        $2, $9, 6
/* F0D08 001F0C08 23104900 */  subu       $2, $2, $9
/* F0D0C 001F0C0C 80400200 */  sll        $8, $2, 2
/* F0D10 001F0C10 A094828F */  lw         $2, -0x6B60($gp)
/* F0D14 001F0C14 21104800 */  addu       $2, $2, $8
/* F0D18 001F0C18 00004784 */  lh         $7, 0x0($2)
/* F0D1C 001F0C1C 5100E228 */  slti       $2, $7, 0x51
/* F0D20 001F0C20 C2004014 */  bnez       $2, .L001F0F2C
/* F0D24 001F0C24 00000000 */   nop
/* F0D28 001F0C28 28960070 */  paddub     $18, $0, $0
/* F0D2C 001F0C2C 80180900 */  sll        $3, $9, 2
/* F0D30 001F0C30 9094828F */  lw         $2, -0x6B70($gp)
/* F0D34 001F0C34 21104300 */  addu       $2, $2, $3
/* F0D38 001F0C38 0000438C */  lw         $3, 0x0($2)
/* F0D3C 001F0C3C 02000224 */  addiu      $2, $0, 0x2
/* F0D40 001F0C40 02006214 */  bne        $3, $2, .L001F0C4C
/* F0D44 001F0C44 00000000 */   nop
/* F0D48 001F0C48 2896C070 */  paddub     $18, $6, $0
.L001F0C4C:
/* F0D4C 001F0C4C 2826E070 */  paddub     $4, $7, $0
/* F0D50 001F0C50 282E4072 */  paddub     $5, $18, $0
/* F0D54 001F0C54 B4AC070C */  jal        CalItemMoney__Fii
/* F0D58 001F0C58 00000000 */   nop
/* F0D5C 001F0C5C 289E4070 */  paddub     $19, $2, $0
/* F0D60 001F0C60 0101E228 */  slti       $2, $7, 0x101
/* F0D64 001F0C64 07004014 */  bnez       $2, .L001F0C84
/* F0D68 001F0C68 00000000 */   nop
/* F0D6C 001F0C6C A094828F */  lw         $2, -0x6B60($gp)
/* F0D70 001F0C70 21104800 */  addu       $2, $2, $8
/* F0D74 001F0C74 04004424 */  addiu      $4, $2, 0x4
/* F0D78 001F0C78 C4AC070C */  jal        WeaponCalMoney__FP11WEAPON_HAVEi
/* F0D7C 001F0C7C 00000000 */   nop
/* F0D80 001F0C80 21986202 */  addu       $19, $19, $2
.L001F0C84:
/* F0D84 001F0C84 02006106 */  bgez       $19, .L001F0C90
/* F0D88 001F0C88 00000000 */   nop
/* F0D8C 001F0C8C 01001324 */  addiu      $19, $0, 0x1
.L001F0C90:
/* F0D90 001F0C90 05000624 */  addiu      $6, $0, 0x5
/* F0D94 001F0C94 1A002601 */  div        $0, $9, $6
/* F0D98 001F0C98 00000000 */  nop
/* F0D9C 001F0C9C 00000000 */  nop
/* F0DA0 001F0CA0 10180000 */  mfhi       $3
/* F0DA4 001F0CA4 80100300 */  sll        $2, $3, 2
/* F0DA8 001F0CA8 21104300 */  addu       $2, $2, $3
/* F0DAC 001F0CAC C0100200 */  sll        $2, $2, 3
/* F0DB0 001F0CB0 4A005024 */  addiu      $16, $2, 0x4A
/* F0DB4 001F0CB4 1A002601 */  div        $0, $9, $6
/* F0DB8 001F0CB8 0200C014 */  bnez       $6, .L001F0CC4
/* F0DBC 001F0CBC 00000000 */   nop
/* F0DC0 001F0CC0 CD010000 */  break      0, 7
.L001F0CC4:
/* F0DC4 001F0CC4 12180000 */  mflo       $3
/* F0DC8 001F0CC8 80100300 */  sll        $2, $3, 2
/* F0DCC 001F0CCC 21104300 */  addu       $2, $2, $3
/* F0DD0 001F0CD0 C0100200 */  sll        $2, $2, 3
/* F0DD4 001F0CD4 00008244 */  mtc1       $2, $f0
/* F0DD8 001F0CD8 00000000 */  nop
/* F0DDC 001F0CDC A0008046 */  cvt.s.w    $f2, $f0
/* F0DE0 001F0CE0 C040023C */  lui        $2, (0x40C00000 >> 16)
/* F0DE4 001F0CE4 00088244 */  mtc1       $2, $f1
/* F0DE8 001F0CE8 D901013C */  lui        $at, (0x1D9023C >> 16)
/* F0DEC 001F0CEC 3C0220C4 */  lwc1       $f0, (0x1D9023C & 0xFFFF)($at)
/* F0DF0 001F0CF0 00080046 */  add.s      $f0, $f1, $f0
/* F0DF4 001F0CF4 00030246 */  add.s      $f12, $f0, $f2
/* F0DF8 001F0CF8 2C44040C */  jal        fptosi
/* F0DFC 001F0CFC 00000000 */   nop
/* F0E00 001F0D00 288E4070 */  paddub     $17, $2, $0
/* F0E04 001F0D04 28264072 */  paddub     $4, $18, $0
/* F0E08 001F0D08 282E6072 */  paddub     $5, $19, $0
/* F0E0C 001F0D0C 28360072 */  paddub     $6, $16, $0
/* F0E10 001F0D10 283E2072 */  paddub     $7, $17, $0
/* F0E14 001F0D14 80000824 */  addiu      $8, $0, 0x80
/* F0E18 001F0D18 54B2070C */  jal        DrawBigSellTicket__Fiiiii
/* F0E1C 001F0D1C 00000000 */   nop
/* F0E20 001F0D20 82000010 */  b          .L001F0F2C
/* F0E24 001F0D24 00000000 */   nop
.L001F0D28:
/* F0E28 001F0D28 D901013C */  lui        $at, (0x1D90250 >> 16)
/* F0E2C 001F0D2C 50022384 */  lh         $3, (0x1D90250 & 0xFFFF)($at)
/* F0E30 001F0D30 0E000224 */  addiu      $2, $0, 0xE
/* F0E34 001F0D34 7D006214 */  bne        $3, $2, .L001F0F2C
/* F0E38 001F0D38 00000000 */   nop
/* F0E3C 001F0D3C D901013C */  lui        $at, (0x1D900DC >> 16)
/* F0E40 001F0D40 DC00238C */  lw         $3, (0x1D900DC & 0xFFFF)($at)
/* F0E44 001F0D44 1B006610 */  beq        $3, $6, .L001F0DB4
/* F0E48 001F0D48 00000000 */   nop
/* F0E4C 001F0D4C 02000224 */  addiu      $2, $0, 0x2
/* F0E50 001F0D50 0E006210 */  beq        $3, $2, .L001F0D8C
/* F0E54 001F0D54 00000000 */   nop
/* F0E58 001F0D58 03006010 */  beqz       $3, .L001F0D68
/* F0E5C 001F0D5C 00000000 */   nop
/* F0E60 001F0D60 2C000010 */  b          .L001F0E14
/* F0E64 001F0D64 00000000 */   nop
.L001F0D68:
/* F0E68 001F0D68 8494828F */  lw         $2, -0x6B7C($gp)
/* F0E6C 001F0D6C 60434324 */  addiu      $3, $2, 0x4360
/* F0E70 001F0D70 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* F0E74 001F0D74 E400228C */  lw         $2, (0x1D900E4 & 0xFFFF)($at)
/* F0E78 001F0D78 40100200 */  sll        $2, $2, 1
/* F0E7C 001F0D7C 21104300 */  addu       $2, $2, $3
/* F0E80 001F0D80 0E005484 */  lh         $20, 0xE($2)
/* F0E84 001F0D84 23000010 */  b          .L001F0E14
/* F0E88 001F0D88 00000000 */   nop
.L001F0D8C:
/* F0E8C 001F0D8C 8494828F */  lw         $2, -0x6B7C($gp)
/* F0E90 001F0D90 04054324 */  addiu      $3, $2, 0x504
/* F0E94 001F0D94 F87F6324 */  addiu      $3, $3, 0x7FF8
/* F0E98 001F0D98 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* F0E9C 001F0D9C E400228C */  lw         $2, (0x1D900E4 & 0xFFFF)($at)
/* F0EA0 001F0DA0 40110200 */  sll        $2, $2, 5
/* F0EA4 001F0DA4 21106200 */  addu       $2, $3, $2
/* F0EA8 001F0DA8 00005484 */  lh         $20, 0x0($2)
/* F0EAC 001F0DAC 19000010 */  b          .L001F0E14
/* F0EB0 001F0DB0 00000000 */   nop
.L001F0DB4:
/* F0EB4 001F0DB4 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* F0EB8 001F0DB8 E400278C */  lw         $7, (0x1D900E4 & 0xFFFF)($at)
/* F0EBC 001F0DBC 0A000224 */  addiu      $2, $0, 0xA
/* F0EC0 001F0DC0 1A00E200 */  div        $0, $7, $2
/* F0EC4 001F0DC4 02004014 */  bnez       $2, .L001F0DD0
/* F0EC8 001F0DC8 00000000 */   nop
/* F0ECC 001F0DCC CD010000 */  break      0, 7
.L001F0DD0:
/* F0ED0 001F0DD0 12180000 */  mflo       $3
/* F0ED4 001F0DD4 8494868F */  lw         $6, -0x6B7C($gp)
/* F0ED8 001F0DD8 A80A0224 */  addiu      $2, $0, 0xAA8
/* F0EDC 001F0DDC 18106200 */  mult       $2, $3, $2
/* F0EE0 001F0DE0 2110C200 */  addu       $2, $6, $2
/* F0EE4 001F0DE4 0C454624 */  addiu      $6, $2, 0x450C
/* F0EE8 001F0DE8 0A000224 */  addiu      $2, $0, 0xA
/* F0EEC 001F0DEC 1A00E200 */  div        $0, $7, $2
/* F0EF0 001F0DF0 00000000 */  nop
/* F0EF4 001F0DF4 00000000 */  nop
/* F0EF8 001F0DF8 10180000 */  mfhi       $3
/* F0EFC 001F0DFC 40110300 */  sll        $2, $3, 5
/* F0F00 001F0E00 23104300 */  subu       $2, $2, $3
/* F0F04 001F0E04 C0100200 */  sll        $2, $2, 3
/* F0F08 001F0E08 2110C200 */  addu       $2, $6, $2
/* F0F0C 001F0E0C 00005484 */  lh         $20, 0x0($2)
/* F0F10 001F0E10 00000000 */  nop
.L001F0E14:
/* F0F14 001F0E14 C040023C */  lui        $2, (0x40C00000 >> 16)
/* F0F18 001F0E18 00088244 */  mtc1       $2, $f1
/* F0F1C 001F0E1C D901013C */  lui        $at, (0x1D900E8 >> 16)
/* F0F20 001F0E20 E80020C4 */  lwc1       $f0, (0x1D900E8 & 0xFFFF)($at)
/* F0F24 001F0E24 000B0046 */  add.s      $f12, $f1, $f0
/* F0F28 001F0E28 2C44040C */  jal        fptosi
/* F0F2C 001F0E2C 00000000 */   nop
/* F0F30 001F0E30 284E4070 */  paddub     $9, $2, $0
/* F0F34 001F0E34 28268072 */  paddub     $4, $20, $0
/* F0F38 001F0E38 01000524 */  addiu      $5, $0, 0x1
/* F0F3C 001F0E3C B4AC070C */  jal        CalItemMoney__Fii
/* F0F40 001F0E40 00000000 */   nop
/* F0F44 001F0E44 28564070 */  paddub     $10, $2, $0
/* F0F48 001F0E48 0101822A */  slti       $2, $20, 0x101
/* F0F4C 001F0E4C 1B004014 */  bnez       $2, .L001F0EBC
/* F0F50 001F0E50 00000000 */   nop
/* F0F54 001F0E54 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* F0F58 001F0E58 E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* F0F5C 001F0E5C 0A000224 */  addiu      $2, $0, 0xA
/* F0F60 001F0E60 1A00A200 */  div        $0, $5, $2
/* F0F64 001F0E64 02004014 */  bnez       $2, .L001F0E70
/* F0F68 001F0E68 00000000 */   nop
/* F0F6C 001F0E6C CD010000 */  break      0, 7
.L001F0E70:
/* F0F70 001F0E70 12180000 */  mflo       $3
/* F0F74 001F0E74 8494848F */  lw         $4, -0x6B7C($gp)
/* F0F78 001F0E78 A80A0224 */  addiu      $2, $0, 0xAA8
/* F0F7C 001F0E7C 18106200 */  mult       $2, $3, $2
/* F0F80 001F0E80 21108200 */  addu       $2, $4, $2
/* F0F84 001F0E84 0C454424 */  addiu      $4, $2, 0x450C
/* F0F88 001F0E88 0A000224 */  addiu      $2, $0, 0xA
/* F0F8C 001F0E8C 1A00A200 */  div        $0, $5, $2
/* F0F90 001F0E90 00000000 */  nop
/* F0F94 001F0E94 00000000 */  nop
/* F0F98 001F0E98 10180000 */  mfhi       $3
/* F0F9C 001F0E9C 40110300 */  sll        $2, $3, 5
/* F0FA0 001F0EA0 23104300 */  subu       $2, $2, $3
/* F0FA4 001F0EA4 C0100200 */  sll        $2, $2, 3
/* F0FA8 001F0EA8 21208200 */  addu       $4, $4, $2
/* F0FAC 001F0EAC 01000524 */  addiu      $5, $0, 0x1
/* F0FB0 001F0EB0 C4AC070C */  jal        WeaponCalMoney__FP11WEAPON_HAVEi
/* F0FB4 001F0EB4 00000000 */   nop
/* F0FB8 001F0EB8 21504201 */  addu       $10, $10, $2
.L001F0EBC:
/* F0FBC 001F0EBC 0200401D */  bgtz       $10, .L001F0EC8
/* F0FC0 001F0EC0 00000000 */   nop
/* F0FC4 001F0EC4 01000A24 */  addiu      $10, $0, 0x1
.L001F0EC8:
/* F0FC8 001F0EC8 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* F0FCC 001F0ECC E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* F0FD0 001F0ED0 05000424 */  addiu      $4, $0, 0x5
/* F0FD4 001F0ED4 1A00A400 */  div        $0, $5, $4
/* F0FD8 001F0ED8 00000000 */  nop
/* F0FDC 001F0EDC 00000000 */  nop
/* F0FE0 001F0EE0 10180000 */  mfhi       $3
/* F0FE4 001F0EE4 80100300 */  sll        $2, $3, 2
/* F0FE8 001F0EE8 21104300 */  addu       $2, $2, $3
/* F0FEC 001F0EEC C0100200 */  sll        $2, $2, 3
/* F0FF0 001F0EF0 6A014624 */  addiu      $6, $2, 0x16A
/* F0FF4 001F0EF4 1A00A400 */  div        $0, $5, $4
/* F0FF8 001F0EF8 02008014 */  bnez       $4, .L001F0F04
/* F0FFC 001F0EFC 00000000 */   nop
/* F1000 001F0F00 CD010000 */  break      0, 7
.L001F0F04:
/* F1004 001F0F04 12180000 */  mflo       $3
/* F1008 001F0F08 80100300 */  sll        $2, $3, 2
/* F100C 001F0F0C 21104300 */  addu       $2, $2, $3
/* F1010 001F0F10 C0100200 */  sll        $2, $2, 3
/* F1014 001F0F14 21382201 */  addu       $7, $9, $2
/* F1018 001F0F18 01000424 */  addiu      $4, $0, 0x1
/* F101C 001F0F1C 282E4071 */  paddub     $5, $10, $0
/* F1020 001F0F20 80000824 */  addiu      $8, $0, 0x80
/* F1024 001F0F24 54B2070C */  jal        DrawBigSellTicket__Fiiiii
/* F1028 001F0F28 00000000 */   nop
.L001F0F2C:
/* F102C 001F0F2C C040023C */  lui        $2, (0x40C00000 >> 16)
/* F1030 001F0F30 00088244 */  mtc1       $2, $f1
/* F1034 001F0F34 D901013C */  lui        $at, (0x1D900E8 >> 16)
/* F1038 001F0F38 E80020C4 */  lwc1       $f0, (0x1D900E8 & 0xFFFF)($at)
/* F103C 001F0F3C 000B0046 */  add.s      $f12, $f1, $f0
/* F1040 001F0F40 2C44040C */  jal        fptosi
/* F1044 001F0F44 00000000 */   nop
/* F1048 001F0F48 6A010424 */  addiu      $4, $0, 0x16A
/* F104C 001F0F4C 282E4070 */  paddub     $5, $2, $0
/* F1050 001F0F50 81000624 */  addiu      $6, $0, 0x81
/* F1054 001F0F54 21010724 */  addiu      $7, $0, 0x121
/* F1058 001F0F58 80000824 */  addiu      $8, $0, 0x80
/* F105C 001F0F5C 44B3070C */  jal        DrawSellTicket22__Fiiiii
/* F1060 001F0F60 00000000 */   nop
/* F1064 001F0F64 A8948CC7 */  lwc1       $f12, -0x6B58($gp)
/* F1068 001F0F68 2C44040C */  jal        fptosi
/* F106C 001F0F6C 00000000 */   nop
/* F1070 001F0F70 28864070 */  paddub     $16, $2, $0
/* F1074 001F0F74 AC948CC7 */  lwc1       $f12, -0x6B54($gp)
/* F1078 001F0F78 2C44040C */  jal        fptosi
/* F107C 001F0F7C 00000000 */   nop
/* F1080 001F0F80 28260072 */  paddub     $4, $16, $0
/* F1084 001F0F84 282E4070 */  paddub     $5, $2, $0
/* F1088 001F0F88 B4948CC7 */  lwc1       $f12, -0x6B4C($gp)
/* F108C 001F0F8C B0948DC7 */  lwc1       $f13, -0x6B50($gp)
/* F1090 001F0F90 80000624 */  addiu      $6, $0, 0x80
/* F1094 001F0F94 985E080C */  jal        MenuHelpWinDraw__Fiiffi
/* F1098 001F0F98 00000000 */   nop
/* F109C 001F0F9C 8400A427 */  addiu      $4, $sp, 0x84
/* F10A0 001F0FA0 8800A527 */  addiu      $5, $sp, 0x88
/* F10A4 001F0FA4 F0B8080C */  jal        GetMainMenuRightHelpMsgLangOffset__FRiRi
/* F10A8 001F0FA8 00000000 */   nop
/* F10AC 001F0FAC A89481C7 */  lwc1       $f1, -0x6B58($gp)
/* F10B0 001F0FB0 8400A0C7 */  lwc1       $f0, 0x84($sp)
/* F10B4 001F0FB4 20008046 */  cvt.s.w    $f0, $f0
/* F10B8 001F0FB8 000B0046 */  add.s      $f12, $f1, $f0
/* F10BC 001F0FBC 2C44040C */  jal        fptosi
/* F10C0 001F0FC0 00000000 */   nop
/* F10C4 001F0FC4 DA01013C */  lui        $at, (0x1DA2350 >> 16)
/* F10C8 001F0FC8 502322AC */  sw         $2, (0x1DA2350 & 0xFFFF)($at)
/* F10CC 001F0FCC AC9481C7 */  lwc1       $f1, -0x6B54($gp)
/* F10D0 001F0FD0 8800A0C7 */  lwc1       $f0, 0x88($sp)
/* F10D4 001F0FD4 20008046 */  cvt.s.w    $f0, $f0
/* F10D8 001F0FD8 000B0046 */  add.s      $f12, $f1, $f0
/* F10DC 001F0FDC 2C44040C */  jal        fptosi
/* F10E0 001F0FE0 00000000 */   nop
/* F10E4 001F0FE4 DA01013C */  lui        $at, (0x1DA2354 >> 16)
/* F10E8 001F0FE8 542322AC */  sw         $2, (0x1DA2354 & 0xFFFF)($at)
.L001F0FEC:
/* F10EC 001F0FEC D901013C */  lui        $at, (0x1D90264 >> 16)
/* F10F0 001F0FF0 64022384 */  lh         $3, (0x1D90264 & 0xFFFF)($at)
/* F10F4 001F0FF4 02000224 */  addiu      $2, $0, 0x2
/* F10F8 001F0FF8 05006214 */  bne        $3, $2, .L001F1010
/* F10FC 001F0FFC 00000000 */   nop
/* F1100 001F1000 D901013C */  lui        $at, (0x1D900D0 >> 16)
/* F1104 001F1004 D0002484 */  lh         $4, (0x1D900D0 & 0xFFFF)($at)
/* F1108 001F1008 DCA0070C */  jal        ShopPersonDraw__Fi
/* F110C 001F100C 00000000 */   nop
.L001F1010:
/* F1110 001F1010 D901013C */  lui        $at, (0x1D90258 >> 16)
/* F1114 001F1014 58022284 */  lh         $2, (0x1D90258 & 0xFFFF)($at)
/* F1118 001F1018 7B004010 */  beqz       $2, .L001F1208
/* F111C 001F101C 00000000 */   nop
/* F1120 001F1020 DA01013C */  lui        $at, (0x1DA3A9C >> 16)
/* F1124 001F1024 9C3A248C */  lw         $4, (0x1DA3A9C & 0xFFFF)($at)
/* F1128 001F1028 38B4080C */  jal        MenuTextureReload__Fi
/* F112C 001F102C 00000000 */   nop
/* F1130 001F1030 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* F1134 001F1034 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* F1138 001F1038 6437050C */  jal        Step__6ClsMesFv
/* F113C 001F103C 00000000 */   nop
/* F1140 001F1040 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* F1144 001F1044 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* F1148 001F1048 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* F114C 001F104C 00000000 */   nop
/* F1150 001F1050 B894828F */  lw         $2, -0x6B48($gp)
/* F1154 001F1054 10004284 */  lh         $2, 0x10($2)
/* F1158 001F1058 51004128 */  slti       $at, $2, 0x51
/* F115C 001F105C 26002010 */  beqz       $at, .L001F10F8
/* F1160 001F1060 00000000 */   nop
/* F1164 001F1064 2900023C */  lui        $2, %hi(_2851_2)
/* F1168 001F1068 B0294424 */  addiu      $4, $2, %lo(_2851_2)
/* F116C 001F106C 6000A327 */  addiu      $3, $sp, 0x60
/* F1170 001F1070 000082DC */  ld         $2, 0x0($4)
/* F1174 001F1074 080080C4 */  lwc1       $f0, 0x8($4)
/* F1178 001F1078 000062FC */  sd         $2, 0x0($3)
/* F117C 001F107C 080060E4 */  swc1       $f0, 0x8($3)
/* F1180 001F1080 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* F1184 001F1084 D2002284 */  lh         $2, (0x1D900D2 & 0xFFFF)($at)
/* F1188 001F1088 80100200 */  sll        $2, $2, 2
/* F118C 001F108C 21105D00 */  addu       $2, $2, $sp
/* F1190 001F1090 6000458C */  lw         $5, 0x60($2)
/* F1194 001F1094 DA01013C */  lui        $at, (0x1DA698C >> 16)
/* F1198 001F1098 8C69228C */  lw         $2, (0x1DA698C & 0xFFFF)($at)
/* F119C 001F109C 05004510 */  beq        $2, $5, .L001F10B4
/* F11A0 001F10A0 00000000 */   nop
/* F11A4 001F10A4 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F11A8 001F10A8 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F11AC 001F10AC 5441050C */  jal        MakeMesWin__6ClsMesFi
/* F11B0 001F10B0 00000000 */   nop
.L001F10B4:
/* F11B4 001F10B4 01000224 */  addiu      $2, $0, 0x1
/* F11B8 001F10B8 DA01013C */  lui        $at, (0x1DA5368 >> 16)
/* F11BC 001F10BC 685322AC */  sw         $2, (0x1DA5368 & 0xFFFF)($at)
/* F11C0 001F10C0 B4000224 */  addiu      $2, $0, 0xB4
/* F11C4 001F10C4 DA01013C */  lui        $at, (0x1DA52D0 >> 16)
/* F11C8 001F10C8 D05222AC */  sw         $2, (0x1DA52D0 & 0xFFFF)($at)
/* F11CC 001F10CC 68010224 */  addiu      $2, $0, 0x168
/* F11D0 001F10D0 DA01013C */  lui        $at, (0x1DA52D4 >> 16)
/* F11D4 001F10D4 D45222AC */  sw         $2, (0x1DA52D4 & 0xFFFF)($at)
/* F11D8 001F10D8 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F11DC 001F10DC D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F11E0 001F10E0 6437050C */  jal        Step__6ClsMesFv
/* F11E4 001F10E4 00000000 */   nop
/* F11E8 001F10E8 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F11EC 001F10EC D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F11F0 001F10F0 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* F11F4 001F10F4 00000000 */   nop
.L001F10F8:
/* F11F8 001F10F8 D901013C */  lui        $at, (0x1D90250 >> 16)
/* F11FC 001F10FC 50022384 */  lh         $3, (0x1D90250 & 0xFFFF)($at)
/* F1200 001F1100 0E000224 */  addiu      $2, $0, 0xE
/* F1204 001F1104 06006210 */  beq        $3, $2, .L001F1120
/* F1208 001F1108 00000000 */   nop
/* F120C 001F110C 0D000224 */  addiu      $2, $0, 0xD
/* F1210 001F1110 03006210 */  beq        $3, $2, .L001F1120
/* F1214 001F1114 00000000 */   nop
/* F1218 001F1118 39000010 */  b          .L001F1200
/* F121C 001F111C 00000000 */   nop
.L001F1120:
/* F1220 001F1120 8C00A227 */  addiu      $2, $sp, 0x8C
/* F1224 001F1124 188880C7 */  lwc1       $f0, -0x77E8($gp)
/* F1228 001F1128 000040E4 */  swc1       $f0, 0x0($2)
/* F122C 001F112C 40100300 */  sll        $2, $3, 1
/* F1230 001F1130 21105D00 */  addu       $2, $2, $sp
/* F1234 001F1134 72004584 */  lh         $5, 0x72($2)
/* F1238 001F1138 DA01013C */  lui        $at, (0x1DA224C >> 16)
/* F123C 001F113C 4C22228C */  lw         $2, (0x1DA224C & 0xFFFF)($at)
/* F1240 001F1140 05004510 */  beq        $2, $5, .L001F1158
/* F1244 001F1144 00000000 */   nop
/* F1248 001F1148 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* F124C 001F114C 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* F1250 001F1150 5441050C */  jal        MakeMesWin__6ClsMesFi
/* F1254 001F1154 00000000 */   nop
.L001F1158:
/* F1258 001F1158 2900023C */  lui        $2, %hi(_2860_2)
/* F125C 001F115C C0294224 */  addiu      $2, $2, %lo(_2860_2)
/* F1260 001F1160 7000A427 */  addiu      $4, $sp, 0x70
/* F1264 001F1164 000043DC */  ld         $3, 0x0($2)
/* F1268 001F1168 080040C4 */  lwc1       $f0, 0x8($2)
/* F126C 001F116C 0C004284 */  lh         $2, 0xC($2)
/* F1270 001F1170 000083FC */  sd         $3, 0x0($4)
/* F1274 001F1174 080080E4 */  swc1       $f0, 0x8($4)
/* F1278 001F1178 0C0082A4 */  sh         $2, 0xC($4)
/* F127C 001F117C D901013C */  lui        $at, (0x1D90260 >> 16)
/* F1280 001F1180 60022284 */  lh         $2, (0x1D90260 & 0xFFFF)($at)
/* F1284 001F1184 40100200 */  sll        $2, $2, 1
/* F1288 001F1188 21205D00 */  addu       $4, $2, $sp
/* F128C 001F118C 70008280 */  lb         $2, 0x70($4)
/* F1290 001F1190 2C014224 */  addiu      $2, $2, 0x12C
/* F1294 001F1194 DA01013C */  lui        $at, (0x1DA0B90 >> 16)
/* F1298 001F1198 900B22AC */  sw         $2, (0x1DA0B90 & 0xFFFF)($at)
/* F129C 001F119C BE000224 */  addiu      $2, $0, 0xBE
/* F12A0 001F11A0 DA01013C */  lui        $at, (0x1DA0B94 >> 16)
/* F12A4 001F11A4 940B22AC */  sw         $2, (0x1DA0B94 & 0xFFFF)($at)
/* F12A8 001F11A8 D901013C */  lui        $at, (0x1D90250 >> 16)
/* F12AC 001F11AC 50022384 */  lh         $3, (0x1D90250 & 0xFFFF)($at)
/* F12B0 001F11B0 0E000224 */  addiu      $2, $0, 0xE
/* F12B4 001F11B4 05006214 */  bne        $3, $2, .L001F11CC
/* F12B8 001F11B8 00000000 */   nop
/* F12BC 001F11BC 71008280 */  lb         $2, 0x71($4)
/* F12C0 001F11C0 64004224 */  addiu      $2, $2, 0x64
/* F12C4 001F11C4 DA01013C */  lui        $at, (0x1DA0B90 >> 16)
/* F12C8 001F11C8 900B22AC */  sw         $2, (0x1DA0B90 & 0xFFFF)($at)
.L001F11CC:
/* F12CC 001F11CC 01000224 */  addiu      $2, $0, 0x1
/* F12D0 001F11D0 DA01013C */  lui        $at, (0x1DA0C28 >> 16)
/* F12D4 001F11D4 280C22AC */  sw         $2, (0x1DA0C28 & 0xFFFF)($at)
/* F12D8 001F11D8 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* F12DC 001F11DC 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* F12E0 001F11E0 6437050C */  jal        Step__6ClsMesFv
/* F12E4 001F11E4 00000000 */   nop
/* F12E8 001F11E8 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* F12EC 001F11EC 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* F12F0 001F11F0 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* F12F4 001F11F4 00000000 */   nop
/* F12F8 001F11F8 03000010 */  b          .L001F1208
/* F12FC 001F11FC 00000000 */   nop
.L001F1200:
/* F1300 001F1200 DA01013C */  lui        $at, (0x1DA0C28 >> 16)
/* F1304 001F1204 280C20AC */  sw         $0, (0x1DA0C28 & 0xFFFF)($at)
.L001F1208:
/* F1308 001F1208 01000424 */  addiu      $4, $0, 0x1
/* F130C 001F120C B8B5070C */  jal        ShopModelMsgFunc__Fi
/* F1310 001F1210 00000000 */   nop
/* F1314 001F1214 A89F070C */  jal        ShopFadeoutDraw__Fv
/* F1318 001F1218 00000000 */   nop
/* F131C 001F121C 01000424 */  addiu      $4, $0, 0x1
/* F1320 001F1220 046F050C */  jal        setbilinear__Fi
/* F1324 001F1224 00000000 */   nop
/* F1328 001F1228 5000BF7B */  lq         $31, 0x50($sp)
/* F132C 001F122C 4000B47B */  lq         $20, 0x40($sp)
/* F1330 001F1230 3000B37B */  lq         $19, 0x30($sp)
/* F1334 001F1234 2000B27B */  lq         $18, 0x20($sp)
/* F1338 001F1238 1000B17B */  lq         $17, 0x10($sp)
/* F133C 001F123C 0000B07B */  lq         $16, 0x0($sp)
/* F1340 001F1240 9000BD27 */  addiu      $sp, $sp, 0x90
/* F1344 001F1244 0800E003 */  jr         $31
/* F1348 001F1248 00000000 */   nop
/* F134C 001F124C 00000000 */  nop
