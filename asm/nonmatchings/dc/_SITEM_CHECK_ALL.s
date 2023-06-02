.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SITEM_CHECK_ALL__FP12RS_STACKDATAi
/* 95420 00195320 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 95424 00195324 1000BF7F */  sq         $31, 0x10($sp)
/* 95428 00195328 0000B07F */  sq         $16, 0x0($sp)
/* 9542C 0019532C 08009024 */  addiu      $16, $4, 0x8
/* 95430 00195330 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95434 00195334 00000000 */   nop
/* 95438 00195338 28264070 */  paddub     $4, $2, $0
/* 9543C 0019533C 4C95080C */  jal        PlayerAllItemCheck__Fi
/* 95440 00195340 00000000 */   nop
/* 95444 00195344 28260072 */  paddub     $4, $16, $0
/* 95448 00195348 282E4070 */  paddub     $5, $2, $0
/* 9544C 0019534C F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 95450 00195350 00000000 */   nop
/* 95454 00195354 01000224 */  addiu      $2, $0, 0x1
/* 95458 00195358 1000BF7B */  lq         $31, 0x10($sp)
/* 9545C 0019535C 0000B07B */  lq         $16, 0x0($sp)
/* 95460 00195360 2000BD27 */  addiu      $sp, $sp, 0x20
/* 95464 00195364 0800E003 */  jr         $31
/* 95468 00195368 00000000 */   nop
/* 9546C 0019536C 00000000 */  nop
