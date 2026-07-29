.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_MES_POS__FP12RS_STACKDATAi
/* 08FF90 0018FE90 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08FF94 0018FE94 2000BF7F */  sq          $31, 0x20($29)
/* 08FF98 0018FE98 1000B17F */  sq          $17, 0x10($29)
/* 08FF9C 0018FE9C 0000B07F */  sq          $16, 0x0($29)
/* 08FFA0 0018FEA0 08009124 */  addiu       $17, $4, 0x8
/* 08FFA4 0018FEA4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FFA8 0018FEA8 00000000 */   nop
/* 08FFAC 0018FEAC 28264070 */  paddub      $4, $2, $0
/* 08FFB0 0018FEB0 643E060C */  jal         GetMes__Fi
/* 08FFB4 0018FEB4 00000000 */   nop
/* 08FFB8 0018FEB8 28864070 */  paddub      $16, $2, $0
/* 08FFBC 0018FEBC 04000016 */  bnez        $16, .L0018FED0
/* 08FFC0 0018FEC0 00000000 */   nop
/* 08FFC4 0018FEC4 28160070 */  paddub      $2, $0, $0
/* 08FFC8 0018FEC8 06000010 */  b           .L0018FEE4
/* 08FFCC 0018FECC 00000000 */   nop
.L0018FED0:
/* 08FFD0 0018FED0 28262072 */  paddub      $4, $17, $0
/* 08FFD4 0018FED4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FFD8 0018FED8 00000000 */   nop
/* 08FFDC 0018FEDC 540002AE */  sw          $2, 0x54($16)
/* 08FFE0 0018FEE0 01000224 */  addiu       $2, $0, 0x1
.L0018FEE4:
/* 08FFE4 0018FEE4 2000BF7B */  lq          $31, 0x20($29)
/* 08FFE8 0018FEE8 1000B17B */  lq          $17, 0x10($29)
/* 08FFEC 0018FEEC 0000B07B */  lq          $16, 0x0($29)
/* 08FFF0 0018FEF0 3000BD27 */  addiu       $29, $29, 0x30
/* 08FFF4 0018FEF4 0800E003 */  jr          $31
/* 08FFF8 0018FEF8 00000000 */   nop
/* 08FFFC 0018FEFC 00000000 */  nop
