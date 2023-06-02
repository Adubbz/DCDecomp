.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STOP_AMB_BGM__FP12RS_STACKDATAi
/* 96130 00196030 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 96134 00196034 0000BF7F */  sq         $31, 0x0($sp)
/* 96138 00196038 646C050C */  jal        SndAmbientStop__Fv
/* 9613C 0019603C 00000000 */   nop
/* 96140 00196040 01000224 */  addiu      $2, $0, 0x1
/* 96144 00196044 0000BF7B */  lq         $31, 0x0($sp)
/* 96148 00196048 1000BD27 */  addiu      $sp, $sp, 0x10
/* 9614C 0019604C 0800E003 */  jr         $31
/* 96150 00196050 00000000 */   nop
/* 96154 00196054 00000000 */  nop
/* 96158 00196058 00000000 */  nop
/* 9615C 0019605C 00000000 */  nop
