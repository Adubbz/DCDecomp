.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_CLOCK__FP12RS_STACKDATAi
/* 090740 00190640 F0FFBD27 */  addiu       $29, $29, -0x10
/* 090744 00190644 0000BF7F */  sq          $31, 0x0($29)
/* 090748 00190648 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 09074C 0019064C 00000000 */   nop
/* 090750 00190650 06030046 */  mov.s       $f12, $f0
/* 090754 00190654 5CE0050C */  jal         EdSetClock__Ff
/* 090758 00190658 00000000 */   nop
/* 09075C 0019065C 01000224 */  addiu       $2, $0, 0x1
/* 090760 00190660 0000BF7B */  lq          $31, 0x0($29)
/* 090764 00190664 1000BD27 */  addiu       $29, $29, 0x10
/* 090768 00190668 0800E003 */  jr          $31
/* 09076C 0019066C 00000000 */   nop
