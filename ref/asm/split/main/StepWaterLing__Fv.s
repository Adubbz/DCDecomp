.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel StepWaterLing__Fv
/* 0AFE60 001AFD60 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0AFE64 001AFD64 2000BF7F */  sq          $31, 0x20($29)
/* 0AFE68 001AFD68 1000B17F */  sq          $17, 0x10($29)
/* 0AFE6C 001AFD6C 0000B07F */  sq          $16, 0x0($29)
/* 0AFE70 001AFD70 D501013C */  lui         $1, %hi(CheckWaterInfo + 0x20)
/* 0AFE74 001AFD74 F064238C */  lw          $3, %lo(CheckWaterInfo + 0x20)($1)
/* 0AFE78 001AFD78 27006010 */  beqz        $3, .L001AFE18
/* 0AFE7C 001AFD7C 00000000 */   nop
/* 0AFE80 001AFD80 9493838F */  lw          $3, -0x6C6C($28)
/* 0AFE84 001AFD84 01006324 */  addiu       $3, $3, 0x1
/* 0AFE88 001AFD88 949383AF */  sw          $3, -0x6C6C($28)
/* 0AFE8C 001AFD8C 9493838F */  lw          $3, -0x6C6C($28)
/* 0AFE90 001AFD90 14006328 */  slti        $3, $3, 0x14
/* 0AFE94 001AFD94 20006014 */  bnez        $3, .L001AFE18
/* 0AFE98 001AFD98 00000000 */   nop
/* 0AFE9C 001AFD9C 949380AF */  sw          $0, -0x6C6C($28)
/* 0AFEA0 001AFDA0 28260070 */  paddub      $4, $0, $0
/* 0AFEA4 001AFDA4 19000010 */  b           .L001AFE0C
/* 0AFEA8 001AFDA8 00000000 */   nop
.L001AFDAC:
/* 0AFEAC 001AFDAC 40810400 */  sll         $16, $4, 5
/* 0AFEB0 001AFDB0 D501033C */  lui         $3, %hi(WaterWaveLing + 0x14)
/* 0AFEB4 001AFDB4 14656324 */  addiu       $3, $3, %lo(WaterWaveLing + 0x14)
/* 0AFEB8 001AFDB8 21887000 */  addu        $17, $3, $16
/* 0AFEBC 001AFDBC 0000238E */  lw          $3, 0x0($17)
/* 0AFEC0 001AFDC0 11006014 */  bnez        $3, .L001AFE08
/* 0AFEC4 001AFDC4 00000000 */   nop
/* 0AFEC8 001AFDC8 D501023C */  lui         $2, %hi(WaterWaveLing)
/* 0AFECC 001AFDCC 00654224 */  addiu       $2, $2, %lo(WaterWaveLing)
/* 0AFED0 001AFDD0 21205000 */  addu        $4, $2, $16
/* 0AFED4 001AFDD4 D501023C */  lui         $2, %hi(CheckWaterInfo + 0x10)
/* 0AFED8 001AFDD8 E0644524 */  addiu       $5, $2, %lo(CheckWaterInfo + 0x10)
/* 0AFEDC 001AFDDC 0C86040C */  jal         sceVu0CopyVector
/* 0AFEE0 001AFDE0 00000000 */   nop
/* 0AFEE4 001AFDE4 0040043C */  lui         $4, (0x40000000 >> 16)
/* 0AFEE8 001AFDE8 D501033C */  lui         $3, %hi(WaterWaveLing + 0x10)
/* 0AFEEC 001AFDEC 10656324 */  addiu       $3, $3, %lo(WaterWaveLing + 0x10)
/* 0AFEF0 001AFDF0 21187000 */  addu        $3, $3, $16
/* 0AFEF4 001AFDF4 000064AC */  sw          $4, 0x0($3)
/* 0AFEF8 001AFDF8 2D000324 */  addiu       $3, $0, 0x2D
/* 0AFEFC 001AFDFC 000023AE */  sw          $3, 0x0($17)
/* 0AFF00 001AFE00 05000010 */  b           .L001AFE18
/* 0AFF04 001AFE04 00000000 */   nop
.L001AFE08:
/* 0AFF08 001AFE08 01008424 */  addiu       $4, $4, 0x1
.L001AFE0C:
/* 0AFF0C 001AFE0C 06008328 */  slti        $3, $4, 0x6
/* 0AFF10 001AFE10 E6FF6014 */  bnez        $3, .L001AFDAC
/* 0AFF14 001AFE14 00000000 */   nop
.L001AFE18:
/* 0AFF18 001AFE18 28260070 */  paddub      $4, $0, $0
/* 0AFF1C 001AFE1C 13000010 */  b           .L001AFE6C
/* 0AFF20 001AFE20 00000000 */   nop
.L001AFE24:
/* 0AFF24 001AFE24 40290400 */  sll         $5, $4, 5
/* 0AFF28 001AFE28 D501033C */  lui         $3, %hi(WaterWaveLing + 0x14)
/* 0AFF2C 001AFE2C 14656324 */  addiu       $3, $3, %lo(WaterWaveLing + 0x14)
/* 0AFF30 001AFE30 21306500 */  addu        $6, $3, $5
/* 0AFF34 001AFE34 0000C38C */  lw          $3, 0x0($6)
/* 0AFF38 001AFE38 0B006018 */  blez        $3, .L001AFE68
/* 0AFF3C 001AFE3C 00000000 */   nop
/* 0AFF40 001AFE40 D501033C */  lui         $3, %hi(WaterWaveLing + 0x10)
/* 0AFF44 001AFE44 10656324 */  addiu       $3, $3, %lo(WaterWaveLing + 0x10)
/* 0AFF48 001AFE48 21186500 */  addu        $3, $3, $5
/* 0AFF4C 001AFE4C 000061C4 */  lwc1        $f1, 0x0($3)
/* 0AFF50 001AFE50 1C8580C7 */  lwc1        $f0, -0x7AE4($28)
/* 0AFF54 001AFE54 00080046 */  add.s       $f0, $f1, $f0
/* 0AFF58 001AFE58 000060E4 */  swc1        $f0, 0x0($3)
/* 0AFF5C 001AFE5C 0000C38C */  lw          $3, 0x0($6)
/* 0AFF60 001AFE60 FFFF6324 */  addiu       $3, $3, -0x1
/* 0AFF64 001AFE64 0000C3AC */  sw          $3, 0x0($6)
.L001AFE68:
/* 0AFF68 001AFE68 01008424 */  addiu       $4, $4, 0x1
.L001AFE6C:
/* 0AFF6C 001AFE6C 06008328 */  slti        $3, $4, 0x6
/* 0AFF70 001AFE70 ECFF6014 */  bnez        $3, .L001AFE24
/* 0AFF74 001AFE74 00000000 */   nop
/* 0AFF78 001AFE78 2000BF7B */  lq          $31, 0x20($29)
/* 0AFF7C 001AFE7C 1000B17B */  lq          $17, 0x10($29)
/* 0AFF80 001AFE80 0000B07B */  lq          $16, 0x0($29)
/* 0AFF84 001AFE84 3000BD27 */  addiu       $29, $29, 0x30
/* 0AFF88 001AFE88 0800E003 */  jr          $31
/* 0AFF8C 001AFE8C 00000000 */   nop
