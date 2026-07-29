.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDmaRecvN
/* 00CB68 0010CA68 A0FFBD27 */  addiu       $29, $29, -0x60
/* 00CB6C 0010CA6C 4000B4FF */  sd          $20, 0x40($29)
/* 00CB70 0010CA70 3000B3FF */  sd          $19, 0x30($29)
/* 00CB74 0010CA74 2DA0C000 */  daddu       $20, $6, $0
/* 00CB78 0010CA78 1000B1FF */  sd          $17, 0x10($29)
/* 00CB7C 0010CA7C 2D98A000 */  daddu       $19, $5, $0
/* 00CB80 0010CA80 0000B0FF */  sd          $16, 0x0($29)
/* 00CB84 0010CA84 0001113C */  lui         $17, %hi(GlobalDataBuffer + 0xD54F7F)
/* 00CB88 0010CA88 5000BFFF */  sd          $31, 0x50($29)
/* 00CB8C 0010CA8C 2D808000 */  daddu       $16, $4, $0
/* 00CB90 0010CA90 2000B2FF */  sd          $18, 0x20($29)
/* 00CB94 0010CA94 0000028E */  lw          $2, 0x0($16)
/* 00CB98 0010CA98 00014230 */  andi        $2, $2, 0x100
/* 00CB9C 0010CA9C 18004010 */  beqz        $2, .L0010CB00
/* 00CBA0 0010CAA0 2900123C */   lui        $18, %hi(RO_002973B0)
/* 00CBA4 0010CAA4 FFFF3126 */  addiu       $17, $17, %lo(GlobalDataBuffer + 0xD54F7F)
.L0010CAA8:
/* 00CBA8 0010CAA8 11002106 */  bgez        $17, .L0010CAF0
/* 00CBAC 0010CAAC 00000000 */   nop
/* 00CBB0 0010CAB0 A611040C */  jal         printf
/* 00CBB4 0010CAB4 B0734426 */   addiu      $4, $18, %lo(RO_002973B0)
/* 00CBB8 0010CAB8 0000048E */  lw          $4, 0x0($16)
/* 00CBBC 0010CABC 02120400 */  srl         $2, $4, 8
/* 00CBC0 0010CAC0 01004230 */  andi        $2, $2, 0x1
/* 00CBC4 0010CAC4 0A004010 */  beqz        $2, .L0010CAF0
/* 00CBC8 0010CAC8 00000000 */   nop
/* 00CBCC 0010CACC FFFE0524 */  addiu       $5, $0, -0x101
.L0010CAD0:
/* 00CBD0 0010CAD0 24188500 */  and         $3, $4, $5
/* 00CBD4 0010CAD4 2D100000 */  daddu       $2, $0, $0
/* 00CBD8 0010CAD8 2D206000 */  daddu       $4, $3, $0
/* 00CBDC 0010CADC 00000000 */  nop
/* 00CBE0 0010CAE0 00000000 */  nop
/* 00CBE4 0010CAE4 FAFF4014 */  bnez        $2, .L0010CAD0
/* 00CBE8 0010CAE8 00000000 */   nop
/* 00CBEC 0010CAEC 000003AE */  sw          $3, 0x0($16)
.L0010CAF0:
/* 00CBF0 0010CAF0 0000028E */  lw          $2, 0x0($16)
/* 00CBF4 0010CAF4 00014230 */  andi        $2, $2, 0x100
/* 00CBF8 0010CAF8 EBFF4014 */  bnez        $2, .L0010CAA8
/* 00CBFC 0010CAFC FFFF3126 */   addiu      $17, $17, -0x1
.L0010CB00:
/* 00CC00 0010CB00 FFFF023C */  lui         $2, (0xFFFFFFFF >> 16)
/* 00CC04 0010CB04 1000038E */  lw          $3, 0x10($16)
/* 00CC08 0010CB08 FFFF4234 */  ori         $2, $2, (0xFFFFFFFF & 0xFFFF)
/* 00CC0C 0010CB0C 01006254 */  bnel        $3, $2, .L0010CB14
/* 00CC10 0010CB10 100013AE */   sw         $19, 0x10($16)
.L0010CB14:
/* 00CC14 0010CB14 0000028E */  lw          $2, 0x0($16)
/* 00CC18 0010CB18 F3FF0324 */  addiu       $3, $0, -0xD
/* 00CC1C 0010CB1C FEFF0424 */  addiu       $4, $0, -0x2
/* 00CC20 0010CB20 200014AE */  sw          $20, 0x20($16)
/* 00CC24 0010CB24 24104300 */  and         $2, $2, $3
/* 00CC28 0010CB28 5000BFDF */  ld          $31, 0x50($29)
/* 00CC2C 0010CB2C 24104400 */  and         $2, $2, $4
/* 00CC30 0010CB30 4000B4DF */  ld          $20, 0x40($29)
/* 00CC34 0010CB34 00014234 */  ori         $2, $2, 0x100
/* 00CC38 0010CB38 3000B3DF */  ld          $19, 0x30($29)
/* 00CC3C 0010CB3C 000002AE */  sw          $2, 0x0($16)
/* 00CC40 0010CB40 2000B2DF */  ld          $18, 0x20($29)
/* 00CC44 0010CB44 1000B1DF */  ld          $17, 0x10($29)
/* 00CC48 0010CB48 0000B0DF */  ld          $16, 0x0($29)
/* 00CC4C 0010CB4C 0800E003 */  jr          $31
/* 00CC50 0010CB50 6000BD27 */   addiu      $29, $29, 0x60
/* 00CC54 0010CB54 00000000 */  nop
