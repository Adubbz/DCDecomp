.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_FISHING_DATA__FP12RS_STACKDATAi
/* 096AA0 001969A0 FEFF013C */  lui         $1, (0xFFFEBFB0 >> 16)
/* 096AA4 001969A4 B0BF2134 */  ori         $1, $1, (0xFFFEBFB0 & 0xFFFF)
/* 096AA8 001969A8 21E8A103 */  addu        $29, $29, $1
/* 096AAC 001969AC 2000BF7F */  sq          $31, 0x20($29)
/* 096AB0 001969B0 1000B17F */  sq          $17, 0x10($29)
/* 096AB4 001969B4 0000B07F */  sq          $16, 0x0($29)
/* 096AB8 001969B8 08009124 */  addiu       $17, $4, 0x8
/* 096ABC 001969BC D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 096AC0 001969C0 00000000 */   nop
/* 096AC4 001969C4 28864070 */  paddub      $16, $2, $0
/* 096AC8 001969C8 1CA4060C */  jal         FishingInit__Fv
/* 096ACC 001969CC 00000000 */   nop
/* 096AD0 001969D0 D201023C */  lui         $2, %hi(EdVillagerBuffer)
/* 096AD4 001969D4 60B34424 */  addiu       $4, $2, %lo(EdVillagerBuffer)
/* 096AD8 001969D8 08000524 */  addiu       $5, $0, 0x8
/* 096ADC 001969DC F8A1060C */  jal         FishingLoad__FP14CDataAlloc2_1_i
/* 096AE0 001969E0 00000000 */   nop
/* 096AE4 001969E4 28260072 */  paddub      $4, $16, $0
/* 096AE8 001969E8 D201023C */  lui         $2, %hi(EdVillagerBuffer)
/* 096AEC 001969EC 60B34524 */  addiu       $5, $2, %lo(EdVillagerBuffer)
/* 096AF0 001969F0 36000624 */  addiu       $6, $0, 0x36
/* 096AF4 001969F4 3CA2060C */  jal         FishingLoadFish__FiP14CDataAlloc2_1_i
/* 096AF8 001969F8 00000000 */   nop
/* 096AFC 001969FC 28262072 */  paddub      $4, $17, $0
/* 096B00 00196A00 08009124 */  addiu       $17, $4, 0x8
/* 096B04 00196A04 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 096B08 00196A08 00000000 */   nop
/* 096B0C 00196A0C 4000A0E7 */  swc1        $f0, 0x40($29)
/* 096B10 00196A10 7AC4023C */  lui         $2, (0xC47A0000 >> 16)
/* 096B14 00196A14 4400A2AF */  sw          $2, 0x44($29)
/* 096B18 00196A18 28262072 */  paddub      $4, $17, $0
/* 096B1C 00196A1C 08009124 */  addiu       $17, $4, 0x8
/* 096B20 00196A20 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 096B24 00196A24 00000000 */   nop
/* 096B28 00196A28 4800A0E7 */  swc1        $f0, 0x48($29)
/* 096B2C 00196A2C 28262072 */  paddub      $4, $17, $0
/* 096B30 00196A30 08009124 */  addiu       $17, $4, 0x8
/* 096B34 00196A34 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 096B38 00196A38 00000000 */   nop
/* 096B3C 00196A3C 3000A0E7 */  swc1        $f0, 0x30($29)
/* 096B40 00196A40 7A44023C */  lui         $2, (0x447A0000 >> 16)
/* 096B44 00196A44 3400A2AF */  sw          $2, 0x34($29)
/* 096B48 00196A48 28262072 */  paddub      $4, $17, $0
/* 096B4C 00196A4C 08009124 */  addiu       $17, $4, 0x8
/* 096B50 00196A50 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 096B54 00196A54 00000000 */   nop
/* 096B58 00196A58 3800A0E7 */  swc1        $f0, 0x38($29)
/* 096B5C 00196A5C 3000A427 */  addiu       $4, $29, 0x30
/* 096B60 00196A60 98A4060C */  jal         FishingSetRect__F7CBoxVu0
/* 096B64 00196A64 00000000 */   nop
/* 096B68 00196A68 28262072 */  paddub      $4, $17, $0
/* 096B6C 00196A6C 08009124 */  addiu       $17, $4, 0x8
/* 096B70 00196A70 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 096B74 00196A74 00000000 */   nop
/* 096B78 00196A78 06030046 */  mov.s       $f12, $f0
/* 096B7C 00196A7C 28262072 */  paddub      $4, $17, $0
/* 096B80 00196A80 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 096B84 00196A84 00000000 */   nop
/* 096B88 00196A88 46030046 */  mov.s       $f13, $f0
/* 096B8C 00196A8C 64A4060C */  jal         FishingSetWaterLevel__Fff
/* 096B90 00196A90 00000000 */   nop
/* 096B94 00196A94 28860070 */  paddub      $16, $0, $0
/* 096B98 00196A98 D401013C */  lui         $1, %hi(EdEventInfo + 0x240)
/* 096B9C 00196A9C 10D4248C */  lw          $4, %lo(EdEventInfo + 0x240)($1)
/* 096BA0 00196AA0 15008010 */  beqz        $4, .L00196AF8
/* 096BA4 00196AA4 00000000 */   nop
/* 096BA8 00196AA8 5000A527 */  addiu       $5, $29, 0x50
/* 096BAC 00196AAC 3000A627 */  addiu       $6, $29, 0x30
/* 096BB0 00196AB0 283E0070 */  paddub      $7, $0, $0
/* 096BB4 00196AB4 D493060C */  jal         PickUpPoly__11CEditGroundFP6CCPoly7CBoxVu0i
/* 096BB8 00196AB8 00000000 */   nop
/* 096BBC 00196ABC 28864070 */  paddub      $16, $2, $0
/* 096BC0 00196AC0 2A00023C */  lui         $2, %hi(LIT_2236)
/* 096BC4 00196AC4 00B14424 */  addiu       $4, $2, %lo(LIT_2236)
/* 096BC8 00196AC8 282E0072 */  paddub      $5, $16, $0
/* 096BCC 00196ACC A611040C */  jal         printf
/* 096BD0 00196AD0 00000000 */   nop
/* 096BD4 00196AD4 0104012A */  slti        $1, $16, 0x401
/* 096BD8 00196AD8 07002014 */  bnez        $1, .L00196AF8
/* 096BDC 00196ADC 00000000 */   nop
/* 096BE0 00196AE0 2A00023C */  lui         $2, %hi(LIT_2237)
/* 096BE4 00196AE4 10B14424 */  addiu       $4, $2, %lo(LIT_2237)
/* 096BE8 00196AE8 A611040C */  jal         printf
/* 096BEC 00196AEC 00000000 */   nop
.L00196AF0:
/* 096BF0 00196AF0 FFFF0010 */  b           .L00196AF0
/* 096BF4 00196AF4 00000000 */   nop
.L00196AF8:
/* 096BF8 00196AF8 5000A427 */  addiu       $4, $29, 0x50
/* 096BFC 00196AFC 282E0072 */  paddub      $5, $16, $0
/* 096C00 00196B00 78A4060C */  jal         FishingSetCPoly__FP6CCPolyi
/* 096C04 00196B04 00000000 */   nop
/* 096C08 00196B08 01000224 */  addiu       $2, $0, 0x1
/* 096C0C 00196B0C 2000BF7B */  lq          $31, 0x20($29)
/* 096C10 00196B10 1000B17B */  lq          $17, 0x10($29)
/* 096C14 00196B14 0000B07B */  lq          $16, 0x0($29)
/* 096C18 00196B18 0100013C */  lui         $1, (0x14050 >> 16)
/* 096C1C 00196B1C 50402134 */  ori         $1, $1, (0x14050 & 0xFFFF)
/* 096C20 00196B20 21E8A103 */  addu        $29, $29, $1
/* 096C24 00196B24 0800E003 */  jr          $31
/* 096C28 00196B28 00000000 */   nop
/* 096C2C 00196B2C 00000000 */  nop
