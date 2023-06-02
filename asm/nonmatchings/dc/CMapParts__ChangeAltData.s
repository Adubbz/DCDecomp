.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ChangeAltData__9CMapPartsFv
/* 9AD40 0019AC40 0801858C */  lw         $5, 0x108($4)
/* 9AD44 0019AC44 0400A014 */  bnez       $5, .L0019AC58
/* 9AD48 0019AC48 00000000 */   nop
/* 9AD4C 0019AC4C 28160070 */  paddub     $2, $0, $0
/* 9AD50 0019AC50 1F000010 */  b          .L0019ACD0
/* 9AD54 0019AC54 00000000 */   nop
.L0019AC58:
/* 9AD58 0019AC58 E400A68C */  lw         $6, 0xE4($5)
/* 9AD5C 0019AC5C 0400C014 */  bnez       $6, .L0019AC70
/* 9AD60 0019AC60 00000000 */   nop
/* 9AD64 0019AC64 28160070 */  paddub     $2, $0, $0
/* 9AD68 0019AC68 19000010 */  b          .L0019ACD0
/* 9AD6C 0019AC6C 00000000 */   nop
.L0019AC70:
/* 9AD70 0019AC70 28260070 */  paddub     $4, $0, $0
/* 9AD74 0019AC74 0F000010 */  b          .L0019ACB4
/* 9AD78 0019AC78 00000000 */   nop
.L0019AC7C:
/* 9AD7C 0019AC7C 3C00C28C */  lw         $2, 0x3C($6)
/* 9AD80 0019AC80 21104400 */  addu       $2, $2, $4
/* 9AD84 0019AC84 00004290 */  lbu        $2, 0x0($2)
/* 9AD88 0019AC88 3C140200 */  dsll32     $2, $2, 16
/* 9AD8C 0019AC8C 3F140200 */  dsra32     $2, $2, 16
/* 9AD90 0019AC90 07004010 */  beqz       $2, .L0019ACB0
/* 9AD94 0019AC94 00000000 */   nop
/* 9AD98 0019AC98 80004128 */  slti       $at, $2, 0x80
/* 9AD9C 0019AC9C 04002010 */  beqz       $at, .L0019ACB0
/* 9ADA0 0019ACA0 00000000 */   nop
/* 9ADA4 0019ACA4 01000224 */  addiu      $2, $0, 0x1
/* 9ADA8 0019ACA8 09000010 */  b          .L0019ACD0
/* 9ADAC 0019ACAC 00000000 */   nop
.L0019ACB0:
/* 9ADB0 0019ACB0 01008424 */  addiu      $4, $4, 0x1
.L0019ACB4:
/* 9ADB4 0019ACB4 1C00A38C */  lw         $3, 0x1C($5)
/* 9ADB8 0019ACB8 2000A28C */  lw         $2, 0x20($5)
/* 9ADBC 0019ACBC 18106200 */  mult       $2, $3, $2
/* 9ADC0 0019ACC0 2A108200 */  slt        $2, $4, $2
/* 9ADC4 0019ACC4 EDFF4014 */  bnez       $2, .L0019AC7C
/* 9ADC8 0019ACC8 00000000 */   nop
/* 9ADCC 0019ACCC 28160070 */  paddub     $2, $0, $0
.L0019ACD0:
/* 9ADD0 0019ACD0 0800E003 */  jr         $31
/* 9ADD4 0019ACD4 00000000 */   nop
/* 9ADD8 0019ACD8 00000000 */  nop
/* 9ADDC 0019ACDC 00000000 */  nop
