.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SSET_TIME__FP12RS_STACKDATAi
/* 95B90 00195A90 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 95B94 00195A94 0000BF7F */  sq         $31, 0x0($sp)
/* 95B98 00195A98 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 95B9C 00195A9C 00000000 */   nop
/* 95BA0 00195AA0 1C8D848F */  lw         $4, -0x72E4($gp)
/* 95BA4 00195AA4 06030046 */  mov.s      $f12, $f0
/* 95BA8 00195AA8 F05E050C */  jal        SetNowTime__9CSaveDataFf
/* 95BAC 00195AAC 00000000 */   nop
/* 95BB0 00195AB0 01000224 */  addiu      $2, $0, 0x1
/* 95BB4 00195AB4 0000BF7B */  lq         $31, 0x0($sp)
/* 95BB8 00195AB8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 95BBC 00195ABC 0800E003 */  jr         $31
/* 95BC0 00195AC0 00000000 */   nop
/* 95BC4 00195AC4 00000000 */  nop
/* 95BC8 00195AC8 00000000 */  nop
/* 95BCC 00195ACC 00000000 */  nop
