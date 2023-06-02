.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckCollisionDataHit__16CDungeonEventManFi
/* CCCA0 001CCBA0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* CCCA4 001CCBA4 8000BF7F */  sq         $31, 0x80($sp)
/* CCCA8 001CCBA8 7000B67F */  sq         $22, 0x70($sp)
/* CCCAC 001CCBAC 6000B57F */  sq         $21, 0x60($sp)
/* CCCB0 001CCBB0 5000B47F */  sq         $20, 0x50($sp)
/* CCCB4 001CCBB4 4000B37F */  sq         $19, 0x40($sp)
/* CCCB8 001CCBB8 3000B27F */  sq         $18, 0x30($sp)
/* CCCBC 001CCBBC 2000B17F */  sq         $17, 0x20($sp)
/* CCCC0 001CCBC0 1000B07F */  sq         $16, 0x10($sp)
/* CCCC4 001CCBC4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* CCCC8 001CCBC8 28AE8070 */  paddub     $21, $4, $0
/* CCCCC 001CCBCC 80990500 */  sll        $19, $5, 6
/* CCCD0 001CCBD0 21106402 */  addu       $2, $19, $4
/* CCCD4 001CCBD4 00105624 */  addiu      $22, $2, 0x1000
/* CCCD8 001CCBD8 0010428C */  lw         $2, 0x1000($2)
/* CCCDC 001CCBDC 2C00518C */  lw         $17, 0x2C($2)
/* CCCE0 001CCBE0 3000528C */  lw         $18, 0x30($2)
/* CCCE4 001CCBE4 FFFF0224 */  addiu      $2, $0, -0x1
/* CCCE8 001CCBE8 2C002212 */  beq        $17, $2, .L001CCC9C
/* CCCEC 001CCBEC 00000000 */   nop
/* CCCF0 001CCBF0 28860070 */  paddub     $16, $0, $0
/* CCCF4 001CCBF4 26000010 */  b          .L001CCC90
/* CCCF8 001CCBF8 00000000 */   nop
.L001CCBFC:
/* CCCFC 001CCBFC F09D848F */  lw         $4, -0x6210($gp)
/* CCD00 001CCC00 80181000 */  sll        $3, $16, 2
/* CCD04 001CCC04 21106400 */  addu       $2, $3, $4
/* CCD08 001CCC08 003C428C */  lw         $2, 0x3C00($2)
/* CCD0C 001CCC0C 1F004010 */  beqz       $2, .L001CCC8C
/* CCD10 001CCC10 00000000 */   nop
/* CCD14 001CCC14 21107000 */  addu       $2, $3, $16
/* CCD18 001CCC18 40290200 */  sll        $5, $2, 5
/* CCD1C 001CCC1C 2118A400 */  addu       $3, $5, $4
/* CCD20 001CCC20 5800628C */  lw         $2, 0x58($3)
/* CCD24 001CCC24 19002216 */  bne        $17, $2, .L001CCC8C
/* CCD28 001CCC28 00000000 */   nop
/* CCD2C 001CCC2C FFFF0224 */  addiu      $2, $0, -0x1
/* CCD30 001CCC30 04004212 */  beq        $18, $2, .L001CCC44
/* CCD34 001CCC34 00000000 */   nop
/* CCD38 001CCC38 6000628C */  lw         $2, 0x60($3)
/* CCD3C 001CCC3C 13004216 */  bne        $18, $2, .L001CCC8C
/* CCD40 001CCC40 00000000 */   nop
.L001CCC44:
/* CCD44 001CCC44 21288500 */  addu       $5, $4, $5
/* CCD48 001CCC48 9000A427 */  addiu      $4, $sp, 0x90
/* CCD4C 001CCC4C 0C86040C */  jal        sceVu0CopyVector
/* CCD50 001CCC50 00000000 */   nop
/* CCD54 001CCC54 0000C28E */  lw         $2, 0x0($22)
/* CCD58 001CCC58 180054C4 */  lwc1       $f20, 0x18($2)
/* CCD5C 001CCC5C 21A0B302 */  addu       $20, $21, $19
/* CCD60 001CCC60 9000A427 */  addiu      $4, $sp, 0x90
/* CCD64 001CCC64 10108526 */  addiu      $5, $20, 0x1010
/* CCD68 001CCC68 648D040C */  jal        DistVector__FPfPf
/* CCD6C 001CCC6C 00000000 */   nop
/* CCD70 001CCC70 36001446 */  c.le.s     $f0, $f20
/* CCD74 001CCC74 00000000 */  nop
/* CCD78 001CCC78 04000045 */  bc1f       .L001CCC8C
/* CCD7C 001CCC7C 00000000 */   nop
/* CCD80 001CCC80 00108226 */  addiu      $2, $20, 0x1000
/* CCD84 001CCC84 06000010 */  b          .L001CCCA0
/* CCD88 001CCC88 00000000 */   nop
.L001CCC8C:
/* CCD8C 001CCC8C 01001026 */  addiu      $16, $16, 0x1
.L001CCC90:
/* CCD90 001CCC90 6000022A */  slti       $2, $16, 0x60
/* CCD94 001CCC94 D9FF4014 */  bnez       $2, .L001CCBFC
/* CCD98 001CCC98 00000000 */   nop
.L001CCC9C:
/* CCD9C 001CCC9C 28160070 */  paddub     $2, $0, $0
.L001CCCA0:
/* CCDA0 001CCCA0 8000BF7B */  lq         $31, 0x80($sp)
/* CCDA4 001CCCA4 7000B67B */  lq         $22, 0x70($sp)
/* CCDA8 001CCCA8 6000B57B */  lq         $21, 0x60($sp)
/* CCDAC 001CCCAC 5000B47B */  lq         $20, 0x50($sp)
/* CCDB0 001CCCB0 4000B37B */  lq         $19, 0x40($sp)
/* CCDB4 001CCCB4 3000B27B */  lq         $18, 0x30($sp)
/* CCDB8 001CCCB8 2000B17B */  lq         $17, 0x20($sp)
/* CCDBC 001CCCBC 1000B07B */  lq         $16, 0x10($sp)
/* CCDC0 001CCCC0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* CCDC4 001CCCC4 A000BD27 */  addiu      $sp, $sp, 0xA0
/* CCDC8 001CCCC8 0800E003 */  jr         $31
/* CCDCC 001CCCCC 00000000 */   nop
