.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StepWaterLing__Fv
/* AFE60 001AFD60 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* AFE64 001AFD64 2000BF7F */  sq         $31, 0x20($sp)
/* AFE68 001AFD68 1000B17F */  sq         $17, 0x10($sp)
/* AFE6C 001AFD6C 0000B07F */  sq         $16, 0x0($sp)
/* AFE70 001AFD70 D501013C */  lui        $at, (0x1D564F0 >> 16)
/* AFE74 001AFD74 F064238C */  lw         $3, (0x1D564F0 & 0xFFFF)($at)
/* AFE78 001AFD78 27006010 */  beqz       $3, .L001AFE18
/* AFE7C 001AFD7C 00000000 */   nop
/* AFE80 001AFD80 9493838F */  lw         $3, -0x6C6C($gp)
/* AFE84 001AFD84 01006324 */  addiu      $3, $3, 0x1
/* AFE88 001AFD88 949383AF */  sw         $3, -0x6C6C($gp)
/* AFE8C 001AFD8C 9493838F */  lw         $3, -0x6C6C($gp)
/* AFE90 001AFD90 14006328 */  slti       $3, $3, 0x14
/* AFE94 001AFD94 20006014 */  bnez       $3, .L001AFE18
/* AFE98 001AFD98 00000000 */   nop
/* AFE9C 001AFD9C 949380AF */  sw         $0, -0x6C6C($gp)
/* AFEA0 001AFDA0 28260070 */  paddub     $4, $0, $0
/* AFEA4 001AFDA4 19000010 */  b          .L001AFE0C
/* AFEA8 001AFDA8 00000000 */   nop
.L001AFDAC:
/* AFEAC 001AFDAC 40810400 */  sll        $16, $4, 5
/* AFEB0 001AFDB0 D501033C */  lui        $3, %hi(D_1D56514)
/* AFEB4 001AFDB4 14656324 */  addiu      $3, $3, %lo(D_1D56514)
/* AFEB8 001AFDB8 21887000 */  addu       $17, $3, $16
/* AFEBC 001AFDBC 0000238E */  lw         $3, 0x0($17)
/* AFEC0 001AFDC0 11006014 */  bnez       $3, .L001AFE08
/* AFEC4 001AFDC4 00000000 */   nop
/* AFEC8 001AFDC8 D501023C */  lui        $2, %hi(WaterWaveLing)
/* AFECC 001AFDCC 00654224 */  addiu      $2, $2, %lo(WaterWaveLing)
/* AFED0 001AFDD0 21205000 */  addu       $4, $2, $16
/* AFED4 001AFDD4 D501023C */  lui        $2, %hi(D_1D564E0)
/* AFED8 001AFDD8 E0644524 */  addiu      $5, $2, %lo(D_1D564E0)
/* AFEDC 001AFDDC 0C86040C */  jal        sceVu0CopyVector
/* AFEE0 001AFDE0 00000000 */   nop
/* AFEE4 001AFDE4 0040043C */  lui        $4, %hi(D_40000001)
/* AFEE8 001AFDE8 D501033C */  lui        $3, %hi(D_1D56510)
/* AFEEC 001AFDEC 10656324 */  addiu      $3, $3, %lo(D_1D56510)
/* AFEF0 001AFDF0 21187000 */  addu       $3, $3, $16
/* AFEF4 001AFDF4 000064AC */  sw         $4, 0x0($3)
/* AFEF8 001AFDF8 2D000324 */  addiu      $3, $0, 0x2D
/* AFEFC 001AFDFC 000023AE */  sw         $3, 0x0($17)
/* AFF00 001AFE00 05000010 */  b          .L001AFE18
/* AFF04 001AFE04 00000000 */   nop
.L001AFE08:
/* AFF08 001AFE08 01008424 */  addiu      $4, $4, %lo(D_40000001)
.L001AFE0C:
/* AFF0C 001AFE0C 06008328 */  slti       $3, $4, 0x6
/* AFF10 001AFE10 E6FF6014 */  bnez       $3, .L001AFDAC
/* AFF14 001AFE14 00000000 */   nop
.L001AFE18:
/* AFF18 001AFE18 28260070 */  paddub     $4, $0, $0
/* AFF1C 001AFE1C 13000010 */  b          .L001AFE6C
/* AFF20 001AFE20 00000000 */   nop
.L001AFE24:
/* AFF24 001AFE24 40290400 */  sll        $5, $4, 5
/* AFF28 001AFE28 D501033C */  lui        $3, %hi(D_1D56514)
/* AFF2C 001AFE2C 14656324 */  addiu      $3, $3, %lo(D_1D56514)
/* AFF30 001AFE30 21306500 */  addu       $6, $3, $5
/* AFF34 001AFE34 0000C38C */  lw         $3, 0x0($6)
/* AFF38 001AFE38 0B006018 */  blez       $3, .L001AFE68
/* AFF3C 001AFE3C 00000000 */   nop
/* AFF40 001AFE40 D501033C */  lui        $3, %hi(D_1D56510)
/* AFF44 001AFE44 10656324 */  addiu      $3, $3, %lo(D_1D56510)
/* AFF48 001AFE48 21186500 */  addu       $3, $3, $5
/* AFF4C 001AFE4C 000061C4 */  lwc1       $f1, 0x0($3)
/* AFF50 001AFE50 1C8580C7 */  lwc1       $f0, -0x7AE4($gp)
/* AFF54 001AFE54 00080046 */  add.s      $f0, $f1, $f0
/* AFF58 001AFE58 000060E4 */  swc1       $f0, 0x0($3)
/* AFF5C 001AFE5C 0000C38C */  lw         $3, 0x0($6)
/* AFF60 001AFE60 FFFF6324 */  addiu      $3, $3, -0x1
/* AFF64 001AFE64 0000C3AC */  sw         $3, 0x0($6)
.L001AFE68:
/* AFF68 001AFE68 01008424 */  addiu      $4, $4, 0x1
.L001AFE6C:
/* AFF6C 001AFE6C 06008328 */  slti       $3, $4, 0x6
/* AFF70 001AFE70 ECFF6014 */  bnez       $3, .L001AFE24
/* AFF74 001AFE74 00000000 */   nop
/* AFF78 001AFE78 2000BF7B */  lq         $31, 0x20($sp)
/* AFF7C 001AFE7C 1000B17B */  lq         $17, 0x10($sp)
/* AFF80 001AFE80 0000B07B */  lq         $16, 0x0($sp)
/* AFF84 001AFE84 3000BD27 */  addiu      $sp, $sp, 0x30
/* AFF88 001AFE88 0800E003 */  jr         $31
/* AFF8C 001AFE8C 00000000 */   nop
