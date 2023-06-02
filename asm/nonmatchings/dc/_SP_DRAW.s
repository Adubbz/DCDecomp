.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SP_DRAW__FP12RS_STACKDATAi
/* 93FA0 00193EA0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 93FA4 00193EA4 4000BF7F */  sq         $31, 0x40($sp)
/* 93FA8 00193EA8 3000B37F */  sq         $19, 0x30($sp)
/* 93FAC 00193EAC 2000B27F */  sq         $18, 0x20($sp)
/* 93FB0 00193EB0 1000B17F */  sq         $17, 0x10($sp)
/* 93FB4 00193EB4 0000B07F */  sq         $16, 0x0($sp)
/* 93FB8 00193EB8 2896A070 */  paddub     $18, $5, $0
/* 93FBC 00193EBC 08009324 */  addiu      $19, $4, 0x8
/* 93FC0 00193EC0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93FC4 00193EC4 00000000 */   nop
/* 93FC8 00193EC8 28864070 */  paddub     $16, $2, $0
/* 93FCC 00193ECC 288E0070 */  paddub     $17, $0, $0
/* 93FD0 00193ED0 0C000010 */  b          .L00193F04
/* 93FD4 00193ED4 00000000 */   nop
.L00193ED8:
/* 93FD8 00193ED8 28266072 */  paddub     $4, $19, $0
/* 93FDC 00193EDC 08009324 */  addiu      $19, $4, 0x8
/* 93FE0 00193EE0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93FE4 00193EE4 00000000 */   nop
/* 93FE8 00193EE8 28264070 */  paddub     $4, $2, $0
/* 93FEC 00193EEC 5428060C */  jal        GetSprite__Fi
/* 93FF0 00193EF0 00000000 */   nop
/* 93FF4 00193EF4 02004010 */  beqz       $2, .L00193F00
/* 93FF8 00193EF8 00000000 */   nop
/* 93FFC 00193EFC 020050A4 */  sh         $16, 0x2($2)
.L00193F00:
/* 94000 00193F00 01003126 */  addiu      $17, $17, 0x1
.L00193F04:
/* 94004 00193F04 FFFF4226 */  addiu      $2, $18, -0x1
/* 94008 00193F08 2A102202 */  slt        $2, $17, $2
/* 9400C 00193F0C F2FF4014 */  bnez       $2, .L00193ED8
/* 94010 00193F10 00000000 */   nop
/* 94014 00193F14 01000224 */  addiu      $2, $0, 0x1
/* 94018 00193F18 4000BF7B */  lq         $31, 0x40($sp)
/* 9401C 00193F1C 3000B37B */  lq         $19, 0x30($sp)
/* 94020 00193F20 2000B27B */  lq         $18, 0x20($sp)
/* 94024 00193F24 1000B17B */  lq         $17, 0x10($sp)
/* 94028 00193F28 0000B07B */  lq         $16, 0x0($sp)
/* 9402C 00193F2C 5000BD27 */  addiu      $sp, $sp, 0x50
/* 94030 00193F30 0800E003 */  jr         $31
/* 94034 00193F34 00000000 */   nop
/* 94038 00193F38 00000000 */  nop
/* 9403C 00193F3C 00000000 */  nop
