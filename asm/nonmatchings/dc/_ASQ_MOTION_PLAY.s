.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ASQ_MOTION_PLAY__FP12RS_STACKDATAi
/* 94A20 00194920 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 94A24 00194924 0000BF7F */  sq         $31, 0x0($sp)
/* 94A28 00194928 28168070 */  paddub     $2, $4, $0
/* 94A2C 0019492C 2836A070 */  paddub     $6, $5, $0
/* 94A30 00194930 05000424 */  addiu      $4, $0, 0x5
/* 94A34 00194934 282E4070 */  paddub     $5, $2, $0
/* 94A38 00194938 0452060C */  jal        asq_motion_play__FiP12RS_STACKDATAi
/* 94A3C 0019493C 00000000 */   nop
/* 94A40 00194940 0000BF7B */  lq         $31, 0x0($sp)
/* 94A44 00194944 1000BD27 */  addiu      $sp, $sp, 0x10
/* 94A48 00194948 0800E003 */  jr         $31
/* 94A4C 0019494C 00000000 */   nop
