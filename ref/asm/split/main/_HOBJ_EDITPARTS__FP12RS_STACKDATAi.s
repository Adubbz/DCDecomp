.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _HOBJ_EDITPARTS__FP12RS_STACKDATAi
/* 090AA0 001909A0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 090AA4 001909A4 2000BF7F */  sq          $31, 0x20($29)
/* 090AA8 001909A8 1000B17F */  sq          $17, 0x10($29)
/* 090AAC 001909AC 0000B07F */  sq          $16, 0x0($29)
/* 090AB0 001909B0 D401013C */  lui         $1, %hi(EdEventInfo + 0x250)
/* 090AB4 001909B4 20D4228C */  lw          $2, %lo(EdEventInfo + 0x250)($1)
/* 090AB8 001909B8 04004014 */  bnez        $2, .L001909CC
/* 090ABC 001909BC 00000000 */   nop
/* 090AC0 001909C0 01000224 */  addiu       $2, $0, 0x1
/* 090AC4 001909C4 2D000010 */  b           .L00190A7C
/* 090AC8 001909C8 00000000 */   nop
.L001909CC:
/* 090ACC 001909CC D401013C */  lui         $1, %hi(EdEventInfo + 0x24C)
/* 090AD0 001909D0 1CD4228C */  lw          $2, %lo(EdEventInfo + 0x24C)($1)
/* 090AD4 001909D4 0400401C */  bgtz        $2, .L001909E8
/* 090AD8 001909D8 00000000 */   nop
/* 090ADC 001909DC 01000224 */  addiu       $2, $0, 0x1
/* 090AE0 001909E0 26000010 */  b           .L00190A7C
/* 090AE4 001909E4 00000000 */   nop
.L001909E8:
/* 090AE8 001909E8 08009124 */  addiu       $17, $4, 0x8
/* 090AEC 001909EC D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 090AF0 001909F0 00000000 */   nop
/* 090AF4 001909F4 28864070 */  paddub      $16, $2, $0
/* 090AF8 001909F8 28262072 */  paddub      $4, $17, $0
/* 090AFC 001909FC 08009124 */  addiu       $17, $4, 0x8
/* 090B00 00190A00 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 090B04 00190A04 00000000 */   nop
/* 090B08 00190A08 282E4070 */  paddub      $5, $2, $0
/* 090B0C 00190A0C 0600A004 */  bltz        $5, .L00190A28
/* 090B10 00190A10 00000000 */   nop
/* 090B14 00190A14 D401013C */  lui         $1, %hi(EdEventInfo + 0x24C)
/* 090B18 00190A18 1CD4228C */  lw          $2, %lo(EdEventInfo + 0x24C)($1)
/* 090B1C 00190A1C 2A10A200 */  slt         $2, $5, $2
/* 090B20 00190A20 04004014 */  bnez        $2, .L00190A34
/* 090B24 00190A24 00000000 */   nop
.L00190A28:
/* 090B28 00190A28 28160070 */  paddub      $2, $0, $0
/* 090B2C 00190A2C 13000010 */  b           .L00190A7C
/* 090B30 00190A30 00000000 */   nop
.L00190A34:
/* 090B34 00190A34 28262072 */  paddub      $4, $17, $0
/* 090B38 00190A38 F428060C */  jal         GetStackString__FP12RS_STACKDATA
/* 090B3C 00190A3C 00000000 */   nop
/* 090B40 00190A40 C0180500 */  sll         $3, $5, 3
/* 090B44 00190A44 23206500 */  subu        $4, $3, $5
/* 090B48 00190A48 80180400 */  sll         $3, $4, 2
/* 090B4C 00190A4C 23186400 */  subu        $3, $3, $4
/* 090B50 00190A50 40210300 */  sll         $4, $3, 5
/* 090B54 00190A54 D401013C */  lui         $1, %hi(EdEventInfo + 0x250)
/* 090B58 00190A58 20D4238C */  lw          $3, %lo(EdEventInfo + 0x250)($1)
/* 090B5C 00190A5C 21286400 */  addu        $5, $3, $4
/* 090B60 00190A60 28260072 */  paddub      $4, $16, $0
/* 090B64 00190A64 28364070 */  paddub      $6, $2, $0
/* 090B68 00190A68 1C29060C */  jal         SetObjHandle__FiP9CMapPartsPc
/* 090B6C 00190A6C 00000000 */   nop
/* 090B70 00190A70 01000324 */  addiu       $3, $0, 0x1
/* 090B74 00190A74 0A180200 */  movz        $3, $0, $2
/* 090B78 00190A78 28166070 */  paddub      $2, $3, $0
.L00190A7C:
/* 090B7C 00190A7C 2000BF7B */  lq          $31, 0x20($29)
/* 090B80 00190A80 1000B17B */  lq          $17, 0x10($29)
/* 090B84 00190A84 0000B07B */  lq          $16, 0x0($29)
/* 090B88 00190A88 3000BD27 */  addiu       $29, $29, 0x30
/* 090B8C 00190A8C 0800E003 */  jr          $31
/* 090B90 00190A90 00000000 */   nop
/* 090B94 00190A94 00000000 */  nop
/* 090B98 00190A98 00000000 */  nop
/* 090B9C 00190A9C 00000000 */  nop
