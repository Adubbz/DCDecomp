.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SSET_CMP_EVENT__FP12RS_STACKDATAi
/* 090810 00190710 D0FFBD27 */  addiu       $29, $29, -0x30
/* 090814 00190714 2000BF7F */  sq          $31, 0x20($29)
/* 090818 00190718 1000B17F */  sq          $17, 0x10($29)
/* 09081C 0019071C 0000B07F */  sq          $16, 0x0($29)
/* 090820 00190720 08009124 */  addiu       $17, $4, 0x8
/* 090824 00190724 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 090828 00190728 00000000 */   nop
/* 09082C 0019072C 28864070 */  paddub      $16, $2, $0
/* 090830 00190730 28262072 */  paddub      $4, $17, $0
/* 090834 00190734 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 090838 00190738 00000000 */   nop
/* 09083C 0019073C D201033C */  lui         $3, %hi(EditPartsInfo)
/* 090840 00190740 F09B6424 */  addiu       $4, $3, %lo(EditPartsInfo)
/* 090844 00190744 282E0072 */  paddub      $5, $16, $0
/* 090848 00190748 28364070 */  paddub      $6, $2, $0
/* 09084C 0019074C 2868060C */  jal         SetCompEvent__14CEditPartsInfoFii
/* 090850 00190750 00000000 */   nop
/* 090854 00190754 01000224 */  addiu       $2, $0, 0x1
/* 090858 00190758 2000BF7B */  lq          $31, 0x20($29)
/* 09085C 0019075C 1000B17B */  lq          $17, 0x10($29)
/* 090860 00190760 0000B07B */  lq          $16, 0x0($29)
/* 090864 00190764 3000BD27 */  addiu       $29, $29, 0x30
/* 090868 00190768 0800E003 */  jr          $31
/* 09086C 0019076C 00000000 */   nop
