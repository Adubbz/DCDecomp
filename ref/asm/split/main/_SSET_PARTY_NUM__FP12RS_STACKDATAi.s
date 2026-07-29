.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SSET_PARTY_NUM__FP12RS_STACKDATAi
/* 095580 00195480 D0FFBD27 */  addiu       $29, $29, -0x30
/* 095584 00195484 2000BF7F */  sq          $31, 0x20($29)
/* 095588 00195488 1000B17F */  sq          $17, 0x10($29)
/* 09558C 0019548C 0000B07F */  sq          $16, 0x0($29)
/* 095590 00195490 288E8070 */  paddub      $17, $4, $0
/* 095594 00195494 1C8D848F */  lw          $4, -0x72E4($28)
/* 095598 00195498 7860050C */  jal         GetDngStatus__9CSaveDataFv
/* 09559C 0019549C 00000000 */   nop
/* 0955A0 001954A0 28864070 */  paddub      $16, $2, $0
/* 0955A4 001954A4 28262072 */  paddub      $4, $17, $0
/* 0955A8 001954A8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0955AC 001954AC 00000000 */   nop
/* 0955B0 001954B0 050002A2 */  sb          $2, 0x5($16)
/* 0955B4 001954B4 01000224 */  addiu       $2, $0, 0x1
/* 0955B8 001954B8 2000BF7B */  lq          $31, 0x20($29)
/* 0955BC 001954BC 1000B17B */  lq          $17, 0x10($29)
/* 0955C0 001954C0 0000B07B */  lq          $16, 0x0($29)
/* 0955C4 001954C4 3000BD27 */  addiu       $29, $29, 0x30
/* 0955C8 001954C8 0800E003 */  jr          $31
/* 0955CC 001954CC 00000000 */   nop
