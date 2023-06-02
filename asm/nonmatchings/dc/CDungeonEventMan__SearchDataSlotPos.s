.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SearchDataSlotPos__16CDungeonEventManFPf
/* CCDD0 001CCCD0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* CCDD4 001CCCD4 7000BF7F */  sq         $31, 0x70($sp)
/* CCDD8 001CCCD8 6000B57F */  sq         $21, 0x60($sp)
/* CCDDC 001CCCDC 5000B47F */  sq         $20, 0x50($sp)
/* CCDE0 001CCCE0 4000B37F */  sq         $19, 0x40($sp)
/* CCDE4 001CCCE4 3000B27F */  sq         $18, 0x30($sp)
/* CCDE8 001CCCE8 2000B17F */  sq         $17, 0x20($sp)
/* CCDEC 001CCCEC 1000B07F */  sq         $16, 0x10($sp)
/* CCDF0 001CCCF0 0000B4E7 */  swc1       $f20, 0x0($sp)
/* CCDF4 001CCCF4 289E8070 */  paddub     $19, $4, $0
/* CCDF8 001CCCF8 2896A070 */  paddub     $18, $5, $0
/* CCDFC 001CCCFC 28860070 */  paddub     $16, $0, $0
/* CCE00 001CCD00 26000010 */  b          .L001CCD9C
/* CCE04 001CCD04 00000000 */   nop
.L001CCD08:
/* CCE08 001CCD08 80A11000 */  sll        $20, $16, 6
/* CCE0C 001CCD0C 21A87402 */  addu       $21, $19, $20
/* CCE10 001CCD10 0010B126 */  addiu      $17, $21, 0x1000
/* CCE14 001CCD14 28262072 */  paddub     $4, $17, $0
/* CCE18 001CCD18 2032070C */  jal        CheckSwitch__17CDungeonEventDataFv
/* CCE1C 001CCD1C 00000000 */   nop
/* CCE20 001CCD20 1D004010 */  beqz       $2, .L001CCD98
/* CCE24 001CCD24 00000000 */   nop
/* CCE28 001CCD28 2816A072 */  paddub     $2, $21, $0
/* CCE2C 001CCD2C 28A62072 */  paddub     $20, $17, $0
/* CCE30 001CCD30 0010428C */  lw         $2, 0x1000($2)
/* CCE34 001CCD34 180054C4 */  lwc1       $f20, 0x18($2)
/* CCE38 001CCD38 1010A426 */  addiu      $4, $21, 0x1010
/* CCE3C 001CCD3C 282E4072 */  paddub     $5, $18, $0
/* CCE40 001CCD40 648D040C */  jal        DistVector__FPfPf
/* CCE44 001CCD44 00000000 */   nop
/* CCE48 001CCD48 36001446 */  c.le.s     $f0, $f20
/* CCE4C 001CCD4C 00000000 */  nop
/* CCE50 001CCD50 09000045 */  bc1f       .L001CCD78
/* CCE54 001CCD54 00000000 */   nop
/* CCE58 001CCD58 0000828E */  lw         $2, 0x0($20)
/* CCE5C 001CCD5C 2C00438C */  lw         $3, 0x2C($2)
/* CCE60 001CCD60 FFFF0224 */  addiu      $2, $0, -0x1
/* CCE64 001CCD64 04006214 */  bne        $3, $2, .L001CCD78
/* CCE68 001CCD68 00000000 */   nop
/* CCE6C 001CCD6C 28162072 */  paddub     $2, $17, $0
/* CCE70 001CCD70 0E000010 */  b          .L001CCDAC
/* CCE74 001CCD74 00000000 */   nop
.L001CCD78:
/* CCE78 001CCD78 28266072 */  paddub     $4, $19, $0
/* CCE7C 001CCD7C 282E0072 */  paddub     $5, $16, $0
/* CCE80 001CCD80 E832070C */  jal        CheckCollisionDataHit__16CDungeonEventManFi
/* CCE84 001CCD84 00000000 */   nop
/* CCE88 001CCD88 03004010 */  beqz       $2, .L001CCD98
/* CCE8C 001CCD8C 00000000 */   nop
/* CCE90 001CCD90 06000010 */  b          .L001CCDAC
/* CCE94 001CCD94 00000000 */   nop
.L001CCD98:
/* CCE98 001CCD98 01001026 */  addiu      $16, $16, 0x1
.L001CCD9C:
/* CCE9C 001CCD9C 6000022A */  slti       $2, $16, 0x60
/* CCEA0 001CCDA0 D9FF4014 */  bnez       $2, .L001CCD08
/* CCEA4 001CCDA4 00000000 */   nop
/* CCEA8 001CCDA8 28160070 */  paddub     $2, $0, $0
.L001CCDAC:
/* CCEAC 001CCDAC 7000BF7B */  lq         $31, 0x70($sp)
/* CCEB0 001CCDB0 6000B57B */  lq         $21, 0x60($sp)
/* CCEB4 001CCDB4 5000B47B */  lq         $20, 0x50($sp)
/* CCEB8 001CCDB8 4000B37B */  lq         $19, 0x40($sp)
/* CCEBC 001CCDBC 3000B27B */  lq         $18, 0x30($sp)
/* CCEC0 001CCDC0 2000B17B */  lq         $17, 0x20($sp)
/* CCEC4 001CCDC4 1000B07B */  lq         $16, 0x10($sp)
/* CCEC8 001CCDC8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* CCECC 001CCDCC 8000BD27 */  addiu      $sp, $sp, 0x80
/* CCED0 001CCDD0 0800E003 */  jr         $31
/* CCED4 001CCDD4 00000000 */   nop
/* CCED8 001CCDD8 00000000 */  nop
/* CCEDC 001CCDDC 00000000 */  nop
