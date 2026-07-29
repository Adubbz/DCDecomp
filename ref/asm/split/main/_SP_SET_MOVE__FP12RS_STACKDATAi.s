.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SP_SET_MOVE__FP12RS_STACKDATAi
/* 093F20 00193E20 E0FFBD27 */  addiu       $29, $29, -0x20
/* 093F24 00193E24 1000BF7F */  sq          $31, 0x10($29)
/* 093F28 00193E28 0000B07F */  sq          $16, 0x0($29)
/* 093F2C 00193E2C 08009024 */  addiu       $16, $4, 0x8
/* 093F30 00193E30 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 093F34 00193E34 00000000 */   nop
/* 093F38 00193E38 28264070 */  paddub      $4, $2, $0
/* 093F3C 00193E3C 5428060C */  jal         GetSprite__Fi
/* 093F40 00193E40 00000000 */   nop
/* 093F44 00193E44 281E4070 */  paddub      $3, $2, $0
/* 093F48 00193E48 04006014 */  bnez        $3, .L00193E5C
/* 093F4C 00193E4C 00000000 */   nop
/* 093F50 00193E50 28160070 */  paddub      $2, $0, $0
/* 093F54 00193E54 0B000010 */  b           .L00193E84
/* 093F58 00193E58 00000000 */   nop
.L00193E5C:
/* 093F5C 00193E5C 28260072 */  paddub      $4, $16, $0
/* 093F60 00193E60 08009024 */  addiu       $16, $4, 0x8
/* 093F64 00193E64 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 093F68 00193E68 00000000 */   nop
/* 093F6C 00193E6C 2C0060E4 */  swc1        $f0, 0x2C($3)
/* 093F70 00193E70 28260072 */  paddub      $4, $16, $0
/* 093F74 00193E74 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 093F78 00193E78 00000000 */   nop
/* 093F7C 00193E7C 300060E4 */  swc1        $f0, 0x30($3)
/* 093F80 00193E80 01000224 */  addiu       $2, $0, 0x1
.L00193E84:
/* 093F84 00193E84 1000BF7B */  lq          $31, 0x10($29)
/* 093F88 00193E88 0000B07B */  lq          $16, 0x0($29)
/* 093F8C 00193E8C 2000BD27 */  addiu       $29, $29, 0x20
/* 093F90 00193E90 0800E003 */  jr          $31
/* 093F94 00193E94 00000000 */   nop
/* 093F98 00193E98 00000000 */  nop
/* 093F9C 00193E9C 00000000 */  nop
