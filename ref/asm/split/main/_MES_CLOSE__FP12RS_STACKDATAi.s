.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _MES_CLOSE__FP12RS_STACKDATAi
/* 08FC60 0018FB60 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08FC64 0018FB64 0000BF7F */  sq          $31, 0x0($29)
/* 08FC68 0018FB68 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FC6C 0018FB6C 00000000 */   nop
/* 08FC70 0018FB70 28264070 */  paddub      $4, $2, $0
/* 08FC74 0018FB74 643E060C */  jal         GetMes__Fi
/* 08FC78 0018FB78 00000000 */   nop
/* 08FC7C 0018FB7C 04004014 */  bnez        $2, .L0018FB90
/* 08FC80 0018FB80 00000000 */   nop
/* 08FC84 0018FB84 28160070 */  paddub      $2, $0, $0
/* 08FC88 0018FB88 07000010 */  b           .L0018FBA8
/* 08FC8C 0018FB8C 00000000 */   nop
.L0018FB90:
/* 08FC90 0018FB90 A80040C4 */  lwc1        $f0, 0xA8($2)
/* 08FC94 0018FB94 A40040E4 */  swc1        $f0, 0xA4($2)
/* 08FC98 0018FB98 FFFF0324 */  addiu       $3, $0, -0x1
/* 08FC9C 0018FB9C BC1643AC */  sw          $3, 0x16BC($2)
/* 08FCA0 0018FBA0 940040AC */  sw          $0, 0x94($2)
/* 08FCA4 0018FBA4 01000224 */  addiu       $2, $0, 0x1
.L0018FBA8:
/* 08FCA8 0018FBA8 0000BF7B */  lq          $31, 0x0($29)
/* 08FCAC 0018FBAC 1000BD27 */  addiu       $29, $29, 0x10
/* 08FCB0 0018FBB0 0800E003 */  jr          $31
/* 08FCB4 0018FBB4 00000000 */   nop
/* 08FCB8 0018FBB8 00000000 */  nop
/* 08FCBC 0018FBBC 00000000 */  nop
