.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadTexture__Fv__2
/* 09EDB0 0019ECB0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 09EDB4 0019ECB4 4000BF7F */  sq          $31, 0x40($29)
/* 09EDB8 0019ECB8 3000B37F */  sq          $19, 0x30($29)
/* 09EDBC 0019ECBC 2000B27F */  sq          $18, 0x20($29)
/* 09EDC0 0019ECC0 1000B17F */  sq          $17, 0x10($29)
/* 09EDC4 0019ECC4 0000B07F */  sq          $16, 0x0($29)
/* 09EDC8 0019ECC8 02000424 */  addiu       $4, $0, 0x2
/* 09EDCC 0019ECCC 18FB040C */  jal         GetReadBGFile__Fi
/* 09EDD0 0019ECD0 00000000 */   nop
/* 09EDD4 0019ECD4 28864070 */  paddub      $16, $2, $0
/* 09EDD8 0019ECD8 04000016 */  bnez        $16, .L0019ECEC
/* 09EDDC 0019ECDC 00000000 */   nop
/* 09EDE0 0019ECE0 28160070 */  paddub      $2, $0, $0
/* 09EDE4 0019ECE4 6D000010 */  b           .L0019EE9C
/* 09EDE8 0019ECE8 00000000 */   nop
.L0019ECEC:
/* 09EDEC 0019ECEC 0C001326 */  addiu       $19, $16, 0xC
/* 09EDF0 0019ECF0 0A000010 */  b           .L0019ED1C
/* 09EDF4 0019ECF4 00000000 */   nop
.L0019ECF8:
/* 09EDF8 0019ECF8 3C1E0200 */  dsll32      $3, $2, 24
/* 09EDFC 0019ECFC 3F1E0300 */  dsra32      $3, $3, 24
/* 09EE00 0019ED00 2E000224 */  addiu       $2, $0, 0x2E
/* 09EE04 0019ED04 04006214 */  bne         $3, $2, .L0019ED18
/* 09EE08 0019ED08 00000000 */   nop
/* 09EE0C 0019ED0C 01007326 */  addiu       $19, $19, 0x1
/* 09EE10 0019ED10 05000010 */  b           .L0019ED28
/* 09EE14 0019ED14 00000000 */   nop
.L0019ED18:
/* 09EE18 0019ED18 01007326 */  addiu       $19, $19, 0x1
.L0019ED1C:
/* 09EE1C 0019ED1C 00006282 */  lb          $2, 0x0($19)
/* 09EE20 0019ED20 F5FF4014 */  bnez        $2, .L0019ECF8
/* 09EE24 0019ED24 00000000 */   nop
.L0019ED28:
/* 09EE28 0019ED28 288E0070 */  paddub      $17, $0, $0
/* 09EE2C 0019ED2C D501023C */  lui         $2, %hi(TexAnime__2)
/* 09EE30 0019ED30 A0BD4424 */  addiu       $4, $2, %lo(TexAnime__2)
/* 09EE34 0019ED34 282E0070 */  paddub      $5, $0, $0
/* 09EE38 0019ED38 28360070 */  paddub      $6, $0, $0
/* 09EE3C 0019ED3C 089E050C */  jal         Initialize__13CTextureAnimeFP13CTexAnimeDatai
/* 09EE40 0019ED40 00000000 */   nop
/* 09EE44 0019ED44 28266072 */  paddub      $4, $19, $0
/* 09EE48 0019ED48 2A00023C */  lui         $2, %hi(LIT_1399)
/* 09EE4C 0019ED4C 48B34524 */  addiu       $5, $2, %lo(LIT_1399)
/* 09EE50 0019ED50 0815040C */  jal         strcmp
/* 09EE54 0019ED54 00000000 */   nop
/* 09EE58 0019ED58 06004014 */  bnez        $2, .L0019ED74
/* 09EE5C 0019ED5C 00000000 */   nop
/* 09EE60 0019ED60 8C00028E */  lw          $2, 0x8C($16)
/* 09EE64 0019ED64 2700013C */  lui         $1, %hi(texdata$1374)
/* 09EE68 0019ED68 B0A622AC */  sw          $2, %lo(texdata$1374)($1)
/* 09EE6C 0019ED6C 34000010 */  b           .L0019EE40
/* 09EE70 0019ED70 00000000 */   nop
.L0019ED74:
/* 09EE74 0019ED74 8C00048E */  lw          $4, 0x8C($16)
/* 09EE78 0019ED78 2A00023C */  lui         $2, %hi(LIT_1399)
/* 09EE7C 0019ED7C 48B34524 */  addiu       $5, $2, %lo(LIT_1399)
/* 09EE80 0019ED80 5800A627 */  addiu       $6, $29, 0x58
/* 09EE84 0019ED84 01000724 */  addiu       $7, $0, 0x1
/* 09EE88 0019ED88 28460070 */  paddub      $8, $0, $0
/* 09EE8C 0019ED8C 284E0070 */  paddub      $9, $0, $0
/* 09EE90 0019ED90 1CFE040C */  jal         GetPackFileExt__FPUiPcPPUiiPiPPc
/* 09EE94 0019ED94 00000000 */   nop
/* 09EE98 0019ED98 04004018 */  blez        $2, .L0019EDAC
/* 09EE9C 0019ED9C 00000000 */   nop
/* 09EEA0 0019EDA0 5800A28F */  lw          $2, 0x58($29)
/* 09EEA4 0019EDA4 2700013C */  lui         $1, %hi(texdata$1374)
/* 09EEA8 0019EDA8 B0A622AC */  sw          $2, %lo(texdata$1374)($1)
.L0019EDAC:
/* 09EEAC 0019EDAC 8C00048E */  lw          $4, 0x8C($16)
/* 09EEB0 0019EDB0 2A00023C */  lui         $2, %hi(LIT_1400)
/* 09EEB4 0019EDB4 50B34524 */  addiu       $5, $2, %lo(LIT_1400)
/* 09EEB8 0019EDB8 5800A627 */  addiu       $6, $29, 0x58
/* 09EEBC 0019EDBC 01000724 */  addiu       $7, $0, 0x1
/* 09EEC0 0019EDC0 5C00A827 */  addiu       $8, $29, 0x5C
/* 09EEC4 0019EDC4 284E0070 */  paddub      $9, $0, $0
/* 09EEC8 0019EDC8 1CFE040C */  jal         GetPackFileExt__FPUiPcPPUiiPiPPc
/* 09EECC 0019EDCC 00000000 */   nop
/* 09EED0 0019EDD0 1B004018 */  blez        $2, .L0019EE40
/* 09EED4 0019EDD4 00000000 */   nop
/* 09EED8 0019EDD8 D501023C */  lui         $2, %hi(TexAnime__2)
/* 09EEDC 0019EDDC A0BD4424 */  addiu       $4, $2, %lo(TexAnime__2)
/* 09EEE0 0019EDE0 D501023C */  lui         $2, %hi(TexAnimeData__2)
/* 09EEE4 0019EDE4 90BF4524 */  addiu       $5, $2, %lo(TexAnimeData__2)
/* 09EEE8 0019EDE8 40000624 */  addiu       $6, $0, 0x40
/* 09EEEC 0019EDEC 089E050C */  jal         Initialize__13CTextureAnimeFP13CTexAnimeDatai
/* 09EEF0 0019EDF0 00000000 */   nop
/* 09EEF4 0019EDF4 5800B18F */  lw          $17, 0x58($29)
/* 09EEF8 0019EDF8 5C00B28F */  lw          $18, 0x5C($29)
/* 09EEFC 0019EDFC 289E0070 */  paddub      $19, $0, $0
/* 09EF00 0019EE00 0C000010 */  b           .L0019EE34
/* 09EF04 0019EE04 00000000 */   nop
.L0019EE08:
/* 09EF08 0019EE08 80101300 */  sll         $2, $19, 2
/* 09EF0C 0019EE0C 21105300 */  addu        $2, $2, $19
/* 09EF10 0019EE10 40100200 */  sll         $2, $2, 1
/* 09EF14 0019EE14 21105300 */  addu        $2, $2, $19
/* 09EF18 0019EE18 C0180200 */  sll         $3, $2, 3
/* 09EF1C 0019EE1C D501023C */  lui         $2, %hi(TexAnimeData__2)
/* 09EF20 0019EE20 90BF4224 */  addiu       $2, $2, %lo(TexAnimeData__2)
/* 09EF24 0019EE24 21204300 */  addu        $4, $2, $3
/* 09EF28 0019EE28 349C050C */  jal         Initialize__13CTexAnimeDataFv
/* 09EF2C 0019EE2C 00000000 */   nop
/* 09EF30 0019EE30 01007326 */  addiu       $19, $19, 0x1
.L0019EE34:
/* 09EF34 0019EE34 4000622A */  slti        $2, $19, 0x40
/* 09EF38 0019EE38 F3FF4014 */  bnez        $2, .L0019EE08
/* 09EF3C 0019EE3C 00000000 */   nop
.L0019EE40:
/* 09EF40 0019EE40 C701023C */  lui         $2, %hi(TexManager)
/* 09EF44 0019EE44 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 09EF48 0019EE48 0F000524 */  addiu       $5, $0, 0xF
/* 09EF4C 0019EE4C 2700023C */  lui         $2, %hi(texdata$1374)
/* 09EF50 0019EE50 B0A64624 */  addiu       $6, $2, %lo(texdata$1374)
/* 09EF54 0019EE54 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 09EF58 0019EE58 00000000 */   nop
/* 09EF5C 0019EE5C 07002012 */  beqz        $17, .L0019EE7C
/* 09EF60 0019EE60 00000000 */   nop
/* 09EF64 0019EE64 D501023C */  lui         $2, %hi(TexAnime__2)
/* 09EF68 0019EE68 A0BD4424 */  addiu       $4, $2, %lo(TexAnime__2)
/* 09EF6C 0019EE6C 282E2072 */  paddub      $5, $17, $0
/* 09EF70 0019EE70 28364072 */  paddub      $6, $18, $0
/* 09EF74 0019EE74 F09E050C */  jal         LoadCFGFile__13CTextureAnimeFPci
/* 09EF78 0019EE78 00000000 */   nop
.L0019EE7C:
/* 09EF7C 0019EE7C 9000028E */  lw          $2, 0x90($16)
/* 09EF80 0019EE80 03110200 */  sra         $2, $2, 4
/* 09EF84 0019EE84 01004524 */  addiu       $5, $2, 0x1
/* 09EF88 0019EE88 D201023C */  lui         $2, %hi(EdNPCBuffer)
/* 09EF8C 0019EE8C 50B34424 */  addiu       $4, $2, %lo(EdNPCBuffer)
/* 09EF90 0019EE90 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 09EF94 0019EE94 00000000 */   nop
/* 09EF98 0019EE98 28160070 */  paddub      $2, $0, $0
.L0019EE9C:
/* 09EF9C 0019EE9C 4000BF7B */  lq          $31, 0x40($29)
/* 09EFA0 0019EEA0 3000B37B */  lq          $19, 0x30($29)
/* 09EFA4 0019EEA4 2000B27B */  lq          $18, 0x20($29)
/* 09EFA8 0019EEA8 1000B17B */  lq          $17, 0x10($29)
/* 09EFAC 0019EEAC 0000B07B */  lq          $16, 0x0($29)
/* 09EFB0 0019EEB0 6000BD27 */  addiu       $29, $29, 0x60
/* 09EFB4 0019EEB4 0800E003 */  jr          $31
/* 09EFB8 0019EEB8 00000000 */   nop
/* 09EFBC 0019EEBC 00000000 */  nop
