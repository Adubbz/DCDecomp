.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel init_obj_anime__FiiiiPfPfPf
/* 8AED0 0018ADD0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 8AED4 0018ADD4 4000BF7F */  sq         $31, 0x40($sp)
/* 8AED8 0018ADD8 3000B37F */  sq         $19, 0x30($sp)
/* 8AEDC 0018ADDC 2000B27F */  sq         $18, 0x20($sp)
/* 8AEE0 0018ADE0 1000B17F */  sq         $17, 0x10($sp)
/* 8AEE4 0018ADE4 0000B07F */  sq         $16, 0x0($sp)
/* 8AEE8 0018ADE8 289E2071 */  paddub     $19, $9, $0
/* 8AEEC 0018ADEC 28964071 */  paddub     $18, $10, $0
/* 8AEF0 0018ADF0 7C28060C */  jal        GetObjAnime__Fi
/* 8AEF4 0018ADF4 00000000 */   nop
/* 8AEF8 0018ADF8 28864070 */  paddub     $16, $2, $0
/* 8AEFC 0018ADFC 2826A070 */  paddub     $4, $5, $0
/* 8AF00 0018AE00 0C29060C */  jal        GetObjHandle__Fi
/* 8AF04 0018AE04 00000000 */   nop
/* 8AF08 0018AE08 288E4070 */  paddub     $17, $2, $0
/* 8AF0C 0018AE0C 03000012 */  beqz       $16, .L0018AE1C
/* 8AF10 0018AE10 00000000 */   nop
/* 8AF14 0018AE14 04002016 */  bnez       $17, .L0018AE28
/* 8AF18 0018AE18 00000000 */   nop
.L0018AE1C:
/* 8AF1C 0018AE1C 28160070 */  paddub     $2, $0, $0
/* 8AF20 0018AE20 15000010 */  b          .L0018AE78
/* 8AF24 0018AE24 00000000 */   nop
.L0018AE28:
/* 8AF28 0018AE28 100006AE */  sw         $6, 0x10($16)
/* 8AF2C 0018AE2C 140007AE */  sw         $7, 0x14($16)
/* 8AF30 0018AE30 000000A2 */  sb         $0, 0x0($16)
/* 8AF34 0018AE34 40000426 */  addiu      $4, $16, 0x40
/* 8AF38 0018AE38 282E0071 */  paddub     $5, $8, $0
/* 8AF3C 0018AE3C 0C86040C */  jal        sceVu0CopyVector
/* 8AF40 0018AE40 00000000 */   nop
/* 8AF44 0018AE44 20000426 */  addiu      $4, $16, 0x20
/* 8AF48 0018AE48 282E6072 */  paddub     $5, $19, $0
/* 8AF4C 0018AE4C 0C86040C */  jal        sceVu0CopyVector
/* 8AF50 0018AE50 00000000 */   nop
/* 8AF54 0018AE54 30000426 */  addiu      $4, $16, 0x30
/* 8AF58 0018AE58 282E4072 */  paddub     $5, $18, $0
/* 8AF5C 0018AE5C 0C86040C */  jal        sceVu0CopyVector
/* 8AF60 0018AE60 00000000 */   nop
/* 8AF64 0018AE64 08002426 */  addiu      $4, $17, 0x8
/* 8AF68 0018AE68 0C000524 */  addiu      $5, $0, 0xC
/* 8AF6C 0018AE6C 28360072 */  paddub     $6, $16, $0
/* 8AF70 0018AE70 B497050C */  jal        InitObjAnime__FPP6CFrameiP13OBJ_ANIME_SEQ
/* 8AF74 0018AE74 00000000 */   nop
.L0018AE78:
/* 8AF78 0018AE78 4000BF7B */  lq         $31, 0x40($sp)
/* 8AF7C 0018AE7C 3000B37B */  lq         $19, 0x30($sp)
/* 8AF80 0018AE80 2000B27B */  lq         $18, 0x20($sp)
/* 8AF84 0018AE84 1000B17B */  lq         $17, 0x10($sp)
/* 8AF88 0018AE88 0000B07B */  lq         $16, 0x0($sp)
/* 8AF8C 0018AE8C 5000BD27 */  addiu      $sp, $sp, 0x50
/* 8AF90 0018AE90 0800E003 */  jr         $31
/* 8AF94 0018AE94 00000000 */   nop
/* 8AF98 0018AE98 00000000 */  nop
/* 8AF9C 0018AE9C 00000000 */  nop
