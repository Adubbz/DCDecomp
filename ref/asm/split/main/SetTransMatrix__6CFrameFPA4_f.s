.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetTransMatrix__6CFrameFPA4_f
/* 028660 00128560 E0FFBD27 */  addiu       $29, $29, -0x20
/* 028664 00128564 1000BF7F */  sq          $31, 0x10($29)
/* 028668 00128568 0000B07F */  sq          $16, 0x0($29)
/* 02866C 0012856C 28868070 */  paddub      $16, $4, $0
/* 028670 00128570 D0010426 */  addiu       $4, $16, 0x1D0
/* 028674 00128574 1086040C */  jal         sceVu0CopyMatrix
/* 028678 00128578 00000000 */   nop
/* 02867C 0012857C 400200AE */  sw          $0, 0x240($16)
/* 028680 00128580 1000BF7B */  lq          $31, 0x10($29)
/* 028684 00128584 0000B07B */  lq          $16, 0x0($29)
/* 028688 00128588 2000BD27 */  addiu       $29, $29, 0x20
/* 02868C 0012858C 0800E003 */  jr          $31
/* 028690 00128590 00000000 */   nop
/* 028694 00128594 00000000 */  nop
/* 028698 00128598 00000000 */  nop
/* 02869C 0012859C 00000000 */  nop
