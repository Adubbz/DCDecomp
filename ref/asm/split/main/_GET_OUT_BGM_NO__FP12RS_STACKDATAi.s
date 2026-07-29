.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_OUT_BGM_NO__FP12RS_STACKDATAi
/* 095F60 00195E60 F0FFBD27 */  addiu       $29, $29, -0x10
/* 095F64 00195E64 0000BF7F */  sq          $31, 0x0($29)
/* 095F68 00195E68 4090858F */  lw          $5, -0x6FC0($28)
/* 095F6C 00195E6C F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 095F70 00195E70 00000000 */   nop
/* 095F74 00195E74 01000224 */  addiu       $2, $0, 0x1
/* 095F78 00195E78 0000BF7B */  lq          $31, 0x0($29)
/* 095F7C 00195E7C 1000BD27 */  addiu       $29, $29, 0x10
/* 095F80 00195E80 0800E003 */  jr          $31
/* 095F84 00195E84 00000000 */   nop
/* 095F88 00195E88 00000000 */  nop
/* 095F8C 00195E8C 00000000 */  nop
