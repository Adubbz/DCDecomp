.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPackFile__FPcPi
/* 03F7F0 0013F6F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 03F7F4 0013F6F4 0000BF7F */  sq          $31, 0x0($29)
/* 03F7F8 0013F6F8 28168070 */  paddub      $2, $4, $0
/* 03F7FC 0013F6FC 2836A070 */  paddub      $6, $5, $0
/* 03F800 0013F700 F88C848F */  lw          $4, -0x7308($28)
/* 03F804 0013F704 282E4070 */  paddub      $5, $2, $0
/* 03F808 0013F708 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 03F80C 0013F70C 00000000 */   nop
/* 03F810 0013F710 0000BF7B */  lq          $31, 0x0($29)
/* 03F814 0013F714 1000BD27 */  addiu       $29, $29, 0x10
/* 03F818 0013F718 0800E003 */  jr          $31
/* 03F81C 0013F71C 00000000 */   nop
