.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaWatch
/* CE20 0010CD20 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* CE24 0010CD24 01000224 */  addiu      $2, $0, 0x1
/* CE28 0010CD28 2000B2FF */  sd         $18, 0x20($sp)
/* CE2C 0010CD2C 1000B1FF */  sd         $17, 0x10($sp)
/* CE30 0010CD30 2D90A000 */  daddu      $18, $5, $0
/* CE34 0010CD34 0000B0FF */  sd         $16, 0x0($sp)
/* CE38 0010CD38 2D888000 */  daddu      $17, $4, $0
/* CE3C 0010CD3C 4000BFFF */  sd         $31, 0x40($sp)
/* CE40 0010CD40 2D80E000 */  daddu      $16, $7, $0
/* CE44 0010CD44 0400C214 */  bne        $6, $2, .L0010CD58
/* CE48 0010CD48 3000B3FF */   sd        $19, 0x30($sp)
/* CE4C 0010CD4C 1000228E */  lw         $2, 0x10($17)
/* CE50 0010CD50 20000010 */  b          .L0010CDD4
/* CE54 0010CD54 2B105200 */   sltu      $2, $2, $18
.L0010CD58:
/* CE58 0010CD58 1000228E */  lw         $2, 0x10($17)
/* CE5C 0010CD5C 0001033C */  lui        $3, (0x1000000 >> 16)
/* CE60 0010CD60 2B105200 */  sltu       $2, $2, $18
/* CE64 0010CD64 1A004010 */  beqz       $2, .L0010CDD0
/* CE68 0010CD68 0A807000 */   movz      $16, $3, $16
/* CE6C 0010CD6C 2900133C */  lui        $19, %hi(D_002973B0)
/* CE70 0010CD70 FFFF1026 */  addiu      $16, $16, -0x1
/* CE74 0010CD74 00000000 */  nop
.L0010CD78:
/* CE78 0010CD78 11000106 */  bgez       $16, .L0010CDC0
/* CE7C 0010CD7C 00000000 */   nop
/* CE80 0010CD80 A611040C */  jal        printf
/* CE84 0010CD84 B0736426 */   addiu     $4, $19, %lo(D_002973B0)
/* CE88 0010CD88 0000248E */  lw         $4, 0x0($17)
/* CE8C 0010CD8C 02120400 */  srl        $2, $4, 8
/* CE90 0010CD90 01004230 */  andi       $2, $2, 0x1
/* CE94 0010CD94 0A004010 */  beqz       $2, .L0010CDC0
/* CE98 0010CD98 00000000 */   nop
/* CE9C 0010CD9C FFFE0524 */  addiu      $5, $0, -0x101
.L0010CDA0:
/* CEA0 0010CDA0 24188500 */  and        $3, $4, $5
/* CEA4 0010CDA4 2D100000 */  daddu      $2, $0, $0
/* CEA8 0010CDA8 2D206000 */  daddu      $4, $3, $0
/* CEAC 0010CDAC 00000000 */  nop
/* CEB0 0010CDB0 00000000 */  nop
/* CEB4 0010CDB4 FAFF4014 */  bnez       $2, .L0010CDA0
/* CEB8 0010CDB8 00000000 */   nop
/* CEBC 0010CDBC 000023AE */  sw         $3, 0x0($17)
.L0010CDC0:
/* CEC0 0010CDC0 1000228E */  lw         $2, 0x10($17)
/* CEC4 0010CDC4 2B105200 */  sltu       $2, $2, $18
/* CEC8 0010CDC8 EBFF4014 */  bnez       $2, .L0010CD78
/* CECC 0010CDCC FFFF1026 */   addiu     $16, $16, -0x1
.L0010CDD0:
/* CED0 0010CDD0 2D100000 */  daddu      $2, $0, $0
.L0010CDD4:
/* CED4 0010CDD4 4000BFDF */  ld         $31, 0x40($sp)
/* CED8 0010CDD8 3000B3DF */  ld         $19, 0x30($sp)
/* CEDC 0010CDDC 2000B2DF */  ld         $18, 0x20($sp)
/* CEE0 0010CDE0 1000B1DF */  ld         $17, 0x10($sp)
/* CEE4 0010CDE4 0000B0DF */  ld         $16, 0x0($sp)
/* CEE8 0010CDE8 0800E003 */  jr         $31
/* CEEC 0010CDEC 5000BD27 */   addiu     $sp, $sp, 0x50
