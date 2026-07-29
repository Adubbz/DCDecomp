.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SITEM_CHECK_ALL__FP12RS_STACKDATAi
/* 095420 00195320 E0FFBD27 */  addiu       $29, $29, -0x20
/* 095424 00195324 1000BF7F */  sq          $31, 0x10($29)
/* 095428 00195328 0000B07F */  sq          $16, 0x0($29)
/* 09542C 0019532C 08009024 */  addiu       $16, $4, 0x8
/* 095430 00195330 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 095434 00195334 00000000 */   nop
/* 095438 00195338 28264070 */  paddub      $4, $2, $0
/* 09543C 0019533C 4C95080C */  jal         PlayerAllItemCheck__Fi
/* 095440 00195340 00000000 */   nop
/* 095444 00195344 28260072 */  paddub      $4, $16, $0
/* 095448 00195348 282E4070 */  paddub      $5, $2, $0
/* 09544C 0019534C F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 095450 00195350 00000000 */   nop
/* 095454 00195354 01000224 */  addiu       $2, $0, 0x1
/* 095458 00195358 1000BF7B */  lq          $31, 0x10($29)
/* 09545C 0019535C 0000B07B */  lq          $16, 0x0($29)
/* 095460 00195360 2000BD27 */  addiu       $29, $29, 0x20
/* 095464 00195364 0800E003 */  jr          $31
/* 095468 00195368 00000000 */   nop
/* 09546C 0019536C 00000000 */  nop
