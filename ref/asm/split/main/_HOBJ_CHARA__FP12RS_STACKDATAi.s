.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _HOBJ_CHARA__FP12RS_STACKDATAi
/* 090CA0 00190BA0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 090CA4 00190BA4 2000BF7F */  sq          $31, 0x20($29)
/* 090CA8 00190BA8 1000B17F */  sq          $17, 0x10($29)
/* 090CAC 00190BAC 0000B07F */  sq          $16, 0x0($29)
/* 090CB0 00190BB0 08009124 */  addiu       $17, $4, 0x8
/* 090CB4 00190BB4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 090CB8 00190BB8 00000000 */   nop
/* 090CBC 00190BBC 28864070 */  paddub      $16, $2, $0
/* 090CC0 00190BC0 28262072 */  paddub      $4, $17, $0
/* 090CC4 00190BC4 08009124 */  addiu       $17, $4, 0x8
/* 090CC8 00190BC8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 090CCC 00190BCC 00000000 */   nop
/* 090CD0 00190BD0 28264070 */  paddub      $4, $2, $0
/* 090CD4 00190BD4 842C060C */  jal         GetChara__Fi
/* 090CD8 00190BD8 00000000 */   nop
/* 090CDC 00190BDC 282E4070 */  paddub      $5, $2, $0
/* 090CE0 00190BE0 0400A014 */  bnez        $5, .L00190BF4
/* 090CE4 00190BE4 00000000 */   nop
/* 090CE8 00190BE8 28160070 */  paddub      $2, $0, $0
/* 090CEC 00190BEC 0B000010 */  b           .L00190C1C
/* 090CF0 00190BF0 00000000 */   nop
.L00190BF4:
/* 090CF4 00190BF4 28262072 */  paddub      $4, $17, $0
/* 090CF8 00190BF8 F428060C */  jal         GetStackString__FP12RS_STACKDATA
/* 090CFC 00190BFC 00000000 */   nop
/* 090D00 00190C00 28260072 */  paddub      $4, $16, $0
/* 090D04 00190C04 28364070 */  paddub      $6, $2, $0
/* 090D08 00190C08 9029060C */  jal         SetObjHandle__FiP10CCharacterPc
/* 090D0C 00190C0C 00000000 */   nop
/* 090D10 00190C10 01000324 */  addiu       $3, $0, 0x1
/* 090D14 00190C14 0A180200 */  movz        $3, $0, $2
/* 090D18 00190C18 28166070 */  paddub      $2, $3, $0
.L00190C1C:
/* 090D1C 00190C1C 2000BF7B */  lq          $31, 0x20($29)
/* 090D20 00190C20 1000B17B */  lq          $17, 0x10($29)
/* 090D24 00190C24 0000B07B */  lq          $16, 0x0($29)
/* 090D28 00190C28 3000BD27 */  addiu       $29, $29, 0x30
/* 090D2C 00190C2C 0800E003 */  jr          $31
/* 090D30 00190C30 00000000 */   nop
/* 090D34 00190C34 00000000 */  nop
/* 090D38 00190C38 00000000 */  nop
/* 090D3C 00190C3C 00000000 */  nop
