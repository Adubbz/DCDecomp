.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_QUEST_DUNGEON__FP12RS_STACKDATAi
/* 0BD640 001BD540 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0BD644 001BD544 2000BF7F */  sq          $31, 0x20($29)
/* 0BD648 001BD548 1000B17F */  sq          $17, 0x10($29)
/* 0BD64C 001BD54C 0000B07F */  sq          $16, 0x0($29)
/* 0BD650 001BD550 08009124 */  addiu       $17, $4, 0x8
/* 0BD654 001BD554 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BD658 001BD558 00000000 */   nop
/* 0BD65C 001BD55C 28864070 */  paddub      $16, $2, $0
/* 0BD660 001BD560 28262072 */  paddub      $4, $17, $0
/* 0BD664 001BD564 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BD668 001BD568 00000000 */   nop
/* 0BD66C 001BD56C 1C8D848F */  lw          $4, -0x72E4($28)
/* 0BD670 001BD570 282E0072 */  paddub      $5, $16, $0
/* 0BD674 001BD574 28364070 */  paddub      $6, $2, $0
/* 0BD678 001BD578 1C62050C */  jal         QuestDungeon__9CSaveDataFii
/* 0BD67C 001BD57C 00000000 */   nop
/* 0BD680 001BD580 01000224 */  addiu       $2, $0, 0x1
/* 0BD684 001BD584 2000BF7B */  lq          $31, 0x20($29)
/* 0BD688 001BD588 1000B17B */  lq          $17, 0x10($29)
/* 0BD68C 001BD58C 0000B07B */  lq          $16, 0x0($29)
/* 0BD690 001BD590 3000BD27 */  addiu       $29, $29, 0x30
/* 0BD694 001BD594 0800E003 */  jr          $31
/* 0BD698 001BD598 00000000 */   nop
/* 0BD69C 001BD59C 00000000 */  nop
