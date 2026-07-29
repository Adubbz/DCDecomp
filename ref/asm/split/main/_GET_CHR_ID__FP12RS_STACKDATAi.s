.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_CHR_ID__FP12RS_STACKDATAi
/* 0E4970 001E4870 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E4974 001E4874 0000BF7F */  sq          $31, 0x0($29)
/* 0E4978 001E4878 789C828F */  lw          $2, -0x6388($28)
/* 0E497C 001E487C 04004580 */  lb          $5, 0x4($2)
/* 0E4980 001E4880 B485070C */  jal         SetStack__FP12RS_STACKDATAi__3
/* 0E4984 001E4884 00000000 */   nop
/* 0E4988 001E4888 01000224 */  addiu       $2, $0, 0x1
/* 0E498C 001E488C 0000BF7B */  lq          $31, 0x0($29)
/* 0E4990 001E4890 1000BD27 */  addiu       $29, $29, 0x10
/* 0E4994 001E4894 0800E003 */  jr          $31
/* 0E4998 001E4898 00000000 */   nop
/* 0E499C 001E489C 00000000 */  nop
