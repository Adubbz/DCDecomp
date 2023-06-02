.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaSync
/* CD58 0010CC58 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* CD5C 0010CC5C 01000224 */  addiu      $2, $0, 0x1
/* CD60 0010CC60 1000B1FF */  sd         $17, 0x10($sp)
/* CD64 0010CC64 0000B0FF */  sd         $16, 0x0($sp)
/* CD68 0010CC68 2D888000 */  daddu      $17, $4, $0
/* CD6C 0010CC6C 3000BFFF */  sd         $31, 0x30($sp)
/* CD70 0010CC70 2D80C000 */  daddu      $16, $6, $0
/* CD74 0010CC74 0500A214 */  bne        $5, $2, .L0010CC8C
/* CD78 0010CC78 2000B2FF */   sd        $18, 0x20($sp)
/* CD7C 0010CC7C 0000228E */  lw         $2, 0x0($17)
/* CD80 0010CC80 02120200 */  srl        $2, $2, 8
/* CD84 0010CC84 1F000010 */  b          .L0010CD04
/* CD88 0010CC88 01004230 */   andi      $2, $2, 0x1
.L0010CC8C:
/* CD8C 0010CC8C 0000228E */  lw         $2, 0x0($17)
/* CD90 0010CC90 0001033C */  lui        $3, (0x1000000 >> 16)
/* CD94 0010CC94 00014230 */  andi       $2, $2, 0x100
/* CD98 0010CC98 19004010 */  beqz       $2, .L0010CD00
/* CD9C 0010CC9C 0A807000 */   movz      $16, $3, $16
/* CDA0 0010CCA0 2900123C */  lui        $18, %hi(D_002973B0)
/* CDA4 0010CCA4 FFFF1026 */  addiu      $16, $16, -0x1
.L0010CCA8:
/* CDA8 0010CCA8 11000106 */  bgez       $16, .L0010CCF0
/* CDAC 0010CCAC 00000000 */   nop
/* CDB0 0010CCB0 A611040C */  jal        printf
/* CDB4 0010CCB4 B0734426 */   addiu     $4, $18, %lo(D_002973B0)
/* CDB8 0010CCB8 0000248E */  lw         $4, 0x0($17)
/* CDBC 0010CCBC 02120400 */  srl        $2, $4, 8
/* CDC0 0010CCC0 01004230 */  andi       $2, $2, 0x1
/* CDC4 0010CCC4 0A004010 */  beqz       $2, .L0010CCF0
/* CDC8 0010CCC8 00000000 */   nop
/* CDCC 0010CCCC FFFE0524 */  addiu      $5, $0, -0x101
.L0010CCD0:
/* CDD0 0010CCD0 24188500 */  and        $3, $4, $5
/* CDD4 0010CCD4 2D100000 */  daddu      $2, $0, $0
/* CDD8 0010CCD8 2D206000 */  daddu      $4, $3, $0
/* CDDC 0010CCDC 00000000 */  nop
/* CDE0 0010CCE0 00000000 */  nop
/* CDE4 0010CCE4 FAFF4014 */  bnez       $2, .L0010CCD0
/* CDE8 0010CCE8 00000000 */   nop
/* CDEC 0010CCEC 000023AE */  sw         $3, 0x0($17)
.L0010CCF0:
/* CDF0 0010CCF0 0000228E */  lw         $2, 0x0($17)
/* CDF4 0010CCF4 00014230 */  andi       $2, $2, 0x100
/* CDF8 0010CCF8 EBFF4014 */  bnez       $2, .L0010CCA8
/* CDFC 0010CCFC FFFF1026 */   addiu     $16, $16, -0x1
.L0010CD00:
/* CE00 0010CD00 2D100000 */  daddu      $2, $0, $0
.L0010CD04:
/* CE04 0010CD04 3000BFDF */  ld         $31, 0x30($sp)
/* CE08 0010CD08 2000B2DF */  ld         $18, 0x20($sp)
/* CE0C 0010CD0C 1000B1DF */  ld         $17, 0x10($sp)
/* CE10 0010CD10 0000B0DF */  ld         $16, 0x0($sp)
/* CE14 0010CD14 0800E003 */  jr         $31
/* CE18 0010CD18 4000BD27 */   addiu     $sp, $sp, 0x40
/* CE1C 0010CD1C 00000000 */  nop
