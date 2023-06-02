.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadCollisionFile__FPUi
/* 27900 00127800 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 27904 00127804 0000BF7F */  sq         $31, 0x0($sp)
/* 27908 00127808 2B00023C */  lui        $2, %hi(VisualData)
/* 2790C 0012780C 10B04524 */  addiu      $5, $2, %lo(VisualData)
/* 27910 00127810 DC9B040C */  jal        LoadCollisionFile__FPUiP14CDataAlloc2_1_
/* 27914 00127814 00000000 */   nop
/* 27918 00127818 0000BF7B */  lq         $31, 0x0($sp)
/* 2791C 0012781C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 27920 00127820 0800E003 */  jr         $31
/* 27924 00127824 00000000 */   nop
/* 27928 00127828 00000000 */  nop
/* 2792C 0012782C 00000000 */  nop
