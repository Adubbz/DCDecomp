.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaRecvI
/* CC58 0010CB58 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* CC5C 0010CB5C 4000B4FF */  sd         $20, 0x40($sp)
/* CC60 0010CB60 3000B3FF */  sd         $19, 0x30($sp)
/* CC64 0010CB64 2DA0C000 */  daddu      $20, $6, $0
/* CC68 0010CB68 1000B1FF */  sd         $17, 0x10($sp)
/* CC6C 0010CB6C 2D98A000 */  daddu      $19, $5, $0
/* CC70 0010CB70 0000B0FF */  sd         $16, 0x0($sp)
/* CC74 0010CB74 0001113C */  lui        $17, %hi(GlobalDataBuffer + 0xD54F7F)
/* CC78 0010CB78 5000BFFF */  sd         $31, 0x50($sp)
/* CC7C 0010CB7C 2D808000 */  daddu      $16, $4, $0
/* CC80 0010CB80 2000B2FF */  sd         $18, 0x20($sp)
/* CC84 0010CB84 0000028E */  lw         $2, 0x0($16)
/* CC88 0010CB88 00014230 */  andi       $2, $2, 0x100
/* CC8C 0010CB8C 18004010 */  beqz       $2, .L0010CBF0
/* CC90 0010CB90 2900123C */   lui       $18, %hi(D_002973B0)
/* CC94 0010CB94 FFFF3126 */  addiu      $17, $17, %lo(GlobalDataBuffer + (0xD54F7F & 0xFFFF))
.L0010CB98:
/* CC98 0010CB98 11002106 */  bgez       $17, .L0010CBE0
/* CC9C 0010CB9C 00000000 */   nop
/* CCA0 0010CBA0 A611040C */  jal        printf
/* CCA4 0010CBA4 B0734426 */   addiu     $4, $18, %lo(D_002973B0)
/* CCA8 0010CBA8 0000048E */  lw         $4, 0x0($16)
/* CCAC 0010CBAC 02120400 */  srl        $2, $4, 8
/* CCB0 0010CBB0 01004230 */  andi       $2, $2, 0x1
/* CCB4 0010CBB4 0A004010 */  beqz       $2, .L0010CBE0
/* CCB8 0010CBB8 00000000 */   nop
/* CCBC 0010CBBC FFFE0524 */  addiu      $5, $0, -0x101
.L0010CBC0:
/* CCC0 0010CBC0 24188500 */  and        $3, $4, $5
/* CCC4 0010CBC4 2D100000 */  daddu      $2, $0, $0
/* CCC8 0010CBC8 2D206000 */  daddu      $4, $3, $0
/* CCCC 0010CBCC 00000000 */  nop
/* CCD0 0010CBD0 00000000 */  nop
/* CCD4 0010CBD4 FAFF4014 */  bnez       $2, .L0010CBC0
/* CCD8 0010CBD8 00000000 */   nop
/* CCDC 0010CBDC 000003AE */  sw         $3, 0x0($16)
.L0010CBE0:
/* CCE0 0010CBE0 0000028E */  lw         $2, 0x0($16)
/* CCE4 0010CBE4 00014230 */  andi       $2, $2, 0x100
/* CCE8 0010CBE8 EBFF4014 */  bnez       $2, .L0010CB98
/* CCEC 0010CBEC FFFF3126 */   addiu     $17, $17, -0x1
.L0010CBF0:
/* CCF0 0010CBF0 FFFF023C */  lui        $2, (0xFFFFFFFF >> 16)
/* CCF4 0010CBF4 1000038E */  lw         $3, 0x10($16)
/* CCF8 0010CBF8 FFFF4234 */  ori        $2, $2, (0xFFFFFFFF & 0xFFFF)
/* CCFC 0010CBFC 01006254 */  bnel       $3, $2, .L0010CC04
/* CD00 0010CC00 100013AE */   sw        $19, 0x10($16)
.L0010CC04:
/* CD04 0010CC04 0000028E */  lw         $2, 0x0($16)
/* CD08 0010CC08 F3FF0324 */  addiu      $3, $0, -0xD
/* CD0C 0010CC0C FEFF0424 */  addiu      $4, $0, -0x2
/* CD10 0010CC10 200014AE */  sw         $20, 0x20($16)
/* CD14 0010CC14 24104300 */  and        $2, $2, $3
/* CD18 0010CC18 5000BFDF */  ld         $31, 0x50($sp)
/* CD1C 0010CC1C 08004234 */  ori        $2, $2, 0x8
/* CD20 0010CC20 4000B4DF */  ld         $20, 0x40($sp)
/* CD24 0010CC24 24104400 */  and        $2, $2, $4
/* CD28 0010CC28 3000B3DF */  ld         $19, 0x30($sp)
/* CD2C 0010CC2C 00014234 */  ori        $2, $2, 0x100
/* CD30 0010CC30 2000B2DF */  ld         $18, 0x20($sp)
/* CD34 0010CC34 000002AE */  sw         $2, 0x0($16)
/* CD38 0010CC38 1000B1DF */  ld         $17, 0x10($sp)
/* CD3C 0010CC3C 0000B0DF */  ld         $16, 0x0($sp)
/* CD40 0010CC40 0800E003 */  jr         $31
/* CD44 0010CC44 6000BD27 */   addiu     $sp, $sp, 0x60
