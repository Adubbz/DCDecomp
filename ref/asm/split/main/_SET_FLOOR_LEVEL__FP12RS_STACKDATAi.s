.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_FLOOR_LEVEL__FP12RS_STACKDATAi
/* 0BBB30 001BBA30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BBB34 001BBA34 0000BF7F */  sq          $31, 0x0($29)
/* 0BBB38 001BBA38 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BBB3C 001BBA3C 00000000 */   nop
/* 0BBB40 001BBA40 789C848F */  lw          $4, -0x6388($28)
/* 0BBB44 001BBA44 282E4070 */  paddub      $5, $2, $0
/* 0BBB48 001BBA48 40F6060C */  jal         SetNowFloor__14CDngStatusDataFi
/* 0BBB4C 001BBA4C 00000000 */   nop
/* 0BBB50 001BBA50 01000224 */  addiu       $2, $0, 0x1
/* 0BBB54 001BBA54 0000BF7B */  lq          $31, 0x0($29)
/* 0BBB58 001BBA58 1000BD27 */  addiu       $29, $29, 0x10
/* 0BBB5C 001BBA5C 0800E003 */  jr          $31
/* 0BBB60 001BBA60 00000000 */   nop
/* 0BBB64 001BBA64 00000000 */  nop
/* 0BBB68 001BBA68 00000000 */  nop
/* 0BBB6C 001BBA6C 00000000 */  nop
