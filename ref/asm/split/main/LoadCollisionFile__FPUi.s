.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadCollisionFile__FPUi
/* 027900 00127800 F0FFBD27 */  addiu       $29, $29, -0x10
/* 027904 00127804 0000BF7F */  sq          $31, 0x0($29)
/* 027908 00127808 2B00023C */  lui         $2, %hi(VisualData)
/* 02790C 0012780C 10B04524 */  addiu       $5, $2, %lo(VisualData)
/* 027910 00127810 DC9B040C */  jal         LoadCollisionFile__FPUiP14CDataAlloc2_1_
/* 027914 00127814 00000000 */   nop
/* 027918 00127818 0000BF7B */  lq          $31, 0x0($29)
/* 02791C 0012781C 1000BD27 */  addiu       $29, $29, 0x10
/* 027920 00127820 0800E003 */  jr          $31
/* 027924 00127824 00000000 */   nop
/* 027928 00127828 00000000 */  nop
/* 02792C 0012782C 00000000 */  nop
