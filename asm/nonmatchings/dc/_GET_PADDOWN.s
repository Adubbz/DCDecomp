.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_PADDOWN__FP12RS_STACKDATAi
/* 8B9F0 0018B8F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8B9F4 0018B8F4 1000BF7F */  sq         $31, 0x10($sp)
/* 8B9F8 0018B8F8 0000B07F */  sq         $16, 0x0($sp)
/* 8B9FC 0018B8FC 28868070 */  paddub     $16, $4, $0
/* 8BA00 0018B900 0400A01C */  bgtz       $5, .L0018B914
/* 8BA04 0018B904 00000000 */   nop
/* 8BA08 0018B908 28160070 */  paddub     $2, $0, $0
/* 8BA0C 0018B90C 0D000010 */  b          .L0018B944
/* 8BA10 0018B910 00000000 */   nop
.L0018B914:
/* 8BA14 0018B914 CC01023C */  lui        $2, %hi(GamePad)
/* 8BA18 0018B918 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 8BA1C 0018B91C 8CAD040C */  jal        GetPadDown__8CGamePadFv
/* 8BA20 0018B920 00000000 */   nop
/* 8BA24 0018B924 28264070 */  paddub     $4, $2, $0
/* 8BA28 0018B928 102E060C */  jal        exch_ok_cancel__Fi
/* 8BA2C 0018B92C 00000000 */   nop
/* 8BA30 0018B930 28260072 */  paddub     $4, $16, $0
/* 8BA34 0018B934 282E4070 */  paddub     $5, $2, $0
/* 8BA38 0018B938 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 8BA3C 0018B93C 00000000 */   nop
/* 8BA40 0018B940 01000224 */  addiu      $2, $0, 0x1
.L0018B944:
/* 8BA44 0018B944 1000BF7B */  lq         $31, 0x10($sp)
/* 8BA48 0018B948 0000B07B */  lq         $16, 0x0($sp)
/* 8BA4C 0018B94C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8BA50 0018B950 0800E003 */  jr         $31
/* 8BA54 0018B954 00000000 */   nop
/* 8BA58 0018B958 00000000 */  nop
/* 8BA5C 0018B95C 00000000 */  nop
