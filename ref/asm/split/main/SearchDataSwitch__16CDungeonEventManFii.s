.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SearchDataSwitch__16CDungeonEventManFii
/* 0CCA90 001CC990 A0FFBD27 */  addiu       $29, $29, -0x60
/* 0CCA94 001CC994 5000BF7F */  sq          $31, 0x50($29)
/* 0CCA98 001CC998 4000B47F */  sq          $20, 0x40($29)
/* 0CCA9C 001CC99C 3000B37F */  sq          $19, 0x30($29)
/* 0CCAA0 001CC9A0 2000B27F */  sq          $18, 0x20($29)
/* 0CCAA4 001CC9A4 1000B17F */  sq          $17, 0x10($29)
/* 0CCAA8 001CC9A8 0000B07F */  sq          $16, 0x0($29)
/* 0CCAAC 001CC9AC 289E8070 */  paddub      $19, $4, $0
/* 0CCAB0 001CC9B0 2896A070 */  paddub      $18, $5, $0
/* 0CCAB4 001CC9B4 288EC070 */  paddub      $17, $6, $0
/* 0CCAB8 001CC9B8 28860070 */  paddub      $16, $0, $0
/* 0CCABC 001CC9BC 1C000010 */  b           .L001CCA30
/* 0CCAC0 001CC9C0 00000000 */   nop
.L001CC9C4:
/* 0CCAC4 001CC9C4 80A11000 */  sll         $20, $16, 6
/* 0CCAC8 001CC9C8 21189302 */  addu        $3, $20, $19
/* 0CCACC 001CC9CC 0010648C */  lw          $4, 0x1000($3)
/* 0CCAD0 001CC9D0 04008010 */  beqz        $4, .L001CC9E4
/* 0CCAD4 001CC9D4 00000000 */   nop
/* 0CCAD8 001CC9D8 3810638C */  lw          $3, 0x1038($3)
/* 0CCADC 001CC9DC 02000010 */  b           .L001CC9E8
/* 0CCAE0 001CC9E0 00000000 */   nop
.L001CC9E4:
/* 0CCAE4 001CC9E4 281E0070 */  paddub      $3, $0, $0
.L001CC9E8:
/* 0CCAE8 001CC9E8 10006010 */  beqz        $3, .L001CCA2C
/* 0CCAEC 001CC9EC 00000000 */   nop
/* 0CCAF0 001CC9F0 2000838C */  lw          $3, 0x20($4)
/* 0CCAF4 001CC9F4 0D004316 */  bne         $18, $3, .L001CCA2C
/* 0CCAF8 001CC9F8 00000000 */   nop
/* 0CCAFC 001CC9FC 05002012 */  beqz        $17, .L001CCA14
/* 0CCB00 001CCA00 00000000 */   nop
/* 0CCB04 001CCA04 21107402 */  addu        $2, $19, $20
/* 0CCB08 001CCA08 00104424 */  addiu       $4, $2, 0x1000
/* 0CCB0C 001CCA0C 3832070C */  jal         Start__17CDungeonEventDataFv
/* 0CCB10 001CCA10 00000000 */   nop
.L001CCA14:
/* 0CCB14 001CCA14 05002016 */  bnez        $17, .L001CCA2C
/* 0CCB18 001CCA18 00000000 */   nop
/* 0CCB1C 001CCA1C 21107402 */  addu        $2, $19, $20
/* 0CCB20 001CCA20 00104424 */  addiu       $4, $2, 0x1000
/* 0CCB24 001CCA24 3432070C */  jal         Stop__17CDungeonEventDataFv
/* 0CCB28 001CCA28 00000000 */   nop
.L001CCA2C:
/* 0CCB2C 001CCA2C 01001026 */  addiu       $16, $16, 0x1
.L001CCA30:
/* 0CCB30 001CCA30 6000032A */  slti        $3, $16, 0x60
/* 0CCB34 001CCA34 E3FF6014 */  bnez        $3, .L001CC9C4
/* 0CCB38 001CCA38 00000000 */   nop
/* 0CCB3C 001CCA3C 5000BF7B */  lq          $31, 0x50($29)
/* 0CCB40 001CCA40 4000B47B */  lq          $20, 0x40($29)
/* 0CCB44 001CCA44 3000B37B */  lq          $19, 0x30($29)
/* 0CCB48 001CCA48 2000B27B */  lq          $18, 0x20($29)
/* 0CCB4C 001CCA4C 1000B17B */  lq          $17, 0x10($29)
/* 0CCB50 001CCA50 0000B07B */  lq          $16, 0x0($29)
/* 0CCB54 001CCA54 6000BD27 */  addiu       $29, $29, 0x60
/* 0CCB58 001CCA58 0800E003 */  jr          $31
/* 0CCB5C 001CCA5C 00000000 */   nop
