.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _HOBJ_EDITPARTS__FP12RS_STACKDATAi
/* 90AA0 001909A0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 90AA4 001909A4 2000BF7F */  sq         $31, 0x20($sp)
/* 90AA8 001909A8 1000B17F */  sq         $17, 0x10($sp)
/* 90AAC 001909AC 0000B07F */  sq         $16, 0x0($sp)
/* 90AB0 001909B0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 90AB4 001909B4 20D4228C */  lw         $2, -0x2BE0($at)
/* 90AB8 001909B8 04004014 */  bnez       $2, .L001909CC
/* 90ABC 001909BC 00000000 */   nop
/* 90AC0 001909C0 01000224 */  addiu      $2, $0, 0x1
/* 90AC4 001909C4 2D000010 */  b          .L00190A7C
/* 90AC8 001909C8 00000000 */   nop
.L001909CC:
/* 90ACC 001909CC D401013C */  lui        $at, (0x1D40000 >> 16)
/* 90AD0 001909D0 1CD4228C */  lw         $2, -0x2BE4($at)
/* 90AD4 001909D4 0400401C */  bgtz       $2, .L001909E8
/* 90AD8 001909D8 00000000 */   nop
/* 90ADC 001909DC 01000224 */  addiu      $2, $0, 0x1
/* 90AE0 001909E0 26000010 */  b          .L00190A7C
/* 90AE4 001909E4 00000000 */   nop
.L001909E8:
/* 90AE8 001909E8 08009124 */  addiu      $17, $4, 0x8
/* 90AEC 001909EC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 90AF0 001909F0 00000000 */   nop
/* 90AF4 001909F4 28864070 */  paddub     $16, $2, $0
/* 90AF8 001909F8 28262072 */  paddub     $4, $17, $0
/* 90AFC 001909FC 08009124 */  addiu      $17, $4, 0x8
/* 90B00 00190A00 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 90B04 00190A04 00000000 */   nop
/* 90B08 00190A08 282E4070 */  paddub     $5, $2, $0
/* 90B0C 00190A0C 0600A004 */  bltz       $5, .L00190A28
/* 90B10 00190A10 00000000 */   nop
/* 90B14 00190A14 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 90B18 00190A18 1CD4228C */  lw         $2, -0x2BE4($at)
/* 90B1C 00190A1C 2A10A200 */  slt        $2, $5, $2
/* 90B20 00190A20 04004014 */  bnez       $2, .L00190A34
/* 90B24 00190A24 00000000 */   nop
.L00190A28:
/* 90B28 00190A28 28160070 */  paddub     $2, $0, $0
/* 90B2C 00190A2C 13000010 */  b          .L00190A7C
/* 90B30 00190A30 00000000 */   nop
.L00190A34:
/* 90B34 00190A34 28262072 */  paddub     $4, $17, $0
/* 90B38 00190A38 F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 90B3C 00190A3C 00000000 */   nop
/* 90B40 00190A40 C0180500 */  sll        $3, $5, 3
/* 90B44 00190A44 23206500 */  subu       $4, $3, $5
/* 90B48 00190A48 80180400 */  sll        $3, $4, 2
/* 90B4C 00190A4C 23186400 */  subu       $3, $3, $4
/* 90B50 00190A50 40210300 */  sll        $4, $3, 5
/* 90B54 00190A54 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 90B58 00190A58 20D4238C */  lw         $3, -0x2BE0($at)
/* 90B5C 00190A5C 21286400 */  addu       $5, $3, $4
/* 90B60 00190A60 28260072 */  paddub     $4, $16, $0
/* 90B64 00190A64 28364070 */  paddub     $6, $2, $0
/* 90B68 00190A68 1C29060C */  jal        SetObjHandle__FiP9CMapPartsPc
/* 90B6C 00190A6C 00000000 */   nop
/* 90B70 00190A70 01000324 */  addiu      $3, $0, 0x1
/* 90B74 00190A74 0A180200 */  movz       $3, $0, $2
/* 90B78 00190A78 28166070 */  paddub     $2, $3, $0
.L00190A7C:
/* 90B7C 00190A7C 2000BF7B */  lq         $31, 0x20($sp)
/* 90B80 00190A80 1000B17B */  lq         $17, 0x10($sp)
/* 90B84 00190A84 0000B07B */  lq         $16, 0x0($sp)
/* 90B88 00190A88 3000BD27 */  addiu      $sp, $sp, 0x30
/* 90B8C 00190A8C 0800E003 */  jr         $31
/* 90B90 00190A90 00000000 */   nop
/* 90B94 00190A94 00000000 */  nop
/* 90B98 00190A98 00000000 */  nop
/* 90B9C 00190A9C 00000000 */  nop
