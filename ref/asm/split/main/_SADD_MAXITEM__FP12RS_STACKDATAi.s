.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SADD_MAXITEM__FP12RS_STACKDATAi
/* 095840 00195740 F0FFBD27 */  addiu       $29, $29, -0x10
/* 095844 00195744 0000BF7F */  sq          $31, 0x0($29)
/* 095848 00195748 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 09584C 0019574C 00000000 */   nop
/* 095850 00195750 28264070 */  paddub      $4, $2, $0
/* 095854 00195754 60CC050C */  jal         EdAddMaxItem__Fi
/* 095858 00195758 00000000 */   nop
/* 09585C 0019575C 01000224 */  addiu       $2, $0, 0x1
/* 095860 00195760 0000BF7B */  lq          $31, 0x0($29)
/* 095864 00195764 1000BD27 */  addiu       $29, $29, 0x10
/* 095868 00195768 0800E003 */  jr          $31
/* 09586C 0019576C 00000000 */   nop
