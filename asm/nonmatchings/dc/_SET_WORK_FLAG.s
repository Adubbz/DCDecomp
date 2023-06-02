.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_WORK_FLAG__FP12RS_STACKDATAi
/* 95320 00195220 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 95324 00195224 2000BF7F */  sq         $31, 0x20($sp)
/* 95328 00195228 1000B17F */  sq         $17, 0x10($sp)
/* 9532C 0019522C 0000B07F */  sq         $16, 0x0($sp)
/* 95330 00195230 08009124 */  addiu      $17, $4, 0x8
/* 95334 00195234 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95338 00195238 00000000 */   nop
/* 9533C 0019523C 28864070 */  paddub     $16, $2, $0
/* 95340 00195240 28262072 */  paddub     $4, $17, $0
/* 95344 00195244 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95348 00195248 00000000 */   nop
/* 9534C 0019524C 28260072 */  paddub     $4, $16, $0
/* 95350 00195250 282E4070 */  paddub     $5, $2, $0
/* 95354 00195254 B428060C */  jal        SetWorkFlag__Fii
/* 95358 00195258 00000000 */   nop
/* 9535C 0019525C 2000BF7B */  lq         $31, 0x20($sp)
/* 95360 00195260 1000B17B */  lq         $17, 0x10($sp)
/* 95364 00195264 0000B07B */  lq         $16, 0x0($sp)
/* 95368 00195268 3000BD27 */  addiu      $sp, $sp, 0x30
/* 9536C 0019526C 0800E003 */  jr         $31
/* 95370 00195270 00000000 */   nop
/* 95374 00195274 00000000 */  nop
/* 95378 00195278 00000000 */  nop
/* 9537C 0019527C 00000000 */  nop
