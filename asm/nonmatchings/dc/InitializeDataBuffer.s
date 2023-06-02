.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitializeDataBuffer__Fv
/* 25A90 00125990 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 25A94 00125994 0000BF7F */  sq         $31, 0x0($sp)
/* 25A98 00125998 C701013C */  lui        $at, (0x1C74980 >> 16)
/* 25A9C 0012599C 804920AC */  sw         $0, (0x1C74980 & 0xFFFF)($at)
/* 25AA0 001259A0 C701013C */  lui        $at, (0x1C74980 >> 16)
/* 25AA4 001259A4 8049228C */  lw         $2, (0x1C74980 & 0xFFFF)($at)
/* 25AA8 001259A8 00190200 */  sll        $3, $2, 4
/* 25AAC 001259AC 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25AB0 001259B0 80B04224 */  addiu      $2, $2, %lo(GlobalDataBuffer)
/* 25AB4 001259B4 21204300 */  addu       $4, $2, $3
/* 25AB8 001259B8 282E0070 */  paddub     $5, $0, $0
/* 25ABC 001259BC 9C01023C */  lui        $2, (0x19C9900 >> 16)
/* 25AC0 001259C0 00994634 */  ori        $6, $2, (0x19C9900 & 0xFFFF)
/* 25AC4 001259C4 5A0D040C */  jal        memset
/* 25AC8 001259C8 00000000 */   nop
/* 25ACC 001259CC 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25AD0 001259D0 80B04424 */  addiu      $4, $2, %lo(GlobalDataBuffer)
/* 25AD4 001259D4 0A000524 */  addiu      $5, $0, 0xA
/* 25AD8 001259D8 809E040C */  jal        Alloc64__21CDataAlloc_1_1690000_Fi
/* 25ADC 001259DC 00000000 */   nop
/* 25AE0 001259E0 28264070 */  paddub     $4, $2, $0
/* 25AE4 001259E4 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25AE8 001259E8 40B024AC */  sw         $4, -0x4FC0($at)
/* 25AEC 001259EC 0A000224 */  addiu      $2, $0, 0xA
/* 25AF0 001259F0 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25AF4 001259F4 4CB022AC */  sw         $2, -0x4FB4($at)
/* 25AF8 001259F8 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25AFC 001259FC 48B020AC */  sw         $0, -0x4FB8($at)
/* 25B00 00125A00 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25B04 00125A04 80B04424 */  addiu      $4, $2, %lo(GlobalDataBuffer)
/* 25B08 00125A08 A8610524 */  addiu      $5, $0, 0x61A8
/* 25B0C 00125A0C 809E040C */  jal        Alloc64__21CDataAlloc_1_1690000_Fi
/* 25B10 00125A10 00000000 */   nop
/* 25B14 00125A14 28264070 */  paddub     $4, $2, $0
/* 25B18 00125A18 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25B1C 00125A1C 60B024AC */  sw         $4, -0x4FA0($at)
/* 25B20 00125A20 A8610524 */  addiu      $5, $0, 0x61A8
/* 25B24 00125A24 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25B28 00125A28 6CB025AC */  sw         $5, -0x4F94($at)
/* 25B2C 00125A2C 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25B30 00125A30 68B020AC */  sw         $0, -0x4F98($at)
/* 25B34 00125A34 2B00023C */  lui        $2, %hi(GlobalDataBuffer)
/* 25B38 00125A38 80B04424 */  addiu      $4, $2, %lo(GlobalDataBuffer)
/* 25B3C 00125A3C 809E040C */  jal        Alloc64__21CDataAlloc_1_1690000_Fi
/* 25B40 00125A40 00000000 */   nop
/* 25B44 00125A44 28264070 */  paddub     $4, $2, $0
/* 25B48 00125A48 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25B4C 00125A4C 70B024AC */  sw         $4, -0x4F90($at)
/* 25B50 00125A50 A8610324 */  addiu      $3, $0, 0x61A8
/* 25B54 00125A54 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25B58 00125A58 7CB023AC */  sw         $3, -0x4F84($at)
/* 25B5C 00125A5C 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25B60 00125A60 48B020AC */  sw         $0, -0x4FB8($at)
/* 25B64 00125A64 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25B68 00125A68 68B020AC */  sw         $0, -0x4F98($at)
/* 25B6C 00125A6C 2B00013C */  lui        $at, (0x2B0000 >> 16)
/* 25B70 00125A70 78B020AC */  sw         $0, -0x4F88($at)
/* 25B74 00125A74 0000BF7B */  lq         $31, 0x0($sp)
/* 25B78 00125A78 1000BD27 */  addiu      $sp, $sp, 0x10
/* 25B7C 00125A7C 0800E003 */  jr         $31
/* 25B80 00125A80 00000000 */   nop
/* 25B84 00125A84 00000000 */  nop
/* 25B88 00125A88 00000000 */  nop
/* 25B8C 00125A8C 00000000 */  nop
