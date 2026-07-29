.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _HOLD_ITEM_EVENT__FP12RS_STACKDATAi
/* 0BD590 001BD490 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0BD594 001BD494 1000BF7F */  sq          $31, 0x10($29)
/* 0BD598 001BD498 0000B07F */  sq          $16, 0x0($29)
/* 0BD59C 001BD49C 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BD5A0 001BD4A0 00000000 */   nop
/* 0BD5A4 001BD4A4 28864070 */  paddub      $16, $2, $0
/* 0BD5A8 001BD4A8 DF01023C */  lui         $2, %hi(DngEventMan)
/* 0BD5AC 001BD4AC B0364424 */  addiu       $4, $2, %lo(DngEventMan)
/* 0BD5B0 001BD4B0 282E0072 */  paddub      $5, $16, $0
/* 0BD5B4 001BD4B4 9832070C */  jal         SearchItemEventHold__16CDungeonEventManFi
/* 0BD5B8 001BD4B8 00000000 */   nop
/* 0BD5BC 001BD4BC DF01023C */  lui         $2, %hi(UraEventMan)
/* 0BD5C0 001BD4C0 B05E4424 */  addiu       $4, $2, %lo(UraEventMan)
/* 0BD5C4 001BD4C4 282E0072 */  paddub      $5, $16, $0
/* 0BD5C8 001BD4C8 9832070C */  jal         SearchItemEventHold__16CDungeonEventManFi
/* 0BD5CC 001BD4CC 00000000 */   nop
/* 0BD5D0 001BD4D0 01000224 */  addiu       $2, $0, 0x1
/* 0BD5D4 001BD4D4 1000BF7B */  lq          $31, 0x10($29)
/* 0BD5D8 001BD4D8 0000B07B */  lq          $16, 0x0($29)
/* 0BD5DC 001BD4DC 2000BD27 */  addiu       $29, $29, 0x20
/* 0BD5E0 001BD4E0 0800E003 */  jr          $31
/* 0BD5E4 001BD4E4 00000000 */   nop
/* 0BD5E8 001BD4E8 00000000 */  nop
/* 0BD5EC 001BD4EC 00000000 */  nop
