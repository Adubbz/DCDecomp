.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SearchDataSwitch__16CDungeonEventManFii
/* CCA90 001CC990 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* CCA94 001CC994 5000BF7F */  sq         $31, 0x50($sp)
/* CCA98 001CC998 4000B47F */  sq         $20, 0x40($sp)
/* CCA9C 001CC99C 3000B37F */  sq         $19, 0x30($sp)
/* CCAA0 001CC9A0 2000B27F */  sq         $18, 0x20($sp)
/* CCAA4 001CC9A4 1000B17F */  sq         $17, 0x10($sp)
/* CCAA8 001CC9A8 0000B07F */  sq         $16, 0x0($sp)
/* CCAAC 001CC9AC 289E8070 */  paddub     $19, $4, $0
/* CCAB0 001CC9B0 2896A070 */  paddub     $18, $5, $0
/* CCAB4 001CC9B4 288EC070 */  paddub     $17, $6, $0
/* CCAB8 001CC9B8 28860070 */  paddub     $16, $0, $0
/* CCABC 001CC9BC 1C000010 */  b          .L001CCA30
/* CCAC0 001CC9C0 00000000 */   nop
.L001CC9C4:
/* CCAC4 001CC9C4 80A11000 */  sll        $20, $16, 6
/* CCAC8 001CC9C8 21189302 */  addu       $3, $20, $19
/* CCACC 001CC9CC 0010648C */  lw         $4, 0x1000($3)
/* CCAD0 001CC9D0 04008010 */  beqz       $4, .L001CC9E4
/* CCAD4 001CC9D4 00000000 */   nop
/* CCAD8 001CC9D8 3810638C */  lw         $3, 0x1038($3)
/* CCADC 001CC9DC 02000010 */  b          .L001CC9E8
/* CCAE0 001CC9E0 00000000 */   nop
.L001CC9E4:
/* CCAE4 001CC9E4 281E0070 */  paddub     $3, $0, $0
.L001CC9E8:
/* CCAE8 001CC9E8 10006010 */  beqz       $3, .L001CCA2C
/* CCAEC 001CC9EC 00000000 */   nop
/* CCAF0 001CC9F0 2000838C */  lw         $3, 0x20($4)
/* CCAF4 001CC9F4 0D004316 */  bne        $18, $3, .L001CCA2C
/* CCAF8 001CC9F8 00000000 */   nop
/* CCAFC 001CC9FC 05002012 */  beqz       $17, .L001CCA14
/* CCB00 001CCA00 00000000 */   nop
/* CCB04 001CCA04 21107402 */  addu       $2, $19, $20
/* CCB08 001CCA08 00104424 */  addiu      $4, $2, 0x1000
/* CCB0C 001CCA0C 3832070C */  jal        Start__17CDungeonEventDataFv
/* CCB10 001CCA10 00000000 */   nop
.L001CCA14:
/* CCB14 001CCA14 05002016 */  bnez       $17, .L001CCA2C
/* CCB18 001CCA18 00000000 */   nop
/* CCB1C 001CCA1C 21107402 */  addu       $2, $19, $20
/* CCB20 001CCA20 00104424 */  addiu      $4, $2, 0x1000
/* CCB24 001CCA24 3432070C */  jal        Stop__17CDungeonEventDataFv
/* CCB28 001CCA28 00000000 */   nop
.L001CCA2C:
/* CCB2C 001CCA2C 01001026 */  addiu      $16, $16, 0x1
.L001CCA30:
/* CCB30 001CCA30 6000032A */  slti       $3, $16, 0x60
/* CCB34 001CCA34 E3FF6014 */  bnez       $3, .L001CC9C4
/* CCB38 001CCA38 00000000 */   nop
/* CCB3C 001CCA3C 5000BF7B */  lq         $31, 0x50($sp)
/* CCB40 001CCA40 4000B47B */  lq         $20, 0x40($sp)
/* CCB44 001CCA44 3000B37B */  lq         $19, 0x30($sp)
/* CCB48 001CCA48 2000B27B */  lq         $18, 0x20($sp)
/* CCB4C 001CCA4C 1000B17B */  lq         $17, 0x10($sp)
/* CCB50 001CCA50 0000B07B */  lq         $16, 0x0($sp)
/* CCB54 001CCA54 6000BD27 */  addiu      $sp, $sp, 0x60
/* CCB58 001CCA58 0800E003 */  jr         $31
/* CCB5C 001CCA5C 00000000 */   nop
