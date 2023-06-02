.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_FISHING_DATA__FP12RS_STACKDATAi
/* 96AA0 001969A0 FEFF013C */  lui        $at, (0xFFFEBFB0 >> 16)
/* 96AA4 001969A4 B0BF2134 */  ori        $at, $at, (0xFFFEBFB0 & 0xFFFF)
/* 96AA8 001969A8 21E8A103 */  addu       $sp, $sp, $at
/* 96AAC 001969AC 2000BF7F */  sq         $31, 0x20($sp)
/* 96AB0 001969B0 1000B17F */  sq         $17, 0x10($sp)
/* 96AB4 001969B4 0000B07F */  sq         $16, 0x0($sp)
/* 96AB8 001969B8 08009124 */  addiu      $17, $4, 0x8
/* 96ABC 001969BC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 96AC0 001969C0 00000000 */   nop
/* 96AC4 001969C4 28864070 */  paddub     $16, $2, $0
/* 96AC8 001969C8 1CA4060C */  jal        FishingInit__Fv
/* 96ACC 001969CC 00000000 */   nop
/* 96AD0 001969D0 D201023C */  lui        $2, %hi(EdVillagerBuffer)
/* 96AD4 001969D4 60B34424 */  addiu      $4, $2, %lo(EdVillagerBuffer)
/* 96AD8 001969D8 08000524 */  addiu      $5, $0, 0x8
/* 96ADC 001969DC F8A1060C */  jal        FishingLoad__FP14CDataAlloc2_1_i
/* 96AE0 001969E0 00000000 */   nop
/* 96AE4 001969E4 28260072 */  paddub     $4, $16, $0
/* 96AE8 001969E8 D201023C */  lui        $2, %hi(EdVillagerBuffer)
/* 96AEC 001969EC 60B34524 */  addiu      $5, $2, %lo(EdVillagerBuffer)
/* 96AF0 001969F0 36000624 */  addiu      $6, $0, 0x36
/* 96AF4 001969F4 3CA2060C */  jal        FishingLoadFish__FiP14CDataAlloc2_1_i
/* 96AF8 001969F8 00000000 */   nop
/* 96AFC 001969FC 28262072 */  paddub     $4, $17, $0
/* 96B00 00196A00 08009124 */  addiu      $17, $4, 0x8
/* 96B04 00196A04 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 96B08 00196A08 00000000 */   nop
/* 96B0C 00196A0C 4000A0E7 */  swc1       $f0, 0x40($sp)
/* 96B10 00196A10 7AC4023C */  lui        $2, (0xC47A0000 >> 16)
/* 96B14 00196A14 4400A2AF */  sw         $2, 0x44($sp)
/* 96B18 00196A18 28262072 */  paddub     $4, $17, $0
/* 96B1C 00196A1C 08009124 */  addiu      $17, $4, 0x8
/* 96B20 00196A20 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 96B24 00196A24 00000000 */   nop
/* 96B28 00196A28 4800A0E7 */  swc1       $f0, 0x48($sp)
/* 96B2C 00196A2C 28262072 */  paddub     $4, $17, $0
/* 96B30 00196A30 08009124 */  addiu      $17, $4, 0x8
/* 96B34 00196A34 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 96B38 00196A38 00000000 */   nop
/* 96B3C 00196A3C 3000A0E7 */  swc1       $f0, 0x30($sp)
/* 96B40 00196A40 7A44023C */  lui        $2, (0x447A0000 >> 16)
/* 96B44 00196A44 3400A2AF */  sw         $2, 0x34($sp)
/* 96B48 00196A48 28262072 */  paddub     $4, $17, $0
/* 96B4C 00196A4C 08009124 */  addiu      $17, $4, 0x8
/* 96B50 00196A50 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 96B54 00196A54 00000000 */   nop
/* 96B58 00196A58 3800A0E7 */  swc1       $f0, 0x38($sp)
/* 96B5C 00196A5C 3000A427 */  addiu      $4, $sp, 0x30
/* 96B60 00196A60 98A4060C */  jal        FishingSetRect__F7CBoxVu0
/* 96B64 00196A64 00000000 */   nop
/* 96B68 00196A68 28262072 */  paddub     $4, $17, $0
/* 96B6C 00196A6C 08009124 */  addiu      $17, $4, 0x8
/* 96B70 00196A70 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 96B74 00196A74 00000000 */   nop
/* 96B78 00196A78 06030046 */  mov.s      $f12, $f0
/* 96B7C 00196A7C 28262072 */  paddub     $4, $17, $0
/* 96B80 00196A80 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 96B84 00196A84 00000000 */   nop
/* 96B88 00196A88 46030046 */  mov.s      $f13, $f0
/* 96B8C 00196A8C 64A4060C */  jal        FishingSetWaterLevel__Fff
/* 96B90 00196A90 00000000 */   nop
/* 96B94 00196A94 28860070 */  paddub     $16, $0, $0
/* 96B98 00196A98 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 96B9C 00196A9C 10D4248C */  lw         $4, -0x2BF0($at)
/* 96BA0 00196AA0 15008010 */  beqz       $4, .L00196AF8
/* 96BA4 00196AA4 00000000 */   nop
/* 96BA8 00196AA8 5000A527 */  addiu      $5, $sp, 0x50
/* 96BAC 00196AAC 3000A627 */  addiu      $6, $sp, 0x30
/* 96BB0 00196AB0 283E0070 */  paddub     $7, $0, $0
/* 96BB4 00196AB4 D493060C */  jal        PickUpPoly__11CEditGroundFP6CCPoly7CBoxVu0i
/* 96BB8 00196AB8 00000000 */   nop
/* 96BBC 00196ABC 28864070 */  paddub     $16, $2, $0
/* 96BC0 00196AC0 2A00023C */  lui        $2, %hi(_2236)
/* 96BC4 00196AC4 00B14424 */  addiu      $4, $2, %lo(_2236)
/* 96BC8 00196AC8 282E0072 */  paddub     $5, $16, $0
/* 96BCC 00196ACC A611040C */  jal        printf
/* 96BD0 00196AD0 00000000 */   nop
/* 96BD4 00196AD4 0104012A */  slti       $at, $16, 0x401
/* 96BD8 00196AD8 07002014 */  bnez       $at, .L00196AF8
/* 96BDC 00196ADC 00000000 */   nop
/* 96BE0 00196AE0 2A00023C */  lui        $2, %hi(_2237)
/* 96BE4 00196AE4 10B14424 */  addiu      $4, $2, %lo(_2237)
/* 96BE8 00196AE8 A611040C */  jal        printf
/* 96BEC 00196AEC 00000000 */   nop
.L00196AF0:
/* 96BF0 00196AF0 FFFF0010 */  b          .L00196AF0
/* 96BF4 00196AF4 00000000 */   nop
.L00196AF8:
/* 96BF8 00196AF8 5000A427 */  addiu      $4, $sp, 0x50
/* 96BFC 00196AFC 282E0072 */  paddub     $5, $16, $0
/* 96C00 00196B00 78A4060C */  jal        FishingSetCPoly__FP6CCPolyi
/* 96C04 00196B04 00000000 */   nop
/* 96C08 00196B08 01000224 */  addiu      $2, $0, 0x1
/* 96C0C 00196B0C 2000BF7B */  lq         $31, 0x20($sp)
/* 96C10 00196B10 1000B17B */  lq         $17, 0x10($sp)
/* 96C14 00196B14 0000B07B */  lq         $16, 0x0($sp)
/* 96C18 00196B18 0100013C */  lui        $at, (0x14050 >> 16)
/* 96C1C 00196B1C 50402134 */  ori        $at, $at, (0x14050 & 0xFFFF)
/* 96C20 00196B20 21E8A103 */  addu       $sp, $sp, $at
/* 96C24 00196B24 0800E003 */  jr         $31
/* 96C28 00196B28 00000000 */   nop
/* 96C2C 00196B2C 00000000 */  nop
