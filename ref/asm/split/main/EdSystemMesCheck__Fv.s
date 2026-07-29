.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdSystemMesCheck__Fv
/* 073740 00173640 F0FFBD27 */  addiu       $29, $29, -0x10
/* 073744 00173644 0000BF7F */  sq          $31, 0x0($29)
/* 073748 00173648 4480050C */  jal         SystemMesCheck__Fv
/* 07374C 0017364C 00000000 */   nop
/* 073750 00173650 0000BF7B */  lq          $31, 0x0($29)
/* 073754 00173654 1000BD27 */  addiu       $29, $29, 0x10
/* 073758 00173658 0800E003 */  jr          $31
/* 07375C 0017365C 00000000 */   nop
