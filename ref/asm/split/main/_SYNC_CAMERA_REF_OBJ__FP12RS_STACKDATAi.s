.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SYNC_CAMERA_REF_OBJ__FP12RS_STACKDATAi
/* 092B50 00192A50 D0FFBD27 */  addiu       $29, $29, -0x30
/* 092B54 00192A54 2000BF7F */  sq          $31, 0x20($29)
/* 092B58 00192A58 1000B17F */  sq          $17, 0x10($29)
/* 092B5C 00192A5C 0000B07F */  sq          $16, 0x0($29)
/* 092B60 00192A60 2886A070 */  paddub      $16, $5, $0
/* 092B64 00192A64 08009124 */  addiu       $17, $4, 0x8
/* 092B68 00192A68 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 092B6C 00192A6C 00000000 */   nop
/* 092B70 00192A70 28264070 */  paddub      $4, $2, $0
/* 092B74 00192A74 0C29060C */  jal         GetObjHandle__Fi
/* 092B78 00192A78 00000000 */   nop
/* 092B7C 00192A7C 509282AF */  sw          $2, -0x6DB0($28)
/* 092B80 00192A80 04000224 */  addiu       $2, $0, 0x4
/* 092B84 00192A84 14000216 */  bne         $16, $2, .L00192AD8
/* 092B88 00192A88 00000000 */   nop
/* 092B8C 00192A8C 28262072 */  paddub      $4, $17, $0
/* 092B90 00192A90 08009124 */  addiu       $17, $4, 0x8
/* 092B94 00192A94 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 092B98 00192A98 00000000 */   nop
/* 092B9C 00192A9C D401013C */  lui         $1, %hi(sync_camera_ref_offset)
/* 092BA0 00192AA0 80EF20E4 */  swc1        $f0, %lo(sync_camera_ref_offset)($1)
/* 092BA4 00192AA4 28262072 */  paddub      $4, $17, $0
/* 092BA8 00192AA8 08009124 */  addiu       $17, $4, 0x8
/* 092BAC 00192AAC E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 092BB0 00192AB0 00000000 */   nop
/* 092BB4 00192AB4 D401013C */  lui         $1, %hi(sync_camera_ref_offset + 0x4)
/* 092BB8 00192AB8 84EF20E4 */  swc1        $f0, %lo(sync_camera_ref_offset + 0x4)($1)
/* 092BBC 00192ABC 28262072 */  paddub      $4, $17, $0
/* 092BC0 00192AC0 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 092BC4 00192AC4 00000000 */   nop
/* 092BC8 00192AC8 D401013C */  lui         $1, %hi(sync_camera_ref_offset + 0x8)
/* 092BCC 00192ACC 88EF20E4 */  swc1        $f0, %lo(sync_camera_ref_offset + 0x8)($1)
/* 092BD0 00192AD0 07000010 */  b           .L00192AF0
/* 092BD4 00192AD4 00000000 */   nop
.L00192AD8:
/* 092BD8 00192AD8 D401013C */  lui         $1, %hi(sync_camera_ref_offset)
/* 092BDC 00192ADC 80EF20AC */  sw          $0, %lo(sync_camera_ref_offset)($1)
/* 092BE0 00192AE0 D401013C */  lui         $1, %hi(sync_camera_ref_offset + 0x4)
/* 092BE4 00192AE4 84EF20AC */  sw          $0, %lo(sync_camera_ref_offset + 0x4)($1)
/* 092BE8 00192AE8 D401013C */  lui         $1, %hi(sync_camera_ref_offset + 0x8)
/* 092BEC 00192AEC 88EF20AC */  sw          $0, %lo(sync_camera_ref_offset + 0x8)($1)
.L00192AF0:
/* 092BF0 00192AF0 01000224 */  addiu       $2, $0, 0x1
/* 092BF4 00192AF4 2000BF7B */  lq          $31, 0x20($29)
/* 092BF8 00192AF8 1000B17B */  lq          $17, 0x10($29)
/* 092BFC 00192AFC 0000B07B */  lq          $16, 0x0($29)
/* 092C00 00192B00 3000BD27 */  addiu       $29, $29, 0x30
/* 092C04 00192B04 0800E003 */  jr          $31
/* 092C08 00192B08 00000000 */   nop
/* 092C0C 00192B0C 00000000 */  nop
