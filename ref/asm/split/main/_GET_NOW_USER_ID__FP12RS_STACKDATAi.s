.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_NOW_USER_ID__FP12RS_STACKDATAi
/* 0BCA90 001BC990 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0BCA94 001BC994 2000BF7F */  sq          $31, 0x20($29)
/* 0BCA98 001BC998 1000B17F */  sq          $17, 0x10($29)
/* 0BCA9C 001BC99C 0000B07F */  sq          $16, 0x0($29)
/* 0BCAA0 001BC9A0 288E8070 */  paddub      $17, $4, $0
/* 0BCAA4 001BC9A4 789C828F */  lw          $2, -0x6388($28)
/* 0BCAA8 001BC9A8 04005080 */  lb          $16, 0x4($2)
/* 0BCAAC 001BC9AC 2A00023C */  lui         $2, %hi(LIT_817)
/* 0BCAB0 001BC9B0 38BD4424 */  addiu       $4, $2, %lo(LIT_817)
/* 0BCAB4 001BC9B4 282E0072 */  paddub      $5, $16, $0
/* 0BCAB8 001BC9B8 A611040C */  jal         printf
/* 0BCABC 001BC9BC 00000000 */   nop
/* 0BCAC0 001BC9C0 28262072 */  paddub      $4, $17, $0
/* 0BCAC4 001BC9C4 282E0072 */  paddub      $5, $16, $0
/* 0BCAC8 001BC9C8 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BCACC 001BC9CC 00000000 */   nop
/* 0BCAD0 001BC9D0 01000224 */  addiu       $2, $0, 0x1
/* 0BCAD4 001BC9D4 2000BF7B */  lq          $31, 0x20($29)
/* 0BCAD8 001BC9D8 1000B17B */  lq          $17, 0x10($29)
/* 0BCADC 001BC9DC 0000B07B */  lq          $16, 0x0($29)
/* 0BCAE0 001BC9E0 3000BD27 */  addiu       $29, $29, 0x30
/* 0BCAE4 001BC9E4 0800E003 */  jr          $31
/* 0BCAE8 001BC9E8 00000000 */   nop
/* 0BCAEC 001BC9EC 00000000 */  nop
