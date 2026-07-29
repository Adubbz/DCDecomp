.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SITEM_LOST__FP12RS_STACKDATAi
/* 095870 00195770 D0FFBD27 */  addiu       $29, $29, -0x30
/* 095874 00195774 2000BF7F */  sq          $31, 0x20($29)
/* 095878 00195778 1000B17F */  sq          $17, 0x10($29)
/* 09587C 0019577C 0000B07F */  sq          $16, 0x0($29)
/* 095880 00195780 288E8070 */  paddub      $17, $4, $0
/* 095884 00195784 1C8D848F */  lw          $4, -0x72E4($28)
/* 095888 00195788 7860050C */  jal         GetDngStatus__9CSaveDataFv
/* 09588C 0019578C 00000000 */   nop
/* 095890 00195790 28864070 */  paddub      $16, $2, $0
/* 095894 00195794 28262072 */  paddub      $4, $17, $0
/* 095898 00195798 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 09589C 0019579C 00000000 */   nop
/* 0958A0 001957A0 28260072 */  paddub      $4, $16, $0
/* 0958A4 001957A4 282E4070 */  paddub      $5, $2, $0
/* 0958A8 001957A8 D8F6060C */  jal         LostItem__14CDngStatusDataFi
/* 0958AC 001957AC 00000000 */   nop
/* 0958B0 001957B0 01000224 */  addiu       $2, $0, 0x1
/* 0958B4 001957B4 2000BF7B */  lq          $31, 0x20($29)
/* 0958B8 001957B8 1000B17B */  lq          $17, 0x10($29)
/* 0958BC 001957BC 0000B07B */  lq          $16, 0x0($29)
/* 0958C0 001957C0 3000BD27 */  addiu       $29, $29, 0x30
/* 0958C4 001957C4 0800E003 */  jr          $31
/* 0958C8 001957C8 00000000 */   nop
/* 0958CC 001957CC 00000000 */  nop
