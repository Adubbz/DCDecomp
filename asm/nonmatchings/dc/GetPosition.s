.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPosition__FP12RS_STACKDATAPf
/* 8B6F0 0018B5F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8B6F4 0018B5F4 0000BF7F */  sq         $31, 0x0($sp)
/* 8B6F8 0018B5F8 08008324 */  addiu      $3, $4, 0x8
/* 8B6FC 0018B5FC E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8B700 0018B600 00000000 */   nop
/* 8B704 0018B604 0000A0E4 */  swc1       $f0, 0x0($5)
/* 8B708 0018B608 28266070 */  paddub     $4, $3, $0
/* 8B70C 0018B60C 08008324 */  addiu      $3, $4, 0x8
/* 8B710 0018B610 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8B714 0018B614 00000000 */   nop
/* 8B718 0018B618 0400A0E4 */  swc1       $f0, 0x4($5)
/* 8B71C 0018B61C 28266070 */  paddub     $4, $3, $0
/* 8B720 0018B620 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8B724 0018B624 00000000 */   nop
/* 8B728 0018B628 0800A0E4 */  swc1       $f0, 0x8($5)
/* 8B72C 0018B62C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 8B730 0018B630 0C00A2AC */  sw         $2, 0xC($5)
/* 8B734 0018B634 2826A070 */  paddub     $4, $5, $0
/* 8B738 0018B638 0C2D060C */  jal        GetWorldPos__FPfPf
/* 8B73C 0018B63C 00000000 */   nop
/* 8B740 0018B640 0000BF7B */  lq         $31, 0x0($sp)
/* 8B744 0018B644 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8B748 0018B648 0800E003 */  jr         $31
/* 8B74C 0018B64C 00000000 */   nop
