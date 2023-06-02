.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_BGM_VOLF__FP12RS_STACKDATAi
/* 95E80 00195D80 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 95E84 00195D84 0000BF7F */  sq         $31, 0x0($sp)
/* 95E88 00195D88 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 95E8C 00195D8C 00000000 */   nop
/* 95E90 00195D90 06030046 */  mov.s      $f12, $f0
/* 95E94 00195D94 6467050C */  jal        SndSetBgmVolf__Ff
/* 95E98 00195D98 00000000 */   nop
/* 95E9C 00195D9C 01000224 */  addiu      $2, $0, 0x1
/* 95EA0 00195DA0 0000BF7B */  lq         $31, 0x0($sp)
/* 95EA4 00195DA4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 95EA8 00195DA8 0800E003 */  jr         $31
/* 95EAC 00195DAC 00000000 */   nop
