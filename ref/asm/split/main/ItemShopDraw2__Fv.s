.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ItemShopDraw2__Fv
/* 0F0900 001F0800 70FFBD27 */  addiu       $29, $29, -0x90
/* 0F0904 001F0804 5000BF7F */  sq          $31, 0x50($29)
/* 0F0908 001F0808 4000B47F */  sq          $20, 0x40($29)
/* 0F090C 001F080C 3000B37F */  sq          $19, 0x30($29)
/* 0F0910 001F0810 2000B27F */  sq          $18, 0x20($29)
/* 0F0914 001F0814 1000B17F */  sq          $17, 0x10($29)
/* 0F0918 001F0818 0000B07F */  sq          $16, 0x0($29)
/* 0F091C 001F081C 28260070 */  paddub      $4, $0, $0
/* 0F0920 001F0820 046F050C */  jal         setbilinear__Fi
/* 0F0924 001F0824 00000000 */   nop
/* 0F0928 001F0828 DA01023C */  lui         $2, %hi(MenuCamera)
/* 0F092C 001F082C D0084424 */  addiu       $4, $2, %lo(MenuCamera)
/* 0F0930 001F0830 7CAF080C */  jal         MenuWorldTrans__FP7CCamera
/* 0F0934 001F0834 00000000 */   nop
/* 0F0938 001F0838 40000424 */  addiu       $4, $0, 0x40
/* 0F093C 001F083C D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0F0940 001F0840 50022384 */  lh          $3, %lo(ShopMenu + 0x180)($1)
/* 0F0944 001F0844 02000224 */  addiu       $2, $0, 0x2
/* 0F0948 001F0848 0E006210 */  beq         $3, $2, .L001F0884
/* 0F094C 001F084C 00000000 */   nop
/* 0F0950 001F0850 01000224 */  addiu       $2, $0, 0x1
/* 0F0954 001F0854 03006210 */  beq         $3, $2, .L001F0864
/* 0F0958 001F0858 00000000 */   nop
/* 0F095C 001F085C 0D000010 */  b           .L001F0894
/* 0F0960 001F0860 00000000 */   nop
.L001F0864:
/* 0F0964 001F0864 80000424 */  addiu       $4, $0, 0x80
/* 0F0968 001F0868 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0F096C 001F086C 5402238C */  lw          $3, %lo(ShopMenu + 0x184)($1)
/* 0F0970 001F0870 40100300 */  sll         $2, $3, 1
/* 0F0974 001F0874 21104300 */  addu        $2, $2, $3
/* 0F0978 001F0878 23208200 */  subu        $4, $4, $2
/* 0F097C 001F087C 05000010 */  b           .L001F0894
/* 0F0980 001F0880 00000000 */   nop
.L001F0884:
/* 0F0984 001F0884 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0F0988 001F0888 5402228C */  lw          $2, %lo(ShopMenu + 0x184)($1)
/* 0F098C 001F088C 80100200 */  sll         $2, $2, 2
/* 0F0990 001F0890 40004424 */  addiu       $4, $2, 0x40
.L001F0894:
/* 0F0994 001F0894 40008128 */  slti        $1, $4, 0x40
/* 0F0998 001F0898 02002010 */  beqz        $1, .L001F08A4
/* 0F099C 001F089C 00000000 */   nop
/* 0F09A0 001F08A0 40000424 */  addiu       $4, $0, 0x40
.L001F08A4:
/* 0F09A4 001F08A4 81008128 */  slti        $1, $4, 0x81
/* 0F09A8 001F08A8 02002014 */  bnez        $1, .L001F08B4
/* 0F09AC 001F08AC 00000000 */   nop
/* 0F09B0 001F08B0 80000424 */  addiu       $4, $0, 0x80
.L001F08B4:
/* 0F09B4 001F08B4 80000524 */  addiu       $5, $0, 0x80
/* 0F09B8 001F08B8 ACB4080C */  jal         FrameImageDraw__Fii
/* 0F09BC 001F08BC 00000000 */   nop
/* 0F09C0 001F08C0 D901013C */  lui         $1, %hi(ShopMenu + 0x188)
/* 0F09C4 001F08C4 58022284 */  lh          $2, %lo(ShopMenu + 0x188)($1)
/* 0F09C8 001F08C8 C8014010 */  beqz        $2, .L001F0FEC
/* 0F09CC 001F08CC 00000000 */   nop
/* 0F09D0 001F08D0 D901013C */  lui         $1, %hi(ShopMenu + 0x18A)
/* 0F09D4 001F08D4 5A022484 */  lh          $4, %lo(ShopMenu + 0x18A)($1)
/* 0F09D8 001F08D8 38B4080C */  jal         MenuTextureReload__Fi
/* 0F09DC 001F08DC 00000000 */   nop
/* 0F09E0 001F08E0 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0F09E4 001F08E4 DC00248C */  lw          $4, %lo(ShopMenu + 0xC)($1)
/* 0F09E8 001F08E8 D8BD080C */  jal         PersonalRetMax__Fi
/* 0F09EC 001F08EC 00000000 */   nop
/* 0F09F0 001F08F0 28964070 */  paddub      $18, $2, $0
/* 0F09F4 001F08F4 7F000624 */  addiu       $6, $0, 0x7F
/* 0F09F8 001F08F8 D901013C */  lui         $1, %hi(ShopMenu + 0x20)
/* 0F09FC 001F08FC F000238C */  lw          $3, %lo(ShopMenu + 0x20)($1)
/* 0F0A00 001F0900 80100300 */  sll         $2, $3, 2
/* 0F0A04 001F0904 21104300 */  addu        $2, $2, $3
/* 0F0A08 001F0908 C0100200 */  sll         $2, $2, 3
/* 0F0A0C 001F090C 2388C200 */  subu        $17, $6, $2
/* 0F0A10 001F0910 00009144 */  mtc1        $17, $f0
/* 0F0A14 001F0914 00000000 */  nop
/* 0F0A18 001F0918 20008046 */  cvt.s.w     $f0, $f0
/* 0F0A1C 001F091C D901013C */  lui         $1, %hi(ShopMenu + 0x18)
/* 0F0A20 001F0920 E80022C4 */  lwc1        $f2, %lo(ShopMenu + 0x18)($1)
/* 0F0A24 001F0924 41000246 */  sub.s       $f1, $f0, $f2
/* 0F0A28 001F0928 8040023C */  lui         $2, (0x40800000 >> 16)
/* 0F0A2C 001F092C 00008244 */  mtc1        $2, $f0
/* 0F0A30 001F0930 00000000 */  nop
/* 0F0A34 001F0934 03080046 */  div.s       $f0, $f1, $f0
/* 0F0A38 001F0938 00100046 */  add.s       $f0, $f2, $f0
/* 0F0A3C 001F093C D901013C */  lui         $1, %hi(ShopMenu + 0x18)
/* 0F0A40 001F0940 E80020E4 */  swc1        $f0, %lo(ShopMenu + 0x18)($1)
/* 0F0A44 001F0944 68011024 */  addiu       $16, $0, 0x168
/* 0F0A48 001F0948 D901013C */  lui         $1, %hi(ShopMenu + 0x18)
/* 0F0A4C 001F094C E8002CC4 */  lwc1        $f12, %lo(ShopMenu + 0x18)($1)
/* 0F0A50 001F0950 2C44040C */  jal         fptosi
/* 0F0A54 001F0954 00000000 */   nop
/* 0F0A58 001F0958 288E4070 */  paddub      $17, $2, $0
/* 0F0A5C 001F095C 28260070 */  paddub      $4, $0, $0
/* 0F0A60 001F0960 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0F0A64 001F0964 DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0F0A68 001F0968 01000224 */  addiu       $2, $0, 0x1
/* 0F0A6C 001F096C 02006214 */  bne         $3, $2, .L001F0978
/* 0F0A70 001F0970 00000000 */   nop
/* 0F0A74 001F0974 02000424 */  addiu       $4, $0, 0x2
.L001F0978:
/* 0F0A78 001F0978 282E4072 */  paddub      $5, $18, $0
/* 0F0A7C 001F097C 68010624 */  addiu       $6, $0, 0x168
/* 0F0A80 001F0980 283E2072 */  paddub      $7, $17, $0
/* 0F0A84 001F0984 81000824 */  addiu       $8, $0, 0x81
/* 0F0A88 001F0988 21010924 */  addiu       $9, $0, 0x121
/* 0F0A8C 001F098C A4978A8F */  lw          $10, -0x685C($28)
/* 0F0A90 001F0990 80000B24 */  addiu       $11, $0, 0x80
/* 0F0A94 001F0994 70C3080C */  jal         DrawPerBoardDraw__FiiiiiiP8CTexturei
/* 0F0A98 001F0998 00000000 */   nop
/* 0F0A9C 001F099C 06002726 */  addiu       $7, $17, 0x6
/* 0F0AA0 001F09A0 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0F0AA4 001F09A4 DC00248C */  lw          $4, %lo(ShopMenu + 0xC)($1)
/* 0F0AA8 001F09A8 282E4072 */  paddub      $5, $18, $0
/* 0F0AAC 001F09AC 6A010624 */  addiu       $6, $0, 0x16A
/* 0F0AB0 001F09B0 81000824 */  addiu       $8, $0, 0x81
/* 0F0AB4 001F09B4 21010924 */  addiu       $9, $0, 0x121
/* 0F0AB8 001F09B8 80000A24 */  addiu       $10, $0, 0x80
/* 0F0ABC 001F09BC B4BE080C */  jal         CommonIconDraw__Fiiiiiii
/* 0F0AC0 001F09C0 00000000 */   nop
/* 0F0AC4 001F09C4 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0F0AC8 001F09C8 DC00248C */  lw          $4, %lo(ShopMenu + 0xC)($1)
/* 0F0ACC 001F09CC 282E4072 */  paddub      $5, $18, $0
/* 0F0AD0 001F09D0 54010624 */  addiu       $6, $0, 0x154
/* 0F0AD4 001F09D4 78000724 */  addiu       $7, $0, 0x78
/* 0F0AD8 001F09D8 A497888F */  lw          $8, -0x685C($28)
/* 0F0ADC 001F09DC 80000924 */  addiu       $9, $0, 0x80
/* 0F0AE0 001F09E0 50C0080C */  jal         PersonalBoardOptionDraw__FiiiiP8CTexturei
/* 0F0AE4 001F09E4 00000000 */   nop
/* 0F0AE8 001F09E8 32020424 */  addiu       $4, $0, 0x232
/* 0F0AEC 001F09EC 0C010524 */  addiu       $5, $0, 0x10C
/* 0F0AF0 001F09F0 80000624 */  addiu       $6, $0, 0x80
/* 0F0AF4 001F09F4 18C4080C */  jal         CommonTrushDraw__Fiii
/* 0F0AF8 001F09F8 00000000 */   nop
/* 0F0AFC 001F09FC 8494828F */  lw          $2, -0x6B7C($28)
/* 0F0B00 001F0A00 46434694 */  lhu         $6, 0x4346($2)
/* 0F0B04 001F0A04 63010424 */  addiu       $4, $0, 0x163
/* 0F0B08 001F0A08 20010524 */  addiu       $5, $0, 0x120
/* 0F0B0C 001F0A0C 80000724 */  addiu       $7, $0, 0x80
/* 0F0B10 001F0A10 D8C4080C */  jal         CommonMoneyBoardDraw__Fiiii
/* 0F0B14 001F0A14 00000000 */   nop
/* 0F0B18 001F0A18 C8010424 */  addiu       $4, $0, 0x1C8
/* 0F0B1C 001F0A1C 20010524 */  addiu       $5, $0, 0x120
/* 0F0B20 001F0A20 80000624 */  addiu       $6, $0, 0x80
/* 0F0B24 001F0A24 90B1070C */  jal         DrawMoneyCheckBoard2__Fiii
/* 0F0B28 001F0A28 00000000 */   nop
/* 0F0B2C 001F0A2C 32000424 */  addiu       $4, $0, 0x32
/* 0F0B30 001F0A30 78000524 */  addiu       $5, $0, 0x78
/* 0F0B34 001F0A34 80000624 */  addiu       $6, $0, 0x80
/* 0F0B38 001F0A38 DCB0070C */  jal         DrawItemShopBoard2__Fiii
/* 0F0B3C 001F0A3C 00000000 */   nop
/* 0F0B40 001F0A40 80000424 */  addiu       $4, $0, 0x80
/* 0F0B44 001F0A44 C89C070C */  jal         ChargeShopLRDraw__Fi
/* 0F0B48 001F0A48 00000000 */   nop
/* 0F0B4C 001F0A4C D901023C */  lui         $2, %hi(ShopDataMove)
/* 0F0B50 001F0A50 80024424 */  addiu       $4, $2, %lo(ShopDataMove)
/* 0F0B54 001F0A54 809B070C */  jal         IconAutoMoveDraw__12ShopIconMoveFv
/* 0F0B58 001F0A58 00000000 */   nop
/* 0F0B5C 001F0A5C C4948587 */  lh          $5, -0x6B3C($28)
/* 0F0B60 001F0A60 D901023C */  lui         $2, %hi(ShopDataMove)
/* 0F0B64 001F0A64 80024424 */  addiu       $4, $2, %lo(ShopDataMove)
/* 0F0B68 001F0A68 28360070 */  paddub      $6, $0, $0
/* 0F0B6C 001F0A6C 689A070C */  jal         IconAutoMove__12ShopIconMoveFii
/* 0F0B70 001F0A70 00000000 */   nop
/* 0F0B74 001F0A74 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0F0B78 001F0A78 D2002484 */  lh          $4, %lo(ShopMenu + 0x2)($1)
/* 0F0B7C 001F0A7C 01000224 */  addiu       $2, $0, 0x1
/* 0F0B80 001F0A80 0D008210 */  beq         $4, $2, .L001F0AB8
/* 0F0B84 001F0A84 00000000 */   nop
/* 0F0B88 001F0A88 06008010 */  beqz        $4, .L001F0AA4
/* 0F0B8C 001F0A8C 00000000 */   nop
/* 0F0B90 001F0A90 02000224 */  addiu       $2, $0, 0x2
/* 0F0B94 001F0A94 03008210 */  beq         $4, $2, .L001F0AA4
/* 0F0B98 001F0A98 00000000 */   nop
/* 0F0B9C 001F0A9C 0A000010 */  b           .L001F0AC8
/* 0F0BA0 001F0AA0 00000000 */   nop
.L001F0AA4:
/* 0F0BA4 001F0AA4 22001024 */  addiu       $16, $0, 0x22
/* 0F0BA8 001F0AA8 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0F0BAC 001F0AAC 46023390 */  lbu         $19, %lo(ShopMenu + 0x176)($1)
/* 0F0BB0 001F0AB0 05000010 */  b           .L001F0AC8
/* 0F0BB4 001F0AB4 00000000 */   nop
.L001F0AB8:
/* 0F0BB8 001F0AB8 44011024 */  addiu       $16, $0, 0x144
/* 0F0BBC 001F0ABC D901013C */  lui         $1, %hi(ShopMenu + 0x20)
/* 0F0BC0 001F0AC0 F000338C */  lw          $19, %lo(ShopMenu + 0x20)($1)
/* 0F0BC4 001F0AC4 00000000 */  nop
.L001F0AC8:
/* 0F0BC8 001F0AC8 28160070 */  paddub      $2, $0, $0
/* 0F0BCC 001F0ACC B894838F */  lw          $3, -0x6B48($28)
/* 0F0BD0 001F0AD0 10006384 */  lh          $3, 0x10($3)
/* 0F0BD4 001F0AD4 51006328 */  slti        $3, $3, 0x51
/* 0F0BD8 001F0AD8 04006014 */  bnez        $3, .L001F0AEC
/* 0F0BDC 001F0ADC 00000000 */   nop
/* 0F0BE0 001F0AE0 02000224 */  addiu       $2, $0, 0x2
/* 0F0BE4 001F0AE4 24000010 */  b           .L001F0B78
/* 0F0BE8 001F0AE8 00000000 */   nop
.L001F0AEC:
/* 0F0BEC 001F0AEC 02000324 */  addiu       $3, $0, 0x2
/* 0F0BF0 001F0AF0 21008310 */  beq         $4, $3, .L001F0B78
/* 0F0BF4 001F0AF4 00000000 */   nop
/* 0F0BF8 001F0AF8 11008010 */  beqz        $4, .L001F0B40
/* 0F0BFC 001F0AFC 00000000 */   nop
/* 0F0C00 001F0B00 01000324 */  addiu       $3, $0, 0x1
/* 0F0C04 001F0B04 03008310 */  beq         $4, $3, .L001F0B14
/* 0F0C08 001F0B08 00000000 */   nop
/* 0F0C0C 001F0B0C 1A000010 */  b           .L001F0B78
/* 0F0C10 001F0B10 00000000 */   nop
.L001F0B14:
/* 0F0C14 001F0B14 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0F0C18 001F0B18 DC00248C */  lw          $4, %lo(ShopMenu + 0xC)($1)
/* 0F0C1C 001F0B1C D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0F0C20 001F0B20 E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0F0C24 001F0B24 38C5080C */  jal         SearchBoardNowPosItemExist__Fii
/* 0F0C28 001F0B28 00000000 */   nop
/* 0F0C2C 001F0B2C 51004128 */  slti        $1, $2, 0x51
/* 0F0C30 001F0B30 01000224 */  addiu       $2, $0, 0x1
/* 0F0C34 001F0B34 0B100100 */  movn        $2, $0, $1
/* 0F0C38 001F0B38 0F000010 */  b           .L001F0B78
/* 0F0C3C 001F0B3C 00000000 */   nop
.L001F0B40:
/* 0F0C40 001F0B40 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0F0C44 001F0B44 E400248C */  lw          $4, %lo(ShopMenu + 0x14)($1)
/* 0F0C48 001F0B48 80190400 */  sll         $3, $4, 6
/* 0F0C4C 001F0B4C 23186400 */  subu        $3, $3, $4
/* 0F0C50 001F0B50 80200300 */  sll         $4, $3, 2
/* 0F0C54 001F0B54 A094838F */  lw          $3, -0x6B60($28)
/* 0F0C58 001F0B58 21186400 */  addu        $3, $3, $4
/* 0F0C5C 001F0B5C 00006384 */  lh          $3, 0x0($3)
/* 0F0C60 001F0B60 52006128 */  slti        $1, $3, 0x52
/* 0F0C64 001F0B64 04002014 */  bnez        $1, .L001F0B78
/* 0F0C68 001F0B68 00000000 */   nop
/* 0F0C6C 001F0B6C 01000224 */  addiu       $2, $0, 0x1
/* 0F0C70 001F0B70 01000010 */  b           .L001F0B78
/* 0F0C74 001F0B74 00000000 */   nop
.L001F0B78:
/* 0F0C78 001F0B78 28460070 */  paddub      $8, $0, $0
/* 0F0C7C 001F0B7C D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0F0C80 001F0B80 D2002484 */  lh          $4, %lo(ShopMenu + 0x2)($1)
/* 0F0C84 001F0B84 02000324 */  addiu       $3, $0, 0x2
/* 0F0C88 001F0B88 03008310 */  beq         $4, $3, .L001F0B98
/* 0F0C8C 001F0B8C 00000000 */   nop
/* 0F0C90 001F0B90 02000010 */  b           .L001F0B9C
/* 0F0C94 001F0B94 00000000 */   nop
.L001F0B98:
/* 0F0C98 001F0B98 01000824 */  addiu       $8, $0, 0x1
.L001F0B9C:
/* 0F0C9C 001F0B9C 28260072 */  paddub      $4, $16, $0
/* 0F0CA0 001F0BA0 84000524 */  addiu       $5, $0, 0x84
/* 0F0CA4 001F0BA4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0F0CA8 001F0BA8 E400268C */  lw          $6, %lo(ShopMenu + 0x14)($1)
/* 0F0CAC 001F0BAC 283E6072 */  paddub      $7, $19, $0
/* 0F0CB0 001F0BB0 284E4070 */  paddub      $9, $2, $0
/* 0F0CB4 001F0BB4 80000A24 */  addiu       $10, $0, 0x80
/* 0F0CB8 001F0BB8 349D070C */  jal         ShopCurDraw__Fiiiiiii
/* 0F0CBC 001F0BBC 00000000 */   nop
/* 0F0CC0 001F0BC0 4C000424 */  addiu       $4, $0, 0x4C
/* 0F0CC4 001F0BC4 2A000524 */  addiu       $5, $0, 0x2A
/* 0F0CC8 001F0BC8 28360070 */  paddub      $6, $0, $0
/* 0F0CCC 001F0BCC 80000724 */  addiu       $7, $0, 0x80
/* 0F0CD0 001F0BD0 F49D070C */  jal         DrawShopIcon__Fiiii
/* 0F0CD4 001F0BD4 00000000 */   nop
/* 0F0CD8 001F0BD8 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0F0CDC 001F0BDC D2002284 */  lh          $2, %lo(ShopMenu + 0x2)($1)
/* 0F0CE0 001F0BE0 01000624 */  addiu       $6, $0, 0x1
/* 0F0CE4 001F0BE4 50004610 */  beq         $2, $6, .L001F0D28
/* 0F0CE8 001F0BE8 00000000 */   nop
/* 0F0CEC 001F0BEC 03004010 */  beqz        $2, .L001F0BFC
/* 0F0CF0 001F0BF0 00000000 */   nop
/* 0F0CF4 001F0BF4 CD000010 */  b           .L001F0F2C
/* 0F0CF8 001F0BF8 00000000 */   nop
.L001F0BFC:
/* 0F0CFC 001F0BFC D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0F0D00 001F0C00 E400298C */  lw          $9, %lo(ShopMenu + 0x14)($1)
/* 0F0D04 001F0C04 80110900 */  sll         $2, $9, 6
/* 0F0D08 001F0C08 23104900 */  subu        $2, $2, $9
/* 0F0D0C 001F0C0C 80400200 */  sll         $8, $2, 2
/* 0F0D10 001F0C10 A094828F */  lw          $2, -0x6B60($28)
/* 0F0D14 001F0C14 21104800 */  addu        $2, $2, $8
/* 0F0D18 001F0C18 00004784 */  lh          $7, 0x0($2)
/* 0F0D1C 001F0C1C 5100E228 */  slti        $2, $7, 0x51
/* 0F0D20 001F0C20 C2004014 */  bnez        $2, .L001F0F2C
/* 0F0D24 001F0C24 00000000 */   nop
/* 0F0D28 001F0C28 28960070 */  paddub      $18, $0, $0
/* 0F0D2C 001F0C2C 80180900 */  sll         $3, $9, 2
/* 0F0D30 001F0C30 9094828F */  lw          $2, -0x6B70($28)
/* 0F0D34 001F0C34 21104300 */  addu        $2, $2, $3
/* 0F0D38 001F0C38 0000438C */  lw          $3, 0x0($2)
/* 0F0D3C 001F0C3C 02000224 */  addiu       $2, $0, 0x2
/* 0F0D40 001F0C40 02006214 */  bne         $3, $2, .L001F0C4C
/* 0F0D44 001F0C44 00000000 */   nop
/* 0F0D48 001F0C48 2896C070 */  paddub      $18, $6, $0
.L001F0C4C:
/* 0F0D4C 001F0C4C 2826E070 */  paddub      $4, $7, $0
/* 0F0D50 001F0C50 282E4072 */  paddub      $5, $18, $0
/* 0F0D54 001F0C54 B4AC070C */  jal         CalItemMoney__Fii
/* 0F0D58 001F0C58 00000000 */   nop
/* 0F0D5C 001F0C5C 289E4070 */  paddub      $19, $2, $0
/* 0F0D60 001F0C60 0101E228 */  slti        $2, $7, 0x101
/* 0F0D64 001F0C64 07004014 */  bnez        $2, .L001F0C84
/* 0F0D68 001F0C68 00000000 */   nop
/* 0F0D6C 001F0C6C A094828F */  lw          $2, -0x6B60($28)
/* 0F0D70 001F0C70 21104800 */  addu        $2, $2, $8
/* 0F0D74 001F0C74 04004424 */  addiu       $4, $2, 0x4
/* 0F0D78 001F0C78 C4AC070C */  jal         WeaponCalMoney__FP11WEAPON_HAVEi
/* 0F0D7C 001F0C7C 00000000 */   nop
/* 0F0D80 001F0C80 21986202 */  addu        $19, $19, $2
.L001F0C84:
/* 0F0D84 001F0C84 02006106 */  bgez        $19, .L001F0C90
/* 0F0D88 001F0C88 00000000 */   nop
/* 0F0D8C 001F0C8C 01001324 */  addiu       $19, $0, 0x1
.L001F0C90:
/* 0F0D90 001F0C90 05000624 */  addiu       $6, $0, 0x5
/* 0F0D94 001F0C94 1A002601 */  div         $0, $9, $6
/* 0F0D98 001F0C98 00000000 */  nop
/* 0F0D9C 001F0C9C 00000000 */  nop
/* 0F0DA0 001F0CA0 10180000 */  mfhi        $3
/* 0F0DA4 001F0CA4 80100300 */  sll         $2, $3, 2
/* 0F0DA8 001F0CA8 21104300 */  addu        $2, $2, $3
/* 0F0DAC 001F0CAC C0100200 */  sll         $2, $2, 3
/* 0F0DB0 001F0CB0 4A005024 */  addiu       $16, $2, 0x4A
/* 0F0DB4 001F0CB4 1A002601 */  div         $0, $9, $6
/* 0F0DB8 001F0CB8 0200C014 */  bnez        $6, .L001F0CC4
/* 0F0DBC 001F0CBC 00000000 */   nop
/* 0F0DC0 001F0CC0 CD010000 */  break       0, 7
.L001F0CC4:
/* 0F0DC4 001F0CC4 12180000 */  mflo        $3
/* 0F0DC8 001F0CC8 80100300 */  sll         $2, $3, 2
/* 0F0DCC 001F0CCC 21104300 */  addu        $2, $2, $3
/* 0F0DD0 001F0CD0 C0100200 */  sll         $2, $2, 3
/* 0F0DD4 001F0CD4 00008244 */  mtc1        $2, $f0
/* 0F0DD8 001F0CD8 00000000 */  nop
/* 0F0DDC 001F0CDC A0008046 */  cvt.s.w     $f2, $f0
/* 0F0DE0 001F0CE0 C040023C */  lui         $2, (0x40C00000 >> 16)
/* 0F0DE4 001F0CE4 00088244 */  mtc1        $2, $f1
/* 0F0DE8 001F0CE8 D901013C */  lui         $1, %hi(ShopMenu + 0x16C)
/* 0F0DEC 001F0CEC 3C0220C4 */  lwc1        $f0, %lo(ShopMenu + 0x16C)($1)
/* 0F0DF0 001F0CF0 00080046 */  add.s       $f0, $f1, $f0
/* 0F0DF4 001F0CF4 00030246 */  add.s       $f12, $f0, $f2
/* 0F0DF8 001F0CF8 2C44040C */  jal         fptosi
/* 0F0DFC 001F0CFC 00000000 */   nop
/* 0F0E00 001F0D00 288E4070 */  paddub      $17, $2, $0
/* 0F0E04 001F0D04 28264072 */  paddub      $4, $18, $0
/* 0F0E08 001F0D08 282E6072 */  paddub      $5, $19, $0
/* 0F0E0C 001F0D0C 28360072 */  paddub      $6, $16, $0
/* 0F0E10 001F0D10 283E2072 */  paddub      $7, $17, $0
/* 0F0E14 001F0D14 80000824 */  addiu       $8, $0, 0x80
/* 0F0E18 001F0D18 54B2070C */  jal         DrawBigSellTicket__Fiiiii
/* 0F0E1C 001F0D1C 00000000 */   nop
/* 0F0E20 001F0D20 82000010 */  b           .L001F0F2C
/* 0F0E24 001F0D24 00000000 */   nop
.L001F0D28:
/* 0F0E28 001F0D28 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0F0E2C 001F0D2C 50022384 */  lh          $3, %lo(ShopMenu + 0x180)($1)
/* 0F0E30 001F0D30 0E000224 */  addiu       $2, $0, 0xE
/* 0F0E34 001F0D34 7D006214 */  bne         $3, $2, .L001F0F2C
/* 0F0E38 001F0D38 00000000 */   nop
/* 0F0E3C 001F0D3C D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0F0E40 001F0D40 DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0F0E44 001F0D44 1B006610 */  beq         $3, $6, .L001F0DB4
/* 0F0E48 001F0D48 00000000 */   nop
/* 0F0E4C 001F0D4C 02000224 */  addiu       $2, $0, 0x2
/* 0F0E50 001F0D50 0E006210 */  beq         $3, $2, .L001F0D8C
/* 0F0E54 001F0D54 00000000 */   nop
/* 0F0E58 001F0D58 03006010 */  beqz        $3, .L001F0D68
/* 0F0E5C 001F0D5C 00000000 */   nop
/* 0F0E60 001F0D60 2C000010 */  b           .L001F0E14
/* 0F0E64 001F0D64 00000000 */   nop
.L001F0D68:
/* 0F0E68 001F0D68 8494828F */  lw          $2, -0x6B7C($28)
/* 0F0E6C 001F0D6C 60434324 */  addiu       $3, $2, 0x4360
/* 0F0E70 001F0D70 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0F0E74 001F0D74 E400228C */  lw          $2, %lo(ShopMenu + 0x14)($1)
/* 0F0E78 001F0D78 40100200 */  sll         $2, $2, 1
/* 0F0E7C 001F0D7C 21104300 */  addu        $2, $2, $3
/* 0F0E80 001F0D80 0E005484 */  lh          $20, 0xE($2)
/* 0F0E84 001F0D84 23000010 */  b           .L001F0E14
/* 0F0E88 001F0D88 00000000 */   nop
.L001F0D8C:
/* 0F0E8C 001F0D8C 8494828F */  lw          $2, -0x6B7C($28)
/* 0F0E90 001F0D90 04054324 */  addiu       $3, $2, 0x504
/* 0F0E94 001F0D94 F87F6324 */  addiu       $3, $3, 0x7FF8
/* 0F0E98 001F0D98 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0F0E9C 001F0D9C E400228C */  lw          $2, %lo(ShopMenu + 0x14)($1)
/* 0F0EA0 001F0DA0 40110200 */  sll         $2, $2, 5
/* 0F0EA4 001F0DA4 21106200 */  addu        $2, $3, $2
/* 0F0EA8 001F0DA8 00005484 */  lh          $20, 0x0($2)
/* 0F0EAC 001F0DAC 19000010 */  b           .L001F0E14
/* 0F0EB0 001F0DB0 00000000 */   nop
.L001F0DB4:
/* 0F0EB4 001F0DB4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0F0EB8 001F0DB8 E400278C */  lw          $7, %lo(ShopMenu + 0x14)($1)
/* 0F0EBC 001F0DBC 0A000224 */  addiu       $2, $0, 0xA
/* 0F0EC0 001F0DC0 1A00E200 */  div         $0, $7, $2
/* 0F0EC4 001F0DC4 02004014 */  bnez        $2, .L001F0DD0
/* 0F0EC8 001F0DC8 00000000 */   nop
/* 0F0ECC 001F0DCC CD010000 */  break       0, 7
.L001F0DD0:
/* 0F0ED0 001F0DD0 12180000 */  mflo        $3
/* 0F0ED4 001F0DD4 8494868F */  lw          $6, -0x6B7C($28)
/* 0F0ED8 001F0DD8 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0F0EDC 001F0DDC 18106200 */  mult        $2, $3, $2
/* 0F0EE0 001F0DE0 2110C200 */  addu        $2, $6, $2
/* 0F0EE4 001F0DE4 0C454624 */  addiu       $6, $2, 0x450C
/* 0F0EE8 001F0DE8 0A000224 */  addiu       $2, $0, 0xA
/* 0F0EEC 001F0DEC 1A00E200 */  div         $0, $7, $2
/* 0F0EF0 001F0DF0 00000000 */  nop
/* 0F0EF4 001F0DF4 00000000 */  nop
/* 0F0EF8 001F0DF8 10180000 */  mfhi        $3
/* 0F0EFC 001F0DFC 40110300 */  sll         $2, $3, 5
/* 0F0F00 001F0E00 23104300 */  subu        $2, $2, $3
/* 0F0F04 001F0E04 C0100200 */  sll         $2, $2, 3
/* 0F0F08 001F0E08 2110C200 */  addu        $2, $6, $2
/* 0F0F0C 001F0E0C 00005484 */  lh          $20, 0x0($2)
/* 0F0F10 001F0E10 00000000 */  nop
.L001F0E14:
/* 0F0F14 001F0E14 C040023C */  lui         $2, (0x40C00000 >> 16)
/* 0F0F18 001F0E18 00088244 */  mtc1        $2, $f1
/* 0F0F1C 001F0E1C D901013C */  lui         $1, %hi(ShopMenu + 0x18)
/* 0F0F20 001F0E20 E80020C4 */  lwc1        $f0, %lo(ShopMenu + 0x18)($1)
/* 0F0F24 001F0E24 000B0046 */  add.s       $f12, $f1, $f0
/* 0F0F28 001F0E28 2C44040C */  jal         fptosi
/* 0F0F2C 001F0E2C 00000000 */   nop
/* 0F0F30 001F0E30 284E4070 */  paddub      $9, $2, $0
/* 0F0F34 001F0E34 28268072 */  paddub      $4, $20, $0
/* 0F0F38 001F0E38 01000524 */  addiu       $5, $0, 0x1
/* 0F0F3C 001F0E3C B4AC070C */  jal         CalItemMoney__Fii
/* 0F0F40 001F0E40 00000000 */   nop
/* 0F0F44 001F0E44 28564070 */  paddub      $10, $2, $0
/* 0F0F48 001F0E48 0101822A */  slti        $2, $20, 0x101
/* 0F0F4C 001F0E4C 1B004014 */  bnez        $2, .L001F0EBC
/* 0F0F50 001F0E50 00000000 */   nop
/* 0F0F54 001F0E54 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0F0F58 001F0E58 E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0F0F5C 001F0E5C 0A000224 */  addiu       $2, $0, 0xA
/* 0F0F60 001F0E60 1A00A200 */  div         $0, $5, $2
/* 0F0F64 001F0E64 02004014 */  bnez        $2, .L001F0E70
/* 0F0F68 001F0E68 00000000 */   nop
/* 0F0F6C 001F0E6C CD010000 */  break       0, 7
.L001F0E70:
/* 0F0F70 001F0E70 12180000 */  mflo        $3
/* 0F0F74 001F0E74 8494848F */  lw          $4, -0x6B7C($28)
/* 0F0F78 001F0E78 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0F0F7C 001F0E7C 18106200 */  mult        $2, $3, $2
/* 0F0F80 001F0E80 21108200 */  addu        $2, $4, $2
/* 0F0F84 001F0E84 0C454424 */  addiu       $4, $2, 0x450C
/* 0F0F88 001F0E88 0A000224 */  addiu       $2, $0, 0xA
/* 0F0F8C 001F0E8C 1A00A200 */  div         $0, $5, $2
/* 0F0F90 001F0E90 00000000 */  nop
/* 0F0F94 001F0E94 00000000 */  nop
/* 0F0F98 001F0E98 10180000 */  mfhi        $3
/* 0F0F9C 001F0E9C 40110300 */  sll         $2, $3, 5
/* 0F0FA0 001F0EA0 23104300 */  subu        $2, $2, $3
/* 0F0FA4 001F0EA4 C0100200 */  sll         $2, $2, 3
/* 0F0FA8 001F0EA8 21208200 */  addu        $4, $4, $2
/* 0F0FAC 001F0EAC 01000524 */  addiu       $5, $0, 0x1
/* 0F0FB0 001F0EB0 C4AC070C */  jal         WeaponCalMoney__FP11WEAPON_HAVEi
/* 0F0FB4 001F0EB4 00000000 */   nop
/* 0F0FB8 001F0EB8 21504201 */  addu        $10, $10, $2
.L001F0EBC:
/* 0F0FBC 001F0EBC 0200401D */  bgtz        $10, .L001F0EC8
/* 0F0FC0 001F0EC0 00000000 */   nop
/* 0F0FC4 001F0EC4 01000A24 */  addiu       $10, $0, 0x1
.L001F0EC8:
/* 0F0FC8 001F0EC8 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0F0FCC 001F0ECC E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0F0FD0 001F0ED0 05000424 */  addiu       $4, $0, 0x5
/* 0F0FD4 001F0ED4 1A00A400 */  div         $0, $5, $4
/* 0F0FD8 001F0ED8 00000000 */  nop
/* 0F0FDC 001F0EDC 00000000 */  nop
/* 0F0FE0 001F0EE0 10180000 */  mfhi        $3
/* 0F0FE4 001F0EE4 80100300 */  sll         $2, $3, 2
/* 0F0FE8 001F0EE8 21104300 */  addu        $2, $2, $3
/* 0F0FEC 001F0EEC C0100200 */  sll         $2, $2, 3
/* 0F0FF0 001F0EF0 6A014624 */  addiu       $6, $2, 0x16A
/* 0F0FF4 001F0EF4 1A00A400 */  div         $0, $5, $4
/* 0F0FF8 001F0EF8 02008014 */  bnez        $4, .L001F0F04
/* 0F0FFC 001F0EFC 00000000 */   nop
/* 0F1000 001F0F00 CD010000 */  break       0, 7
.L001F0F04:
/* 0F1004 001F0F04 12180000 */  mflo        $3
/* 0F1008 001F0F08 80100300 */  sll         $2, $3, 2
/* 0F100C 001F0F0C 21104300 */  addu        $2, $2, $3
/* 0F1010 001F0F10 C0100200 */  sll         $2, $2, 3
/* 0F1014 001F0F14 21382201 */  addu        $7, $9, $2
/* 0F1018 001F0F18 01000424 */  addiu       $4, $0, 0x1
/* 0F101C 001F0F1C 282E4071 */  paddub      $5, $10, $0
/* 0F1020 001F0F20 80000824 */  addiu       $8, $0, 0x80
/* 0F1024 001F0F24 54B2070C */  jal         DrawBigSellTicket__Fiiiii
/* 0F1028 001F0F28 00000000 */   nop
.L001F0F2C:
/* 0F102C 001F0F2C C040023C */  lui         $2, (0x40C00000 >> 16)
/* 0F1030 001F0F30 00088244 */  mtc1        $2, $f1
/* 0F1034 001F0F34 D901013C */  lui         $1, %hi(ShopMenu + 0x18)
/* 0F1038 001F0F38 E80020C4 */  lwc1        $f0, %lo(ShopMenu + 0x18)($1)
/* 0F103C 001F0F3C 000B0046 */  add.s       $f12, $f1, $f0
/* 0F1040 001F0F40 2C44040C */  jal         fptosi
/* 0F1044 001F0F44 00000000 */   nop
/* 0F1048 001F0F48 6A010424 */  addiu       $4, $0, 0x16A
/* 0F104C 001F0F4C 282E4070 */  paddub      $5, $2, $0
/* 0F1050 001F0F50 81000624 */  addiu       $6, $0, 0x81
/* 0F1054 001F0F54 21010724 */  addiu       $7, $0, 0x121
/* 0F1058 001F0F58 80000824 */  addiu       $8, $0, 0x80
/* 0F105C 001F0F5C 44B3070C */  jal         DrawSellTicket22__Fiiiii
/* 0F1060 001F0F60 00000000 */   nop
/* 0F1064 001F0F64 A8948CC7 */  lwc1        $f12, -0x6B58($28)
/* 0F1068 001F0F68 2C44040C */  jal         fptosi
/* 0F106C 001F0F6C 00000000 */   nop
/* 0F1070 001F0F70 28864070 */  paddub      $16, $2, $0
/* 0F1074 001F0F74 AC948CC7 */  lwc1        $f12, -0x6B54($28)
/* 0F1078 001F0F78 2C44040C */  jal         fptosi
/* 0F107C 001F0F7C 00000000 */   nop
/* 0F1080 001F0F80 28260072 */  paddub      $4, $16, $0
/* 0F1084 001F0F84 282E4070 */  paddub      $5, $2, $0
/* 0F1088 001F0F88 B4948CC7 */  lwc1        $f12, -0x6B4C($28)
/* 0F108C 001F0F8C B0948DC7 */  lwc1        $f13, -0x6B50($28)
/* 0F1090 001F0F90 80000624 */  addiu       $6, $0, 0x80
/* 0F1094 001F0F94 985E080C */  jal         MenuHelpWinDraw__Fiiffi
/* 0F1098 001F0F98 00000000 */   nop
/* 0F109C 001F0F9C 8400A427 */  addiu       $4, $29, 0x84
/* 0F10A0 001F0FA0 8800A527 */  addiu       $5, $29, 0x88
/* 0F10A4 001F0FA4 F0B8080C */  jal         GetMainMenuRightHelpMsgLangOffset__FRiRi
/* 0F10A8 001F0FA8 00000000 */   nop
/* 0F10AC 001F0FAC A89481C7 */  lwc1        $f1, -0x6B58($28)
/* 0F10B0 001F0FB0 8400A0C7 */  lwc1        $f0, 0x84($29)
/* 0F10B4 001F0FB4 20008046 */  cvt.s.w     $f0, $f0
/* 0F10B8 001F0FB8 000B0046 */  add.s       $f12, $f1, $f0
/* 0F10BC 001F0FBC 2C44040C */  jal         fptosi
/* 0F10C0 001F0FC0 00000000 */   nop
/* 0F10C4 001F0FC4 DA01013C */  lui         $1, %hi(CommonMenuMes2)
/* 0F10C8 001F0FC8 502322AC */  sw          $2, %lo(CommonMenuMes2)($1)
/* 0F10CC 001F0FCC AC9481C7 */  lwc1        $f1, -0x6B54($28)
/* 0F10D0 001F0FD0 8800A0C7 */  lwc1        $f0, 0x88($29)
/* 0F10D4 001F0FD4 20008046 */  cvt.s.w     $f0, $f0
/* 0F10D8 001F0FD8 000B0046 */  add.s       $f12, $f1, $f0
/* 0F10DC 001F0FDC 2C44040C */  jal         fptosi
/* 0F10E0 001F0FE0 00000000 */   nop
/* 0F10E4 001F0FE4 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x4)
/* 0F10E8 001F0FE8 542322AC */  sw          $2, %lo(CommonMenuMes2 + 0x4)($1)
.L001F0FEC:
/* 0F10EC 001F0FEC D901013C */  lui         $1, %hi(ShopMenu + 0x194)
/* 0F10F0 001F0FF0 64022384 */  lh          $3, %lo(ShopMenu + 0x194)($1)
/* 0F10F4 001F0FF4 02000224 */  addiu       $2, $0, 0x2
/* 0F10F8 001F0FF8 05006214 */  bne         $3, $2, .L001F1010
/* 0F10FC 001F0FFC 00000000 */   nop
/* 0F1100 001F1000 D901013C */  lui         $1, %hi(ShopMenu)
/* 0F1104 001F1004 D0002484 */  lh          $4, %lo(ShopMenu)($1)
/* 0F1108 001F1008 DCA0070C */  jal         ShopPersonDraw__Fi
/* 0F110C 001F100C 00000000 */   nop
.L001F1010:
/* 0F1110 001F1010 D901013C */  lui         $1, %hi(ShopMenu + 0x188)
/* 0F1114 001F1014 58022284 */  lh          $2, %lo(ShopMenu + 0x188)($1)
/* 0F1118 001F1018 7B004010 */  beqz        $2, .L001F1208
/* 0F111C 001F101C 00000000 */   nop
/* 0F1120 001F1020 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x174C)
/* 0F1124 001F1024 9C3A248C */  lw          $4, %lo(CommonMenuMes2 + 0x174C)($1)
/* 0F1128 001F1028 38B4080C */  jal         MenuTextureReload__Fi
/* 0F112C 001F102C 00000000 */   nop
/* 0F1130 001F1030 DA01023C */  lui         $2, %hi(CommonMenuMes2)
/* 0F1134 001F1034 50234424 */  addiu       $4, $2, %lo(CommonMenuMes2)
/* 0F1138 001F1038 6437050C */  jal         Step__6ClsMesFv
/* 0F113C 001F103C 00000000 */   nop
/* 0F1140 001F1040 DA01023C */  lui         $2, %hi(CommonMenuMes2)
/* 0F1144 001F1044 50234424 */  addiu       $4, $2, %lo(CommonMenuMes2)
/* 0F1148 001F1048 C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 0F114C 001F104C 00000000 */   nop
/* 0F1150 001F1050 B894828F */  lw          $2, -0x6B48($28)
/* 0F1154 001F1054 10004284 */  lh          $2, 0x10($2)
/* 0F1158 001F1058 51004128 */  slti        $1, $2, 0x51
/* 0F115C 001F105C 26002010 */  beqz        $1, .L001F10F8
/* 0F1160 001F1060 00000000 */   nop
/* 0F1164 001F1064 2900023C */  lui         $2, %hi(LIT_2851__2)
/* 0F1168 001F1068 B0294424 */  addiu       $4, $2, %lo(LIT_2851__2)
/* 0F116C 001F106C 6000A327 */  addiu       $3, $29, 0x60
/* 0F1170 001F1070 000082DC */  ld          $2, 0x0($4)
/* 0F1174 001F1074 080080C4 */  lwc1        $f0, 0x8($4)
/* 0F1178 001F1078 000062FC */  sd          $2, 0x0($3)
/* 0F117C 001F107C 080060E4 */  swc1        $f0, 0x8($3)
/* 0F1180 001F1080 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0F1184 001F1084 D2002284 */  lh          $2, %lo(ShopMenu + 0x2)($1)
/* 0F1188 001F1088 80100200 */  sll         $2, $2, 2
/* 0F118C 001F108C 21105D00 */  addu        $2, $2, $29
/* 0F1190 001F1090 6000458C */  lw          $5, 0x60($2)
/* 0F1194 001F1094 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x16BC)
/* 0F1198 001F1098 8C69228C */  lw          $2, %lo(AtoraNameMes + 0x16BC)($1)
/* 0F119C 001F109C 05004510 */  beq         $2, $5, .L001F10B4
/* 0F11A0 001F10A0 00000000 */   nop
/* 0F11A4 001F10A4 DA01023C */  lui         $2, %hi(AtoraNameMes)
/* 0F11A8 001F10A8 D0524424 */  addiu       $4, $2, %lo(AtoraNameMes)
/* 0F11AC 001F10AC 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F11B0 001F10B0 00000000 */   nop
.L001F10B4:
/* 0F11B4 001F10B4 01000224 */  addiu       $2, $0, 0x1
/* 0F11B8 001F10B8 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x98)
/* 0F11BC 001F10BC 685322AC */  sw          $2, %lo(AtoraNameMes + 0x98)($1)
/* 0F11C0 001F10C0 B4000224 */  addiu       $2, $0, 0xB4
/* 0F11C4 001F10C4 DA01013C */  lui         $1, %hi(AtoraNameMes)
/* 0F11C8 001F10C8 D05222AC */  sw          $2, %lo(AtoraNameMes)($1)
/* 0F11CC 001F10CC 68010224 */  addiu       $2, $0, 0x168
/* 0F11D0 001F10D0 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x4)
/* 0F11D4 001F10D4 D45222AC */  sw          $2, %lo(AtoraNameMes + 0x4)($1)
/* 0F11D8 001F10D8 DA01023C */  lui         $2, %hi(AtoraNameMes)
/* 0F11DC 001F10DC D0524424 */  addiu       $4, $2, %lo(AtoraNameMes)
/* 0F11E0 001F10E0 6437050C */  jal         Step__6ClsMesFv
/* 0F11E4 001F10E4 00000000 */   nop
/* 0F11E8 001F10E8 DA01023C */  lui         $2, %hi(AtoraNameMes)
/* 0F11EC 001F10EC D0524424 */  addiu       $4, $2, %lo(AtoraNameMes)
/* 0F11F0 001F10F0 C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 0F11F4 001F10F4 00000000 */   nop
.L001F10F8:
/* 0F11F8 001F10F8 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0F11FC 001F10FC 50022384 */  lh          $3, %lo(ShopMenu + 0x180)($1)
/* 0F1200 001F1100 0E000224 */  addiu       $2, $0, 0xE
/* 0F1204 001F1104 06006210 */  beq         $3, $2, .L001F1120
/* 0F1208 001F1108 00000000 */   nop
/* 0F120C 001F110C 0D000224 */  addiu       $2, $0, 0xD
/* 0F1210 001F1110 03006210 */  beq         $3, $2, .L001F1120
/* 0F1214 001F1114 00000000 */   nop
/* 0F1218 001F1118 39000010 */  b           .L001F1200
/* 0F121C 001F111C 00000000 */   nop
.L001F1120:
/* 0F1220 001F1120 8C00A227 */  addiu       $2, $29, 0x8C
/* 0F1224 001F1124 188880C7 */  lwc1        $f0, -0x77E8($28)
/* 0F1228 001F1128 000040E4 */  swc1        $f0, 0x0($2)
/* 0F122C 001F112C 40100300 */  sll         $2, $3, 1
/* 0F1230 001F1130 21105D00 */  addu        $2, $2, $29
/* 0F1234 001F1134 72004584 */  lh          $5, 0x72($2)
/* 0F1238 001F1138 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x16BC)
/* 0F123C 001F113C 4C22228C */  lw          $2, %lo(CommonMenuMes1 + 0x16BC)($1)
/* 0F1240 001F1140 05004510 */  beq         $2, $5, .L001F1158
/* 0F1244 001F1144 00000000 */   nop
/* 0F1248 001F1148 DA01023C */  lui         $2, %hi(CommonMenuMes1)
/* 0F124C 001F114C 900B4424 */  addiu       $4, $2, %lo(CommonMenuMes1)
/* 0F1250 001F1150 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F1254 001F1154 00000000 */   nop
.L001F1158:
/* 0F1258 001F1158 2900023C */  lui         $2, %hi(LIT_2860__2)
/* 0F125C 001F115C C0294224 */  addiu       $2, $2, %lo(LIT_2860__2)
/* 0F1260 001F1160 7000A427 */  addiu       $4, $29, 0x70
/* 0F1264 001F1164 000043DC */  ld          $3, 0x0($2)
/* 0F1268 001F1168 080040C4 */  lwc1        $f0, 0x8($2)
/* 0F126C 001F116C 0C004284 */  lh          $2, 0xC($2)
/* 0F1270 001F1170 000083FC */  sd          $3, 0x0($4)
/* 0F1274 001F1174 080080E4 */  swc1        $f0, 0x8($4)
/* 0F1278 001F1178 0C0082A4 */  sh          $2, 0xC($4)
/* 0F127C 001F117C D901013C */  lui         $1, %hi(ShopMenu + 0x190)
/* 0F1280 001F1180 60022284 */  lh          $2, %lo(ShopMenu + 0x190)($1)
/* 0F1284 001F1184 40100200 */  sll         $2, $2, 1
/* 0F1288 001F1188 21205D00 */  addu        $4, $2, $29
/* 0F128C 001F118C 70008280 */  lb          $2, 0x70($4)
/* 0F1290 001F1190 2C014224 */  addiu       $2, $2, 0x12C
/* 0F1294 001F1194 DA01013C */  lui         $1, %hi(CommonMenuMes1)
/* 0F1298 001F1198 900B22AC */  sw          $2, %lo(CommonMenuMes1)($1)
/* 0F129C 001F119C BE000224 */  addiu       $2, $0, 0xBE
/* 0F12A0 001F11A0 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x4)
/* 0F12A4 001F11A4 940B22AC */  sw          $2, %lo(CommonMenuMes1 + 0x4)($1)
/* 0F12A8 001F11A8 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0F12AC 001F11AC 50022384 */  lh          $3, %lo(ShopMenu + 0x180)($1)
/* 0F12B0 001F11B0 0E000224 */  addiu       $2, $0, 0xE
/* 0F12B4 001F11B4 05006214 */  bne         $3, $2, .L001F11CC
/* 0F12B8 001F11B8 00000000 */   nop
/* 0F12BC 001F11BC 71008280 */  lb          $2, 0x71($4)
/* 0F12C0 001F11C0 64004224 */  addiu       $2, $2, 0x64
/* 0F12C4 001F11C4 DA01013C */  lui         $1, %hi(CommonMenuMes1)
/* 0F12C8 001F11C8 900B22AC */  sw          $2, %lo(CommonMenuMes1)($1)
.L001F11CC:
/* 0F12CC 001F11CC 01000224 */  addiu       $2, $0, 0x1
/* 0F12D0 001F11D0 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x98)
/* 0F12D4 001F11D4 280C22AC */  sw          $2, %lo(CommonMenuMes1 + 0x98)($1)
/* 0F12D8 001F11D8 DA01023C */  lui         $2, %hi(CommonMenuMes1)
/* 0F12DC 001F11DC 900B4424 */  addiu       $4, $2, %lo(CommonMenuMes1)
/* 0F12E0 001F11E0 6437050C */  jal         Step__6ClsMesFv
/* 0F12E4 001F11E4 00000000 */   nop
/* 0F12E8 001F11E8 DA01023C */  lui         $2, %hi(CommonMenuMes1)
/* 0F12EC 001F11EC 900B4424 */  addiu       $4, $2, %lo(CommonMenuMes1)
/* 0F12F0 001F11F0 C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 0F12F4 001F11F4 00000000 */   nop
/* 0F12F8 001F11F8 03000010 */  b           .L001F1208
/* 0F12FC 001F11FC 00000000 */   nop
.L001F1200:
/* 0F1300 001F1200 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x98)
/* 0F1304 001F1204 280C20AC */  sw          $0, %lo(CommonMenuMes1 + 0x98)($1)
.L001F1208:
/* 0F1308 001F1208 01000424 */  addiu       $4, $0, 0x1
/* 0F130C 001F120C B8B5070C */  jal         ShopModelMsgFunc__Fi
/* 0F1310 001F1210 00000000 */   nop
/* 0F1314 001F1214 A89F070C */  jal         ShopFadeoutDraw__Fv
/* 0F1318 001F1218 00000000 */   nop
/* 0F131C 001F121C 01000424 */  addiu       $4, $0, 0x1
/* 0F1320 001F1220 046F050C */  jal         setbilinear__Fi
/* 0F1324 001F1224 00000000 */   nop
/* 0F1328 001F1228 5000BF7B */  lq          $31, 0x50($29)
/* 0F132C 001F122C 4000B47B */  lq          $20, 0x40($29)
/* 0F1330 001F1230 3000B37B */  lq          $19, 0x30($29)
/* 0F1334 001F1234 2000B27B */  lq          $18, 0x20($29)
/* 0F1338 001F1238 1000B17B */  lq          $17, 0x10($29)
/* 0F133C 001F123C 0000B07B */  lq          $16, 0x0($29)
/* 0F1340 001F1240 9000BD27 */  addiu       $29, $29, 0x90
/* 0F1344 001F1244 0800E003 */  jr          $31
/* 0F1348 001F1248 00000000 */   nop
/* 0F134C 001F124C 00000000 */  nop
