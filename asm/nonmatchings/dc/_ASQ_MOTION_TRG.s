.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ASQ_MOTION_TRG__FP12RS_STACKDATAi
/* 94870 00194770 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 94874 00194774 3000BF7F */  sq         $31, 0x30($sp)
/* 94878 00194778 2000B27F */  sq         $18, 0x20($sp)
/* 9487C 0019477C 1000B17F */  sq         $17, 0x10($sp)
/* 94880 00194780 0000B07F */  sq         $16, 0x0($sp)
/* 94884 00194784 288EA070 */  paddub     $17, $5, $0
/* 94888 00194788 08009224 */  addiu      $18, $4, 0x8
/* 9488C 0019478C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94890 00194790 00000000 */   nop
/* 94894 00194794 28264070 */  paddub     $4, $2, $0
/* 94898 00194798 242C060C */  jal        GetActSeq__Fi
/* 9489C 0019479C 00000000 */   nop
/* 948A0 001947A0 28864070 */  paddub     $16, $2, $0
/* 948A4 001947A4 04000016 */  bnez       $16, .L001947B8
/* 948A8 001947A8 00000000 */   nop
/* 948AC 001947AC 28160070 */  paddub     $2, $0, $0
/* 948B0 001947B0 0D000010 */  b          .L001947E8
/* 948B4 001947B4 00000000 */   nop
.L001947B8:
/* 948B8 001947B8 28160070 */  paddub     $2, $0, $0
/* 948BC 001947BC 02000324 */  addiu      $3, $0, 0x2
/* 948C0 001947C0 04002316 */  bne        $17, $3, .L001947D4
/* 948C4 001947C4 00000000 */   nop
/* 948C8 001947C8 28264072 */  paddub     $4, $18, $0
/* 948CC 001947CC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 948D0 001947D0 00000000 */   nop
.L001947D4:
/* 948D4 001947D4 28260072 */  paddub     $4, $16, $0
/* 948D8 001947D8 282E4070 */  paddub     $5, $2, $0
/* 948DC 001947DC A054050C */  jal        MotionTrg__10CActionSeqFi
/* 948E0 001947E0 00000000 */   nop
/* 948E4 001947E4 01000224 */  addiu      $2, $0, 0x1
.L001947E8:
/* 948E8 001947E8 3000BF7B */  lq         $31, 0x30($sp)
/* 948EC 001947EC 2000B27B */  lq         $18, 0x20($sp)
/* 948F0 001947F0 1000B17B */  lq         $17, 0x10($sp)
/* 948F4 001947F4 0000B07B */  lq         $16, 0x0($sp)
/* 948F8 001947F8 4000BD27 */  addiu      $sp, $sp, 0x40
/* 948FC 001947FC 0800E003 */  jr         $31
/* 94900 00194800 00000000 */   nop
/* 94904 00194804 00000000 */  nop
/* 94908 00194808 00000000 */  nop
/* 9490C 0019480C 00000000 */  nop
