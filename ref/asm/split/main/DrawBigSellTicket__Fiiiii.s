.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawBigSellTicket__Fiiiii
/* 0ECA50 001EC950 80FFBD27 */  addiu       $29, $29, -0x80
/* 0ECA54 001EC954 4000BF7F */  sq          $31, 0x40($29)
/* 0ECA58 001EC958 3000B37F */  sq          $19, 0x30($29)
/* 0ECA5C 001EC95C 2000B27F */  sq          $18, 0x20($29)
/* 0ECA60 001EC960 1000B17F */  sq          $17, 0x10($29)
/* 0ECA64 001EC964 0000B07F */  sq          $16, 0x0($29)
/* 0ECA68 001EC968 289EA070 */  paddub      $19, $5, $0
/* 0ECA6C 001EC96C 28960071 */  paddub      $18, $8, $0
/* 0ECA70 001EC970 1200D024 */  addiu       $16, $6, 0x12
/* 0ECA74 001EC974 1400F124 */  addiu       $17, $7, 0x14
/* 0ECA78 001EC978 A0010524 */  addiu       $5, $0, 0x1A0
/* 0ECA7C 001EC97C 2900023C */  lui         $2, %hi(LIT_1852)
/* 0ECA80 001EC980 30284224 */  addiu       $2, $2, %lo(LIT_1852)
/* 0ECA84 001EC984 5000A327 */  addiu       $3, $29, 0x50
/* 0ECA88 001EC988 00004278 */  lq          $2, 0x0($2)
/* 0ECA8C 001EC98C 0000627C */  sq          $2, 0x0($3)
/* 0ECA90 001EC990 05008010 */  beqz        $4, .L001EC9A8
/* 0ECA94 001EC994 00000000 */   nop
/* 0ECA98 001EC998 CC010524 */  addiu       $5, $0, 0x1CC
/* 0ECA9C 001EC99C 5400A28F */  lw          $2, 0x54($29)
/* 0ECAA0 001EC9A0 0C004224 */  addiu       $2, $2, 0xC
/* 0ECAA4 001EC9A4 5400A2AF */  sw          $2, 0x54($29)
.L001EC9A8:
/* 0ECAA8 001EC9A8 7000A5AF */  sw          $5, 0x70($29)
/* 0ECAAC 001EC9AC B0000224 */  addiu       $2, $0, 0xB0
/* 0ECAB0 001EC9B0 7400A2AF */  sw          $2, 0x74($29)
/* 0ECAB4 001EC9B4 2C000324 */  addiu       $3, $0, 0x2C
/* 0ECAB8 001EC9B8 7800A3AF */  sw          $3, 0x78($29)
/* 0ECABC 001EC9BC 20000224 */  addiu       $2, $0, 0x20
/* 0ECAC0 001EC9C0 7C00A2AF */  sw          $2, 0x7C($29)
/* 0ECAC4 001EC9C4 6000B0AF */  sw          $16, 0x60($29)
/* 0ECAC8 001EC9C8 6400B1AF */  sw          $17, 0x64($29)
/* 0ECACC 001EC9CC 6800A3AF */  sw          $3, 0x68($29)
/* 0ECAD0 001EC9D0 6C00A2AF */  sw          $2, 0x6C($29)
/* 0ECAD4 001EC9D4 8894848F */  lw          $4, -0x6B78($28)
/* 0ECAD8 001EC9D8 6000A527 */  addiu       $5, $29, 0x60
/* 0ECADC 001EC9DC 7000A627 */  addiu       $6, $29, 0x70
/* 0ECAE0 001EC9E0 283E4072 */  paddub      $7, $18, $0
/* 0ECAE4 001EC9E4 C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0ECAE8 001EC9E8 00000000 */   nop
/* 0ECAEC 001EC9EC 24000526 */  addiu       $5, $16, 0x24
/* 0ECAF0 001EC9F0 0E002626 */  addiu       $6, $17, 0xE
/* 0ECAF4 001EC9F4 28266072 */  paddub      $4, $19, $0
/* 0ECAF8 001EC9F8 8894878F */  lw          $7, -0x6B78($28)
/* 0ECAFC 001EC9FC 5000A827 */  addiu       $8, $29, 0x50
/* 0ECB00 001ECA00 284E0070 */  paddub      $9, $0, $0
/* 0ECB04 001ECA04 28564072 */  paddub      $10, $18, $0
/* 0ECB08 001ECA08 705F080C */  jal         DrawMenuNumber__FiiiP8CTexture4RECTii
/* 0ECB0C 001ECA0C 00000000 */   nop
/* 0ECB10 001ECA10 4000BF7B */  lq          $31, 0x40($29)
/* 0ECB14 001ECA14 3000B37B */  lq          $19, 0x30($29)
/* 0ECB18 001ECA18 2000B27B */  lq          $18, 0x20($29)
/* 0ECB1C 001ECA1C 1000B17B */  lq          $17, 0x10($29)
/* 0ECB20 001ECA20 0000B07B */  lq          $16, 0x0($29)
/* 0ECB24 001ECA24 8000BD27 */  addiu       $29, $29, 0x80
/* 0ECB28 001ECA28 0800E003 */  jr          $31
/* 0ECB2C 001ECA2C 00000000 */   nop
