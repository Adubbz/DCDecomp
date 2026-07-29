.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_MAP_CODE__FP12RS_STACKDATAi
/* 0BD6A0 001BD5A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD6A4 001BD5A4 0000BF7F */  sq          $31, 0x0($29)
/* 0BD6A8 001BD5A8 789C828F */  lw          $2, -0x6388($28)
/* 0BD6AC 001BD5AC 00004280 */  lb          $2, 0x0($2)
/* 0BD6B0 001BD5B0 01004524 */  addiu       $5, $2, 0x1
/* 0BD6B4 001BD5B4 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BD6B8 001BD5B8 00000000 */   nop
/* 0BD6BC 001BD5BC 01000224 */  addiu       $2, $0, 0x1
/* 0BD6C0 001BD5C0 0000BF7B */  lq          $31, 0x0($29)
/* 0BD6C4 001BD5C4 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD6C8 001BD5C8 0800E003 */  jr          $31
/* 0BD6CC 001BD5CC 00000000 */   nop
