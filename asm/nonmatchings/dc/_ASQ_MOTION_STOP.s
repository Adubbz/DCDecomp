.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ASQ_MOTION_STOP__FP12RS_STACKDATAi
/* 94A50 00194950 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 94A54 00194954 0000BF7F */  sq         $31, 0x0($sp)
/* 94A58 00194958 28168070 */  paddub     $2, $4, $0
/* 94A5C 0019495C 2836A070 */  paddub     $6, $5, $0
/* 94A60 00194960 06000424 */  addiu      $4, $0, 0x6
/* 94A64 00194964 282E4070 */  paddub     $5, $2, $0
/* 94A68 00194968 0452060C */  jal        asq_motion_play__FiP12RS_STACKDATAi
/* 94A6C 0019496C 00000000 */   nop
/* 94A70 00194970 0000BF7B */  lq         $31, 0x0($sp)
/* 94A74 00194974 1000BD27 */  addiu      $sp, $sp, 0x10
/* 94A78 00194978 0800E003 */  jr         $31
/* 94A7C 0019497C 00000000 */   nop
