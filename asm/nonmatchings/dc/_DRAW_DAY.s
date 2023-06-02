.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DRAW_DAY__FP12RS_STACKDATAi
/* 94070 00193F70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 94074 00193F74 0000BF7F */  sq         $31, 0x0($sp)
/* 94078 00193F78 04F4050C */  jal        EdStartDrawDay__Fv
/* 9407C 00193F7C 00000000 */   nop
/* 94080 00193F80 01000224 */  addiu      $2, $0, 0x1
/* 94084 00193F84 0000BF7B */  lq         $31, 0x0($sp)
/* 94088 00193F88 1000BD27 */  addiu      $sp, $sp, 0x10
/* 9408C 00193F8C 0800E003 */  jr         $31
/* 94090 00193F90 00000000 */   nop
/* 94094 00193F94 00000000 */  nop
/* 94098 00193F98 00000000 */  nop
/* 9409C 00193F9C 00000000 */  nop
