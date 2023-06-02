.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _INIT_SYS_MES__FP12RS_STACKDATAi
/* 90490 00190390 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 90494 00190394 0000BF7F */  sq         $31, 0x0($sp)
/* 90498 00190398 3480050C */  jal        ClearSystemMes__Fv
/* 9049C 0019039C 00000000 */   nop
/* 904A0 001903A0 01000224 */  addiu      $2, $0, 0x1
/* 904A4 001903A4 0000BF7B */  lq         $31, 0x0($sp)
/* 904A8 001903A8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 904AC 001903AC 0800E003 */  jr         $31
/* 904B0 001903B0 00000000 */   nop
/* 904B4 001903B4 00000000 */  nop
/* 904B8 001903B8 00000000 */  nop
/* 904BC 001903BC 00000000 */  nop
