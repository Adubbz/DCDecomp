.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel IsLoadMapNo__Fv
/* 10AD70 0020AC70 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 10AD74 0020AC74 2000BF7F */  sq         $31, 0x20($sp)
/* 10AD78 0020AC78 1000B17F */  sq         $17, 0x10($sp)
/* 10AD7C 0020AC7C 0000B07F */  sq         $16, 0x0($sp)
/* 10AD80 0020AC80 FFFF1024 */  addiu      $16, $0, -0x1
/* 10AD84 0020AC84 2900023C */  lui        $2, %hi(_6385)
/* 10AD88 0020AC88 A0384524 */  addiu      $5, $2, %lo(_6385)
/* 10AD8C 0020AC8C 3000A427 */  addiu      $4, $sp, 0x30
/* 10AD90 0020AC90 05000324 */  addiu      $3, $0, 0x5
.L0020AC94:
/* 10AD94 0020AC94 0000A278 */  lq         $2, 0x0($5)
/* 10AD98 0020AC98 1000A524 */  addiu      $5, $5, 0x10
/* 10AD9C 0020AC9C FFFF6324 */  addiu      $3, $3, -0x1
/* 10ADA0 0020ACA0 0000827C */  sq         $2, 0x0($4)
/* 10ADA4 0020ACA4 10008424 */  addiu      $4, $4, 0x10
/* 10ADA8 0020ACA8 FAFF601C */  bgtz       $3, .L0020AC94
/* 10ADAC 0020ACAC 00000000 */   nop
/* 10ADB0 0020ACB0 288E0070 */  paddub     $17, $0, $0
/* 10ADB4 0020ACB4 0F000010 */  b          .L0020ACF4
/* 10ADB8 0020ACB8 00000000 */   nop
.L0020ACBC:
/* 10ADBC 0020ACBC D094848F */  lw         $4, -0x6B30($gp)
/* 10ADC0 0020ACC0 282E2072 */  paddub     $5, $17, $0
/* 10ADC4 0020ACC4 28360070 */  paddub     $6, $0, $0
/* 10ADC8 0020ACC8 0062050C */  jal        VisitMap__9CSaveDataFii
/* 10ADCC 0020ACCC 00000000 */   nop
/* 10ADD0 0020ACD0 07004010 */  beqz       $2, .L0020ACF0
/* 10ADD4 0020ACD4 00000000 */   nop
/* 10ADD8 0020ACD8 21103D02 */  addu       $2, $17, $sp
/* 10ADDC 0020ACDC 30004280 */  lb         $2, 0x30($2)
/* 10ADE0 0020ACE0 2A080202 */  slt        $at, $16, $2
/* 10ADE4 0020ACE4 02002010 */  beqz       $at, .L0020ACF0
/* 10ADE8 0020ACE8 00000000 */   nop
/* 10ADEC 0020ACEC 28864070 */  paddub     $16, $2, $0
.L0020ACF0:
/* 10ADF0 0020ACF0 01003126 */  addiu      $17, $17, 0x1
.L0020ACF4:
/* 10ADF4 0020ACF4 5000222A */  slti       $2, $17, 0x50
/* 10ADF8 0020ACF8 F0FF4014 */  bnez       $2, .L0020ACBC
/* 10ADFC 0020ACFC 00000000 */   nop
/* 10AE00 0020AD00 8800A327 */  addiu      $3, $sp, 0x88
/* 10AE04 0020AD04 D88880C7 */  lwc1       $f0, -0x7728($gp)
/* 10AE08 0020AD08 DC888287 */  lh         $2, -0x7724($gp)
/* 10AE0C 0020AD0C 000060E4 */  swc1       $f0, 0x0($3)
/* 10AE10 0020AD10 040062A4 */  sh         $2, 0x4($3)
/* 10AE14 0020AD14 01001124 */  addiu      $17, $0, 0x1
/* 10AE18 0020AD18 0F000010 */  b          .L0020AD58
/* 10AE1C 0020AD1C 00000000 */   nop
.L0020AD20:
/* 10AE20 0020AD20 D094848F */  lw         $4, -0x6B30($gp)
/* 10AE24 0020AD24 282E2072 */  paddub     $5, $17, $0
/* 10AE28 0020AD28 28360070 */  paddub     $6, $0, $0
/* 10AE2C 0020AD2C 1C62050C */  jal        QuestDungeon__9CSaveDataFii
/* 10AE30 0020AD30 00000000 */   nop
/* 10AE34 0020AD34 07004010 */  beqz       $2, .L0020AD54
/* 10AE38 0020AD38 00000000 */   nop
/* 10AE3C 0020AD3C 21103D02 */  addu       $2, $17, $sp
/* 10AE40 0020AD40 87004280 */  lb         $2, 0x87($2)
/* 10AE44 0020AD44 2A080202 */  slt        $at, $16, $2
/* 10AE48 0020AD48 02002010 */  beqz       $at, .L0020AD54
/* 10AE4C 0020AD4C 00000000 */   nop
/* 10AE50 0020AD50 28864070 */  paddub     $16, $2, $0
.L0020AD54:
/* 10AE54 0020AD54 01003126 */  addiu      $17, $17, 0x1
.L0020AD58:
/* 10AE58 0020AD58 0600212A */  slti       $at, $17, 0x6
/* 10AE5C 0020AD5C F0FF2014 */  bnez       $at, .L0020AD20
/* 10AE60 0020AD60 00000000 */   nop
/* 10AE64 0020AD64 28160072 */  paddub     $2, $16, $0
/* 10AE68 0020AD68 2000BF7B */  lq         $31, 0x20($sp)
/* 10AE6C 0020AD6C 1000B17B */  lq         $17, 0x10($sp)
/* 10AE70 0020AD70 0000B07B */  lq         $16, 0x0($sp)
/* 10AE74 0020AD74 9000BD27 */  addiu      $sp, $sp, 0x90
/* 10AE78 0020AD78 0800E003 */  jr         $31
/* 10AE7C 0020AD7C 00000000 */   nop
