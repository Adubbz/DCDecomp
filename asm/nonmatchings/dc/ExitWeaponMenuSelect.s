.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExitWeaponMenuSelect__Fv
/* FCC20 001FCB20 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* FCC24 001FCB24 0000BF7F */  sq         $31, 0x0($sp)
/* FCC28 001FCB28 D494828F */  lw         $2, -0x6B2C($gp)
/* FCC2C 001FCB2C 04004480 */  lb         $4, 0x4($2)
/* FCC30 001FCB30 D894828F */  lw         $2, -0x6B28($gp)
/* FCC34 001FCB34 09004014 */  bnez       $2, .L001FCB5C
/* FCC38 001FCB38 00000000 */   nop
/* FCC3C 001FCB3C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FCC40 001FCB40 75EA2280 */  lb         $2, -0x158B($at)
/* FCC44 001FCB44 05008214 */  bne        $4, $2, .L001FCB5C
/* FCC48 001FCB48 00000000 */   nop
/* FCC4C 001FCB4C 0095858F */  lw         $5, -0x6B00($gp)
/* FCC50 001FCB50 E494868F */  lw         $6, -0x6B1C($gp)
/* FCC54 001FCB54 5837080C */  jal        DngWeaponEquipModelBuild__FiiP1
/* FCC58 001FCB58 00000000 */   nop
.L001FCB5C:
/* FCC5C 001FCB5C C701023C */  lui        $2, %hi(TexManager)
/* FCC60 001FCB60 70584424 */  addiu      $4, $2, %lo(TexManager)
/* FCC64 001FCB64 0095858F */  lw         $5, -0x6B00($gp)
/* FCC68 001FCB68 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* FCC6C 001FCB6C 00000000 */   nop
/* FCC70 001FCB70 C701023C */  lui        $2, %hi(TexManager)
/* FCC74 001FCB74 70584424 */  addiu      $4, $2, %lo(TexManager)
/* FCC78 001FCB78 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* FCC7C 001FCB7C 00000000 */   nop
/* FCC80 001FCB80 28D6070C */  jal        BtlMenuTexBlockEnter__Fv
/* FCC84 001FCB84 00000000 */   nop
/* FCC88 001FCB88 12000224 */  addiu      $2, $0, 0x12
/* FCC8C 001FCB8C 208882AF */  sw         $2, -0x77E0($gp)
/* FCC90 001FCB90 46000224 */  addiu      $2, $0, 0x46
/* FCC94 001FCB94 DA01013C */  lui        $at, (0x1DA3B28 >> 16)
/* FCC98 001FCB98 283B22AC */  sw         $2, (0x1DA3B28 & 0xFFFF)($at)
/* FCC9C 001FCB9C 0A000224 */  addiu      $2, $0, 0xA
/* FCCA0 001FCBA0 DA01013C */  lui        $at, (0x1DA3B2C >> 16)
/* FCCA4 001FCBA4 2C3B22AC */  sw         $2, (0x1DA3B2C & 0xFFFF)($at)
/* FCCA8 001FCBA8 DA01013C */  lui        $at, (0x1DA3B30 >> 16)
/* FCCAC 001FCBAC 303B20AC */  sw         $0, (0x1DA3B30 & 0xFFFF)($at)
/* FCCB0 001FCBB0 DA01013C */  lui        $at, (0x1DA3B34 >> 16)
/* FCCB4 001FCBB4 343B20AC */  sw         $0, (0x1DA3B34 & 0xFFFF)($at)
/* FCCB8 001FCBB8 DA01013C */  lui        $at, (0x1DA3B38 >> 16)
/* FCCBC 001FCBBC 383B20AC */  sw         $0, (0x1DA3B38 & 0xFFFF)($at)
/* FCCC0 001FCBC0 DA01013C */  lui        $at, (0x1DA3BA0 >> 16)
/* FCCC4 001FCBC4 A03B20AC */  sw         $0, (0x1DA3BA0 & 0xFFFF)($at)
/* FCCC8 001FCBC8 01000224 */  addiu      $2, $0, 0x1
/* FCCCC 001FCBCC DA01013C */  lui        $at, (0x1DA3BA4 >> 16)
/* FCCD0 001FCBD0 A43B22AC */  sw         $2, (0x1DA3BA4 & 0xFFFF)($at)
/* FCCD4 001FCBD4 DA01013C */  lui        $at, (0x1DA3BB8 >> 16)
/* FCCD8 001FCBD8 B83B20C4 */  lwc1       $f0, (0x1DA3BB8 & 0xFFFF)($at)
/* FCCDC 001FCBDC DA01013C */  lui        $at, (0x1DA3BB4 >> 16)
/* FCCE0 001FCBE0 B43B20E4 */  swc1       $f0, (0x1DA3BB4 & 0xFFFF)($at)
/* FCCE4 001FCBE4 DA01013C */  lui        $at, (0x1DA3BBC >> 16)
/* FCCE8 001FCBE8 BC3B20AC */  sw         $0, (0x1DA3BBC & 0xFFFF)($at)
/* FCCEC 001FCBEC DA01013C */  lui        $at, (0x1DA3BC4 >> 16)
/* FCCF0 001FCBF0 C43B20AC */  sw         $0, (0x1DA3BC4 & 0xFFFF)($at)
/* FCCF4 001FCBF4 DA01013C */  lui        $at, (0x1DA3BC8 >> 16)
/* FCCF8 001FCBF8 C83B20AC */  sw         $0, (0x1DA3BC8 & 0xFFFF)($at)
/* FCCFC 001FCBFC DA01013C */  lui        $at, (0x1DA3BCC >> 16)
/* FCD00 001FCC00 CC3B20AC */  sw         $0, (0x1DA3BCC & 0xFFFF)($at)
/* FCD04 001FCC04 DA01013C */  lui        $at, (0x1DA3BD0 >> 16)
/* FCD08 001FCC08 D03B20AC */  sw         $0, (0x1DA3BD0 & 0xFFFF)($at)
/* FCD0C 001FCC0C DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* FCD10 001FCC10 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* FCD14 001FCC14 643D050C */  jal        InitMesWinTbl__6ClsMesFv
/* FCD18 001FCC18 00000000 */   nop
/* FCD1C 001FCC1C DA01013C */  lui        $at, (0x1DA51B8 >> 16)
/* FCD20 001FCC20 B851228C */  lw         $2, (0x1DA51B8 & 0xFFFF)($at)
/* FCD24 001FCC24 DA01013C */  lui        $at, (0x1DA51BC >> 16)
/* FCD28 001FCC28 BC5122AC */  sw         $2, (0x1DA51BC & 0xFFFF)($at)
/* FCD2C 001FCC2C DA01013C */  lui        $at, (0x1DA51C0 >> 16)
/* FCD30 001FCC30 C05120AC */  sw         $0, (0x1DA51C0 & 0xFFFF)($at)
/* FCD34 001FCC34 DA01013C */  lui        $at, (0x1DA51C4 >> 16)
/* FCD38 001FCC38 C45120AC */  sw         $0, (0x1DA51C4 & 0xFFFF)($at)
/* FCD3C 001FCC3C DA01013C */  lui        $at, (0x1DA51C8 >> 16)
/* FCD40 001FCC40 C85120AC */  sw         $0, (0x1DA51C8 & 0xFFFF)($at)
/* FCD44 001FCC44 FFFF0224 */  addiu      $2, $0, -0x1
/* FCD48 001FCC48 DA01013C */  lui        $at, (0x1DA51CC >> 16)
/* FCD4C 001FCC4C CC5122AC */  sw         $2, (0x1DA51CC & 0xFFFF)($at)
/* FCD50 001FCC50 80000224 */  addiu      $2, $0, 0x80
/* FCD54 001FCC54 DA01013C */  lui        $at, (0x1DA51E4 >> 16)
/* FCD58 001FCC58 E45122AC */  sw         $2, (0x1DA51E4 & 0xFFFF)($at)
/* FCD5C 001FCC5C 282E0070 */  paddub     $5, $0, $0
/* FCD60 001FCC60 08000010 */  b          .L001FCC84
/* FCD64 001FCC64 00000000 */   nop
.L001FCC68:
/* FCD68 001FCC68 FFFF0424 */  addiu      $4, $0, -0x1
/* FCD6C 001FCC6C 80180500 */  sll        $3, $5, 2
/* FCD70 001FCC70 DA01023C */  lui        $2, %hi(D_1DA51F0)
/* FCD74 001FCC74 F0514224 */  addiu      $2, $2, %lo(D_1DA51F0)
/* FCD78 001FCC78 21104300 */  addu       $2, $2, $3
/* FCD7C 001FCC7C 000044AC */  sw         $4, 0x0($2)
/* FCD80 001FCC80 0100A524 */  addiu      $5, $5, 0x1
.L001FCC84:
/* FCD84 001FCC84 0A00A228 */  slti       $2, $5, 0xA
/* FCD88 001FCC88 F7FF4014 */  bnez       $2, .L001FCC68
/* FCD8C 001FCC8C 00000000 */   nop
/* FCD90 001FCC90 28260070 */  paddub     $4, $0, $0
/* FCD94 001FCC94 07000010 */  b          .L001FCCB4
/* FCD98 001FCC98 00000000 */   nop
.L001FCC9C:
/* FCD9C 001FCC9C 80180400 */  sll        $3, $4, 2
/* FCDA0 001FCCA0 DA01023C */  lui        $2, %hi(D_1DA5218)
/* FCDA4 001FCCA4 18524224 */  addiu      $2, $2, %lo(D_1DA5218)
/* FCDA8 001FCCA8 21104300 */  addu       $2, $2, $3
/* FCDAC 001FCCAC 000040AC */  sw         $0, 0x0($2)
/* FCDB0 001FCCB0 01008424 */  addiu      $4, $4, 0x1
.L001FCCB4:
/* FCDB4 001FCCB4 08008228 */  slti       $2, $4, 0x8
/* FCDB8 001FCCB8 F8FF4014 */  bnez       $2, .L001FCC9C
/* FCDBC 001FCCBC 00000000 */   nop
/* FCDC0 001FCCC0 DA01013C */  lui        $at, (0x1DA5238 >> 16)
/* FCDC4 001FCCC4 385220AC */  sw         $0, (0x1DA5238 & 0xFFFF)($at)
/* FCDC8 001FCCC8 DA01013C */  lui        $at, (0x1DA523C >> 16)
/* FCDCC 001FCCCC 3C5220AC */  sw         $0, (0x1DA523C & 0xFFFF)($at)
/* FCDD0 001FCCD0 01000224 */  addiu      $2, $0, 0x1
/* FCDD4 001FCCD4 DA01013C */  lui        $at, (0x1DA5240 >> 16)
/* FCDD8 001FCCD8 405222AC */  sw         $2, (0x1DA5240 & 0xFFFF)($at)
/* FCDDC 001FCCDC DA01013C */  lui        $at, (0x1DA5244 >> 16)
/* FCDE0 001FCCE0 445220AC */  sw         $0, (0x1DA5244 & 0xFFFF)($at)
/* FCDE4 001FCCE4 FFFF0224 */  addiu      $2, $0, -0x1
/* FCDE8 001FCCE8 DA01013C */  lui        $at, (0x1DA5248 >> 16)
/* FCDEC 001FCCEC 485222AC */  sw         $2, (0x1DA5248 & 0xFFFF)($at)
/* FCDF0 001FCCF0 DA01013C */  lui        $at, (0x1DA524C >> 16)
/* FCDF4 001FCCF4 4C5222AC */  sw         $2, (0x1DA524C & 0xFFFF)($at)
/* FCDF8 001FCCF8 DA01013C */  lui        $at, (0x1DA5250 >> 16)
/* FCDFC 001FCCFC 505222AC */  sw         $2, (0x1DA5250 & 0xFFFF)($at)
/* FCE00 001FCD00 DA01013C */  lui        $at, (0x1DA5254 >> 16)
/* FCE04 001FCD04 545220AC */  sw         $0, (0x1DA5254 & 0xFFFF)($at)
/* FCE08 001FCD08 DA01013C */  lui        $at, (0x1DA5258 >> 16)
/* FCE0C 001FCD0C 585220AC */  sw         $0, (0x1DA5258 & 0xFFFF)($at)
/* FCE10 001FCD10 28260070 */  paddub     $4, $0, $0
/* FCE14 001FCD14 0C000010 */  b          .L001FCD48
/* FCE18 001FCD18 00000000 */   nop
.L001FCD1C:
/* FCE1C 001FCD1C FFFF0324 */  addiu      $3, $0, -0x1
/* FCE20 001FCD20 C0280400 */  sll        $5, $4, 3
/* FCE24 001FCD24 DA01023C */  lui        $2, %hi(D_1DA5260)
/* FCE28 001FCD28 60524224 */  addiu      $2, $2, %lo(D_1DA5260)
/* FCE2C 001FCD2C 21104500 */  addu       $2, $2, $5
/* FCE30 001FCD30 000043AC */  sw         $3, 0x0($2)
/* FCE34 001FCD34 DA01023C */  lui        $2, %hi(D_1DA5264)
/* FCE38 001FCD38 64524224 */  addiu      $2, $2, %lo(D_1DA5264)
/* FCE3C 001FCD3C 21104500 */  addu       $2, $2, $5
/* FCE40 001FCD40 000043AC */  sw         $3, 0x0($2)
/* FCE44 001FCD44 01008424 */  addiu      $4, $4, 0x1
.L001FCD48:
/* FCE48 001FCD48 0A008228 */  slti       $2, $4, 0xA
/* FCE4C 001FCD4C F3FF4014 */  bnez       $2, .L001FCD1C
/* FCE50 001FCD50 00000000 */   nop
/* FCE54 001FCD54 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* FCE58 001FCD58 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* FCE5C 001FCD5C 01000524 */  addiu      $5, $0, 0x1
/* FCE60 001FCD60 9836050C */  jal        Preset__6ClsMesFi
/* FCE64 001FCD64 00000000 */   nop
/* FCE68 001FCD68 1C88848F */  lw         $4, -0x77E4($gp)
/* FCE6C 001FCD6C FFFF0524 */  addiu      $5, $0, -0x1
/* FCE70 001FCD70 24B0080C */  jal        GetMenuCommonFontW__Fii
/* FCE74 001FCD74 00000000 */   nop
/* FCE78 001FCD78 DA01013C */  lui        $at, (0x1DA3B18 >> 16)
/* FCE7C 001FCD7C 183B22AC */  sw         $2, (0x1DA3B18 & 0xFFFF)($at)
/* FCE80 001FCD80 16000224 */  addiu      $2, $0, 0x16
/* FCE84 001FCD84 DA01013C */  lui        $at, (0x1DA3B1C >> 16)
/* FCE88 001FCD88 1C3B22AC */  sw         $2, (0x1DA3B1C & 0xFFFF)($at)
/* FCE8C 001FCD8C DA01013C */  lui        $at, (0x1DA5244 >> 16)
/* FCE90 001FCD90 445220AC */  sw         $0, (0x1DA5244 & 0xFFFF)($at)
/* FCE94 001FCD94 01000224 */  addiu      $2, $0, 0x1
/* FCE98 001FCD98 DA01013C */  lui        $at, (0x1DA6A00 >> 16)
/* FCE9C 001FCD9C 006A22AC */  sw         $2, (0x1DA6A00 & 0xFFFF)($at)
/* FCEA0 001FCDA0 DA01013C */  lui        $at, (0x1DA6A04 >> 16)
/* FCEA4 001FCDA4 046A20AC */  sw         $0, (0x1DA6A04 & 0xFFFF)($at)
/* FCEA8 001FCDA8 DA01013C */  lui        $at, (0x1DA69AC >> 16)
/* FCEAC 001FCDAC AC6920AC */  sw         $0, (0x1DA69AC & 0xFFFF)($at)
/* FCEB0 001FCDB0 1C88848F */  lw         $4, -0x77E4($gp)
/* FCEB4 001FCDB4 FFFF0524 */  addiu      $5, $0, -0x1
/* FCEB8 001FCDB8 24B0080C */  jal        GetMenuCommonFontW__Fii
/* FCEBC 001FCDBC 00000000 */   nop
/* FCEC0 001FCDC0 DA01013C */  lui        $at, (0x1DA52D8 >> 16)
/* FCEC4 001FCDC4 D85222AC */  sw         $2, (0x1DA52D8 & 0xFFFF)($at)
/* FCEC8 001FCDC8 DA01013C */  lui        $at, (0x1DA22C4 >> 16)
/* FCECC 001FCDCC C42220AC */  sw         $0, (0x1DA22C4 & 0xFFFF)($at)
/* FCED0 001FCDD0 80DC070C */  jal        ForBackMenu__Fv
/* FCED4 001FCDD4 00000000 */   nop
/* FCED8 001FCDD8 208880AF */  sw         $0, -0x77E0($gp)
/* FCEDC 001FCDDC 0000BF7B */  lq         $31, 0x0($sp)
/* FCEE0 001FCDE0 1000BD27 */  addiu      $sp, $sp, 0x10
/* FCEE4 001FCDE4 0800E003 */  jr         $31
/* FCEE8 001FCDE8 00000000 */   nop
/* FCEEC 001FCDEC 00000000 */  nop
