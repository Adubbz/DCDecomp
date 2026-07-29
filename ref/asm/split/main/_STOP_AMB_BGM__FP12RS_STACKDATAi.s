.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _STOP_AMB_BGM__FP12RS_STACKDATAi
/* 096130 00196030 F0FFBD27 */  addiu       $29, $29, -0x10
/* 096134 00196034 0000BF7F */  sq          $31, 0x0($29)
/* 096138 00196038 646C050C */  jal         SndAmbientStop__Fv
/* 09613C 0019603C 00000000 */   nop
/* 096140 00196040 01000224 */  addiu       $2, $0, 0x1
/* 096144 00196044 0000BF7B */  lq          $31, 0x0($29)
/* 096148 00196048 1000BD27 */  addiu       $29, $29, 0x10
/* 09614C 0019604C 0800E003 */  jr          $31
/* 096150 00196050 00000000 */   nop
/* 096154 00196054 00000000 */  nop
/* 096158 00196058 00000000 */  nop
/* 09615C 0019605C 00000000 */  nop
