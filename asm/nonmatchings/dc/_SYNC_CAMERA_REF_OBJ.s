.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SYNC_CAMERA_REF_OBJ__FP12RS_STACKDATAi
/* 92B50 00192A50 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 92B54 00192A54 2000BF7F */  sq         $31, 0x20($sp)
/* 92B58 00192A58 1000B17F */  sq         $17, 0x10($sp)
/* 92B5C 00192A5C 0000B07F */  sq         $16, 0x0($sp)
/* 92B60 00192A60 2886A070 */  paddub     $16, $5, $0
/* 92B64 00192A64 08009124 */  addiu      $17, $4, 0x8
/* 92B68 00192A68 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92B6C 00192A6C 00000000 */   nop
/* 92B70 00192A70 28264070 */  paddub     $4, $2, $0
/* 92B74 00192A74 0C29060C */  jal        GetObjHandle__Fi
/* 92B78 00192A78 00000000 */   nop
/* 92B7C 00192A7C 509282AF */  sw         $2, -0x6DB0($gp)
/* 92B80 00192A80 04000224 */  addiu      $2, $0, 0x4
/* 92B84 00192A84 14000216 */  bne        $16, $2, .L00192AD8
/* 92B88 00192A88 00000000 */   nop
/* 92B8C 00192A8C 28262072 */  paddub     $4, $17, $0
/* 92B90 00192A90 08009124 */  addiu      $17, $4, 0x8
/* 92B94 00192A94 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 92B98 00192A98 00000000 */   nop
/* 92B9C 00192A9C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92BA0 00192AA0 80EF20E4 */  swc1       $f0, -0x1080($at)
/* 92BA4 00192AA4 28262072 */  paddub     $4, $17, $0
/* 92BA8 00192AA8 08009124 */  addiu      $17, $4, 0x8
/* 92BAC 00192AAC E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 92BB0 00192AB0 00000000 */   nop
/* 92BB4 00192AB4 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92BB8 00192AB8 84EF20E4 */  swc1       $f0, -0x107C($at)
/* 92BBC 00192ABC 28262072 */  paddub     $4, $17, $0
/* 92BC0 00192AC0 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 92BC4 00192AC4 00000000 */   nop
/* 92BC8 00192AC8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92BCC 00192ACC 88EF20E4 */  swc1       $f0, -0x1078($at)
/* 92BD0 00192AD0 07000010 */  b          .L00192AF0
/* 92BD4 00192AD4 00000000 */   nop
.L00192AD8:
/* 92BD8 00192AD8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92BDC 00192ADC 80EF20AC */  sw         $0, -0x1080($at)
/* 92BE0 00192AE0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92BE4 00192AE4 84EF20AC */  sw         $0, -0x107C($at)
/* 92BE8 00192AE8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92BEC 00192AEC 88EF20AC */  sw         $0, -0x1078($at)
.L00192AF0:
/* 92BF0 00192AF0 01000224 */  addiu      $2, $0, 0x1
/* 92BF4 00192AF4 2000BF7B */  lq         $31, 0x20($sp)
/* 92BF8 00192AF8 1000B17B */  lq         $17, 0x10($sp)
/* 92BFC 00192AFC 0000B07B */  lq         $16, 0x0($sp)
/* 92C00 00192B00 3000BD27 */  addiu      $sp, $sp, 0x30
/* 92C04 00192B04 0800E003 */  jr         $31
/* 92C08 00192B08 00000000 */   nop
/* 92C0C 00192B0C 00000000 */  nop
