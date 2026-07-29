.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetEditAtraChipData__Fii
/* 058F80 00158E80 F0FFBD27 */  addiu       $29, $29, -0x10
/* 058F84 00158E84 0000BF7F */  sq          $31, 0x0($29)
/* 058F88 00158E88 2800A524 */  addiu       $5, $5, 0x28
/* 058F8C 00158E8C 6063050C */  jal         GetEditAtraData__Fii
/* 058F90 00158E90 00000000 */   nop
/* 058F94 00158E94 0000BF7B */  lq          $31, 0x0($29)
/* 058F98 00158E98 1000BD27 */  addiu       $29, $29, 0x10
/* 058F9C 00158E9C 0800E003 */  jr          $31
/* 058FA0 00158EA0 00000000 */   nop
/* 058FA4 00158EA4 00000000 */  nop
/* 058FA8 00158EA8 00000000 */  nop
/* 058FAC 00158EAC 00000000 */  nop
