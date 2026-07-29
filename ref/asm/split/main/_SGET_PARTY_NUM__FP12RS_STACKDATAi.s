.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SGET_PARTY_NUM__FP12RS_STACKDATAi
/* 095530 00195430 E0FFBD27 */  addiu       $29, $29, -0x20
/* 095534 00195434 1000BF7F */  sq          $31, 0x10($29)
/* 095538 00195438 0000B07F */  sq          $16, 0x0($29)
/* 09553C 0019543C 28868070 */  paddub      $16, $4, $0
/* 095540 00195440 1C8D848F */  lw          $4, -0x72E4($28)
/* 095544 00195444 7860050C */  jal         GetDngStatus__9CSaveDataFv
/* 095548 00195448 00000000 */   nop
/* 09554C 0019544C 28260072 */  paddub      $4, $16, $0
/* 095550 00195450 05004580 */  lb          $5, 0x5($2)
/* 095554 00195454 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 095558 00195458 00000000 */   nop
/* 09555C 0019545C 01000224 */  addiu       $2, $0, 0x1
/* 095560 00195460 1000BF7B */  lq          $31, 0x10($29)
/* 095564 00195464 0000B07B */  lq          $16, 0x0($29)
/* 095568 00195468 2000BD27 */  addiu       $29, $29, 0x20
/* 09556C 0019546C 0800E003 */  jr          $31
/* 095570 00195470 00000000 */   nop
/* 095574 00195474 00000000 */  nop
/* 095578 00195478 00000000 */  nop
/* 09557C 0019547C 00000000 */  nop
