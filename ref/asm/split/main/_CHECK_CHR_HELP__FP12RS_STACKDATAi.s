.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CHECK_CHR_HELP__FP12RS_STACKDATAi
/* 0BD560 001BD460 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD564 001BD464 0000BF7F */  sq          $31, 0x0($29)
/* 0BD568 001BD468 D501013C */  lui         $1, %hi(BtEventInfo + 0xB4)
/* 0BD56C 001BD46C F467258C */  lw          $5, %lo(BtEventInfo + 0xB4)($1)
/* 0BD570 001BD470 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BD574 001BD474 00000000 */   nop
/* 0BD578 001BD478 01000224 */  addiu       $2, $0, 0x1
/* 0BD57C 001BD47C 0000BF7B */  lq          $31, 0x0($29)
/* 0BD580 001BD480 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD584 001BD484 0800E003 */  jr          $31
/* 0BD588 001BD488 00000000 */   nop
/* 0BD58C 001BD48C 00000000 */  nop
