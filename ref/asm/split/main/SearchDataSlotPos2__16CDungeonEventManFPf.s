.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SearchDataSlotPos2__16CDungeonEventManFPf
/* 0CCEE0 001CCDE0 70FFBD27 */  addiu       $29, $29, -0x90
/* 0CCEE4 001CCDE4 6000BF7F */  sq          $31, 0x60($29)
/* 0CCEE8 001CCDE8 5000B47F */  sq          $20, 0x50($29)
/* 0CCEEC 001CCDEC 4000B37F */  sq          $19, 0x40($29)
/* 0CCEF0 001CCDF0 3000B27F */  sq          $18, 0x30($29)
/* 0CCEF4 001CCDF4 2000B17F */  sq          $17, 0x20($29)
/* 0CCEF8 001CCDF8 1000B07F */  sq          $16, 0x10($29)
/* 0CCEFC 001CCDFC 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0CCF00 001CCE00 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0CCF04 001CCE04 28968070 */  paddub      $18, $4, $0
/* 0CCF08 001CCE08 8000A427 */  addiu       $4, $29, 0x80
/* 0CCF0C 001CCE0C 0C86040C */  jal         sceVu0CopyVector
/* 0CCF10 001CCE10 00000000 */   nop
/* 0CCF14 001CCE14 8400A227 */  addiu       $2, $29, 0x84
/* 0CCF18 001CCE18 000054C4 */  lwc1        $f20, 0x0($2)
/* 0CCF1C 001CCE1C 000040AC */  sw          $0, 0x0($2)
/* 0CCF20 001CCE20 28860070 */  paddub      $16, $0, $0
/* 0CCF24 001CCE24 34000010 */  b           .L001CCEF8
/* 0CCF28 001CCE28 00000000 */   nop
.L001CCE2C:
/* 0CCF2C 001CCE2C 80A11000 */  sll         $20, $16, 6
/* 0CCF30 001CCE30 21985402 */  addu        $19, $18, $20
/* 0CCF34 001CCE34 00107126 */  addiu       $17, $19, 0x1000
/* 0CCF38 001CCE38 28262072 */  paddub      $4, $17, $0
/* 0CCF3C 001CCE3C 2032070C */  jal         CheckSwitch__17CDungeonEventDataFv
/* 0CCF40 001CCE40 00000000 */   nop
/* 0CCF44 001CCE44 2B004010 */  beqz        $2, .L001CCEF4
/* 0CCF48 001CCE48 00000000 */   nop
/* 0CCF4C 001CCE4C 7000A427 */  addiu       $4, $29, 0x70
/* 0CCF50 001CCE50 10106526 */  addiu       $5, $19, 0x1010
/* 0CCF54 001CCE54 0C86040C */  jal         sceVu0CopyVector
/* 0CCF58 001CCE58 00000000 */   nop
/* 0CCF5C 001CCE5C 7400A327 */  addiu       $3, $29, 0x74
/* 0CCF60 001CCE60 000060C4 */  lwc1        $f0, 0x0($3)
/* 0CCF64 001CCE64 41A00046 */  sub.s       $f1, $f20, $f0
/* 0CCF68 001CCE68 00008044 */  mtc1        $0, $f0
/* 0CCF6C 001CCE6C 00000000 */  nop
/* 0CCF70 001CCE70 34080046 */  c.lt.s      $f1, $f0
/* 0CCF74 001CCE74 00000000 */  nop
/* 0CCF78 001CCE78 04000045 */  bc1f        .L001CCE8C
/* 0CCF7C 001CCE7C 00000000 */   nop
/* 0CCF80 001CCE80 47080046 */  neg.s       $f1, $f1
/* 0CCF84 001CCE84 01000010 */  b           .L001CCE8C
/* 0CCF88 001CCE88 00000000 */   nop
.L001CCE8C:
/* 0CCF8C 001CCE8C 2042023C */  lui         $2, (0x42200000 >> 16)
/* 0CCF90 001CCE90 00008244 */  mtc1        $2, $f0
/* 0CCF94 001CCE94 00000000 */  nop
/* 0CCF98 001CCE98 34080046 */  c.lt.s      $f1, $f0
/* 0CCF9C 001CCE9C 00000000 */  nop
/* 0CCFA0 001CCEA0 14000045 */  bc1f        .L001CCEF4
/* 0CCFA4 001CCEA4 00000000 */   nop
/* 0CCFA8 001CCEA8 000060AC */  sw          $0, 0x0($3)
/* 0CCFAC 001CCEAC 21109202 */  addu        $2, $20, $18
/* 0CCFB0 001CCEB0 0010428C */  lw          $2, 0x1000($2)
/* 0CCFB4 001CCEB4 180055C4 */  lwc1        $f21, 0x18($2)
/* 0CCFB8 001CCEB8 7000A427 */  addiu       $4, $29, 0x70
/* 0CCFBC 001CCEBC 8000A527 */  addiu       $5, $29, 0x80
/* 0CCFC0 001CCEC0 648D040C */  jal         DistVector__FPfPf
/* 0CCFC4 001CCEC4 00000000 */   nop
/* 0CCFC8 001CCEC8 2041023C */  lui         $2, (0x41200000 >> 16)
/* 0CCFCC 001CCECC 00088244 */  mtc1        $2, $f1
/* 0CCFD0 001CCED0 00000000 */  nop
/* 0CCFD4 001CCED4 40081546 */  add.s       $f1, $f1, $f21
/* 0CCFD8 001CCED8 36000146 */  c.le.s      $f0, $f1
/* 0CCFDC 001CCEDC 00000000 */  nop
/* 0CCFE0 001CCEE0 04000045 */  bc1f        .L001CCEF4
/* 0CCFE4 001CCEE4 00000000 */   nop
/* 0CCFE8 001CCEE8 28162072 */  paddub      $2, $17, $0
/* 0CCFEC 001CCEEC 06000010 */  b           .L001CCF08
/* 0CCFF0 001CCEF0 00000000 */   nop
.L001CCEF4:
/* 0CCFF4 001CCEF4 01001026 */  addiu       $16, $16, 0x1
.L001CCEF8:
/* 0CCFF8 001CCEF8 6000022A */  slti        $2, $16, 0x60
/* 0CCFFC 001CCEFC CBFF4014 */  bnez        $2, .L001CCE2C
/* 0CD000 001CCF00 00000000 */   nop
/* 0CD004 001CCF04 28160070 */  paddub      $2, $0, $0
.L001CCF08:
/* 0CD008 001CCF08 6000BF7B */  lq          $31, 0x60($29)
/* 0CD00C 001CCF0C 5000B47B */  lq          $20, 0x50($29)
/* 0CD010 001CCF10 4000B37B */  lq          $19, 0x40($29)
/* 0CD014 001CCF14 3000B27B */  lq          $18, 0x30($29)
/* 0CD018 001CCF18 2000B17B */  lq          $17, 0x20($29)
/* 0CD01C 001CCF1C 1000B07B */  lq          $16, 0x10($29)
/* 0CD020 001CCF20 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0CD024 001CCF24 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0CD028 001CCF28 9000BD27 */  addiu       $29, $29, 0x90
/* 0CD02C 001CCF2C 0800E003 */  jr          $31
/* 0CD030 001CCF30 00000000 */   nop
/* 0CD034 001CCF34 00000000 */  nop
/* 0CD038 001CCF38 00000000 */  nop
/* 0CD03C 001CCF3C 00000000 */  nop
