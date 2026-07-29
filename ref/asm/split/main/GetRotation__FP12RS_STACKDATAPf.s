.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRotation__FP12RS_STACKDATAPf
/* 08B7D0 0018B6D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08B7D4 0018B6D4 0000BF7F */  sq          $31, 0x0($29)
/* 08B7D8 0018B6D8 08008324 */  addiu       $3, $4, 0x8
/* 08B7DC 0018B6DC E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08B7E0 0018B6E0 00000000 */   nop
/* 08B7E4 0018B6E4 0000A0E4 */  swc1        $f0, 0x0($5)
/* 08B7E8 0018B6E8 28266070 */  paddub      $4, $3, $0
/* 08B7EC 0018B6EC 08008324 */  addiu       $3, $4, 0x8
/* 08B7F0 0018B6F0 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08B7F4 0018B6F4 00000000 */   nop
/* 08B7F8 0018B6F8 0400A0E4 */  swc1        $f0, 0x4($5)
/* 08B7FC 0018B6FC 28266070 */  paddub      $4, $3, $0
/* 08B800 0018B700 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08B804 0018B704 00000000 */   nop
/* 08B808 0018B708 0800A0E4 */  swc1        $f0, 0x8($5)
/* 08B80C 0018B70C 0C00A0AC */  sw          $0, 0xC($5)
/* 08B810 0018B710 2826A070 */  paddub      $4, $5, $0
/* 08B814 0018B714 342D060C */  jal         GetWorldRot__FPfPf
/* 08B818 0018B718 00000000 */   nop
/* 08B81C 0018B71C 0000BF7B */  lq          $31, 0x0($29)
/* 08B820 0018B720 1000BD27 */  addiu       $29, $29, 0x10
/* 08B824 0018B724 0800E003 */  jr          $31
/* 08B828 0018B728 00000000 */   nop
/* 08B82C 0018B72C 00000000 */  nop
