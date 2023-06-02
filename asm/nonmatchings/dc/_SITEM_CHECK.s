.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SITEM_CHECK__FP12RS_STACKDATAi
/* 953D0 001952D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 953D4 001952D4 1000BF7F */  sq         $31, 0x10($sp)
/* 953D8 001952D8 0000B07F */  sq         $16, 0x0($sp)
/* 953DC 001952DC 08009024 */  addiu      $16, $4, 0x8
/* 953E0 001952E0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 953E4 001952E4 00000000 */   nop
/* 953E8 001952E8 28264070 */  paddub     $4, $2, $0
/* 953EC 001952EC 9CCC050C */  jal        EdCheckItem__Fi
/* 953F0 001952F0 00000000 */   nop
/* 953F4 001952F4 28260072 */  paddub     $4, $16, $0
/* 953F8 001952F8 282E4070 */  paddub     $5, $2, $0
/* 953FC 001952FC F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 95400 00195300 00000000 */   nop
/* 95404 00195304 01000224 */  addiu      $2, $0, 0x1
/* 95408 00195308 1000BF7B */  lq         $31, 0x10($sp)
/* 9540C 0019530C 0000B07B */  lq         $16, 0x0($sp)
/* 95410 00195310 2000BD27 */  addiu      $sp, $sp, 0x20
/* 95414 00195314 0800E003 */  jr         $31
/* 95418 00195318 00000000 */   nop
/* 9541C 0019531C 00000000 */  nop
