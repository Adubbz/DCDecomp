.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMsgLengthCharaName__Fi
/* 13CEE0 0023CDE0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 13CEE4 0023CDE4 0000BF7F */  sq         $31, 0x0($sp)
/* 13CEE8 0023CDE8 282E8070 */  paddub     $5, $4, $0
/* 13CEEC 0023CDEC 0400A004 */  bltz       $5, .L0023CE00
/* 13CEF0 0023CDF0 00000000 */   nop
/* 13CEF4 0023CDF4 0600A128 */  slti       $at, $5, 0x6
/* 13CEF8 0023CDF8 04002014 */  bnez       $at, .L0023CE0C
/* 13CEFC 0023CDFC 00000000 */   nop
.L0023CE00:
/* 13CF00 0023CE00 28160070 */  paddub     $2, $0, $0
/* 13CF04 0023CE04 10000010 */  b          .L0023CE48
/* 13CF08 0023CE08 00000000 */   nop
.L0023CE0C:
/* 13CF0C 0023CE0C 1C8D848F */  lw         $4, -0x72E4($gp)
/* 13CF10 0023CE10 D45E050C */  jal        GetCharaName__9CSaveDataFi
/* 13CF14 0023CE14 00000000 */   nop
/* 13CF18 0023CE18 28260070 */  paddub     $4, $0, $0
/* 13CF1C 0023CE1C 03000010 */  b          .L0023CE2C
/* 13CF20 0023CE20 00000000 */   nop
.L0023CE24:
/* 13CF24 0023CE24 02004224 */  addiu      $2, $2, 0x2
/* 13CF28 0023CE28 01008424 */  addiu      $4, $4, 0x1
.L0023CE2C:
/* 13CF2C 0023CE2C 00004384 */  lh         $3, 0x0($2)
/* 13CF30 0023CE30 04006010 */  beqz       $3, .L0023CE44
/* 13CF34 0023CE34 00000000 */   nop
/* 13CF38 0023CE38 0A008328 */  slti       $3, $4, 0xA
/* 13CF3C 0023CE3C F9FF6014 */  bnez       $3, .L0023CE24
/* 13CF40 0023CE40 00000000 */   nop
.L0023CE44:
/* 13CF44 0023CE44 28168070 */  paddub     $2, $4, $0
.L0023CE48:
/* 13CF48 0023CE48 0000BF7B */  lq         $31, 0x0($sp)
/* 13CF4C 0023CE4C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 13CF50 0023CE50 0800E003 */  jr         $31
/* 13CF54 0023CE54 00000000 */   nop
/* 13CF58 0023CE58 00000000 */  nop
/* 13CF5C 0023CE5C 00000000 */  nop
