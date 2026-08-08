.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadPackData3__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 039990 00139890 E0FFBD27 */  addiu       $29, $29, -0x20
/* 039994 00139894 1000BF7F */  sq          $31, 0x10($29)
/* 039998 00139898 281E0071 */  paddub      $3, $8, $0
/* 03999C 0013989C 28162071 */  paddub      $2, $9, $0
/* 0399A0 001398A0 0000ABFF */  sd          $11, 0x0($29)
/* 0399A4 001398A4 0800AAFF */  sd          $10, 0x8($29)
/* 0399A8 001398A8 2846E070 */  paddub      $8, $7, $0
/* 0399AC 001398AC 284EE070 */  paddub      $9, $7, $0
/* 0399B0 001398B0 28566070 */  paddub      $10, $3, $0
/* 0399B4 001398B4 285E4070 */  paddub      $11, $2, $0
/* 0399B8 001398B8 44E7040C */  jal         ReadInfo__FP10CCharacterPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 0399BC 001398BC 00000000 */   nop
/* 0399C0 001398C0 1000BF7B */  lq          $31, 0x10($29)
/* 0399C4 001398C4 2000BD27 */  addiu       $29, $29, 0x20
/* 0399C8 001398C8 0800E003 */  jr          $31
/* 0399CC 001398CC 00000000 */   nop
