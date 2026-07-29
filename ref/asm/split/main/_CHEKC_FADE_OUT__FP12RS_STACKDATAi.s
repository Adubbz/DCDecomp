.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CHEKC_FADE_OUT__FP12RS_STACKDATAi
/* 0E6110 001E6010 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0E6114 001E6014 1000BF7F */  sq          $31, 0x10($29)
/* 0E6118 001E6018 0000B07F */  sq          $16, 0x0($29)
/* 0E611C 001E601C 28868070 */  paddub      $16, $4, $0
/* 0E6120 001E6020 0426060C */  jal         EdFadeOutCheck__Fv
/* 0E6124 001E6024 00000000 */   nop
/* 0E6128 001E6028 282E4070 */  paddub      $5, $2, $0
/* 0E612C 001E602C 28260072 */  paddub      $4, $16, $0
/* 0E6130 001E6030 B485070C */  jal         SetStack__FP12RS_STACKDATAi__3
/* 0E6134 001E6034 00000000 */   nop
/* 0E6138 001E6038 01000224 */  addiu       $2, $0, 0x1
/* 0E613C 001E603C 1000BF7B */  lq          $31, 0x10($29)
/* 0E6140 001E6040 0000B07B */  lq          $16, 0x0($29)
/* 0E6144 001E6044 2000BD27 */  addiu       $29, $29, 0x20
/* 0E6148 001E6048 0800E003 */  jr          $31
/* 0E614C 001E604C 00000000 */   nop
