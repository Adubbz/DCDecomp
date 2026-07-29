.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_OBJ_POS__FP12RS_STACKDATAi
/* 090FA0 00190EA0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 090FA4 00190EA4 1000BF7F */  sq          $31, 0x10($29)
/* 090FA8 00190EA8 0000B07F */  sq          $16, 0x0($29)
/* 090FAC 00190EAC 08009024 */  addiu       $16, $4, 0x8
/* 090FB0 00190EB0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 090FB4 00190EB4 00000000 */   nop
/* 090FB8 00190EB8 28264070 */  paddub      $4, $2, $0
/* 090FBC 00190EBC 0C29060C */  jal         GetObjHandle__Fi
/* 090FC0 00190EC0 00000000 */   nop
/* 090FC4 00190EC4 281E4070 */  paddub      $3, $2, $0
/* 090FC8 00190EC8 04006014 */  bnez        $3, .L00190EDC
/* 090FCC 00190ECC 00000000 */   nop
/* 090FD0 00190ED0 28160070 */  paddub      $2, $0, $0
/* 090FD4 00190ED4 16000010 */  b           .L00190F30
/* 090FD8 00190ED8 00000000 */   nop
.L00190EDC:
/* 090FDC 00190EDC 28260072 */  paddub      $4, $16, $0
/* 090FE0 00190EE0 08009024 */  addiu       $16, $4, 0x8
/* 090FE4 00190EE4 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 090FE8 00190EE8 00000000 */   nop
/* 090FEC 00190EEC 2000A0E7 */  swc1        $f0, 0x20($29)
/* 090FF0 00190EF0 28260072 */  paddub      $4, $16, $0
/* 090FF4 00190EF4 08009024 */  addiu       $16, $4, 0x8
/* 090FF8 00190EF8 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 090FFC 00190EFC 00000000 */   nop
/* 091000 00190F00 2400A0E7 */  swc1        $f0, 0x24($29)
/* 091004 00190F04 28260072 */  paddub      $4, $16, $0
/* 091008 00190F08 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 09100C 00190F0C 00000000 */   nop
/* 091010 00190F10 2800A0E7 */  swc1        $f0, 0x28($29)
/* 091014 00190F14 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 091018 00190F18 2C00A2AF */  sw          $2, 0x2C($29)
/* 09101C 00190F1C 28266070 */  paddub      $4, $3, $0
/* 091020 00190F20 2000A527 */  addiu       $5, $29, 0x20
/* 091024 00190F24 1C2A060C */  jal         set_obj_pos__FP10OBJ_HANDLEPf
/* 091028 00190F28 00000000 */   nop
/* 09102C 00190F2C 01000224 */  addiu       $2, $0, 0x1
.L00190F30:
/* 091030 00190F30 1000BF7B */  lq          $31, 0x10($29)
/* 091034 00190F34 0000B07B */  lq          $16, 0x0($29)
/* 091038 00190F38 3000BD27 */  addiu       $29, $29, 0x30
/* 09103C 00190F3C 0800E003 */  jr          $31
/* 091040 00190F40 00000000 */   nop
/* 091044 00190F44 00000000 */  nop
/* 091048 00190F48 00000000 */  nop
/* 09104C 00190F4C 00000000 */  nop
