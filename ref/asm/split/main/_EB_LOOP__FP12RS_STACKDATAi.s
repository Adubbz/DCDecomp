.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _EB_LOOP__FP12RS_STACKDATAi
/* 0968A0 001967A0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0968A4 001967A4 1000BF7F */  sq          $31, 0x10($29)
/* 0968A8 001967A8 0000B07F */  sq          $16, 0x0($29)
/* 0968AC 001967AC 28868070 */  paddub      $16, $4, $0
/* 0968B0 001967B0 A4A1050C */  jal         EBLoop__Fv
/* 0968B4 001967B4 00000000 */   nop
/* 0968B8 001967B8 28260072 */  paddub      $4, $16, $0
/* 0968BC 001967BC 282E4070 */  paddub      $5, $2, $0
/* 0968C0 001967C0 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 0968C4 001967C4 00000000 */   nop
/* 0968C8 001967C8 01000224 */  addiu       $2, $0, 0x1
/* 0968CC 001967CC 1000BF7B */  lq          $31, 0x10($29)
/* 0968D0 001967D0 0000B07B */  lq          $16, 0x0($29)
/* 0968D4 001967D4 2000BD27 */  addiu       $29, $29, 0x20
/* 0968D8 001967D8 0800E003 */  jr          $31
/* 0968DC 001967DC 00000000 */   nop
