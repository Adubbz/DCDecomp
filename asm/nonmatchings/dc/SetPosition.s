.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPosition__FP12RS_STACKDATAPf
/* 8B750 0018B650 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8B754 0018B654 2000BF7F */  sq         $31, 0x20($sp)
/* 8B758 0018B658 1000B17F */  sq         $17, 0x10($sp)
/* 8B75C 0018B65C 0000B07F */  sq         $16, 0x0($sp)
/* 8B760 0018B660 288E8070 */  paddub     $17, $4, $0
/* 8B764 0018B664 2886A070 */  paddub     $16, $5, $0
/* 8B768 0018B668 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 8B76C 0018B66C 0C00A2AC */  sw         $2, 0xC($5)
/* 8B770 0018B670 28260072 */  paddub     $4, $16, $0
/* 8B774 0018B674 442D060C */  jal        GetLocalPos__FPfPf
/* 8B778 0018B678 00000000 */   nop
/* 8B77C 0018B67C 28262072 */  paddub     $4, $17, $0
/* 8B780 0018B680 08009124 */  addiu      $17, $4, 0x8
/* 8B784 0018B684 00000CC6 */  lwc1       $f12, 0x0($16)
/* 8B788 0018B688 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8B78C 0018B68C 00000000 */   nop
/* 8B790 0018B690 28262072 */  paddub     $4, $17, $0
/* 8B794 0018B694 08009124 */  addiu      $17, $4, 0x8
/* 8B798 0018B698 04000CC6 */  lwc1       $f12, 0x4($16)
/* 8B79C 0018B69C 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8B7A0 0018B6A0 00000000 */   nop
/* 8B7A4 0018B6A4 28262072 */  paddub     $4, $17, $0
/* 8B7A8 0018B6A8 08000CC6 */  lwc1       $f12, 0x8($16)
/* 8B7AC 0018B6AC 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8B7B0 0018B6B0 00000000 */   nop
/* 8B7B4 0018B6B4 2000BF7B */  lq         $31, 0x20($sp)
/* 8B7B8 0018B6B8 1000B17B */  lq         $17, 0x10($sp)
/* 8B7BC 0018B6BC 0000B07B */  lq         $16, 0x0($sp)
/* 8B7C0 0018B6C0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8B7C4 0018B6C4 0800E003 */  jr         $31
/* 8B7C8 0018B6C8 00000000 */   nop
/* 8B7CC 0018B6CC 00000000 */  nop
