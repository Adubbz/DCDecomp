.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SITEM_LOST__FP12RS_STACKDATAi
/* 95870 00195770 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 95874 00195774 2000BF7F */  sq         $31, 0x20($sp)
/* 95878 00195778 1000B17F */  sq         $17, 0x10($sp)
/* 9587C 0019577C 0000B07F */  sq         $16, 0x0($sp)
/* 95880 00195780 288E8070 */  paddub     $17, $4, $0
/* 95884 00195784 1C8D848F */  lw         $4, -0x72E4($gp)
/* 95888 00195788 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 9588C 0019578C 00000000 */   nop
/* 95890 00195790 28864070 */  paddub     $16, $2, $0
/* 95894 00195794 28262072 */  paddub     $4, $17, $0
/* 95898 00195798 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9589C 0019579C 00000000 */   nop
/* 958A0 001957A0 28260072 */  paddub     $4, $16, $0
/* 958A4 001957A4 282E4070 */  paddub     $5, $2, $0
/* 958A8 001957A8 D8F6060C */  jal        LostItem__14CDngStatusDataFi
/* 958AC 001957AC 00000000 */   nop
/* 958B0 001957B0 01000224 */  addiu      $2, $0, 0x1
/* 958B4 001957B4 2000BF7B */  lq         $31, 0x20($sp)
/* 958B8 001957B8 1000B17B */  lq         $17, 0x10($sp)
/* 958BC 001957BC 0000B07B */  lq         $16, 0x0($sp)
/* 958C0 001957C0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 958C4 001957C4 0800E003 */  jr         $31
/* 958C8 001957C8 00000000 */   nop
/* 958CC 001957CC 00000000 */  nop
