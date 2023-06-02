.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SGET_ATRA_PARTS_NUM__FP12RS_STACKDATAi
/* 95A90 00195990 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 95A94 00195994 4000BF7F */  sq         $31, 0x40($sp)
/* 95A98 00195998 3000B37F */  sq         $19, 0x30($sp)
/* 95A9C 0019599C 2000B27F */  sq         $18, 0x20($sp)
/* 95AA0 001959A0 1000B17F */  sq         $17, 0x10($sp)
/* 95AA4 001959A4 0000B07F */  sq         $16, 0x0($sp)
/* 95AA8 001959A8 28860070 */  paddub     $16, $0, $0
/* 95AAC 001959AC 08009324 */  addiu      $19, $4, 0x8
/* 95AB0 001959B0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95AB4 001959B4 00000000 */   nop
/* 95AB8 001959B8 FFFF5124 */  addiu      $17, $2, -0x1
/* 95ABC 001959BC 28960070 */  paddub     $18, $0, $0
/* 95AC0 001959C0 0D000010 */  b          .L001959F8
/* 95AC4 001959C4 00000000 */   nop
.L001959C8:
/* 95AC8 001959C8 1C8D848F */  lw         $4, -0x72E4($gp)
/* 95ACC 001959CC 282E2072 */  paddub     $5, $17, $0
/* 95AD0 001959D0 28364072 */  paddub     $6, $18, $0
/* 95AD4 001959D4 FC5F050C */  jal        GetEditPartsInfo__9CSaveDataFii
/* 95AD8 001959D8 00000000 */   nop
/* 95ADC 001959DC 05004010 */  beqz       $2, .L001959F4
/* 95AE0 001959E0 00000000 */   nop
/* 95AE4 001959E4 04004284 */  lh         $2, 0x4($2)
/* 95AE8 001959E8 02004010 */  beqz       $2, .L001959F4
/* 95AEC 001959EC 00000000 */   nop
/* 95AF0 001959F0 01001026 */  addiu      $16, $16, 0x1
.L001959F4:
/* 95AF4 001959F4 01005226 */  addiu      $18, $18, 0x1
.L001959F8:
/* 95AF8 001959F8 1800422A */  slti       $2, $18, 0x18
/* 95AFC 001959FC F2FF4014 */  bnez       $2, .L001959C8
/* 95B00 00195A00 00000000 */   nop
/* 95B04 00195A04 28266072 */  paddub     $4, $19, $0
/* 95B08 00195A08 282E0072 */  paddub     $5, $16, $0
/* 95B0C 00195A0C F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 95B10 00195A10 00000000 */   nop
/* 95B14 00195A14 01000224 */  addiu      $2, $0, 0x1
/* 95B18 00195A18 4000BF7B */  lq         $31, 0x40($sp)
/* 95B1C 00195A1C 3000B37B */  lq         $19, 0x30($sp)
/* 95B20 00195A20 2000B27B */  lq         $18, 0x20($sp)
/* 95B24 00195A24 1000B17B */  lq         $17, 0x10($sp)
/* 95B28 00195A28 0000B07B */  lq         $16, 0x0($sp)
/* 95B2C 00195A2C 5000BD27 */  addiu      $sp, $sp, 0x50
/* 95B30 00195A30 0800E003 */  jr         $31
/* 95B34 00195A34 00000000 */   nop
/* 95B38 00195A38 00000000 */  nop
/* 95B3C 00195A3C 00000000 */  nop
