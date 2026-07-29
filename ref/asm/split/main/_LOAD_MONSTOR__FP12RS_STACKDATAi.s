.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_MONSTOR__FP12RS_STACKDATAi
/* 0BC650 001BC550 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BC654 001BC554 0000BF7F */  sq          $31, 0x0($29)
/* 0BC658 001BC558 28260070 */  paddub      $4, $0, $0
/* 0BC65C 001BC55C CCE4760C */  jal         BtLoadMonstor__Fi
/* 0BC660 001BC560 00000000 */   nop
/* 0BC664 001BC564 B8E4760C */  jal         BtArrengeMonstor__Fv
/* 0BC668 001BC568 00000000 */   nop
/* 0BC66C 001BC56C 01000224 */  addiu       $2, $0, 0x1
/* 0BC670 001BC570 0000BF7B */  lq          $31, 0x0($29)
/* 0BC674 001BC574 1000BD27 */  addiu       $29, $29, 0x10
/* 0BC678 001BC578 0800E003 */  jr          $31
/* 0BC67C 001BC57C 00000000 */   nop
