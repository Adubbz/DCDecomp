.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SearchDataSlotPos__16CDungeonEventManFPf
/* 0CCDD0 001CCCD0 80FFBD27 */  addiu       $29, $29, -0x80
/* 0CCDD4 001CCCD4 7000BF7F */  sq          $31, 0x70($29)
/* 0CCDD8 001CCCD8 6000B57F */  sq          $21, 0x60($29)
/* 0CCDDC 001CCCDC 5000B47F */  sq          $20, 0x50($29)
/* 0CCDE0 001CCCE0 4000B37F */  sq          $19, 0x40($29)
/* 0CCDE4 001CCCE4 3000B27F */  sq          $18, 0x30($29)
/* 0CCDE8 001CCCE8 2000B17F */  sq          $17, 0x20($29)
/* 0CCDEC 001CCCEC 1000B07F */  sq          $16, 0x10($29)
/* 0CCDF0 001CCCF0 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0CCDF4 001CCCF4 289E8070 */  paddub      $19, $4, $0
/* 0CCDF8 001CCCF8 2896A070 */  paddub      $18, $5, $0
/* 0CCDFC 001CCCFC 28860070 */  paddub      $16, $0, $0
/* 0CCE00 001CCD00 26000010 */  b           .L001CCD9C
/* 0CCE04 001CCD04 00000000 */   nop
.L001CCD08:
/* 0CCE08 001CCD08 80A11000 */  sll         $20, $16, 6
/* 0CCE0C 001CCD0C 21A87402 */  addu        $21, $19, $20
/* 0CCE10 001CCD10 0010B126 */  addiu       $17, $21, 0x1000
/* 0CCE14 001CCD14 28262072 */  paddub      $4, $17, $0
/* 0CCE18 001CCD18 2032070C */  jal         CheckSwitch__17CDungeonEventDataFv
/* 0CCE1C 001CCD1C 00000000 */   nop
/* 0CCE20 001CCD20 1D004010 */  beqz        $2, .L001CCD98
/* 0CCE24 001CCD24 00000000 */   nop
/* 0CCE28 001CCD28 2816A072 */  paddub      $2, $21, $0
/* 0CCE2C 001CCD2C 28A62072 */  paddub      $20, $17, $0
/* 0CCE30 001CCD30 0010428C */  lw          $2, 0x1000($2)
/* 0CCE34 001CCD34 180054C4 */  lwc1        $f20, 0x18($2)
/* 0CCE38 001CCD38 1010A426 */  addiu       $4, $21, 0x1010
/* 0CCE3C 001CCD3C 282E4072 */  paddub      $5, $18, $0
/* 0CCE40 001CCD40 648D040C */  jal         DistVector__FPfPf
/* 0CCE44 001CCD44 00000000 */   nop
/* 0CCE48 001CCD48 36001446 */  c.le.s      $f0, $f20
/* 0CCE4C 001CCD4C 00000000 */  nop
/* 0CCE50 001CCD50 09000045 */  bc1f        .L001CCD78
/* 0CCE54 001CCD54 00000000 */   nop
/* 0CCE58 001CCD58 0000828E */  lw          $2, 0x0($20)
/* 0CCE5C 001CCD5C 2C00438C */  lw          $3, 0x2C($2)
/* 0CCE60 001CCD60 FFFF0224 */  addiu       $2, $0, -0x1
/* 0CCE64 001CCD64 04006214 */  bne         $3, $2, .L001CCD78
/* 0CCE68 001CCD68 00000000 */   nop
/* 0CCE6C 001CCD6C 28162072 */  paddub      $2, $17, $0
/* 0CCE70 001CCD70 0E000010 */  b           .L001CCDAC
/* 0CCE74 001CCD74 00000000 */   nop
.L001CCD78:
/* 0CCE78 001CCD78 28266072 */  paddub      $4, $19, $0
/* 0CCE7C 001CCD7C 282E0072 */  paddub      $5, $16, $0
/* 0CCE80 001CCD80 E832070C */  jal         CheckCollisionDataHit__16CDungeonEventManFi
/* 0CCE84 001CCD84 00000000 */   nop
/* 0CCE88 001CCD88 03004010 */  beqz        $2, .L001CCD98
/* 0CCE8C 001CCD8C 00000000 */   nop
/* 0CCE90 001CCD90 06000010 */  b           .L001CCDAC
/* 0CCE94 001CCD94 00000000 */   nop
.L001CCD98:
/* 0CCE98 001CCD98 01001026 */  addiu       $16, $16, 0x1
.L001CCD9C:
/* 0CCE9C 001CCD9C 6000022A */  slti        $2, $16, 0x60
/* 0CCEA0 001CCDA0 D9FF4014 */  bnez        $2, .L001CCD08
/* 0CCEA4 001CCDA4 00000000 */   nop
/* 0CCEA8 001CCDA8 28160070 */  paddub      $2, $0, $0
.L001CCDAC:
/* 0CCEAC 001CCDAC 7000BF7B */  lq          $31, 0x70($29)
/* 0CCEB0 001CCDB0 6000B57B */  lq          $21, 0x60($29)
/* 0CCEB4 001CCDB4 5000B47B */  lq          $20, 0x50($29)
/* 0CCEB8 001CCDB8 4000B37B */  lq          $19, 0x40($29)
/* 0CCEBC 001CCDBC 3000B27B */  lq          $18, 0x30($29)
/* 0CCEC0 001CCDC0 2000B17B */  lq          $17, 0x20($29)
/* 0CCEC4 001CCDC4 1000B07B */  lq          $16, 0x10($29)
/* 0CCEC8 001CCDC8 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0CCECC 001CCDCC 8000BD27 */  addiu       $29, $29, 0x80
/* 0CCED0 001CCDD0 0800E003 */  jr          $31
/* 0CCED4 001CCDD4 00000000 */   nop
/* 0CCED8 001CCDD8 00000000 */  nop
/* 0CCEDC 001CCDDC 00000000 */  nop
