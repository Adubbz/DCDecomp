.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetInfoData__9CMapPartsFii
/* 9ABE0 0019AAE0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 9ABE4 0019AAE4 5000BF7F */  sq         $31, 0x50($sp)
/* 9ABE8 0019AAE8 4000B47F */  sq         $20, 0x40($sp)
/* 9ABEC 0019AAEC 3000B37F */  sq         $19, 0x30($sp)
/* 9ABF0 0019AAF0 2000B27F */  sq         $18, 0x20($sp)
/* 9ABF4 0019AAF4 1000B17F */  sq         $17, 0x10($sp)
/* 9ABF8 0019AAF8 0000B07F */  sq         $16, 0x0($sp)
/* 9ABFC 0019AAFC 289E8070 */  paddub     $19, $4, $0
/* 9AC00 0019AB00 2896A070 */  paddub     $18, $5, $0
/* 9AC04 0019AB04 288EC070 */  paddub     $17, $6, $0
/* 9AC08 0019AB08 0801828C */  lw         $2, 0x108($4)
/* 9AC0C 0019AB0C 04004014 */  bnez       $2, .L0019AB20
/* 9AC10 0019AB10 00000000 */   nop
/* 9AC14 0019AB14 28160070 */  paddub     $2, $0, $0
/* 9AC18 0019AB18 40000010 */  b          .L0019AC1C
/* 9AC1C 0019AB1C 00000000 */   nop
.L0019AB20:
/* 9AC20 0019AB20 28A60070 */  paddub     $20, $0, $0
/* 9AC24 0019AB24 886A060C */  jal        GetWidth__9CMapPartsFv
/* 9AC28 0019AB28 00000000 */   nop
/* 9AC2C 0019AB2C 28864070 */  paddub     $16, $2, $0
/* 9AC30 0019AB30 28266072 */  paddub     $4, $19, $0
/* 9AC34 0019AB34 A06A060C */  jal        GetHeight__9CMapPartsFv
/* 9AC38 0019AB38 00000000 */   nop
/* 9AC3C 0019AB3C F800648E */  lw         $4, 0xF8($19)
/* 9AC40 0019AB40 02000324 */  addiu      $3, $0, 0x2
/* 9AC44 0019AB44 29008310 */  beq        $4, $3, .L0019ABEC
/* 9AC48 0019AB48 00000000 */   nop
/* 9AC4C 0019AB4C 01000324 */  addiu      $3, $0, 0x1
/* 9AC50 0019AB50 1C008310 */  beq        $4, $3, .L0019ABC4
/* 9AC54 0019AB54 00000000 */   nop
/* 9AC58 0019AB58 11008010 */  beqz       $4, .L0019ABA0
/* 9AC5C 0019AB5C 00000000 */   nop
/* 9AC60 0019AB60 FFFF0324 */  addiu      $3, $0, -0x1
/* 9AC64 0019AB64 03008310 */  beq        $4, $3, .L0019AB74
/* 9AC68 0019AB68 00000000 */   nop
/* 9AC6C 0019AB6C 2A000010 */  b          .L0019AC18
/* 9AC70 0019AB70 00000000 */   nop
.L0019AB74:
/* 9AC74 0019AB74 0801638E */  lw         $3, 0x108($19)
/* 9AC78 0019AB78 E400638C */  lw         $3, 0xE4($3)
/* 9AC7C 0019AB7C 3C00638C */  lw         $3, 0x3C($3)
/* 9AC80 0019AB80 21207100 */  addu       $4, $3, $17
/* 9AC84 0019AB84 23181202 */  subu       $3, $16, $18
/* 9AC88 0019AB88 FFFF6324 */  addiu      $3, $3, -0x1
/* 9AC8C 0019AB8C 18104300 */  mult       $2, $2, $3
/* 9AC90 0019AB90 21108200 */  addu       $2, $4, $2
/* 9AC94 0019AB94 00005490 */  lbu        $20, 0x0($2)
/* 9AC98 0019AB98 1F000010 */  b          .L0019AC18
/* 9AC9C 0019AB9C 00000000 */   nop
.L0019ABA0:
/* 9ACA0 0019ABA0 0801628E */  lw         $2, 0x108($19)
/* 9ACA4 0019ABA4 E400428C */  lw         $2, 0xE4($2)
/* 9ACA8 0019ABA8 3C00428C */  lw         $2, 0x3C($2)
/* 9ACAC 0019ABAC 21185200 */  addu       $3, $2, $18
/* 9ACB0 0019ABB0 18103002 */  mult       $2, $17, $16
/* 9ACB4 0019ABB4 21106200 */  addu       $2, $3, $2
/* 9ACB8 0019ABB8 00005490 */  lbu        $20, 0x0($2)
/* 9ACBC 0019ABBC 16000010 */  b          .L0019AC18
/* 9ACC0 0019ABC0 00000000 */   nop
.L0019ABC4:
/* 9ACC4 0019ABC4 0801638E */  lw         $3, 0x108($19)
/* 9ACC8 0019ABC8 E400638C */  lw         $3, 0xE4($3)
/* 9ACCC 0019ABCC 3C00648C */  lw         $4, 0x3C($3)
/* 9ACD0 0019ABD0 23185100 */  subu       $3, $2, $17
/* 9ACD4 0019ABD4 21186400 */  addu       $3, $3, $4
/* 9ACD8 0019ABD8 18104202 */  mult       $2, $18, $2
/* 9ACDC 0019ABDC 21104300 */  addu       $2, $2, $3
/* 9ACE0 0019ABE0 FFFF5490 */  lbu        $20, -0x1($2)
/* 9ACE4 0019ABE4 0C000010 */  b          .L0019AC18
/* 9ACE8 0019ABE8 00000000 */   nop
.L0019ABEC:
/* 9ACEC 0019ABEC 0801638E */  lw         $3, 0x108($19)
/* 9ACF0 0019ABF0 E400638C */  lw         $3, 0xE4($3)
/* 9ACF4 0019ABF4 3C00648C */  lw         $4, 0x3C($3)
/* 9ACF8 0019ABF8 23181202 */  subu       $3, $16, $18
/* 9ACFC 0019ABFC 21186400 */  addu       $3, $3, $4
/* 9AD00 0019AC00 23105100 */  subu       $2, $2, $17
/* 9AD04 0019AC04 FFFF4224 */  addiu      $2, $2, -0x1
/* 9AD08 0019AC08 18100202 */  mult       $2, $16, $2
/* 9AD0C 0019AC0C 21104300 */  addu       $2, $2, $3
/* 9AD10 0019AC10 FFFF5490 */  lbu        $20, -0x1($2)
/* 9AD14 0019AC14 00000000 */  nop
.L0019AC18:
/* 9AD18 0019AC18 28168072 */  paddub     $2, $20, $0
.L0019AC1C:
/* 9AD1C 0019AC1C 5000BF7B */  lq         $31, 0x50($sp)
/* 9AD20 0019AC20 4000B47B */  lq         $20, 0x40($sp)
/* 9AD24 0019AC24 3000B37B */  lq         $19, 0x30($sp)
/* 9AD28 0019AC28 2000B27B */  lq         $18, 0x20($sp)
/* 9AD2C 0019AC2C 1000B17B */  lq         $17, 0x10($sp)
/* 9AD30 0019AC30 0000B07B */  lq         $16, 0x0($sp)
/* 9AD34 0019AC34 6000BD27 */  addiu      $sp, $sp, 0x60
/* 9AD38 0019AC38 0800E003 */  jr         $31
/* 9AD3C 0019AC3C 00000000 */   nop
