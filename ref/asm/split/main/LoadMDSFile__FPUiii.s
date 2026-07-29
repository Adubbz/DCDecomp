.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadMDSFile__FPUiii
/* 0275A0 001274A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0275A4 001274A4 0000BF7F */  sq          $31, 0x0($29)
/* 0275A8 001274A8 2836A070 */  paddub      $6, $5, $0
/* 0275AC 001274AC 2B00023C */  lui         $2, %hi(VisualData)
/* 0275B0 001274B0 10B04524 */  addiu       $5, $2, %lo(VisualData)
/* 0275B4 001274B4 283E0070 */  paddub      $7, $0, $0
/* 0275B8 001274B8 28460070 */  paddub      $8, $0, $0
/* 0275BC 001274BC AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0275C0 001274C0 00000000 */   nop
/* 0275C4 001274C4 0000BF7B */  lq          $31, 0x0($29)
/* 0275C8 001274C8 1000BD27 */  addiu       $29, $29, 0x10
/* 0275CC 001274CC 0800E003 */  jr          $31
/* 0275D0 001274D0 00000000 */   nop
/* 0275D4 001274D4 00000000 */  nop
/* 0275D8 001274D8 00000000 */  nop
/* 0275DC 001274DC 00000000 */  nop
