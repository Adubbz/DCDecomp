.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _PLAY_AMB_BGM__FP12RS_STACKDATAi
/* 96100 00196000 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 96104 00196004 0000BF7F */  sq         $31, 0x0($sp)
/* 96108 00196008 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9610C 0019600C 00000000 */   nop
/* 96110 00196010 28264070 */  paddub     $4, $2, $0
/* 96114 00196014 446C050C */  jal        SndAmbientPlay__Fi
/* 96118 00196018 00000000 */   nop
/* 9611C 0019601C 01000224 */  addiu      $2, $0, 0x1
/* 96120 00196020 0000BF7B */  lq         $31, 0x0($sp)
/* 96124 00196024 1000BD27 */  addiu      $sp, $sp, 0x10
/* 96128 00196028 0800E003 */  jr         $31
/* 9612C 0019602C 00000000 */   nop
