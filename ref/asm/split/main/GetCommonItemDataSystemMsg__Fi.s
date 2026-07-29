.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetCommonItemDataSystemMsg__Fi
/* 0D1100 001D1000 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0D1104 001D1004 0000BF7F */  sq          $31, 0x0($29)
/* 0D1108 001D1008 F043070C */  jal         GetCommonItemDataMsg__Fi
/* 0D110C 001D100C 00000000 */   nop
/* 0D1110 001D1010 64004224 */  addiu       $2, $2, 0x64
/* 0D1114 001D1014 0000BF7B */  lq          $31, 0x0($29)
/* 0D1118 001D1018 1000BD27 */  addiu       $29, $29, 0x10
/* 0D111C 001D101C 0800E003 */  jr          $31
/* 0D1120 001D1020 00000000 */   nop
/* 0D1124 001D1024 00000000 */  nop
/* 0D1128 001D1028 00000000 */  nop
/* 0D112C 001D102C 00000000 */  nop
