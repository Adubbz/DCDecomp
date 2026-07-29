.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _DELETE_BGM__FP12RS_STACKDATAi
/* 095DC0 00195CC0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 095DC4 00195CC4 0000BF7F */  sq          $31, 0x0($29)
/* 095DC8 00195CC8 E866050C */  jal         SndBgmStop__Fv
/* 095DCC 00195CCC 00000000 */   nop
/* 095DD0 00195CD0 4C66050C */  jal         SndBgmInit__Fv
/* 095DD4 00195CD4 00000000 */   nop
/* 095DD8 00195CD8 01000224 */  addiu       $2, $0, 0x1
/* 095DDC 00195CDC 0000BF7B */  lq          $31, 0x0($29)
/* 095DE0 00195CE0 1000BD27 */  addiu       $29, $29, 0x10
/* 095DE4 00195CE4 0800E003 */  jr          $31
/* 095DE8 00195CE8 00000000 */   nop
/* 095DEC 00195CEC 00000000 */  nop
