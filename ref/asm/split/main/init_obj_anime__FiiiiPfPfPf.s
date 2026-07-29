.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel init_obj_anime__FiiiiPfPfPf
/* 08AED0 0018ADD0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 08AED4 0018ADD4 4000BF7F */  sq          $31, 0x40($29)
/* 08AED8 0018ADD8 3000B37F */  sq          $19, 0x30($29)
/* 08AEDC 0018ADDC 2000B27F */  sq          $18, 0x20($29)
/* 08AEE0 0018ADE0 1000B17F */  sq          $17, 0x10($29)
/* 08AEE4 0018ADE4 0000B07F */  sq          $16, 0x0($29)
/* 08AEE8 0018ADE8 289E2071 */  paddub      $19, $9, $0
/* 08AEEC 0018ADEC 28964071 */  paddub      $18, $10, $0
/* 08AEF0 0018ADF0 7C28060C */  jal         GetObjAnime__Fi
/* 08AEF4 0018ADF4 00000000 */   nop
/* 08AEF8 0018ADF8 28864070 */  paddub      $16, $2, $0
/* 08AEFC 0018ADFC 2826A070 */  paddub      $4, $5, $0
/* 08AF00 0018AE00 0C29060C */  jal         GetObjHandle__Fi
/* 08AF04 0018AE04 00000000 */   nop
/* 08AF08 0018AE08 288E4070 */  paddub      $17, $2, $0
/* 08AF0C 0018AE0C 03000012 */  beqz        $16, .L0018AE1C
/* 08AF10 0018AE10 00000000 */   nop
/* 08AF14 0018AE14 04002016 */  bnez        $17, .L0018AE28
/* 08AF18 0018AE18 00000000 */   nop
.L0018AE1C:
/* 08AF1C 0018AE1C 28160070 */  paddub      $2, $0, $0
/* 08AF20 0018AE20 15000010 */  b           .L0018AE78
/* 08AF24 0018AE24 00000000 */   nop
.L0018AE28:
/* 08AF28 0018AE28 100006AE */  sw          $6, 0x10($16)
/* 08AF2C 0018AE2C 140007AE */  sw          $7, 0x14($16)
/* 08AF30 0018AE30 000000A2 */  sb          $0, 0x0($16)
/* 08AF34 0018AE34 40000426 */  addiu       $4, $16, 0x40
/* 08AF38 0018AE38 282E0071 */  paddub      $5, $8, $0
/* 08AF3C 0018AE3C 0C86040C */  jal         sceVu0CopyVector
/* 08AF40 0018AE40 00000000 */   nop
/* 08AF44 0018AE44 20000426 */  addiu       $4, $16, 0x20
/* 08AF48 0018AE48 282E6072 */  paddub      $5, $19, $0
/* 08AF4C 0018AE4C 0C86040C */  jal         sceVu0CopyVector
/* 08AF50 0018AE50 00000000 */   nop
/* 08AF54 0018AE54 30000426 */  addiu       $4, $16, 0x30
/* 08AF58 0018AE58 282E4072 */  paddub      $5, $18, $0
/* 08AF5C 0018AE5C 0C86040C */  jal         sceVu0CopyVector
/* 08AF60 0018AE60 00000000 */   nop
/* 08AF64 0018AE64 08002426 */  addiu       $4, $17, 0x8
/* 08AF68 0018AE68 0C000524 */  addiu       $5, $0, 0xC
/* 08AF6C 0018AE6C 28360072 */  paddub      $6, $16, $0
/* 08AF70 0018AE70 B497050C */  jal         InitObjAnime__FPP6CFrameiP13OBJ_ANIME_SEQ
/* 08AF74 0018AE74 00000000 */   nop
.L0018AE78:
/* 08AF78 0018AE78 4000BF7B */  lq          $31, 0x40($29)
/* 08AF7C 0018AE7C 3000B37B */  lq          $19, 0x30($29)
/* 08AF80 0018AE80 2000B27B */  lq          $18, 0x20($29)
/* 08AF84 0018AE84 1000B17B */  lq          $17, 0x10($29)
/* 08AF88 0018AE88 0000B07B */  lq          $16, 0x0($29)
/* 08AF8C 0018AE8C 5000BD27 */  addiu       $29, $29, 0x50
/* 08AF90 0018AE90 0800E003 */  jr          $31
/* 08AF94 0018AE94 00000000 */   nop
/* 08AF98 0018AE98 00000000 */  nop
/* 08AF9C 0018AE9C 00000000 */  nop
