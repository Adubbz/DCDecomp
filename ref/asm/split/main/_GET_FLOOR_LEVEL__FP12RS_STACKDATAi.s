.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_FLOOR_LEVEL__FP12RS_STACKDATAi
/* 0BBB00 001BBA00 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BBB04 001BBA04 0000BF7F */  sq          $31, 0x0($29)
/* 0BBB08 001BBA08 789C828F */  lw          $2, -0x6388($28)
/* 0BBB0C 001BBA0C 02004580 */  lb          $5, 0x2($2)
/* 0BBB10 001BBA10 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BBB14 001BBA14 00000000 */   nop
/* 0BBB18 001BBA18 01000224 */  addiu       $2, $0, 0x1
/* 0BBB1C 001BBA1C 0000BF7B */  lq          $31, 0x0($29)
/* 0BBB20 001BBA20 1000BD27 */  addiu       $29, $29, 0x10
/* 0BBB24 001BBA24 0800E003 */  jr          $31
/* 0BBB28 001BBA28 00000000 */   nop
/* 0BBB2C 001BBA2C 00000000 */  nop
