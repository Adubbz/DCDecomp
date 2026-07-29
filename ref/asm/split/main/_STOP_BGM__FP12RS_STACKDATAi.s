.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _STOP_BGM__FP12RS_STACKDATAi
/* 095E20 00195D20 F0FFBD27 */  addiu       $29, $29, -0x10
/* 095E24 00195D24 0000BF7F */  sq          $31, 0x0($29)
/* 095E28 00195D28 E866050C */  jal         SndBgmStop__Fv
/* 095E2C 00195D2C 00000000 */   nop
/* 095E30 00195D30 01000224 */  addiu       $2, $0, 0x1
/* 095E34 00195D34 0000BF7B */  lq          $31, 0x0($29)
/* 095E38 00195D38 1000BD27 */  addiu       $29, $29, 0x10
/* 095E3C 00195D3C 0800E003 */  jr          $31
/* 095E40 00195D40 00000000 */   nop
/* 095E44 00195D44 00000000 */  nop
/* 095E48 00195D48 00000000 */  nop
/* 095E4C 00195D4C 00000000 */  nop
