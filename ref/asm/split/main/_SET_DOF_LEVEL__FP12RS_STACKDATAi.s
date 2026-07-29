.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_DOF_LEVEL__FP12RS_STACKDATAi
/* 093AA0 001939A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 093AA4 001939A4 0000BF7F */  sq          $31, 0x0($29)
/* 093AA8 001939A8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 093AAC 001939AC 00000000 */   nop
/* 093AB0 001939B0 28264070 */  paddub      $4, $2, $0
/* 093AB4 001939B4 84C8050C */  jal         EdSetDOFLevel__Fi
/* 093AB8 001939B8 00000000 */   nop
/* 093ABC 001939BC 01000224 */  addiu       $2, $0, 0x1
/* 093AC0 001939C0 0000BF7B */  lq          $31, 0x0($29)
/* 093AC4 001939C4 1000BD27 */  addiu       $29, $29, 0x10
/* 093AC8 001939C8 0800E003 */  jr          $31
/* 093ACC 001939CC 00000000 */   nop
