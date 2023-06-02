.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SearchDataSlotPos2__16CDungeonEventManFPf
/* CCEE0 001CCDE0 70FFBD27 */  addiu      $sp, $sp, -0x90
/* CCEE4 001CCDE4 6000BF7F */  sq         $31, 0x60($sp)
/* CCEE8 001CCDE8 5000B47F */  sq         $20, 0x50($sp)
/* CCEEC 001CCDEC 4000B37F */  sq         $19, 0x40($sp)
/* CCEF0 001CCDF0 3000B27F */  sq         $18, 0x30($sp)
/* CCEF4 001CCDF4 2000B17F */  sq         $17, 0x20($sp)
/* CCEF8 001CCDF8 1000B07F */  sq         $16, 0x10($sp)
/* CCEFC 001CCDFC 0400B5E7 */  swc1       $f21, 0x4($sp)
/* CCF00 001CCE00 0000B4E7 */  swc1       $f20, 0x0($sp)
/* CCF04 001CCE04 28968070 */  paddub     $18, $4, $0
/* CCF08 001CCE08 8000A427 */  addiu      $4, $sp, 0x80
/* CCF0C 001CCE0C 0C86040C */  jal        sceVu0CopyVector
/* CCF10 001CCE10 00000000 */   nop
/* CCF14 001CCE14 8400A227 */  addiu      $2, $sp, 0x84
/* CCF18 001CCE18 000054C4 */  lwc1       $f20, 0x0($2)
/* CCF1C 001CCE1C 000040AC */  sw         $0, 0x0($2)
/* CCF20 001CCE20 28860070 */  paddub     $16, $0, $0
/* CCF24 001CCE24 34000010 */  b          .L001CCEF8
/* CCF28 001CCE28 00000000 */   nop
.L001CCE2C:
/* CCF2C 001CCE2C 80A11000 */  sll        $20, $16, 6
/* CCF30 001CCE30 21985402 */  addu       $19, $18, $20
/* CCF34 001CCE34 00107126 */  addiu      $17, $19, 0x1000
/* CCF38 001CCE38 28262072 */  paddub     $4, $17, $0
/* CCF3C 001CCE3C 2032070C */  jal        CheckSwitch__17CDungeonEventDataFv
/* CCF40 001CCE40 00000000 */   nop
/* CCF44 001CCE44 2B004010 */  beqz       $2, .L001CCEF4
/* CCF48 001CCE48 00000000 */   nop
/* CCF4C 001CCE4C 7000A427 */  addiu      $4, $sp, 0x70
/* CCF50 001CCE50 10106526 */  addiu      $5, $19, 0x1010
/* CCF54 001CCE54 0C86040C */  jal        sceVu0CopyVector
/* CCF58 001CCE58 00000000 */   nop
/* CCF5C 001CCE5C 7400A327 */  addiu      $3, $sp, 0x74
/* CCF60 001CCE60 000060C4 */  lwc1       $f0, 0x0($3)
/* CCF64 001CCE64 41A00046 */  sub.s      $f1, $f20, $f0
/* CCF68 001CCE68 00008044 */  mtc1       $0, $f0
/* CCF6C 001CCE6C 00000000 */  nop
/* CCF70 001CCE70 34080046 */  c.lt.s     $f1, $f0
/* CCF74 001CCE74 00000000 */  nop
/* CCF78 001CCE78 04000045 */  bc1f       .L001CCE8C
/* CCF7C 001CCE7C 00000000 */   nop
/* CCF80 001CCE80 47080046 */  neg.s      $f1, $f1
/* CCF84 001CCE84 01000010 */  b          .L001CCE8C
/* CCF88 001CCE88 00000000 */   nop
.L001CCE8C:
/* CCF8C 001CCE8C 2042023C */  lui        $2, (0x42200000 >> 16)
/* CCF90 001CCE90 00008244 */  mtc1       $2, $f0
/* CCF94 001CCE94 00000000 */  nop
/* CCF98 001CCE98 34080046 */  c.lt.s     $f1, $f0
/* CCF9C 001CCE9C 00000000 */  nop
/* CCFA0 001CCEA0 14000045 */  bc1f       .L001CCEF4
/* CCFA4 001CCEA4 00000000 */   nop
/* CCFA8 001CCEA8 000060AC */  sw         $0, 0x0($3)
/* CCFAC 001CCEAC 21109202 */  addu       $2, $20, $18
/* CCFB0 001CCEB0 0010428C */  lw         $2, 0x1000($2)
/* CCFB4 001CCEB4 180055C4 */  lwc1       $f21, 0x18($2)
/* CCFB8 001CCEB8 7000A427 */  addiu      $4, $sp, 0x70
/* CCFBC 001CCEBC 8000A527 */  addiu      $5, $sp, 0x80
/* CCFC0 001CCEC0 648D040C */  jal        DistVector__FPfPf
/* CCFC4 001CCEC4 00000000 */   nop
/* CCFC8 001CCEC8 2041023C */  lui        $2, (0x41200000 >> 16)
/* CCFCC 001CCECC 00088244 */  mtc1       $2, $f1
/* CCFD0 001CCED0 00000000 */  nop
/* CCFD4 001CCED4 40081546 */  add.s      $f1, $f1, $f21
/* CCFD8 001CCED8 36000146 */  c.le.s     $f0, $f1
/* CCFDC 001CCEDC 00000000 */  nop
/* CCFE0 001CCEE0 04000045 */  bc1f       .L001CCEF4
/* CCFE4 001CCEE4 00000000 */   nop
/* CCFE8 001CCEE8 28162072 */  paddub     $2, $17, $0
/* CCFEC 001CCEEC 06000010 */  b          .L001CCF08
/* CCFF0 001CCEF0 00000000 */   nop
.L001CCEF4:
/* CCFF4 001CCEF4 01001026 */  addiu      $16, $16, 0x1
.L001CCEF8:
/* CCFF8 001CCEF8 6000022A */  slti       $2, $16, 0x60
/* CCFFC 001CCEFC CBFF4014 */  bnez       $2, .L001CCE2C
/* CD000 001CCF00 00000000 */   nop
/* CD004 001CCF04 28160070 */  paddub     $2, $0, $0
.L001CCF08:
/* CD008 001CCF08 6000BF7B */  lq         $31, 0x60($sp)
/* CD00C 001CCF0C 5000B47B */  lq         $20, 0x50($sp)
/* CD010 001CCF10 4000B37B */  lq         $19, 0x40($sp)
/* CD014 001CCF14 3000B27B */  lq         $18, 0x30($sp)
/* CD018 001CCF18 2000B17B */  lq         $17, 0x20($sp)
/* CD01C 001CCF1C 1000B07B */  lq         $16, 0x10($sp)
/* CD020 001CCF20 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* CD024 001CCF24 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* CD028 001CCF28 9000BD27 */  addiu      $sp, $sp, 0x90
/* CD02C 001CCF2C 0800E003 */  jr         $31
/* CD030 001CCF30 00000000 */   nop
/* CD034 001CCF34 00000000 */  nop
/* CD038 001CCF38 00000000 */  nop
/* CD03C 001CCF3C 00000000 */  nop
