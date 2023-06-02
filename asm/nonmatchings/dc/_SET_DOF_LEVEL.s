.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_DOF_LEVEL__FP12RS_STACKDATAi
/* 93AA0 001939A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 93AA4 001939A4 0000BF7F */  sq         $31, 0x0($sp)
/* 93AA8 001939A8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93AAC 001939AC 00000000 */   nop
/* 93AB0 001939B0 28264070 */  paddub     $4, $2, $0
/* 93AB4 001939B4 84C8050C */  jal        EdSetDOFLevel__Fi
/* 93AB8 001939B8 00000000 */   nop
/* 93ABC 001939BC 01000224 */  addiu      $2, $0, 0x1
/* 93AC0 001939C0 0000BF7B */  lq         $31, 0x0($sp)
/* 93AC4 001939C4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 93AC8 001939C8 0800E003 */  jr         $31
/* 93ACC 001939CC 00000000 */   nop
