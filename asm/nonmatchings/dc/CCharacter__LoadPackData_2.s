.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
/* 39920 00139820 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 39924 00139824 1000BF7F */  sq         $31, 0x10($sp)
/* 39928 00139828 0000A0FF */  sd         $0, 0x0($sp)
/* 3992C 0013982C 0800A0FF */  sd         $0, 0x8($sp)
/* 39930 00139830 28560070 */  paddub     $10, $0, $0
/* 39934 00139834 285E0070 */  paddub     $11, $0, $0
/* 39938 00139838 44E7040C */  jal        ReadInfo__FP10CCharacterPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 3993C 0013983C 00000000 */   nop
/* 39940 00139840 1000BF7B */  lq         $31, 0x10($sp)
/* 39944 00139844 2000BD27 */  addiu      $sp, $sp, 0x20
/* 39948 00139848 0800E003 */  jr         $31
/* 3994C 0013984C 00000000 */   nop
