.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ASQ_MOTION_NEXT__FP12RS_STACKDATAi
/* 94A80 00194980 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 94A84 00194984 0000BF7F */  sq         $31, 0x0($sp)
/* 94A88 00194988 28168070 */  paddub     $2, $4, $0
/* 94A8C 0019498C 2836A070 */  paddub     $6, $5, $0
/* 94A90 00194990 07000424 */  addiu      $4, $0, 0x7
/* 94A94 00194994 282E4070 */  paddub     $5, $2, $0
/* 94A98 00194998 0452060C */  jal        asq_motion_play__FiP12RS_STACKDATAi
/* 94A9C 0019499C 00000000 */   nop
/* 94AA0 001949A0 0000BF7B */  lq         $31, 0x0($sp)
/* 94AA4 001949A4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 94AA8 001949A8 0800E003 */  jr         $31
/* 94AAC 001949AC 00000000 */   nop
