.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDmaRecv
/* 00CAA0 0010C9A0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 00CAA4 0010C9A4 1000B1FF */  sd          $17, 0x10($29)
/* 00CAA8 0010C9A8 0000B0FF */  sd          $16, 0x0($29)
/* 00CAAC 0010C9AC 0001113C */  lui         $17, %hi(GlobalDataBuffer + 0xD54F7F)
/* 00CAB0 0010C9B0 3000BFFF */  sd          $31, 0x30($29)
/* 00CAB4 0010C9B4 2D808000 */  daddu       $16, $4, $0
/* 00CAB8 0010C9B8 2000B2FF */  sd          $18, 0x20($29)
/* 00CABC 0010C9BC 0000028E */  lw          $2, 0x0($16)
/* 00CAC0 0010C9C0 00014230 */  andi        $2, $2, 0x100
/* 00CAC4 0010C9C4 18004010 */  beqz        $2, .L0010CA28
/* 00CAC8 0010C9C8 2900123C */   lui        $18, %hi(RO_002973B0)
/* 00CACC 0010C9CC FFFF3126 */  addiu       $17, $17, %lo(GlobalDataBuffer + 0xD54F7F)
.L0010C9D0:
/* 00CAD0 0010C9D0 11002106 */  bgez        $17, .L0010CA18
/* 00CAD4 0010C9D4 00000000 */   nop
/* 00CAD8 0010C9D8 A611040C */  jal         printf
/* 00CADC 0010C9DC B0734426 */   addiu      $4, $18, %lo(RO_002973B0)
/* 00CAE0 0010C9E0 0000048E */  lw          $4, 0x0($16)
/* 00CAE4 0010C9E4 02120400 */  srl         $2, $4, 8
/* 00CAE8 0010C9E8 01004230 */  andi        $2, $2, 0x1
/* 00CAEC 0010C9EC 0A004010 */  beqz        $2, .L0010CA18
/* 00CAF0 0010C9F0 00000000 */   nop
/* 00CAF4 0010C9F4 FFFE0524 */  addiu       $5, $0, -0x101
.L0010C9F8:
/* 00CAF8 0010C9F8 24188500 */  and         $3, $4, $5
/* 00CAFC 0010C9FC 2D100000 */  daddu       $2, $0, $0
/* 00CB00 0010CA00 2D206000 */  daddu       $4, $3, $0
/* 00CB04 0010CA04 00000000 */  nop
/* 00CB08 0010CA08 00000000 */  nop
/* 00CB0C 0010CA0C FAFF4014 */  bnez        $2, .L0010C9F8
/* 00CB10 0010CA10 00000000 */   nop
/* 00CB14 0010CA14 000003AE */  sw          $3, 0x0($16)
.L0010CA18:
/* 00CB18 0010CA18 0000028E */  lw          $2, 0x0($16)
/* 00CB1C 0010CA1C 00014230 */  andi        $2, $2, 0x100
/* 00CB20 0010CA20 EBFF4014 */  bnez        $2, .L0010C9D0
/* 00CB24 0010CA24 FFFF3126 */   addiu      $17, $17, -0x1
.L0010CA28:
/* 00CB28 0010CA28 0000028E */  lw          $2, 0x0($16)
/* 00CB2C 0010CA2C F3FF0324 */  addiu       $3, $0, -0xD
/* 00CB30 0010CA30 FEFF0424 */  addiu       $4, $0, -0x2
/* 00CB34 0010CA34 200000AE */  sw          $0, 0x20($16)
/* 00CB38 0010CA38 24104300 */  and         $2, $2, $3
/* 00CB3C 0010CA3C 3000BFDF */  ld          $31, 0x30($29)
/* 00CB40 0010CA40 04004234 */  ori         $2, $2, 0x4
/* 00CB44 0010CA44 2000B2DF */  ld          $18, 0x20($29)
/* 00CB48 0010CA48 24104400 */  and         $2, $2, $4
/* 00CB4C 0010CA4C 1000B1DF */  ld          $17, 0x10($29)
/* 00CB50 0010CA50 00014234 */  ori         $2, $2, 0x100
/* 00CB54 0010CA54 000002AE */  sw          $2, 0x0($16)
/* 00CB58 0010CA58 0000B0DF */  ld          $16, 0x0($29)
/* 00CB5C 0010CA5C 0800E003 */  jr          $31
/* 00CB60 0010CA60 4000BD27 */   addiu      $29, $29, 0x40
/* 00CB64 0010CA64 00000000 */  nop
