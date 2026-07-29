.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetFileName__FPcPc
/* 08B8B0 0018B7B0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08B8B4 0018B7B4 2000BF7F */  sq          $31, 0x20($29)
/* 08B8B8 0018B7B8 1000B17F */  sq          $17, 0x10($29)
/* 08B8BC 0018B7BC 0000B07F */  sq          $16, 0x0($29)
/* 08B8C0 0018B7C0 288E8070 */  paddub      $17, $4, $0
/* 08B8C4 0018B7C4 2886A070 */  paddub      $16, $5, $0
/* 08B8C8 0018B7C8 0000A380 */  lb          $3, 0x0($5)
/* 08B8CC 0018B7CC 2F000224 */  addiu       $2, $0, 0x2F
/* 08B8D0 0018B7D0 06006214 */  bne         $3, $2, .L0018B7EC
/* 08B8D4 0018B7D4 00000000 */   nop
/* 08B8D8 0018B7D8 01000526 */  addiu       $5, $16, 0x1
/* 08B8DC 0018B7DC 5A15040C */  jal         strcpy
/* 08B8E0 0018B7E0 00000000 */   nop
/* 08B8E4 0018B7E4 09000010 */  b           .L0018B80C
/* 08B8E8 0018B7E8 00000000 */   nop
.L0018B7EC:
/* 08B8EC 0018B7EC D401023C */  lui         $2, %hi(CurrentDir__4)
/* 08B8F0 0018B7F0 A0EE4524 */  addiu       $5, $2, %lo(CurrentDir__4)
/* 08B8F4 0018B7F4 5A15040C */  jal         strcpy
/* 08B8F8 0018B7F8 00000000 */   nop
/* 08B8FC 0018B7FC 28262072 */  paddub      $4, $17, $0
/* 08B900 0018B800 282E0072 */  paddub      $5, $16, $0
/* 08B904 0018B804 BC14040C */  jal         strcat
/* 08B908 0018B808 00000000 */   nop
.L0018B80C:
/* 08B90C 0018B80C 2000BF7B */  lq          $31, 0x20($29)
/* 08B910 0018B810 1000B17B */  lq          $17, 0x10($29)
/* 08B914 0018B814 0000B07B */  lq          $16, 0x0($29)
/* 08B918 0018B818 3000BD27 */  addiu       $29, $29, 0x30
/* 08B91C 0018B81C 0800E003 */  jr          $31
/* 08B920 0018B820 00000000 */   nop
/* 08B924 0018B824 00000000 */  nop
/* 08B928 0018B828 00000000 */  nop
/* 08B92C 0018B82C 00000000 */  nop
