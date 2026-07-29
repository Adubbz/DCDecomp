.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _EB_INIT__FP12RS_STACKDATAi
/* 096700 00196600 F0FFBD27 */  addiu       $29, $29, -0x10
/* 096704 00196604 0000BF7F */  sq          $31, 0x0($29)
/* 096708 00196608 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 09670C 0019660C 00000000 */   nop
/* 096710 00196610 06030046 */  mov.s       $f12, $f0
/* 096714 00196614 44A0050C */  jal         EBInit__Ff
/* 096718 00196618 00000000 */   nop
/* 09671C 0019661C 01000224 */  addiu       $2, $0, 0x1
/* 096720 00196620 0000BF7B */  lq          $31, 0x0($29)
/* 096724 00196624 1000BD27 */  addiu       $29, $29, 0x10
/* 096728 00196628 0800E003 */  jr          $31
/* 09672C 0019662C 00000000 */   nop
