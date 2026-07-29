.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdGetUseItem__Fv
/* 072D80 00172C80 F0FFBD27 */  addiu       $29, $29, -0x10
/* 072D84 00172C84 0000BF7F */  sq          $31, 0x0($29)
/* 072D88 00172C88 708F848F */  lw          $4, -0x7090($28)
/* 072D8C 00172C8C ECCA050C */  jal         InvertItemNo__Fi
/* 072D90 00172C90 00000000 */   nop
/* 072D94 00172C94 0000BF7B */  lq          $31, 0x0($29)
/* 072D98 00172C98 1000BD27 */  addiu       $29, $29, 0x10
/* 072D9C 00172C9C 0800E003 */  jr          $31
/* 072DA0 00172CA0 00000000 */   nop
/* 072DA4 00172CA4 00000000 */  nop
/* 072DA8 00172CA8 00000000 */  nop
/* 072DAC 00172CAC 00000000 */  nop
