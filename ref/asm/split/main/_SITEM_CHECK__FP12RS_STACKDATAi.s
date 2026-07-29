.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SITEM_CHECK__FP12RS_STACKDATAi
/* 0953D0 001952D0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0953D4 001952D4 1000BF7F */  sq          $31, 0x10($29)
/* 0953D8 001952D8 0000B07F */  sq          $16, 0x0($29)
/* 0953DC 001952DC 08009024 */  addiu       $16, $4, 0x8
/* 0953E0 001952E0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0953E4 001952E4 00000000 */   nop
/* 0953E8 001952E8 28264070 */  paddub      $4, $2, $0
/* 0953EC 001952EC 9CCC050C */  jal         EdCheckItem__Fi
/* 0953F0 001952F0 00000000 */   nop
/* 0953F4 001952F4 28260072 */  paddub      $4, $16, $0
/* 0953F8 001952F8 282E4070 */  paddub      $5, $2, $0
/* 0953FC 001952FC F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 095400 00195300 00000000 */   nop
/* 095404 00195304 01000224 */  addiu       $2, $0, 0x1
/* 095408 00195308 1000BF7B */  lq          $31, 0x10($29)
/* 09540C 0019530C 0000B07B */  lq          $16, 0x0($29)
/* 095410 00195310 2000BD27 */  addiu       $29, $29, 0x20
/* 095414 00195314 0800E003 */  jr          $31
/* 095418 00195318 00000000 */   nop
/* 09541C 0019531C 00000000 */  nop
