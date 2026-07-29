.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetEventPoly__FPfPfP6CCPolyPiPfP6CCPolyii
/* 04AE90 0014AD90 B0FCBD27 */  addiu       $29, $29, -0x350
/* 04AE94 0014AD94 9000BF7F */  sq          $31, 0x90($29)
/* 04AE98 0014AD98 8000B77F */  sq          $23, 0x80($29)
/* 04AE9C 0014AD9C 7000B67F */  sq          $22, 0x70($29)
/* 04AEA0 0014ADA0 6000B57F */  sq          $21, 0x60($29)
/* 04AEA4 0014ADA4 5000B47F */  sq          $20, 0x50($29)
/* 04AEA8 0014ADA8 4000B37F */  sq          $19, 0x40($29)
/* 04AEAC 0014ADAC 3000B27F */  sq          $18, 0x30($29)
/* 04AEB0 0014ADB0 2000B17F */  sq          $17, 0x20($29)
/* 04AEB4 0014ADB4 1000B07F */  sq          $16, 0x10($29)
/* 04AEB8 0014ADB8 28B68070 */  paddub      $22, $4, $0
/* 04AEBC 0014ADBC 28AEA070 */  paddub      $21, $5, $0
/* 04AEC0 0014ADC0 28A6C070 */  paddub      $20, $6, $0
/* 04AEC4 0014ADC4 289EE070 */  paddub      $19, $7, $0
/* 04AEC8 0014ADC8 28960071 */  paddub      $18, $8, $0
/* 04AECC 0014ADCC 288E2071 */  paddub      $17, $9, $0
/* 04AED0 0014ADD0 28864071 */  paddub      $16, $10, $0
/* 04AED4 0014ADD4 28BE6071 */  paddub      $23, $11, $0
/* 04AED8 0014ADD8 2001A427 */  addiu       $4, $29, 0x120
/* 04AEDC 0014ADDC 282EC072 */  paddub      $5, $22, $0
/* 04AEE0 0014ADE0 0C86040C */  jal         sceVu0CopyVector
/* 04AEE4 0014ADE4 00000000 */   nop
/* 04AEE8 0014ADE8 3001A427 */  addiu       $4, $29, 0x130
/* 04AEEC 0014ADEC 282EC072 */  paddub      $5, $22, $0
/* 04AEF0 0014ADF0 2836A072 */  paddub      $6, $21, $0
/* 04AEF4 0014ADF4 E885040C */  jal         sceVu0AddVector
/* 04AEF8 0014ADF8 00000000 */   nop
/* 04AEFC 0014ADFC 0000B7FF */  sd          $23, 0x0($29)
/* 04AF00 0014AE00 28262072 */  paddub      $4, $17, $0
/* 04AF04 0014AE04 282E0072 */  paddub      $5, $16, $0
/* 04AF08 0014AE08 2001A627 */  addiu       $6, $29, 0x120
/* 04AF0C 0014AE0C 3001A727 */  addiu       $7, $29, 0x130
/* 04AF10 0014AE10 20000824 */  addiu       $8, $0, 0x20
/* 04AF14 0014AE14 A000A927 */  addiu       $9, $29, 0xA0
/* 04AF18 0014AE18 4001AA27 */  addiu       $10, $29, 0x140
/* 04AF1C 0014AE1C 01000B24 */  addiu       $11, $0, 0x1
/* 04AF20 0014AE20 8C28050C */  jal         CheckHits__FP6CCPolyiPfPfiPiPA4_fii
/* 04AF24 0014AE24 00000000 */   nop
/* 04AF28 0014AE28 28864070 */  paddub      $16, $2, $0
/* 04AF2C 0014AE2C 4003A0A7 */  sh          $0, 0x340($29)
/* 04AF30 0014AE30 4203B527 */  addiu       $21, $29, 0x342
/* 04AF34 0014AE34 0000A0A6 */  sh          $0, 0x0($21)
/* 04AF38 0014AE38 4403B627 */  addiu       $22, $29, 0x344
/* 04AF3C 0014AE3C 0000C0A6 */  sh          $0, 0x0($22)
/* 04AF40 0014AE40 FFFF0224 */  addiu       $2, $0, -0x1
/* 04AF44 0014AE44 000062AE */  sw          $2, 0x0($19)
/* 04AF48 0014AE48 1500001A */  blez        $16, .L0014AEA0
/* 04AF4C 0014AE4C 00000000 */   nop
/* 04AF50 0014AE50 A000A38F */  lw          $3, 0xA0($29)
/* 04AF54 0014AE54 80100300 */  sll         $2, $3, 2
/* 04AF58 0014AE58 21104300 */  addu        $2, $2, $3
/* 04AF5C 0014AE5C 00110200 */  sll         $2, $2, 4
/* 04AF60 0014AE60 21282202 */  addu        $5, $17, $2
/* 04AF64 0014AE64 05000324 */  addiu       $3, $0, 0x5
/* 04AF68 0014AE68 28268072 */  paddub      $4, $20, $0
.L0014AE6C:
/* 04AF6C 0014AE6C 0000A278 */  lq          $2, 0x0($5)
/* 04AF70 0014AE70 1000A524 */  addiu       $5, $5, 0x10
/* 04AF74 0014AE74 FFFF6324 */  addiu       $3, $3, -0x1
/* 04AF78 0014AE78 0000827C */  sq          $2, 0x0($4)
/* 04AF7C 0014AE7C 10008424 */  addiu       $4, $4, 0x10
/* 04AF80 0014AE80 FAFF601C */  bgtz        $3, .L0014AE6C
/* 04AF84 0014AE84 00000000 */   nop
/* 04AF88 0014AE88 A000A28F */  lw          $2, 0xA0($29)
/* 04AF8C 0014AE8C 000062AE */  sw          $2, 0x0($19)
/* 04AF90 0014AE90 28264072 */  paddub      $4, $18, $0
/* 04AF94 0014AE94 4001A527 */  addiu       $5, $29, 0x140
/* 04AF98 0014AE98 0C86040C */  jal         sceVu0CopyVector
/* 04AF9C 0014AE9C 00000000 */   nop
.L0014AEA0:
/* 04AFA0 0014AEA0 28260070 */  paddub      $4, $0, $0
/* 04AFA4 0014AEA4 19000010 */  b           .L0014AF0C
/* 04AFA8 0014AEA8 00000000 */   nop
.L0014AEAC:
/* 04AFAC 0014AEAC 80100400 */  sll         $2, $4, 2
/* 04AFB0 0014AEB0 21105D00 */  addu        $2, $2, $29
/* 04AFB4 0014AEB4 A000438C */  lw          $3, 0xA0($2)
/* 04AFB8 0014AEB8 80100300 */  sll         $2, $3, 2
/* 04AFBC 0014AEBC 21104300 */  addu        $2, $2, $3
/* 04AFC0 0014AEC0 00110200 */  sll         $2, $2, 4
/* 04AFC4 0014AEC4 21102202 */  addu        $2, $17, $2
/* 04AFC8 0014AEC8 40004324 */  addiu       $3, $2, 0x40
/* 04AFCC 0014AECC 4003A287 */  lh          $2, 0x340($29)
/* 04AFD0 0014AED0 03004014 */  bnez        $2, .L0014AEE0
/* 04AFD4 0014AED4 00000000 */   nop
/* 04AFD8 0014AED8 00006284 */  lh          $2, 0x0($3)
/* 04AFDC 0014AEDC 4003A2A7 */  sh          $2, 0x340($29)
.L0014AEE0:
/* 04AFE0 0014AEE0 0000A286 */  lh          $2, 0x0($21)
/* 04AFE4 0014AEE4 03004014 */  bnez        $2, .L0014AEF4
/* 04AFE8 0014AEE8 00000000 */   nop
/* 04AFEC 0014AEEC 02006284 */  lh          $2, 0x2($3)
/* 04AFF0 0014AEF0 0000A2A6 */  sh          $2, 0x0($21)
.L0014AEF4:
/* 04AFF4 0014AEF4 0000C286 */  lh          $2, 0x0($22)
/* 04AFF8 0014AEF8 03004014 */  bnez        $2, .L0014AF08
/* 04AFFC 0014AEFC 00000000 */   nop
/* 04B000 0014AF00 04006284 */  lh          $2, 0x4($3)
/* 04B004 0014AF04 0000C2A6 */  sh          $2, 0x0($22)
.L0014AF08:
/* 04B008 0014AF08 01008424 */  addiu       $4, $4, 0x1
.L0014AF0C:
/* 04B00C 0014AF0C 2A109000 */  slt         $2, $4, $16
/* 04B010 0014AF10 E6FF4014 */  bnez        $2, .L0014AEAC
/* 04B014 0014AF14 00000000 */   nop
/* 04B018 0014AF18 4003A227 */  addiu       $2, $29, 0x340
/* 04B01C 0014AF1C 000043C4 */  lwc1        $f3, 0x0($2)
/* 04B020 0014AF20 040042C4 */  lwc1        $f2, 0x4($2)
/* 04B024 0014AF24 080041C4 */  lwc1        $f1, 0x8($2)
/* 04B028 0014AF28 0C0040C4 */  lwc1        $f0, 0xC($2)
/* 04B02C 0014AF2C 400083E6 */  swc1        $f3, 0x40($20)
/* 04B030 0014AF30 440082E6 */  swc1        $f2, 0x44($20)
/* 04B034 0014AF34 480081E6 */  swc1        $f1, 0x48($20)
/* 04B038 0014AF38 4C0080E6 */  swc1        $f0, 0x4C($20)
/* 04B03C 0014AF3C 4003A287 */  lh          $2, 0x340($29)
/* 04B040 0014AF40 9000BF7B */  lq          $31, 0x90($29)
/* 04B044 0014AF44 8000B77B */  lq          $23, 0x80($29)
/* 04B048 0014AF48 7000B67B */  lq          $22, 0x70($29)
/* 04B04C 0014AF4C 6000B57B */  lq          $21, 0x60($29)
/* 04B050 0014AF50 5000B47B */  lq          $20, 0x50($29)
/* 04B054 0014AF54 4000B37B */  lq          $19, 0x40($29)
/* 04B058 0014AF58 3000B27B */  lq          $18, 0x30($29)
/* 04B05C 0014AF5C 2000B17B */  lq          $17, 0x20($29)
/* 04B060 0014AF60 1000B07B */  lq          $16, 0x10($29)
/* 04B064 0014AF64 5003BD27 */  addiu       $29, $29, 0x350
/* 04B068 0014AF68 0800E003 */  jr          $31
/* 04B06C 0014AF6C 00000000 */   nop
