.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_RUBY_ELEMENT__FP12RS_STACKDATAi
/* 0BD110 001BD010 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD114 001BD014 0000BF7F */  sq          $31, 0x0($29)
/* 0BD118 001BD018 809C858F */  lw          $5, -0x6380($28)
/* 0BD11C 001BD01C 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BD120 001BD020 00000000 */   nop
/* 0BD124 001BD024 01000224 */  addiu       $2, $0, 0x1
/* 0BD128 001BD028 0000BF7B */  lq          $31, 0x0($29)
/* 0BD12C 001BD02C 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD130 001BD030 0800E003 */  jr          $31
/* 0BD134 001BD034 00000000 */   nop
/* 0BD138 001BD038 00000000 */  nop
/* 0BD13C 001BD03C 00000000 */  nop
