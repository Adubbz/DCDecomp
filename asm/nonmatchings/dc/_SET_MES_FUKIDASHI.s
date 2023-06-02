.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MES_FUKIDASHI__FP12RS_STACKDATAi
/* 90370 00190270 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 90374 00190274 2000BF7F */  sq         $31, 0x20($sp)
/* 90378 00190278 1000B17F */  sq         $17, 0x10($sp)
/* 9037C 0019027C 0000B07F */  sq         $16, 0x0($sp)
/* 90380 00190280 08009124 */  addiu      $17, $4, 0x8
/* 90384 00190284 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 90388 00190288 00000000 */   nop
/* 9038C 0019028C 28264070 */  paddub     $4, $2, $0
/* 90390 00190290 643E060C */  jal        GetMes__Fi
/* 90394 00190294 00000000 */   nop
/* 90398 00190298 28864070 */  paddub     $16, $2, $0
/* 9039C 0019029C 04000016 */  bnez       $16, .L001902B0
/* 903A0 001902A0 00000000 */   nop
/* 903A4 001902A4 28160070 */  paddub     $2, $0, $0
/* 903A8 001902A8 09000010 */  b          .L001902D0
/* 903AC 001902AC 00000000 */   nop
.L001902B0:
/* 903B0 001902B0 28262072 */  paddub     $4, $17, $0
/* 903B4 001902B4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 903B8 001902B8 00000000 */   nop
/* 903BC 001902BC 28260072 */  paddub     $4, $16, $0
/* 903C0 001902C0 282E4070 */  paddub     $5, $2, $0
/* 903C4 001902C4 EC36050C */  jal        SetMesFukidashi__6ClsMesFi
/* 903C8 001902C8 00000000 */   nop
/* 903CC 001902CC 01000224 */  addiu      $2, $0, 0x1
.L001902D0:
/* 903D0 001902D0 2000BF7B */  lq         $31, 0x20($sp)
/* 903D4 001902D4 1000B17B */  lq         $17, 0x10($sp)
/* 903D8 001902D8 0000B07B */  lq         $16, 0x0($sp)
/* 903DC 001902DC 3000BD27 */  addiu      $sp, $sp, 0x30
/* 903E0 001902E0 0800E003 */  jr         $31
/* 903E4 001902E4 00000000 */   nop
/* 903E8 001902E8 00000000 */  nop
/* 903EC 001902EC 00000000 */  nop
