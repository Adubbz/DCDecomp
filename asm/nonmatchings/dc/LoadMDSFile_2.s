.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadMDSFile__FPUiii
/* 275A0 001274A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 275A4 001274A4 0000BF7F */  sq         $31, 0x0($sp)
/* 275A8 001274A8 2836A070 */  paddub     $6, $5, $0
/* 275AC 001274AC 2B00023C */  lui        $2, %hi(VisualData)
/* 275B0 001274B0 10B04524 */  addiu      $5, $2, %lo(VisualData)
/* 275B4 001274B4 283E0070 */  paddub     $7, $0, $0
/* 275B8 001274B8 28460070 */  paddub     $8, $0, $0
/* 275BC 001274BC AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 275C0 001274C0 00000000 */   nop
/* 275C4 001274C4 0000BF7B */  lq         $31, 0x0($sp)
/* 275C8 001274C8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 275CC 001274CC 0800E003 */  jr         $31
/* 275D0 001274D0 00000000 */   nop
/* 275D4 001274D4 00000000 */  nop
/* 275D8 001274D8 00000000 */  nop
/* 275DC 001274DC 00000000 */  nop
