.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SADD_TIME__FP12RS_STACKDATAi
/* 95C20 00195B20 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 95C24 00195B24 0000BF7F */  sq         $31, 0x0($sp)
/* 95C28 00195B28 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 95C2C 00195B2C 00000000 */   nop
/* 95C30 00195B30 1C8D848F */  lw         $4, -0x72E4($gp)
/* 95C34 00195B34 06030046 */  mov.s      $f12, $f0
/* 95C38 00195B38 F85E050C */  jal        AddNowTime__9CSaveDataFf
/* 95C3C 00195B3C 00000000 */   nop
/* 95C40 00195B40 01000224 */  addiu      $2, $0, 0x1
/* 95C44 00195B44 0000BF7B */  lq         $31, 0x0($sp)
/* 95C48 00195B48 1000BD27 */  addiu      $sp, $sp, 0x10
/* 95C4C 00195B4C 0800E003 */  jr         $31
/* 95C50 00195B50 00000000 */   nop
/* 95C54 00195B54 00000000 */  nop
/* 95C58 00195B58 00000000 */  nop
/* 95C5C 00195B5C 00000000 */  nop
