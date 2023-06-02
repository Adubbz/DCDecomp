.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetVisitInfo__Fii
/* 10AC00 0020AB00 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 10AC04 0020AB04 3000BF7F */  sq         $31, 0x30($sp)
/* 10AC08 0020AB08 2000B27F */  sq         $18, 0x20($sp)
/* 10AC0C 0020AB0C 1000B17F */  sq         $17, 0x10($sp)
/* 10AC10 0020AB10 0000B07F */  sq         $16, 0x0($sp)
/* 10AC14 0020AB14 288EA070 */  paddub     $17, $5, $0
/* 10AC18 0020AB18 40180400 */  sll        $3, $4, 1
/* 10AC1C 0020AB1C 2900023C */  lui        $2, %hi(MenuGrobalMapNoTbl)
/* 10AC20 0020AB20 A0354224 */  addiu      $2, $2, %lo(MenuGrobalMapNoTbl)
/* 10AC24 0020AB24 21104300 */  addu       $2, $2, $3
/* 10AC28 0020AB28 00005084 */  lh         $16, 0x0($2)
/* 10AC2C 0020AB2C C800022A */  slti       $2, $16, 0xC8
/* 10AC30 0020AB30 02004014 */  bnez       $2, .L0020AB3C
/* 10AC34 0020AB34 00000000 */   nop
/* 10AC38 0020AB38 38FF1026 */  addiu      $16, $16, -0xC8
.L0020AB3C:
/* 10AC3C 0020AB3C 0F000224 */  addiu      $2, $0, 0xF
/* 10AC40 0020AB40 1D008210 */  beq        $4, $2, .L0020ABB8
/* 10AC44 0020AB44 00000000 */   nop
/* 10AC48 0020AB48 0D000224 */  addiu      $2, $0, 0xD
/* 10AC4C 0020AB4C 1A008210 */  beq        $4, $2, .L0020ABB8
/* 10AC50 0020AB50 00000000 */   nop
/* 10AC54 0020AB54 0B000224 */  addiu      $2, $0, 0xB
/* 10AC58 0020AB58 17008210 */  beq        $4, $2, .L0020ABB8
/* 10AC5C 0020AB5C 00000000 */   nop
/* 10AC60 0020AB60 0A000224 */  addiu      $2, $0, 0xA
/* 10AC64 0020AB64 14008210 */  beq        $4, $2, .L0020ABB8
/* 10AC68 0020AB68 00000000 */   nop
/* 10AC6C 0020AB6C 08000224 */  addiu      $2, $0, 0x8
/* 10AC70 0020AB70 11008210 */  beq        $4, $2, .L0020ABB8
/* 10AC74 0020AB74 00000000 */   nop
/* 10AC78 0020AB78 07000224 */  addiu      $2, $0, 0x7
/* 10AC7C 0020AB7C 0E008210 */  beq        $4, $2, .L0020ABB8
/* 10AC80 0020AB80 00000000 */   nop
/* 10AC84 0020AB84 05000224 */  addiu      $2, $0, 0x5
/* 10AC88 0020AB88 0B008210 */  beq        $4, $2, .L0020ABB8
/* 10AC8C 0020AB8C 00000000 */   nop
/* 10AC90 0020AB90 04000224 */  addiu      $2, $0, 0x4
/* 10AC94 0020AB94 08008210 */  beq        $4, $2, .L0020ABB8
/* 10AC98 0020AB98 00000000 */   nop
/* 10AC9C 0020AB9C 02000224 */  addiu      $2, $0, 0x2
/* 10ACA0 0020ABA0 05008210 */  beq        $4, $2, .L0020ABB8
/* 10ACA4 0020ABA4 00000000 */   nop
/* 10ACA8 0020ABA8 03008010 */  beqz       $4, .L0020ABB8
/* 10ACAC 0020ABAC 00000000 */   nop
/* 10ACB0 0020ABB0 04000010 */  b          .L0020ABC4
/* 10ACB4 0020ABB4 00000000 */   nop
.L0020ABB8:
/* 10ACB8 0020ABB8 28160070 */  paddub     $2, $0, $0
/* 10ACBC 0020ABBC 02000010 */  b          .L0020ABC8
/* 10ACC0 0020ABC0 00000000 */   nop
.L0020ABC4:
/* 10ACC4 0020ABC4 01000224 */  addiu      $2, $0, 0x1
.L0020ABC8:
/* 10ACC8 0020ABC8 18004014 */  bnez       $2, .L0020AC2C
/* 10ACCC 0020ABCC 00000000 */   nop
/* 10ACD0 0020ABD0 D094848F */  lw         $4, -0x6B30($gp)
/* 10ACD4 0020ABD4 282E0072 */  paddub     $5, $16, $0
/* 10ACD8 0020ABD8 28360070 */  paddub     $6, $0, $0
/* 10ACDC 0020ABDC 0062050C */  jal        VisitMap__9CSaveDataFii
/* 10ACE0 0020ABE0 00000000 */   nop
/* 10ACE4 0020ABE4 28964070 */  paddub     $18, $2, $0
/* 10ACE8 0020ABE8 28262072 */  paddub     $4, $17, $0
/* 10ACEC 0020ABEC B02F080C */  jal        NowGetGameFlagForBtlMenu__Fi
/* 10ACF0 0020ABF0 00000000 */   nop
/* 10ACF4 0020ABF4 05000324 */  addiu      $3, $0, 0x5
/* 10ACF8 0020ABF8 06004310 */  beq        $2, $3, .L0020AC14
/* 10ACFC 0020ABFC 00000000 */   nop
/* 10AD00 0020AC00 01000324 */  addiu      $3, $0, 0x1
/* 10AD04 0020AC04 03004310 */  beq        $2, $3, .L0020AC14
/* 10AD08 0020AC08 00000000 */   nop
/* 10AD0C 0020AC0C 0D000010 */  b          .L0020AC44
/* 10AD10 0020AC10 00000000 */   nop
.L0020AC14:
/* 10AD14 0020AC14 01000224 */  addiu      $2, $0, 0x1
/* 10AD18 0020AC18 0A000216 */  bne        $16, $2, .L0020AC44
/* 10AD1C 0020AC1C 00000000 */   nop
/* 10AD20 0020AC20 28964070 */  paddub     $18, $2, $0
/* 10AD24 0020AC24 07000010 */  b          .L0020AC44
/* 10AD28 0020AC28 00000000 */   nop
.L0020AC2C:
/* 10AD2C 0020AC2C D094848F */  lw         $4, -0x6B30($gp)
/* 10AD30 0020AC30 282E0072 */  paddub     $5, $16, $0
/* 10AD34 0020AC34 28360070 */  paddub     $6, $0, $0
/* 10AD38 0020AC38 1C62050C */  jal        QuestDungeon__9CSaveDataFii
/* 10AD3C 0020AC3C 00000000 */   nop
/* 10AD40 0020AC40 28964070 */  paddub     $18, $2, $0
.L0020AC44:
/* 10AD44 0020AC44 28164072 */  paddub     $2, $18, $0
/* 10AD48 0020AC48 3000BF7B */  lq         $31, 0x30($sp)
/* 10AD4C 0020AC4C 2000B27B */  lq         $18, 0x20($sp)
/* 10AD50 0020AC50 1000B17B */  lq         $17, 0x10($sp)
/* 10AD54 0020AC54 0000B07B */  lq         $16, 0x0($sp)
/* 10AD58 0020AC58 4000BD27 */  addiu      $sp, $sp, 0x40
/* 10AD5C 0020AC5C 0800E003 */  jr         $31
/* 10AD60 0020AC60 00000000 */   nop
/* 10AD64 0020AC64 00000000 */  nop
/* 10AD68 0020AC68 00000000 */  nop
/* 10AD6C 0020AC6C 00000000 */  nop
