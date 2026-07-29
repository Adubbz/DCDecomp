.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _ASQ_ANIME_TRG__FP12RS_STACKDATAi
/* 094AB0 001949B0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 094AB4 001949B4 3000BF7F */  sq          $31, 0x30($29)
/* 094AB8 001949B8 2000B27F */  sq          $18, 0x20($29)
/* 094ABC 001949BC 1000B17F */  sq          $17, 0x10($29)
/* 094AC0 001949C0 0000B07F */  sq          $16, 0x0($29)
/* 094AC4 001949C4 288EA070 */  paddub      $17, $5, $0
/* 094AC8 001949C8 08009224 */  addiu       $18, $4, 0x8
/* 094ACC 001949CC D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 094AD0 001949D0 00000000 */   nop
/* 094AD4 001949D4 28264070 */  paddub      $4, $2, $0
/* 094AD8 001949D8 242C060C */  jal         GetActSeq__Fi
/* 094ADC 001949DC 00000000 */   nop
/* 094AE0 001949E0 28864070 */  paddub      $16, $2, $0
/* 094AE4 001949E4 04000016 */  bnez        $16, .L001949F8
/* 094AE8 001949E8 00000000 */   nop
/* 094AEC 001949EC 28160070 */  paddub      $2, $0, $0
/* 094AF0 001949F0 0D000010 */  b           .L00194A28
/* 094AF4 001949F4 00000000 */   nop
.L001949F8:
/* 094AF8 001949F8 28160070 */  paddub      $2, $0, $0
/* 094AFC 001949FC 02000324 */  addiu       $3, $0, 0x2
/* 094B00 00194A00 04002316 */  bne         $17, $3, .L00194A14
/* 094B04 00194A04 00000000 */   nop
/* 094B08 00194A08 28264072 */  paddub      $4, $18, $0
/* 094B0C 00194A0C D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 094B10 00194A10 00000000 */   nop
.L00194A14:
/* 094B14 00194A14 28260072 */  paddub      $4, $16, $0
/* 094B18 00194A18 282E4070 */  paddub      $5, $2, $0
/* 094B1C 00194A1C B054050C */  jal         AnimeTrg__10CActionSeqFi
/* 094B20 00194A20 00000000 */   nop
/* 094B24 00194A24 01000224 */  addiu       $2, $0, 0x1
.L00194A28:
/* 094B28 00194A28 3000BF7B */  lq          $31, 0x30($29)
/* 094B2C 00194A2C 2000B27B */  lq          $18, 0x20($29)
/* 094B30 00194A30 1000B17B */  lq          $17, 0x10($29)
/* 094B34 00194A34 0000B07B */  lq          $16, 0x0($29)
/* 094B38 00194A38 4000BD27 */  addiu       $29, $29, 0x40
/* 094B3C 00194A3C 0800E003 */  jr          $31
/* 094B40 00194A40 00000000 */   nop
/* 094B44 00194A44 00000000 */  nop
/* 094B48 00194A48 00000000 */  nop
/* 094B4C 00194A4C 00000000 */  nop
