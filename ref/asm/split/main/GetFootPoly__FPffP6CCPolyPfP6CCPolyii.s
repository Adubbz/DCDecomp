.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetFootPoly__FPffP6CCPolyPfP6CCPolyii
/* 04ACB0 0014ABB0 B0FABD27 */  addiu       $29, $29, -0x550
/* 04ACB4 0014ABB4 8000BF7F */  sq          $31, 0x80($29)
/* 04ACB8 0014ABB8 7000B57F */  sq          $21, 0x70($29)
/* 04ACBC 0014ABBC 6000B47F */  sq          $20, 0x60($29)
/* 04ACC0 0014ABC0 5000B37F */  sq          $19, 0x50($29)
/* 04ACC4 0014ABC4 4000B27F */  sq          $18, 0x40($29)
/* 04ACC8 0014ABC8 3000B17F */  sq          $17, 0x30($29)
/* 04ACCC 0014ABCC 2000B07F */  sq          $16, 0x20($29)
/* 04ACD0 0014ABD0 1000B4E7 */  swc1        $f20, 0x10($29)
/* 04ACD4 0014ABD4 28968070 */  paddub      $18, $4, $0
/* 04ACD8 0014ABD8 06650046 */  mov.s       $f20, $f12
/* 04ACDC 0014ABDC 28AEA070 */  paddub      $21, $5, $0
/* 04ACE0 0014ABE0 28A6C070 */  paddub      $20, $6, $0
/* 04ACE4 0014ABE4 289EE070 */  paddub      $19, $7, $0
/* 04ACE8 0014ABE8 288E0071 */  paddub      $17, $8, $0
/* 04ACEC 0014ABEC 28862071 */  paddub      $16, $9, $0
/* 04ACF0 0014ABF0 1001A427 */  addiu       $4, $29, 0x110
/* 04ACF4 0014ABF4 282E4072 */  paddub      $5, $18, $0
/* 04ACF8 0014ABF8 0C86040C */  jal         sceVu0CopyVector
/* 04ACFC 0014ABFC 00000000 */   nop
/* 04AD00 0014AC00 2001A427 */  addiu       $4, $29, 0x120
/* 04AD04 0014AC04 282E4072 */  paddub      $5, $18, $0
/* 04AD08 0014AC08 0C86040C */  jal         sceVu0CopyVector
/* 04AD0C 0014AC0C 00000000 */   nop
/* 04AD10 0014AC10 2401A0C7 */  lwc1        $f0, 0x124($29)
/* 04AD14 0014AC14 01001446 */  sub.s       $f0, $f0, $f20
/* 04AD18 0014AC18 2401A0E7 */  swc1        $f0, 0x124($29)
/* 04AD1C 0014AC1C 0000B0FF */  sd          $16, 0x0($29)
/* 04AD20 0014AC20 28266072 */  paddub      $4, $19, $0
/* 04AD24 0014AC24 282E2072 */  paddub      $5, $17, $0
/* 04AD28 0014AC28 1001A627 */  addiu       $6, $29, 0x110
/* 04AD2C 0014AC2C 2001A727 */  addiu       $7, $29, 0x120
/* 04AD30 0014AC30 20000824 */  addiu       $8, $0, 0x20
/* 04AD34 0014AC34 9000A927 */  addiu       $9, $29, 0x90
/* 04AD38 0014AC38 3001AA27 */  addiu       $10, $29, 0x130
/* 04AD3C 0014AC3C 01000B24 */  addiu       $11, $0, 0x1
/* 04AD40 0014AC40 8C28050C */  jal         CheckHits__FP6CCPolyiPfPfiPiPA4_fii
/* 04AD44 0014AC44 00000000 */   nop
/* 04AD48 0014AC48 28864070 */  paddub      $16, $2, $0
/* 04AD4C 0014AC4C 3005A0A7 */  sh          $0, 0x530($29)
/* 04AD50 0014AC50 3205B127 */  addiu       $17, $29, 0x532
/* 04AD54 0014AC54 000020A6 */  sh          $0, 0x0($17)
/* 04AD58 0014AC58 3405B227 */  addiu       $18, $29, 0x534
/* 04AD5C 0014AC5C 000040A6 */  sh          $0, 0x0($18)
/* 04AD60 0014AC60 3005A227 */  addiu       $2, $29, 0x530
/* 04AD64 0014AC64 4005A327 */  addiu       $3, $29, 0x540
/* 04AD68 0014AC68 00004278 */  lq          $2, 0x0($2)
/* 04AD6C 0014AC6C 0000627C */  sq          $2, 0x0($3)
/* 04AD70 0014AC70 1300001A */  blez        $16, .L0014ACC0
/* 04AD74 0014AC74 00000000 */   nop
/* 04AD78 0014AC78 9000A38F */  lw          $3, 0x90($29)
/* 04AD7C 0014AC7C 80100300 */  sll         $2, $3, 2
/* 04AD80 0014AC80 21104300 */  addu        $2, $2, $3
/* 04AD84 0014AC84 00110200 */  sll         $2, $2, 4
/* 04AD88 0014AC88 21286202 */  addu        $5, $19, $2
/* 04AD8C 0014AC8C 05000324 */  addiu       $3, $0, 0x5
/* 04AD90 0014AC90 2826A072 */  paddub      $4, $21, $0
.L0014AC94:
/* 04AD94 0014AC94 0000A278 */  lq          $2, 0x0($5)
/* 04AD98 0014AC98 1000A524 */  addiu       $5, $5, 0x10
/* 04AD9C 0014AC9C FFFF6324 */  addiu       $3, $3, -0x1
/* 04ADA0 0014ACA0 0000827C */  sq          $2, 0x0($4)
/* 04ADA4 0014ACA4 10008424 */  addiu       $4, $4, 0x10
/* 04ADA8 0014ACA8 FAFF601C */  bgtz        $3, .L0014AC94
/* 04ADAC 0014ACAC 00000000 */   nop
/* 04ADB0 0014ACB0 28268072 */  paddub      $4, $20, $0
/* 04ADB4 0014ACB4 3001A527 */  addiu       $5, $29, 0x130
/* 04ADB8 0014ACB8 0C86040C */  jal         sceVu0CopyVector
/* 04ADBC 0014ACBC 00000000 */   nop
.L0014ACC0:
/* 04ADC0 0014ACC0 28260070 */  paddub      $4, $0, $0
/* 04ADC4 0014ACC4 19000010 */  b           .L0014AD2C
/* 04ADC8 0014ACC8 00000000 */   nop
.L0014ACCC:
/* 04ADCC 0014ACCC 80100400 */  sll         $2, $4, 2
/* 04ADD0 0014ACD0 21105D00 */  addu        $2, $2, $29
/* 04ADD4 0014ACD4 9000438C */  lw          $3, 0x90($2)
/* 04ADD8 0014ACD8 80100300 */  sll         $2, $3, 2
/* 04ADDC 0014ACDC 21104300 */  addu        $2, $2, $3
/* 04ADE0 0014ACE0 00110200 */  sll         $2, $2, 4
/* 04ADE4 0014ACE4 21106202 */  addu        $2, $19, $2
/* 04ADE8 0014ACE8 40004324 */  addiu       $3, $2, 0x40
/* 04ADEC 0014ACEC 3005A287 */  lh          $2, 0x530($29)
/* 04ADF0 0014ACF0 03004014 */  bnez        $2, .L0014AD00
/* 04ADF4 0014ACF4 00000000 */   nop
/* 04ADF8 0014ACF8 00006284 */  lh          $2, 0x0($3)
/* 04ADFC 0014ACFC 3005A2A7 */  sh          $2, 0x530($29)
.L0014AD00:
/* 04AE00 0014AD00 00002286 */  lh          $2, 0x0($17)
/* 04AE04 0014AD04 03004014 */  bnez        $2, .L0014AD14
/* 04AE08 0014AD08 00000000 */   nop
/* 04AE0C 0014AD0C 02006284 */  lh          $2, 0x2($3)
/* 04AE10 0014AD10 000022A6 */  sh          $2, 0x0($17)
.L0014AD14:
/* 04AE14 0014AD14 00004286 */  lh          $2, 0x0($18)
/* 04AE18 0014AD18 03004014 */  bnez        $2, .L0014AD28
/* 04AE1C 0014AD1C 00000000 */   nop
/* 04AE20 0014AD20 04006284 */  lh          $2, 0x4($3)
/* 04AE24 0014AD24 000042A6 */  sh          $2, 0x0($18)
.L0014AD28:
/* 04AE28 0014AD28 01008424 */  addiu       $4, $4, 0x1
.L0014AD2C:
/* 04AE2C 0014AD2C 2A109000 */  slt         $2, $4, $16
/* 04AE30 0014AD30 E6FF4014 */  bnez        $2, .L0014ACCC
/* 04AE34 0014AD34 00000000 */   nop
/* 04AE38 0014AD38 3005A227 */  addiu       $2, $29, 0x530
/* 04AE3C 0014AD3C 000043C4 */  lwc1        $f3, 0x0($2)
/* 04AE40 0014AD40 040042C4 */  lwc1        $f2, 0x4($2)
/* 04AE44 0014AD44 080041C4 */  lwc1        $f1, 0x8($2)
/* 04AE48 0014AD48 0C0040C4 */  lwc1        $f0, 0xC($2)
/* 04AE4C 0014AD4C 4000A3E6 */  swc1        $f3, 0x40($21)
/* 04AE50 0014AD50 4400A2E6 */  swc1        $f2, 0x44($21)
/* 04AE54 0014AD54 4800A1E6 */  swc1        $f1, 0x48($21)
/* 04AE58 0014AD58 4C00A0E6 */  swc1        $f0, 0x4C($21)
/* 04AE5C 0014AD5C 2A101000 */  slt         $2, $0, $16
/* 04AE60 0014AD60 8000BF7B */  lq          $31, 0x80($29)
/* 04AE64 0014AD64 7000B57B */  lq          $21, 0x70($29)
/* 04AE68 0014AD68 6000B47B */  lq          $20, 0x60($29)
/* 04AE6C 0014AD6C 5000B37B */  lq          $19, 0x50($29)
/* 04AE70 0014AD70 4000B27B */  lq          $18, 0x40($29)
/* 04AE74 0014AD74 3000B17B */  lq          $17, 0x30($29)
/* 04AE78 0014AD78 2000B07B */  lq          $16, 0x20($29)
/* 04AE7C 0014AD7C 1000B4C7 */  lwc1        $f20, 0x10($29)
/* 04AE80 0014AD80 5005BD27 */  addiu       $29, $29, 0x550
/* 04AE84 0014AD84 0800E003 */  jr          $31
/* 04AE88 0014AD88 00000000 */   nop
/* 04AE8C 0014AD8C 00000000 */  nop
