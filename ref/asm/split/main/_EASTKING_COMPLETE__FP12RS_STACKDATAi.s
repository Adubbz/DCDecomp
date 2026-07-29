.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _EASTKING_COMPLETE__FP12RS_STACKDATAi
/* 0BD2A0 001BD1A0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0BD2A4 001BD1A4 1000BF7F */  sq          $31, 0x10($29)
/* 0BD2A8 001BD1A8 0000B07F */  sq          $16, 0x0($29)
/* 0BD2AC 001BD1AC 28868070 */  paddub      $16, $4, $0
/* 0BD2B0 001BD1B0 B83A080C */  jal         EastKingCheckComplete__Fv
/* 0BD2B4 001BD1B4 00000000 */   nop
/* 0BD2B8 001BD1B8 28260072 */  paddub      $4, $16, $0
/* 0BD2BC 001BD1BC 282E4070 */  paddub      $5, $2, $0
/* 0BD2C0 001BD1C0 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BD2C4 001BD1C4 00000000 */   nop
/* 0BD2C8 001BD1C8 01000224 */  addiu       $2, $0, 0x1
/* 0BD2CC 001BD1CC 1000BF7B */  lq          $31, 0x10($29)
/* 0BD2D0 001BD1D0 0000B07B */  lq          $16, 0x0($29)
/* 0BD2D4 001BD1D4 2000BD27 */  addiu       $29, $29, 0x20
/* 0BD2D8 001BD1D8 0800E003 */  jr          $31
/* 0BD2DC 001BD1DC 00000000 */   nop
