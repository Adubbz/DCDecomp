.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _ASQ_MOTION_PLAY__FP12RS_STACKDATAi
/* 094A20 00194920 F0FFBD27 */  addiu       $29, $29, -0x10
/* 094A24 00194924 0000BF7F */  sq          $31, 0x0($29)
/* 094A28 00194928 28168070 */  paddub      $2, $4, $0
/* 094A2C 0019492C 2836A070 */  paddub      $6, $5, $0
/* 094A30 00194930 05000424 */  addiu       $4, $0, 0x5
/* 094A34 00194934 282E4070 */  paddub      $5, $2, $0
/* 094A38 00194938 0452060C */  jal         asq_motion_play__FiP12RS_STACKDATAi
/* 094A3C 0019493C 00000000 */   nop
/* 094A40 00194940 0000BF7B */  lq          $31, 0x0($29)
/* 094A44 00194944 1000BD27 */  addiu       $29, $29, 0x10
/* 094A48 00194948 0800E003 */  jr          $31
/* 094A4C 0019494C 00000000 */   nop
