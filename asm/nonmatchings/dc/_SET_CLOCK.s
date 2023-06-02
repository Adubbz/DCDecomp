.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_CLOCK__FP12RS_STACKDATAi
/* 90740 00190640 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 90744 00190644 0000BF7F */  sq         $31, 0x0($sp)
/* 90748 00190648 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 9074C 0019064C 00000000 */   nop
/* 90750 00190650 06030046 */  mov.s      $f12, $f0
/* 90754 00190654 5CE0050C */  jal        EdSetClock__Ff
/* 90758 00190658 00000000 */   nop
/* 9075C 0019065C 01000224 */  addiu      $2, $0, 0x1
/* 90760 00190660 0000BF7B */  lq         $31, 0x0($sp)
/* 90764 00190664 1000BD27 */  addiu      $sp, $sp, 0x10
/* 90768 00190668 0800E003 */  jr         $31
/* 9076C 0019066C 00000000 */   nop
