.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_MAIN_CHARA__FP12RS_STACKDATAi
/* 096A10 00196910 D0FFBD27 */  addiu       $29, $29, -0x30
/* 096A14 00196914 2000BF7F */  sq          $31, 0x20($29)
/* 096A18 00196918 1000B17F */  sq          $17, 0x10($29)
/* 096A1C 0019691C 0000B07F */  sq          $16, 0x0($29)
/* 096A20 00196920 08008324 */  addiu       $3, $4, 0x8
/* 096A24 00196924 F428060C */  jal         GetStackString__FP12RS_STACKDATA
/* 096A28 00196928 00000000 */   nop
/* 096A2C 0019692C 28864070 */  paddub      $16, $2, $0
/* 096A30 00196930 28266070 */  paddub      $4, $3, $0
/* 096A34 00196934 08008324 */  addiu       $3, $4, 0x8
/* 096A38 00196938 F428060C */  jal         GetStackString__FP12RS_STACKDATA
/* 096A3C 0019693C 00000000 */   nop
/* 096A40 00196940 288E4070 */  paddub      $17, $2, $0
/* 096A44 00196944 28266070 */  paddub      $4, $3, $0
/* 096A48 00196948 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 096A4C 0019694C 00000000 */   nop
/* 096A50 00196950 28360070 */  paddub      $6, $0, $0
/* 096A54 00196954 01000324 */  addiu       $3, $0, 0x1
/* 096A58 00196958 03004314 */  bne         $2, $3, .L00196968
/* 096A5C 0019695C 00000000 */   nop
/* 096A60 00196960 D201023C */  lui         $2, %hi(EdVillagerBuffer)
/* 096A64 00196964 60B34624 */  addiu       $6, $2, %lo(EdVillagerBuffer)
.L00196968:
/* 096A68 00196968 28260072 */  paddub      $4, $16, $0
/* 096A6C 0019696C 282E2072 */  paddub      $5, $17, $0
/* 096A70 00196970 2005060C */  jal         EdLoadMainChara__FPcPcP14CDataAlloc2_1_
/* 096A74 00196974 00000000 */   nop
/* 096A78 00196978 01000224 */  addiu       $2, $0, 0x1
/* 096A7C 0019697C 2000BF7B */  lq          $31, 0x20($29)
/* 096A80 00196980 1000B17B */  lq          $17, 0x10($29)
/* 096A84 00196984 0000B07B */  lq          $16, 0x0($29)
/* 096A88 00196988 3000BD27 */  addiu       $29, $29, 0x30
/* 096A8C 0019698C 0800E003 */  jr          $31
/* 096A90 00196990 00000000 */   nop
/* 096A94 00196994 00000000 */  nop
/* 096A98 00196998 00000000 */  nop
/* 096A9C 0019699C 00000000 */  nop
