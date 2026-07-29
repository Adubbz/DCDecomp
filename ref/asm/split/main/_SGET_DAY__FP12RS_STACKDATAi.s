.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SGET_DAY__FP12RS_STACKDATAi
/* 095B40 00195A40 E0FFBD27 */  addiu       $29, $29, -0x20
/* 095B44 00195A44 1000BF7F */  sq          $31, 0x10($29)
/* 095B48 00195A48 0000B07F */  sq          $16, 0x0($29)
/* 095B4C 00195A4C 28868070 */  paddub      $16, $4, $0
/* 095B50 00195A50 1C8D848F */  lw          $4, -0x72E4($28)
/* 095B54 00195A54 405F050C */  jal         GetDay__9CSaveDataFv
/* 095B58 00195A58 00000000 */   nop
/* 095B5C 00195A5C 28260072 */  paddub      $4, $16, $0
/* 095B60 00195A60 282E4070 */  paddub      $5, $2, $0
/* 095B64 00195A64 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 095B68 00195A68 00000000 */   nop
/* 095B6C 00195A6C 01000224 */  addiu       $2, $0, 0x1
/* 095B70 00195A70 1000BF7B */  lq          $31, 0x10($29)
/* 095B74 00195A74 0000B07B */  lq          $16, 0x0($29)
/* 095B78 00195A78 2000BD27 */  addiu       $29, $29, 0x20
/* 095B7C 00195A7C 0800E003 */  jr          $31
/* 095B80 00195A80 00000000 */   nop
/* 095B84 00195A84 00000000 */  nop
/* 095B88 00195A88 00000000 */  nop
/* 095B8C 00195A8C 00000000 */  nop
