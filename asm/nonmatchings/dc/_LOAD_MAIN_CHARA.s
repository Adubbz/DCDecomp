.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_MAIN_CHARA__FP12RS_STACKDATAi
/* 96A10 00196910 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 96A14 00196914 2000BF7F */  sq         $31, 0x20($sp)
/* 96A18 00196918 1000B17F */  sq         $17, 0x10($sp)
/* 96A1C 0019691C 0000B07F */  sq         $16, 0x0($sp)
/* 96A20 00196920 08008324 */  addiu      $3, $4, 0x8
/* 96A24 00196924 F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 96A28 00196928 00000000 */   nop
/* 96A2C 0019692C 28864070 */  paddub     $16, $2, $0
/* 96A30 00196930 28266070 */  paddub     $4, $3, $0
/* 96A34 00196934 08008324 */  addiu      $3, $4, 0x8
/* 96A38 00196938 F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 96A3C 0019693C 00000000 */   nop
/* 96A40 00196940 288E4070 */  paddub     $17, $2, $0
/* 96A44 00196944 28266070 */  paddub     $4, $3, $0
/* 96A48 00196948 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 96A4C 0019694C 00000000 */   nop
/* 96A50 00196950 28360070 */  paddub     $6, $0, $0
/* 96A54 00196954 01000324 */  addiu      $3, $0, 0x1
/* 96A58 00196958 03004314 */  bne        $2, $3, .L00196968
/* 96A5C 0019695C 00000000 */   nop
/* 96A60 00196960 D201023C */  lui        $2, %hi(EdVillagerBuffer)
/* 96A64 00196964 60B34624 */  addiu      $6, $2, %lo(EdVillagerBuffer)
.L00196968:
/* 96A68 00196968 28260072 */  paddub     $4, $16, $0
/* 96A6C 0019696C 282E2072 */  paddub     $5, $17, $0
/* 96A70 00196970 2005060C */  jal        EdLoadMainChara__FPcPcP14CDataAlloc2_1_
/* 96A74 00196974 00000000 */   nop
/* 96A78 00196978 01000224 */  addiu      $2, $0, 0x1
/* 96A7C 0019697C 2000BF7B */  lq         $31, 0x20($sp)
/* 96A80 00196980 1000B17B */  lq         $17, 0x10($sp)
/* 96A84 00196984 0000B07B */  lq         $16, 0x0($sp)
/* 96A88 00196988 3000BD27 */  addiu      $sp, $sp, 0x30
/* 96A8C 0019698C 0800E003 */  jr         $31
/* 96A90 00196990 00000000 */   nop
/* 96A94 00196994 00000000 */  nop
/* 96A98 00196998 00000000 */  nop
/* 96A9C 0019699C 00000000 */  nop
