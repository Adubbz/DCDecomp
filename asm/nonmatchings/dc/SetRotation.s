.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotation__FP12RS_STACKDATAPf
/* 8B830 0018B730 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8B834 0018B734 2000BF7F */  sq         $31, 0x20($sp)
/* 8B838 0018B738 1000B17F */  sq         $17, 0x10($sp)
/* 8B83C 0018B73C 0000B07F */  sq         $16, 0x0($sp)
/* 8B840 0018B740 288E8070 */  paddub     $17, $4, $0
/* 8B844 0018B744 2886A070 */  paddub     $16, $5, $0
/* 8B848 0018B748 0C00A0AC */  sw         $0, 0xC($5)
/* 8B84C 0018B74C 28260072 */  paddub     $4, $16, $0
/* 8B850 0018B750 6C2D060C */  jal        GetLocalRot__FPfPf
/* 8B854 0018B754 00000000 */   nop
/* 8B858 0018B758 28262072 */  paddub     $4, $17, $0
/* 8B85C 0018B75C 08009124 */  addiu      $17, $4, 0x8
/* 8B860 0018B760 00000CC6 */  lwc1       $f12, 0x0($16)
/* 8B864 0018B764 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8B868 0018B768 00000000 */   nop
/* 8B86C 0018B76C 28262072 */  paddub     $4, $17, $0
/* 8B870 0018B770 08009124 */  addiu      $17, $4, 0x8
/* 8B874 0018B774 04000CC6 */  lwc1       $f12, 0x4($16)
/* 8B878 0018B778 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8B87C 0018B77C 00000000 */   nop
/* 8B880 0018B780 28262072 */  paddub     $4, $17, $0
/* 8B884 0018B784 08000CC6 */  lwc1       $f12, 0x8($16)
/* 8B888 0018B788 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8B88C 0018B78C 00000000 */   nop
/* 8B890 0018B790 2000BF7B */  lq         $31, 0x20($sp)
/* 8B894 0018B794 1000B17B */  lq         $17, 0x10($sp)
/* 8B898 0018B798 0000B07B */  lq         $16, 0x0($sp)
/* 8B89C 0018B79C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8B8A0 0018B7A0 0800E003 */  jr         $31
/* 8B8A4 0018B7A4 00000000 */   nop
/* 8B8A8 0018B7A8 00000000 */  nop
/* 8B8AC 0018B7AC 00000000 */  nop
