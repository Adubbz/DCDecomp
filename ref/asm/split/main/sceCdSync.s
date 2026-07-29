.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdSync
/* 00AE98 0010AD98 D0FFBD27 */  addiu       $29, $29, -0x30
/* 00AE9C 0010AD9C 2000BFFF */  sd          $31, 0x20($29)
/* 00AEA0 0010ADA0 1000B1FF */  sd          $17, 0x10($29)
/* 00AEA4 0010ADA4 15008014 */  bnez        $4, .L0010ADFC
/* 00AEA8 0010ADA8 0000B0FF */   sd         $16, 0x0($29)
/* 00AEAC 0010ADAC 2500023C */  lui         $2, %hi(CD_debug)
/* 00AEB0 0010ADB0 7002438C */  lw          $3, %lo(CD_debug)($2)
/* 00AEB4 0010ADB4 03006018 */  blez        $3, .L0010ADC4
/* 00AEB8 0010ADB8 2900043C */   lui        $4, %hi(RO_00297130)
/* 00AEBC 0010ADBC A611040C */  jal         printf
/* 00AEC0 0010ADC0 30718424 */   addiu      $4, $4, %lo(RO_00297130)
.L0010ADC4:
/* 00AEC4 0010ADC4 2500113C */  lui         $17, %hi(c_cb_sem)
/* 00AEC8 0010ADC8 03000010 */  b           .L0010ADD8
/* 00AECC 0010ADCC 2A00103C */   lui        $16, %hi(cdrd)
.L0010ADD0:
/* 00AED0 0010ADD0 6825040C */  jal         sceCdDelayThread
/* 00AED4 0010ADD4 78000424 */   addiu      $4, $0, 0x78
.L0010ADD8:
/* 00AED8 0010ADD8 8C02228E */  lw          $2, %lo(c_cb_sem)($17)
/* 00AEDC 0010ADDC FCFF4014 */  bnez        $2, .L0010ADD0
/* 00AEE0 0010ADE0 00000000 */   nop
/* 00AEE4 0010ADE4 A65D040C */  jal         sceSifCheckStatRpc
/* 00AEE8 0010ADE8 003C0426 */   addiu      $4, $16, %lo(cdrd)
/* 00AEEC 0010ADEC F8FF4014 */  bnez        $2, .L0010ADD0
/* 00AEF0 0010ADF0 2D100000 */   daddu      $2, $0, $0
/* 00AEF4 0010ADF4 0C000010 */  b           .L0010AE28
/* 00AEF8 0010ADF8 2000BFDF */   ld         $31, 0x20($29)
.L0010ADFC:
/* 00AEFC 0010ADFC 2500023C */  lui         $2, %hi(c_cb_sem)
/* 00AF00 0010AE00 8C02438C */  lw          $3, %lo(c_cb_sem)($2)
/* 00AF04 0010AE04 07006014 */  bnez        $3, .L0010AE24
/* 00AF08 0010AE08 01000224 */   addiu      $2, $0, 0x1
/* 00AF0C 0010AE0C 2A00043C */  lui         $4, %hi(cdrd)
/* 00AF10 0010AE10 A65D040C */  jal         sceSifCheckStatRpc
/* 00AF14 0010AE14 003C8424 */   addiu      $4, $4, %lo(cdrd)
/* 00AF18 0010AE18 02004014 */  bnez        $2, .L0010AE24
/* 00AF1C 0010AE1C 01000224 */   addiu      $2, $0, 0x1
/* 00AF20 0010AE20 2D100000 */  daddu       $2, $0, $0
.L0010AE24:
/* 00AF24 0010AE24 2000BFDF */  ld          $31, 0x20($29)
.L0010AE28:
/* 00AF28 0010AE28 1000B1DF */  ld          $17, 0x10($29)
/* 00AF2C 0010AE2C 0000B0DF */  ld          $16, 0x0($29)
/* 00AF30 0010AE30 0800E003 */  jr          $31
/* 00AF34 0010AE34 3000BD27 */   addiu      $29, $29, 0x30
