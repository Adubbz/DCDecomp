.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SSET_PARTY_NUM__FP12RS_STACKDATAi
/* 95580 00195480 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 95584 00195484 2000BF7F */  sq         $31, 0x20($sp)
/* 95588 00195488 1000B17F */  sq         $17, 0x10($sp)
/* 9558C 0019548C 0000B07F */  sq         $16, 0x0($sp)
/* 95590 00195490 288E8070 */  paddub     $17, $4, $0
/* 95594 00195494 1C8D848F */  lw         $4, -0x72E4($gp)
/* 95598 00195498 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 9559C 0019549C 00000000 */   nop
/* 955A0 001954A0 28864070 */  paddub     $16, $2, $0
/* 955A4 001954A4 28262072 */  paddub     $4, $17, $0
/* 955A8 001954A8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 955AC 001954AC 00000000 */   nop
/* 955B0 001954B0 050002A2 */  sb         $2, 0x5($16)
/* 955B4 001954B4 01000224 */  addiu      $2, $0, 0x1
/* 955B8 001954B8 2000BF7B */  lq         $31, 0x20($sp)
/* 955BC 001954BC 1000B17B */  lq         $17, 0x10($sp)
/* 955C0 001954C0 0000B07B */  lq         $16, 0x0($sp)
/* 955C4 001954C4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 955C8 001954C8 0800E003 */  jr         $31
/* 955CC 001954CC 00000000 */   nop
