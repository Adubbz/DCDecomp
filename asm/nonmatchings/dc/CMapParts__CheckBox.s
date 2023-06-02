.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckBox__9CMapPartsFP7CBoxVu0
/* 9AE80 0019AD80 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 9AE84 0019AD84 2000BF7F */  sq         $31, 0x20($sp)
/* 9AE88 0019AD88 1000B17F */  sq         $17, 0x10($sp)
/* 9AE8C 0019AD8C 0000B07F */  sq         $16, 0x0($sp)
/* 9AE90 0019AD90 288E8070 */  paddub     $17, $4, $0
/* 9AE94 0019AD94 2886A070 */  paddub     $16, $5, $0
/* 9AE98 0019AD98 3000A427 */  addiu      $4, $sp, 0x30
/* 9AE9C 0019AD9C 64002CC6 */  lwc1       $f12, 0x64($17)
/* 9AEA0 0019ADA0 948D040C */  jal        RotMatrixY__FPA4_ff
/* 9AEA4 0019ADA4 00000000 */   nop
/* 9AEA8 0019ADA8 6000A427 */  addiu      $4, $sp, 0x60
/* 9AEAC 0019ADAC 10002526 */  addiu      $5, $17, 0x10
/* 9AEB0 0019ADB0 0C86040C */  jal        sceVu0CopyVector
/* 9AEB4 0019ADB4 00000000 */   nop
/* 9AEB8 0019ADB8 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 9AEBC 0019ADBC 6C00A2AF */  sw         $2, 0x6C($sp)
/* 9AEC0 0019ADC0 4C0122AE */  sw         $2, 0x14C($17)
/* 9AEC4 0019ADC4 3C0122AE */  sw         $2, 0x13C($17)
/* 9AEC8 0019ADC8 8000A427 */  addiu      $4, $sp, 0x80
/* 9AECC 0019ADCC 3000A527 */  addiu      $5, $sp, 0x30
/* 9AED0 0019ADD0 30012626 */  addiu      $6, $17, 0x130
/* 9AED4 0019ADD4 6285040C */  jal        sceVu0ApplyMatrix
/* 9AED8 0019ADD8 00000000 */   nop
/* 9AEDC 0019ADDC 7000A427 */  addiu      $4, $sp, 0x70
/* 9AEE0 0019ADE0 3000A527 */  addiu      $5, $sp, 0x30
/* 9AEE4 0019ADE4 40012626 */  addiu      $6, $17, 0x140
/* 9AEE8 0019ADE8 6285040C */  jal        sceVu0ApplyMatrix
/* 9AEEC 0019ADEC 00000000 */   nop
/* 9AEF0 0019ADF0 8000A427 */  addiu      $4, $sp, 0x80
/* 9AEF4 0019ADF4 7000A527 */  addiu      $5, $sp, 0x70
/* 9AEF8 0019ADF8 28368070 */  paddub     $6, $4, $0
/* 9AEFC 0019ADFC 283EA070 */  paddub     $7, $5, $0
/* 9AF00 0019AE00 1C8C040C */  jal        VectorMaxMin__FPfPfPfPf
/* 9AF04 0019AE04 00000000 */   nop
/* 9AF08 0019AE08 100001C6 */  lwc1       $f1, 0x10($16)
/* 9AF0C 0019AE0C 8000A0C7 */  lwc1       $f0, 0x80($sp)
/* 9AF10 0019AE10 34000146 */  c.lt.s     $f0, $f1
/* 9AF14 0019AE14 00000000 */  nop
/* 9AF18 0019AE18 04000045 */  bc1f       .L0019AE2C
/* 9AF1C 0019AE1C 00000000 */   nop
/* 9AF20 0019AE20 28160070 */  paddub     $2, $0, $0
/* 9AF24 0019AE24 1D000010 */  b          .L0019AE9C
/* 9AF28 0019AE28 00000000 */   nop
.L0019AE2C:
/* 9AF2C 0019AE2C 180001C6 */  lwc1       $f1, 0x18($16)
/* 9AF30 0019AE30 8800A0C7 */  lwc1       $f0, 0x88($sp)
/* 9AF34 0019AE34 34000146 */  c.lt.s     $f0, $f1
/* 9AF38 0019AE38 00000000 */  nop
/* 9AF3C 0019AE3C 04000045 */  bc1f       .L0019AE50
/* 9AF40 0019AE40 00000000 */   nop
/* 9AF44 0019AE44 28160070 */  paddub     $2, $0, $0
/* 9AF48 0019AE48 14000010 */  b          .L0019AE9C
/* 9AF4C 0019AE4C 00000000 */   nop
.L0019AE50:
/* 9AF50 0019AE50 7000A1C7 */  lwc1       $f1, 0x70($sp)
/* 9AF54 0019AE54 000000C6 */  lwc1       $f0, 0x0($16)
/* 9AF58 0019AE58 36080046 */  c.le.s     $f1, $f0
/* 9AF5C 0019AE5C 00000000 */  nop
/* 9AF60 0019AE60 04000145 */  bc1t       .L0019AE74
/* 9AF64 0019AE64 00000000 */   nop
/* 9AF68 0019AE68 28160070 */  paddub     $2, $0, $0
/* 9AF6C 0019AE6C 0B000010 */  b          .L0019AE9C
/* 9AF70 0019AE70 00000000 */   nop
.L0019AE74:
/* 9AF74 0019AE74 080001C6 */  lwc1       $f1, 0x8($16)
/* 9AF78 0019AE78 7800A0C7 */  lwc1       $f0, 0x78($sp)
/* 9AF7C 0019AE7C 36000146 */  c.le.s     $f0, $f1
/* 9AF80 0019AE80 00000000 */  nop
/* 9AF84 0019AE84 04000145 */  bc1t       .L0019AE98
/* 9AF88 0019AE88 00000000 */   nop
/* 9AF8C 0019AE8C 28160070 */  paddub     $2, $0, $0
/* 9AF90 0019AE90 02000010 */  b          .L0019AE9C
/* 9AF94 0019AE94 00000000 */   nop
.L0019AE98:
/* 9AF98 0019AE98 01000224 */  addiu      $2, $0, 0x1
.L0019AE9C:
/* 9AF9C 0019AE9C 2000BF7B */  lq         $31, 0x20($sp)
/* 9AFA0 0019AEA0 1000B17B */  lq         $17, 0x10($sp)
/* 9AFA4 0019AEA4 0000B07B */  lq         $16, 0x0($sp)
/* 9AFA8 0019AEA8 9000BD27 */  addiu      $sp, $sp, 0x90
/* 9AFAC 0019AEAC 0800E003 */  jr         $31
/* 9AFB0 0019AEB0 00000000 */   nop
/* 9AFB4 0019AEB4 00000000 */  nop
/* 9AFB8 0019AEB8 00000000 */  nop
/* 9AFBC 0019AEBC 00000000 */  nop
