.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _OBJ_DRAW__FP12RS_STACKDATAi
/* 90EF0 00190DF0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 90EF4 00190DF4 4000BF7F */  sq         $31, 0x40($sp)
/* 90EF8 00190DF8 3000B37F */  sq         $19, 0x30($sp)
/* 90EFC 00190DFC 2000B27F */  sq         $18, 0x20($sp)
/* 90F00 00190E00 1000B17F */  sq         $17, 0x10($sp)
/* 90F04 00190E04 0000B07F */  sq         $16, 0x0($sp)
/* 90F08 00190E08 2896A070 */  paddub     $18, $5, $0
/* 90F0C 00190E0C 08009324 */  addiu      $19, $4, 0x8
/* 90F10 00190E10 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 90F14 00190E14 00000000 */   nop
/* 90F18 00190E18 28864070 */  paddub     $16, $2, $0
/* 90F1C 00190E1C 288E0070 */  paddub     $17, $0, $0
/* 90F20 00190E20 0F000010 */  b          .L00190E60
/* 90F24 00190E24 00000000 */   nop
.L00190E28:
/* 90F28 00190E28 28266072 */  paddub     $4, $19, $0
/* 90F2C 00190E2C 08009324 */  addiu      $19, $4, 0x8
/* 90F30 00190E30 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 90F34 00190E34 00000000 */   nop
/* 90F38 00190E38 28264070 */  paddub     $4, $2, $0
/* 90F3C 00190E3C 0C29060C */  jal        GetObjHandle__Fi
/* 90F40 00190E40 00000000 */   nop
/* 90F44 00190E44 28264070 */  paddub     $4, $2, $0
/* 90F48 00190E48 04008010 */  beqz       $4, .L00190E5C
/* 90F4C 00190E4C 00000000 */   nop
/* 90F50 00190E50 282E0072 */  paddub     $5, $16, $0
/* 90F54 00190E54 FC29060C */  jal        obj_draw__FP10OBJ_HANDLEi
/* 90F58 00190E58 00000000 */   nop
.L00190E5C:
/* 90F5C 00190E5C 01003126 */  addiu      $17, $17, 0x1
.L00190E60:
/* 90F60 00190E60 FFFF4226 */  addiu      $2, $18, -0x1
/* 90F64 00190E64 2A102202 */  slt        $2, $17, $2
/* 90F68 00190E68 EFFF4014 */  bnez       $2, .L00190E28
/* 90F6C 00190E6C 00000000 */   nop
/* 90F70 00190E70 01000224 */  addiu      $2, $0, 0x1
/* 90F74 00190E74 4000BF7B */  lq         $31, 0x40($sp)
/* 90F78 00190E78 3000B37B */  lq         $19, 0x30($sp)
/* 90F7C 00190E7C 2000B27B */  lq         $18, 0x20($sp)
/* 90F80 00190E80 1000B17B */  lq         $17, 0x10($sp)
/* 90F84 00190E84 0000B07B */  lq         $16, 0x0($sp)
/* 90F88 00190E88 5000BD27 */  addiu      $sp, $sp, 0x50
/* 90F8C 00190E8C 0800E003 */  jr         $31
/* 90F90 00190E90 00000000 */   nop
/* 90F94 00190E94 00000000 */  nop
/* 90F98 00190E98 00000000 */  nop
/* 90F9C 00190E9C 00000000 */  nop
