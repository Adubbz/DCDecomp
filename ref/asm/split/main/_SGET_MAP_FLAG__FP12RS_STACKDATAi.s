.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SGET_MAP_FLAG__FP12RS_STACKDATAi
/* 0952C0 001951C0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0952C4 001951C4 1000BF7F */  sq          $31, 0x10($29)
/* 0952C8 001951C8 0000B07F */  sq          $16, 0x0($29)
/* 0952CC 001951CC 08009024 */  addiu       $16, $4, 0x8
/* 0952D0 001951D0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0952D4 001951D4 00000000 */   nop
/* 0952D8 001951D8 28264070 */  paddub      $4, $2, $0
/* 0952DC 001951DC 14E0050C */  jal         EdGetMapFlag__Fi
/* 0952E0 001951E0 00000000 */   nop
/* 0952E4 001951E4 2B100200 */  sltu        $2, $0, $2
/* 0952E8 001951E8 01004238 */  xori        $2, $2, 0x1
/* 0952EC 001951EC FF004530 */  andi        $5, $2, 0xFF
/* 0952F0 001951F0 28260072 */  paddub      $4, $16, $0
/* 0952F4 001951F4 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 0952F8 001951F8 00000000 */   nop
/* 0952FC 001951FC 01000224 */  addiu       $2, $0, 0x1
/* 095300 00195200 1000BF7B */  lq          $31, 0x10($29)
/* 095304 00195204 0000B07B */  lq          $16, 0x0($29)
/* 095308 00195208 2000BD27 */  addiu       $29, $29, 0x20
/* 09530C 0019520C 0800E003 */  jr          $31
/* 095310 00195210 00000000 */   nop
/* 095314 00195214 00000000 */  nop
/* 095318 00195218 00000000 */  nop
/* 09531C 0019521C 00000000 */  nop
