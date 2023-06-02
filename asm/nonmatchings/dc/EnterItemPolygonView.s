.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EnterItemPolygonView__Fv
/* 12AE20 0022AD20 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 12AE24 0022AD24 2000BF7F */  sq         $31, 0x20($sp)
/* 12AE28 0022AD28 1000B17F */  sq         $17, 0x10($sp)
/* 12AE2C 0022AD2C 0000B07F */  sq         $16, 0x0($sp)
/* 12AE30 0022AD30 8CFB040C */  jal        ReadBGSync__Fv
/* 12AE34 0022AD34 00000000 */   nop
/* 12AE38 0022AD38 79004014 */  bnez       $2, .L0022AF20
/* 12AE3C 0022AD3C 00000000 */   nop
/* 12AE40 0022AD40 9C97828F */  lw         $2, -0x6864($gp)
/* 12AE44 0022AD44 76004014 */  bnez       $2, .L0022AF20
/* 12AE48 0022AD48 00000000 */   nop
/* 12AE4C 0022AD4C 9897828F */  lw         $2, -0x6868($gp)
/* 12AE50 0022AD50 73004014 */  bnez       $2, .L0022AF20
/* 12AE54 0022AD54 00000000 */   nop
/* 12AE58 0022AD58 2900023C */  lui        $2, %hi(_1842)
/* 12AE5C 0022AD5C 20434524 */  addiu      $5, $2, %lo(_1842)
/* 12AE60 0022AD60 3000A427 */  addiu      $4, $sp, 0x30
/* 12AE64 0022AD64 02000324 */  addiu      $3, $0, 0x2
.L0022AD68:
/* 12AE68 0022AD68 0000A278 */  lq         $2, 0x0($5)
/* 12AE6C 0022AD6C 1000A524 */  addiu      $5, $5, 0x10
/* 12AE70 0022AD70 FFFF6324 */  addiu      $3, $3, -0x1
/* 12AE74 0022AD74 0000827C */  sq         $2, 0x0($4)
/* 12AE78 0022AD78 10008424 */  addiu      $4, $4, 0x10
/* 12AE7C 0022AD7C FAFF601C */  bgtz       $3, .L0022AD68
/* 12AE80 0022AD80 00000000 */   nop
/* 12AE84 0022AD84 0000A2C4 */  lwc1       $f2, 0x0($5)
/* 12AE88 0022AD88 000082E4 */  swc1       $f2, 0x0($4)
/* 12AE8C 0022AD8C F894828F */  lw         $2, -0x6B08($gp)
/* 12AE90 0022AD90 3400A2AF */  sw         $2, 0x34($sp)
/* 12AE94 0022AD94 4000A2AF */  sw         $2, 0x40($sp)
/* 12AE98 0022AD98 28260070 */  paddub     $4, $0, $0
/* 12AE9C 0022AD9C 18FB040C */  jal        GetReadBGFile__Fi
/* 12AEA0 0022ADA0 00000000 */   nop
/* 12AEA4 0022ADA4 28864070 */  paddub     $16, $2, $0
/* 12AEA8 0022ADA8 01000424 */  addiu      $4, $0, 0x1
/* 12AEAC 0022ADAC 18FB040C */  jal        GetReadBGFile__Fi
/* 12AEB0 0022ADB0 00000000 */   nop
/* 12AEB4 0022ADB4 288E4070 */  paddub     $17, $2, $0
/* 12AEB8 0022ADB8 8C00428C */  lw         $2, 0x8C($2)
/* 12AEBC 0022ADBC 3C00A2AF */  sw         $2, 0x3C($sp)
/* 12AEC0 0022ADC0 C701023C */  lui        $2, %hi(TexManager)
/* 12AEC4 0022ADC4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 12AEC8 0022ADC8 F894858F */  lw         $5, -0x6B08($gp)
/* 12AECC 0022ADCC C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 12AED0 0022ADD0 00000000 */   nop
/* 12AED4 0022ADD4 C701023C */  lui        $2, %hi(TexManager)
/* 12AED8 0022ADD8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 12AEDC 0022ADDC 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 12AEE0 0022ADE0 00000000 */   nop
/* 12AEE4 0022ADE4 C701023C */  lui        $2, %hi(TexManager)
/* 12AEE8 0022ADE8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 12AEEC 0022ADEC FFFF0524 */  addiu      $5, $0, -0x1
/* 12AEF0 0022ADF0 3000A627 */  addiu      $6, $sp, 0x30
/* 12AEF4 0022ADF4 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 12AEF8 0022ADF8 00000000 */   nop
/* 12AEFC 0022ADFC 04000016 */  bnez       $16, .L0022AE10
/* 12AF00 0022AE00 00000000 */   nop
/* 12AF04 0022AE04 28160070 */  paddub     $2, $0, $0
/* 12AF08 0022AE08 46000010 */  b          .L0022AF24
/* 12AF0C 0022AE0C 00000000 */   nop
.L0022AE10:
/* 12AF10 0022AE10 04002016 */  bnez       $17, .L0022AE24
/* 12AF14 0022AE14 00000000 */   nop
/* 12AF18 0022AE18 28160070 */  paddub     $2, $0, $0
/* 12AF1C 0022AE1C 41000010 */  b          .L0022AF24
/* 12AF20 0022AE20 00000000 */   nop
.L0022AE24:
/* 12AF24 0022AE24 9000228E */  lw         $2, 0x90($17)
/* 12AF28 0022AE28 03110200 */  sra        $2, $2, 4
/* 12AF2C 0022AE2C 00190200 */  sll        $3, $2, 4
/* 12AF30 0022AE30 8C00228E */  lw         $2, 0x8C($17)
/* 12AF34 0022AE34 21104300 */  addu       $2, $2, $3
/* 12AF38 0022AE38 10004224 */  addiu      $2, $2, 0x10
/* 12AF3C 0022AE3C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12AF40 0022AE40 908D22AC */  sw         $2, -0x7270($at)
/* 12AF44 0022AE44 80600224 */  addiu      $2, $0, 0x6080
/* 12AF48 0022AE48 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12AF4C 0022AE4C 9C8D22AC */  sw         $2, -0x7264($at)
/* 12AF50 0022AE50 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12AF54 0022AE54 988D20AC */  sw         $0, -0x7268($at)
/* 12AF58 0022AE58 01000224 */  addiu      $2, $0, 0x1
/* 12AF5C 0022AE5C 989782AF */  sw         $2, -0x6868($gp)
/* 12AF60 0022AE60 8C00048E */  lw         $4, 0x8C($16)
/* 12AF64 0022AE64 DB01023C */  lui        $2, %hi(MenuItemCashBuffer)
/* 12AF68 0022AE68 908D4524 */  addiu      $5, $2, %lo(MenuItemCashBuffer)
/* 12AF6C 0022AE6C 28360070 */  paddub     $6, $0, $0
/* 12AF70 0022AE70 283E0070 */  paddub     $7, $0, $0
/* 12AF74 0022AE74 28460070 */  paddub     $8, $0, $0
/* 12AF78 0022AE78 AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 12AF7C 0022AE7C 00000000 */   nop
/* 12AF80 0022AE80 949782AF */  sw         $2, -0x686C($gp)
/* 12AF84 0022AE84 2900023C */  lui        $2, %hi(_1849)
/* 12AF88 0022AE88 50434224 */  addiu      $2, $2, %lo(_1849)
/* 12AF8C 0022AE8C 6000A527 */  addiu      $5, $sp, 0x60
/* 12AF90 0022AE90 00004278 */  lq         $2, 0x0($2)
/* 12AF94 0022AE94 0000A27C */  sq         $2, 0x0($5)
/* 12AF98 0022AE98 2900023C */  lui        $2, %hi(_1850)
/* 12AF9C 0022AE9C 60434424 */  addiu      $4, $2, %lo(_1850)
/* 12AFA0 0022AEA0 7000A327 */  addiu      $3, $sp, 0x70
/* 12AFA4 0022AEA4 000082DC */  ld         $2, 0x0($4)
/* 12AFA8 0022AEA8 080080C4 */  lwc1       $f0, 0x8($4)
/* 12AFAC 0022AEAC 000062FC */  sd         $2, 0x0($3)
/* 12AFB0 0022AEB0 080060E4 */  swc1       $f0, 0x8($3)
/* 12AFB4 0022AEB4 2900023C */  lui        $2, %hi(_1851)
/* 12AFB8 0022AEB8 70434424 */  addiu      $4, $2, %lo(_1851)
/* 12AFBC 0022AEBC 8000A327 */  addiu      $3, $sp, 0x80
/* 12AFC0 0022AEC0 000082DC */  ld         $2, 0x0($4)
/* 12AFC4 0022AEC4 080080C4 */  lwc1       $f0, 0x8($4)
/* 12AFC8 0022AEC8 000062FC */  sd         $2, 0x0($3)
/* 12AFCC 0022AECC 080060E4 */  swc1       $f0, 0x8($3)
/* 12AFD0 0022AED0 2900023C */  lui        $2, %hi(menudebugpos)
/* 12AFD4 0022AED4 F0424424 */  addiu      $4, $2, %lo(menudebugpos)
/* 12AFD8 0022AED8 10000624 */  addiu      $6, $0, 0x10
/* 12AFDC 0022AEDC EC0C040C */  jal        memcpy
/* 12AFE0 0022AEE0 00000000 */   nop
/* 12AFE4 0022AEE4 2900023C */  lui        $2, %hi(menudebugrot)
/* 12AFE8 0022AEE8 00434424 */  addiu      $4, $2, %lo(menudebugrot)
/* 12AFEC 0022AEEC 7000A527 */  addiu      $5, $sp, 0x70
/* 12AFF0 0022AEF0 10000624 */  addiu      $6, $0, 0x10
/* 12AFF4 0022AEF4 EC0C040C */  jal        memcpy
/* 12AFF8 0022AEF8 00000000 */   nop
/* 12AFFC 0022AEFC 2900023C */  lui        $2, %hi(menudebugrscale)
/* 12B000 0022AF00 10434424 */  addiu      $4, $2, %lo(menudebugrscale)
/* 12B004 0022AF04 8000A527 */  addiu      $5, $sp, 0x80
/* 12B008 0022AF08 10000624 */  addiu      $6, $0, 0x10
/* 12B00C 0022AF0C EC0C040C */  jal        memcpy
/* 12B010 0022AF10 00000000 */   nop
/* 12B014 0022AF14 01000224 */  addiu      $2, $0, 0x1
/* 12B018 0022AF18 02000010 */  b          .L0022AF24
/* 12B01C 0022AF1C 00000000 */   nop
.L0022AF20:
/* 12B020 0022AF20 28160070 */  paddub     $2, $0, $0
.L0022AF24:
/* 12B024 0022AF24 2000BF7B */  lq         $31, 0x20($sp)
/* 12B028 0022AF28 1000B17B */  lq         $17, 0x10($sp)
/* 12B02C 0022AF2C 0000B07B */  lq         $16, 0x0($sp)
/* 12B030 0022AF30 9000BD27 */  addiu      $sp, $sp, 0x90
/* 12B034 0022AF34 0800E003 */  jr         $31
/* 12B038 0022AF38 00000000 */   nop
/* 12B03C 0022AF3C 00000000 */  nop
