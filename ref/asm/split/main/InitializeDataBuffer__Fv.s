.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitializeDataBuffer__Fv
/* 025A90 00125990 F0FFBD27 */  addiu       $29, $29, -0x10
/* 025A94 00125994 0000BF7F */  sq          $31, 0x0($29)
/* 025A98 00125998 C701013C */  lui         $1, %hi(GlobalDataBuffer + 0x19C9900)
/* 025A9C 0012599C 804920AC */  sw          $0, %lo(GlobalDataBuffer + 0x19C9900)($1)
/* 025AA0 001259A0 C701013C */  lui         $1, %hi(GlobalDataBuffer + 0x19C9900)
/* 025AA4 001259A4 8049228C */  lw          $2, %lo(GlobalDataBuffer + 0x19C9900)($1)
/* 025AA8 001259A8 00190200 */  sll         $3, $2, 4
/* 025AAC 001259AC 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025AB0 001259B0 80B04224 */  addiu       $2, $2, %lo(GlobalDataBuffer)
/* 025AB4 001259B4 21204300 */  addu        $4, $2, $3
/* 025AB8 001259B8 282E0070 */  paddub      $5, $0, $0
/* 025ABC 001259BC 9C01023C */  lui         $2, (0x19C9900 >> 16)
/* 025AC0 001259C0 00994634 */  ori         $6, $2, (0x19C9900 & 0xFFFF)
/* 025AC4 001259C4 5A0D040C */  jal         memset
/* 025AC8 001259C8 00000000 */   nop
/* 025ACC 001259CC 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025AD0 001259D0 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025AD4 001259D4 0A000524 */  addiu       $5, $0, 0xA
/* 025AD8 001259D8 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025ADC 001259DC 00000000 */   nop
/* 025AE0 001259E0 28264070 */  paddub      $4, $2, $0
/* 025AE4 001259E4 2B00013C */  lui         $1, %hi(WaterData)
/* 025AE8 001259E8 40B024AC */  sw          $4, %lo(WaterData)($1)
/* 025AEC 001259EC 0A000224 */  addiu       $2, $0, 0xA
/* 025AF0 001259F0 2B00013C */  lui         $1, %hi(WaterData + 0xC)
/* 025AF4 001259F4 4CB022AC */  sw          $2, %lo(WaterData + 0xC)($1)
/* 025AF8 001259F8 2B00013C */  lui         $1, %hi(WaterData + 0x8)
/* 025AFC 001259FC 48B020AC */  sw          $0, %lo(WaterData + 0x8)($1)
/* 025B00 00125A00 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025B04 00125A04 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025B08 00125A08 A8610524 */  addiu       $5, $0, 0x61A8
/* 025B0C 00125A0C 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025B10 00125A10 00000000 */   nop
/* 025B14 00125A14 28264070 */  paddub      $4, $2, $0
/* 025B18 00125A18 2B00013C */  lui         $1, %hi(ActiveData0)
/* 025B1C 00125A1C 60B024AC */  sw          $4, %lo(ActiveData0)($1)
/* 025B20 00125A20 A8610524 */  addiu       $5, $0, 0x61A8
/* 025B24 00125A24 2B00013C */  lui         $1, %hi(ActiveData0 + 0xC)
/* 025B28 00125A28 6CB025AC */  sw          $5, %lo(ActiveData0 + 0xC)($1)
/* 025B2C 00125A2C 2B00013C */  lui         $1, %hi(ActiveData0 + 0x8)
/* 025B30 00125A30 68B020AC */  sw          $0, %lo(ActiveData0 + 0x8)($1)
/* 025B34 00125A34 2B00023C */  lui         $2, %hi(GlobalDataBuffer)
/* 025B38 00125A38 80B04424 */  addiu       $4, $2, %lo(GlobalDataBuffer)
/* 025B3C 00125A3C 809E040C */  jal         Alloc64__21CDataAlloc_1_1690000_Fi
/* 025B40 00125A40 00000000 */   nop
/* 025B44 00125A44 28264070 */  paddub      $4, $2, $0
/* 025B48 00125A48 2B00013C */  lui         $1, %hi(ActiveData1)
/* 025B4C 00125A4C 70B024AC */  sw          $4, %lo(ActiveData1)($1)
/* 025B50 00125A50 A8610324 */  addiu       $3, $0, 0x61A8
/* 025B54 00125A54 2B00013C */  lui         $1, %hi(ActiveData1 + 0xC)
/* 025B58 00125A58 7CB023AC */  sw          $3, %lo(ActiveData1 + 0xC)($1)
/* 025B5C 00125A5C 2B00013C */  lui         $1, %hi(WaterData + 0x8)
/* 025B60 00125A60 48B020AC */  sw          $0, %lo(WaterData + 0x8)($1)
/* 025B64 00125A64 2B00013C */  lui         $1, %hi(ActiveData0 + 0x8)
/* 025B68 00125A68 68B020AC */  sw          $0, %lo(ActiveData0 + 0x8)($1)
/* 025B6C 00125A6C 2B00013C */  lui         $1, %hi(ActiveData1 + 0x8)
/* 025B70 00125A70 78B020AC */  sw          $0, %lo(ActiveData1 + 0x8)($1)
/* 025B74 00125A74 0000BF7B */  lq          $31, 0x0($29)
/* 025B78 00125A78 1000BD27 */  addiu       $29, $29, 0x10
/* 025B7C 00125A7C 0800E003 */  jr          $31
/* 025B80 00125A80 00000000 */   nop
/* 025B84 00125A84 00000000 */  nop
/* 025B88 00125A88 00000000 */  nop
/* 025B8C 00125A8C 00000000 */  nop
