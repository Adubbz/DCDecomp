.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdDeleteE05RoboParts__Fv
/* 7EDF0 0017ECF0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 7EDF4 0017ECF4 1000BF7F */  sq         $31, 0x10($sp)
/* 7EDF8 0017ECF8 0000B07F */  sq         $16, 0x0($sp)
/* 7EDFC 0017ECFC 28860070 */  paddub     $16, $0, $0
/* 7EE00 0017ED00 0C000010 */  b          .L0017ED34
/* 7EE04 0017ED04 00000000 */   nop
.L0017ED08:
/* 7EE08 0017ED08 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7EE0C 0017ED0C 04000524 */  addiu      $5, $0, 0x4
/* 7EE10 0017ED10 28360072 */  paddub     $6, $16, $0
/* 7EE14 0017ED14 FC5F050C */  jal        GetEditPartsInfo__9CSaveDataFii
/* 7EE18 0017ED18 00000000 */   nop
/* 7EE1C 0017ED1C 04004010 */  beqz       $2, .L0017ED30
/* 7EE20 0017ED20 00000000 */   nop
/* 7EE24 0017ED24 040040A4 */  sh         $0, 0x4($2)
/* 7EE28 0017ED28 060040A4 */  sh         $0, 0x6($2)
/* 7EE2C 0017ED2C 080040A4 */  sh         $0, 0x8($2)
.L0017ED30:
/* 7EE30 0017ED30 01001026 */  addiu      $16, $16, 0x1
.L0017ED34:
/* 7EE34 0017ED34 0E00022A */  slti       $2, $16, 0xE
/* 7EE38 0017ED38 F3FF4014 */  bnez       $2, .L0017ED08
/* 7EE3C 0017ED3C 00000000 */   nop
/* 7EE40 0017ED40 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7EE44 0017ED44 04000524 */  addiu      $5, $0, 0x4
/* 7EE48 0017ED48 6860050C */  jal        GetElemData__9CSaveDataFi
/* 7EE4C 0017ED4C 00000000 */   nop
/* 7EE50 0017ED50 0B004010 */  beqz       $2, .L0017ED80
/* 7EE54 0017ED54 00000000 */   nop
/* 7EE58 0017ED58 28260070 */  paddub     $4, $0, $0
/* 7EE5C 0017ED5C 05000010 */  b          .L0017ED74
/* 7EE60 0017ED60 00000000 */   nop
.L0017ED64:
/* 7EE64 0017ED64 FFFF0324 */  addiu      $3, $0, -0x1
/* 7EE68 0017ED68 000043A4 */  sh         $3, 0x0($2)
/* 7EE6C 0017ED6C 02004224 */  addiu      $2, $2, 0x2
/* 7EE70 0017ED70 01008424 */  addiu      $4, $4, 0x1
.L0017ED74:
/* 7EE74 0017ED74 80008328 */  slti       $3, $4, 0x80
/* 7EE78 0017ED78 FAFF6014 */  bnez       $3, .L0017ED64
/* 7EE7C 0017ED7C 00000000 */   nop
.L0017ED80:
/* 7EE80 0017ED80 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7EE84 0017ED84 04000524 */  addiu      $5, $0, 0x4
/* 7EE88 0017ED88 2C00A627 */  addiu      $6, $sp, 0x2C
/* 7EE8C 0017ED8C 1860050C */  jal        GetParts__9CSaveDataFiPi
/* 7EE90 0017ED90 00000000 */   nop
/* 7EE94 0017ED94 28264070 */  paddub     $4, $2, $0
/* 7EE98 0017ED98 282E0070 */  paddub     $5, $0, $0
/* 7EE9C 0017ED9C 05000010 */  b          .L0017EDB4
/* 7EEA0 0017EDA0 00000000 */   nop
.L0017EDA4:
/* 7EEA4 0017EDA4 FFFF0324 */  addiu      $3, $0, -0x1
/* 7EEA8 0017EDA8 000083A4 */  sh         $3, 0x0($4)
/* 7EEAC 0017EDAC 0100A524 */  addiu      $5, $5, 0x1
/* 7EEB0 0017EDB0 10008424 */  addiu      $4, $4, 0x10
.L0017EDB4:
/* 7EEB4 0017EDB4 2C00A38F */  lw         $3, 0x2C($sp)
/* 7EEB8 0017EDB8 2A18A300 */  slt        $3, $5, $3
/* 7EEBC 0017EDBC F9FF6014 */  bnez       $3, .L0017EDA4
/* 7EEC0 0017EDC0 00000000 */   nop
/* 7EEC4 0017EDC4 1000BF7B */  lq         $31, 0x10($sp)
/* 7EEC8 0017EDC8 0000B07B */  lq         $16, 0x0($sp)
/* 7EECC 0017EDCC 3000BD27 */  addiu      $sp, $sp, 0x30
/* 7EED0 0017EDD0 0800E003 */  jr         $31
/* 7EED4 0017EDD4 00000000 */   nop
/* 7EED8 0017EDD8 00000000 */  nop
/* 7EEDC 0017EDDC 00000000 */  nop
