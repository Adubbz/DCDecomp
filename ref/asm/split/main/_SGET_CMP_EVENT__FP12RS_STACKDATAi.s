.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SGET_CMP_EVENT__FP12RS_STACKDATAi
/* 0907B0 001906B0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0907B4 001906B4 1000BF7F */  sq          $31, 0x10($29)
/* 0907B8 001906B8 0000B07F */  sq          $16, 0x0($29)
/* 0907BC 001906BC 08009024 */  addiu       $16, $4, 0x8
/* 0907C0 001906C0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0907C4 001906C4 00000000 */   nop
/* 0907C8 001906C8 D201033C */  lui         $3, %hi(EditPartsInfo)
/* 0907CC 001906CC F09B6424 */  addiu       $4, $3, %lo(EditPartsInfo)
/* 0907D0 001906D0 282E4070 */  paddub      $5, $2, $0
/* 0907D4 001906D4 4068060C */  jal         GetCompEvent__14CEditPartsInfoFi
/* 0907D8 001906D8 00000000 */   nop
/* 0907DC 001906DC 282E4070 */  paddub      $5, $2, $0
/* 0907E0 001906E0 28260072 */  paddub      $4, $16, $0
/* 0907E4 001906E4 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 0907E8 001906E8 00000000 */   nop
/* 0907EC 001906EC 01000224 */  addiu       $2, $0, 0x1
/* 0907F0 001906F0 1000BF7B */  lq          $31, 0x10($29)
/* 0907F4 001906F4 0000B07B */  lq          $16, 0x0($29)
/* 0907F8 001906F8 2000BD27 */  addiu       $29, $29, 0x20
/* 0907FC 001906FC 0800E003 */  jr          $31
/* 090800 00190700 00000000 */   nop
/* 090804 00190704 00000000 */  nop
/* 090808 00190708 00000000 */  nop
/* 09080C 0019070C 00000000 */  nop
