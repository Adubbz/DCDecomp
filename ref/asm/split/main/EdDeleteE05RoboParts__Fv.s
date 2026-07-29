.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdDeleteE05RoboParts__Fv
/* 07EDF0 0017ECF0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 07EDF4 0017ECF4 1000BF7F */  sq          $31, 0x10($29)
/* 07EDF8 0017ECF8 0000B07F */  sq          $16, 0x0($29)
/* 07EDFC 0017ECFC 28860070 */  paddub      $16, $0, $0
/* 07EE00 0017ED00 0C000010 */  b           .L0017ED34
/* 07EE04 0017ED04 00000000 */   nop
.L0017ED08:
/* 07EE08 0017ED08 1C8D848F */  lw          $4, -0x72E4($28)
/* 07EE0C 0017ED0C 04000524 */  addiu       $5, $0, 0x4
/* 07EE10 0017ED10 28360072 */  paddub      $6, $16, $0
/* 07EE14 0017ED14 FC5F050C */  jal         GetEditPartsInfo__9CSaveDataFii
/* 07EE18 0017ED18 00000000 */   nop
/* 07EE1C 0017ED1C 04004010 */  beqz        $2, .L0017ED30
/* 07EE20 0017ED20 00000000 */   nop
/* 07EE24 0017ED24 040040A4 */  sh          $0, 0x4($2)
/* 07EE28 0017ED28 060040A4 */  sh          $0, 0x6($2)
/* 07EE2C 0017ED2C 080040A4 */  sh          $0, 0x8($2)
.L0017ED30:
/* 07EE30 0017ED30 01001026 */  addiu       $16, $16, 0x1
.L0017ED34:
/* 07EE34 0017ED34 0E00022A */  slti        $2, $16, 0xE
/* 07EE38 0017ED38 F3FF4014 */  bnez        $2, .L0017ED08
/* 07EE3C 0017ED3C 00000000 */   nop
/* 07EE40 0017ED40 1C8D848F */  lw          $4, -0x72E4($28)
/* 07EE44 0017ED44 04000524 */  addiu       $5, $0, 0x4
/* 07EE48 0017ED48 6860050C */  jal         GetElemData__9CSaveDataFi
/* 07EE4C 0017ED4C 00000000 */   nop
/* 07EE50 0017ED50 0B004010 */  beqz        $2, .L0017ED80
/* 07EE54 0017ED54 00000000 */   nop
/* 07EE58 0017ED58 28260070 */  paddub      $4, $0, $0
/* 07EE5C 0017ED5C 05000010 */  b           .L0017ED74
/* 07EE60 0017ED60 00000000 */   nop
.L0017ED64:
/* 07EE64 0017ED64 FFFF0324 */  addiu       $3, $0, -0x1
/* 07EE68 0017ED68 000043A4 */  sh          $3, 0x0($2)
/* 07EE6C 0017ED6C 02004224 */  addiu       $2, $2, 0x2
/* 07EE70 0017ED70 01008424 */  addiu       $4, $4, 0x1
.L0017ED74:
/* 07EE74 0017ED74 80008328 */  slti        $3, $4, 0x80
/* 07EE78 0017ED78 FAFF6014 */  bnez        $3, .L0017ED64
/* 07EE7C 0017ED7C 00000000 */   nop
.L0017ED80:
/* 07EE80 0017ED80 1C8D848F */  lw          $4, -0x72E4($28)
/* 07EE84 0017ED84 04000524 */  addiu       $5, $0, 0x4
/* 07EE88 0017ED88 2C00A627 */  addiu       $6, $29, 0x2C
/* 07EE8C 0017ED8C 1860050C */  jal         GetParts__9CSaveDataFiPi
/* 07EE90 0017ED90 00000000 */   nop
/* 07EE94 0017ED94 28264070 */  paddub      $4, $2, $0
/* 07EE98 0017ED98 282E0070 */  paddub      $5, $0, $0
/* 07EE9C 0017ED9C 05000010 */  b           .L0017EDB4
/* 07EEA0 0017EDA0 00000000 */   nop
.L0017EDA4:
/* 07EEA4 0017EDA4 FFFF0324 */  addiu       $3, $0, -0x1
/* 07EEA8 0017EDA8 000083A4 */  sh          $3, 0x0($4)
/* 07EEAC 0017EDAC 0100A524 */  addiu       $5, $5, 0x1
/* 07EEB0 0017EDB0 10008424 */  addiu       $4, $4, 0x10
.L0017EDB4:
/* 07EEB4 0017EDB4 2C00A38F */  lw          $3, 0x2C($29)
/* 07EEB8 0017EDB8 2A18A300 */  slt         $3, $5, $3
/* 07EEBC 0017EDBC F9FF6014 */  bnez        $3, .L0017EDA4
/* 07EEC0 0017EDC0 00000000 */   nop
/* 07EEC4 0017EDC4 1000BF7B */  lq          $31, 0x10($29)
/* 07EEC8 0017EDC8 0000B07B */  lq          $16, 0x0($29)
/* 07EECC 0017EDCC 3000BD27 */  addiu       $29, $29, 0x30
/* 07EED0 0017EDD0 0800E003 */  jr          $31
/* 07EED4 0017EDD4 00000000 */   nop
/* 07EED8 0017EDD8 00000000 */  nop
/* 07EEDC 0017EDDC 00000000 */  nop
