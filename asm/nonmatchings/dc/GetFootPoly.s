.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetFootPoly__FPffP6CCPolyPfP6CCPolyii
/* 4ACB0 0014ABB0 B0FABD27 */  addiu      $sp, $sp, -0x550
/* 4ACB4 0014ABB4 8000BF7F */  sq         $31, 0x80($sp)
/* 4ACB8 0014ABB8 7000B57F */  sq         $21, 0x70($sp)
/* 4ACBC 0014ABBC 6000B47F */  sq         $20, 0x60($sp)
/* 4ACC0 0014ABC0 5000B37F */  sq         $19, 0x50($sp)
/* 4ACC4 0014ABC4 4000B27F */  sq         $18, 0x40($sp)
/* 4ACC8 0014ABC8 3000B17F */  sq         $17, 0x30($sp)
/* 4ACCC 0014ABCC 2000B07F */  sq         $16, 0x20($sp)
/* 4ACD0 0014ABD0 1000B4E7 */  swc1       $f20, 0x10($sp)
/* 4ACD4 0014ABD4 28968070 */  paddub     $18, $4, $0
/* 4ACD8 0014ABD8 06650046 */  mov.s      $f20, $f12
/* 4ACDC 0014ABDC 28AEA070 */  paddub     $21, $5, $0
/* 4ACE0 0014ABE0 28A6C070 */  paddub     $20, $6, $0
/* 4ACE4 0014ABE4 289EE070 */  paddub     $19, $7, $0
/* 4ACE8 0014ABE8 288E0071 */  paddub     $17, $8, $0
/* 4ACEC 0014ABEC 28862071 */  paddub     $16, $9, $0
/* 4ACF0 0014ABF0 1001A427 */  addiu      $4, $sp, 0x110
/* 4ACF4 0014ABF4 282E4072 */  paddub     $5, $18, $0
/* 4ACF8 0014ABF8 0C86040C */  jal        sceVu0CopyVector
/* 4ACFC 0014ABFC 00000000 */   nop
/* 4AD00 0014AC00 2001A427 */  addiu      $4, $sp, 0x120
/* 4AD04 0014AC04 282E4072 */  paddub     $5, $18, $0
/* 4AD08 0014AC08 0C86040C */  jal        sceVu0CopyVector
/* 4AD0C 0014AC0C 00000000 */   nop
/* 4AD10 0014AC10 2401A0C7 */  lwc1       $f0, 0x124($sp)
/* 4AD14 0014AC14 01001446 */  sub.s      $f0, $f0, $f20
/* 4AD18 0014AC18 2401A0E7 */  swc1       $f0, 0x124($sp)
/* 4AD1C 0014AC1C 0000B0FF */  sd         $16, 0x0($sp)
/* 4AD20 0014AC20 28266072 */  paddub     $4, $19, $0
/* 4AD24 0014AC24 282E2072 */  paddub     $5, $17, $0
/* 4AD28 0014AC28 1001A627 */  addiu      $6, $sp, 0x110
/* 4AD2C 0014AC2C 2001A727 */  addiu      $7, $sp, 0x120
/* 4AD30 0014AC30 20000824 */  addiu      $8, $0, 0x20
/* 4AD34 0014AC34 9000A927 */  addiu      $9, $sp, 0x90
/* 4AD38 0014AC38 3001AA27 */  addiu      $10, $sp, 0x130
/* 4AD3C 0014AC3C 01000B24 */  addiu      $11, $0, 0x1
/* 4AD40 0014AC40 8C28050C */  jal        CheckHits__FP6CCPolyiPfPfiPiPA4_fii
/* 4AD44 0014AC44 00000000 */   nop
/* 4AD48 0014AC48 28864070 */  paddub     $16, $2, $0
/* 4AD4C 0014AC4C 3005A0A7 */  sh         $0, 0x530($sp)
/* 4AD50 0014AC50 3205B127 */  addiu      $17, $sp, 0x532
/* 4AD54 0014AC54 000020A6 */  sh         $0, 0x0($17)
/* 4AD58 0014AC58 3405B227 */  addiu      $18, $sp, 0x534
/* 4AD5C 0014AC5C 000040A6 */  sh         $0, 0x0($18)
/* 4AD60 0014AC60 3005A227 */  addiu      $2, $sp, 0x530
/* 4AD64 0014AC64 4005A327 */  addiu      $3, $sp, 0x540
/* 4AD68 0014AC68 00004278 */  lq         $2, 0x0($2)
/* 4AD6C 0014AC6C 0000627C */  sq         $2, 0x0($3)
/* 4AD70 0014AC70 1300001A */  blez       $16, .L0014ACC0
/* 4AD74 0014AC74 00000000 */   nop
/* 4AD78 0014AC78 9000A38F */  lw         $3, 0x90($sp)
/* 4AD7C 0014AC7C 80100300 */  sll        $2, $3, 2
/* 4AD80 0014AC80 21104300 */  addu       $2, $2, $3
/* 4AD84 0014AC84 00110200 */  sll        $2, $2, 4
/* 4AD88 0014AC88 21286202 */  addu       $5, $19, $2
/* 4AD8C 0014AC8C 05000324 */  addiu      $3, $0, 0x5
/* 4AD90 0014AC90 2826A072 */  paddub     $4, $21, $0
.L0014AC94:
/* 4AD94 0014AC94 0000A278 */  lq         $2, 0x0($5)
/* 4AD98 0014AC98 1000A524 */  addiu      $5, $5, 0x10
/* 4AD9C 0014AC9C FFFF6324 */  addiu      $3, $3, -0x1
/* 4ADA0 0014ACA0 0000827C */  sq         $2, 0x0($4)
/* 4ADA4 0014ACA4 10008424 */  addiu      $4, $4, 0x10
/* 4ADA8 0014ACA8 FAFF601C */  bgtz       $3, .L0014AC94
/* 4ADAC 0014ACAC 00000000 */   nop
/* 4ADB0 0014ACB0 28268072 */  paddub     $4, $20, $0
/* 4ADB4 0014ACB4 3001A527 */  addiu      $5, $sp, 0x130
/* 4ADB8 0014ACB8 0C86040C */  jal        sceVu0CopyVector
/* 4ADBC 0014ACBC 00000000 */   nop
.L0014ACC0:
/* 4ADC0 0014ACC0 28260070 */  paddub     $4, $0, $0
/* 4ADC4 0014ACC4 19000010 */  b          .L0014AD2C
/* 4ADC8 0014ACC8 00000000 */   nop
.L0014ACCC:
/* 4ADCC 0014ACCC 80100400 */  sll        $2, $4, 2
/* 4ADD0 0014ACD0 21105D00 */  addu       $2, $2, $sp
/* 4ADD4 0014ACD4 9000438C */  lw         $3, 0x90($2)
/* 4ADD8 0014ACD8 80100300 */  sll        $2, $3, 2
/* 4ADDC 0014ACDC 21104300 */  addu       $2, $2, $3
/* 4ADE0 0014ACE0 00110200 */  sll        $2, $2, 4
/* 4ADE4 0014ACE4 21106202 */  addu       $2, $19, $2
/* 4ADE8 0014ACE8 40004324 */  addiu      $3, $2, 0x40
/* 4ADEC 0014ACEC 3005A287 */  lh         $2, 0x530($sp)
/* 4ADF0 0014ACF0 03004014 */  bnez       $2, .L0014AD00
/* 4ADF4 0014ACF4 00000000 */   nop
/* 4ADF8 0014ACF8 00006284 */  lh         $2, 0x0($3)
/* 4ADFC 0014ACFC 3005A2A7 */  sh         $2, 0x530($sp)
.L0014AD00:
/* 4AE00 0014AD00 00002286 */  lh         $2, 0x0($17)
/* 4AE04 0014AD04 03004014 */  bnez       $2, .L0014AD14
/* 4AE08 0014AD08 00000000 */   nop
/* 4AE0C 0014AD0C 02006284 */  lh         $2, 0x2($3)
/* 4AE10 0014AD10 000022A6 */  sh         $2, 0x0($17)
.L0014AD14:
/* 4AE14 0014AD14 00004286 */  lh         $2, 0x0($18)
/* 4AE18 0014AD18 03004014 */  bnez       $2, .L0014AD28
/* 4AE1C 0014AD1C 00000000 */   nop
/* 4AE20 0014AD20 04006284 */  lh         $2, 0x4($3)
/* 4AE24 0014AD24 000042A6 */  sh         $2, 0x0($18)
.L0014AD28:
/* 4AE28 0014AD28 01008424 */  addiu      $4, $4, 0x1
.L0014AD2C:
/* 4AE2C 0014AD2C 2A109000 */  slt        $2, $4, $16
/* 4AE30 0014AD30 E6FF4014 */  bnez       $2, .L0014ACCC
/* 4AE34 0014AD34 00000000 */   nop
/* 4AE38 0014AD38 3005A227 */  addiu      $2, $sp, 0x530
/* 4AE3C 0014AD3C 000043C4 */  lwc1       $f3, 0x0($2)
/* 4AE40 0014AD40 040042C4 */  lwc1       $f2, 0x4($2)
/* 4AE44 0014AD44 080041C4 */  lwc1       $f1, 0x8($2)
/* 4AE48 0014AD48 0C0040C4 */  lwc1       $f0, 0xC($2)
/* 4AE4C 0014AD4C 4000A3E6 */  swc1       $f3, 0x40($21)
/* 4AE50 0014AD50 4400A2E6 */  swc1       $f2, 0x44($21)
/* 4AE54 0014AD54 4800A1E6 */  swc1       $f1, 0x48($21)
/* 4AE58 0014AD58 4C00A0E6 */  swc1       $f0, 0x4C($21)
/* 4AE5C 0014AD5C 2A101000 */  slt        $2, $0, $16
/* 4AE60 0014AD60 8000BF7B */  lq         $31, 0x80($sp)
/* 4AE64 0014AD64 7000B57B */  lq         $21, 0x70($sp)
/* 4AE68 0014AD68 6000B47B */  lq         $20, 0x60($sp)
/* 4AE6C 0014AD6C 5000B37B */  lq         $19, 0x50($sp)
/* 4AE70 0014AD70 4000B27B */  lq         $18, 0x40($sp)
/* 4AE74 0014AD74 3000B17B */  lq         $17, 0x30($sp)
/* 4AE78 0014AD78 2000B07B */  lq         $16, 0x20($sp)
/* 4AE7C 0014AD7C 1000B4C7 */  lwc1       $f20, 0x10($sp)
/* 4AE80 0014AD80 5005BD27 */  addiu      $sp, $sp, 0x550
/* 4AE84 0014AD84 0800E003 */  jr         $31
/* 4AE88 0014AD88 00000000 */   nop
/* 4AE8C 0014AD8C 00000000 */  nop
