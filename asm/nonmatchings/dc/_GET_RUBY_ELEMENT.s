.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_RUBY_ELEMENT__FP12RS_STACKDATAi
/* BD110 001BD010 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD114 001BD014 0000BF7F */  sq         $31, 0x0($sp)
/* BD118 001BD018 809C858F */  lw         $5, -0x6380($gp)
/* BD11C 001BD01C 70EE060C */  jal        SetStack__FP12RS_STACKDATAi_2
/* BD120 001BD020 00000000 */   nop
/* BD124 001BD024 01000224 */  addiu      $2, $0, 0x1
/* BD128 001BD028 0000BF7B */  lq         $31, 0x0($sp)
/* BD12C 001BD02C 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD130 001BD030 0800E003 */  jr         $31
/* BD134 001BD034 00000000 */   nop
/* BD138 001BD038 00000000 */  nop
/* BD13C 001BD03C 00000000 */  nop
