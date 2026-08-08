.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
/* 039920 00139820 E0FFBD27 */  addiu       $29, $29, -0x20
/* 039924 00139824 1000BF7F */  sq          $31, 0x10($29)
/* 039928 00139828 0000A0FF */  sd          $0, 0x0($29)
/* 03992C 0013982C 0800A0FF */  sd          $0, 0x8($29)
/* 039930 00139830 28560070 */  paddub      $10, $0, $0
/* 039934 00139834 285E0070 */  paddub      $11, $0, $0
/* 039938 00139838 44E7040C */  jal         ReadInfo__FP10CCharacterPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 03993C 0013983C 00000000 */   nop
/* 039940 00139840 1000BF7B */  lq          $31, 0x10($29)
/* 039944 00139844 2000BD27 */  addiu       $29, $29, 0x20
/* 039948 00139848 0800E003 */  jr          $31
/* 03994C 0013984C 00000000 */   nop
