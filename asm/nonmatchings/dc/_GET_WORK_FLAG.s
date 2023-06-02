.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_WORK_FLAG__FP12RS_STACKDATAi
/* 95380 00195280 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 95384 00195284 1000BF7F */  sq         $31, 0x10($sp)
/* 95388 00195288 0000B07F */  sq         $16, 0x0($sp)
/* 9538C 0019528C 08009024 */  addiu      $16, $4, 0x8
/* 95390 00195290 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95394 00195294 00000000 */   nop
/* 95398 00195298 28264070 */  paddub     $4, $2, $0
/* 9539C 0019529C C428060C */  jal        GetWorkFlag__Fi
/* 953A0 001952A0 00000000 */   nop
/* 953A4 001952A4 282E4070 */  paddub     $5, $2, $0
/* 953A8 001952A8 28260072 */  paddub     $4, $16, $0
/* 953AC 001952AC F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 953B0 001952B0 00000000 */   nop
/* 953B4 001952B4 01000224 */  addiu      $2, $0, 0x1
/* 953B8 001952B8 1000BF7B */  lq         $31, 0x10($sp)
/* 953BC 001952BC 0000B07B */  lq         $16, 0x0($sp)
/* 953C0 001952C0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 953C4 001952C4 0800E003 */  jr         $31
/* 953C8 001952C8 00000000 */   nop
/* 953CC 001952CC 00000000 */  nop
