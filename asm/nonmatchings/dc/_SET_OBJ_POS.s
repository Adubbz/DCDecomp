.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_OBJ_POS__FP12RS_STACKDATAi
/* 90FA0 00190EA0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 90FA4 00190EA4 1000BF7F */  sq         $31, 0x10($sp)
/* 90FA8 00190EA8 0000B07F */  sq         $16, 0x0($sp)
/* 90FAC 00190EAC 08009024 */  addiu      $16, $4, 0x8
/* 90FB0 00190EB0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 90FB4 00190EB4 00000000 */   nop
/* 90FB8 00190EB8 28264070 */  paddub     $4, $2, $0
/* 90FBC 00190EBC 0C29060C */  jal        GetObjHandle__Fi
/* 90FC0 00190EC0 00000000 */   nop
/* 90FC4 00190EC4 281E4070 */  paddub     $3, $2, $0
/* 90FC8 00190EC8 04006014 */  bnez       $3, .L00190EDC
/* 90FCC 00190ECC 00000000 */   nop
/* 90FD0 00190ED0 28160070 */  paddub     $2, $0, $0
/* 90FD4 00190ED4 16000010 */  b          .L00190F30
/* 90FD8 00190ED8 00000000 */   nop
.L00190EDC:
/* 90FDC 00190EDC 28260072 */  paddub     $4, $16, $0
/* 90FE0 00190EE0 08009024 */  addiu      $16, $4, 0x8
/* 90FE4 00190EE4 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 90FE8 00190EE8 00000000 */   nop
/* 90FEC 00190EEC 2000A0E7 */  swc1       $f0, 0x20($sp)
/* 90FF0 00190EF0 28260072 */  paddub     $4, $16, $0
/* 90FF4 00190EF4 08009024 */  addiu      $16, $4, 0x8
/* 90FF8 00190EF8 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 90FFC 00190EFC 00000000 */   nop
/* 91000 00190F00 2400A0E7 */  swc1       $f0, 0x24($sp)
/* 91004 00190F04 28260072 */  paddub     $4, $16, $0
/* 91008 00190F08 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 9100C 00190F0C 00000000 */   nop
/* 91010 00190F10 2800A0E7 */  swc1       $f0, 0x28($sp)
/* 91014 00190F14 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 91018 00190F18 2C00A2AF */  sw         $2, 0x2C($sp)
/* 9101C 00190F1C 28266070 */  paddub     $4, $3, $0
/* 91020 00190F20 2000A527 */  addiu      $5, $sp, 0x20
/* 91024 00190F24 1C2A060C */  jal        set_obj_pos__FP10OBJ_HANDLEPf
/* 91028 00190F28 00000000 */   nop
/* 9102C 00190F2C 01000224 */  addiu      $2, $0, 0x1
.L00190F30:
/* 91030 00190F30 1000BF7B */  lq         $31, 0x10($sp)
/* 91034 00190F34 0000B07B */  lq         $16, 0x0($sp)
/* 91038 00190F38 3000BD27 */  addiu      $sp, $sp, 0x30
/* 9103C 00190F3C 0800E003 */  jr         $31
/* 91040 00190F40 00000000 */   nop
/* 91044 00190F44 00000000 */  nop
/* 91048 00190F48 00000000 */  nop
/* 9104C 00190F4C 00000000 */  nop
