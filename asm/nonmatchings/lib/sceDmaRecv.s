.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaRecv
/* CAA0 0010C9A0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* CAA4 0010C9A4 1000B1FF */  sd         $17, 0x10($sp)
/* CAA8 0010C9A8 0000B0FF */  sd         $16, 0x0($sp)
/* CAAC 0010C9AC 0001113C */  lui        $17, %hi(GlobalDataBuffer + 0xD54F7F)
/* CAB0 0010C9B0 3000BFFF */  sd         $31, 0x30($sp)
/* CAB4 0010C9B4 2D808000 */  daddu      $16, $4, $0
/* CAB8 0010C9B8 2000B2FF */  sd         $18, 0x20($sp)
/* CABC 0010C9BC 0000028E */  lw         $2, 0x0($16)
/* CAC0 0010C9C0 00014230 */  andi       $2, $2, 0x100
/* CAC4 0010C9C4 18004010 */  beqz       $2, .L0010CA28
/* CAC8 0010C9C8 2900123C */   lui       $18, %hi(D_002973B0)
/* CACC 0010C9CC FFFF3126 */  addiu      $17, $17, %lo(GlobalDataBuffer + (0xD54F7F & 0xFFFF))
.L0010C9D0:
/* CAD0 0010C9D0 11002106 */  bgez       $17, .L0010CA18
/* CAD4 0010C9D4 00000000 */   nop
/* CAD8 0010C9D8 A611040C */  jal        printf
/* CADC 0010C9DC B0734426 */   addiu     $4, $18, %lo(D_002973B0)
/* CAE0 0010C9E0 0000048E */  lw         $4, 0x0($16)
/* CAE4 0010C9E4 02120400 */  srl        $2, $4, 8
/* CAE8 0010C9E8 01004230 */  andi       $2, $2, 0x1
/* CAEC 0010C9EC 0A004010 */  beqz       $2, .L0010CA18
/* CAF0 0010C9F0 00000000 */   nop
/* CAF4 0010C9F4 FFFE0524 */  addiu      $5, $0, -0x101
.L0010C9F8:
/* CAF8 0010C9F8 24188500 */  and        $3, $4, $5
/* CAFC 0010C9FC 2D100000 */  daddu      $2, $0, $0
/* CB00 0010CA00 2D206000 */  daddu      $4, $3, $0
/* CB04 0010CA04 00000000 */  nop
/* CB08 0010CA08 00000000 */  nop
/* CB0C 0010CA0C FAFF4014 */  bnez       $2, .L0010C9F8
/* CB10 0010CA10 00000000 */   nop
/* CB14 0010CA14 000003AE */  sw         $3, 0x0($16)
.L0010CA18:
/* CB18 0010CA18 0000028E */  lw         $2, 0x0($16)
/* CB1C 0010CA1C 00014230 */  andi       $2, $2, 0x100
/* CB20 0010CA20 EBFF4014 */  bnez       $2, .L0010C9D0
/* CB24 0010CA24 FFFF3126 */   addiu     $17, $17, -0x1
.L0010CA28:
/* CB28 0010CA28 0000028E */  lw         $2, 0x0($16)
/* CB2C 0010CA2C F3FF0324 */  addiu      $3, $0, -0xD
/* CB30 0010CA30 FEFF0424 */  addiu      $4, $0, -0x2
/* CB34 0010CA34 200000AE */  sw         $0, 0x20($16)
/* CB38 0010CA38 24104300 */  and        $2, $2, $3
/* CB3C 0010CA3C 3000BFDF */  ld         $31, 0x30($sp)
/* CB40 0010CA40 04004234 */  ori        $2, $2, 0x4
/* CB44 0010CA44 2000B2DF */  ld         $18, 0x20($sp)
/* CB48 0010CA48 24104400 */  and        $2, $2, $4
/* CB4C 0010CA4C 1000B1DF */  ld         $17, 0x10($sp)
/* CB50 0010CA50 00014234 */  ori        $2, $2, 0x100
/* CB54 0010CA54 000002AE */  sw         $2, 0x0($16)
/* CB58 0010CA58 0000B0DF */  ld         $16, 0x0($sp)
/* CB5C 0010CA5C 0800E003 */  jr         $31
/* CB60 0010CA60 4000BD27 */   addiu     $sp, $sp, 0x40
/* CB64 0010CA64 00000000 */  nop
