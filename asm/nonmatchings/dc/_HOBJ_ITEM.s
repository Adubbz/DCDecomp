.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _HOBJ_ITEM__FP12RS_STACKDATAi
/* 90E70 00190D70 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 90E74 00190D74 2000BF7F */  sq         $31, 0x20($sp)
/* 90E78 00190D78 1000B17F */  sq         $17, 0x10($sp)
/* 90E7C 00190D7C 0000B07F */  sq         $16, 0x0($sp)
/* 90E80 00190D80 08009124 */  addiu      $17, $4, 0x8
/* 90E84 00190D84 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 90E88 00190D88 00000000 */   nop
/* 90E8C 00190D8C 28864070 */  paddub     $16, $2, $0
/* 90E90 00190D90 28262072 */  paddub     $4, $17, $0
/* 90E94 00190D94 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 90E98 00190D98 00000000 */   nop
/* 90E9C 00190D9C 28264070 */  paddub     $4, $2, $0
/* 90EA0 00190DA0 A02C060C */  jal        GetItemFrame__Fi
/* 90EA4 00190DA4 00000000 */   nop
/* 90EA8 00190DA8 04004014 */  bnez       $2, .L00190DBC
/* 90EAC 00190DAC 00000000 */   nop
/* 90EB0 00190DB0 28160070 */  paddub     $2, $0, $0
/* 90EB4 00190DB4 08000010 */  b          .L00190DD8
/* 90EB8 00190DB8 00000000 */   nop
.L00190DBC:
/* 90EBC 00190DBC 28260072 */  paddub     $4, $16, $0
/* 90EC0 00190DC0 282E4070 */  paddub     $5, $2, $0
/* 90EC4 00190DC4 E029060C */  jal        SetObjHandle__FiP6CFrame
/* 90EC8 00190DC8 00000000 */   nop
/* 90ECC 00190DCC 01000324 */  addiu      $3, $0, 0x1
/* 90ED0 00190DD0 0A180200 */  movz       $3, $0, $2
/* 90ED4 00190DD4 28166070 */  paddub     $2, $3, $0
.L00190DD8:
/* 90ED8 00190DD8 2000BF7B */  lq         $31, 0x20($sp)
/* 90EDC 00190DDC 1000B17B */  lq         $17, 0x10($sp)
/* 90EE0 00190DE0 0000B07B */  lq         $16, 0x0($sp)
/* 90EE4 00190DE4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 90EE8 00190DE8 0800E003 */  jr         $31
/* 90EEC 00190DEC 00000000 */   nop
