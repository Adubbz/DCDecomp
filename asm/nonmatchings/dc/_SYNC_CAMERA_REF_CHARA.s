.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SYNC_CAMERA_REF_CHARA__FP12RS_STACKDATAi
/* 92A80 00192980 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 92A84 00192984 2000BF7F */  sq         $31, 0x20($sp)
/* 92A88 00192988 1000B17F */  sq         $17, 0x10($sp)
/* 92A8C 0019298C 0000B07F */  sq         $16, 0x0($sp)
/* 92A90 00192990 2886A070 */  paddub     $16, $5, $0
/* 92A94 00192994 08009124 */  addiu      $17, $4, 0x8
/* 92A98 00192998 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92A9C 0019299C 00000000 */   nop
/* 92AA0 001929A0 28264070 */  paddub     $4, $2, $0
/* 92AA4 001929A4 842C060C */  jal        GetChara__Fi
/* 92AA8 001929A8 00000000 */   nop
/* 92AAC 001929AC 4C9282AF */  sw         $2, -0x6DB4($gp)
/* 92AB0 001929B0 04000224 */  addiu      $2, $0, 0x4
/* 92AB4 001929B4 14000216 */  bne        $16, $2, .L00192A08
/* 92AB8 001929B8 00000000 */   nop
/* 92ABC 001929BC 28262072 */  paddub     $4, $17, $0
/* 92AC0 001929C0 08009124 */  addiu      $17, $4, 0x8
/* 92AC4 001929C4 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 92AC8 001929C8 00000000 */   nop
/* 92ACC 001929CC D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92AD0 001929D0 80EF20E4 */  swc1       $f0, -0x1080($at)
/* 92AD4 001929D4 28262072 */  paddub     $4, $17, $0
/* 92AD8 001929D8 08009124 */  addiu      $17, $4, 0x8
/* 92ADC 001929DC E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 92AE0 001929E0 00000000 */   nop
/* 92AE4 001929E4 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92AE8 001929E8 84EF20E4 */  swc1       $f0, -0x107C($at)
/* 92AEC 001929EC 28262072 */  paddub     $4, $17, $0
/* 92AF0 001929F0 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 92AF4 001929F4 00000000 */   nop
/* 92AF8 001929F8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92AFC 001929FC 88EF20E4 */  swc1       $f0, -0x1078($at)
/* 92B00 00192A00 07000010 */  b          .L00192A20
/* 92B04 00192A04 00000000 */   nop
.L00192A08:
/* 92B08 00192A08 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92B0C 00192A0C 80EF20AC */  sw         $0, -0x1080($at)
/* 92B10 00192A10 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92B14 00192A14 84EF20AC */  sw         $0, -0x107C($at)
/* 92B18 00192A18 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92B1C 00192A1C 88EF20AC */  sw         $0, -0x1078($at)
.L00192A20:
/* 92B20 00192A20 01000224 */  addiu      $2, $0, 0x1
/* 92B24 00192A24 2000BF7B */  lq         $31, 0x20($sp)
/* 92B28 00192A28 1000B17B */  lq         $17, 0x10($sp)
/* 92B2C 00192A2C 0000B07B */  lq         $16, 0x0($sp)
/* 92B30 00192A30 3000BD27 */  addiu      $sp, $sp, 0x30
/* 92B34 00192A34 0800E003 */  jr         $31
/* 92B38 00192A38 00000000 */   nop
/* 92B3C 00192A3C 00000000 */  nop
