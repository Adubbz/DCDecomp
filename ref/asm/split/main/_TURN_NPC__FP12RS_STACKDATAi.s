.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _TURN_NPC__FP12RS_STACKDATAi
/* 08EDD0 0018ECD0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 08EDD4 0018ECD4 2000BF7F */  sq          $31, 0x20($29)
/* 08EDD8 0018ECD8 1000B17F */  sq          $17, 0x10($29)
/* 08EDDC 0018ECDC 0000B07F */  sq          $16, 0x0($29)
/* 08EDE0 0018ECE0 2886A070 */  paddub      $16, $5, $0
/* 08EDE4 0018ECE4 08009124 */  addiu       $17, $4, 0x8
/* 08EDE8 0018ECE8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08EDEC 0018ECEC 00000000 */   nop
/* 08EDF0 0018ECF0 FFFF0324 */  addiu       $3, $0, -0x1
/* 08EDF4 0018ECF4 07004314 */  bne         $2, $3, .L0018ED14
/* 08EDF8 0018ECF8 00000000 */   nop
/* 08EDFC 0018ECFC FFFF0526 */  addiu       $5, $16, -0x1
/* 08EE00 0018ED00 28262072 */  paddub      $4, $17, $0
/* 08EE04 0018ED04 8038060C */  jal         _TURN_CHARA__FP12RS_STACKDATAi
/* 08EE08 0018ED08 00000000 */   nop
/* 08EE0C 0018ED0C 18000010 */  b           .L0018ED70
/* 08EE10 0018ED10 00000000 */   nop
.L0018ED14:
/* 08EE14 0018ED14 28264070 */  paddub      $4, $2, $0
/* 08EE18 0018ED18 702C060C */  jal         GetNPC__Fi
/* 08EE1C 0018ED1C 00000000 */   nop
/* 08EE20 0018ED20 28864070 */  paddub      $16, $2, $0
/* 08EE24 0018ED24 04000016 */  bnez        $16, .L0018ED38
/* 08EE28 0018ED28 00000000 */   nop
/* 08EE2C 0018ED2C 28160070 */  paddub      $2, $0, $0
/* 08EE30 0018ED30 0F000010 */  b           .L0018ED70
/* 08EE34 0018ED34 00000000 */   nop
.L0018ED38:
/* 08EE38 0018ED38 28262072 */  paddub      $4, $17, $0
/* 08EE3C 0018ED3C 3000A527 */  addiu       $5, $29, 0x30
/* 08EE40 0018ED40 7C2D060C */  jal         GetPosition__FP12RS_STACKDATAPf
/* 08EE44 0018ED44 00000000 */   nop
/* 08EE48 0018ED48 18003126 */  addiu       $17, $17, 0x18
/* 08EE4C 0018ED4C 28262072 */  paddub      $4, $17, $0
/* 08EE50 0018ED50 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08EE54 0018ED54 00000000 */   nop
/* 08EE58 0018ED58 28260072 */  paddub      $4, $16, $0
/* 08EE5C 0018ED5C 3000A527 */  addiu       $5, $29, 0x30
/* 08EE60 0018ED60 06030046 */  mov.s       $f12, $f0
/* 08EE64 0018ED64 382C060C */  jal         turn_chara__FP10CCharacterPff
/* 08EE68 0018ED68 00000000 */   nop
/* 08EE6C 0018ED6C 01000224 */  addiu       $2, $0, 0x1
.L0018ED70:
/* 08EE70 0018ED70 2000BF7B */  lq          $31, 0x20($29)
/* 08EE74 0018ED74 1000B17B */  lq          $17, 0x10($29)
/* 08EE78 0018ED78 0000B07B */  lq          $16, 0x0($29)
/* 08EE7C 0018ED7C 4000BD27 */  addiu       $29, $29, 0x40
/* 08EE80 0018ED80 0800E003 */  jr          $31
/* 08EE84 0018ED84 00000000 */   nop
/* 08EE88 0018ED88 00000000 */  nop
/* 08EE8C 0018ED8C 00000000 */  nop
