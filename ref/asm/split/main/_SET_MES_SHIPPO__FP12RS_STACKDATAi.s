.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_MES_SHIPPO__FP12RS_STACKDATAi
/* 08FED0 0018FDD0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 08FED4 0018FDD4 3000BF7F */  sq          $31, 0x30($29)
/* 08FED8 0018FDD8 2000B27F */  sq          $18, 0x20($29)
/* 08FEDC 0018FDDC 1000B17F */  sq          $17, 0x10($29)
/* 08FEE0 0018FDE0 0000B07F */  sq          $16, 0x0($29)
/* 08FEE4 0018FDE4 288EA070 */  paddub      $17, $5, $0
/* 08FEE8 0018FDE8 08009224 */  addiu       $18, $4, 0x8
/* 08FEEC 0018FDEC D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FEF0 0018FDF0 00000000 */   nop
/* 08FEF4 0018FDF4 28264070 */  paddub      $4, $2, $0
/* 08FEF8 0018FDF8 643E060C */  jal         GetMes__Fi
/* 08FEFC 0018FDFC 00000000 */   nop
/* 08FF00 0018FE00 28864070 */  paddub      $16, $2, $0
/* 08FF04 0018FE04 04000016 */  bnez        $16, .L0018FE18
/* 08FF08 0018FE08 00000000 */   nop
/* 08FF0C 0018FE0C 28160070 */  paddub      $2, $0, $0
/* 08FF10 0018FE10 16000010 */  b           .L0018FE6C
/* 08FF14 0018FE14 00000000 */   nop
.L0018FE18:
/* 08FF18 0018FE18 28264072 */  paddub      $4, $18, $0
/* 08FF1C 0018FE1C 08009224 */  addiu       $18, $4, 0x8
/* 08FF20 0018FE20 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FF24 0018FE24 00000000 */   nop
/* 08FF28 0018FE28 580002AE */  sw          $2, 0x58($16)
/* 08FF2C 0018FE2C 0300212A */  slti        $1, $17, 0x3
/* 08FF30 0018FE30 06002014 */  bnez        $1, .L0018FE4C
/* 08FF34 0018FE34 00000000 */   nop
/* 08FF38 0018FE38 28264072 */  paddub      $4, $18, $0
/* 08FF3C 0018FE3C 08009224 */  addiu       $18, $4, 0x8
/* 08FF40 0018FE40 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FF44 0018FE44 00000000 */   nop
/* 08FF48 0018FE48 700002AE */  sw          $2, 0x70($16)
.L0018FE4C:
/* 08FF4C 0018FE4C 0400212A */  slti        $1, $17, 0x4
/* 08FF50 0018FE50 05002014 */  bnez        $1, .L0018FE68
/* 08FF54 0018FE54 00000000 */   nop
/* 08FF58 0018FE58 28264072 */  paddub      $4, $18, $0
/* 08FF5C 0018FE5C D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FF60 0018FE60 00000000 */   nop
/* 08FF64 0018FE64 6C0002AE */  sw          $2, 0x6C($16)
.L0018FE68:
/* 08FF68 0018FE68 01000224 */  addiu       $2, $0, 0x1
.L0018FE6C:
/* 08FF6C 0018FE6C 3000BF7B */  lq          $31, 0x30($29)
/* 08FF70 0018FE70 2000B27B */  lq          $18, 0x20($29)
/* 08FF74 0018FE74 1000B17B */  lq          $17, 0x10($29)
/* 08FF78 0018FE78 0000B07B */  lq          $16, 0x0($29)
/* 08FF7C 0018FE7C 4000BD27 */  addiu       $29, $29, 0x40
/* 08FF80 0018FE80 0800E003 */  jr          $31
/* 08FF84 0018FE84 00000000 */   nop
/* 08FF88 0018FE88 00000000 */  nop
/* 08FF8C 0018FE8C 00000000 */  nop
