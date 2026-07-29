.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckBox__9CMapPartsFP7CBoxVu0
/* 09AE80 0019AD80 70FFBD27 */  addiu       $29, $29, -0x90
/* 09AE84 0019AD84 2000BF7F */  sq          $31, 0x20($29)
/* 09AE88 0019AD88 1000B17F */  sq          $17, 0x10($29)
/* 09AE8C 0019AD8C 0000B07F */  sq          $16, 0x0($29)
/* 09AE90 0019AD90 288E8070 */  paddub      $17, $4, $0
/* 09AE94 0019AD94 2886A070 */  paddub      $16, $5, $0
/* 09AE98 0019AD98 3000A427 */  addiu       $4, $29, 0x30
/* 09AE9C 0019AD9C 64002CC6 */  lwc1        $f12, 0x64($17)
/* 09AEA0 0019ADA0 948D040C */  jal         RotMatrixY__FPA4_ff
/* 09AEA4 0019ADA4 00000000 */   nop
/* 09AEA8 0019ADA8 6000A427 */  addiu       $4, $29, 0x60
/* 09AEAC 0019ADAC 10002526 */  addiu       $5, $17, 0x10
/* 09AEB0 0019ADB0 0C86040C */  jal         sceVu0CopyVector
/* 09AEB4 0019ADB4 00000000 */   nop
/* 09AEB8 0019ADB8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 09AEBC 0019ADBC 6C00A2AF */  sw          $2, 0x6C($29)
/* 09AEC0 0019ADC0 4C0122AE */  sw          $2, 0x14C($17)
/* 09AEC4 0019ADC4 3C0122AE */  sw          $2, 0x13C($17)
/* 09AEC8 0019ADC8 8000A427 */  addiu       $4, $29, 0x80
/* 09AECC 0019ADCC 3000A527 */  addiu       $5, $29, 0x30
/* 09AED0 0019ADD0 30012626 */  addiu       $6, $17, 0x130
/* 09AED4 0019ADD4 6285040C */  jal         sceVu0ApplyMatrix
/* 09AED8 0019ADD8 00000000 */   nop
/* 09AEDC 0019ADDC 7000A427 */  addiu       $4, $29, 0x70
/* 09AEE0 0019ADE0 3000A527 */  addiu       $5, $29, 0x30
/* 09AEE4 0019ADE4 40012626 */  addiu       $6, $17, 0x140
/* 09AEE8 0019ADE8 6285040C */  jal         sceVu0ApplyMatrix
/* 09AEEC 0019ADEC 00000000 */   nop
/* 09AEF0 0019ADF0 8000A427 */  addiu       $4, $29, 0x80
/* 09AEF4 0019ADF4 7000A527 */  addiu       $5, $29, 0x70
/* 09AEF8 0019ADF8 28368070 */  paddub      $6, $4, $0
/* 09AEFC 0019ADFC 283EA070 */  paddub      $7, $5, $0
/* 09AF00 0019AE00 1C8C040C */  jal         VectorMaxMin__FPfPfPfPf
/* 09AF04 0019AE04 00000000 */   nop
/* 09AF08 0019AE08 100001C6 */  lwc1        $f1, 0x10($16)
/* 09AF0C 0019AE0C 8000A0C7 */  lwc1        $f0, 0x80($29)
/* 09AF10 0019AE10 34000146 */  c.lt.s      $f0, $f1
/* 09AF14 0019AE14 00000000 */  nop
/* 09AF18 0019AE18 04000045 */  bc1f        .L0019AE2C
/* 09AF1C 0019AE1C 00000000 */   nop
/* 09AF20 0019AE20 28160070 */  paddub      $2, $0, $0
/* 09AF24 0019AE24 1D000010 */  b           .L0019AE9C
/* 09AF28 0019AE28 00000000 */   nop
.L0019AE2C:
/* 09AF2C 0019AE2C 180001C6 */  lwc1        $f1, 0x18($16)
/* 09AF30 0019AE30 8800A0C7 */  lwc1        $f0, 0x88($29)
/* 09AF34 0019AE34 34000146 */  c.lt.s      $f0, $f1
/* 09AF38 0019AE38 00000000 */  nop
/* 09AF3C 0019AE3C 04000045 */  bc1f        .L0019AE50
/* 09AF40 0019AE40 00000000 */   nop
/* 09AF44 0019AE44 28160070 */  paddub      $2, $0, $0
/* 09AF48 0019AE48 14000010 */  b           .L0019AE9C
/* 09AF4C 0019AE4C 00000000 */   nop
.L0019AE50:
/* 09AF50 0019AE50 7000A1C7 */  lwc1        $f1, 0x70($29)
/* 09AF54 0019AE54 000000C6 */  lwc1        $f0, 0x0($16)
/* 09AF58 0019AE58 36080046 */  c.le.s      $f1, $f0
/* 09AF5C 0019AE5C 00000000 */  nop
/* 09AF60 0019AE60 04000145 */  bc1t        .L0019AE74
/* 09AF64 0019AE64 00000000 */   nop
/* 09AF68 0019AE68 28160070 */  paddub      $2, $0, $0
/* 09AF6C 0019AE6C 0B000010 */  b           .L0019AE9C
/* 09AF70 0019AE70 00000000 */   nop
.L0019AE74:
/* 09AF74 0019AE74 080001C6 */  lwc1        $f1, 0x8($16)
/* 09AF78 0019AE78 7800A0C7 */  lwc1        $f0, 0x78($29)
/* 09AF7C 0019AE7C 36000146 */  c.le.s      $f0, $f1
/* 09AF80 0019AE80 00000000 */  nop
/* 09AF84 0019AE84 04000145 */  bc1t        .L0019AE98
/* 09AF88 0019AE88 00000000 */   nop
/* 09AF8C 0019AE8C 28160070 */  paddub      $2, $0, $0
/* 09AF90 0019AE90 02000010 */  b           .L0019AE9C
/* 09AF94 0019AE94 00000000 */   nop
.L0019AE98:
/* 09AF98 0019AE98 01000224 */  addiu       $2, $0, 0x1
.L0019AE9C:
/* 09AF9C 0019AE9C 2000BF7B */  lq          $31, 0x20($29)
/* 09AFA0 0019AEA0 1000B17B */  lq          $17, 0x10($29)
/* 09AFA4 0019AEA4 0000B07B */  lq          $16, 0x0($29)
/* 09AFA8 0019AEA8 9000BD27 */  addiu       $29, $29, 0x90
/* 09AFAC 0019AEAC 0800E003 */  jr          $31
/* 09AFB0 0019AEB0 00000000 */   nop
/* 09AFB4 0019AEB4 00000000 */  nop
/* 09AFB8 0019AEB8 00000000 */  nop
/* 09AFBC 0019AEBC 00000000 */  nop
