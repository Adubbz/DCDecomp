.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_PADUP__FP12RS_STACKDATAi
/* 8BA60 0018B960 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8BA64 0018B964 1000BF7F */  sq         $31, 0x10($sp)
/* 8BA68 0018B968 0000B07F */  sq         $16, 0x0($sp)
/* 8BA6C 0018B96C 28868070 */  paddub     $16, $4, $0
/* 8BA70 0018B970 0400A01C */  bgtz       $5, .L0018B984
/* 8BA74 0018B974 00000000 */   nop
/* 8BA78 0018B978 28160070 */  paddub     $2, $0, $0
/* 8BA7C 0018B97C 0D000010 */  b          .L0018B9B4
/* 8BA80 0018B980 00000000 */   nop
.L0018B984:
/* 8BA84 0018B984 CC01023C */  lui        $2, %hi(GamePad)
/* 8BA88 0018B988 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 8BA8C 0018B98C 98AD040C */  jal        GetPadUp__8CGamePadFv
/* 8BA90 0018B990 00000000 */   nop
/* 8BA94 0018B994 28264070 */  paddub     $4, $2, $0
/* 8BA98 0018B998 102E060C */  jal        exch_ok_cancel__Fi
/* 8BA9C 0018B99C 00000000 */   nop
/* 8BAA0 0018B9A0 28260072 */  paddub     $4, $16, $0
/* 8BAA4 0018B9A4 282E4070 */  paddub     $5, $2, $0
/* 8BAA8 0018B9A8 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 8BAAC 0018B9AC 00000000 */   nop
/* 8BAB0 0018B9B0 01000224 */  addiu      $2, $0, 0x1
.L0018B9B4:
/* 8BAB4 0018B9B4 1000BF7B */  lq         $31, 0x10($sp)
/* 8BAB8 0018B9B8 0000B07B */  lq         $16, 0x0($sp)
/* 8BABC 0018B9BC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8BAC0 0018B9C0 0800E003 */  jr         $31
/* 8BAC4 0018B9C4 00000000 */   nop
/* 8BAC8 0018B9C8 00000000 */  nop
/* 8BACC 0018B9CC 00000000 */  nop
