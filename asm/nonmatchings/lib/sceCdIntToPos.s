.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdIntToPos
/* 9B38 00109A38 4B000224 */  addiu      $2, $0, 0x4B
/* 9B3C 00109A3C 96008424 */  addiu      $4, $4, 0x96
/* 9B40 00109A40 1A008200 */  div        $0, $4, $2
/* 9B44 00109A44 3C000A24 */  addiu      $10, $0, 0x3C
/* 9B48 00109A48 0A000724 */  addiu      $7, $0, 0xA
/* 9B4C 00109A4C C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 9B50 00109A50 3000B3FF */  sd         $19, 0x30($sp)
/* 9B54 00109A54 0A000324 */  addiu      $3, $0, 0xA
/* 9B58 00109A58 2000B2FF */  sd         $18, 0x20($sp)
/* 9B5C 00109A5C 4B000D24 */  addiu      $13, $0, 0x4B
/* 9B60 00109A60 1000B1FF */  sd         $17, 0x10($sp)
/* 9B64 00109A64 0A000E24 */  addiu      $14, $0, 0xA
/* 9B68 00109A68 0000B0FF */  sd         $16, 0x0($sp)
/* 9B6C 00109A6C 3C000F24 */  addiu      $15, $0, 0x3C
/* 9B70 00109A70 01004050 */  beql       $2, $0, .L00109A78
/* 9B74 00109A74 CD010000 */   break     0, 7
.L00109A78:
/* 9B78 00109A78 0A001024 */  addiu      $16, $0, 0xA
/* 9B7C 00109A7C 3C001124 */  addiu      $17, $0, 0x3C
/* 9B80 00109A80 0A001224 */  addiu      $18, $0, 0xA
/* 9B84 00109A84 0A001324 */  addiu      $19, $0, 0xA
/* 9B88 00109A88 2D10A000 */  daddu      $2, $5, $0
/* 9B8C 00109A8C 10600000 */  mfhi       $12
/* 9B90 00109A90 12200000 */  mflo       $4
/* 9B94 00109A94 1A008A00 */  div        $0, $4, $10
/* 9B98 00109A98 12200000 */  mflo       $4
/* 9B9C 00109A9C 10300000 */  mfhi       $6
/* 9BA0 00109AA0 1A008701 */  div        $0, $12, $7
/* 9BA4 00109AA4 10480000 */  mfhi       $9
/* 9BA8 00109AA8 12180000 */  mflo       $3
/* 9BAC 00109AAC 00190300 */  sll        $3, $3, 4
/* 9BB0 00109AB0 21186900 */  addu       $3, $3, $9
/* 9BB4 00109AB4 1A00C700 */  div        $0, $6, $7
/* 9BB8 00109AB8 0200A3A0 */  sb         $3, 0x2($5)
/* 9BBC 00109ABC 10580000 */  mfhi       $11
/* 9BC0 00109AC0 12400000 */  mflo       $8
/* 9BC4 00109AC4 00410800 */  sll        $8, $8, 4
/* 9BC8 00109AC8 21400B01 */  addu       $8, $8, $11
/* 9BCC 00109ACC 1A008700 */  div        $0, $4, $7
/* 9BD0 00109AD0 0100A8A0 */  sb         $8, 0x1($5)
/* 9BD4 00109AD4 3000B3DF */  ld         $19, 0x30($sp)
/* 9BD8 00109AD8 2000B2DF */  ld         $18, 0x20($sp)
/* 9BDC 00109ADC 1000B1DF */  ld         $17, 0x10($sp)
/* 9BE0 00109AE0 0000B0DF */  ld         $16, 0x0($sp)
/* 9BE4 00109AE4 12200000 */  mflo       $4
/* 9BE8 00109AE8 10600000 */  mfhi       $12
/* 9BEC 00109AEC 00210400 */  sll        $4, $4, 4
/* 9BF0 00109AF0 21208C00 */  addu       $4, $4, $12
/* 9BF4 00109AF4 0000A4A0 */  sb         $4, 0x0($5)
/* 9BF8 00109AF8 0800E003 */  jr         $31
/* 9BFC 00109AFC 4000BD27 */   addiu     $sp, $sp, 0x40
