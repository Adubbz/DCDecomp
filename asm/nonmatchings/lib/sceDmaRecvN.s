.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaRecvN
/* CB68 0010CA68 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* CB6C 0010CA6C 4000B4FF */  sd         $20, 0x40($sp)
/* CB70 0010CA70 3000B3FF */  sd         $19, 0x30($sp)
/* CB74 0010CA74 2DA0C000 */  daddu      $20, $6, $0
/* CB78 0010CA78 1000B1FF */  sd         $17, 0x10($sp)
/* CB7C 0010CA7C 2D98A000 */  daddu      $19, $5, $0
/* CB80 0010CA80 0000B0FF */  sd         $16, 0x0($sp)
/* CB84 0010CA84 0001113C */  lui        $17, %hi(GlobalDataBuffer + 0xD54F7F)
/* CB88 0010CA88 5000BFFF */  sd         $31, 0x50($sp)
/* CB8C 0010CA8C 2D808000 */  daddu      $16, $4, $0
/* CB90 0010CA90 2000B2FF */  sd         $18, 0x20($sp)
/* CB94 0010CA94 0000028E */  lw         $2, 0x0($16)
/* CB98 0010CA98 00014230 */  andi       $2, $2, 0x100
/* CB9C 0010CA9C 18004010 */  beqz       $2, .L0010CB00
/* CBA0 0010CAA0 2900123C */   lui       $18, %hi(D_002973B0)
/* CBA4 0010CAA4 FFFF3126 */  addiu      $17, $17, %lo(GlobalDataBuffer + (0xD54F7F & 0xFFFF))
.L0010CAA8:
/* CBA8 0010CAA8 11002106 */  bgez       $17, .L0010CAF0
/* CBAC 0010CAAC 00000000 */   nop
/* CBB0 0010CAB0 A611040C */  jal        printf
/* CBB4 0010CAB4 B0734426 */   addiu     $4, $18, %lo(D_002973B0)
/* CBB8 0010CAB8 0000048E */  lw         $4, 0x0($16)
/* CBBC 0010CABC 02120400 */  srl        $2, $4, 8
/* CBC0 0010CAC0 01004230 */  andi       $2, $2, 0x1
/* CBC4 0010CAC4 0A004010 */  beqz       $2, .L0010CAF0
/* CBC8 0010CAC8 00000000 */   nop
/* CBCC 0010CACC FFFE0524 */  addiu      $5, $0, -0x101
.L0010CAD0:
/* CBD0 0010CAD0 24188500 */  and        $3, $4, $5
/* CBD4 0010CAD4 2D100000 */  daddu      $2, $0, $0
/* CBD8 0010CAD8 2D206000 */  daddu      $4, $3, $0
/* CBDC 0010CADC 00000000 */  nop
/* CBE0 0010CAE0 00000000 */  nop
/* CBE4 0010CAE4 FAFF4014 */  bnez       $2, .L0010CAD0
/* CBE8 0010CAE8 00000000 */   nop
/* CBEC 0010CAEC 000003AE */  sw         $3, 0x0($16)
.L0010CAF0:
/* CBF0 0010CAF0 0000028E */  lw         $2, 0x0($16)
/* CBF4 0010CAF4 00014230 */  andi       $2, $2, 0x100
/* CBF8 0010CAF8 EBFF4014 */  bnez       $2, .L0010CAA8
/* CBFC 0010CAFC FFFF3126 */   addiu     $17, $17, -0x1
.L0010CB00:
/* CC00 0010CB00 FFFF023C */  lui        $2, (0xFFFFFFFF >> 16)
/* CC04 0010CB04 1000038E */  lw         $3, 0x10($16)
/* CC08 0010CB08 FFFF4234 */  ori        $2, $2, (0xFFFFFFFF & 0xFFFF)
/* CC0C 0010CB0C 01006254 */  bnel       $3, $2, .L0010CB14
/* CC10 0010CB10 100013AE */   sw        $19, 0x10($16)
.L0010CB14:
/* CC14 0010CB14 0000028E */  lw         $2, 0x0($16)
/* CC18 0010CB18 F3FF0324 */  addiu      $3, $0, -0xD
/* CC1C 0010CB1C FEFF0424 */  addiu      $4, $0, -0x2
/* CC20 0010CB20 200014AE */  sw         $20, 0x20($16)
/* CC24 0010CB24 24104300 */  and        $2, $2, $3
/* CC28 0010CB28 5000BFDF */  ld         $31, 0x50($sp)
/* CC2C 0010CB2C 24104400 */  and        $2, $2, $4
/* CC30 0010CB30 4000B4DF */  ld         $20, 0x40($sp)
/* CC34 0010CB34 00014234 */  ori        $2, $2, 0x100
/* CC38 0010CB38 3000B3DF */  ld         $19, 0x30($sp)
/* CC3C 0010CB3C 000002AE */  sw         $2, 0x0($16)
/* CC40 0010CB40 2000B2DF */  ld         $18, 0x20($sp)
/* CC44 0010CB44 1000B1DF */  ld         $17, 0x10($sp)
/* CC48 0010CB48 0000B0DF */  ld         $16, 0x0($sp)
/* CC4C 0010CB4C 0800E003 */  jr         $31
/* CC50 0010CB50 6000BD27 */   addiu     $sp, $sp, 0x60
/* CC54 0010CB54 00000000 */  nop
