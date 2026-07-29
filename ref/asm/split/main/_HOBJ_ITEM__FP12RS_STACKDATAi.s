.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _HOBJ_ITEM__FP12RS_STACKDATAi
/* 090E70 00190D70 D0FFBD27 */  addiu       $29, $29, -0x30
/* 090E74 00190D74 2000BF7F */  sq          $31, 0x20($29)
/* 090E78 00190D78 1000B17F */  sq          $17, 0x10($29)
/* 090E7C 00190D7C 0000B07F */  sq          $16, 0x0($29)
/* 090E80 00190D80 08009124 */  addiu       $17, $4, 0x8
/* 090E84 00190D84 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 090E88 00190D88 00000000 */   nop
/* 090E8C 00190D8C 28864070 */  paddub      $16, $2, $0
/* 090E90 00190D90 28262072 */  paddub      $4, $17, $0
/* 090E94 00190D94 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 090E98 00190D98 00000000 */   nop
/* 090E9C 00190D9C 28264070 */  paddub      $4, $2, $0
/* 090EA0 00190DA0 A02C060C */  jal         GetItemFrame__Fi
/* 090EA4 00190DA4 00000000 */   nop
/* 090EA8 00190DA8 04004014 */  bnez        $2, .L00190DBC
/* 090EAC 00190DAC 00000000 */   nop
/* 090EB0 00190DB0 28160070 */  paddub      $2, $0, $0
/* 090EB4 00190DB4 08000010 */  b           .L00190DD8
/* 090EB8 00190DB8 00000000 */   nop
.L00190DBC:
/* 090EBC 00190DBC 28260072 */  paddub      $4, $16, $0
/* 090EC0 00190DC0 282E4070 */  paddub      $5, $2, $0
/* 090EC4 00190DC4 E029060C */  jal         SetObjHandle__FiP6CFrame
/* 090EC8 00190DC8 00000000 */   nop
/* 090ECC 00190DCC 01000324 */  addiu       $3, $0, 0x1
/* 090ED0 00190DD0 0A180200 */  movz        $3, $0, $2
/* 090ED4 00190DD4 28166070 */  paddub      $2, $3, $0
.L00190DD8:
/* 090ED8 00190DD8 2000BF7B */  lq          $31, 0x20($29)
/* 090EDC 00190DDC 1000B17B */  lq          $17, 0x10($29)
/* 090EE0 00190DE0 0000B07B */  lq          $16, 0x0($29)
/* 090EE4 00190DE4 3000BD27 */  addiu       $29, $29, 0x30
/* 090EE8 00190DE8 0800E003 */  jr          $31
/* 090EEC 00190DEC 00000000 */   nop
