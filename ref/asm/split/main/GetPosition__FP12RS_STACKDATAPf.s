.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPosition__FP12RS_STACKDATAPf
/* 08B6F0 0018B5F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08B6F4 0018B5F4 0000BF7F */  sq          $31, 0x0($29)
/* 08B6F8 0018B5F8 08008324 */  addiu       $3, $4, 0x8
/* 08B6FC 0018B5FC E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08B700 0018B600 00000000 */   nop
/* 08B704 0018B604 0000A0E4 */  swc1        $f0, 0x0($5)
/* 08B708 0018B608 28266070 */  paddub      $4, $3, $0
/* 08B70C 0018B60C 08008324 */  addiu       $3, $4, 0x8
/* 08B710 0018B610 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08B714 0018B614 00000000 */   nop
/* 08B718 0018B618 0400A0E4 */  swc1        $f0, 0x4($5)
/* 08B71C 0018B61C 28266070 */  paddub      $4, $3, $0
/* 08B720 0018B620 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08B724 0018B624 00000000 */   nop
/* 08B728 0018B628 0800A0E4 */  swc1        $f0, 0x8($5)
/* 08B72C 0018B62C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 08B730 0018B630 0C00A2AC */  sw          $2, 0xC($5)
/* 08B734 0018B634 2826A070 */  paddub      $4, $5, $0
/* 08B738 0018B638 0C2D060C */  jal         GetWorldPos__FPfPf
/* 08B73C 0018B63C 00000000 */   nop
/* 08B740 0018B640 0000BF7B */  lq          $31, 0x0($29)
/* 08B744 0018B644 1000BD27 */  addiu       $29, $29, 0x10
/* 08B748 0018B648 0800E003 */  jr          $31
/* 08B74C 0018B64C 00000000 */   nop
