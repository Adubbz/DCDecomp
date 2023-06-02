.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _EB_INIT__FP12RS_STACKDATAi
/* 96700 00196600 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 96704 00196604 0000BF7F */  sq         $31, 0x0($sp)
/* 96708 00196608 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 9670C 0019660C 00000000 */   nop
/* 96710 00196610 06030046 */  mov.s      $f12, $f0
/* 96714 00196614 44A0050C */  jal        EBInit__Ff
/* 96718 00196618 00000000 */   nop
/* 9671C 0019661C 01000224 */  addiu      $2, $0, 0x1
/* 96720 00196620 0000BF7B */  lq         $31, 0x0($sp)
/* 96724 00196624 1000BD27 */  addiu      $sp, $sp, 0x10
/* 96728 00196628 0800E003 */  jr         $31
/* 9672C 0019662C 00000000 */   nop
