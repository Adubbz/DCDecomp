.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_OLD_FLOOR_LEVEL__FP12RS_STACKDATAi
/* 0BBB70 001BBA70 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BBB74 001BBA74 0000BF7F */  sq          $31, 0x0($29)
/* 0BBB78 001BBA78 789C828F */  lw          $2, -0x6388($28)
/* 0BBB7C 001BBA7C 03004580 */  lb          $5, 0x3($2)
/* 0BBB80 001BBA80 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BBB84 001BBA84 00000000 */   nop
/* 0BBB88 001BBA88 01000224 */  addiu       $2, $0, 0x1
/* 0BBB8C 001BBA8C 0000BF7B */  lq          $31, 0x0($29)
/* 0BBB90 001BBA90 1000BD27 */  addiu       $29, $29, 0x10
/* 0BBB94 001BBA94 0800E003 */  jr          $31
/* 0BBB98 001BBA98 00000000 */   nop
/* 0BBB9C 001BBA9C 00000000 */  nop
