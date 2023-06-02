.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MapNoTransFunc__Fi
/* 10AE80 0020AD80 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 10AE84 0020AD84 0A008128 */  slti       $at, $4, 0xA
/* 10AE88 0020AD88 0C002010 */  beqz       $at, .L0020ADBC
/* 10AE8C 0020AD8C 00000000 */   nop
/* 10AE90 0020AD90 2900023C */  lui        $2, %hi(_6408)
/* 10AE94 0020AD94 F0384224 */  addiu      $2, $2, %lo(_6408)
/* 10AE98 0020AD98 4800A527 */  addiu      $5, $sp, 0x48
/* 10AE9C 0020AD9C 000043DC */  ld         $3, 0x0($2)
/* 10AEA0 0020ADA0 08004284 */  lh         $2, 0x8($2)
/* 10AEA4 0020ADA4 0000A3FC */  sd         $3, 0x0($5)
/* 10AEA8 0020ADA8 0800A2A4 */  sh         $2, 0x8($5)
/* 10AEAC 0020ADAC 40100400 */  sll        $2, $4, 1
/* 10AEB0 0020ADB0 21105D00 */  addu       $2, $2, $sp
/* 10AEB4 0020ADB4 48004284 */  lh         $2, 0x48($2)
/* 10AEB8 0020ADB8 00000000 */  nop
.L0020ADBC:
/* 10AEBC 0020ADBC 0B008328 */  slti       $3, $4, 0xB
/* 10AEC0 0020ADC0 16006014 */  bnez       $3, .L0020AE1C
/* 10AEC4 0020ADC4 00000000 */   nop
/* 10AEC8 0020ADC8 C8008128 */  slti       $at, $4, 0xC8
/* 10AECC 0020ADCC 13002010 */  beqz       $at, .L0020AE1C
/* 10AED0 0020ADD0 00000000 */   nop
/* 10AED4 0020ADD4 2900023C */  lui        $2, %hi(_6412)
/* 10AED8 0020ADD8 00394624 */  addiu      $6, $2, %lo(_6412)
/* 10AEDC 0020ADDC 0000A527 */  addiu      $5, $sp, 0x0
/* 10AEE0 0020ADE0 04000324 */  addiu      $3, $0, 0x4
.L0020ADE4:
/* 10AEE4 0020ADE4 0000C278 */  lq         $2, 0x0($6)
/* 10AEE8 0020ADE8 1000C624 */  addiu      $6, $6, 0x10
/* 10AEEC 0020ADEC FFFF6324 */  addiu      $3, $3, -0x1
/* 10AEF0 0020ADF0 0000A27C */  sq         $2, 0x0($5)
/* 10AEF4 0020ADF4 1000A524 */  addiu      $5, $5, 0x10
/* 10AEF8 0020ADF8 FAFF601C */  bgtz       $3, .L0020ADE4
/* 10AEFC 0020ADFC 00000000 */   nop
/* 10AF00 0020AE00 0000C3C4 */  lwc1       $f3, 0x0($6)
/* 10AF04 0020AE04 0400C290 */  lbu        $2, 0x4($6)
/* 10AF08 0020AE08 0000A3E4 */  swc1       $f3, 0x0($5)
/* 10AF0C 0020AE0C 0400A2A0 */  sb         $2, 0x4($5)
/* 10AF10 0020AE10 21109D00 */  addu       $2, $4, $sp
/* 10AF14 0020AE14 F5FF4280 */  lb         $2, -0xB($2)
/* 10AF18 0020AE18 00000000 */  nop
.L0020AE1C:
/* 10AF1C 0020AE1C C8008328 */  slti       $3, $4, 0xC8
/* 10AF20 0020AE20 0A006014 */  bnez       $3, .L0020AE4C
/* 10AF24 0020AE24 00000000 */   nop
/* 10AF28 0020AE28 5800A327 */  addiu      $3, $sp, 0x58
/* 10AF2C 0020AE2C E08880C7 */  lwc1       $f0, -0x7720($gp)
/* 10AF30 0020AE30 E4888287 */  lh         $2, -0x771C($gp)
/* 10AF34 0020AE34 000060E4 */  swc1       $f0, 0x0($3)
/* 10AF38 0020AE38 040062A4 */  sh         $2, 0x4($3)
/* 10AF3C 0020AE3C 38FF8224 */  addiu      $2, $4, -0xC8
/* 10AF40 0020AE40 21105D00 */  addu       $2, $2, $sp
/* 10AF44 0020AE44 58004280 */  lb         $2, 0x58($2)
/* 10AF48 0020AE48 00000000 */  nop
.L0020AE4C:
/* 10AF4C 0020AE4C 6000BD27 */  addiu      $sp, $sp, 0x60
/* 10AF50 0020AE50 0800E003 */  jr         $31
/* 10AF54 0020AE54 00000000 */   nop
/* 10AF58 0020AE58 00000000 */  nop
/* 10AF5C 0020AE5C 00000000 */  nop
