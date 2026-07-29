.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SYNC_CAMERA_REF_CHARA__FP12RS_STACKDATAi
/* 092A80 00192980 D0FFBD27 */  addiu       $29, $29, -0x30
/* 092A84 00192984 2000BF7F */  sq          $31, 0x20($29)
/* 092A88 00192988 1000B17F */  sq          $17, 0x10($29)
/* 092A8C 0019298C 0000B07F */  sq          $16, 0x0($29)
/* 092A90 00192990 2886A070 */  paddub      $16, $5, $0
/* 092A94 00192994 08009124 */  addiu       $17, $4, 0x8
/* 092A98 00192998 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 092A9C 0019299C 00000000 */   nop
/* 092AA0 001929A0 28264070 */  paddub      $4, $2, $0
/* 092AA4 001929A4 842C060C */  jal         GetChara__Fi
/* 092AA8 001929A8 00000000 */   nop
/* 092AAC 001929AC 4C9282AF */  sw          $2, -0x6DB4($28)
/* 092AB0 001929B0 04000224 */  addiu       $2, $0, 0x4
/* 092AB4 001929B4 14000216 */  bne         $16, $2, .L00192A08
/* 092AB8 001929B8 00000000 */   nop
/* 092ABC 001929BC 28262072 */  paddub      $4, $17, $0
/* 092AC0 001929C0 08009124 */  addiu       $17, $4, 0x8
/* 092AC4 001929C4 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 092AC8 001929C8 00000000 */   nop
/* 092ACC 001929CC D401013C */  lui         $1, %hi(sync_camera_ref_offset)
/* 092AD0 001929D0 80EF20E4 */  swc1        $f0, %lo(sync_camera_ref_offset)($1)
/* 092AD4 001929D4 28262072 */  paddub      $4, $17, $0
/* 092AD8 001929D8 08009124 */  addiu       $17, $4, 0x8
/* 092ADC 001929DC E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 092AE0 001929E0 00000000 */   nop
/* 092AE4 001929E4 D401013C */  lui         $1, %hi(sync_camera_ref_offset + 0x4)
/* 092AE8 001929E8 84EF20E4 */  swc1        $f0, %lo(sync_camera_ref_offset + 0x4)($1)
/* 092AEC 001929EC 28262072 */  paddub      $4, $17, $0
/* 092AF0 001929F0 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 092AF4 001929F4 00000000 */   nop
/* 092AF8 001929F8 D401013C */  lui         $1, %hi(sync_camera_ref_offset + 0x8)
/* 092AFC 001929FC 88EF20E4 */  swc1        $f0, %lo(sync_camera_ref_offset + 0x8)($1)
/* 092B00 00192A00 07000010 */  b           .L00192A20
/* 092B04 00192A04 00000000 */   nop
.L00192A08:
/* 092B08 00192A08 D401013C */  lui         $1, %hi(sync_camera_ref_offset)
/* 092B0C 00192A0C 80EF20AC */  sw          $0, %lo(sync_camera_ref_offset)($1)
/* 092B10 00192A10 D401013C */  lui         $1, %hi(sync_camera_ref_offset + 0x4)
/* 092B14 00192A14 84EF20AC */  sw          $0, %lo(sync_camera_ref_offset + 0x4)($1)
/* 092B18 00192A18 D401013C */  lui         $1, %hi(sync_camera_ref_offset + 0x8)
/* 092B1C 00192A1C 88EF20AC */  sw          $0, %lo(sync_camera_ref_offset + 0x8)($1)
.L00192A20:
/* 092B20 00192A20 01000224 */  addiu       $2, $0, 0x1
/* 092B24 00192A24 2000BF7B */  lq          $31, 0x20($29)
/* 092B28 00192A28 1000B17B */  lq          $17, 0x10($29)
/* 092B2C 00192A2C 0000B07B */  lq          $16, 0x0($29)
/* 092B30 00192A30 3000BD27 */  addiu       $29, $29, 0x30
/* 092B34 00192A34 0800E003 */  jr          $31
/* 092B38 00192A38 00000000 */   nop
/* 092B3C 00192A3C 00000000 */  nop
