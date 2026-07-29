.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SATRA_PARTS_GET__FP12RS_STACKDATAi
/* 0958D0 001957D0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0958D4 001957D4 2000BF7F */  sq          $31, 0x20($29)
/* 0958D8 001957D8 1000B17F */  sq          $17, 0x10($29)
/* 0958DC 001957DC 0000B07F */  sq          $16, 0x0($29)
/* 0958E0 001957E0 08009124 */  addiu       $17, $4, 0x8
/* 0958E4 001957E4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0958E8 001957E8 00000000 */   nop
/* 0958EC 001957EC FFFF5024 */  addiu       $16, $2, -0x1
/* 0958F0 001957F0 28262072 */  paddub      $4, $17, $0
/* 0958F4 001957F4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0958F8 001957F8 00000000 */   nop
/* 0958FC 001957FC 1C8D848F */  lw          $4, -0x72E4($28)
/* 095900 00195800 282E0072 */  paddub      $5, $16, $0
/* 095904 00195804 28364070 */  paddub      $6, $2, $0
/* 095908 00195808 9861050C */  jal         AtraPartsGet__9CSaveDataFii
/* 09590C 0019580C 00000000 */   nop
/* 095910 00195810 2000BF7B */  lq          $31, 0x20($29)
/* 095914 00195814 1000B17B */  lq          $17, 0x10($29)
/* 095918 00195818 0000B07B */  lq          $16, 0x0($29)
/* 09591C 0019581C 3000BD27 */  addiu       $29, $29, 0x30
/* 095920 00195820 0800E003 */  jr          $31
/* 095924 00195824 00000000 */   nop
/* 095928 00195828 00000000 */  nop
/* 09592C 0019582C 00000000 */  nop
