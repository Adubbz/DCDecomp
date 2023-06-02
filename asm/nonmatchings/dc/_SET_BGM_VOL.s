.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_BGM_VOL__FP12RS_STACKDATAi
/* 95E50 00195D50 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 95E54 00195D54 0000BF7F */  sq         $31, 0x0($sp)
/* 95E58 00195D58 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95E5C 00195D5C 00000000 */   nop
/* 95E60 00195D60 28264070 */  paddub     $4, $2, $0
/* 95E64 00195D64 4867050C */  jal        SndSetBgmVol__Fi
/* 95E68 00195D68 00000000 */   nop
/* 95E6C 00195D6C 01000224 */  addiu      $2, $0, 0x1
/* 95E70 00195D70 0000BF7B */  lq         $31, 0x0($sp)
/* 95E74 00195D74 1000BD27 */  addiu      $sp, $sp, 0x10
/* 95E78 00195D78 0800E003 */  jr         $31
/* 95E7C 00195D7C 00000000 */   nop
