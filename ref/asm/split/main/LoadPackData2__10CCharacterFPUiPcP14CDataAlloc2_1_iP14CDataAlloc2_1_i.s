.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
/* 039950 00139850 E0FFBD27 */  addiu       $29, $29, -0x20
/* 039954 00139854 1000BF7F */  sq          $31, 0x10($29)
/* 039958 00139858 28160071 */  paddub      $2, $8, $0
/* 03995C 0013985C 285E2071 */  paddub      $11, $9, $0
/* 039960 00139860 0000AAFF */  sd          $10, 0x0($29)
/* 039964 00139864 0800A0FF */  sd          $0, 0x8($29)
/* 039968 00139868 2846E070 */  paddub      $8, $7, $0
/* 03996C 0013986C 284EE070 */  paddub      $9, $7, $0
/* 039970 00139870 28564070 */  paddub      $10, $2, $0
/* 039974 00139874 44E7040C */  jal         ReadInfo__FP10CCharacterPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 039978 00139878 00000000 */   nop
/* 03997C 0013987C 1000BF7B */  lq          $31, 0x10($29)
/* 039980 00139880 2000BD27 */  addiu       $29, $29, 0x20
/* 039984 00139884 0800E003 */  jr          $31
/* 039988 00139888 00000000 */   nop
/* 03998C 0013988C 00000000 */  nop
