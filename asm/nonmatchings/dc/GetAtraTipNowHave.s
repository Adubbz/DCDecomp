.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAtraTipNowHave__Fii
/* 12AB40 0022AA40 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 12AB44 0022AA44 5000BF7F */  sq         $31, 0x50($sp)
/* 12AB48 0022AA48 4000B47F */  sq         $20, 0x40($sp)
/* 12AB4C 0022AA4C 3000B37F */  sq         $19, 0x30($sp)
/* 12AB50 0022AA50 2000B27F */  sq         $18, 0x20($sp)
/* 12AB54 0022AA54 1000B17F */  sq         $17, 0x10($sp)
/* 12AB58 0022AA58 0000B07F */  sq         $16, 0x0($sp)
/* 12AB5C 0022AA5C 28A68070 */  paddub     $20, $4, $0
/* 12AB60 0022AA60 289EA070 */  paddub     $19, $5, $0
/* 12AB64 0022AA64 28860070 */  paddub     $16, $0, $0
/* 12AB68 0022AA68 2800812A */  slti       $at, $20, 0x28
/* 12AB6C 0022AA6C 0D002010 */  beqz       $at, .L0022AAA4
/* 12AB70 0022AA70 00000000 */   nop
/* 12AB74 0022AA74 1C8D848F */  lw         $4, -0x72E4($gp)
/* 12AB78 0022AA78 28368072 */  paddub     $6, $20, $0
/* 12AB7C 0022AA7C FC5F050C */  jal        GetEditPartsInfo__9CSaveDataFii
/* 12AB80 0022AA80 00000000 */   nop
/* 12AB84 0022AA84 43004010 */  beqz       $2, .L0022AB94
/* 12AB88 0022AA88 00000000 */   nop
/* 12AB8C 0022AA8C 04004284 */  lh         $2, 0x4($2)
/* 12AB90 0022AA90 40004010 */  beqz       $2, .L0022AB94
/* 12AB94 0022AA94 00000000 */   nop
/* 12AB98 0022AA98 01001024 */  addiu      $16, $0, 0x1
/* 12AB9C 0022AA9C 3D000010 */  b          .L0022AB94
/* 12ABA0 0022AAA0 00000000 */   nop
.L0022AAA4:
/* 12ABA4 0022AAA4 1C8D848F */  lw         $4, -0x72E4($gp)
/* 12ABA8 0022AAA8 6860050C */  jal        GetElemData__9CSaveDataFi
/* 12ABAC 0022AAAC 00000000 */   nop
/* 12ABB0 0022AAB0 282E0070 */  paddub     $5, $0, $0
/* 12ABB4 0022AAB4 0A000010 */  b          .L0022AAE0
/* 12ABB8 0022AAB8 00000000 */   nop
.L0022AABC:
/* 12ABBC 0022AABC 00004484 */  lh         $4, 0x0($2)
/* 12ABC0 0022AAC0 D8FF8326 */  addiu      $3, $20, -0x28
/* 12ABC4 0022AAC4 04008314 */  bne        $4, $3, .L0022AAD8
/* 12ABC8 0022AAC8 00000000 */   nop
/* 12ABCC 0022AACC 01001024 */  addiu      $16, $0, 0x1
/* 12ABD0 0022AAD0 06000010 */  b          .L0022AAEC
/* 12ABD4 0022AAD4 00000000 */   nop
.L0022AAD8:
/* 12ABD8 0022AAD8 0100A524 */  addiu      $5, $5, 0x1
/* 12ABDC 0022AADC 02004224 */  addiu      $2, $2, 0x2
.L0022AAE0:
/* 12ABE0 0022AAE0 8000A328 */  slti       $3, $5, 0x80
/* 12ABE4 0022AAE4 F5FF6014 */  bnez       $3, .L0022AABC
/* 12ABE8 0022AAE8 00000000 */   nop
.L0022AAEC:
/* 12ABEC 0022AAEC 29000016 */  bnez       $16, .L0022AB94
/* 12ABF0 0022AAF0 00000000 */   nop
/* 12ABF4 0022AAF4 288E0070 */  paddub     $17, $0, $0
/* 12ABF8 0022AAF8 23000010 */  b          .L0022AB88
/* 12ABFC 0022AAFC 00000000 */   nop
.L0022AB00:
/* 12AC00 0022AB00 1C8D848F */  lw         $4, -0x72E4($gp)
/* 12AC04 0022AB04 282E6072 */  paddub     $5, $19, $0
/* 12AC08 0022AB08 28362072 */  paddub     $6, $17, $0
/* 12AC0C 0022AB0C FC5F050C */  jal        GetEditPartsInfo__9CSaveDataFii
/* 12AC10 0022AB10 00000000 */   nop
/* 12AC14 0022AB14 28964070 */  paddub     $18, $2, $0
/* 12AC18 0022AB18 28266072 */  paddub     $4, $19, $0
/* 12AC1C 0022AB1C 282E2072 */  paddub     $5, $17, $0
/* 12AC20 0022AB20 8063050C */  jal        GetEditAtraPartsData__Fii
/* 12AC24 0022AB24 00000000 */   nop
/* 12AC28 0022AB28 28260070 */  paddub     $4, $0, $0
/* 12AC2C 0022AB2C 12000010 */  b          .L0022AB78
/* 12AC30 0022AB30 00000000 */   nop
.L0022AB34:
/* 12AC34 0022AB34 C0180400 */  sll        $3, $4, 3
/* 12AC38 0022AB38 23186400 */  subu       $3, $3, $4
/* 12AC3C 0022AB3C 80180300 */  sll        $3, $3, 2
/* 12AC40 0022AB40 21184300 */  addu       $3, $2, $3
/* 12AC44 0022AB44 1400658C */  lw         $5, 0x14($3)
/* 12AC48 0022AB48 0A00A004 */  bltz       $5, .L0022AB74
/* 12AC4C 0022AB4C 00000000 */   nop
/* 12AC50 0022AB50 D8FF8326 */  addiu      $3, $20, -0x28
/* 12AC54 0022AB54 0700A314 */  bne        $5, $3, .L0022AB74
/* 12AC58 0022AB58 00000000 */   nop
/* 12AC5C 0022AB5C 40180400 */  sll        $3, $4, 1
/* 12AC60 0022AB60 21187200 */  addu       $3, $3, $18
/* 12AC64 0022AB64 0A006384 */  lh         $3, 0xA($3)
/* 12AC68 0022AB68 02006010 */  beqz       $3, .L0022AB74
/* 12AC6C 0022AB6C 00000000 */   nop
/* 12AC70 0022AB70 01001024 */  addiu      $16, $0, 0x1
.L0022AB74:
/* 12AC74 0022AB74 01008424 */  addiu      $4, $4, 0x1
.L0022AB78:
/* 12AC78 0022AB78 06008328 */  slti       $3, $4, 0x6
/* 12AC7C 0022AB7C EDFF6014 */  bnez       $3, .L0022AB34
/* 12AC80 0022AB80 00000000 */   nop
/* 12AC84 0022AB84 01003126 */  addiu      $17, $17, 0x1
.L0022AB88:
/* 12AC88 0022AB88 1800222A */  slti       $2, $17, 0x18
/* 12AC8C 0022AB8C DCFF4014 */  bnez       $2, .L0022AB00
/* 12AC90 0022AB90 00000000 */   nop
.L0022AB94:
/* 12AC94 0022AB94 28160072 */  paddub     $2, $16, $0
/* 12AC98 0022AB98 5000BF7B */  lq         $31, 0x50($sp)
/* 12AC9C 0022AB9C 4000B47B */  lq         $20, 0x40($sp)
/* 12ACA0 0022ABA0 3000B37B */  lq         $19, 0x30($sp)
/* 12ACA4 0022ABA4 2000B27B */  lq         $18, 0x20($sp)
/* 12ACA8 0022ABA8 1000B17B */  lq         $17, 0x10($sp)
/* 12ACAC 0022ABAC 0000B07B */  lq         $16, 0x0($sp)
/* 12ACB0 0022ABB0 6000BD27 */  addiu      $sp, $sp, 0x60
/* 12ACB4 0022ABB4 0800E003 */  jr         $31
/* 12ACB8 0022ABB8 00000000 */   nop
/* 12ACBC 0022ABBC 00000000 */  nop
