.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CHECK_PLACE__FP12RS_STACKDATAi
/* 0908D0 001907D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0908D4 001907D4 0000BF7F */  sq          $31, 0x0($29)
/* 0908D8 001907D8 2C90858F */  lw          $5, -0x6FD4($28)
/* 0908DC 001907DC F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 0908E0 001907E0 00000000 */   nop
/* 0908E4 001907E4 01000224 */  addiu       $2, $0, 0x1
/* 0908E8 001907E8 0000BF7B */  lq          $31, 0x0($29)
/* 0908EC 001907EC 1000BD27 */  addiu       $29, $29, 0x10
/* 0908F0 001907F0 0800E003 */  jr          $31
/* 0908F4 001907F4 00000000 */   nop
/* 0908F8 001907F8 00000000 */  nop
/* 0908FC 001907FC 00000000 */  nop
