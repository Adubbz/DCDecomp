.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_OUT_BGM_NO__FP12RS_STACKDATAi
/* 095F30 00195E30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 095F34 00195E34 0000BF7F */  sq          $31, 0x0($29)
/* 095F38 00195E38 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 095F3C 00195E3C 00000000 */   nop
/* 095F40 00195E40 409082AF */  sw          $2, -0x6FC0($28)
/* 095F44 00195E44 01000224 */  addiu       $2, $0, 0x1
/* 095F48 00195E48 0000BF7B */  lq          $31, 0x0($29)
/* 095F4C 00195E4C 1000BD27 */  addiu       $29, $29, 0x10
/* 095F50 00195E50 0800E003 */  jr          $31
/* 095F54 00195E54 00000000 */   nop
/* 095F58 00195E58 00000000 */  nop
/* 095F5C 00195E5C 00000000 */  nop
