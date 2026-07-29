.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_SND_SYNC__FP12RS_STACKDATAi
/* 095C90 00195B90 E0FFBD27 */  addiu       $29, $29, -0x20
/* 095C94 00195B94 1000BF7F */  sq          $31, 0x10($29)
/* 095C98 00195B98 0000B07F */  sq          $16, 0x0($29)
/* 095C9C 00195B9C 28868070 */  paddub      $16, $4, $0
/* 095CA0 00195BA0 9C65050C */  jal         SndSyncBG__Fv
/* 095CA4 00195BA4 00000000 */   nop
/* 095CA8 00195BA8 28260072 */  paddub      $4, $16, $0
/* 095CAC 00195BAC 282E4070 */  paddub      $5, $2, $0
/* 095CB0 00195BB0 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 095CB4 00195BB4 00000000 */   nop
/* 095CB8 00195BB8 01000224 */  addiu       $2, $0, 0x1
/* 095CBC 00195BBC 1000BF7B */  lq          $31, 0x10($29)
/* 095CC0 00195BC0 0000B07B */  lq          $16, 0x0($29)
/* 095CC4 00195BC4 2000BD27 */  addiu       $29, $29, 0x20
/* 095CC8 00195BC8 0800E003 */  jr          $31
/* 095CCC 00195BCC 00000000 */   nop
