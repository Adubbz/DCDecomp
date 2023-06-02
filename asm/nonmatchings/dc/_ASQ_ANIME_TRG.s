.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ASQ_ANIME_TRG__FP12RS_STACKDATAi
/* 94AB0 001949B0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 94AB4 001949B4 3000BF7F */  sq         $31, 0x30($sp)
/* 94AB8 001949B8 2000B27F */  sq         $18, 0x20($sp)
/* 94ABC 001949BC 1000B17F */  sq         $17, 0x10($sp)
/* 94AC0 001949C0 0000B07F */  sq         $16, 0x0($sp)
/* 94AC4 001949C4 288EA070 */  paddub     $17, $5, $0
/* 94AC8 001949C8 08009224 */  addiu      $18, $4, 0x8
/* 94ACC 001949CC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94AD0 001949D0 00000000 */   nop
/* 94AD4 001949D4 28264070 */  paddub     $4, $2, $0
/* 94AD8 001949D8 242C060C */  jal        GetActSeq__Fi
/* 94ADC 001949DC 00000000 */   nop
/* 94AE0 001949E0 28864070 */  paddub     $16, $2, $0
/* 94AE4 001949E4 04000016 */  bnez       $16, .L001949F8
/* 94AE8 001949E8 00000000 */   nop
/* 94AEC 001949EC 28160070 */  paddub     $2, $0, $0
/* 94AF0 001949F0 0D000010 */  b          .L00194A28
/* 94AF4 001949F4 00000000 */   nop
.L001949F8:
/* 94AF8 001949F8 28160070 */  paddub     $2, $0, $0
/* 94AFC 001949FC 02000324 */  addiu      $3, $0, 0x2
/* 94B00 00194A00 04002316 */  bne        $17, $3, .L00194A14
/* 94B04 00194A04 00000000 */   nop
/* 94B08 00194A08 28264072 */  paddub     $4, $18, $0
/* 94B0C 00194A0C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94B10 00194A10 00000000 */   nop
.L00194A14:
/* 94B14 00194A14 28260072 */  paddub     $4, $16, $0
/* 94B18 00194A18 282E4070 */  paddub     $5, $2, $0
/* 94B1C 00194A1C B054050C */  jal        AnimeTrg__10CActionSeqFi
/* 94B20 00194A20 00000000 */   nop
/* 94B24 00194A24 01000224 */  addiu      $2, $0, 0x1
.L00194A28:
/* 94B28 00194A28 3000BF7B */  lq         $31, 0x30($sp)
/* 94B2C 00194A2C 2000B27B */  lq         $18, 0x20($sp)
/* 94B30 00194A30 1000B17B */  lq         $17, 0x10($sp)
/* 94B34 00194A34 0000B07B */  lq         $16, 0x0($sp)
/* 94B38 00194A38 4000BD27 */  addiu      $sp, $sp, 0x40
/* 94B3C 00194A3C 0800E003 */  jr         $31
/* 94B40 00194A40 00000000 */   nop
/* 94B44 00194A44 00000000 */  nop
/* 94B48 00194A48 00000000 */  nop
/* 94B4C 00194A4C 00000000 */  nop
