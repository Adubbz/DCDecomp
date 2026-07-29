.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckCollisionDataHit__16CDungeonEventManFi
/* 0CCCA0 001CCBA0 60FFBD27 */  addiu       $29, $29, -0xA0
/* 0CCCA4 001CCBA4 8000BF7F */  sq          $31, 0x80($29)
/* 0CCCA8 001CCBA8 7000B67F */  sq          $22, 0x70($29)
/* 0CCCAC 001CCBAC 6000B57F */  sq          $21, 0x60($29)
/* 0CCCB0 001CCBB0 5000B47F */  sq          $20, 0x50($29)
/* 0CCCB4 001CCBB4 4000B37F */  sq          $19, 0x40($29)
/* 0CCCB8 001CCBB8 3000B27F */  sq          $18, 0x30($29)
/* 0CCCBC 001CCBBC 2000B17F */  sq          $17, 0x20($29)
/* 0CCCC0 001CCBC0 1000B07F */  sq          $16, 0x10($29)
/* 0CCCC4 001CCBC4 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0CCCC8 001CCBC8 28AE8070 */  paddub      $21, $4, $0
/* 0CCCCC 001CCBCC 80990500 */  sll         $19, $5, 6
/* 0CCCD0 001CCBD0 21106402 */  addu        $2, $19, $4
/* 0CCCD4 001CCBD4 00105624 */  addiu       $22, $2, 0x1000
/* 0CCCD8 001CCBD8 0010428C */  lw          $2, 0x1000($2)
/* 0CCCDC 001CCBDC 2C00518C */  lw          $17, 0x2C($2)
/* 0CCCE0 001CCBE0 3000528C */  lw          $18, 0x30($2)
/* 0CCCE4 001CCBE4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0CCCE8 001CCBE8 2C002212 */  beq         $17, $2, .L001CCC9C
/* 0CCCEC 001CCBEC 00000000 */   nop
/* 0CCCF0 001CCBF0 28860070 */  paddub      $16, $0, $0
/* 0CCCF4 001CCBF4 26000010 */  b           .L001CCC90
/* 0CCCF8 001CCBF8 00000000 */   nop
.L001CCBFC:
/* 0CCCFC 001CCBFC F09D848F */  lw          $4, -0x6210($28)
/* 0CCD00 001CCC00 80181000 */  sll         $3, $16, 2
/* 0CCD04 001CCC04 21106400 */  addu        $2, $3, $4
/* 0CCD08 001CCC08 003C428C */  lw          $2, 0x3C00($2)
/* 0CCD0C 001CCC0C 1F004010 */  beqz        $2, .L001CCC8C
/* 0CCD10 001CCC10 00000000 */   nop
/* 0CCD14 001CCC14 21107000 */  addu        $2, $3, $16
/* 0CCD18 001CCC18 40290200 */  sll         $5, $2, 5
/* 0CCD1C 001CCC1C 2118A400 */  addu        $3, $5, $4
/* 0CCD20 001CCC20 5800628C */  lw          $2, 0x58($3)
/* 0CCD24 001CCC24 19002216 */  bne         $17, $2, .L001CCC8C
/* 0CCD28 001CCC28 00000000 */   nop
/* 0CCD2C 001CCC2C FFFF0224 */  addiu       $2, $0, -0x1
/* 0CCD30 001CCC30 04004212 */  beq         $18, $2, .L001CCC44
/* 0CCD34 001CCC34 00000000 */   nop
/* 0CCD38 001CCC38 6000628C */  lw          $2, 0x60($3)
/* 0CCD3C 001CCC3C 13004216 */  bne         $18, $2, .L001CCC8C
/* 0CCD40 001CCC40 00000000 */   nop
.L001CCC44:
/* 0CCD44 001CCC44 21288500 */  addu        $5, $4, $5
/* 0CCD48 001CCC48 9000A427 */  addiu       $4, $29, 0x90
/* 0CCD4C 001CCC4C 0C86040C */  jal         sceVu0CopyVector
/* 0CCD50 001CCC50 00000000 */   nop
/* 0CCD54 001CCC54 0000C28E */  lw          $2, 0x0($22)
/* 0CCD58 001CCC58 180054C4 */  lwc1        $f20, 0x18($2)
/* 0CCD5C 001CCC5C 21A0B302 */  addu        $20, $21, $19
/* 0CCD60 001CCC60 9000A427 */  addiu       $4, $29, 0x90
/* 0CCD64 001CCC64 10108526 */  addiu       $5, $20, 0x1010
/* 0CCD68 001CCC68 648D040C */  jal         DistVector__FPfPf
/* 0CCD6C 001CCC6C 00000000 */   nop
/* 0CCD70 001CCC70 36001446 */  c.le.s      $f0, $f20
/* 0CCD74 001CCC74 00000000 */  nop
/* 0CCD78 001CCC78 04000045 */  bc1f        .L001CCC8C
/* 0CCD7C 001CCC7C 00000000 */   nop
/* 0CCD80 001CCC80 00108226 */  addiu       $2, $20, 0x1000
/* 0CCD84 001CCC84 06000010 */  b           .L001CCCA0
/* 0CCD88 001CCC88 00000000 */   nop
.L001CCC8C:
/* 0CCD8C 001CCC8C 01001026 */  addiu       $16, $16, 0x1
.L001CCC90:
/* 0CCD90 001CCC90 6000022A */  slti        $2, $16, 0x60
/* 0CCD94 001CCC94 D9FF4014 */  bnez        $2, .L001CCBFC
/* 0CCD98 001CCC98 00000000 */   nop
.L001CCC9C:
/* 0CCD9C 001CCC9C 28160070 */  paddub      $2, $0, $0
.L001CCCA0:
/* 0CCDA0 001CCCA0 8000BF7B */  lq          $31, 0x80($29)
/* 0CCDA4 001CCCA4 7000B67B */  lq          $22, 0x70($29)
/* 0CCDA8 001CCCA8 6000B57B */  lq          $21, 0x60($29)
/* 0CCDAC 001CCCAC 5000B47B */  lq          $20, 0x50($29)
/* 0CCDB0 001CCCB0 4000B37B */  lq          $19, 0x40($29)
/* 0CCDB4 001CCCB4 3000B27B */  lq          $18, 0x30($29)
/* 0CCDB8 001CCCB8 2000B17B */  lq          $17, 0x20($29)
/* 0CCDBC 001CCCBC 1000B07B */  lq          $16, 0x10($29)
/* 0CCDC0 001CCCC0 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0CCDC4 001CCCC4 A000BD27 */  addiu       $29, $29, 0xA0
/* 0CCDC8 001CCCC8 0800E003 */  jr          $31
/* 0CCDCC 001CCCCC 00000000 */   nop
