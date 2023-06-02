.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SKILL_GET_MES__FP12RS_STACKDATAi
/* 904C0 001903C0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 904C4 001903C4 0000BF7F */  sq         $31, 0x0($sp)
/* 904C8 001903C8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 904CC 001903CC 00000000 */   nop
/* 904D0 001903D0 28264070 */  paddub     $4, $2, $0
/* 904D4 001903D4 28000524 */  addiu      $5, $0, 0x28
/* 904D8 001903D8 1081050C */  jal        TecGetMes__Fii
/* 904DC 001903DC 00000000 */   nop
/* 904E0 001903E0 01000224 */  addiu      $2, $0, 0x1
/* 904E4 001903E4 0000BF7B */  lq         $31, 0x0($sp)
/* 904E8 001903E8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 904EC 001903EC 0800E003 */  jr         $31
/* 904F0 001903F0 00000000 */   nop
/* 904F4 001903F4 00000000 */  nop
/* 904F8 001903F8 00000000 */  nop
/* 904FC 001903FC 00000000 */  nop
