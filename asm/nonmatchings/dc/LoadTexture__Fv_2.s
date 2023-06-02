.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadTexture__Fv_2
/* 9EDB0 0019ECB0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 9EDB4 0019ECB4 4000BF7F */  sq         $31, 0x40($sp)
/* 9EDB8 0019ECB8 3000B37F */  sq         $19, 0x30($sp)
/* 9EDBC 0019ECBC 2000B27F */  sq         $18, 0x20($sp)
/* 9EDC0 0019ECC0 1000B17F */  sq         $17, 0x10($sp)
/* 9EDC4 0019ECC4 0000B07F */  sq         $16, 0x0($sp)
/* 9EDC8 0019ECC8 02000424 */  addiu      $4, $0, 0x2
/* 9EDCC 0019ECCC 18FB040C */  jal        GetReadBGFile__Fi
/* 9EDD0 0019ECD0 00000000 */   nop
/* 9EDD4 0019ECD4 28864070 */  paddub     $16, $2, $0
/* 9EDD8 0019ECD8 04000016 */  bnez       $16, .L0019ECEC
/* 9EDDC 0019ECDC 00000000 */   nop
/* 9EDE0 0019ECE0 28160070 */  paddub     $2, $0, $0
/* 9EDE4 0019ECE4 6D000010 */  b          .L0019EE9C
/* 9EDE8 0019ECE8 00000000 */   nop
.L0019ECEC:
/* 9EDEC 0019ECEC 0C001326 */  addiu      $19, $16, 0xC
/* 9EDF0 0019ECF0 0A000010 */  b          .L0019ED1C
/* 9EDF4 0019ECF4 00000000 */   nop
.L0019ECF8:
/* 9EDF8 0019ECF8 3C1E0200 */  dsll32     $3, $2, 24
/* 9EDFC 0019ECFC 3F1E0300 */  dsra32     $3, $3, 24
/* 9EE00 0019ED00 2E000224 */  addiu      $2, $0, 0x2E
/* 9EE04 0019ED04 04006214 */  bne        $3, $2, .L0019ED18
/* 9EE08 0019ED08 00000000 */   nop
/* 9EE0C 0019ED0C 01007326 */  addiu      $19, $19, 0x1
/* 9EE10 0019ED10 05000010 */  b          .L0019ED28
/* 9EE14 0019ED14 00000000 */   nop
.L0019ED18:
/* 9EE18 0019ED18 01007326 */  addiu      $19, $19, 0x1
.L0019ED1C:
/* 9EE1C 0019ED1C 00006282 */  lb         $2, 0x0($19)
/* 9EE20 0019ED20 F5FF4014 */  bnez       $2, .L0019ECF8
/* 9EE24 0019ED24 00000000 */   nop
.L0019ED28:
/* 9EE28 0019ED28 288E0070 */  paddub     $17, $0, $0
/* 9EE2C 0019ED2C D501023C */  lui        $2, %hi(TexAnime_2)
/* 9EE30 0019ED30 A0BD4424 */  addiu      $4, $2, %lo(TexAnime_2)
/* 9EE34 0019ED34 282E0070 */  paddub     $5, $0, $0
/* 9EE38 0019ED38 28360070 */  paddub     $6, $0, $0
/* 9EE3C 0019ED3C 089E050C */  jal        Initialize__13CTextureAnimeFP13CTexAnimeDatai
/* 9EE40 0019ED40 00000000 */   nop
/* 9EE44 0019ED44 28266072 */  paddub     $4, $19, $0
/* 9EE48 0019ED48 2A00023C */  lui        $2, %hi(_1399)
/* 9EE4C 0019ED4C 48B34524 */  addiu      $5, $2, %lo(_1399)
/* 9EE50 0019ED50 0815040C */  jal        strcmp
/* 9EE54 0019ED54 00000000 */   nop
/* 9EE58 0019ED58 06004014 */  bnez       $2, .L0019ED74
/* 9EE5C 0019ED5C 00000000 */   nop
/* 9EE60 0019ED60 8C00028E */  lw         $2, 0x8C($16)
/* 9EE64 0019ED64 2700013C */  lui        $at, (0x270000 >> 16)
/* 9EE68 0019ED68 B0A622AC */  sw         $2, -0x5950($at)
/* 9EE6C 0019ED6C 34000010 */  b          .L0019EE40
/* 9EE70 0019ED70 00000000 */   nop
.L0019ED74:
/* 9EE74 0019ED74 8C00048E */  lw         $4, 0x8C($16)
/* 9EE78 0019ED78 2A00023C */  lui        $2, %hi(_1399)
/* 9EE7C 0019ED7C 48B34524 */  addiu      $5, $2, %lo(_1399)
/* 9EE80 0019ED80 5800A627 */  addiu      $6, $sp, 0x58
/* 9EE84 0019ED84 01000724 */  addiu      $7, $0, 0x1
/* 9EE88 0019ED88 28460070 */  paddub     $8, $0, $0
/* 9EE8C 0019ED8C 284E0070 */  paddub     $9, $0, $0
/* 9EE90 0019ED90 1CFE040C */  jal        GetPackFileExt__FPUiPcPPUiiPiPPc
/* 9EE94 0019ED94 00000000 */   nop
/* 9EE98 0019ED98 04004018 */  blez       $2, .L0019EDAC
/* 9EE9C 0019ED9C 00000000 */   nop
/* 9EEA0 0019EDA0 5800A28F */  lw         $2, 0x58($sp)
/* 9EEA4 0019EDA4 2700013C */  lui        $at, (0x270000 >> 16)
/* 9EEA8 0019EDA8 B0A622AC */  sw         $2, -0x5950($at)
.L0019EDAC:
/* 9EEAC 0019EDAC 8C00048E */  lw         $4, 0x8C($16)
/* 9EEB0 0019EDB0 2A00023C */  lui        $2, %hi(_1400)
/* 9EEB4 0019EDB4 50B34524 */  addiu      $5, $2, %lo(_1400)
/* 9EEB8 0019EDB8 5800A627 */  addiu      $6, $sp, 0x58
/* 9EEBC 0019EDBC 01000724 */  addiu      $7, $0, 0x1
/* 9EEC0 0019EDC0 5C00A827 */  addiu      $8, $sp, 0x5C
/* 9EEC4 0019EDC4 284E0070 */  paddub     $9, $0, $0
/* 9EEC8 0019EDC8 1CFE040C */  jal        GetPackFileExt__FPUiPcPPUiiPiPPc
/* 9EECC 0019EDCC 00000000 */   nop
/* 9EED0 0019EDD0 1B004018 */  blez       $2, .L0019EE40
/* 9EED4 0019EDD4 00000000 */   nop
/* 9EED8 0019EDD8 D501023C */  lui        $2, %hi(TexAnime_2)
/* 9EEDC 0019EDDC A0BD4424 */  addiu      $4, $2, %lo(TexAnime_2)
/* 9EEE0 0019EDE0 D501023C */  lui        $2, %hi(TexAnimeData_2)
/* 9EEE4 0019EDE4 90BF4524 */  addiu      $5, $2, %lo(TexAnimeData_2)
/* 9EEE8 0019EDE8 40000624 */  addiu      $6, $0, 0x40
/* 9EEEC 0019EDEC 089E050C */  jal        Initialize__13CTextureAnimeFP13CTexAnimeDatai
/* 9EEF0 0019EDF0 00000000 */   nop
/* 9EEF4 0019EDF4 5800B18F */  lw         $17, 0x58($sp)
/* 9EEF8 0019EDF8 5C00B28F */  lw         $18, 0x5C($sp)
/* 9EEFC 0019EDFC 289E0070 */  paddub     $19, $0, $0
/* 9EF00 0019EE00 0C000010 */  b          .L0019EE34
/* 9EF04 0019EE04 00000000 */   nop
.L0019EE08:
/* 9EF08 0019EE08 80101300 */  sll        $2, $19, 2
/* 9EF0C 0019EE0C 21105300 */  addu       $2, $2, $19
/* 9EF10 0019EE10 40100200 */  sll        $2, $2, 1
/* 9EF14 0019EE14 21105300 */  addu       $2, $2, $19
/* 9EF18 0019EE18 C0180200 */  sll        $3, $2, 3
/* 9EF1C 0019EE1C D501023C */  lui        $2, %hi(TexAnimeData_2)
/* 9EF20 0019EE20 90BF4224 */  addiu      $2, $2, %lo(TexAnimeData_2)
/* 9EF24 0019EE24 21204300 */  addu       $4, $2, $3
/* 9EF28 0019EE28 349C050C */  jal        Initialize__13CTexAnimeDataFv
/* 9EF2C 0019EE2C 00000000 */   nop
/* 9EF30 0019EE30 01007326 */  addiu      $19, $19, 0x1
.L0019EE34:
/* 9EF34 0019EE34 4000622A */  slti       $2, $19, 0x40
/* 9EF38 0019EE38 F3FF4014 */  bnez       $2, .L0019EE08
/* 9EF3C 0019EE3C 00000000 */   nop
.L0019EE40:
/* 9EF40 0019EE40 C701023C */  lui        $2, %hi(TexManager)
/* 9EF44 0019EE44 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 9EF48 0019EE48 0F000524 */  addiu      $5, $0, 0xF
/* 9EF4C 0019EE4C 2700023C */  lui        $2, %hi(texdata$1374)
/* 9EF50 0019EE50 B0A64624 */  addiu      $6, $2, %lo(texdata$1374)
/* 9EF54 0019EE54 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 9EF58 0019EE58 00000000 */   nop
/* 9EF5C 0019EE5C 07002012 */  beqz       $17, .L0019EE7C
/* 9EF60 0019EE60 00000000 */   nop
/* 9EF64 0019EE64 D501023C */  lui        $2, %hi(TexAnime_2)
/* 9EF68 0019EE68 A0BD4424 */  addiu      $4, $2, %lo(TexAnime_2)
/* 9EF6C 0019EE6C 282E2072 */  paddub     $5, $17, $0
/* 9EF70 0019EE70 28364072 */  paddub     $6, $18, $0
/* 9EF74 0019EE74 F09E050C */  jal        LoadCFGFile__13CTextureAnimeFPci
/* 9EF78 0019EE78 00000000 */   nop
.L0019EE7C:
/* 9EF7C 0019EE7C 9000028E */  lw         $2, 0x90($16)
/* 9EF80 0019EE80 03110200 */  sra        $2, $2, 4
/* 9EF84 0019EE84 01004524 */  addiu      $5, $2, 0x1
/* 9EF88 0019EE88 D201023C */  lui        $2, %hi(EdNPCBuffer)
/* 9EF8C 0019EE8C 50B34424 */  addiu      $4, $2, %lo(EdNPCBuffer)
/* 9EF90 0019EE90 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 9EF94 0019EE94 00000000 */   nop
/* 9EF98 0019EE98 28160070 */  paddub     $2, $0, $0
.L0019EE9C:
/* 9EF9C 0019EE9C 4000BF7B */  lq         $31, 0x40($sp)
/* 9EFA0 0019EEA0 3000B37B */  lq         $19, 0x30($sp)
/* 9EFA4 0019EEA4 2000B27B */  lq         $18, 0x20($sp)
/* 9EFA8 0019EEA8 1000B17B */  lq         $17, 0x10($sp)
/* 9EFAC 0019EEAC 0000B07B */  lq         $16, 0x0($sp)
/* 9EFB0 0019EEB0 6000BD27 */  addiu      $sp, $sp, 0x60
/* 9EFB4 0019EEB4 0800E003 */  jr         $31
/* 9EFB8 0019EEB8 00000000 */   nop
/* 9EFBC 0019EEBC 00000000 */  nop
