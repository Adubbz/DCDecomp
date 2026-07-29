.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _APPEAR_VILLAGER_IN__FP12RS_STACKDATAi
/* 08D3D0 0018D2D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08D3D4 0018D2D4 0000BF7F */  sq          $31, 0x0($29)
/* 08D3D8 0018D2D8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08D3DC 0018D2DC 00000000 */   nop
/* 08D3E0 0018D2E0 28264070 */  paddub      $4, $2, $0
/* 08D3E4 0018D2E4 01000524 */  addiu       $5, $0, 0x1
/* 08D3E8 0018D2E8 7415060C */  jal         EdVillagerAppearIn__Fii
/* 08D3EC 0018D2EC 00000000 */   nop
/* 08D3F0 0018D2F0 01000224 */  addiu       $2, $0, 0x1
/* 08D3F4 0018D2F4 0000BF7B */  lq          $31, 0x0($29)
/* 08D3F8 0018D2F8 1000BD27 */  addiu       $29, $29, 0x10
/* 08D3FC 0018D2FC 0800E003 */  jr          $31
/* 08D400 0018D300 00000000 */   nop
/* 08D404 0018D304 00000000 */  nop
/* 08D408 0018D308 00000000 */  nop
/* 08D40C 0018D30C 00000000 */  nop
