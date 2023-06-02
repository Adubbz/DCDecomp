.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _MES_CLOSE__FP12RS_STACKDATAi
/* 8FC60 0018FB60 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8FC64 0018FB64 0000BF7F */  sq         $31, 0x0($sp)
/* 8FC68 0018FB68 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8FC6C 0018FB6C 00000000 */   nop
/* 8FC70 0018FB70 28264070 */  paddub     $4, $2, $0
/* 8FC74 0018FB74 643E060C */  jal        GetMes__Fi
/* 8FC78 0018FB78 00000000 */   nop
/* 8FC7C 0018FB7C 04004014 */  bnez       $2, .L0018FB90
/* 8FC80 0018FB80 00000000 */   nop
/* 8FC84 0018FB84 28160070 */  paddub     $2, $0, $0
/* 8FC88 0018FB88 07000010 */  b          .L0018FBA8
/* 8FC8C 0018FB8C 00000000 */   nop
.L0018FB90:
/* 8FC90 0018FB90 A80040C4 */  lwc1       $f0, 0xA8($2)
/* 8FC94 0018FB94 A40040E4 */  swc1       $f0, 0xA4($2)
/* 8FC98 0018FB98 FFFF0324 */  addiu      $3, $0, -0x1
/* 8FC9C 0018FB9C BC1643AC */  sw         $3, 0x16BC($2)
/* 8FCA0 0018FBA0 940040AC */  sw         $0, 0x94($2)
/* 8FCA4 0018FBA4 01000224 */  addiu      $2, $0, 0x1
.L0018FBA8:
/* 8FCA8 0018FBA8 0000BF7B */  lq         $31, 0x0($sp)
/* 8FCAC 0018FBAC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8FCB0 0018FBB0 0800E003 */  jr         $31
/* 8FCB4 0018FBB4 00000000 */   nop
/* 8FCB8 0018FBB8 00000000 */  nop
/* 8FCBC 0018FBBC 00000000 */  nop
