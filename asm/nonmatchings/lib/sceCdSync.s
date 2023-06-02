.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdSync
/* AE98 0010AD98 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* AE9C 0010AD9C 2000BFFF */  sd         $31, 0x20($sp)
/* AEA0 0010ADA0 1000B1FF */  sd         $17, 0x10($sp)
/* AEA4 0010ADA4 15008014 */  bnez       $4, .L0010ADFC
/* AEA8 0010ADA8 0000B0FF */   sd        $16, 0x0($sp)
/* AEAC 0010ADAC 2500023C */  lui        $2, (0x250270 >> 16)
/* AEB0 0010ADB0 7002438C */  lw         $3, (0x250270 & 0xFFFF)($2)
/* AEB4 0010ADB4 03006018 */  blez       $3, .L0010ADC4
/* AEB8 0010ADB8 2900043C */   lui       $4, %hi(D_00297130)
/* AEBC 0010ADBC A611040C */  jal        printf
/* AEC0 0010ADC0 30718424 */   addiu     $4, $4, %lo(D_00297130)
.L0010ADC4:
/* AEC4 0010ADC4 2500113C */  lui        $17, (0x25028C >> 16)
/* AEC8 0010ADC8 03000010 */  b          .L0010ADD8
/* AECC 0010ADCC 2A00103C */   lui       $16, %hi(D_002A3C00)
.L0010ADD0:
/* AED0 0010ADD0 6825040C */  jal        sceCdDelayThread
/* AED4 0010ADD4 78000424 */   addiu     $4, $0, 0x78
.L0010ADD8:
/* AED8 0010ADD8 8C02228E */  lw         $2, (0x25028C & 0xFFFF)($17)
/* AEDC 0010ADDC FCFF4014 */  bnez       $2, .L0010ADD0
/* AEE0 0010ADE0 00000000 */   nop
/* AEE4 0010ADE4 A65D040C */  jal        sceSifCheckStatRpc
/* AEE8 0010ADE8 003C0426 */   addiu     $4, $16, %lo(D_002A3C00)
/* AEEC 0010ADEC F8FF4014 */  bnez       $2, .L0010ADD0
/* AEF0 0010ADF0 2D100000 */   daddu     $2, $0, $0
/* AEF4 0010ADF4 0C000010 */  b          .L0010AE28
/* AEF8 0010ADF8 2000BFDF */   ld        $31, 0x20($sp)
.L0010ADFC:
/* AEFC 0010ADFC 2500023C */  lui        $2, (0x25028C >> 16)
/* AF00 0010AE00 8C02438C */  lw         $3, (0x25028C & 0xFFFF)($2)
/* AF04 0010AE04 07006014 */  bnez       $3, .L0010AE24
/* AF08 0010AE08 01000224 */   addiu     $2, $0, 0x1
/* AF0C 0010AE0C 2A00043C */  lui        $4, %hi(D_002A3C00)
/* AF10 0010AE10 A65D040C */  jal        sceSifCheckStatRpc
/* AF14 0010AE14 003C8424 */   addiu     $4, $4, %lo(D_002A3C00)
/* AF18 0010AE18 02004014 */  bnez       $2, .L0010AE24
/* AF1C 0010AE1C 01000224 */   addiu     $2, $0, 0x1
/* AF20 0010AE20 2D100000 */  daddu      $2, $0, $0
.L0010AE24:
/* AF24 0010AE24 2000BFDF */  ld         $31, 0x20($sp)
.L0010AE28:
/* AF28 0010AE28 1000B1DF */  ld         $17, 0x10($sp)
/* AF2C 0010AE2C 0000B0DF */  ld         $16, 0x0($sp)
/* AF30 0010AE30 0800E003 */  jr         $31
/* AF34 0010AE34 3000BD27 */   addiu     $sp, $sp, 0x30
