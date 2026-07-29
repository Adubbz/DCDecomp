.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _ASQ_MOTION_STOP__FP12RS_STACKDATAi
/* 094A50 00194950 F0FFBD27 */  addiu       $29, $29, -0x10
/* 094A54 00194954 0000BF7F */  sq          $31, 0x0($29)
/* 094A58 00194958 28168070 */  paddub      $2, $4, $0
/* 094A5C 0019495C 2836A070 */  paddub      $6, $5, $0
/* 094A60 00194960 06000424 */  addiu       $4, $0, 0x6
/* 094A64 00194964 282E4070 */  paddub      $5, $2, $0
/* 094A68 00194968 0452060C */  jal         asq_motion_play__FiP12RS_STACKDATAi
/* 094A6C 0019496C 00000000 */   nop
/* 094A70 00194970 0000BF7B */  lq          $31, 0x0($29)
/* 094A74 00194974 1000BD27 */  addiu       $29, $29, 0x10
/* 094A78 00194978 0800E003 */  jr          $31
/* 094A7C 0019497C 00000000 */   nop
